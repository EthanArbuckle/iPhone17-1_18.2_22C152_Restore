@interface PGLongTailSuggester
+ (id)suggestionSubtypes;
+ (id)suggestionTypes;
+ (unint64_t)randomIntegerWithUpperBound:(unint64_t)a3 seed:(unsigned int)a4;
- (BOOL)_shouldUsePreviousBatchOfCandidateAssets;
- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4;
- (BOOL)isMomentNodeInteresting:(id)a3 withNeighborScoreComputer:(id)a4;
- (_NSRange)_randomRangeWithLocationUpperBound:(unint64_t)a3 maxLength:(unint64_t)a4;
- (id)_assetUUIDByWeightedProbablisticSamplingFromAssetUUIDS:(id)a3 weights:(id)a4;
- (id)_assetUUIDsFromAssets:(id)a3 atIndices:(id)a4;
- (id)_batchOfRandomAssetsWithCount:(unint64_t)a3 progress:(id)a4;
- (id)_bestAssetUUIDsFromCandidates:(id)a3 percentile:(unint64_t)a4;
- (id)_candidateByAssetUUIDsFromAssets:(id)a3;
- (id)_eligibleAssetUUIDsWithProgress:(id)a3;
- (id)_fetchVerifiedPersonUUIDsByAssetUUIds:(id)a3;
- (id)_nextCandidateAssetsWithProgress:(id)a3;
- (id)allInterestingMomentsFromGraph:(id)a3 progress:(id)a4;
- (id)highlightedAssetInternalPredicate;
- (id)nextSuggestedAssetWithProgress:(id)a3;
- (id)nextSuggestionWithProgress:(id)a3;
- (id)reasonsForSuggestion:(id)a3;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
- (unint64_t)_longTailScoreWithAsset:(id)a3 withAdditionalOptions:(id)a4;
- (void)captureInformationFromGraph:(id)a3;
- (void)reset;
- (void)startSuggestingWithOptions:(id)a3;
@end

@implementation PGLongTailSuggester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meNodeLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_candidateAssetsFromPreviousBatch, 0);
  objc_storeStrong((id *)&self->_suggestedAssetsFromPreviousBatch, 0);
  objc_storeStrong((id *)&self->_verifiedPersonUUIDsByAssetUUIds, 0);
  objc_storeStrong((id *)&self->_eligibleAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_additionalOptions, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (_NSRange)_randomRangeWithLocationUpperBound:(unint64_t)a3 maxLength:(unint64_t)a4
{
  if (a3 <= a4)
  {
    NSUInteger v6 = a3;
    NSUInteger v5 = 0;
  }
  else
  {
    NSUInteger v5 = +[PGLongTailSuggester randomIntegerWithUpperBound:a3 - a4 + 1 seed:self->_randomSeed];
    NSUInteger v6 = a4;
  }
  result.length = v6;
  result.location = v5;
  return result;
}

- (id)_assetUUIDsFromAssets:(id)a3 atIndices:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = objc_msgSend(v5, "objectsAtIndexes:", v6, 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) uuid];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)reasonsForSuggestion:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = [a3 keyAssets];
  id v5 = [v4 firstObject];

  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"score = %lu", -[PGLongTailSuggester _longTailScoreWithAsset:withAdditionalOptions:](self, "_longTailScoreWithAsset:withAdditionalOptions:", v5, self->_additionalOptions));
  id v7 = NSString;
  [v5 overallAestheticScore];
  uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", @"aesthetics = %.3f", v8);
  v12[0] = v6;
  v12[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v10;
}

- (id)_assetUUIDByWeightedProbablisticSamplingFromAssetUUIDS:(id)a3 weights:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1D25FED50]();
        long long v15 = [v6 objectForKeyedSubscript:v13];
        uint64_t v16 = [v15 score];
        if (v16)
        {
          uint64_t v17 = v16;
          do
          {
            [v7 addObject:v13];
            --v17;
          }
          while (v17);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  uint64_t v18 = [v7 count];
  if (v18)
  {
    v19 = objc_msgSend(v7, "objectAtIndexedSubscript:", +[PGLongTailSuggester randomIntegerWithUpperBound:seed:](PGLongTailSuggester, "randomIntegerWithUpperBound:seed:", v18, self->_randomSeed));
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_bestAssetUUIDsFromCandidates:(id)a3 percentile:(unint64_t)a4
{
  id v5 = [a3 keysSortedByValueUsingComparator:&__block_literal_global_26461];
  unint64_t v6 = (unint64_t)((double)a4 / 100.0 * (double)(unint64_t)[v5 count]);
  id v7 = v5;
  if (v6)
  {
    id v7 = v5;
    if ([v5 count] > v6)
    {
      id v7 = objc_msgSend(v5, "subarrayWithRange:", 0, v6);
    }
  }

  return v7;
}

uint64_t __64__PGLongTailSuggester__bestAssetUUIDsFromCandidates_percentile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 score];
  unint64_t v6 = [v4 score];

  if (v5 <= v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = -1;
  }
  if (v5 < v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (id)_candidateByAssetUUIDsFromAssets:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v11 = [v9 uuid];
        v12 = [[PGLongTailSuggestionCandidate alloc] initWithAsset:v9 score:[(PGLongTailSuggester *)self _longTailScoreWithAsset:v9 withAdditionalOptions:self->_additionalOptions]];
        if ([(PGLongTailSuggestionCandidate *)v12 isValidWithMeNodeLocalIdentifier:self->_meNodeLocalIdentifier])
        {
          [v14 setValue:v12 forKey:v11];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v14;
}

- (id)_eligibleAssetUUIDsWithProgress:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v4 = (void (**)(void *, uint8_t *, double))_Block_copy(v54);
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  char v77 = 0;
  uint64_t v70 = 0;
  v71 = (double *)&v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v73 = 0;
  if (v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v71[3] >= 0.01)
    {
      v71[3] = Current;
      buf[0] = 0;
      v4[2](v4, buf, 0.0);
      char v6 = *((unsigned char *)v75 + 24) | buf[0];
      *((unsigned char *)v75 + 24) = v6;
      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v86 = 67109378;
          *(_DWORD *)&v86[4] = 607;
          LOWORD(v87) = 2080;
          *(void *)((char *)&v87 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Suggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
          uint64_t v7 = MEMORY[0x1E4F14500];
LABEL_58:
          _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v86, 0x12u);
          goto LABEL_59;
        }
        goto LABEL_59;
      }
    }
  }
  p_eligibleAssetUUIDs = &self->_eligibleAssetUUIDs;
  if (!self->_eligibleAssetUUIDs)
  {
    uint64_t v9 = [(PGAbstractSuggester *)self session];
    uint64_t v10 = v9;
    if (v9)
    {
      log = [v9 loggingConnection];
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v86 = 0;
        _os_log_debug_impl(&dword_1D1805000, log, OS_LOG_TYPE_DEBUG, "Long Tail: Fetching all interesting moments", v86, 2u);
      }
      location = (id *)&self->_eligibleAssetUUIDs;
      *(void *)v86 = 0;
      *(void *)&long long v87 = v86;
      *((void *)&v87 + 1) = 0x3032000000;
      v88 = __Block_byref_object_copy__26469;
      v89 = __Block_byref_object_dispose__26470;
      id v90 = 0;
      v47 = v10;
      uint64_t v11 = [v10 workingContext];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __55__PGLongTailSuggester__eligibleAssetUUIDsWithProgress___block_invoke;
      v64[3] = &unk_1E68E7CB0;
      v66 = v86;
      v64[4] = self;
      v50 = v4;
      v65 = v50;
      v67 = &v70;
      v68 = &v74;
      uint64_t v69 = 0x3F847AE147AE147BLL;
      [v11 performSynchronousConcurrentGraphReadUsingBlock:v64];

      if (*((unsigned char *)v75 + 24))
      {
        int v12 = 1;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v83 = 630;
          __int16 v84 = 2080;
          v85 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      else
      {
        uint64_t v13 = log;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v43 = [*(id *)(v87 + 40) count];
          *(_DWORD *)buf = 67109120;
          int v83 = v43;
          _os_log_debug_impl(&dword_1D1805000, v13, OS_LOG_TYPE_DEBUG, "Long Tail: Fetching all interesting moments: %d found", buf, 8u);
        }
        os_log_t oslog = v13;

        if (!v4) {
          goto LABEL_66;
        }
        double v14 = CFAbsoluteTimeGetCurrent();
        if (v14 - v71[3] >= 0.01
          && (v71[3] = v14,
              char v63 = 0,
              v50[2](v50, (uint8_t *)&v63, 0.2),
              char v15 = *((unsigned char *)v75 + 24) | v63,
              (*((unsigned char *)v75 + 24) = v15) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v83 = 634;
            __int16 v84 = 2080;
            v85 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          int v12 = 1;
        }
        else
        {
LABEL_66:
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1D1805000, v13, OS_LOG_TYPE_DEBUG, "Long Tail: Fetching all UUIDs of assets highlighted in interesting moments in curated library", buf, 2u);
          }
          long long v16 = [(PGLongTailSuggester *)self highlightedAssetInternalPredicate];
          v52 = [(PGAbstractSuggester *)self defaultAssetFetchOptionsWithInternalPredicate:v16];

          uint64_t v81 = *MEMORY[0x1E4F394A8];
          long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
          [v52 setFetchPropertySets:v17];

          long long v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
          v80[0] = v18;
          long long v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
          v80[1] = v19;
          uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
          [v52 setSortDescriptors:v20];

          id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          unint64_t v22 = [*(id *)(v87 + 40) count];
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id obj = *(id *)(v87 + 40);
          uint64_t v23 = [obj countByEnumeratingWithState:&v59 objects:v79 count:16];
          if (v23)
          {
            double v25 = 1.0 / (double)v22;
            uint64_t v53 = *(void *)v60;
            double v26 = 0.0;
            *(void *)&long long v24 = 67109378;
            long long v45 = v24;
            while (2)
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v60 != v53) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v28 = *(void *)(*((void *)&v59 + 1) + 8 * i);
                v29 = (void *)MEMORY[0x1D25FED50]();
                if (v4
                  && (double v30 = CFAbsoluteTimeGetCurrent(), v30 - v71[3] >= 0.01)
                  && (v71[3] = v30,
                      char v63 = 0,
                      v50[2](v50, (uint8_t *)&v63, v26 * 0.8 + 0.2),
                      char v31 = *((unsigned char *)v75 + 24) | v63,
                      (*((unsigned char *)v75 + 24) = v31) != 0))
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v45;
                    int v83 = 649;
                    __int16 v84 = 2080;
                    v85 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Suggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  int v32 = 0;
                }
                else
                {
                  v33 = objc_msgSend(MEMORY[0x1E4F38EB8], "fetchAssetsInAssetCollection:options:", v28, v52, v45);
                  long long v57 = 0u;
                  long long v58 = 0u;
                  long long v55 = 0u;
                  long long v56 = 0u;
                  id v34 = v33;
                  uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v78 count:16];
                  if (v35)
                  {
                    uint64_t v36 = *(void *)v56;
                    do
                    {
                      for (uint64_t j = 0; j != v35; ++j)
                      {
                        if (*(void *)v56 != v36) {
                          objc_enumerationMutation(v34);
                        }
                        v38 = [*(id *)(*((void *)&v55 + 1) + 8 * j) uuid];
                        [v21 addObject:v38];
                      }
                      uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v78 count:16];
                    }
                    while (v35);
                  }

                  double v26 = v25 + v26;
                  int v32 = 1;
                }
                if (!v32)
                {
                  int v12 = 1;
                  goto LABEL_49;
                }
              }
              uint64_t v23 = [obj countByEnumeratingWithState:&v59 objects:v79 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          objc_storeStrong(location, v21);
          id obj = oslog;
          if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
          {
            int v44 = [v21 count];
            *(_DWORD *)buf = 67109120;
            int v83 = v44;
            _os_log_debug_impl(&dword_1D1805000, obj, OS_LOG_TYPE_DEBUG, "Long Tail: Fetching all UUIDs of assets highlighted in interesting moments in curated library: %d found", buf, 8u);
          }
          int v12 = 0;
LABEL_49:
        }
      }

      _Block_object_dispose(v86, 8);
      uint64_t v10 = v47;
      p_eligibleAssetUUIDs = (NSArray **)location;
      if (v12)
      {

        goto LABEL_59;
      }
    }
  }
  if (v4)
  {
    double v39 = CFAbsoluteTimeGetCurrent();
    if (v39 - v71[3] >= 0.01)
    {
      v71[3] = v39;
      buf[0] = 0;
      v4[2](v4, buf, 1.0);
      char v40 = *((unsigned char *)v75 + 24) | buf[0];
      *((unsigned char *)v75 + 24) = v40;
      if (v40)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v86 = 67109378;
          *(_DWORD *)&v86[4] = 666;
          LOWORD(v87) = 2080;
          *(void *)((char *)&v87 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Suggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
          uint64_t v7 = MEMORY[0x1E4F14500];
          goto LABEL_58;
        }
LABEL_59:
        v41 = (NSArray *)MEMORY[0x1E4F1CBF0];
        goto LABEL_61;
      }
    }
  }
  v41 = *p_eligibleAssetUUIDs;
LABEL_61:
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);

  return v41;
}

void __55__PGLongTailSuggester__eligibleAssetUUIDsWithProgress___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 graph];
  if (v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__PGLongTailSuggester__eligibleAssetUUIDsWithProgress___block_invoke_2;
    v8[3] = &unk_1E68F03F8;
    id v4 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 72);
    long long v10 = *(_OWORD *)(a1 + 56);
    uint64_t v5 = [v4 allInterestingMomentsFromGraph:v3 progress:v8];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __55__PGLongTailSuggester__eligibleAssetUUIDsWithProgress___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
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

- (id)allInterestingMomentsFromGraph:(id)a3 progress:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _Block_copy(v7);
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v33 = 0;
  id v34 = (double *)&v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  if (v8
    && (double v9 = CFAbsoluteTimeGetCurrent(), v9 - v34[3] >= 0.01)
    && (v34[3] = v9,
        LOBYTE(v32[0]) = 0,
        (*((void (**)(void *, void *, double))v8 + 2))(v8, v32, 0.0),
        char v10 = *((unsigned char *)v38 + 24) | LOBYTE(v32[0]),
        (*((unsigned char *)v38 + 24) = v10) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 0x24504000202;
      LOWORD(v46) = 2080;
      *(void *)((char *)&v46 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Suggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    int v12 = objc_alloc_init(PGNeighborScoreComputer);
    uint64_t buf = 0;
    *(void *)&long long v46 = &buf;
    *((void *)&v46 + 1) = 0x3032000000;
    v47 = __Block_byref_object_copy__26469;
    v48 = __Block_byref_object_dispose__26470;
    id v49 = [MEMORY[0x1E4F1CA80] set];
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v32[3] = 0;
    uint64_t v13 = [v6 momentNodes];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__PGLongTailSuggester_allInterestingMomentsFromGraph_progress___block_invoke;
    v24[3] = &unk_1E68E7C88;
    uint64_t v27 = v32;
    id v14 = v8;
    uint64_t v31 = 0x3F847AE147AE147BLL;
    uint64_t v28 = &v33;
    v29 = &v37;
    id v26 = v14;
    v24[4] = self;
    char v15 = v12;
    double v25 = v15;
    p_uint64_t buf = &buf;
    [v13 enumerateNodesUsingBlock:v24];

    if (*((unsigned char *)v38 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v41 = 67109378;
        int v42 = 595;
        __int16 v43 = 2080;
        int v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v41, 0x12u);
      }
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v16 = *(void *)(v46 + 40);
      long long v17 = [(PGAbstractSuggester *)self session];
      long long v18 = [v17 photoLibrary];
      long long v19 = [v6 momentsForMomentNodes:v16 inPhotoLibrary:v18 sortChronologically:0];

      if (v8
        && (double Current = CFAbsoluteTimeGetCurrent(), Current - v34[3] >= 0.01)
        && (v34[3] = Current,
            char v23 = 0,
            (*((void (**)(id, char *, double))v14 + 2))(v14, &v23, 1.0),
            char v21 = *((unsigned char *)v38 + 24) | v23,
            (*((unsigned char *)v38 + 24) = v21) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int v41 = 67109378;
          int v42 = 599;
          __int16 v43 = 2080;
          int v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v41, 0x12u);
        }
        id v11 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        id v11 = v19;
      }
    }
    _Block_object_dispose(v32, 8);
    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v11;
}

void __63__PGLongTailSuggester_allInterestingMomentsFromGraph_progress___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void *)(v6 + 24);
  *(void *)(v6 + 24) = v7 + 1;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v7, 1) <= 0x1999999999999999uLL
    && *(void *)(a1 + 48)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8),
        Current - *(double *)(v9 + 24) >= *(double *)(a1 + 88))
    && (*(double *)(v9 + 24) = Current,
        (*(void (**)(double))(*(void *)(a1 + 48) + 16))(0.5),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else if ([*(id *)(a1 + 32) isMomentNodeInteresting:v5 withNeighborScoreComputer:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:v5];
  }
}

- (BOOL)isMomentNodeInteresting:(id)a3 withNeighborScoreComputer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isInteresting] & 1) != 0
    || ([v5 isSmartInteresting] & 1) != 0
    || ([v5 isMeaningful] & 1) != 0
    || ([v5 isPartOfTrip] & 1) != 0
    || ([v5 isInterestingForMemories] & 1) != 0)
  {
    BOOL v7 = 1;
  }
  else
  {
    [v6 neighborScoreWithMomentNode:v5];
    BOOL v7 = +[PGGraphMomentNode breakoutOfRoutineTypeWithNeighborScore:"breakoutOfRoutineTypeWithNeighborScore:"] != 0;
  }

  return v7;
}

- (id)highlightedAssetInternalPredicate
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28F60];
  [MEMORY[0x1E4F8E778] legacyAestheticScoreThresholdToBeAestheticallyPrettyGood];
  id v4 = objc_msgSend(v2, "predicateWithFormat:", @"highlightBeingExtendedAssets != nil AND overallAestheticScore >= %f AND (kindSubtype & %d) == 0", v3, 1);
  id v5 = [(id)objc_opt_class() noVideoPredicate];
  id v6 = [(id)objc_opt_class() internalPredicateForProcessedAssetsWithMinimumSceneAnalysisVersion:33];
  BOOL v7 = (void *)MEMORY[0x1E4F28BA0];
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  uint64_t v9 = [v7 andPredicateWithSubpredicates:v8];

  return v9;
}

- (id)_batchOfRandomAssetsWithCount:(unint64_t)a3 progress:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [(PGAbstractSuggester *)self session];
  if (!v7)
  {
    id v11 = 0;
    goto LABEL_51;
  }
  id v8 = (void (**)(void *, unsigned char *, double))_Block_copy(v6);
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  uint64_t v46 = 0;
  v47 = (double *)&v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  if (v8)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v47[3] >= 0.01)
    {
      v47[3] = Current;
      char v45 = 0;
      v8[2](v8, &v45, 0.0);
      char v10 = *((unsigned char *)v51 + 24) | v45;
      *((unsigned char *)v51 + 24) = v10;
      if (v10)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109378;
          int v55 = 508;
          __int16 v56 = 2080;
          long long v57 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v11 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_50;
      }
    }
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __62__PGLongTailSuggester__batchOfRandomAssetsWithCount_progress___block_invoke;
  v40[3] = &unk_1E68F03F8;
  int v12 = v8;
  id v41 = v12;
  int v42 = &v46;
  __int16 v43 = &v50;
  uint64_t v44 = 0x3F847AE147AE147BLL;
  uint64_t v13 = [(PGLongTailSuggester *)self _eligibleAssetUUIDsWithProgress:v40];
  if (*((unsigned char *)v51 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67109378;
      int v55 = 513;
      __int16 v56 = 2080;
      long long v57 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
      id v14 = MEMORY[0x1E4F14500];
LABEL_11:
      _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    if (!v8
      || (double v15 = CFAbsoluteTimeGetCurrent(), v15 - v47[3] < 0.01)
      || (v47[3] = v15,
          char v45 = 0,
          v12[2](v12, &v45, 0.5),
          char v16 = *((unsigned char *)v51 + 24) | v45,
          (*((unsigned char *)v51 + 24) = v16) == 0))
    {
      os_log_t oslog = [v7 loggingConnection];
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_debug_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEBUG, "Long Tail: Selecting random batch of assets", buf, 2u);
      }
      uint64_t v17 = [v13 count];
      if (v17)
      {
        uint64_t v18 = [(PGLongTailSuggester *)self _randomRangeWithLocationUpperBound:v17 maxLength:a3];
        uint64_t v20 = v19;
        if (v8
          && (double v21 = CFAbsoluteTimeGetCurrent(), v21 - v47[3] >= 0.01)
          && (v47[3] = v21,
              char v45 = 0,
              v12[2](v12, &v45, 0.7),
              char v22 = *((unsigned char *)v51 + 24) | v45,
              (*((unsigned char *)v51 + 24) = v22) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v55 = 529;
            __int16 v56 = 2080;
            long long v57 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v11 = (id)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          char v23 = (void *)MEMORY[0x1E4F1CAD0];
          long long v24 = objc_msgSend(v13, "subarrayWithRange:", v18, v20);
          double v25 = [v23 setWithArray:v24];

          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)uint64_t buf = 0;
            _os_log_debug_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_DEBUG, "Long Tail: Fetching selected random batch of assets with curation properties", buf, 2u);
          }
          uint64_t v37 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(uuid IN %@)", v25];
          id v26 = -[PGAbstractSuggester defaultAssetFetchOptionsWithInternalPredicate:](self, "defaultAssetFetchOptionsWithInternalPredicate:");
          uint64_t v27 = +[PGCurationManager assetPropertySetsForCuration];
          [v26 setFetchPropertySets:v27];

          v38 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v26];
          if (v8
            && (double v28 = CFAbsoluteTimeGetCurrent(), v28 - v47[3] >= 0.01)
            && (v47[3] = v28,
                char v45 = 0,
                v12[2](v12, &v45, 0.8),
                char v29 = *((unsigned char *)v51 + 24) | v45,
                (*((unsigned char *)v51 + 24) = v29) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t buf = 67109378;
              int v55 = 542;
              __int16 v56 = 2080;
              long long v57 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Su"
                    "ggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            id v11 = (id)MEMORY[0x1E4F1CBF0];
          }
          else
          {
            double v30 = (void *)MEMORY[0x1E4F38EB8];
            uint64_t v31 = [MEMORY[0x1E4F38EB8] clsPrefetchOptionsForKeyAsset];
            int v32 = [v7 curationContext];
            uint64_t v33 = [v30 clsAllAssetsFromFetchResult:v38 prefetchOptions:v31 curationContext:v32];

            if (v8
              && (double v34 = CFAbsoluteTimeGetCurrent(), v34 - v47[3] >= 0.01)
              && (v47[3] = v34,
                  char v45 = 0,
                  v12[2](v12, &v45, 1.0),
                  char v35 = *((unsigned char *)v51 + 24) | v45,
                  (*((unsigned char *)v51 + 24) = v35) != 0))
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)uint64_t buf = 67109378;
                int v55 = 546;
                __int16 v56 = 2080;
                long long v57 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Suggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              id v11 = (id)MEMORY[0x1E4F1CBF0];
            }
            else
            {
              id v11 = v33;
            }
          }
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Fetch of all highighted assets return empty results.", buf, 2u);
        }
        id v11 = 0;
      }

      goto LABEL_49;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67109378;
      int v55 = 515;
      __int16 v56 = 2080;
      long long v57 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
      id v14 = MEMORY[0x1E4F14500];
      goto LABEL_11;
    }
  }
  id v11 = (id)MEMORY[0x1E4F1CBF0];
LABEL_49:

LABEL_50:
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

LABEL_51:
  return v11;
}

void __62__PGLongTailSuggester__batchOfRandomAssetsWithCount_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
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

- (id)_fetchVerifiedPersonUUIDsByAssetUUIds:(id)a3
{
  id v4 = a3;
  id v5 = [(PGAbstractSuggester *)self session];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 photoLibrary];
    id v8 = [v7 librarySpecificFetchOptions];

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"personForFace.type", -1);
    [v8 setInternalPredicate:v9];

    id v10 = [MEMORY[0x1E4F391F0] fetchVerifiedPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:v4 options:v8];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (unint64_t)_longTailScoreWithAsset:(id)a3 withAdditionalOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isFavorite]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  unint64_t v9 = v8 + [v6 isIncludedInCloudFeeds];
  if ([v6 clsShareCount]) {
    ++v9;
  }
  if ([v6 clsPeopleCount]) {
    ++v9;
  }
  id v10 = [(PGAbstractSuggester *)self session];
  [v10 topTierAestheticScore];
  double v12 = v11;

  if (v12 != 0.0)
  {
    [v6 clsAestheticScore];
    if (v13 >= v12) {
      v9 += [v7 topTierAestheticScoreValue];
    }
  }
  verifiedPersonUUIDsByAssetUUIds = self->_verifiedPersonUUIDsByAssetUUIds;
  double v15 = [v6 uuid];
  char v16 = [(NSDictionary *)verifiedPersonUUIDsByAssetUUIds objectForKeyedSubscript:v15];

  if ([v16 count]) {
    v9 += [v7 verifiedPersonScoreValue];
  }

  return v9;
}

- (id)nextSuggestedAssetWithProgress:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v4 = _Block_copy(v41);
  uint64_t v56 = 0;
  long long v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  uint64_t v52 = 0;
  char v53 = (double *)&v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  if (!v4
    || (double v5 = CFAbsoluteTimeGetCurrent(), v5 - v53[3] < 0.01)
    || (v53[3] = v5,
        char v51 = 0,
        (*((void (**)(void *, char *, double))v4 + 2))(v4, &v51, 0.0),
        char v6 = *((unsigned char *)v57 + 24) | v51,
        (*((unsigned char *)v57 + 24) = v6) == 0))
  {
    ++self->_randomSeed;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __54__PGLongTailSuggester_nextSuggestedAssetWithProgress___block_invoke;
    v46[3] = &unk_1E68F03F8;
    id v8 = v4;
    id v47 = v8;
    uint64_t v48 = &v52;
    uint64_t v49 = &v56;
    uint64_t v50 = 0x3F847AE147AE147BLL;
    unint64_t v9 = [(PGLongTailSuggester *)self _nextCandidateAssetsWithProgress:v46];
    id v10 = v9;
    if (*((unsigned char *)v57 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_17:
        id v7 = 0;
LABEL_18:

        goto LABEL_19;
      }
      *(_DWORD *)uint64_t buf = 67109378;
      int v62 = 394;
      __int16 v63 = 2080;
      v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
      double v11 = MEMORY[0x1E4F14500];
LABEL_10:
      _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_17;
    }
    if (![v9 count]) {
      goto LABEL_17;
    }
    if (v4)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v53[3] >= 0.01)
      {
        v53[3] = Current;
        char v51 = 0;
        (*((void (**)(id, char *, double))v8 + 2))(v8, &v51, 0.2);
        char v13 = *((unsigned char *)v57 + 24) | v51;
        *((unsigned char *)v57 + 24) = v13;
        if (v13)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
            goto LABEL_17;
          }
          *(_DWORD *)uint64_t buf = 67109378;
          int v62 = 401;
          __int16 v63 = 2080;
          v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
          double v11 = MEMORY[0x1E4F14500];
          goto LABEL_10;
        }
      }
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v60 count:16];
    char v40 = v10;
    if (v17)
    {
      uint64_t v18 = *(void *)v43;
      do
      {
        uint64_t v19 = 0;
        uint64_t v20 = v15;
        do
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(v16);
          }
          double v21 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * v19), "uuid", v40, v41, (void)v42);
          id v15 = [v20 arrayByAddingObject:v21];

          ++v19;
          uint64_t v20 = v15;
        }
        while (v17 != v19);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v60 count:16];
      }
      while (v17);
    }

    char v22 = [(PGLongTailSuggester *)self _fetchVerifiedPersonUUIDsByAssetUUIds:v15];
    char v23 = v40;
    verifiedPersonUUIDsByAssetUUIds = self->_verifiedPersonUUIDsByAssetUUIds;
    self->_verifiedPersonUUIDsByAssetUUIds = v22;

    if (v4)
    {
      double v25 = CFAbsoluteTimeGetCurrent();
      if (v25 - v53[3] >= 0.01)
      {
        v53[3] = v25;
        char v51 = 0;
        (*((void (**)(id, char *, double))v8 + 2))(v8, &v51, 0.4);
        char v26 = *((unsigned char *)v57 + 24) | v51;
        *((unsigned char *)v57 + 24) = v26;
        if (v26)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v62 = 410;
            __int16 v63 = 2080;
            v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v7 = 0;
          goto LABEL_66;
        }
      }
    }
    uint64_t v27 = -[PGLongTailSuggester _candidateByAssetUUIDsFromAssets:](self, "_candidateByAssetUUIDsFromAssets:", v16, v40);
    if (v4)
    {
      double v28 = CFAbsoluteTimeGetCurrent();
      if (v28 - v53[3] >= 0.01)
      {
        v53[3] = v28;
        char v51 = 0;
        (*((void (**)(id, char *, double))v8 + 2))(v8, &v51, 0.6);
        char v29 = *((unsigned char *)v57 + 24) | v51;
        *((unsigned char *)v57 + 24) = v29;
        if (v29)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v62 = 415;
            __int16 v63 = 2080;
            v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v7 = 0;
          goto LABEL_65;
        }
      }
    }
    double v30 = [(PGLongTailSuggester *)self _bestAssetUUIDsFromCandidates:v27 percentile:[(PGLongTailAdditionalOptions *)self->_additionalOptions qualityPercentile]];
    if (![v30 count]) {
      goto LABEL_47;
    }
    if (v4)
    {
      double v31 = CFAbsoluteTimeGetCurrent();
      if (v31 - v53[3] >= 0.01)
      {
        v53[3] = v31;
        char v51 = 0;
        (*((void (**)(id, char *, double))v8 + 2))(v8, &v51, 0.8);
        char v32 = *((unsigned char *)v57 + 24) | v51;
        *((unsigned char *)v57 + 24) = v32;
        if (v32)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v62 = 424;
            __int16 v63 = 2080;
            v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_47:
          id v7 = 0;
LABEL_64:

LABEL_65:
LABEL_66:

          id v10 = v23;
          goto LABEL_18;
        }
      }
    }
    uint64_t v33 = [(PGLongTailSuggester *)self _assetUUIDByWeightedProbablisticSamplingFromAssetUUIDS:v30 weights:v27];
    if (v33)
    {
      if (!v4
        || (double v34 = CFAbsoluteTimeGetCurrent(), v34 - v53[3] < 0.01)
        || (v53[3] = v34,
            char v51 = 0,
            (*((void (**)(id, char *, double))v8 + 2))(v8, &v51, 0.9),
            char v35 = *((unsigned char *)v57 + 24) | v51,
            (*((unsigned char *)v57 + 24) = v35) == 0))
      {
        uint64_t v36 = [v27 objectForKeyedSubscript:v33];
        uint64_t v37 = [v36 asset];
        [(NSMutableSet *)self->_suggestedAssetsFromPreviousBatch addObject:v37];
        ++self->_numberOfGeneratedSuggestions;
        if (v4
          && (double v38 = CFAbsoluteTimeGetCurrent(), v38 - v53[3] >= 0.01)
          && (v53[3] = v38,
              char v51 = 0,
              (*((void (**)(id, char *, double))v8 + 2))(v8, &v51, 1.0),
              char v39 = *((unsigned char *)v57 + 24) | v51,
              (*((unsigned char *)v57 + 24) = v39) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v62 = 442;
            __int16 v63 = 2080;
            v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v7 = 0;
        }
        else
        {
          id v7 = v37;
        }

        goto LABEL_63;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        int v62 = 433;
        __int16 v63 = 2080;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    id v7 = 0;
LABEL_63:

    goto LABEL_64;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    int v62 = 386;
    __int16 v63 = 2080;
    v64 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestions/"
          "Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v7 = 0;
LABEL_19:
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  return v7;
}

void __54__PGLongTailSuggester_nextSuggestedAssetWithProgress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
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

- (id)_nextCandidateAssetsWithProgress:(id)a3
{
  id v4 = a3;
  [(NSMutableSet *)self->_candidateAssetsFromPreviousBatch minusSet:self->_suggestedAssetsFromPreviousBatch];
  if ([(PGLongTailSuggester *)self _shouldUsePreviousBatchOfCandidateAssets])
  {
    double v5 = [(NSMutableSet *)self->_candidateAssetsFromPreviousBatch allObjects];
  }
  else
  {
    double v5 = [(PGLongTailSuggester *)self _batchOfRandomAssetsWithCount:200 progress:v4];
    char v6 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v5];
    candidateAssetsFromPreviousBatch = self->_candidateAssetsFromPreviousBatch;
    self->_candidateAssetsFromPreviousBatch = v6;

    id v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    suggestedAssetsFromPreviousBatch = self->_suggestedAssetsFromPreviousBatch;
    self->_suggestedAssetsFromPreviousBatch = v8;
  }
  return v5;
}

- (BOOL)_shouldUsePreviousBatchOfCandidateAssets
{
  LODWORD(v3) = [(PGAbstractSuggester *)self lastSuggestionWasColliding];
  if (v3)
  {
    uint64_t v3 = [(NSMutableSet *)self->_candidateAssetsFromPreviousBatch count];
    if (v3) {
      LOBYTE(v3) = (unint64_t)[(NSMutableSet *)self->_suggestedAssetsFromPreviousBatch count] < 0x14;
    }
  }
  return v3;
}

- (void)reset
{
  uint64_t v3 = [(PGAbstractSuggester *)self session];
  id v4 = [v3 loggingConnection];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v11 = 0;
    _os_log_debug_impl(&dword_1D1805000, v4, OS_LOG_TYPE_DEBUG, "Long Tail Suggester: Resetting", v11, 2u);
  }

  [(PGAbstractSuggester *)self setLastSuggestionWasColliding:0];
  double v5 = [(PGSuggestionOptions *)self->_options localToday];
  [v5 timeIntervalSince1970];
  self->_randomSeed = v6;

  self->_numberOfGeneratedSuggestions = 0;
  uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  suggestedAssetsFromPreviousBatch = self->_suggestedAssetsFromPreviousBatch;
  self->_suggestedAssetsFromPreviousBatch = v7;

  unint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  candidateAssetsFromPreviousBatch = self->_candidateAssetsFromPreviousBatch;
  self->_candidateAssetsFromPreviousBatch = v9;
}

- (id)nextSuggestionWithProgress:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_numberOfGeneratedSuggestions < 0x65)
  {
    double v6 = [(PGAbstractSuggester *)self session];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = [v6 loggingConnection];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v15) = 0;
        _os_log_debug_impl(&dword_1D1805000, v8, OS_LOG_TYPE_DEBUG, "Long Tail Suggester: nextSuggestion", (uint8_t *)&v15, 2u);
      }
      unint64_t v9 = [(PGLongTailSuggester *)self nextSuggestedAssetWithProgress:v4];
      if (v9
        && (id v10 = [[PGSingleAssetSuggestion alloc] initWithType:5 subtype:502 asset:v9]) != 0)
      {
        double v5 = v10;
        if ([(PGSuggestionOptions *)self->_options computeReasons])
        {
          double v11 = [(PGLongTailSuggester *)self reasonsForSuggestion:v5];
          [(PGSingleAssetSuggestion *)v5 setReasons:v11];
        }
        double v12 = v8;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          id v14 = [(PGSingleAssetSuggestion *)v5 reasons];
          int v15 = 138478083;
          id v16 = v5;
          __int16 v17 = 2112;
          uint64_t v18 = v14;
          _os_log_debug_impl(&dword_1D1805000, v12, OS_LOG_TYPE_DEBUG, "Long Tail Suggester: Suggesting %{private}@ with reasons: %@", (uint8_t *)&v15, 0x16u);
        }
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v15) = 0;
          _os_log_debug_impl(&dword_1D1805000, v8, OS_LOG_TYPE_DEBUG, "Long Tail Suggester: Nothing to suggest", (uint8_t *)&v15, 2u);
        }
        double v5 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        LOWORD(v15) = 0;
        _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Long Tail Suggester: Needs a session!", (uint8_t *)&v15, 2u);
      }
      double v5 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Long Tail Suggester: All suggestion trials have been used.", (uint8_t *)&v15, 2u);
    }
    double v5 = 0;
  }

  return v5;
}

- (void)startSuggestingWithOptions:(id)a3
{
  id v4 = (PGSuggestionOptions *)a3;
  double v5 = [(PGAbstractSuggester *)self session];
  double v6 = [v5 loggingConnection];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_debug_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEBUG, "Long Tail Suggester: Starting suggestion", buf, 2u);
  }

  [(PGAbstractSuggester *)self setLastSuggestionWasColliding:0];
  options = self->_options;
  self->_options = v4;
  id v8 = v4;

  unint64_t v9 = [(PGSuggestionOptions *)self->_options maximumNumberOfSuggestions];
  if (v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = -1;
  }
  self->_maximumNumberOfSuggestions = v10;
  self->_numberOfGeneratedSuggestions = 0;
  double v11 = [(PGSuggestionOptions *)v8 localToday];
  [v11 timeIntervalSince1970];
  self->_randomSeed = v12;

  char v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  suggestedAssetsFromPreviousBatch = self->_suggestedAssetsFromPreviousBatch;
  self->_suggestedAssetsFromPreviousBatch = v13;

  int v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  candidateAssetsFromPreviousBatch = self->_candidateAssetsFromPreviousBatch;
  self->_candidateAssetsFromPreviousBatch = v15;

  __int16 v17 = [PGLongTailAdditionalOptions alloc];
  uint64_t v18 = [(PGSuggestionOptions *)v8 additionalOptions];
  uint64_t v19 = [(PGLongTailAdditionalOptions *)v17 initWithDictionary:v18];
  additionalOptions = self->_additionalOptions;
  self->_additionalOptions = v19;

  double v21 = [v5 workingContext];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __50__PGLongTailSuggester_startSuggestingWithOptions___block_invoke;
  v22[3] = &unk_1E68F0848;
  v22[4] = self;
  [v21 performSynchronousConcurrentGraphReadUsingBlock:v22];
}

void __50__PGLongTailSuggester_startSuggestingWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 graph];
  [v2 captureInformationFromGraph:v3];
}

- (void)captureInformationFromGraph:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 meNodeWithFallbackInferredMeNode];
  double v5 = [v4 localIdentifier];
  meNodeLocalIdentifier = self->_meNodeLocalIdentifier;
  self->_meNodeLocalIdentifier = v5;

  uint64_t v7 = [(PGAbstractSuggester *)self session];
  id v8 = [v7 loggingConnection];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v9 = self->_meNodeLocalIdentifier;
    int v10 = 138412290;
    double v11 = v9;
    _os_log_debug_impl(&dword_1D1805000, v8, OS_LOG_TYPE_DEBUG, "Long Tail: meNode local identifier is: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (BOOL)canGenerateSuggestionWithAsset:(id)a3 onDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PGAbstractSuggester *)self session];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  unint64_t v9 = [v8 photoLibrary];
  int v10 = [v8 workingContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__PGLongTailSuggester_canGenerateSuggestionWithAsset_onDate___block_invoke;
  v14[3] = &unk_1E68EF5F0;
  v14[4] = self;
  id v11 = v6;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  __int16 v17 = &v18;
  [v10 performSynchronousConcurrentGraphReadUsingBlock:v14];

  LOBYTE(v10) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v10;
}

void __61__PGLongTailSuggester_canGenerateSuggestionWithAsset_onDate___block_invoke(uint64_t a1, void *a2)
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  [*(id *)(a1 + 32) captureInformationFromGraph:v3];
  id v4 = [*(id *)(a1 + 32) highlightedAssetInternalPredicate];
  double v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [*(id *)(a1 + 40) uuid];
  id v7 = [v5 predicateWithFormat:@"uuid == %@", v6];

  id v8 = (void *)MEMORY[0x1E4F28BA0];
  v40[0] = v4;
  v40[1] = v7;
  unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  int v10 = [v8 andPredicateWithSubpredicates:v9];

  id v11 = [*(id *)(a1 + 32) defaultAssetFetchOptionsWithInternalPredicate:v10];
  id v12 = +[PGCurationManager assetPropertySetsForCuration];
  [v11 setFetchPropertySets:v12];

  [v11 setFetchLimit:1];
  char v13 = (void *)MEMORY[0x1E4F38EB8];
  id v14 = [*(id *)(a1 + 40) uuid];
  char v39 = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  id v16 = [v13 fetchAssetsWithUUIDs:v15 options:v11];

  if ([v16 count])
  {
    uint64_t v36 = v7;
    uint64_t v37 = v4;
    uint64_t v17 = [*(id *)(a1 + 48) librarySpecificFetchOptions];
    uint64_t v18 = (void *)MEMORY[0x1E4F391A0];
    uint64_t v19 = [*(id *)(a1 + 40) uuid];
    double v38 = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    char v35 = (void *)v17;
    char v21 = [v18 fetchMomentUUIDByAssetUUIDForAssetUUIDs:v20 options:v17];
    char v22 = [v21 allValues];
    char v23 = [v22 firstObject];

    if (v23)
    {
      long long v24 = objc_alloc_init(PGNeighborScoreComputer);
      double v25 = +[PGGraphMomentNodeCollection momentNodeForUUID:v23 inGraph:v3];
      char v26 = [v25 anyNode];

      if (v26
        && [*(id *)(a1 + 32) isMomentNodeInteresting:v26 withNeighborScoreComputer:v24])
      {
        double v34 = v24;
        uint64_t v27 = (void *)MEMORY[0x1E4F38EB8];
        uint64_t v28 = [MEMORY[0x1E4F38EB8] clsPrefetchOptionsForKeyAsset];
        uint64_t v33 = [*(id *)(a1 + 32) session];
        char v29 = [v33 curationContext];
        double v30 = [v27 clsAllAssetsFromFetchResult:v16 prefetchOptions:v28 curationContext:v29];
        double v31 = [v30 firstObject];

        if (v31)
        {
          char v32 = -[PGLongTailSuggestionCandidate initWithAsset:score:]([PGLongTailSuggestionCandidate alloc], "initWithAsset:score:", v31, [*(id *)(a1 + 32) _longTailScoreWithAsset:v31 withAdditionalOptions:*(void *)(*(void *)(a1 + 32) + 56)]);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [(PGLongTailSuggestionCandidate *)v32 isValidWithMeNodeLocalIdentifier:*(void *)(*(void *)(a1 + 32) + 120)];
        }
        long long v24 = v34;
      }
    }
    id v7 = v36;
    id v4 = v37;
  }
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id aBlock = a4;
  uint64_t v27 = [(PGAbstractSuggester *)self session];
  if (v27)
  {
    id v6 = _Block_copy(aBlock);
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = (double *)&v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0;
    if (v6
      && (double v7 = CFAbsoluteTimeGetCurrent(), v7 - v37[3] >= 0.01)
      && (v37[3] = v7,
          char v35 = 0,
          (*((void (**)(void *, char *, double))v6 + 2))(v6, &v35, 0.0),
          char v8 = *((unsigned char *)v41 + 24) | v35,
          (*((unsigned char *)v41 + 24) = v8) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        int v45 = 192;
        __int16 v46 = 2080;
        id v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggesti"
              "ons/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v9 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      [(PGLongTailSuggester *)self startSuggestingWithOptions:v25];
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v10 = 0;
      double v11 = 1.0 / (double)self->_maximumNumberOfSuggestions;
      double v12 = 0.0;
      char v13 = MEMORY[0x1E4F14500];
      while (v10 < self->_maximumNumberOfSuggestions)
      {
        id v14 = (void *)MEMORY[0x1D25FED50]();
        if (v6
          && (double Current = CFAbsoluteTimeGetCurrent(), Current - v37[3] >= 0.01)
          && (v37[3] = Current,
              char v35 = 0,
              (*((void (**)(void *, char *, double))v6 + 2))(v6, &v35, v12),
              char v16 = *((unsigned char *)v41 + 24) | v35,
              (*((unsigned char *)v41 + 24) = v16) != 0))
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v45 = 202;
            __int16 v46 = 2080;
            id v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugg"
                  "estions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
            _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          int v17 = 1;
        }
        else
        {
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __55__PGLongTailSuggester_suggestionsWithOptions_progress___block_invoke;
          v28[3] = &unk_1E68ECB50;
          id v29 = v6;
          double v30 = &v36;
          double v33 = v12;
          double v34 = v11;
          uint64_t v32 = 0x3F847AE147AE147BLL;
          double v31 = &v40;
          uint64_t v18 = [(PGLongTailSuggester *)self nextSuggestionWithProgress:v28];
          uint64_t v19 = (void *)v18;
          if (*((unsigned char *)v41 + 24))
          {
            int v17 = 1;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t buf = 67109378;
              int v45 = 207;
              __int16 v46 = 2080;
              id v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Su"
                    "ggestions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
              _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
          else if (v18)
          {
            [v24 addObject:v18];
            int v17 = 0;
            ++v10;
            double v12 = v11 + v12;
          }
          else
          {
            int v17 = 3;
          }
        }
        if (v17)
        {
          if (v17 != 3)
          {
            id v9 = (id)MEMORY[0x1E4F1CBF0];
            uint64_t v20 = v24;
            goto LABEL_34;
          }
          break;
        }
      }
      uint64_t v20 = v24;
      if (v6
        && (double v21 = CFAbsoluteTimeGetCurrent(), v21 - v37[3] >= 0.01)
        && (v37[3] = v21,
            char v35 = 0,
            (*((void (**)(void *, char *, double))v6 + 2))(v6, &v35, 1.0),
            char v22 = *((unsigned char *)v41 + 24) | v35,
            (*((unsigned char *)v41 + 24) = v22) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109378;
          int v45 = 217;
          __int16 v46 = 2080;
          id v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Long Tail Suggester/PGLongTailSuggester.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v9 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        id v9 = v24;
      }
LABEL_34:
    }
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

void __55__PGLongTailSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
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

+ (unint64_t)randomIntegerWithUpperBound:(unint64_t)a3 seed:(unsigned int)a4
{
  return rand() % a3;
}

+ (id)suggestionSubtypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:502];
}

+ (id)suggestionTypes
{
  return (id)[MEMORY[0x1E4F28D60] indexSetWithIndex:5];
}

@end