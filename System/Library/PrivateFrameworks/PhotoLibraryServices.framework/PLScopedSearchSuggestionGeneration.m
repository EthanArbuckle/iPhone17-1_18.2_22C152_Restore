@interface PLScopedSearchSuggestionGeneration
+ (double)_averageGroupRankingScoreForSuggestion:(id)a3;
+ (double)_percentOverlapWithCompletionText:(id)a3 suggestionQuery:(id)a4 minPercentOverlapForPrioritization:(double)a5;
+ (double)_scoreForSuggestion:(id)a3 queryAssetCount:(unint64_t)a4 queryCollectionCount:(unint64_t)a5;
+ (double)initialSuggestionScoreForIndexCategory:(unint64_t)a3;
+ (double)suggestionScoreForIndexCategory:(unint64_t)a3;
+ (id)_orderedSuggestionCategoryTypes;
+ (id)_rankedSearchSuggestionsFromSuggestions:(id)a3 queryAssetCount:(unint64_t)a4 queryCollectionCount:(unint64_t)a5 suggestionType:(unint64_t)a6 suggestionQuery:(id)a7;
+ (id)_rankedSuggestionsFromSuggestions:(id)a3 queryAssetCount:(unint64_t)a4 queryCollectionCount:(unint64_t)a5;
+ (id)_suggestionsOrderedUserCategories;
+ (id)generateCompletionSuggestionsFromGroups:(id)a3 queryMatchedScopedAssetIds:(__CFArray *)a4 queryMatchedScopedCollectionIds:(__CFArray *)a5 searchResultTypes:(unint64_t)a6 normalizedSearchText:(id)a7 delegate:(id)a8;
+ (id)generateNextTermSuggestionsForQueryMatchedScopedAssetIds:(__CFArray *)a3 queryMatchedScopedCollectionIds:(__CFArray *)a4 searchResultTypes:(unint64_t)a5 delegate:(id)a6;
+ (id)rankedSearchSuggestionsFromSuggestionCandidates:(id)a3 suggestionType:(unint64_t)a4 queryAssetCount:(unint64_t)a5 queryCollectionCount:(unint64_t)a6 suggestionLimit:(unint64_t)a7 suggestionQuery:(id)a8;
+ (id)rankedSuggestionsFromSuggestionCandidates:(id)a3 suggestionType:(unint64_t)a4 queryAssetCount:(unint64_t)a5 queryCollectionCount:(unint64_t)a6 suggestionLimit:(unint64_t)a7;
+ (id)sortedSuggestionsFromSuggestions:(id)a3;
+ (id)suggestionsQueryForSuggestionType:(unint64_t)a3 suggestionLimit:(unint64_t)a4 queryText:(id)a5 resultTypes:(unint64_t)a6 libraryScope:(unint64_t)a7 searchIndex:(id)a8;
+ (unint64_t)_characterLengthForSuggestion:(id)a3 suggestionQuery:(id)a4;
+ (unint64_t)_countBasedPriorityForSuggestion:(id)a3 queryAssetCount:(unint64_t)a4 queryCollectionCount:(unint64_t)a5;
+ (void)_rankedSuggestionsFromRankedSuggestionsBySuggestionCategoriesType:(id)a3 orderedSuggestionCategoriesTypes:(id)a4 maxSuggestions:(unint64_t)a5 suggestionQuery:(id)a6 suggestionType:(unint64_t)a7 rankedSuggestions:(id)a8 bestSuggestionIndex:(unint64_t)a9 completion:(id)a10;
@end

@implementation PLScopedSearchSuggestionGeneration

+ (double)initialSuggestionScoreForIndexCategory:(unint64_t)a3
{
  if ((uint64_t)a3 > 1500)
  {
    if ((uint64_t)a3 > 1799)
    {
      switch(a3)
      {
        case 0x708uLL:
        case 0x709uLL:
        case 0x70AuLL:
        case 0x70BuLL:
          return 0.85;
        default:
          if (a3 == 2600 || a3 == 2601) {
            return 0.95;
          }
          return 0.0;
      }
    }
    if ((uint64_t)a3 > 1600)
    {
      if (a3 != 1601 && a3 != 1610) {
        return 0.0;
      }
    }
    else
    {
      if (a3 == 1501) {
        return 0.95;
      }
      if (a3 != 1600) {
        return 0.0;
      }
    }
    return 0.85;
  }
  if ((uint64_t)a3 <= 1100)
  {
    switch(a3)
    {
      case 5uLL:
        return 0.75;
      case 0x3E8uLL:
        return 0.95;
      case 0x3E9uLL:
        return 0.65;
    }
    return 0.0;
  }
  if ((uint64_t)a3 > 1299)
  {
    if (a3 == 1300) {
      return 1.0;
    }
    if (a3 != 1330 && a3 != 1500) {
      return 0.0;
    }
    return 0.95;
  }
  switch(a3)
  {
    case 0x44DuLL:
      double result = 0.25;
      break;
    case 0x44EuLL:
      double result = 0.8;
      break;
    case 0x44FuLL:
      double result = 0.6;
      break;
    case 0x450uLL:
    case 0x451uLL:
      double result = 0.5;
      break;
    default:
      return 0.0;
  }
  return result;
}

+ (id)suggestionsQueryForSuggestionType:(unint64_t)a3 suggestionLimit:(unint64_t)a4 queryText:(id)a5 resultTypes:(unint64_t)a6 libraryScope:(unint64_t)a7 searchIndex:(id)a8
{
  id v15 = a5;
  id v16 = a8;
  if (!v16)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLScopedSearchSuggestionGeneration.m", 951, @"Invalid parameter not satisfying: %@", @"searchIndex" object file lineNumber description];
  }
  v17 = (void *)[v16 newSuggestionsQueryForQueryText:v15 suggestionType:a3 suggestionLimit:a4 resultTypes:a6 libraryScope:a7];

  return v17;
}

+ (double)_scoreForSuggestion:(id)a3 queryAssetCount:(unint64_t)a4 queryCollectionCount:(unint64_t)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  objc_msgSend(a1, "suggestionScoreForIndexCategory:", objc_msgSend(v8, "indexCategory"));
  double v10 = v9;
  double v11 = (double)(unint64_t)[v8 matchedAssetsCount] / (double)a4;
  double v12 = (double)(unint64_t)[v8 matchedCollectionsCount] / (double)a5;
  unint64_t v13 = [v8 matchRangeOfSearchText];
  double v15 = 0.0;
  double v16 = 0.0;
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v17 = v14;
    double v18 = (double)v13;
    v19 = [v8 contentString];
    double v20 = v18 / (double)(unint64_t)[v19 length];

    double v15 = 1.0 - v20;
    double v21 = (double)v17;
    v22 = [v8 contentString];
    double v16 = v21 / (double)(unint64_t)[v22 length];
  }
  double v23 = v10 * 2.0 + 0.0 + v15 + v16;
  if ([v8 matchedAssetsCount]) {
    double v24 = v11;
  }
  else {
    double v24 = v12;
  }
  double v25 = (v23 + v24) / 5.0;
  if (v25 < 0.0 || v25 > 1.0)
  {
    v27 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v29 = 134218242;
      double v30 = v25;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Suggestion score is out of bounds. Using default score of 0. Score %f, Suggestion: %@", (uint8_t *)&v29, 0x16u);
    }

    double v25 = 0.0;
  }

  return v25;
}

+ (id)_rankedSuggestionsFromSuggestions:(id)a3 queryAssetCount:(unint64_t)a4 queryCollectionCount:(unint64_t)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __109__PLScopedSearchSuggestionGeneration__rankedSuggestionsFromSuggestions_queryAssetCount_queryCollectionCount___block_invoke;
  v7[3] = &__block_descriptor_56_e69_q24__0__PLSearchSuggestionComponent_8__PLSearchSuggestionComponent_16l;
  v7[4] = a1;
  v7[5] = a4;
  v7[6] = a5;
  v5 = [a3 sortedArrayUsingComparator:v7];
  return v5;
}

uint64_t __109__PLScopedSearchSuggestionGeneration__rankedSuggestionsFromSuggestions_queryAssetCount_queryCollectionCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) _scoreForSuggestion:v5 queryAssetCount:*(void *)(a1 + 40) queryCollectionCount:*(void *)(a1 + 48)];
  double v8 = v7;
  [*(id *)(a1 + 32) _scoreForSuggestion:v6 queryAssetCount:*(void *)(a1 + 40) queryCollectionCount:*(void *)(a1 + 48)];
  if (v8 <= v9)
  {
    if (v8 < v9)
    {
      uint64_t v10 = 1;
    }
    else
    {
      double v11 = [v5 contentString];
      double v12 = [v6 contentString];
      uint64_t v10 = [v11 localizedCompare:v12];
    }
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

+ (id)rankedSuggestionsFromSuggestionCandidates:(id)a3 suggestionType:(unint64_t)a4 queryAssetCount:(unint64_t)a5 queryCollectionCount:(unint64_t)a6 suggestionLimit:(unint64_t)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  if ([v26 count])
  {
    *(void *)buf = 0;
    v41 = buf;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0;
    double v11 = objc_opt_new();
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __148__PLScopedSearchSuggestionGeneration_rankedSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit___block_invoke;
    v34[3] = &unk_1E5875A20;
    id v37 = a1;
    unint64_t v38 = a5;
    unint64_t v39 = a6;
    id v12 = v11;
    id v35 = v12;
    v36 = buf;
    [v26 enumerateKeysAndObjectsUsingBlock:v34];
    if (*((void *)v41 + 3) >= a7) {
      unint64_t v13 = a7;
    }
    else {
      unint64_t v13 = *((void *)v41 + 3);
    }
    unint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v13];
    v27 = [a1 _suggestionsOrderedUserCategories];
    unint64_t v15 = 0;
    while ([v14 count] < v13)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v16 = v27;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v44 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v31;
LABEL_9:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v16);
          }
          double v20 = [v12 objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * v19)];
          if (v15 < [v20 count])
          {
            double v21 = [v20 objectAtIndex:v15];
            [v14 addObject:v21];
          }
          BOOL v22 = [v14 count] < v13;

          if (!v22) {
            break;
          }
          if (v17 == ++v19)
          {
            uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v44 count:16];
            if (v17) {
              goto LABEL_9;
            }
            break;
          }
        }
      }

      ++v15;
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __148__PLScopedSearchSuggestionGeneration_rankedSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit___block_invoke_2;
    v28[3] = &unk_1E5875A48;
    id v23 = v27;
    id v29 = v23;
    [v14 sortUsingComparator:v28];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    double v24 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_INFO, "No suggestion candidates provided for suggestion ranking", buf, 2u);
    }

    unint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

void __148__PLScopedSearchSuggestionGeneration_rankedSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v8 = a2;
  id v9 = [v5 _rankedSuggestionsFromSuggestions:a3 queryAssetCount:v6 queryCollectionCount:v7];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v8];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v9 count];
}

uint64_t __148__PLScopedSearchSuggestionGeneration_rankedSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 userCategory];
  uint64_t v8 = [v6 userCategory];
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v7];
  unint64_t v11 = [v9 indexOfObject:v10];

  id v12 = *(void **)(a1 + 32);
  unint64_t v13 = [NSNumber numberWithUnsignedInteger:v8];
  unint64_t v14 = [v12 indexOfObject:v13];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412546;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to determine Suggestion position while sorting suggestions: %@, %@", (uint8_t *)&v19, 0x16u);
    }
  }
  if (v11 < v14) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = v11 > v14;
  }

  return v17;
}

+ (id)generateNextTermSuggestionsForQueryMatchedScopedAssetIds:(__CFArray *)a3 queryMatchedScopedCollectionIds:(__CFArray *)a4 searchResultTypes:(unint64_t)a5 delegate:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v42 = a6;
  theArray = a3;
  if (!v42)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, a1, @"PLScopedSearchSuggestionGeneration.m", 712, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = v9;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__115121;
  v70 = __Block_byref_object_dispose__115122;
  id v71 = 0;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__115121;
  v64 = __Block_byref_object_dispose__115122;
  id v65 = 0;
  if (a3)
  {
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __154__PLScopedSearchSuggestionGeneration_generateNextTermSuggestionsForQueryMatchedScopedAssetIds_queryMatchedScopedCollectionIds_searchResultTypes_delegate___block_invoke;
    v57[3] = &unk_1E58759F8;
    id v58 = v9;
    v59 = &v66;
    [v42 groupsForAssetIds:a3 completion:v57];
  }
  if (a4)
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __154__PLScopedSearchSuggestionGeneration_generateNextTermSuggestionsForQueryMatchedScopedAssetIds_queryMatchedScopedCollectionIds_searchResultTypes_delegate___block_invoke_2;
    v54[3] = &unk_1E58759F8;
    id v55 = v10;
    v56 = &v60;
    id v11 = (id)[v42 groupsForCollectionIds:a4 completion:v54];
  }
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v50 objects:v72 count:16];
  if (v12)
  {
    uint64_t v48 = *(void *)v51;
    do
    {
      uint64_t v49 = v12;
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v51 != v48) {
          objc_enumerationMutation(obj);
        }
        unint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        unint64_t v15 = [v14 contentString];
        if (![(PLSearchSuggestionComponent *)v15 length]) {
          goto LABEL_50;
        }
        char IsSynonym = PLSearchIndexCategoryIsSynonym((int)[v14 category]);

        if (IsSynonym) {
          continue;
        }
        if (theArray) {
          CFIndex Count = CFArrayGetCount(theArray);
        }
        else {
          CFIndex Count = 0;
        }
        uint64_t v18 = (void *)v67[5];
        if (v18)
        {
          int v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "groupId"));
          uint64_t v20 = [v18 countForObject:v19];
        }
        else
        {
          uint64_t v20 = 0;
        }
        if (a4) {
          CFIndex v21 = CFArrayGetCount(a4);
        }
        else {
          CFIndex v21 = 0;
        }
        id v22 = (void *)v61[5];
        if (v22)
        {
          uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "groupId"));
          uint64_t v24 = [v22 countForObject:v23];
        }
        else
        {
          uint64_t v24 = 0;
        }
        BOOL v26 = v20 != Count && v20 != 0;
        BOOL v28 = v24 != v21 && v24 != 0;
        if ((a5 & 3) == 3)
        {
          if (v26 || v28) {
            goto LABEL_44;
          }
        }
        else
        {
          unsigned int v29 = v28 & (a5 >> 1);
          if ((a5 & 1) == 0) {
            BOOL v26 = v29;
          }
          if (v26)
          {
LABEL_44:
            long long v30 = [PLSearchSuggestionComponent alloc];
            long long v31 = [v14 contentString];
            uint64_t v32 = [v14 groupId];
            uint64_t v33 = [v14 owningGroupId];
            if ((a5 & 2) == 0) {
              uint64_t v24 = 0;
            }
            int v34 = [v14 category];
            id v35 = [v14 lookupIdentifier];
            [v14 score];
            *(float *)&double v36 = v36;
            unint64_t v15 = -[PLSearchSuggestionComponent initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:](v30, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v31, v32, v33, ((uint64_t)(a5 << 63) >> 63) & v20, v24, v34, v36, v35, 2, 0, 0x7FFFFFFFFFFFFFFFLL, 0);

            id v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLSearchSuggestionComponent userCategory](v15, "userCategory"));
            unint64_t v38 = [v43 objectForKeyedSubscript:v37];

            if (v38)
            {
              [v38 addObject:v15];
            }
            else
            {
              unint64_t v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v15, 0);
              unint64_t v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLSearchSuggestionComponent userCategory](v15, "userCategory"));
              [v43 setObject:v38 forKeyedSubscript:v39];
            }
LABEL_50:

            continue;
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v50 objects:v72 count:16];
    }
    while (v12);
  }

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v66, 8);

  return v43;
}

void __154__PLScopedSearchSuggestionGeneration_generateNextTermSuggestionsForQueryMatchedScopedAssetIds_queryMatchedScopedCollectionIds_searchResultTypes_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) addObjectsFromArray:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __154__PLScopedSearchSuggestionGeneration_generateNextTermSuggestionsForQueryMatchedScopedAssetIds_queryMatchedScopedCollectionIds_searchResultTypes_delegate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) addObjectsFromArray:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

+ (id)generateCompletionSuggestionsFromGroups:(id)a3 queryMatchedScopedAssetIds:(__CFArray *)a4 queryMatchedScopedCollectionIds:(__CFArray *)a5 searchResultTypes:(unint64_t)a6 normalizedSearchText:(id)a7 delegate:(id)a8
{
  char v10 = a6;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v94 = a7;
  id v16 = a8;
  id v17 = v16;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v90 = [MEMORY[0x1E4F28B00] currentHandler];
    [v90 handleFailureInMethod:a2, a1, @"PLScopedSearchSuggestionGeneration.m", 597, @"Invalid parameter not satisfying: %@", @"groups" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  v91 = [MEMORY[0x1E4F28B00] currentHandler];
  [v91 handleFailureInMethod:a2, a1, @"PLScopedSearchSuggestionGeneration.m", 598, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  v93 = v17;
  if (![v94 length])
  {
    v92 = [MEMORY[0x1E4F28B00] currentHandler];
    [v92 handleFailureInMethod:a2, a1, @"PLScopedSearchSuggestionGeneration.m", 599, @"Invalid parameter not satisfying: %@", @"normalizedSearchText.length > 0" object file lineNumber description];
  }
  id v98 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id obj = v15;
  uint64_t v109 = [obj countByEnumeratingWithState:&v115 objects:v119 count:16];
  if (v109)
  {
    uint64_t v108 = *(void *)v116;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v97 = v10 & 3;
    char v100 = v10;
    v101 = a5;
    v102 = a4;
    do
    {
      for (uint64_t i = 0; i != v109; ++i)
      {
        if (*(void *)v116 != v108) {
          objc_enumerationMutation(obj);
        }
        int v19 = *(void **)(*((void *)&v115 + 1) + 8 * i);
        uint64_t v20 = [v19 contentString];
        uint64_t v21 = [v20 length];

        if (!v21) {
          continue;
        }
        if ((v10 & 1) == 0)
        {
LABEL_12:
          CFIndex v22 = 0;
          if ((v10 & 2) == 0) {
            goto LABEL_131;
          }
          goto LABEL_72;
        }
        if (a4 && CFArrayGetCount(a4) >= 1)
        {
          uint64_t v110 = i;
          CFArrayRef v103 = CFArrayCreate(allocator, 0, 0, 0);
          CFArrayRef v23 = (const __CFArray *)[v19 assetIds];
          CFArrayRef Mutable = CFArrayCreateMutable(allocator, 0, 0);
          CFIndex Count = CFArrayGetCount(a4);
          if (v23)
          {
            uint64_t v25 = Count;
            CFIndex v26 = CFArrayGetCount(v23);
            if (v25)
            {
              uint64_t v27 = v26;
              if (v26)
              {
                if (v25 >= 1 && v26 >= 1)
                {
                  ValueAtIndex = 0;
                  unsigned int v29 = 0;
                  char v30 = 0;
                  CFIndex v31 = 0;
                  CFIndex v32 = 0;
                  CFArrayRef theArray = v102;
                  uint64_t v33 = 8;
                  while (1)
                  {
                    if ((v30 & 1) == 0)
                    {
                      if (!v33)
                      {
                        if (!v29 || !ValueAtIndex) {
                          goto LABEL_164;
                        }
LABEL_163:
                        __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 154, "seeking && !needsSeekStrategy");
                      }
                      id v37 = v29;
LABEL_39:
                      CFArrayRef v41 = Mutable;
LABEL_40:
                      while (2)
                      {
                        char v30 = 1;
                        if (v32 >= v25 || v31 >= v27)
                        {
LABEL_57:
                          unsigned int v29 = v37;
                          goto LABEL_58;
                        }
                        if (!v33)
                        {
                          uint64_t v33 = -1;
                          char v30 = 1;
                          goto LABEL_57;
                        }
                        if (v37)
                        {
                          if (ValueAtIndex) {
                            goto LABEL_45;
                          }
LABEL_50:
                          ValueAtIndex = CFArrayGetValueAtIndex(v23, v31);
                        }
                        else
                        {
                          id v37 = CFArrayGetValueAtIndex(theArray, v32);
                          if (!ValueAtIndex) {
                            goto LABEL_50;
                          }
                        }
LABEL_45:
                        if (v37 >= ValueAtIndex)
                        {
                          if (v37 <= ValueAtIndex)
                          {
                            if (v41) {
                              CFArrayGetCount(v41);
                            }
                            CFArrayAppendValue(v41, v37);
                            id v37 = 0;
                            ValueAtIndex = 0;
                            ++v32;
                            ++v31;
                          }
                          else
                          {
                            ValueAtIndex = 0;
                            ++v31;
                            --v33;
                          }
                        }
                        else
                        {
                          id v37 = 0;
                          ++v32;
                          --v33;
                        }
                        continue;
                      }
                    }
                    if (v29)
                    {
                      if (ValueAtIndex) {
                        goto LABEL_25;
                      }
                    }
                    else
                    {
                      unsigned int v29 = CFArrayGetValueAtIndex(theArray, v32);
                      if (ValueAtIndex) {
                        goto LABEL_25;
                      }
                    }
                    ValueAtIndex = CFArrayGetValueAtIndex(v23, v31);
LABEL_25:
                    BOOL v34 = ValueAtIndex >= v29;
                    uint64_t v35 = v25;
                    if (ValueAtIndex < v29)
                    {
                      uint64_t v25 = v27;
                      uint64_t v27 = v35;
                    }
                    CFIndex v36 = v32;
                    if (ValueAtIndex >= v29)
                    {
                      id v37 = v29;
                    }
                    else
                    {
                      CFIndex v32 = v31;
                      CFIndex v31 = v36;
                      id v37 = ValueAtIndex;
                    }
                    if (ValueAtIndex < v29) {
                      ValueAtIndex = v29;
                    }
                    CFArrayRef v38 = theArray;
                    CFArrayRef v39 = v23;
                    if (!v34)
                    {
                      CFArrayRef v23 = theArray;
                      CFArrayRef v38 = v39;
                    }
                    CFArrayRef theArray = v38;
                    if (ValueAtIndex < v37) {
LABEL_154:
                    }
                      __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 116, "elemB >= elemA");
                    if (v25 < 9)
                    {
                      uint64_t v33 = 8;
                      goto LABEL_39;
                    }
                    CFArrayRef v41 = Mutable;
                    unint64_t v40 = (unsigned char *)ValueAtIndex - (unsigned char *)v37;
                    if (log((double)v25) >= (double)v40)
                    {
                      uint64_t v33 = 8;
                      goto LABEL_40;
                    }
                    if (!v37 || !ValueAtIndex) {
                      goto LABEL_164;
                    }
                    v122.length = v25 - v32;
                    v122.location = v32;
                    CFIndex v42 = CFArrayBSearchValues(theArray, v122, ValueAtIndex, (CFComparatorFunction)PSIRowIDCompare_115135, 0);
                    if (v42 < v25)
                    {
                      CFIndex v32 = v42;
                      id v43 = CFArrayGetValueAtIndex(theArray, v42);
                      if (ValueAtIndex == v43)
                      {
                        char v30 = 0;
                        uint64_t v33 = 8;
                        unsigned int v29 = ValueAtIndex;
                      }
                      else
                      {
                        unsigned int v29 = v43;
                        if (ValueAtIndex >= v43) {
                          goto LABEL_155;
                        }
                        uint64_t v33 = 0;
                        char v30 = 1;
                      }
LABEL_58:
                      if (v32 < v25 && v31 < v27) {
                        continue;
                      }
                    }
                    break;
                  }
                }
              }
            }
          }
          CFIndex v22 = CFArrayGetCount(Mutable);
          CFRelease(v103);
          CFRelease(Mutable);
          char v10 = v100;
          a5 = v101;
          a4 = v102;
          uint64_t i = v110;
          if ((v100 & 2) == 0)
          {
LABEL_131:
            BOOL v66 = 0;
            CFIndex v65 = 0;
            BOOL v67 = v22 != 0;
LABEL_137:
            if ((v10 & 1) == 0) {
              BOOL v67 = v66;
            }
            if (!v67) {
              continue;
            }
            goto LABEL_140;
          }
        }
        else
        {
          if (![v19 intersectedAssetIds]) {
            goto LABEL_12;
          }
          CFIndex v22 = CFArrayGetCount((CFArrayRef)[v19 intersectedAssetIds]);
          if ((v10 & 2) == 0) {
            goto LABEL_131;
          }
        }
LABEL_72:
        if (a5 && CFArrayGetCount(a5) >= 1)
        {
          CFArrayRef v106 = (CFArrayRef)v22;
          uint64_t v111 = i;
          CFArrayRef cf = CFArrayCreate(allocator, 0, 0, 0);
          CFArrayRef v44 = (const __CFArray *)[v19 collectionIds];
          CFArrayRef v104 = CFArrayCreateMutable(allocator, 0, 0);
          CFIndex v45 = CFArrayGetCount(a5);
          if (!v44) {
            goto LABEL_132;
          }
          uint64_t v46 = v45;
          CFIndex v47 = CFArrayGetCount(v44);
          if (!v46) {
            goto LABEL_132;
          }
          uint64_t v48 = v47;
          if (!v47 || v46 < 1 || v47 < 1) {
            goto LABEL_132;
          }
          uint64_t v49 = 0;
          long long v50 = 0;
          char v51 = 0;
          CFIndex v52 = 0;
          CFIndex v53 = 0;
          CFArrayRef theArraya = v101;
          uint64_t v54 = 8;
          while (1)
          {
            if ((v51 & 1) == 0)
            {
              if (!v54)
              {
                if (!v50 || !v49) {
                  goto LABEL_164;
                }
                goto LABEL_163;
              }
              id v58 = v50;
              goto LABEL_97;
            }
            if (v50)
            {
              if (!v49) {
                goto LABEL_120;
              }
            }
            else
            {
              long long v50 = CFArrayGetValueAtIndex(theArraya, v53);
              if (!v49) {
LABEL_120:
              }
                uint64_t v49 = CFArrayGetValueAtIndex(v44, v52);
            }
            BOOL v55 = v49 >= v50;
            uint64_t v56 = v46;
            if (v49 < v50)
            {
              uint64_t v46 = v48;
              uint64_t v48 = v56;
            }
            CFIndex v57 = v53;
            if (v49 >= v50)
            {
              id v58 = v50;
            }
            else
            {
              CFIndex v53 = v52;
              CFIndex v52 = v57;
              id v58 = v49;
            }
            if (v49 < v50) {
              uint64_t v49 = v50;
            }
            CFArrayRef v59 = theArraya;
            CFArrayRef v60 = v44;
            if (!v55)
            {
              CFArrayRef v44 = theArraya;
              CFArrayRef v59 = v60;
            }
            CFArrayRef theArraya = v59;
            if (v49 < v58) {
              goto LABEL_154;
            }
            if (v46 >= 9)
            {
              CFArrayRef v62 = v104;
              unint64_t v61 = v49 - v58;
              if (log((double)v46) >= (double)v61)
              {
                uint64_t v54 = 8;
                goto LABEL_98;
              }
              if (v58 && v49)
              {
                v123.length = v46 - v53;
                v123.location = v53;
                CFIndex v63 = CFArrayBSearchValues(theArraya, v123, v49, (CFComparatorFunction)PSIRowIDCompare_115135, 0);
                if (v63 >= v46) {
                  goto LABEL_132;
                }
                CFIndex v53 = v63;
                v64 = CFArrayGetValueAtIndex(theArraya, v63);
                if (v49 == v64)
                {
                  char v51 = 0;
                  uint64_t v54 = 8;
                  long long v50 = v49;
                  goto LABEL_116;
                }
                long long v50 = v64;
                if (v49 < v64)
                {
                  uint64_t v54 = 0;
                  char v51 = 1;
                  goto LABEL_116;
                }
LABEL_155:
                __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 167, "elemA > elemB");
              }
LABEL_164:
              __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 153, "elemA && elemB");
            }
            uint64_t v54 = 8;
LABEL_97:
            CFArrayRef v62 = v104;
LABEL_98:
            while (1)
            {
              char v51 = 1;
              if (v53 >= v46 || v52 >= v48) {
                break;
              }
              if (!v54)
              {
                uint64_t v54 = -1;
                char v51 = 1;
                break;
              }
              if (v58)
              {
                if (!v49) {
                  goto LABEL_108;
                }
              }
              else
              {
                id v58 = CFArrayGetValueAtIndex(theArraya, v53);
                if (!v49) {
LABEL_108:
                }
                  uint64_t v49 = CFArrayGetValueAtIndex(v44, v52);
              }
              if (v58 >= v49)
              {
                if (v58 <= v49)
                {
                  if (v62) {
                    CFArrayGetCount(v62);
                  }
                  CFArrayAppendValue(v62, v58);
                  id v58 = 0;
                  uint64_t v49 = 0;
                  ++v53;
                  ++v52;
                }
                else
                {
                  uint64_t v49 = 0;
                  ++v52;
                  --v54;
                }
              }
              else
              {
                id v58 = 0;
                ++v53;
                --v54;
              }
            }
            long long v50 = v58;
LABEL_116:
            if (v53 >= v46 || v52 >= v48)
            {
LABEL_132:
              CFIndex v65 = CFArrayGetCount(v104);
              CFRelease(cf);
              CFRelease(v104);
              char v10 = v100;
              a5 = v101;
              a4 = v102;
              uint64_t i = v111;
              CFIndex v22 = (CFIndex)v106;
              goto LABEL_134;
            }
          }
        }
        if ([v19 intersectedCollectionIds]) {
          CFIndex v65 = CFArrayGetCount((CFArrayRef)[v19 intersectedCollectionIds]);
        }
        else {
          CFIndex v65 = 0;
        }
LABEL_134:
        BOOL v67 = v22 != 0;
        BOOL v66 = v65 != 0;
        if (v97 != 3) {
          goto LABEL_137;
        }
        if (!(v22 | v65)) {
          continue;
        }
LABEL_140:
        CFArrayRef v107 = (CFArrayRef)v22;
        uint64_t v112 = i;
        if ([v19 tokenRangesCount])
        {
          uint64_t v68 = 0;
          while (1)
          {
            uint64_t v69 = [v19 tokenRangeAtIndex:v68];
            uint64_t v71 = v70;
            v72 = [v19 normalizedString];
            uint64_t v73 = objc_msgSend(v72, "rangeOfString:options:range:", v94, 137, v69, v71);
            uint64_t v75 = v74;

            if (v73 != 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            if (++v68 >= (unint64_t)[v19 tokenRangesCount]) {
              goto LABEL_144;
            }
          }
        }
        else
        {
LABEL_144:
          uint64_t v75 = 0;
          uint64_t v73 = 0x7FFFFFFFFFFFFFFFLL;
        }
        v76 = [PLSearchSuggestionComponent alloc];
        v77 = [v19 contentString];
        uint64_t v78 = [v19 groupId];
        uint64_t v79 = [v19 owningGroupId];
        uint64_t v80 = (int)[v19 category];
        v81 = [v19 lookupIdentifier];
        [v19 score];
        *(float *)&double v82 = v82;
        v83 = -[PLSearchSuggestionComponent initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:](v76, "initWithContentString:groupId:owningGroupId:matchedAssetsCount:matchedCollectionsCount:indexCategory:lookupIdentifier:score:suggestionType:matchedText:matchRangeOfSearchText:", v77, v78, v79, v107, v65, v80, v82, v81, 1, 0, v73, v75);

        uint64_t v84 = [(PLSearchSuggestionComponent *)v83 userCategory];
        v85 = [NSNumber numberWithUnsignedInteger:v84];
        v86 = [v98 objectForKeyedSubscript:v85];

        if (v86)
        {
          [v86 addObject:v83];
        }
        else
        {
          v87 = [MEMORY[0x1E4F1CA48] arrayWithObject:v83];
          v88 = [NSNumber numberWithUnsignedInteger:v84];
          [v98 setObject:v87 forKey:v88];
        }
        char v10 = v100;
        a5 = v101;
        a4 = v102;
        uint64_t i = v112;
      }
      uint64_t v109 = [obj countByEnumeratingWithState:&v115 objects:v119 count:16];
    }
    while (v109);
  }

  return v98;
}

+ (id)_suggestionsOrderedUserCategories
{
  return &unk_1EEBF2570;
}

+ (double)suggestionScoreForIndexCategory:(unint64_t)a3
{
  double result = 1.0;
  if ((uint64_t)a3 > 1520)
  {
    if ((uint64_t)a3 <= 1899)
    {
      if ((uint64_t)a3 <= 1610)
      {
        if ((uint64_t)a3 > 1540)
        {
          if ((uint64_t)a3 > 1600)
          {
            if (a3 != 1601 && a3 != 1610) {
              return result;
            }
          }
          else if (a3 != 1541 && a3 != 1600)
          {
            return result;
          }
        }
        else if ((uint64_t)a3 > 1530)
        {
          if (a3 != 1531 && a3 != 1540) {
            return result;
          }
        }
        else if (a3 != 1521 && a3 != 1530)
        {
          return result;
        }
        return 0.4;
      }
      if ((uint64_t)a3 > 1799)
      {
        switch(a3)
        {
          case 0x708uLL:
          case 0x709uLL:
          case 0x70AuLL:
          case 0x70BuLL:
            return 0.4;
          default:
            return result;
        }
        return result;
      }
      if (a3 == 1611) {
        return 0.4;
      }
      if (a3 != 1700)
      {
        if (a3 != 1701) {
          return result;
        }
        return 0.4;
      }
    }
    else
    {
      if ((uint64_t)a3 <= 1999)
      {
        switch(a3)
        {
          case 0x76CuLL:
          case 0x76DuLL:
          case 0x77DuLL:
            return 0.0;
          case 0x76EuLL:
          case 0x76FuLL:
          case 0x770uLL:
          case 0x771uLL:
          case 0x772uLL:
          case 0x773uLL:
          case 0x774uLL:
          case 0x775uLL:
          case 0x776uLL:
          case 0x777uLL:
          case 0x778uLL:
          case 0x779uLL:
          case 0x77AuLL:
          case 0x77BuLL:
          case 0x77CuLL:
          case 0x77EuLL:
          case 0x77FuLL:
            return 0.3;
          default:
            return result;
        }
        return result;
      }
      if ((uint64_t)a3 > 2499)
      {
        if ((uint64_t)a3 > 2600)
        {
          if (a3 != 2601)
          {
            if (a3 == 2800) {
              double result = 0.0;
            }
            if (a3 == 2700) {
              return 0.0;
            }
            return result;
          }
        }
        else if (a3 != 2500 && a3 != 2501 && a3 != 2600)
        {
          return result;
        }
        return 0.4;
      }
      if ((uint64_t)a3 > 2299)
      {
        if (a3 == 2300) {
          return 0.25;
        }
        if (a3 == 2400 || a3 == 2401) {
          return 0.3;
        }
        return result;
      }
      if (a3 != 2000)
      {
        if (a3 == 2100) {
          return 0.0;
        }
        if (a3 != 2200) {
          return result;
        }
        return 0.4;
      }
    }
    return 0.65;
  }
  if ((uint64_t)a3 <= 1099)
  {
    switch(a3)
    {
      case 0uLL:
      case 0xBuLL:
      case 0xDuLL:
        return 0.0;
      case 1uLL:
        double result = 0.51;
        break;
      case 2uLL:
      case 3uLL:
        double result = 0.5;
        break;
      case 4uLL:
        double result = 0.52;
        break;
      case 5uLL:
        double result = 0.56;
        break;
      case 6uLL:
        double result = 0.55;
        break;
      case 7uLL:
        double result = 0.57;
        break;
      case 8uLL:
        double result = 0.58;
        break;
      case 9uLL:
        double result = 0.53;
        break;
      case 0xAuLL:
        double result = 0.59;
        break;
      case 0xCuLL:
        double result = 0.6;
        break;
      case 0xEuLL:
        double result = 0.54;
        break;
      default:
        switch(a3)
        {
          case 0x3E8uLL:
          case 0x3E9uLL:
            return 0.65;
          case 0x3EAuLL:
            double result = 0.45;
            break;
          case 0x3EBuLL:
          case 0x3ECuLL:
          case 0x3EDuLL:
          case 0x3EEuLL:
            return 0.4;
          default:
            return result;
        }
        break;
    }
    return result;
  }
  if ((uint64_t)a3 <= 1309)
  {
    switch(a3)
    {
      case 0x44CuLL:
      case 0x44DuLL:
      case 0x44EuLL:
      case 0x44FuLL:
        double result = 0.7;
        break;
      case 0x450uLL:
      case 0x451uLL:
LABEL_38:
        double result = 0.35;
        break;
      case 0x452uLL:
      case 0x453uLL:
        return 0.0;
      default:
        switch(a3)
        {
          case 0x4B0uLL:
          case 0x4B1uLL:
          case 0x4B2uLL:
          case 0x4B3uLL:
          case 0x4B4uLL:
          case 0x4B5uLL:
            goto LABEL_38;
          default:
            return result;
        }
    }
    return result;
  }
  if ((uint64_t)a3 > 1400)
  {
    if ((uint64_t)a3 > 1509)
    {
      if (a3 != 1510 && a3 != 1511 && a3 != 1520) {
        return result;
      }
    }
    else
    {
      if (a3 == 1401) {
        return 0.1;
      }
      if (a3 != 1500 && a3 != 1501) {
        return result;
      }
    }
    return 0.4;
  }
  if ((uint64_t)a3 <= 1329)
  {
    if (a3 != 1310)
    {
      if (a3 == 1320 || a3 == 1321) {
        return 0.9;
      }
      return result;
    }
    return 0.8;
  }
  if (a3 - 1330 < 2) {
    return 0.8;
  }
  if (a3 == 1400) {
    return 0.2;
  }
  return result;
}

+ (id)_orderedSuggestionCategoryTypes
{
  return &unk_1EEBF2558;
}

+ (unint64_t)_characterLengthForSuggestion:(id)a3 suggestionQuery:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 suggestionOptions];
  uint64_t v7 = [v6 searchSuggestionType];

  if (v7 == 2)
  {
    unint64_t v8 = 1;
  }
  else
  {
    id v9 = [v5 contentString];
    unint64_t v8 = [v9 length];
  }
  return v8;
}

+ (double)_percentOverlapWithCompletionText:(id)a3 suggestionQuery:(id)a4 minPercentOverlapForPrioritization:(double)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 suggestionOptions];
  uint64_t v10 = [v9 searchSuggestionType];

  double v11 = 0.0;
  if (v10 == 2) {
    goto LABEL_16;
  }
  uint64_t v12 = [v7 contentString];
  unint64_t v13 = [v12 length];

  id v31 = v8;
  [v8 completionSuggestionTexts];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v14) {
    goto LABEL_15;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v36;
  double v17 = (double)v13;
  id v32 = v7;
  do
  {
    uint64_t v18 = 0;
    uint64_t v33 = v15;
    do
    {
      if (*(void *)v36 != v16) {
        objc_enumerationMutation(obj);
      }
      int v19 = *(void **)(*((void *)&v35 + 1) + 8 * v18);
      unint64_t v20 = [v19 length];
      uint64_t v21 = [v7 contentString];
      CFIndex v22 = [v21 lowercaseString];
      CFArrayRef v23 = [v19 lowercaseString];
      if ([v22 hasPrefix:v23])
      {
      }
      else
      {
        uint64_t v24 = [v7 contentString];
        [v24 lowercaseString];
        unint64_t v25 = v20;
        v27 = uint64_t v26 = v16;
        BOOL v28 = [v19 lowercaseString];
        int v29 = [v27 isEqualToString:v28];

        uint64_t v16 = v26;
        unint64_t v20 = v25;

        id v7 = v32;
        uint64_t v15 = v33;

        double v11 = 0.0;
        if (!v29) {
          goto LABEL_11;
        }
      }
      double v11 = (double)v20 / v17;
LABEL_11:
      if (v11 > a5) {
        goto LABEL_15;
      }
      ++v18;
    }
    while (v15 != v18);
    uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  }
  while (v15);
  double v11 = 0.0;
LABEL_15:

  id v8 = v31;
LABEL_16:

  return v11;
}

+ (double)_averageGroupRankingScoreForSuggestion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = objc_msgSend(v4, "suggestionComponents", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v11 score];
        double v13 = v12;
        objc_msgSend(a1, "suggestionScoreForIndexCategory:", objc_msgSend(v11, "indexCategory"));
        double v9 = v9 + v14 + v13;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);

    if (v9 == 0.0)
    {
      double v15 = 0.0;
      goto LABEL_13;
    }
    id v5 = [v4 suggestionComponents];
    double v15 = v9 / (double)(unint64_t)[v5 count];
  }
  else
  {
    double v15 = 0.0;
  }

LABEL_13:
  return v15;
}

+ (unint64_t)_countBasedPriorityForSuggestion:(id)a3 queryAssetCount:(unint64_t)a4 queryCollectionCount:(unint64_t)a5
{
  id v7 = a3;
  uint64_t v8 = v7;
  double v9 = 0.0;
  double v10 = 0.0;
  if (a4) {
    double v10 = (double)([v7 matchedAssetsCount] / a4);
  }
  if (a5) {
    double v9 = (double)([v8 matchedCollectionsCount] / a5);
  }
  if (v10 <= 0.0) {
    double v11 = v9;
  }
  else {
    double v11 = v10;
  }
  if (v11 < 0.25 || v11 > 0.5)
  {
    if (v11 <= 0.5 || v11 > 0.8)
    {
      if (v11 >= 0.1 && v11 < 0.25)
      {
        unint64_t v13 = 3;
      }
      else if (v11 <= 0.8)
      {
        if (v11 >= 0.1) {
          unint64_t v13 = 0;
        }
        else {
          unint64_t v13 = 5;
        }
      }
      else
      {
        unint64_t v13 = 4;
      }
    }
    else
    {
      unint64_t v13 = 2;
    }
  }
  else
  {
    unint64_t v13 = 1;
  }

  return v13;
}

+ (id)_rankedSearchSuggestionsFromSuggestions:(id)a3 queryAssetCount:(unint64_t)a4 queryCollectionCount:(unint64_t)a5 suggestionType:(unint64_t)a6 suggestionQuery:(id)a7
{
  id v12 = a7;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __146__PLScopedSearchSuggestionGeneration__rankedSearchSuggestionsFromSuggestions_queryAssetCount_queryCollectionCount_suggestionType_suggestionQuery___block_invoke;
  v16[3] = &unk_1E58759D0;
  unint64_t v19 = a4;
  unint64_t v20 = a5;
  id v17 = v12;
  id v18 = a1;
  unint64_t v21 = a6;
  id v13 = v12;
  double v14 = [a3 sortedArrayUsingComparator:v16];

  return v14;
}

uint64_t __146__PLScopedSearchSuggestionGeneration__rankedSearchSuggestionsFromSuggestions_queryAssetCount_queryCollectionCount_suggestionType_suggestionQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 40) _averageGroupRankingScoreForSuggestion:v5];
  double v8 = v7;
  [*(id *)(a1 + 40) _averageGroupRankingScoreForSuggestion:v6];
  double v10 = v9;
  unint64_t v11 = [*(id *)(a1 + 40) _countBasedPriorityForSuggestion:v5 queryAssetCount:*(void *)(a1 + 48) queryCollectionCount:*(void *)(a1 + 56)];
  unint64_t v12 = [*(id *)(a1 + 40) _countBasedPriorityForSuggestion:v6 queryAssetCount:*(void *)(a1 + 48) queryCollectionCount:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) _percentOverlapWithCompletionText:v5 suggestionQuery:*(void *)(a1 + 32) minPercentOverlapForPrioritization:0.5];
  double v14 = v13;
  [*(id *)(a1 + 40) _percentOverlapWithCompletionText:v6 suggestionQuery:*(void *)(a1 + 32) minPercentOverlapForPrioritization:0.5];
  double v16 = v15;
  unint64_t v17 = [*(id *)(a1 + 40) _characterLengthForSuggestion:v5 suggestionQuery:*(void *)(a1 + 32)];
  unint64_t v18 = [*(id *)(a1 + 40) _characterLengthForSuggestion:v6 suggestionQuery:*(void *)(a1 + 32)];
  if (*(void *)(a1 + 64) == 1)
  {
    if (v14 == 1.0) {
      goto LABEL_11;
    }
    if (v16 == 1.0) {
      goto LABEL_14;
    }
  }
  if (v8 <= v10)
  {
    if (v8 < v10) {
      goto LABEL_14;
    }
    if (v11 <= v12)
    {
      if (v11 < v12) {
        goto LABEL_14;
      }
      if (v14 <= v16)
      {
        if (v14 >= v16)
        {
          if (v17 < v18) {
            goto LABEL_11;
          }
          if (v17 <= v18)
          {
            unint64_t v21 = [v5 contentString];
            uint64_t v22 = [v6 contentString];
            uint64_t v19 = [v21 localizedCompare:v22];

            goto LABEL_15;
          }
        }
LABEL_14:
        uint64_t v19 = 1;
        goto LABEL_15;
      }
    }
  }
LABEL_11:
  uint64_t v19 = -1;
LABEL_15:

  return v19;
}

+ (id)sortedSuggestionsFromSuggestions:(id)a3
{
  v3 = (void *)[a3 mutableCopy];
  [v3 sortUsingComparator:&__block_literal_global_115228];
  id v4 = (void *)[v3 copy];

  return v4;
}

uint64_t __71__PLScopedSearchSuggestionGeneration_sortedSuggestionsFromSuggestions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 categoriesType] == 7 || objc_msgSend(v4, "categoriesType") == 9)
  {
    uint64_t v6 = -1;
  }
  else if ([v5 categoriesType] == 7 || objc_msgSend(v5, "categoriesType") == 9)
  {
    uint64_t v6 = 1;
  }
  else
  {
    unint64_t v7 = [v4 matchedAssetsCount];
    if (!v7) {
      unint64_t v7 = [v4 matchedCollectionsCount];
    }
    unint64_t v8 = [v5 matchedAssetsCount];
    if (!v8) {
      unint64_t v8 = [v5 matchedCollectionsCount];
    }
    if (v7 > v8) {
      uint64_t v6 = -1;
    }
    else {
      uint64_t v6 = v7 < v8;
    }
  }

  return v6;
}

+ (void)_rankedSuggestionsFromRankedSuggestionsBySuggestionCategoriesType:(id)a3 orderedSuggestionCategoriesTypes:(id)a4 maxSuggestions:(unint64_t)a5 suggestionQuery:(id)a6 suggestionType:(unint64_t)a7 rankedSuggestions:(id)a8 bestSuggestionIndex:(unint64_t)a9 completion:(id)a10
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v49 = a6;
  id v15 = a8;
  double v16 = (void (**)(id, void, id))a10;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v14;
  uint64_t v46 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
  int v17 = 0;
  if (v46)
  {
    unint64_t v18 = a9;
    uint64_t v45 = *(void *)v56;
    id v40 = v13;
    CFArrayRef v39 = v16;
    do
    {
      int v47 = v17;
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v56 != v45) {
          objc_enumerationMutation(obj);
        }
        unint64_t v20 = *(void **)(*((void *)&v55 + 1) + 8 * v19);
        if ([v15 count] >= a5) {
          goto LABEL_46;
        }
        unint64_t v21 = [v13 objectForKeyedSubscript:v20];
        if ([v21 count] <= v18)
        {
          uint64_t v22 = 0;
LABEL_14:
          unint64_t v26 = 0;
          goto LABEL_15;
        }
        uint64_t v22 = [v21 objectAtIndexedSubscript:v18];
        if (!v22) {
          goto LABEL_14;
        }
        if ([v15 containsObject:v22]) {
          goto LABEL_39;
        }
        uint64_t v23 = v19;
        [v15 addObject:v22];
        uint64_t v24 = [v22 suggestionComponents];
        unint64_t v25 = [v24 firstObject];

        unint64_t v26 = [v25 indexCategory] == 1300 || objc_msgSend(v25, "indexCategory") == 1330;
        int v47 = 1;
        uint64_t v19 = v23;
LABEL_15:
        if ([v15 count] >= a5)
        {

LABEL_46:
          double v16 = v39;
          LOBYTE(v17) = v47;
          goto LABEL_47;
        }
        BOOL v27 = [v20 integerValue] == 7 || objc_msgSend(v20, "integerValue") == 9;
        if (a7 == 1 && v27)
        {
          uint64_t v42 = v19;
          id v43 = v21;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v28 = v21;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v59 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v52;
LABEL_23:
            uint64_t v32 = 0;
            while (1)
            {
              if (*(void *)v52 != v31) {
                objc_enumerationMutation(v28);
              }
              if (v26 > 2) {
                break;
              }
              uint64_t v33 = *(void *)(*((void *)&v51 + 1) + 8 * v32);
              if (([v15 containsObject:v33] & 1) == 0)
              {
                BOOL v34 = v22;
                long long v35 = [v22 suggestionComponents];
                long long v36 = [v35 firstObject];

                if ([v36 indexCategory] == 1300 || objc_msgSend(v36, "indexCategory") == 1330)
                {
                  [a1 _percentOverlapWithCompletionText:v33 suggestionQuery:v49 minPercentOverlapForPrioritization:0.25];
                  if (v37 >= 0.25)
                  {
                    [v15 addObject:v33];
                    ++v26;
                    int v47 = 1;
                  }
                  if ([v15 count] >= a5)
                  {

                    uint64_t v22 = v34;
                    break;
                  }
                }

                uint64_t v22 = v34;
              }
              if (v30 == ++v32)
              {
                uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v59 count:16];
                if (v30) {
                  goto LABEL_23;
                }
                break;
              }
            }
          }

          unint64_t v18 = a9;
          id v13 = v40;
          uint64_t v19 = v42;
          unint64_t v21 = v43;
        }
LABEL_39:

        ++v19;
      }
      while (v19 != v46);
      uint64_t v38 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
      double v16 = v39;
      uint64_t v46 = v38;
      int v17 = v47;
    }
    while (v38);
  }
LABEL_47:

  v16[2](v16, v17 & 1, v15);
}

+ (id)rankedSearchSuggestionsFromSuggestionCandidates:(id)a3 suggestionType:(unint64_t)a4 queryAssetCount:(unint64_t)a5 queryCollectionCount:(unint64_t)a6 suggestionLimit:(unint64_t)a7 suggestionQuery:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  if ([v14 count])
  {
    uint64_t v52 = 0;
    long long v53 = &v52;
    uint64_t v54 = 0x2020000000;
    uint64_t v55 = 0;
    double v16 = objc_opt_new();
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __170__PLScopedSearchSuggestionGeneration_rankedSearchSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit_suggestionQuery___block_invoke;
    v44[3] = &unk_1E5875960;
    id v48 = a1;
    unint64_t v49 = a5;
    unint64_t v50 = a6;
    unint64_t v51 = a4;
    id v17 = v15;
    id v45 = v17;
    id v28 = v16;
    id v46 = v28;
    int v47 = &v52;
    [v14 enumerateKeysAndObjectsUsingBlock:v44];
    BOOL v19 = a4 == 2 && a7 > 1;
    unint64_t v20 = a7 - v19;
    if (v53[3] >= v20) {
      unint64_t v21 = v20;
    }
    else {
      unint64_t v21 = v53[3];
    }
    uint64_t v22 = [a1 _orderedSuggestionCategoryTypes];
    *(void *)buf = 0;
    CFArrayRef v39 = buf;
    uint64_t v40 = 0x3032000000;
    CFArrayRef v41 = __Block_byref_object_copy__115121;
    uint64_t v42 = __Block_byref_object_dispose__115122;
    id v43 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v21];
    uint64_t v34 = 0;
    long long v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    do
    {
      if ([*((id *)v39 + 5) count] >= v21) {
        break;
      }
      uint64_t v23 = *((void *)v39 + 5);
      uint64_t v24 = v31[3];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __170__PLScopedSearchSuggestionGeneration_rankedSearchSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit_suggestionQuery___block_invoke_2;
      v29[3] = &unk_1E5875988;
      v29[4] = buf;
      v29[5] = &v34;
      v29[6] = &v30;
      [a1 _rankedSuggestionsFromRankedSuggestionsBySuggestionCategoriesType:v28 orderedSuggestionCategoriesTypes:v22 maxSuggestions:v21 suggestionQuery:v17 suggestionType:a4 rankedSuggestions:v23 bestSuggestionIndex:v24 completion:v29];
      if (a4 == 2) {
        break;
      }
    }
    while (*((unsigned char *)v35 + 24));
    unint64_t v25 = [a1 sortedSuggestionsFromSuggestions:*((void *)v39 + 5)];
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v52, 8);
  }
  else
  {
    unint64_t v26 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_INFO, "No suggestion candidates provided for suggestion ranking", buf, 2u);
    }

    unint64_t v25 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v25;
}

void __170__PLScopedSearchSuggestionGeneration_rankedSearchSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit_suggestionQuery___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = a2;
  id v11 = [v5 _rankedSearchSuggestionsFromSuggestions:a3 queryAssetCount:v6 queryCollectionCount:v7 suggestionType:v8 suggestionQuery:v9];
  [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v10];

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v11 count];
}

void __170__PLScopedSearchSuggestionGeneration_rankedSearchSuggestionsFromSuggestionCandidates_suggestionType_queryAssetCount_queryCollectionCount_suggestionLimit_suggestionQuery___block_invoke_2(void *a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  ++*(void *)(*(void *)(a1[6] + 8) + 24);
}

@end