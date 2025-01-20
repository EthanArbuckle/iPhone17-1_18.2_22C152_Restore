@interface PLInitialSuggestionRanker
+ (BOOL)_candidateHasLastUsedDateOfToday:(id)a3 calendar:(id)a4 todayDateComponents:(id)a5 calendarUnits:(unint64_t)a6;
+ (id)_candidateBucketsForCandidates:(id)a3 suggestionLimit:(unint64_t)a4 maxNumberOfSuggestionsPerContentType:(unint64_t)a5 locale:(id)a6;
+ (id)rankSearchSuggestionCandidates:(id)a3 suggestionLimit:(unint64_t)a4 maxNumberOfSuggestionsPerContentType:(unint64_t)a5 locale:(id)a6;
+ (id)trimmedListCandidatesOfCandidatesFromCandidates:(id)a3 maxNumberOfSuggestionsPerContentType:(unint64_t)a4 locale:(id)a5;
+ (unint64_t)candidateSimilarityToOtherCandidate:(id)a3 otherCandidate:(id)a4;
+ (void)_populateBuckets:(id)a3 candidates:(id)a4 shouldTryToExcludeCandidatesUsedToday:(BOOL)a5 suggestionLimit:(unint64_t)a6 locale:(id)a7;
@end

@implementation PLInitialSuggestionRanker

+ (void)_populateBuckets:(id)a3 candidates:(id)a4 shouldTryToExcludeCandidatesUsedToday:(BOOL)a5 suggestionLimit:(unint64_t)a6 locale:(id)a7
{
  BOOL v9 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  if (v9) {
    unint64_t v14 = [v12 count] - a6;
  }
  else {
    unint64_t v14 = 0;
  }
  v15 = (void *)MEMORY[0x1E4F1C9A8];
  v33 = v13;
  v16 = [v13 calendarIdentifier];
  v17 = [v15 calendarWithIdentifier:v16];

  [MEMORY[0x1E4F1C9C8] date];
  v32 = v36 = v17;
  v35 = objc_msgSend(v17, "components:fromDate:", 28);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v24 = [v23 suggestionTemplate];
        uint64_t v25 = [v24 templateContentType];

        v26 = [NSNumber numberWithUnsignedInteger:v25];
        v27 = [v11 objectForKeyedSubscript:v26];

        if (v27)
        {
          [v23 timeSinceLastUsed];
          BOOL v29 = v28 == 0.0 || v14 == 0;
          if (v29
            || ([a1 _candidateHasLastUsedDateOfToday:v23 calendar:v36 todayDateComponents:v35 calendarUnits:28] & 1) == 0)
          {
            [v27 addObject:v23];
          }
          else
          {
            v30 = PLSearchBackendInitialSuggestionsGetLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v42 = (uint64_t)v23;
              _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "Excluding candidate %@ from initial suggestions because it was already used today.", buf, 0xCu);
            }
            --v14;
          }
        }
        else
        {
          v31 = PLSearchBackendInitialSuggestionsGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v42 = v25;
            _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "Missing bucket for content type %tu during initial suggestion ranking, no suggestions for this content type will be generated.", buf, 0xCu);
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v20);
  }
}

+ (id)_candidateBucketsForCandidates:(id)a3 suggestionLimit:(unint64_t)a4 maxNumberOfSuggestionsPerContentType:(unint64_t)a5 locale:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v30 = a6;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v29 = v10;
  unint64_t v12 = [v10 count];
  for (uint64_t i = 1; i != 10; ++i)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15 = [NSNumber numberWithUnsignedInteger:i];
    [v31 setObject:v14 forKeyedSubscript:v15];
  }
  [a1 _populateBuckets:v31 candidates:v29 shouldTryToExcludeCandidatesUsedToday:v12 > a4 suggestionLimit:a4 locale:v30];
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  if (v12 > a4)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __120__PLInitialSuggestionRanker__candidateBucketsForCandidates_suggestionLimit_maxNumberOfSuggestionsPerContentType_locale___block_invoke;
    v37[3] = &unk_1E5875C48;
    v37[4] = &v38;
    [v31 enumerateKeysAndObjectsUsingBlock:v37];
    if (v39[3] < a4)
    {
      [v31 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_115484];
      [a1 _populateBuckets:v31 candidates:v29 shouldTryToExcludeCandidatesUsedToday:0 suggestionLimit:a4 locale:v30];
    }
  }
  uint64_t v16 = 9;
  do
  {
    v17 = [NSNumber numberWithUnsignedInteger:v16];
    id v18 = [v31 objectForKeyedSubscript:v17];

    if ([v18 count]) {
      [v11 addObject:v18];
    }

    --v16;
  }
  while (v16);
  long long v35 = 0u;
  long long v36 = 0u;
  if (a5) {
    unint64_t v19 = a5;
  }
  else {
    unint64_t v19 = 25;
  }
  long long v33 = 0uLL;
  long long v34 = 0uLL;
  obuint64_t j = v11;
  uint64_t v20 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timeSinceLastUsed" ascending:1];
        v42[0] = v24;
        uint64_t v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"rankingScore" ascending:0];
        v42[1] = v25;
        v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
        [v23 sortUsingDescriptors:v26];

        if ([v23 count] > v19)
        {
          v27 = objc_msgSend(v23, "subarrayWithRange:", 0, v19);
          [v23 removeAllObjects];
          [v23 addObjectsFromArray:v27];
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v20);
  }

  _Block_object_dispose(&v38, 8);
  return obj;
}

uint64_t __120__PLInitialSuggestionRanker__candidateBucketsForCandidates_suggestionLimit_maxNumberOfSuggestionsPerContentType_locale___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

uint64_t __120__PLInitialSuggestionRanker__candidateBucketsForCandidates_suggestionLimit_maxNumberOfSuggestionsPerContentType_locale___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeAllObjects];
}

+ (BOOL)_candidateHasLastUsedDateOfToday:(id)a3 calendar:(id)a4 todayDateComponents:(id)a5 calendarUnits:(unint64_t)a6
{
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a4;
  [a3 timeSinceLastUsed];
  unint64_t v12 = objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
  id v13 = [v11 components:a6 fromDate:v12];

  uint64_t v14 = [v13 month];
  BOOL v17 = 0;
  if (v14 == [v9 month])
  {
    uint64_t v15 = [v13 day];
    if (v15 == [v9 day])
    {
      uint64_t v16 = [v13 year];
      if (v16 == [v9 year]) {
        BOOL v17 = 1;
      }
    }
  }

  return v17;
}

+ (id)trimmedListCandidatesOfCandidatesFromCandidates:(id)a3 maxNumberOfSuggestionsPerContentType:(unint64_t)a4 locale:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = [a1 _candidateBucketsForCandidates:a3 suggestionLimit:-1 maxNumberOfSuggestionsPerContentType:a4 locale:a5];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addObjectsFromArray:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  unint64_t v12 = (void *)[v6 copy];
  return v12;
}

+ (unint64_t)candidateSimilarityToOtherCandidate:(id)a3 otherCandidate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 suggestionTemplate];
  uint64_t v8 = [v6 suggestionTemplate];
  uint64_t v9 = [v7 suggestionTemplateKey];
  uint64_t v44 = [v8 suggestionTemplateKey];
  v45 = v9;
  if (objc_msgSend(v9, "isEqualToString:")) {
    uint64_t v10 = 16;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [v7 templateType];
  unint64_t v12 = v10 | (v11 == [v8 templateType]);
  uint64_t v13 = [v7 templateDateType];
  uint64_t v14 = [v8 templateDateType];
  if (v13 != v14 || (v13 | v14) == 0) {
    unint64_t v16 = v12;
  }
  else {
    unint64_t v16 = v12 | 4;
  }
  long long v17 = [v5 firstGroup];
  uint64_t v18 = [v17 groupId];

  uint64_t v19 = [v5 secondGroup];
  uint64_t v20 = [v19 groupId];

  uint64_t v21 = [v6 firstGroup];
  uint64_t v22 = [v21 groupId];

  v23 = [v6 secondGroup];
  uint64_t v24 = [v23 groupId];

  if (v18 | v22 && v18 == v22
    || (v20 | v22 ? (BOOL v25 = v20 == v22) : (BOOL v25 = 0),
        !v25 ? (int v26 = 0) : (int v26 = 1),
        v18 | v24 ? (BOOL v27 = v18 == v24) : (BOOL v27 = 0),
        !v27 ? (char v28 = 0) : (char v28 = 1),
        v20 == v24 ? (BOOL v29 = (v20 | v24) == 0) : (BOOL v29 = 1),
        !v29 || (v28 & 1) != 0 || v26))
  {
    v16 |= 8uLL;
  }
  id v30 = [v5 firstGroup];
  uint64_t v31 = [v30 searchIndexingCategory];

  v32 = [v5 secondGroup];
  uint64_t v33 = [v32 searchIndexingCategory];

  long long v34 = [v6 firstGroup];
  uint64_t v35 = [v34 searchIndexingCategory];

  long long v36 = [v6 secondGroup];
  uint64_t v37 = [v36 searchIndexingCategory];

  if (v31 | v35 && v31 == v35
    || (v33 | v35 ? (BOOL v38 = v33 == v35) : (BOOL v38 = 0),
        !v38 ? (int v39 = 0) : (int v39 = 1),
        v31 | v37 ? (BOOL v40 = v31 == v37) : (BOOL v40 = 0),
        !v40 ? (char v41 = 0) : (char v41 = 1),
        v33 == v37 ? (BOOL v42 = (v33 | v37) == 0) : (BOOL v42 = 1),
        !v42 || (v41 & 1) != 0 || v39))
  {
    v16 |= 2uLL;
  }

  return v16;
}

+ (id)rankSearchSuggestionCandidates:(id)a3 suggestionLimit:(unint64_t)a4 maxNumberOfSuggestionsPerContentType:(unint64_t)a5 locale:(id)a6
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v65 = a6;
  if (!v65)
  {
    v61 = [MEMORY[0x1E4F28B00] currentHandler];
    [v61 handleFailureInMethod:a2, a1, @"PLInitialSuggestionRanker.m", 22, @"Invalid parameter not satisfying: %@", @"locale" object file lineNumber description];
  }
  v66 = v10;
  if ([v10 count])
  {
    PLPhotosSearchGetLog();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v12 = os_signpost_id_generate(v11);

    uint64_t v13 = v11;
    uint64_t v14 = v13;
    unint64_t v63 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLSearchBackendInitialSuggestionIndexRankingSignpost", "", buf, 2u);
    }
    os_signpost_id_t spid = v12;
    v64 = v14;

    id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v74 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [a1 _candidateBucketsForCandidates:v10 suggestionLimit:a4 maxNumberOfSuggestionsPerContentType:a5 locale:v65];
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v16 = 0;
    uint64_t v17 = [v15 countByEnumeratingWithState:&v81 objects:v92 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v82 != v18) {
            objc_enumerationMutation(v15);
          }
          unint64_t v20 = [*(id *)(*((void *)&v81 + 1) + 8 * i) count];
          if (v16 <= v20) {
            unint64_t v16 = v20;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v81 objects:v92 count:16];
      }
      while (v17);
    }

    unint64_t v21 = 2 * [v15 count];
    if (v21 < a4)
    {
      uint64_t v22 = PLSearchBackendInitialSuggestionsGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        unint64_t v86 = v21;
        __int16 v87 = 2112;
        uint64_t v88 = (uint64_t)v15;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Adjusting suggestion limit to %tu due to limited initial suggestion candidates: %@.", buf, 0x16u);
      }

      a4 = v21;
    }
    unint64_t v23 = [v66 count];
    unint64_t v24 = 0;
    char v68 = 0;
    uint64_t v71 = 0;
    unint64_t v72 = 0;
    uint64_t v25 = 0;
    if (a4 >= v23) {
      unint64_t v26 = v23;
    }
    else {
      unint64_t v26 = a4;
    }
    unint64_t v70 = v26;
    unint64_t v67 = v16 - 1;
    double v27 = 0.0;
    uint64_t v75 = -1;
    unint64_t v76 = 0;
LABEL_24:
    if (!(([v73 count] >= v70) | v68 & 1))
    {
      char v68 = 0;
      for (unint64_t j = 0; ; ++j)
      {
        if (j >= [v15 count]) {
          goto LABEL_24;
        }
        BOOL v29 = [v15 objectAtIndexedSubscript:j];
        if (v76 >= [v29 count])
        {
          ++v25;
          goto LABEL_51;
        }
        id v30 = objc_msgSend(v29, "objectAtIndexedSubscript:");
        if ([v74 containsObject:v30])
        {
          uint64_t v31 = PLSearchBackendInitialSuggestionsGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            unint64_t v86 = (unint64_t)v30;
            __int16 v87 = 2112;
            uint64_t v88 = (uint64_t)v73;
            _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "Unexpectedly found duplicate candidate suggestions, discarding candidate: %@, for ranked candidates: %@", buf, 0x16u);
          }

          ++v25;
          goto LABEL_50;
        }
        if ([v73 count]) {
          break;
        }
        [v73 addObject:v30];
        [v74 addObject:v30];
        ++v71;
LABEL_50:

LABEL_51:
        if (j == [v15 count] - 1)
        {
          if (v75 == -1)
          {
            char v45 = 0;
          }
          else
          {
            v43 = objc_msgSend(v15, "objectAtIndexedSubscript:");
            uint64_t v44 = [v43 objectAtIndexedSubscript:v76];
            if (([v74 containsObject:v44] & 1) != 0 || objc_msgSend(v73, "count") >= v70)
            {
              char v45 = 0;
            }
            else
            {
              [v73 addObject:v44];
              [v74 addObject:v44];
              ++v71;
              char v45 = 1;
            }
          }
          uint64_t v46 = [v15 count];
          double v27 = 0.0;
          if ((v45 & 1) == 0 && (v46 == v25 || v71 == v46 - v25))
          {
            unint64_t v24 = 0;
            if (v76 >= v67)
            {
              unint64_t v72 = 0;
              uint64_t v25 = 0;
              char v68 = 1;
            }
            else
            {
              uint64_t v71 = 0;
              unint64_t v72 = 0;
              uint64_t v25 = 0;
              ++v76;
            }
          }
          else
          {
            unint64_t v24 = 0;
            unint64_t v72 = 0;
            uint64_t v25 = 0;
          }
          uint64_t v75 = -1;
        }
      }
      v32 = [v73 lastObject];
      unint64_t v33 = [a1 candidateSimilarityToOtherCandidate:v30 otherCandidate:v32];
      long long v34 = [v30 suggestionTemplate];
      [v30 timeSinceLastUsed];
      if (v75 == -1)
      {
        unint64_t v24 = [v34 templateContentType];
        [v30 timeSinceLastUsed];
        double v27 = v39;
      }
      else
      {
        double v36 = v35;
        if (v72 != v33 && v33 > 1)
        {
          if (v72 >= v33) {
            unint64_t v37 = v33;
          }
          else {
            unint64_t v37 = v72;
          }
          if (v33 <= v72)
          {
            unint64_t v24 = [v34 templateContentType];
            [v30 timeSinceLastUsed];
            double v27 = v38;
            uint64_t v75 = j;
          }
          unint64_t v72 = v37;
          goto LABEL_49;
        }
        unint64_t v40 = [v34 templateContentType];
        unint64_t v41 = v40;
        if (v36 >= v27 && v40 <= v24)
        {
LABEL_49:

          goto LABEL_50;
        }
        [v30 timeSinceLastUsed];
        double v27 = v42;
        unint64_t v24 = v41;
      }
      uint64_t v75 = j;
      unint64_t v72 = v33;
      goto LABEL_49;
    }
    v47 = [MEMORY[0x1E4F1C9C8] date];
    [v47 timeIntervalSince1970];
    double v49 = v48;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v50 = v73;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v77 objects:v91 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v78;
      do
      {
        for (uint64_t k = 0; k != v51; ++k)
        {
          if (*(void *)v78 != v52) {
            objc_enumerationMutation(v50);
          }
          [*(id *)(*((void *)&v77 + 1) + 8 * k) setTimeSinceLastUsed:v49];
        }
        uint64_t v51 = [v50 countByEnumeratingWithState:&v77 objects:v91 count:16];
      }
      while (v51);
    }

    v54 = v64;
    v55 = v54;
    if (v63 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v54))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v55, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendInitialSuggestionIndexRankingSignpost", "", buf, 2u);
    }

    v56 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v57 = [v50 count];
      uint64_t v58 = [v66 count];
      *(_DWORD *)buf = 134218498;
      unint64_t v86 = v57;
      __int16 v87 = 2048;
      uint64_t v88 = v58;
      __int16 v89 = 2112;
      id v90 = v73;
      _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_DEFAULT, "Returning %tu initial suggestions after ranking from %tu candidates: %@", buf, 0x20u);
    }

    v59 = (void *)[v50 copy];
  }
  else
  {
    v59 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v59;
}

@end