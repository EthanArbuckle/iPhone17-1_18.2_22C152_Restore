@interface PGOutstanderSuggester
+ (NSIndexSet)suggestionSubtypes;
+ (NSIndexSet)suggestionTypes;
- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4;
- (id)assetInternalPredicate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5;
- (id)nextSuggestedAssetEnumeratorWithProgress:(id)a3;
- (id)nextSuggestedAssetWithProgress:(id)a3;
- (id)nextSuggestionWithProgress:(id)a3;
- (id)reasonsForSuggestion:(id)a3;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (unint64_t)scoreWithAsset:(id)a3;
- (void)computeNiceAssetsBetweenStartDate:(id)a3 andEndDate:(id)a4 withProgress:(id)a5;
- (void)reset;
- (void)startSuggestingWithOptions:(id)a3;
@end

@implementation PGOutstanderSuggester

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:501];
}

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSuggestedAssetEnumerator, 0);
  objc_storeStrong((id *)&self->_sortedScores, 0);
  objc_storeStrong((id *)&self->_assetUUIDsByScore, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (id)reasonsForSuggestion:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = [a3 keyAssets];
  v5 = [v4 firstObject];

  v6 = objc_msgSend(NSString, "stringWithFormat:", @"score = %lu", -[PGOutstanderSuggester scoreWithAsset:](self, "scoreWithAsset:", v5));
  v7 = NSString;
  [v5 overallAestheticScore];
  v9 = objc_msgSend(v7, "stringWithFormat:", @"aesthetics = %.3f", v8);
  v12[0] = v6;
  v12[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v10;
}

- (id)nextSuggestedAssetEnumeratorWithProgress:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void (**)(void *, unsigned char *, double))_Block_copy(v4);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v37 = 0;
  v38 = (double *)&v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  if (v5)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v38[3] >= 0.01)
    {
      v38[3] = Current;
      char v36 = 0;
      v5[2](v5, &v36, 0.0);
      char v7 = *((unsigned char *)v42 + 24) | v36;
      *((unsigned char *)v42 + 24) = v7;
      if (v7)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v47 = 297;
          __int16 v48 = 2080;
          v49 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
          float v8 = MEMORY[0x1E4F14500];
LABEL_12:
          _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_35;
        }
        goto LABEL_35;
      }
    }
  }
  if (!self->_assetUUIDsByScore)
  {
    v22 = [(PGSuggestionOptions *)self->_options universalEndDateForWholeLibrarySuggestions];
    v23 = v22;
    if (v22)
    {
      id v24 = v22;
    }
    else
    {
      id v24 = [(PGSuggestionOptions *)self->_options universalStartDate];
    }
    v28 = v24;

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __66__PGOutstanderSuggester_nextSuggestedAssetEnumeratorWithProgress___block_invoke;
    v31[3] = &unk_1E68F03F8;
    v32 = v5;
    v33 = &v37;
    v34 = &v41;
    uint64_t v35 = 0x3F847AE147AE147BLL;
    [(PGOutstanderSuggester *)self computeNiceAssetsBetweenStartDate:0 andEndDate:v28 withProgress:v31];
    if (*((unsigned char *)v42 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v47 = 306;
        __int16 v48 = 2080;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

      goto LABEL_35;
    }
  }
  if (!v5
    || (double v9 = CFAbsoluteTimeGetCurrent(), v9 - v38[3] < 0.01)
    || (v38[3] = v9, v36 = 0, v5[2](v5, &v36, 0.5), char v10 = *((unsigned char *)v42 + 24) | v36, (*((unsigned char *)v42 + 24) = v10) == 0))
  {
    unint64_t v11 = self->_currentScoreIndex + 1;
    self->_currentScoreIndex = v11;
    if (v11 >= [(NSArray *)self->_sortedScores count])
    {
      v12 = 0;
    }
    else
    {
      v12 = [(NSArray *)self->_sortedScores objectAtIndexedSubscript:v11];
      if (v12)
      {
        v13 = [(NSDictionary *)self->_assetUUIDsByScore objectForKeyedSubscript:v12];
        if (v13)
        {
          v30 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v13];
          v14 = -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:");
          [v14 setChunkSizeForFetch:200];
          [v14 setCacheSizeForFetch:400];
          v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"overallAestheticScore" ascending:0];
          v45[0] = v15;
          v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
          v45[1] = v16;
          v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
          v45[2] = v17;
          v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
          [v14 setSortDescriptors:v18];

          v19 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v14];
          v20 = [v19 fetchedObjects];
          v21 = [v20 objectEnumerator];

          if (!v5) {
            goto LABEL_28;
          }
LABEL_23:
          double v25 = CFAbsoluteTimeGetCurrent();
          if (v25 - v38[3] >= 0.01)
          {
            v38[3] = v25;
            char v36 = 0;
            v5[2](v5, &v36, 1.0);
            char v26 = *((unsigned char *)v42 + 24) | v36;
            *((unsigned char *)v42 + 24) = v26;
            if (v26)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v47 = 332;
                __int16 v48 = 2080;
                v49 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Suggestions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              id v27 = 0;
              goto LABEL_29;
            }
          }
LABEL_28:
          id v27 = v21;
LABEL_29:

          goto LABEL_36;
        }
LABEL_22:
        v21 = 0;
        if (!v5) {
          goto LABEL_28;
        }
        goto LABEL_23;
      }
    }
    v13 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v47 = 309;
    __int16 v48 = 2080;
    v49 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
    float v8 = MEMORY[0x1E4F14500];
    goto LABEL_12;
  }
LABEL_35:
  id v27 = 0;
LABEL_36:
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v27;
}

void __66__PGOutstanderSuggester_nextSuggestedAssetEnumeratorWithProgress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
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

- (id)nextSuggestedAssetWithProgress:(id)a3
{
  id v4 = a3;
  v5 = [(NSEnumerator *)self->_currentSuggestedAssetEnumerator nextObject];
  if (!v5)
  {
    v6 = [(PGOutstanderSuggester *)self nextSuggestedAssetEnumeratorWithProgress:v4];
    currentSuggestedAssetEnumerator = self->_currentSuggestedAssetEnumerator;
    self->_currentSuggestedAssetEnumerator = v6;

    v5 = [(NSEnumerator *)self->_currentSuggestedAssetEnumerator nextObject];
  }

  return v5;
}

- (unint64_t)scoreWithAsset:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isFavorite];
  [v4 clsAestheticScore];
  double v7 = v6;
  float v8 = [(PGAbstractSuggester *)self session];
  [v8 topTierAestheticScore];
  double v10 = v9;

  uint64_t v11 = 1;
  if (v5) {
    uint64_t v11 = 2;
  }
  if (v7 >= v10) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = v5;
  }
  unint64_t v13 = v12 + [v4 isIncludedInCloudFeeds];
  if ([v4 clsShareCount] && objc_msgSend(v4, "clsVideoFaceCount")) {
    ++v13;
  }
  if ((unint64_t)[v4 clsPeopleCount] > 3) {
    ++v13;
  }

  return v13;
}

- (void)computeNiceAssetsBetweenStartDate:(id)a3 andEndDate:(id)a4 withProgress:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = 0.0;
  v67 = (void (**)(void *, unsigned char *, double))_Block_copy(v10);
  if (!v67 || (double v12 = CFAbsoluteTimeGetCurrent(), v12 < 0.01))
  {
LABEL_7:
    unint64_t v13 = [(PGAbstractSuggester *)self session];
    v14 = v13;
    if (!v13)
    {
LABEL_53:

      goto LABEL_54;
    }
    log = [v13 loggingConnection];
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v79 = v9;
      _os_log_impl(&dword_1D1805000, log, OS_LOG_TYPE_DEFAULT, "Outstander: Computing eligible nice assets up to %@", buf, 0xCu);
    }
    v15 = [(PGOutstanderSuggester *)self assetInternalPredicate:v8 andEndDate:v9 matchingAssetUUID:0];
    v16 = [(PGAbstractSuggester *)self defaultAssetFetchOptionsWithInternalPredicate:v15];
    v17 = +[PGCurationManager assetPropertySetsForCuration];
    [v16 setFetchPropertySets:v17];

    [v16 setChunkSizeForFetch:200];
    [v16 setCacheSizeForFetch:400];
    v66 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v16];
    if (v67)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v11 >= 0.01)
      {
        char v75 = 0;
        v67[2](v67, &v75, 0.2);
        if (v75)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v79 = 217;
            *(_WORD *)&v79[4] = 2080;
            *(void *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v19 = log;
LABEL_52:

          goto LABEL_53;
        }
        double v11 = Current;
      }
    }
    v57 = v16;
    v58 = v15;
    id v59 = v10;
    id v60 = v9;
    id v61 = v8;
    uint64_t v65 = [MEMORY[0x1E4F38EB8] clsPrefetchOptionsForKeyAsset];
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    unint64_t v21 = [v66 count];
    if (v21)
    {
      unint64_t v22 = v21;
      uint64_t v23 = 0;
      unint64_t v24 = 0;
      double v25 = (double)v21;
      unint64_t v63 = v21;
      v64 = v14;
      while (1)
      {
        char v26 = (void *)MEMORY[0x1D25FED50]();
        if (v67)
        {
          double v27 = CFAbsoluteTimeGetCurrent();
          if (v27 - v11 >= 0.01)
          {
            char v75 = 0;
            v67[2](v67, &v75, (double)v24 * 0.8 / v25 + 0.2);
            if (v75)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v79 = 225;
                *(_WORD *)&v79[4] = 2080;
                *(void *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Suggestions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              v19 = log;
              goto LABEL_51;
            }
            double v11 = v27;
          }
        }
        context = v26;
        unint64_t v70 = v24;
        if (v22 - v24 >= 0xC8) {
          uint64_t v28 = 200;
        }
        else {
          uint64_t v28 = v22 - v24;
        }
        v29 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v24, v28);
        v30 = [v66 objectsAtIndexes:v29];

        id v31 = objc_alloc(MEMORY[0x1E4F39150]);
        v32 = [v66 photoLibrary];
        v33 = [v66 fetchPropertySets];
        uint64_t v34 = [v31 initWithObjects:v30 photoLibrary:v32 fetchType:0 fetchPropertySets:v33 identifier:0 registerIfNeeded:0];

        uint64_t v35 = (void *)MEMORY[0x1E4F38EB8];
        char v36 = [v14 curationContext];
        v68 = (void *)v34;
        uint64_t v37 = [v35 clsAllAssetsFromFetchResult:v34 prefetchOptions:v65 curationContext:v36];

        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v38 = v37;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v71 objects:v77 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v72;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v72 != v41) {
                objc_enumerationMutation(v38);
              }
              uint64_t v43 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              if ([(PGAbstractSuggester *)self processedAssetIsValidForSuggesting:v43 allowGuestAsset:0])
              {
                char v44 = [v43 uuid];
                unint64_t v45 = [(PGOutstanderSuggester *)self scoreWithAsset:v43];
                v46 = [NSNumber numberWithUnsignedInteger:v45];
                id v47 = [v20 objectForKeyedSubscript:v46];
                if (!v47)
                {
                  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  [v20 setObject:v47 forKeyedSubscript:v46];
                }
                [v47 addObject:v44];
                ++v23;
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v71 objects:v77 count:16];
          }
          while (v40);
        }

        unint64_t v24 = v70 + 200;
        unint64_t v22 = v63;
        v14 = v64;
        if (v70 + 200 >= v63) {
          goto LABEL_40;
        }
      }
    }
    uint64_t v23 = 0;
LABEL_40:
    objc_storeStrong((id *)&self->_assetUUIDsByScore, v20);
    __int16 v48 = [(NSDictionary *)self->_assetUUIDsByScore allKeys];
    v49 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:0];
    v76 = v49;
    uint64_t v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
    v51 = [v48 sortedArrayUsingDescriptors:v50];
    sortedScores = self->_sortedScores;
    self->_sortedScores = v51;

    v19 = log;
    if (v67 && CFAbsoluteTimeGetCurrent() - v11 >= 0.01 && (char v75 = 0, v67[2](v67, &v75, 1.0), v75))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v79 = 252;
      *(_WORD *)&v79[4] = 2080;
      *(void *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
      v53 = MEMORY[0x1E4F14500];
      v54 = "Cancelled at line %d in file %s";
      os_log_type_t v55 = OS_LOG_TYPE_INFO;
      uint32_t v56 = 18;
    }
    else
    {
      if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)v79 = v23;
      v54 = "Outstander: found %lu eligible assets";
      v53 = log;
      os_log_type_t v55 = OS_LOG_TYPE_DEFAULT;
      uint32_t v56 = 12;
    }
    _os_log_impl(&dword_1D1805000, v53, v55, v54, buf, v56);
LABEL_51:

    id v9 = v60;
    id v8 = v61;
    v15 = v58;
    id v10 = v59;
    v16 = v57;
    goto LABEL_52;
  }
  char v75 = 0;
  v67[2](v67, &v75, 0.0);
  if (!v75)
  {
    double v11 = v12;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v79 = 196;
    *(_WORD *)&v79[4] = 2080;
    *(void *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_54:
}

- (id)assetInternalPredicate:(id)a3 andEndDate:(id)a4 matchingAssetUUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"curationScore >= %f", *MEMORY[0x1E4F8E738]);
  double v11 = [(id)objc_opt_class() noVideoPredicate];
  double v12 = [(id)objc_opt_class() internalPredicateForProcessedAssetsWithMinimumSceneAnalysisVersion:1];
  unint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v10, v11, v12, 0);
  if (v7)
  {
    v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated >= %@", v7];
    [v13 addObject:v14];
  }
  if (v8)
  {
    v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated <= %@", v8];
    [v13 addObject:v15];
  }
  if (v9)
  {
    v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid == %@", v9];
    [v13 addObject:v16];
  }
  v17 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];

  return v17;
}

- (void)reset
{
  v3 = [(PGAbstractSuggester *)self session];
  id v4 = [v3 loggingConnection];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_1D1805000, v4, OS_LOG_TYPE_DEFAULT, "Outstander: Resetting", v6, 2u);
  }

  self->_currentScoreIndex = -1;
  currentSuggestedAssetEnumerator = self->_currentSuggestedAssetEnumerator;
  self->_currentSuggestedAssetEnumerator = 0;
}

- (id)nextSuggestionWithProgress:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [(PGAbstractSuggester *)self session];
  double v6 = v5;
  if (v5)
  {
    id v7 = [v5 loggingConnection];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_DEFAULT, "Outstander: nextSuggestion", (uint8_t *)&v13, 2u);
    }
    id v8 = [(PGOutstanderSuggester *)self nextSuggestedAssetWithProgress:v4];
    if (v8
      && (id v9 = [[PGSingleAssetSuggestion alloc] initWithType:5 subtype:501 asset:v8]) != 0)
    {
      id v10 = v9;
      if ([(PGSuggestionOptions *)self->_options computeReasons])
      {
        double v11 = [(PGOutstanderSuggester *)self reasonsForSuggestion:v10];
        [(PGSingleAssetSuggestion *)v10 setReasons:v11];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138477827;
        v14 = v10;
        _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_DEFAULT, "Outstander: Suggesting %{private}@", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_DEFAULT, "Outstander: Nothing to suggest", (uint8_t *)&v13, 2u);
      }
      id v10 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v13) = 0;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Outstander: Needs a session!", (uint8_t *)&v13, 2u);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)startSuggestingWithOptions:(id)a3
{
  id v4 = (PGSuggestionOptions *)a3;
  unsigned int v5 = [(PGAbstractSuggester *)self session];
  double v6 = [v5 loggingConnection];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v12 = 0;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "Outstander: Starting suggesting", v12, 2u);
  }

  options = self->_options;
  self->_options = v4;
  id v8 = v4;

  assetUUIDsByScore = self->_assetUUIDsByScore;
  self->_assetUUIDsByScore = 0;

  sortedScores = self->_sortedScores;
  self->_sortedScores = 0;

  self->_currentScoreIndex = -1;
  currentSuggestedAssetEnumerator = self->_currentSuggestedAssetEnumerator;
  self->_currentSuggestedAssetEnumerator = 0;
}

- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4
{
  id v5 = a3;
  double v6 = [v5 uuid];
  id v7 = [(PGOutstanderSuggester *)self assetInternalPredicate:0 andEndDate:0 matchingAssetUUID:v6];

  id v8 = [(PGAbstractSuggester *)self defaultAssetFetchOptionsWithInternalPredicate:v7];
  id v9 = +[PGCurationManager assetPropertySetsForCuration];
  [v8 setFetchPropertySets:v9];

  [v8 setFetchLimit:1];
  id v10 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v8];
  double v11 = [v10 firstObject];

  if (v11)
  {
    double v12 = [v11 uuid];
    int v13 = [v5 uuid];
    char v14 = [v12 isEqualToString:v13];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v26 = a4;
  double v6 = _Block_copy(v26);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v37 = 0;
  id v38 = (double *)&v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  if (v6
    && (double v7 = CFAbsoluteTimeGetCurrent(), v7 - v38[3] >= 0.01)
    && (v38[3] = v7,
        char v36 = 0,
        (*((void (**)(void *, char *, double))v6 + 2))(v6, &v36, 0.0),
        char v8 = *((unsigned char *)v42 + 24) | v36,
        (*((unsigned char *)v42 + 24) = v8) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v46 = 61;
      __int16 v47 = 2080;
      __int16 v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    -[PGOutstanderSuggester startSuggestingWithOptions:](self, "startSuggestingWithOptions:", v28, v26);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = [v28 maximumNumberOfSuggestions];
    double v27 = v10;
    unint64_t v12 = 0;
    if (v11) {
      unint64_t v13 = v11;
    }
    else {
      unint64_t v13 = -1;
    }
    double v14 = 0.0;
    uint64_t v15 = MEMORY[0x1E4F14500];
    while (v12 < v13)
    {
      v16 = (void *)MEMORY[0x1D25FED50]();
      if (v6
        && (double Current = CFAbsoluteTimeGetCurrent(), Current - v38[3] >= 0.01)
        && (v38[3] = Current,
            char v36 = 0,
            (*((void (**)(void *, char *, double))v6 + 2))(v6, &v36, v14),
            char v18 = *((unsigned char *)v42 + 24) | v36,
            (*((unsigned char *)v42 + 24) = v18) != 0))
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v46 = 72;
          __int16 v47 = 2080;
          __int16 v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
          _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        int v19 = 1;
      }
      else
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __57__PGOutstanderSuggester_suggestionsWithOptions_progress___block_invoke;
        v29[3] = &unk_1E68ECB50;
        id v30 = v6;
        id v31 = &v37;
        double v34 = v14;
        double v35 = 1.0 / (double)v13;
        uint64_t v33 = 0x3F847AE147AE147BLL;
        v32 = &v41;
        uint64_t v20 = [(PGOutstanderSuggester *)self nextSuggestionWithProgress:v29];
        unint64_t v21 = (void *)v20;
        if (*((unsigned char *)v42 + 24))
        {
          int v19 = 1;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v46 = 77;
            __int16 v47 = 2080;
            __int16 v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
            _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else if (v20)
        {
          [v27 addObject:v20];
          int v19 = 0;
          ++v12;
          double v14 = 1.0 / (double)v13 + v14;
        }
        else
        {
          int v19 = 3;
        }
      }
      if (v19)
      {
        if (v19 != 3)
        {
          id v9 = (id)MEMORY[0x1E4F1CBF0];
          unint64_t v22 = v27;
          goto LABEL_35;
        }
        break;
      }
    }
    unint64_t v22 = v27;
    if (v6
      && (double v23 = CFAbsoluteTimeGetCurrent(), v23 - v38[3] >= 0.01)
      && (v38[3] = v23,
          char v36 = 0,
          (*((void (**)(void *, char *, double))v6 + 2))(v6, &v36, 1.0),
          char v24 = *((unsigned char *)v42 + 24) | v36,
          (*((unsigned char *)v42 + 24) = v24) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v46 = 86;
        __int16 v47 = 2080;
        __int16 v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Single Asset Suggester/PGOutstanderSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v9 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v9 = v27;
    }
LABEL_35:
  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v9;
}

void __57__PGOutstanderSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 64) + *(double *)(a1 + 72) * a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

@end