@interface PGRecentAestheticsSuggester
+ (NSIndexSet)suggestionSubtypes;
+ (NSIndexSet)suggestionTypes;
- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4;
- (id)nextSuggestionWithProgress:(id)a3;
- (id)niceAssetsBetweenStartDate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5 progress:(id)a6;
- (id)reasonsForSuggestion:(id)a3;
- (id)suggestedAssetsInAssets:(id)a3;
- (id)suggestedAssetsInAssets:(id)a3 options:(id)a4;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (void)reset;
- (void)startSuggestingWithOptions:(id)a3;
@end

@implementation PGRecentAestheticsSuggester

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:303];
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

- (id)reasonsForSuggestion:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = [a3 keyAssets];
  v4 = [v3 firstObject];

  v5 = NSString;
  [v4 overallAestheticScore];
  v7 = objc_msgSend(v5, "stringWithFormat:", @"aesthetics = %.3f", v6);
  v8 = NSString;
  [v4 curationScore];
  v10 = objc_msgSend(v8, "stringWithFormat:", @"curation = %.3f", v9);
  v13[0] = v7;
  v13[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  return v11;
}

- (id)suggestedAssetsInAssets:(id)a3 options:(id)a4
{
  id v6 = a4;
  v7 = [(PGRecentAestheticsSuggester *)self suggestedAssetsInAssets:a3];
  unint64_t v8 = [v6 maximumNumberOfSuggestions];

  if (v8 < [v7 count])
  {
    uint64_t v9 = objc_msgSend(v7, "subarrayWithRange:", 0, v8);

    v7 = (void *)v9;
  }
  return v7;
}

- (id)suggestedAssetsInAssets:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v11, "clsPeopleCount", (void)v19)
          || [(PGAbstractSuggester *)self hasSuggestableScenesWithAsset:v11])
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v8);
  }

  v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"overallAestheticScore" ascending:0];
  v23[0] = v12;
  v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"curationScore" ascending:0];
  v23[1] = v13;
  v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v23[2] = v14;
  v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v23[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

  v17 = [v5 sortedArrayUsingDescriptors:v16];

  return v17;
}

- (id)niceAssetsBetweenStartDate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5 progress:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
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
LABEL_44:

      goto LABEL_45;
    }
    v45 = v17;
    long long v19 = [v17 loggingConnection];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v53 = v10;
      *(_WORD *)&v53[8] = 2112;
      *(void *)&v53[10] = v11;
      _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: Computing eligible nice assets between %@ and %@", buf, 0x16u);
    }
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"overallAestheticScore >= %f", 0x3FE4CCCCCCCCCCCDLL);
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"curationScore > %f", *MEMORY[0x1E4F8E740]);
    uint64_t v22 = [(id)objc_opt_class() noVideoPredicate];
    v46 = [(id)objc_opt_class() internalPredicateForProcessedAssetsWithMinimumSceneAnalysisVersion:1];
    v47 = (void *)v22;
    v48 = (void *)v21;
    v42 = (void *)v20;
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v20, v21, v22, v46, 0);
    if (v10)
    {
      v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated >= %@", v10];
      [v23 addObject:v24];
    }
    if (v11)
    {
      uint64_t v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated <= %@", v11];
      [v23 addObject:v25];
    }
    v18 = v45;
    if (v12)
    {
      v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid == %@", v12];
      [v23 addObject:v26];
    }
    id v43 = v12;
    v44 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v23];
    v27 = -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:");
    v28 = +[PGCurationManager assetPropertySetsForCuration];
    [v27 setFetchPropertySets:v28];

    v49 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v27];
    if (v13)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v14 >= 0.01)
      {
        char v51 = 0;
        v13[2](v13, &v51, 0.4);
        if (v51)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v53 = 222;
            *(_WORD *)&v53[4] = 2080;
            *(void *)&v53[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v16 = (id)MEMORY[0x1E4F1CBF0];
          v30 = v42;
          goto LABEL_43;
        }
        double v14 = Current;
      }
    }
    id v41 = v10;
    uint64_t v31 = [MEMORY[0x1E4F38EB8] clsPrefetchOptionsForKeyAsset];
    v32 = (void *)MEMORY[0x1E4F38EB8];
    v33 = [v45 curationContext];
    v34 = [v32 clsAllAssetsFromFetchResult:v49 prefetchOptions:v31 curationContext:v33];

    if (v13)
    {
      double v35 = CFAbsoluteTimeGetCurrent();
      if (v35 - v14 >= 0.01)
      {
        char v51 = 0;
        v13[2](v13, &v51, 0.8);
        if (v51)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v53 = 227;
            *(_WORD *)&v53[4] = 2080;
            *(void *)&v53[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v16 = (id)MEMORY[0x1E4F1CBF0];
          id v12 = v43;
LABEL_42:
          v30 = v42;

          id v10 = v41;
LABEL_43:

          goto LABEL_44;
        }
        double v14 = v35;
      }
    }
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __96__PGRecentAestheticsSuggester_niceAssetsBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke;
    v50[3] = &unk_1E68EC880;
    v50[4] = self;
    v36 = [MEMORY[0x1E4F28F60] predicateWithBlock:v50];
    v37 = [v34 filteredArrayUsingPredicate:v36];

    v38 = v19;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = [v37 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v53 = v39;
      _os_log_impl(&dword_1D1805000, v38, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: found %lu eligible assets", buf, 0xCu);
    }

    id v12 = v43;
    if (v13 && CFAbsoluteTimeGetCurrent() - v14 >= 0.01 && (char v51 = 0, v13[2](v13, &v51, 1.0), v51))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v53 = 234;
        *(_WORD *)&v53[4] = 2080;
        *(void *)&v53[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v16 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v16 = v37;
    }

    goto LABEL_42;
  }
  char v51 = 0;
  v13[2](v13, &v51, 0.0);
  if (!v51)
  {
    double v14 = v15;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v53 = 179;
    *(_WORD *)&v53[4] = 2080;
    *(void *)&v53[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v16 = (id)MEMORY[0x1E4F1CBF0];
LABEL_45:

  return v16;
}

uint64_t __96__PGRecentAestheticsSuggester_niceAssetsBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processedAssetIsValidForSuggesting:a2 allowGuestAsset:0];
}

- (void)reset
{
  v3 = [(PGAbstractSuggester *)self session];
  id v4 = [v3 loggingConnection];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D1805000, v4, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: Resetting", v6, 2u);
  }

  suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  self->_suggestedAssetEnumerator = 0;
}

- (id)nextSuggestionWithProgress:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PGAbstractSuggester *)self session];
  id v6 = [v5 loggingConnection];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: nextSuggestion", (uint8_t *)&v21, 2u);
  }
  suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  if (!suggestedAssetEnumerator)
  {
    suggestedAssets = self->_suggestedAssets;
    if (!suggestedAssets)
    {
      uint64_t v9 = [(PGSuggestionOptions *)self->_options universalStartDate];
      id v10 = [(PGSuggestionOptions *)self->_options universalEndDate];
      id v11 = [(PGRecentAestheticsSuggester *)self niceAssetsBetweenStartDate:v9 andEndDate:v10 matchingAssetUUID:0 progress:v4];
      id v12 = [(PGRecentAestheticsSuggester *)self suggestedAssetsInAssets:v11];
      v13 = self->_suggestedAssets;
      self->_suggestedAssets = v12;

      suggestedAssets = self->_suggestedAssets;
    }
    double v14 = [(NSArray *)suggestedAssets objectEnumerator];
    double v15 = self->_suggestedAssetEnumerator;
    self->_suggestedAssetEnumerator = v14;

    suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  }
  id v16 = [(NSEnumerator *)suggestedAssetEnumerator nextObject];
  if (v16
    && (v17 = [[PGSingleAssetSuggestion alloc] initWithType:3 subtype:303 asset:v16]) != 0)
  {
    v18 = v17;
    if ([(PGSuggestionOptions *)self->_options computeReasons])
    {
      long long v19 = [(PGRecentAestheticsSuggester *)self reasonsForSuggestion:v18];
      [(PGSingleAssetSuggestion *)v18 setReasons:v19];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138477827;
      uint64_t v22 = v18;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: Suggesting %{private}@", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: Nothing to suggest", (uint8_t *)&v21, 2u);
    }
    v18 = 0;
  }

  return v18;
}

- (void)startSuggestingWithOptions:(id)a3
{
  id v4 = (PGSuggestionOptions *)a3;
  id v5 = [(PGAbstractSuggester *)self session];
  id v6 = [v5 loggingConnection];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent Aesthetics: Starting suggesting", v10, 2u);
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
  id v6 = [v5 uuid];
  uint64_t v7 = [(PGRecentAestheticsSuggester *)self niceAssetsBetweenStartDate:0 andEndDate:0 matchingAssetUUID:v6 progress:&__block_literal_global_43409];

  uint64_t v8 = [(PGRecentAestheticsSuggester *)self suggestedAssetsInAssets:v7];
  if ([v8 count] == 1)
  {
    uint64_t v9 = [v8 firstObject];
    id v10 = [v9 uuid];
    id v11 = [v5 uuid];
    char v12 = [v10 isEqualToString:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v41 = a4;
  uint64_t v7 = _Block_copy(v41);
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = (double *)&v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  if (!v7
    || (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v54[3] < 0.01)
    || (v54[3] = v8,
        char v52 = 0,
        (*((void (**)(void *, char *, double))v7 + 2))(v7, &v52, 0.0),
        char v9 = *((unsigned char *)v58 + 24) | v52,
        (*((unsigned char *)v58 + 24) = v9) == 0))
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = [v6 universalStartDate];
    uint64_t v13 = [v6 universalEndDate];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __63__PGRecentAestheticsSuggester_suggestionsWithOptions_progress___block_invoke;
    v47[3] = &unk_1E68F03F8;
    id v14 = v7;
    id v48 = v14;
    v49 = &v53;
    v50 = &v57;
    uint64_t v51 = 0x3F847AE147AE147BLL;
    v42 = [(PGRecentAestheticsSuggester *)self niceAssetsBetweenStartDate:v12 andEndDate:v13 matchingAssetUUID:0 progress:v47];
    uint64_t v39 = (void *)v12;
    v40 = (void *)v13;
    if (*((unsigned char *)v58 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v63 = 65;
        __int16 v64 = 2080;
        v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
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
        if (Current - v54[3] >= 0.01)
        {
          v54[3] = Current;
          char v52 = 0;
          (*((void (**)(id, char *, double))v14 + 2))(v14, &v52, 0.5);
          char v17 = *((unsigned char *)v58 + 24) | v52;
          *((unsigned char *)v58 + 24) = v17;
          if (v17)
          {
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
              goto LABEL_11;
            }
            *(_DWORD *)buf = 67109378;
            int v63 = 67;
            __int16 v64 = 2080;
            v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
            double v15 = MEMORY[0x1E4F14500];
            goto LABEL_10;
          }
        }
      }
      if ([v42 count])
      {
        v36 = [(PGRecentAestheticsSuggester *)self suggestedAssetsInAssets:v42 options:v6];
        if ([v36 count])
        {
          uint64_t v18 = [v6 maximumNumberOfSuggestions];
          if (v18) {
            unint64_t v19 = v18;
          }
          else {
            unint64_t v19 = -1;
          }
          uint64_t v20 = v36;
          unint64_t v21 = objc_msgSend(v36, "count", v36);
          v37 = self;
          if (v21 >= v19) {
            unint64_t v22 = v19;
          }
          else {
            unint64_t v22 = v21;
          }
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id obj = v20;
          uint64_t v23 = [obj countByEnumeratingWithState:&v43 objects:v61 count:16];
          if (v23)
          {
            double v24 = 1.0 / (double)v22;
            uint64_t v25 = *(void *)v44;
            double v26 = 0.0;
            while (2)
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v44 != v25) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v28 = *(void *)(*((void *)&v43 + 1) + 8 * i);
                if (v7)
                {
                  double v29 = CFAbsoluteTimeGetCurrent();
                  if (v29 - v54[3] >= 0.01)
                  {
                    v54[3] = v29;
                    char v52 = 0;
                    (*((void (**)(id, char *, double))v14 + 2))(v14, &v52, v26 * 0.5 + 0.5);
                    char v30 = *((unsigned char *)v58 + 24) | v52;
                    *((unsigned char *)v58 + 24) = v30;
                    if (v30)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        int v63 = 80;
                        __int16 v64 = 2080;
                        v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
                        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }

                      goto LABEL_11;
                    }
                  }
                }
                uint64_t v31 = [[PGSingleAssetSuggestion alloc] initWithType:3 subtype:303 asset:v28];
                if (v31)
                {
                  if ([v6 computeReasons])
                  {
                    v32 = [(PGRecentAestheticsSuggester *)v37 reasonsForSuggestion:v31];
                    [(PGSingleAssetSuggestion *)v31 setReasons:v32];
                  }
                  [v11 addObject:v31];
                  if ([v11 count] >= v19)
                  {

                    goto LABEL_42;
                  }
                  double v26 = v24 + v26;
                }
              }
              uint64_t v23 = [obj countByEnumeratingWithState:&v43 objects:v61 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }
LABEL_42:
        }
      }
      if (!v7
        || (double v33 = CFAbsoluteTimeGetCurrent(), v33 - v54[3] < 0.01)
        || (v54[3] = v33,
            char v52 = 0,
            (*((void (**)(id, char *, double))v14 + 2))(v14, &v52, 1.0),
            char v34 = *((unsigned char *)v58 + 24) | v52,
            (*((unsigned char *)v58 + 24) = v34) == 0))
      {
        id v10 = v11;
        goto LABEL_50;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v63 = 101;
        __int16 v64 = 2080;
        v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
        double v15 = MEMORY[0x1E4F14500];
        goto LABEL_10;
      }
    }
LABEL_11:
    id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_50:

    goto LABEL_51;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v63 = 56;
    __int16 v64 = 2080;
    v65 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Single Asset Suggester/PGRecentAestheticsSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_51:
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

  return v10;
}

void __63__PGRecentAestheticsSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
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