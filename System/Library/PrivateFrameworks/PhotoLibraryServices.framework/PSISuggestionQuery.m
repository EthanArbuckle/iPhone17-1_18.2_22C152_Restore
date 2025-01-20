@interface PSISuggestionQuery
+ (id)_suggestionCandidatesByContentStringFromSuggestionComponents:(id)a3;
+ (id)_suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents:(id)a3 assetIds:(__CFArray *)a4 collectionIds:(__CFArray *)a5;
- (BOOL)_groupIsValidForSuggestionGeneration:(id)a3 suggestionType:(unint64_t)a4;
- (BOOL)_groupWithAssetCountMeetsAssetMatchThreshold:(unint64_t)a3 assetSearchResultsCount:(unint64_t)a4;
- (BOOL)_isEligibleIndexCategory:(unint64_t)a3 forSuggestionWithType:(unint64_t)a4;
- (BOOL)cancelled;
- (NSArray)completionSuggestionTexts;
- (NSArray)suggestionComponents;
- (NSAttributedString)formattedSearchText;
- (NSAttributedString)originalSearchtext;
- (PSIDatabase)photosEntityStore;
- (PSISuggestionOptions)suggestionOptions;
- (PSISuggestionQuery)initWithFormattedSearchText:(id)a3 originalSearchText:(id)a4 completionSuggestionTexts:(id)a5 suggestionOptions:(id)a6 suggestionComponents:(id)a7 photosEntityStore:(id)a8;
- (id)_generateCompletionSuggestionsForAssetUUIDs:(id)a3 collectionUUIDs:(id)a4;
- (id)_generateNextTokenSuggestionsForAssetUUIDs:(id)a3 collectionUUIDs:(id)a4;
- (id)performQueryWithSearchResultAssetUUIDs:(id)a3 collectionUUIDs:(id)a4;
- (void)cancel;
- (void)setCancelled:(BOOL)a3;
@end

@implementation PSISuggestionQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosEntityStore, 0);
  objc_storeStrong((id *)&self->_suggestionComponents, 0);
  objc_storeStrong((id *)&self->_completionSuggestionTexts, 0);
  objc_storeStrong((id *)&self->_suggestionOptions, 0);
  objc_storeStrong((id *)&self->_originalSearchtext, 0);
  objc_storeStrong((id *)&self->_formattedSearchText, 0);
}

- (PSIDatabase)photosEntityStore
{
  return self->_photosEntityStore;
}

- (NSArray)suggestionComponents
{
  return self->_suggestionComponents;
}

- (NSArray)completionSuggestionTexts
{
  return self->_completionSuggestionTexts;
}

- (PSISuggestionOptions)suggestionOptions
{
  return self->_suggestionOptions;
}

- (NSAttributedString)originalSearchtext
{
  return self->_originalSearchtext;
}

- (NSAttributedString)formattedSearchText
{
  return self->_formattedSearchText;
}

- (BOOL)_groupWithAssetCountMeetsAssetMatchThreshold:(unint64_t)a3 assetSearchResultsCount:(unint64_t)a4
{
  BOOL result = 0;
  if (a3 && a4)
  {
    float v5 = (float)((float)a3 / (float)a4) * 100.0;
    return v5 <= 65.0 && v5 >= 15.0;
  }
  return result;
}

- (BOOL)_isEligibleIndexCategory:(unint64_t)a3 forSuggestionWithType:(unint64_t)a4
{
  BOOL result = 1;
  if ((uint64_t)a3 > 1600)
  {
    if ((uint64_t)a3 > 2099)
    {
      if ((uint64_t)a3 > 2500)
      {
        if ((uint64_t)a3 > 2699)
        {
          if (a3 == 2700 || a3 == 2800) {
            return 0;
          }
        }
        else if (a3 == 2501 || a3 == 2601)
        {
          return a4 != 2;
        }
      }
      else if (a3 - 2400 < 2 || a3 == 2100 || a3 == 2300)
      {
        return a4 != 2;
      }
    }
    else if ((uint64_t)a3 <= 1899)
    {
      if (a3 == 1601 || a3 == 1611 || a3 == 1803) {
        return a4 != 2;
      }
    }
    else if (a3 - 1900 <= 0x13 && ((1 << (a3 - 108)) & 0xF7FFD) != 0)
    {
      return a4 != 2;
    }
  }
  else if ((uint64_t)a3 > 1300)
  {
    if (a3 - 1501 <= 0x28 && ((1 << (a3 + 35)) & 0x18060180601) != 0) {
      return a4 != 2;
    }
    if (a3 - 1301 <= 0x1E)
    {
      if (((1 << (a3 - 21)) & 0x40180001) != 0) {
        return a4 != 2;
      }
      if (a3 == 1310) {
        return 0;
      }
    }
    if (a3 - 1400 < 2) {
      return a4 != 2;
    }
  }
  else
  {
    if ((uint64_t)a3 <= 1005)
    {
      if (a3 > 0xE) {
        goto LABEL_7;
      }
      if (((1 << a3) & 0x53C4) != 0) {
        return a4 != 2;
      }
      if (((1 << a3) & 0x2801) == 0)
      {
LABEL_7:
        if (a3 != 1004) {
          return result;
        }
        return a4 != 2;
      }
      return 0;
    }
    if ((uint64_t)a3 <= 1199)
    {
      if (a3 == 1006 || a3 == 1102 || a3 == 1105) {
        return a4 != 2;
      }
    }
    else if (a3 - 1200 < 6)
    {
      return a4 != 2;
    }
  }
  return result;
}

- (BOOL)_groupIsValidForSuggestionGeneration:(id)a3 suggestionType:(unint64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 contentString];
  uint64_t v23 = [v7 length];

  if (PLSearchIndexCategoryIsEligibleForSuggestion((int)[v6 category])) {
    int v8 = !-[PSISuggestionQuery _isEligibleIndexCategory:forSuggestionWithType:](self, "_isEligibleIndexCategory:forSuggestionWithType:", (int)[v6 category], a4);
  }
  else {
    LOBYTE(v8) = 1;
  }
  if ([v6 category] == 1203
    || [v6 category] == 1204
    || [v6 category] == 1205)
  {
    v9 = [v6 contentString];
    BOOL v10 = (unint64_t)[v9 length] > 2;
  }
  else
  {
    BOOL v10 = 1;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v11 = [(PSISuggestionQuery *)self suggestionComponents];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v24 + 1) + 8 * i) psiGroupId];
        if (v16 == [v6 groupId])
        {

          goto LABEL_19;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  if (((v23 != 0) & ~(_BYTE)v8 & v10) != 0)
  {
    BOOL v17 = 1;
  }
  else
  {
LABEL_19:
    v18 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      if (a4 - 1 > 3) {
        v19 = @"PLSearchSuggestionTypeNone";
      }
      else {
        v19 = off_1E5869EC8[a4 - 1];
      }
      v20 = v19;
      v21 = [(PSISuggestionQuery *)self formattedSearchText];
      *(_DWORD *)buf = 138412802;
      id v29 = v6;
      __int16 v30 = 2112;
      v31 = v20;
      __int16 v32 = 2112;
      v33 = v21;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "Group is invalid for suggestion of type for query: %@, %@, \"%@\".", buf, 0x20u);
    }
    BOOL v17 = 0;
  }

  return v17;
}

- (id)_generateNextTokenSuggestionsForAssetUUIDs:(id)a3 collectionUUIDs:(id)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v67 = v6;
  [v8 addObjectsFromArray:v6];
  v63 = v7;
  v64 = v8;
  [v8 addObjectsFromArray:v7];
  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x2020000000;
  uint64_t v93 = 0;
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x2020000000;
  uint64_t v89 = 0;
  v68 = [(PSISuggestionQuery *)self suggestionOptions];
  v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  uint64_t v10 = [v68 suggestionResultTypes];
  v11 = [(PSISuggestionQuery *)self photosEntityStore];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __81__PSISuggestionQuery__generateNextTokenSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke;
  v85[3] = &unk_1E58674B0;
  v85[4] = &v90;
  v85[5] = &v86;
  +[PLScopedSearchUtilities searchIndexIdsFromUUIDs:v9 searchResultTypes:v10 psiDatabase:v11 completion:v85];

  if ([(PSISuggestionQuery *)self cancelled])
  {
    log = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [(PSISuggestionQuery *)self formattedSearchText];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_19B3C7000, log, OS_LOG_TYPE_INFO, "Next Token suggestions query for \"%@\" aborted because query was cancelled", (uint8_t *)&buf, 0xCu);
    }
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    log = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v102 = 0x3032000000;
    v103 = __Block_byref_object_copy__24464;
    v104 = __Block_byref_object_dispose__24465;
    id v105 = 0;
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__24464;
    v83 = __Block_byref_object_dispose__24465;
    id v84 = 0;
    v61 = [(PSISuggestionQuery *)self photosEntityStore];
    uint64_t v14 = v91[3];
    if (v14)
    {
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __81__PSISuggestionQuery__generateNextTokenSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_37;
      v76[3] = &unk_1E58759F8;
      v77 = log;
      p_long long buf = &buf;
      [v61 groupsForAssetIds:v14 completion:v76];
    }
    uint64_t v15 = v87[3];
    if (v15)
    {
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __81__PSISuggestionQuery__generateNextTokenSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_2;
      v73[3] = &unk_1E58759F8;
      v74 = log;
      v75 = &v79;
      id v16 = (id)[v61 groupsForCollectionIds:v15 completion:v73];
    }
    if ([(PSISuggestionQuery *)self cancelled])
    {
      v62 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        BOOL v17 = [(PSISuggestionQuery *)self formattedSearchText];
        *(_DWORD *)v94 = 138412290;
        uint64_t v95 = (uint64_t)v17;
        _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_INFO, "Next Token suggestions query for \"%@\" aborted because query was cancelled", v94, 0xCu);
      }
      id v13 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int v59 = [v68 optionsWantSuggestionsForAssets];
      int v58 = [v68 optionsWantSuggestionsForCollections];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      obj = log;
      uint64_t v18 = [obj countByEnumeratingWithState:&v69 objects:v100 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v70;
LABEL_15:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v70 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v69 + 1) + 8 * v20);
          if ([(PSISuggestionQuery *)self cancelled]) {
            break;
          }
          if (-[PSISuggestionQuery _groupIsValidForSuggestionGeneration:suggestionType:](self, "_groupIsValidForSuggestionGeneration:suggestionType:", v21, 2)&& (PLSearchIndexCategoryIsSynonym((int)[v21 category]) & 1) == 0)
          {
            CFArrayRef v22 = (const __CFArray *)v91[3];
            CFIndex v23 = v22 ? CFArrayGetCount(v22) : 0;
            long long v24 = *(void **)(*((void *)&buf + 1) + 40);
            long long v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v21, "groupId"));
            uint64_t v26 = [v24 countForObject:v25];

            CFArrayRef v27 = (const __CFArray *)v87[3];
            CFIndex v28 = v27 ? CFArrayGetCount(v27) : 0;
            id v29 = (void *)v80[5];
            __int16 v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v21, "groupId"));
            uint64_t v31 = [v29 countForObject:v30];
            BOOL v32 = v26 != v23;

            int v33 = v26 && v32;
            BOOL v34 = v31 == v28 || v31 == 0;
            BOOL v35 = !v34;
            if ((v59 & v58) != 0) {
              int v36 = v33 | v35;
            }
            else {
              int v36 = v59 ? v33 : v58 & v35;
            }
            if ((v36 & -[PSISuggestionQuery _groupWithAssetCountMeetsAssetMatchThreshold:assetSearchResultsCount:](self, "_groupWithAssetCountMeetsAssetMatchThreshold:assetSearchResultsCount:", v26, [v67 count])) == 1)
            {
              v37 = [PLSearchSuggestionComponent alloc];
              if (v33) {
                uint64_t v38 = v26;
              }
              else {
                uint64_t v38 = 0;
              }
              if (v35) {
                uint64_t v39 = v31;
              }
              else {
                uint64_t v39 = 0;
              }
              v40 = -[PLSearchSuggestionComponent initWithGroup:matchedAssetsCount:matchedCollectionsCount:suggestionType:matchedText:matchRangeOfSearchText:](v37, "initWithGroup:matchedAssetsCount:matchedCollectionsCount:suggestionType:matchedText:matchRangeOfSearchText:", v21, v38, v39, 2, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
              [v62 addObject:v40];
              v41 = NSString;
              v42 = [v21 contentString];
              v43 = [v41 stringWithFormat:@"%@-%hd", v42, (int)objc_msgSend(v21, "category")];

              [v60 addObject:v43];
            }
          }
          if (v18 == ++v20)
          {
            uint64_t v18 = [obj countByEnumeratingWithState:&v69 objects:v100 count:16];
            if (v18) {
              goto LABEL_15;
            }
            break;
          }
        }
      }

      if ([(PSISuggestionQuery *)self cancelled])
      {
        v44 = PLSearchBackendQueryGetLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v45 = [(PSISuggestionQuery *)self formattedSearchText];
          *(_DWORD *)v94 = 138412290;
          uint64_t v95 = (uint64_t)v45;
          _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_INFO, "Next Token suggestions query for \"%@\" aborted because query was cancelled", v94, 0xCu);
        }
        id v13 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        v46 = PLSearchBackendQueryGetLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          uint64_t v47 = [v60 count];
          v48 = [(PSISuggestionQuery *)self formattedSearchText];
          *(_DWORD *)v94 = 134218498;
          uint64_t v95 = v47;
          __int16 v96 = 2112;
          v97 = v48;
          __int16 v98 = 2112;
          id v99 = v60;
          _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_INFO, "Generated %tu next token candidates for query: \"%@\": %@", v94, 0x20u);
        }
        v44 = [(id)objc_opt_class() _suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents:v62 assetIds:v91[3] collectionIds:v87[3]];
        v49 = +[PLScopedSearchSuggestionGeneration rankedSearchSuggestionsFromSuggestionCandidates:suggestionType:queryAssetCount:queryCollectionCount:suggestionLimit:suggestionQuery:](PLScopedSearchSuggestionGeneration, "rankedSearchSuggestionsFromSuggestionCandidates:suggestionType:queryAssetCount:queryCollectionCount:suggestionLimit:suggestionQuery:", v44, 2, [v67 count], objc_msgSend(v63, "count"), objc_msgSend(v68, "searchSuggestionLimit"), self);
        v50 = (const void *)v91[3];
        if (v50)
        {
          CFRelease(v50);
          v91[3] = 0;
        }
        v51 = (const void *)v87[3];
        if (v51)
        {
          CFRelease(v51);
          v87[3] = 0;
        }
        if ([(PSISuggestionQuery *)self cancelled])
        {
          v52 = PLSearchBackendQueryGetLog();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v53 = [(PSISuggestionQuery *)self formattedSearchText];
            *(_DWORD *)v94 = 138412290;
            uint64_t v95 = (uint64_t)v53;
            _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_INFO, "Next Token suggestions query for \"%@\" aborted because query was cancelled", v94, 0xCu);
          }
          id v13 = (id)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          v54 = PLSearchBackendQueryGetLog();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            uint64_t v55 = [v49 count];
            v56 = [(PSISuggestionQuery *)self formattedSearchText];
            *(_DWORD *)v94 = 134218242;
            uint64_t v95 = v55;
            __int16 v96 = 2112;
            v97 = v56;
            _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_INFO, "Generated %tu next token suggestions for query: \"%@\"", v94, 0x16u);
          }
          id v13 = v49;
        }
      }
    }

    _Block_object_dispose(&v79, 8);
    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);

  return v13;
}

uint64_t __81__PSISuggestionQuery__generateNextTokenSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  return result;
}

void __81__PSISuggestionQuery__generateNextTokenSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_37(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) addObjectsFromArray:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __81__PSISuggestionQuery__generateNextTokenSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) addObjectsFromArray:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_generateCompletionSuggestionsForAssetUUIDs:(id)a3 collectionUUIDs:(id)a4
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v88 = a3;
  id v89 = a4;
  v115 = self;
  uint64_t v93 = [(PSISuggestionQuery *)self formattedSearchText];
  v109 = [(PSISuggestionQuery *)self originalSearchtext];
  uint64_t v90 = [(PSISuggestionQuery *)self completionSuggestionTexts];
  LODWORD(a4) = [v90 count] == 0;
  uint64_t v6 = PLSearchBackendQueryGetLog();
  if (a4)
  {
    BOOL v17 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v93;
      uint64_t v18 = "Completion suggestions aborted because completion text could not be identified. Query string: \"%@\"";
LABEL_17:
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, v18, buf, 0xCu);
    }
LABEL_18:
    id v16 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_156;
  }
  id v7 = v6;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v90;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Begin completion generation for suggestion texts: %@", buf, 0xCu);
  }

  id v8 = [(PSISuggestionQuery *)self suggestionOptions];
  unint64_t v86 = [v8 searchSuggestionLimit];

  if (!v86)
  {
    BOOL v17 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v93;
      uint64_t v18 = "Completion suggestions aborted because the completion suggestion limit provided was zero. Query string: \"%@\"";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  uint64_t v106 = [(PSISuggestionQuery *)self photosEntityStore];
  __int16 v96 = [(PSISuggestionQuery *)self suggestionOptions];
  v9 = [(PSISuggestionQuery *)self suggestionOptions];
  int v94 = [v9 limitSuggestionsToExactTextMatches];

  id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v11 = [v96 suggestionCategories];
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke;
  v134[3] = &unk_1E58739B0;
  id v12 = v10;
  id v135 = v12;
  [v11 enumerateIndexesUsingBlock:v134];

  if ([v12 count])
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v132[0] = MEMORY[0x1E4F143A8];
    v132[1] = 3221225472;
    v132[2] = __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_2;
    v132[3] = &unk_1E58739B0;
    id v14 = v13;
    id v133 = v14;
    [v12 enumerateIndexesUsingBlock:v132];
    uint64_t v15 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v93;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Scoping suggestions query to categories: %@, for query string: \"%@\"", buf, 0x16u);
    }
  }
  if ([(PSISuggestionQuery *)v115 cancelled])
  {
    oslog = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v93;
      _os_log_impl(&dword_19B3C7000, oslog, OS_LOG_TYPE_INFO, "Completion suggestions aborted because query was cancelled. Query string: \"%@\"", buf, 0xCu);
    }
    id v16 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_155;
  }
  oslog = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [oslog addObjectsFromArray:v88];
  [oslog addObjectsFromArray:v89];
  int v111 = [v96 _wantsUnscopedSuggestions];
  int v112 = [v96 optionsWantSuggestionsForAssets];
  int v110 = [v96 optionsWantSuggestionsForCollections];
  if ((v111 & 1) == 0)
  {
    if (v112) {
      int v112 = [v88 count] != 0;
    }
    else {
      int v112 = 0;
    }
    if (v110) {
      int v110 = [v89 count] != 0;
    }
    else {
      int v110 = 0;
    }
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v145 = 0;
  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x2020000000;
  uint64_t v131 = 0;
  uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithArray:oslog];
  uint64_t v20 = [v96 suggestionResultTypes];
  v21 = [(PSISuggestionQuery *)v115 photosEntityStore];
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_18;
  v127[3] = &unk_1E58674B0;
  v127[4] = buf;
  v127[5] = &v128;
  +[PLScopedSearchUtilities searchIndexIdsFromUUIDs:v19 searchResultTypes:v20 psiDatabase:v21 completion:v127];

  if ([(PSISuggestionQuery *)v115 cancelled])
  {
    CFArrayRef v22 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v137 = 138412290;
      *(void *)&v137[4] = v93;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "Completion suggestions aborted because query was cancelled. Query string: \"%@\"", v137, 0xCu);
    }
    id v16 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_154;
  }
  CFArrayRef v23 = *(const __CFArray **)(*(void *)&buf[8] + 24);
  if (v23) {
    unint64_t Count = CFArrayGetCount(v23);
  }
  else {
    unint64_t Count = 0;
  }
  CFArrayRef v24 = (const __CFArray *)v129[3];
  if (v24) {
    unint64_t v91 = CFArrayGetCount(v24);
  }
  else {
    unint64_t v91 = 0;
  }
  long long v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v101 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  obuint64_t j = v90;
  v100 = v25;
  uint64_t v98 = [obj countByEnumeratingWithState:&v123 objects:v143 count:16];
  if (v98)
  {
    uint64_t v97 = *(void *)v124;
    do
    {
      for (uint64_t i = 0; i != v98; ++i)
      {
        if (*(void *)v124 != v97) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void **)(*((void *)&v123 + 1) + 8 * i);
        CFArrayRef v27 = [v109 string];
        uint64_t v114 = [v27 rangeOfString:v26 options:4];
        uint64_t v108 = v28;

        if (v114 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v29 = PLSearchBackendQueryGetLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v137 = 138412546;
            *(void *)&v137[4] = v26;
            __int16 v138 = 2112;
            v139 = v93;
            _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "SuggestionText (%@) not found in searchText (%@). Skipping suggestion text.", v137, 0x16u);
          }
          goto LABEL_121;
        }
        __int16 v30 = [v26 lowercaseString];
        uint64_t v105 = +[PSITokenizer fts5StringFromString:v30 useWildcard:v94 ^ 1u leadingAnchored:1];

        v107 = [v106 groupIdsMatchingString:v105 categories:0 textIsSearchable:1];
        uint64_t v31 = PLSearchBackendQueryGetLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = [v107 count];
          *(_DWORD *)v137 = 134218242;
          *(void *)&v137[4] = v32;
          __int16 v138 = 2112;
          v139 = v26;
          _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "Found %tu groups for suggestion text: %@.", v137, 0x16u);
        }

        v104 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v107, 0);
        v103 = -[NSObject groupArraysFromGroupIdSets:dateFilter:searchResultTypes:progressBlock:](v106, "groupArraysFromGroupIdSets:dateFilter:searchResultTypes:progressBlock:", v104, 0, [v96 suggestionResultTypes], &__block_literal_global_24490);
        [v106 resetGroupsCache];
        int v33 = [v103 firstObject];
        uint64_t v102 = (void *)[v33 mutableCopy];

        BOOL v34 = +[PLScopedSearchUtilities removeSynonymsOfOtherGroupsInGroups:v102];
        BOOL v35 = v34;
        if (v94)
        {
          uint64_t v36 = +[PLScopedSearchUtilities removeGroupsWithNonExactMatchTextFromGroups:v34 searchText:v26];

          BOOL v34 = (void *)v36;
        }
        id v99 = v34;
        if ([v34 count])
        {
          long long v122 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          long long v119 = 0u;
          v37 = v99;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v119 objects:v142 count:16];
          if (!v38) {
            goto LABEL_120;
          }
          uint64_t v39 = *(void *)v120;
          while (1)
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v120 != v39) {
                objc_enumerationMutation(v37);
              }
              v41 = *(void **)(*((void *)&v119 + 1) + 8 * j);
              if ([v12 count])
              {
                if ((objc_msgSend(v12, "containsIndex:", (int)objc_msgSend(v41, "category")) & 1) == 0) {
                  continue;
                }
              }
              else if (![(PSISuggestionQuery *)v115 _groupIsValidForSuggestionGeneration:v41 suggestionType:1])
              {
                continue;
              }
              if ([(PSISuggestionQuery *)v115 cancelled]) {
                goto LABEL_120;
              }
              if ([v41 assetIds]) {
                CFIndex v42 = CFArrayGetCount((CFArrayRef)[v41 assetIds]);
              }
              else {
                CFIndex v42 = 0;
              }
              if ([v41 collectionIds]) {
                CFIndex v43 = CFArrayGetCount((CFArrayRef)[v41 collectionIds]);
              }
              else {
                CFIndex v43 = 0;
              }
              if (!(v42 | v43))
              {
                v44 = PLSearchBackendQueryGetLog();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  v45 = [(PSISuggestionQuery *)v115 formattedSearchText];
                  *(_DWORD *)v137 = 138412546;
                  *(void *)&v137[4] = v41;
                  __int16 v138 = 2112;
                  v139 = v45;
                  _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_ERROR, "Erroneous group with zero assetIds and zero collectionIds: %@ for query: \"%@\".", v137, 0x16u);
                }
                continue;
              }
              if ([v41 intersectedAssetIds]
                && CFArrayGetCount((CFArrayRef)[v41 intersectedAssetIds]))
              {
                v46 = PLSearchBackendQueryGetLog();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v47 = [(PSISuggestionQuery *)v115 formattedSearchText];
                  *(_DWORD *)v137 = 138412546;
                  *(void *)&v137[4] = v41;
                  __int16 v138 = 2112;
                  v139 = v47;
                  _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_ERROR, "Erroneous group with non-zero intersected assetIds: %@ for query: \"%@\".", v137, 0x16u);
                }
              }
              *(void *)v137 = 0;
              CFArrayRef Copy = (CFArrayRef)[v41 assetIds];
              if (Copy) {
                CFArrayRef Copy = CFArrayCreateCopy(0, (CFArrayRef)[v41 assetIds]);
              }
              *(void *)v137 = Copy;
              if (!v112) {
                goto LABEL_88;
              }
              if (!v111)
              {
                +[PLScopedSearchUtilities intersectSortedArray:v137 withOtherSortedArray:*(void *)(*(void *)&buf[8] + 24) intersectionLimit:0];
                if (*(void *)v137
                  && *(void *)(*(void *)&buf[8] + 24)
                  && CFArrayGetCount(*(CFArrayRef *)v137) - 1 < Count)
                {
                  [v41 resetIntersectedIds];
                  int v50 = 1;
                  [v41 updateWithIntersectedIds:*(void *)v137 searchResultType:1];
                  goto LABEL_89;
                }
LABEL_88:
                int v50 = 0;
                goto LABEL_89;
              }
              if ([v41 assetIds]) {
                BOOL v49 = v42 == 0;
              }
              else {
                BOOL v49 = 1;
              }
              int v50 = !v49;
LABEL_89:
              CFArrayRef theArray = 0;
              CFArrayRef v51 = (const __CFArray *)[v41 collectionIds];
              if (v51) {
                CFArrayRef v51 = CFArrayCreateCopy(0, (CFArrayRef)[v41 collectionIds]);
              }
              CFArrayRef theArray = v51;
              if (!v110) {
                goto LABEL_103;
              }
              if (!v111)
              {
                +[PLScopedSearchUtilities intersectSortedArray:&theArray withOtherSortedArray:v129[3] intersectionLimit:0];
                if (theArray && v129[3] && CFArrayGetCount(theArray) - 1 < v91)
                {
                  [v41 resetIntersectedIds];
                  [v41 updateWithIntersectedIds:theArray searchResultType:2];
                  int v53 = 1;
LABEL_105:
                  v54 = [PLSearchSuggestionComponent alloc];
                  if (v50)
                  {
                    CFIndex v55 = CFArrayGetCount(*(CFArrayRef *)v137);
                    if (!v53) {
                      goto LABEL_107;
                    }
LABEL_109:
                    CFIndex v56 = CFArrayGetCount(theArray);
                  }
                  else
                  {
                    CFIndex v55 = 0;
                    if (v53) {
                      goto LABEL_109;
                    }
LABEL_107:
                    CFIndex v56 = 0;
                  }
                  v57 = [v109 string];
                  int v58 = -[PLSearchSuggestionComponent initWithGroup:matchedAssetsCount:matchedCollectionsCount:suggestionType:matchedText:matchRangeOfSearchText:](v54, "initWithGroup:matchedAssetsCount:matchedCollectionsCount:suggestionType:matchedText:matchRangeOfSearchText:", v41, v55, v56, 1, v57, v114, v108);

                  [v100 addObject:v58];
                  int v59 = NSString;
                  id v60 = [v41 contentString];
                  v61 = [v59 stringWithFormat:@"%@-%hd", v60, (int)objc_msgSend(v41, "category")];

                  [v101 addObject:v61];
                  goto LABEL_111;
                }
LABEL_103:
                int v53 = 0;
                goto LABEL_104;
              }
              if ([v41 collectionIds]) {
                BOOL v52 = v43 == 0;
              }
              else {
                BOOL v52 = 1;
              }
              int v53 = !v52;
LABEL_104:
              if ((v50 | v53) == 1) {
                goto LABEL_105;
              }
LABEL_111:
              if (*(void *)v137)
              {
                CFRelease(*(CFTypeRef *)v137);
                *(void *)v137 = 0;
              }
              if (theArray) {
                CFRelease(theArray);
              }
            }
            uint64_t v38 = [v37 countByEnumeratingWithState:&v119 objects:v142 count:16];
            if (!v38) {
              goto LABEL_120;
            }
          }
        }
        v37 = PLSearchBackendQueryGetLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v62 = [(PSISuggestionQuery *)v115 formattedSearchText];
          *(_DWORD *)v137 = 138412290;
          *(void *)&v137[4] = v62;
          _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "Found no filtered groups for query: \"%@\".", v137, 0xCu);
        }
LABEL_120:

        id v29 = v105;
LABEL_121:
      }
      uint64_t v98 = [obj countByEnumeratingWithState:&v123 objects:v143 count:16];
    }
    while (v98);
  }

  if (![(PSISuggestionQuery *)v115 cancelled])
  {
    v65 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v66 = [v101 count];
      *(_DWORD *)v137 = 134218498;
      *(void *)&v137[4] = v66;
      __int16 v138 = 2112;
      v139 = v93;
      __int16 v140 = 2112;
      id v141 = v101;
      _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_DEFAULT, "Generated %tu completion candidates for query \"%@\": %@", v137, 0x20u);
    }

    v63 = [(id)objc_opt_class() _suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents:v100 assetIds:*(void *)(*(void *)&buf[8] + 24) collectionIds:v129[3]];
    if (v94)
    {
      id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v68 = v117;
      v117[0] = MEMORY[0x1E4F143A8];
      v117[1] = 3221225472;
      v117[2] = __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_28;
      v117[3] = &unk_1E586B7D0;
      id v69 = v67;
      v117[4] = v69;
      [v63 enumerateKeysAndObjectsUsingBlock:v117];
      long long v70 = +[PLScopedSearchSuggestionGeneration sortedSuggestionsFromSuggestions:v69];
      unint64_t v71 = [v69 count];
      if (v71 >= v86) {
        unint64_t v72 = v86;
      }
      else {
        unint64_t v72 = v71;
      }
      uint64_t v73 = objc_msgSend(v70, "subarrayWithRange:", 0, v72);
    }
    else
    {
      if ([v12 count] != 1)
      {
        v78 = +[PLScopedSearchSuggestionGeneration rankedSearchSuggestionsFromSuggestionCandidates:suggestionType:queryAssetCount:queryCollectionCount:suggestionLimit:suggestionQuery:](PLScopedSearchSuggestionGeneration, "rankedSearchSuggestionsFromSuggestionCandidates:suggestionType:queryAssetCount:queryCollectionCount:suggestionLimit:suggestionQuery:", v63, 1, [v88 count], objc_msgSend(v89, "count"), v86, v115);
        goto LABEL_141;
      }
      id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v68 = v116;
      v116[0] = MEMORY[0x1E4F143A8];
      v116[1] = 3221225472;
      v116[2] = __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_2_31;
      v116[3] = &unk_1E586B7D0;
      id v69 = v74;
      v116[4] = v69;
      [v63 enumerateKeysAndObjectsUsingBlock:v116];
      long long v70 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
      v136 = v70;
      v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v136 count:1];
      [v69 sortUsingDescriptors:v75];

      unint64_t v76 = [v69 count];
      if (v76 >= v86) {
        unint64_t v77 = v86;
      }
      else {
        unint64_t v77 = v76;
      }
      uint64_t v73 = objc_msgSend(v69, "subarrayWithRange:", 0, v77);
    }
    v78 = (void *)v73;

LABEL_141:
    uint64_t v79 = *(const void **)(*(void *)&buf[8] + 24);
    if (v79)
    {
      CFRelease(v79);
      *(void *)(*(void *)&buf[8] + 24) = 0;
    }
    v80 = (const void *)v129[3];
    if (v80)
    {
      CFRelease(v80);
      v129[3] = 0;
    }
    if ([(PSISuggestionQuery *)v115 cancelled])
    {
      uint64_t v81 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        v82 = [(PSISuggestionQuery *)v115 formattedSearchText];
        *(_DWORD *)v137 = 138412290;
        *(void *)&v137[4] = v82;
        _os_log_impl(&dword_19B3C7000, v81, OS_LOG_TYPE_INFO, "Completion suggestions aborted because query was cancelled. Query: \"%@\".", v137, 0xCu);
      }
      id v16 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v83 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
      {
        uint64_t v84 = [v78 count];
        *(_DWORD *)v137 = 134218242;
        *(void *)&v137[4] = v84;
        __int16 v138 = 2112;
        v139 = v93;
        _os_log_impl(&dword_19B3C7000, v83, OS_LOG_TYPE_INFO, "Generated %tu completion suggestions for query: \"%@\"", v137, 0x16u);
      }

      id v16 = v78;
    }

    goto LABEL_153;
  }
  v63 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    v64 = [(PSISuggestionQuery *)v115 formattedSearchText];
    *(_DWORD *)v137 = 138412290;
    *(void *)&v137[4] = v64;
    _os_log_impl(&dword_19B3C7000, v63, OS_LOG_TYPE_INFO, "Completion suggestions aborted because query was cancelled. Query: \"%@\".", v137, 0xCu);
  }
  id v16 = (id)MEMORY[0x1E4F1CBF0];
LABEL_153:

  CFArrayRef v22 = v100;
LABEL_154:

  _Block_object_dispose(&v128, 8);
  _Block_object_dispose(buf, 8);
LABEL_155:

  BOOL v17 = v106;
LABEL_156:

  return v16;
}

void __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  PLSearchIndexCategoriesForPLSearchSuggestionCategoriesType(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addIndexes:v3];
}

void __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  PLDebugStringForSearchIndexCategory(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v3];
}

uint64_t __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_18(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  return result;
}

uint64_t __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

uint64_t __82__PSISuggestionQuery__generateCompletionSuggestionsForAssetUUIDs_collectionUUIDs___block_invoke_2_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (BOOL)cancelled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  obj->_BOOL cancelled = a3;
  objc_sync_exit(obj);
}

- (void)cancel
{
}

- (id)performQueryWithSearchResultAssetUUIDs:(id)a3 collectionUUIDs:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PSISuggestionQuery *)self formattedSearchText];
  if (![v8 length])
  {
    id v16 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_20;
  }
  v9 = [(PSISuggestionQuery *)self suggestionOptions];
  if ([v9 searchSuggestionLimit])
  {
    if ([v6 count])
    {
      [v9 _wantsUnscopedSuggestions];
LABEL_5:
      id v10 = [(PSISuggestionQuery *)self suggestionOptions];
      uint64_t v11 = [v10 searchSuggestionType];

      switch(v11)
      {
        case 0:
        case 3:
        case 4:
          id v12 = PLSearchBackendQueryGetLog();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          int v33 = 138412290;
          BOOL v34 = v8;
          id v13 = "Suggestions query for \"%@\" aborted because the required suggestion type was unexpected";
          id v14 = v12;
          os_log_type_t v15 = OS_LOG_TYPE_ERROR;
          goto LABEL_16;
        case 1:
          PLPhotosSearchGetLog();
          uint64_t v19 = (id)objc_claimAutoreleasedReturnValue();
          os_signpost_id_t v20 = os_signpost_id_generate(v19);

          v21 = v19;
          CFArrayRef v22 = v21;
          if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
          {
            LOWORD(v33) = 0;
            _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PLSearchCompletionSuggestionsSignpost", "", (uint8_t *)&v33, 2u);
          }

          id v16 = [(PSISuggestionQuery *)self _generateCompletionSuggestionsForAssetUUIDs:v6 collectionUUIDs:v7];
          CFArrayRef v23 = v22;
          id v12 = v23;
          if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
          {
            LOWORD(v33) = 0;
            _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_END, v20, "PLSearchCompletionSuggestionsSignpost", "", (uint8_t *)&v33, 2u);
          }
          goto LABEL_29;
        case 2:
          CFArrayRef v24 = [(PSISuggestionQuery *)self suggestionOptions];
          int v25 = [v24 enableNextTokenSuggestions];

          if (!v25) {
            goto LABEL_36;
          }
          uint64_t v26 = [(PSISuggestionQuery *)self suggestionOptions];
          unint64_t v27 = [v26 minNumberOfResultsForNextTokenGeneration];

          PLPhotosSearchGetLog();
          uint64_t v28 = (id)objc_claimAutoreleasedReturnValue();
          os_signpost_id_t v29 = os_signpost_id_generate(v28);

          __int16 v30 = v28;
          uint64_t v31 = v30;
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
          {
            LOWORD(v33) = 0;
            _os_signpost_emit_with_name_impl(&dword_19B3C7000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "PLSearchNextTokenSuggestionsSignpost", "", (uint8_t *)&v33, 2u);
          }

          if ([v6 count] >= v27)
          {
            id v16 = [(PSISuggestionQuery *)self _generateNextTokenSuggestionsForAssetUUIDs:v6 collectionUUIDs:v7];
          }
          else
          {
            id v16 = (void *)MEMORY[0x1E4F1CBF0];
          }
          uint64_t v32 = v31;
          id v12 = v32;
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
          {
            LOWORD(v33) = 0;
            _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_END, v29, "PLSearchNextTokenSuggestionsSignpost", "", (uint8_t *)&v33, 2u);
          }
LABEL_29:

          goto LABEL_18;
        default:
LABEL_36:
          id v16 = (void *)MEMORY[0x1E4F1CBF0];
          goto LABEL_19;
      }
    }
    uint64_t v17 = [v7 count];
    if (([v9 _wantsUnscopedSuggestions] & 1) != 0 || v17) {
      goto LABEL_5;
    }
    id v12 = PLSearchBackendQueryGetLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    int v33 = 138412290;
    BOOL v34 = v8;
    id v13 = "Suggestions query for \"%@\" aborted because no scoping search results were provided";
  }
  else
  {
    id v12 = PLSearchBackendQueryGetLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    int v33 = 138412290;
    BOOL v34 = v8;
    id v13 = "Suggestions query for \"%@\" aborted because the suggestion limit provided was zero";
  }
  id v14 = v12;
  os_log_type_t v15 = OS_LOG_TYPE_INFO;
LABEL_16:
  _os_log_impl(&dword_19B3C7000, v14, v15, v13, (uint8_t *)&v33, 0xCu);
LABEL_17:
  id v16 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_18:

LABEL_19:
LABEL_20:

  return v16;
}

- (PSISuggestionQuery)initWithFormattedSearchText:(id)a3 originalSearchText:(id)a4 completionSuggestionTexts:(id)a5 suggestionOptions:(id)a6 suggestionComponents:(id)a7 photosEntityStore:(id)a8
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    int v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PSISuggestionQuery.m", 44, @"Invalid parameter not satisfying: %@", @"formattedSearchText" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v18) {
        goto LABEL_4;
      }
LABEL_13:
      uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:a2, self, @"PSISuggestionQuery.m", 46, @"Invalid parameter not satisfying: %@", @"suggestionOptions" object file lineNumber description];

      if (v20) {
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }
  BOOL v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"PSISuggestionQuery.m", 45, @"Invalid parameter not satisfying: %@", @"originalSearchText" object file lineNumber description];

  if (!v18) {
    goto LABEL_13;
  }
LABEL_4:
  if (v20)
  {
LABEL_5:
    v38.receiver = self;
    v38.super_class = (Class)PSISuggestionQuery;
    v21 = [(PSISuggestionQuery *)&v38 init];
    if (v21)
    {
      uint64_t v22 = [v15 copy];
      formattedSearchText = v21->_formattedSearchText;
      v21->_formattedSearchText = (NSAttributedString *)v22;

      uint64_t v24 = [v16 copy];
      originalSearchtext = v21->_originalSearchtext;
      v21->_originalSearchtext = (NSAttributedString *)v24;

      uint64_t v26 = [v18 copy];
      suggestionOptions = v21->_suggestionOptions;
      v21->_suggestionOptions = (PSISuggestionOptions *)v26;

      objc_storeStrong((id *)&v21->_photosEntityStore, a8);
      uint64_t v28 = [v17 copy];
      completionSuggestionTexts = v21->_completionSuggestionTexts;
      v21->_completionSuggestionTexts = (NSArray *)v28;

      if (v19)
      {
        uint64_t v30 = [v19 copy];
        suggestionComponents = v21->_suggestionComponents;
        v21->_suggestionComponents = (NSArray *)v30;
      }
      else
      {
        suggestionComponents = v21->_suggestionComponents;
        v21->_suggestionComponents = (NSArray *)MEMORY[0x1E4F1CBF0];
      }
    }
    self = v21;
    uint64_t v32 = self;
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v36 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v40 = v15;
    _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_INFO, "Unexpected nil photos entity store, aborting initialization of query: \"%@\"", buf, 0xCu);
  }

  uint64_t v32 = 0;
LABEL_17:

  return v32;
}

+ (id)_suggestionCandidatesByContentStringFromSuggestionComponents:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PSISuggestionQuery__suggestionCandidatesByContentStringFromSuggestionComponents___block_invoke;
  v9[3] = &unk_1E58674D8;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  id v7 = (void *)[v6 copy];
  return v7;
}

void __83__PSISuggestionQuery__suggestionCandidatesByContentStringFromSuggestionComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [v3 contentString];
  id v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
    id v6 = (id)[v5 mutableCopy];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }

  [v6 addObject:v3];
  id v7 = (void *)[v6 copy];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
}

+ (id)_suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents:(id)a3 assetIds:(__CFArray *)a4 collectionIds:(__CFArray *)a5
{
  id v8 = a3;
  if ([v8 count])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __117__PSISuggestionQuery__suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents_assetIds_collectionIds___block_invoke;
    v20[3] = &unk_1E58674D8;
    id v21 = v9;
    id v10 = v9;
    [v8 enumerateObjectsUsingBlock:v20];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __117__PSISuggestionQuery__suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents_assetIds_collectionIds___block_invoke_2;
    v15[3] = &unk_1E5867528;
    id v18 = a4;
    id v19 = a5;
    id v16 = v11;
    id v17 = a1;
    id v12 = v11;
    [v10 enumerateKeysAndObjectsUsingBlock:v15];
    id v13 = (void *)[v12 copy];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v13;
}

void __117__PSISuggestionQuery__suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents_assetIds_collectionIds___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PLSearchSuggestionCategoriesTypeForSearchIndexCategory([v3 indexCategory]);
  id v5 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithUnsignedInteger:v4];
  id v7 = [v5 objectForKeyedSubscript:v6];
  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [NSNumber numberWithUnsignedInteger:v4];
    id v10 = [v8 objectForKeyedSubscript:v9];
    id v14 = (id)[v10 mutableCopy];
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }

  [v14 addObject:v3];
  id v11 = (void *)[v14 copy];
  id v12 = *(void **)(a1 + 32);
  id v13 = [NSNumber numberWithUnsignedInteger:v4];
  [v12 setObject:v11 forKeyedSubscript:v13];
}

void __117__PSISuggestionQuery__suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents_assetIds_collectionIds___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 40) _suggestionCandidatesByContentStringFromSuggestionComponents:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __117__PSISuggestionQuery__suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents_assetIds_collectionIds___block_invoke_3;
  v8[3] = &unk_1E5867500;
  id v9 = v5;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v10 = *(id *)(a1 + 32);
  id v7 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __117__PSISuggestionQuery__suggestionCandidatesBySuggestionCategoriesTypeFromSuggestionComponents_assetIds_collectionIds___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v69 = [*(id *)(a1 + 32) unsignedIntegerValue];
  id v7 = [v6 firstObject];
  uint64_t v8 = [v7 suggestionType];

  id v9 = [v6 firstObject];
  uint64_t v10 = [v9 matchRangeOfSearchText];
  uint64_t v67 = v11;
  uint64_t v68 = v10;

  id v12 = [v6 firstObject];
  uint64_t v13 = [v12 matchedText];

  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFArrayRef v15 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  id v16 = CFArrayCreate(v14, 0, 0, 0);
  if (v8 == 2)
  {
    BOOL v66 = [v6 count] == 1;
    BOOL v73 = (unint64_t)[v6 count] > 1;
  }
  else
  {
    BOOL v66 = 0;
    BOOL v73 = 0;
  }
  long long v70 = (void *)v13;
  unint64_t v71 = v5;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  obuint64_t j = v6;
  uint64_t v74 = v8;
  uint64_t v77 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
  if (!v77) {
    goto LABEL_74;
  }
  uint64_t v17 = *(void *)v82;
  uint64_t v72 = a1;
  BOOL v18 = v73;
  uint64_t v75 = *(void *)v82;
  do
  {
    for (uint64_t i = 0; i != v77; ++i)
    {
      if (*(void *)v82 != v17) {
        objc_enumerationMutation(obj);
      }
      id v20 = [*(id *)(*((void *)&v81 + 1) + 8 * i) group];
      id v21 = v20;
      CFTypeRef cf = 0;
      if (v8 == 1)
      {
        uint64_t v22 = (const void *)[v20 intersectedAssetIds];
        CFTypeRef v79 = 0;
        CFTypeRef cf = v22;
        CFArrayRef v23 = (const void *)[v21 intersectedCollectionIds];
      }
      else
      {
        CFArrayRef v23 = 0;
      }
      CFTypeRef v79 = v23;
      if (v18)
      {
        CFArrayRef Copy = (CFArrayRef)[v21 assetIds];
        if (Copy) {
          CFArrayRef Copy = CFArrayCreateCopy(0, (CFArrayRef)[v21 assetIds]);
        }
        CFTypeRef cf = Copy;
        int v25 = (const void *)[v21 collectionIds];
        if (v25) {
          int v25 = CFArrayCreateCopy(0, (CFArrayRef)[v21 collectionIds]);
        }
        CFTypeRef v79 = v25;
        if (cf)
        {
          uint64_t v26 = *(void *)(a1 + 48);
          if (v26)
          {
            +[PLScopedSearchUtilities intersectSortedArray:&cf withOtherSortedArray:v26 intersectionLimit:0];
            int v25 = v79;
          }
        }
        if (v25)
        {
          uint64_t v27 = *(void *)(a1 + 56);
          if (v27) {
            +[PLScopedSearchUtilities intersectSortedArray:&v79 withOtherSortedArray:v27 intersectionLimit:0];
          }
        }
      }
      v78 = v21;
      CFTypeRef v28 = cf;
      if (cf)
      {
        if (!v15 || (CFIndex Count = CFArrayGetCount(v15)) == 0)
        {
          Mutable = (__CFArray *)CFRetain(v28);
          goto LABEL_41;
        }
        unint64_t v30 = Count;
        CFIndex v31 = CFArrayGetCount((CFArrayRef)v28);
        if (v31)
        {
          unint64_t v32 = v31;
          Mutable = CFArrayCreateMutable(0, v31 + v30, 0);
          unint64_t v34 = 0;
          unint64_t v35 = 0;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v15, v34);
            v37 = CFArrayGetValueAtIndex((CFArrayRef)v28, v35);
            if (ValueAtIndex < v37) {
              objc_super v38 = ValueAtIndex;
            }
            else {
              objc_super v38 = v37;
            }
            if (ValueAtIndex <= v37) {
              ++v34;
            }
            if (ValueAtIndex >= v37) {
              ++v35;
            }
            CFArrayAppendValue(Mutable, v38);
          }
          while (v30 > v34 && v32 > v35);
          v87.location = v34;
          v87.length = v30 - v34;
          CFArrayAppendArray(Mutable, v15, v87);
          v88.length = v32 - v35;
          v88.location = v35;
          CFArrayAppendArray(Mutable, (CFArrayRef)v28, v88);
          a1 = v72;
          uint64_t v8 = v74;
          uint64_t v17 = v75;
          BOOL v18 = v73;
LABEL_41:
          CFTypeRef v40 = CFAutorelease(Mutable);
          if (!v15)
          {
LABEL_45:
            CFArrayRef v15 = (const __CFArray *)CFRetain(v40);
            if (v18) {
              CFRelease(cf);
            }
            goto LABEL_47;
          }
        }
        else
        {
          CFTypeRef v41 = CFRetain(v15);
          CFTypeRef v40 = CFAutorelease(v41);
          uint64_t v17 = v75;
        }
        CFRelease(v15);
        goto LABEL_45;
      }
LABEL_47:
      CFArrayRef v42 = (const __CFArray *)v79;
      if (!v79)
      {
        CFIndex v55 = v78;
        goto LABEL_72;
      }
      if (v16 && (CFIndex v43 = CFArrayGetCount((CFArrayRef)v16)) != 0)
      {
        unint64_t v44 = v43;
        CFIndex v45 = CFArrayGetCount(v42);
        if (!v45)
        {
          CFTypeRef v56 = CFRetain(v16);
          CFTypeRef v54 = CFAutorelease(v56);
          uint64_t v17 = v75;
          CFIndex v55 = v78;
LABEL_69:
          CFRelease(v16);
          goto LABEL_70;
        }
        unint64_t v46 = v45;
        uint64_t v47 = CFArrayCreateMutable(0, v45 + v44, 0);
        unint64_t v48 = 0;
        unint64_t v49 = 0;
        do
        {
          int v50 = CFArrayGetValueAtIndex((CFArrayRef)v16, v48);
          CFArrayRef v51 = CFArrayGetValueAtIndex(v42, v49);
          if (v50 < v51) {
            BOOL v52 = v50;
          }
          else {
            BOOL v52 = v51;
          }
          if (v50 <= v51) {
            ++v48;
          }
          if (v50 >= v51) {
            ++v49;
          }
          CFArrayAppendValue(v47, v52);
        }
        while (v44 > v48 && v46 > v49);
        v89.location = v48;
        v89.length = v44 - v48;
        CFArrayAppendArray(v47, (CFArrayRef)v16, v89);
        v90.length = v46 - v49;
        v90.location = v49;
        CFArrayAppendArray(v47, v42, v90);
        a1 = v72;
        uint64_t v8 = v74;
        uint64_t v17 = v75;
        BOOL v18 = v73;
      }
      else
      {
        uint64_t v47 = (__CFArray *)CFRetain(v42);
      }
      CFTypeRef v54 = CFAutorelease(v47);
      CFIndex v55 = v78;
      if (v16) {
        goto LABEL_69;
      }
LABEL_70:
      id v16 = CFRetain(v54);
      if (v18) {
        CFRelease(v79);
      }
LABEL_72:
    }
    uint64_t v77 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
  }
  while (v77);
LABEL_74:

  if (v15) {
    CFIndex v57 = CFArrayGetCount(v15);
  }
  else {
    CFIndex v57 = 0;
  }
  if (v16) {
    CFIndex v58 = CFArrayGetCount((CFArrayRef)v16);
  }
  else {
    CFIndex v58 = 0;
  }
  if (v66)
  {
    int v59 = [obj firstObject];
    CFIndex v57 = [v59 matchedAssetsCount];

    id v60 = [obj firstObject];
    CFIndex v58 = [v60 matchedCollectionsCount];
  }
  v61 = -[PLSearchSuggestion initWithContentString:categoriesType:suggestionType:matchedAssetsCount:matchedCollectionsCount:matchedText:matchRangeOfSearchText:suggestionComponents:]([PLSearchSuggestion alloc], "initWithContentString:categoriesType:suggestionType:matchedAssetsCount:matchedCollectionsCount:matchedText:matchRangeOfSearchText:suggestionComponents:", v71, v69, v74, v57, v58, v70, v68, v67, obj);
  v62 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v62)
  {
    v63 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 32)];
    id v64 = (id)[v63 mutableCopy];
  }
  else
  {
    id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }

  [v64 addObject:v61];
  v65 = (void *)[v64 copy];
  [*(id *)(a1 + 40) setObject:v65 forKeyedSubscript:*(void *)(a1 + 32)];

  if (v15) {
    CFRelease(v15);
  }
  if (v16) {
    CFRelease(v16);
  }
}

@end