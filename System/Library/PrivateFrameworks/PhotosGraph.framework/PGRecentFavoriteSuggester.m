@interface PGRecentFavoriteSuggester
+ (NSIndexSet)suggestionSubtypes;
+ (NSIndexSet)suggestionTypes;
- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4;
- (id)favoritedAssetsBetweenStartDate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5 progress:(id)a6;
- (id)nextSuggestionWithProgress:(id)a3;
- (id)reasonsForSuggestion:(id)a3;
- (id)suggestedAssetsInAssets:(id)a3;
- (id)suggestedAssetsInAssets:(id)a3 options:(id)a4;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (void)reset;
- (void)startSuggestingWithOptions:(id)a3;
@end

@implementation PGRecentFavoriteSuggester

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:301];
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
  [v4 curationScore];
  v7 = objc_msgSend(v5, "stringWithFormat:", @"curation = %.3f", v6);
  v8 = NSString;
  [v4 overallAestheticScore];
  v10 = objc_msgSend(v8, "stringWithFormat:", @"aesthetics = %.3f", v9);
  v13[0] = v7;
  v13[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

  return v11;
}

- (id)suggestedAssetsInAssets:(id)a3 options:(id)a4
{
  id v6 = a4;
  v7 = [(PGRecentFavoriteSuggester *)self suggestedAssetsInAssets:a3];
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
  v12[4] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F29008];
  id v4 = a3;
  v5 = [v3 sortDescriptorWithKey:@"curationScore" ascending:0];
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"overallAestheticScore" ascending:0];
  v12[1] = v6;
  v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v12[2] = v7;
  unint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v12[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];

  v10 = [v4 sortedArrayUsingDescriptors:v9];

  return v10;
}

- (id)favoritedAssetsBetweenStartDate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5 progress:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
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
    v43 = v17;
    v19 = [v17 loggingConnection];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v51 = v10;
      *(_WORD *)&v51[8] = 2112;
      *(void *)&v51[10] = v11;
      _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_DEFAULT, "Recent Favorite: Computing eligible favorited assets between %@ and %@", buf, 0x16u);
    }
    uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"favorite == YES"];
    uint64_t v21 = [(id)objc_opt_class() noVideoPredicate];
    v45 = [(id)objc_opt_class() internalPredicateForProcessedAssetsWithMinimumSceneAnalysisVersion:1];
    v46 = (void *)v21;
    v41 = (void *)v20;
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v20, v21, v45, 0);
    if (v10)
    {
      v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated >= %@", v10];
      [v22 addObject:v23];
    }
    if (v11)
    {
      v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated <= %@", v11];
      [v22 addObject:v24];
    }
    v42 = v19;
    v18 = v43;
    if (v12)
    {
      v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid == %@", v12];
      [v22 addObject:v25];
    }
    v44 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v22];
    v26 = -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:");
    v27 = +[PGCurationManager assetPropertySetsForCuration];
    [v26 setFetchPropertySets:v27];

    v47 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v26];
    if (v13)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v14 >= 0.01)
      {
        char v49 = 0;
        v13[2](v13, &v49, 0.4);
        if (v49)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v51 = 212;
            *(_WORD *)&v51[4] = 2080;
            *(void *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v16 = (id)MEMORY[0x1E4F1CBF0];
          v29 = v41;
          goto LABEL_43;
        }
        double v14 = Current;
      }
    }
    id v40 = v12;
    uint64_t v30 = [MEMORY[0x1E4F38EB8] clsPrefetchOptionsForKeyAsset];
    v31 = (void *)MEMORY[0x1E4F38EB8];
    v32 = [v43 curationContext];
    v33 = [v31 clsAllAssetsFromFetchResult:v47 prefetchOptions:v30 curationContext:v32];

    if (v13)
    {
      double v34 = CFAbsoluteTimeGetCurrent();
      if (v34 - v14 >= 0.01)
      {
        char v49 = 0;
        v13[2](v13, &v49, 0.8);
        if (v49)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v51 = 217;
            *(_WORD *)&v51[4] = 2080;
            *(void *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v16 = (id)MEMORY[0x1E4F1CBF0];
          v19 = v42;
LABEL_42:
          v29 = v41;

          id v12 = v40;
LABEL_43:

          goto LABEL_44;
        }
        double v14 = v34;
      }
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __99__PGRecentFavoriteSuggester_favoritedAssetsBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke;
    v48[3] = &unk_1E68EC880;
    v48[4] = self;
    v35 = [MEMORY[0x1E4F28F60] predicateWithBlock:v48];
    v36 = [v33 filteredArrayUsingPredicate:v35];

    v19 = v42;
    v37 = v42;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = [v36 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v51 = v38;
      _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_DEFAULT, "Recent Favorite: found %lu eligible assets", buf, 0xCu);
    }

    if (v13 && CFAbsoluteTimeGetCurrent() - v14 >= 0.01 && (char v49 = 0, v13[2](v13, &v49, 1.0), v49))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v51 = 224;
        *(_WORD *)&v51[4] = 2080;
        *(void *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v16 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v16 = v36;
    }

    goto LABEL_42;
  }
  char v49 = 0;
  v13[2](v13, &v49, 0.0);
  if (!v49)
  {
    double v14 = v15;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v51 = 170;
    *(_WORD *)&v51[4] = 2080;
    *(void *)&v51[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v16 = (id)MEMORY[0x1E4F1CBF0];
LABEL_45:

  return v16;
}

uint64_t __99__PGRecentFavoriteSuggester_favoritedAssetsBetweenStartDate_andEndDate_matchingAssetUUID_progress___block_invoke(uint64_t a1, uint64_t a2)
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
    _os_log_impl(&dword_1D1805000, v4, OS_LOG_TYPE_DEFAULT, "Recent Favorite: Resetting", v6, 2u);
  }

  suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  self->_suggestedAssetEnumerator = 0;
}

- (id)nextSuggestionWithProgress:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PGAbstractSuggester *)self session];
  id v6 = [v5 loggingConnection];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent Favorite: nextSuggestion", (uint8_t *)&v21, 2u);
  }
  suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
  if (!suggestedAssetEnumerator)
  {
    suggestedAssets = self->_suggestedAssets;
    if (!suggestedAssets)
    {
      uint64_t v9 = [(PGSuggestionOptions *)self->_options universalStartDate];
      id v10 = [(PGSuggestionOptions *)self->_options universalEndDate];
      id v11 = [(PGRecentFavoriteSuggester *)self favoritedAssetsBetweenStartDate:v9 andEndDate:v10 matchingAssetUUID:0 progress:v4];
      id v12 = [(PGRecentFavoriteSuggester *)self suggestedAssetsInAssets:v11];
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
    && (v17 = [[PGSingleAssetSuggestion alloc] initWithType:3 subtype:301 asset:v16]) != 0)
  {
    v18 = v17;
    if ([(PGSuggestionOptions *)self->_options computeReasons])
    {
      v19 = [(PGRecentFavoriteSuggester *)self reasonsForSuggestion:v18];
      [(PGSingleAssetSuggestion *)v18 setReasons:v19];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138477827;
      v22 = v18;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent Favorite: Suggesting %{private}@", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent Favorite: Nothing to suggest", (uint8_t *)&v21, 2u);
    }
    v18 = 0;
  }

  return v18;
}

- (void)startSuggestingWithOptions:(id)a3
{
  id v4 = (PGSuggestionOptions *)a3;
  v5 = [(PGAbstractSuggester *)self session];
  id v6 = [v5 loggingConnection];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Recent Favorite: Starting suggesting", v10, 2u);
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
  v7 = [(PGRecentFavoriteSuggester *)self favoritedAssetsBetweenStartDate:0 andEndDate:0 matchingAssetUUID:v6 progress:&__block_literal_global_27];

  unint64_t v8 = [(PGRecentFavoriteSuggester *)self suggestedAssetsInAssets:v7];
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
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v37 = a4;
  v7 = _Block_copy(v37);
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  uint64_t v50 = 0;
  v51 = (double *)&v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  v39 = v6;
  if (!v7
    || (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v51[3] < 0.01)
    || (v51[3] = v8,
        char v49 = 0,
        (*((void (**)(void *, char *, double))v7 + 2))(v7, &v49, 0.0),
        char v9 = *((unsigned char *)v55 + 24) | v49,
        (*((unsigned char *)v55 + 24) = v9) == 0))
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = [v6 universalStartDate];
    uint64_t v13 = [v6 universalEndDate];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __61__PGRecentFavoriteSuggester_suggestionsWithOptions_progress___block_invoke;
    v44[3] = &unk_1E68F03F8;
    id v14 = v7;
    id v45 = v14;
    v46 = &v50;
    v47 = &v54;
    uint64_t v48 = 0x3F847AE147AE147BLL;
    uint64_t v38 = [(PGRecentFavoriteSuggester *)self favoritedAssetsBetweenStartDate:v12 andEndDate:v13 matchingAssetUUID:0 progress:v44];
    v35 = (void *)v12;
    v36 = (void *)v13;
    if (*((unsigned char *)v55 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v60 = 59;
        __int16 v61 = 2080;
        v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
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
        if (Current - v51[3] >= 0.01)
        {
          v51[3] = Current;
          char v49 = 0;
          (*((void (**)(id, char *, double))v14 + 2))(v14, &v49, 0.5);
          char v17 = *((unsigned char *)v55 + 24) | v49;
          *((unsigned char *)v55 + 24) = v17;
          if (v17)
          {
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
              goto LABEL_11;
            }
            *(_DWORD *)buf = 67109378;
            int v60 = 61;
            __int16 v61 = 2080;
            v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
            double v15 = MEMORY[0x1E4F14500];
            goto LABEL_10;
          }
        }
      }
      if ([v38 count])
      {
        v18 = [(PGRecentFavoriteSuggester *)self suggestedAssetsInAssets:v38 options:v6];
        uint64_t v19 = [v6 maximumNumberOfSuggestions];
        double v34 = self;
        if (v19) {
          unint64_t v20 = v19;
        }
        else {
          unint64_t v20 = -1;
        }
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v21 = v18;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v58 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v41;
          double v24 = 0.0;
          while (2)
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v41 != v23) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              if (v7)
              {
                double v27 = CFAbsoluteTimeGetCurrent();
                if (v27 - v51[3] >= 0.01)
                {
                  v51[3] = v27;
                  char v49 = 0;
                  (*((void (**)(id, char *, double))v14 + 2))(v14, &v49, v24 * 0.5 + 0.5);
                  char v28 = *((unsigned char *)v55 + 24) | v49;
                  *((unsigned char *)v55 + 24) = v28;
                  if (v28)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      int v60 = 72;
                      __int16 v61 = 2080;
                      v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
                      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }

                    goto LABEL_11;
                  }
                }
              }
              v29 = [[PGSingleAssetSuggestion alloc] initWithType:3 subtype:301 asset:v26];
              if (v29)
              {
                if ([v39 computeReasons])
                {
                  uint64_t v30 = [(PGRecentFavoriteSuggester *)v34 reasonsForSuggestion:v29];
                  [(PGSingleAssetSuggestion *)v29 setReasons:v30];
                }
                [v11 addObject:v29];
                if ([v11 count] >= v20)
                {

                  goto LABEL_38;
                }
                double v24 = 1.0 / (double)v20 + v24;
              }
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v58 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }
LABEL_38:
      }
      if (!v7
        || (double v31 = CFAbsoluteTimeGetCurrent(), v31 - v51[3] < 0.01)
        || (v51[3] = v31,
            char v49 = 0,
            (*((void (**)(id, char *, double))v14 + 2))(v14, &v49, 1.0),
            char v32 = *((unsigned char *)v55 + 24) | v49,
            (*((unsigned char *)v55 + 24) = v32) == 0))
      {
        id v10 = v11;
        goto LABEL_45;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v60 = 92;
        __int16 v61 = 2080;
        v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
        double v15 = MEMORY[0x1E4F14500];
        goto LABEL_10;
      }
    }
LABEL_11:
    id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_45:

    goto LABEL_46;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v60 = 50;
    __int16 v61 = 2080;
    v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Single Asset Suggester/PGRecentFavoriteSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v10 = (id)MEMORY[0x1E4F1CBF0];
LABEL_46:
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  return v10;
}

void __61__PGRecentFavoriteSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
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