@interface PLInitialSuggestionsManager
+ (BOOL)_groupIsMePerson:(id)a3 mePersonUUID:(id)a4;
+ (id)_dateTemplateCandidatesFromTemplates:(id)a3 assetIdsByDateFilter:(id)a4 scopedAssetIds:(__CFArray *)a5 minResultCountPerSuggestion:(unint64_t)a6 suggestionStyleType:(unint64_t)a7;
+ (id)_fetchAssetIdsForDateFilters:(id)a3 psiDatabase:(id)a4;
+ (id)_mePersonUUIDForPhotoLibrary:(id)a3;
+ (id)_rankedGroupsFromPSIDatabase:(id)a3 photoLibrary:(id)a4 assetIds:(__CFArray *)a5 templateProvider:(id)a6 mePersonUUID:(id)a7 minResultCountPerSuggestion:(unint64_t)a8;
+ (id)_singleEntitySearchCandidatesFromRankedGroups:(id)a3 minAssetResultCountPerSuggestion:(unint64_t)a4 locale:(id)a5;
+ (id)_templateCandidatesForFirstRankedGroup:(id)a3 secondRankedGroup:(id)a4 allTemplates:(id)a5 assetIdsByDateFilter:(id)a6 scopedAssetIdsCount:(unint64_t)a7 templateProvider:(id)a8 mePersonExists:(BOOL)a9 minResultCountPerSuggestion:(unint64_t)a10;
+ (id)_templateCandidatesFromRankedGroups:(id)a3 assetIdsByDateFilter:(id)a4 scopedAssetIds:(__CFArray *)a5 templateProvider:(id)a6 mePersonExists:(BOOL)a7 shouldGenerateAllSuggestions:(BOOL)a8 minResultCountPerSuggestion:(unint64_t)a9 suggestionStyleType:(unint64_t)a10;
+ (id)_updatedCandidateFromCandidate:(id)a3 firstGroup:(id)a4 secondGroup:(id)a5 firstGroupDisplayString:(id)a6 secondGroupDisplayString:(id)a7 dateFilter:(id)a8 todayDate:(id)a9 locale:(id)a10 minResultCountPerSuggestion:(unint64_t)a11 suggestionStyleType:(unint64_t)a12;
+ (id)_updatedGroupFromGroup:(id)a3 psiDatabase:(id)a4;
+ (id)rankedGroupCandidatesForInitialSuggestionsForPhotoLibrary:(id)a3;
+ (id)sharedManager;
+ (id)validateInitialSuggestions:(id)a3 minResultCountPerSuggestion:(unint64_t)a4 psiDatabase:(id)a5 suggestionStyleType:(unint64_t)a6;
+ (unint64_t)recentAssetLimitForInitialSuggestionGenerationForIndexedAssetCount:(unint64_t)a3;
+ (unint64_t)scaledMinimumNumberOfResultsPerSuggestion:(unint64_t)a3;
+ (void)generateInitialSuggestionsForPhotoLibrary:(id)a3;
+ (void)generateInitialSuggestionsForPhotoLibrary:(id)a3 styleType:(unint64_t)a4;
- (NSArray)cachedInitialSuggestions;
- (id)_generateSuggestionsOnDemandWithLimitOfMostRecentAssets:(unint64_t)a3 suggestionLimit:(unint64_t)a4 minimumNumberOfResultsPerSuggestion:(unint64_t)a5 photoLibrary:(id)a6 psiDatabase:(id)a7 minResultCountPerSuggestion:(unint64_t)a8 locale:(id)a9 shouldGenerateAllSuggestions:(BOOL)a10 suggestionStyleType:(unint64_t)a11;
- (id)_preGeneratedInitialSuggestionsForPhotoLibrary:(id)a3 minResultCountPerSuggestion:(unint64_t)a4 suggestionLimit:(unint64_t)a5 psiDatabase:(id)a6 locale:(id)a7 suggestionStyleType:(unint64_t)a8;
- (id)fetchInitialSuggestionsWithLimit:(unint64_t)a3 minimumResultCountPerSuggestion:(unint64_t)a4 suggestionStyleType:(unint64_t)a5 photoLibrary:(id)a6 psiDatabase:(id)a7;
- (unint64_t)cachedTotalNumberOfIndexedAssets;
- (void)setCachedInitialSuggestions:(id)a3;
- (void)setCachedTotalNumberOfIndexedAssets:(unint64_t)a3;
@end

@implementation PLInitialSuggestionsManager

+ (id)_updatedCandidateFromCandidate:(id)a3 firstGroup:(id)a4 secondGroup:(id)a5 firstGroupDisplayString:(id)a6 secondGroupDisplayString:(id)a7 dateFilter:(id)a8 todayDate:(id)a9 locale:(id)a10 minResultCountPerSuggestion:(unint64_t)a11 suggestionStyleType:(unint64_t)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v55 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  if (v17)
  {
    v54 = v21;
    if (v18)
    {
      v24 = [v18 contentString];
      BOOL v25 = [v24 length] == 0;

      if (v19)
      {
LABEL_4:
        v26 = [v19 contentString];
        BOOL v27 = [v26 length] == 0;

        goto LABEL_8;
      }
    }
    else
    {
      BOOL v25 = 0;
      if (v19) {
        goto LABEL_4;
      }
    }
    BOOL v27 = 0;
LABEL_8:
    if (v25 || v27)
    {
      v28 = 0;
      id v21 = v54;
    }
    else
    {
      id v52 = v19;
      id v53 = v20;
      v29 = [v17 suggestionTemplate];
      v50 = [PLSearchSuggestionTemplate alloc];
      v30 = [v29 suggestionTemplateKey];
      uint64_t v48 = [v29 firstIndexCategory];
      uint64_t v31 = [v29 secondIndexCategory];
      v47 = v17;
      uint64_t v32 = [v29 templateType];
      id v33 = v18;
      uint64_t v34 = [v29 templateContentType];
      uint64_t v35 = [v29 templateDateType];
      v36 = [v29 identifier];
      uint64_t v37 = v34;
      id v18 = v33;
      v51 = [(PLSearchSuggestionTemplate *)v50 initWithSuggestionTemplateKey:v30 firstIndexCategory:v48 secondIndexCategory:v31 templateType:v32 templateContentType:v37 templateDateType:v35 styleType:a12 identifier:v36 todayDate:v22 locale:v23];

      if (v33)
      {
        v38 = [PSIRankedGroupV2 alloc];
        id v17 = v47;
        v39 = [v47 firstGroup];
        v49 = -[PSIRankedGroupV2 initWithGroup:displayString:isMePerson:](v38, "initWithGroup:displayString:isMePerson:", v33, v55, [v39 isMePerson]);

        id v19 = v52;
      }
      else
      {
        v49 = 0;
        id v19 = v52;
        id v17 = v47;
      }
      if (v19)
      {
        v40 = [PSIRankedGroupV2 alloc];
        v41 = [v17 secondGroup];
        v42 = -[PSIRankedGroupV2 initWithGroup:displayString:isMePerson:](v40, "initWithGroup:displayString:isMePerson:", v19, v53, [v41 isMePerson]);
      }
      else
      {
        v42 = 0;
      }
      v43 = [PLSearchSuggestionCandidate alloc];
      uint64_t v44 = [v54 assetIds];
      v45 = v43;
      id v21 = v54;
      v28 = [(PLSearchSuggestionCandidate *)v45 initWithSearchSuggestionTemplate:v51 firstGroup:v49 secondGroup:v42 assetIdsForDateFilter:v44 minAssetResultCountPerSuggestion:a11 styleType:a12];
      [v17 timeSinceLastUsed];
      -[PLSearchSuggestionCandidate setTimeSinceLastUsed:](v28, "setTimeSinceLastUsed:");

      id v20 = v53;
    }
    goto LABEL_17;
  }
  v28 = 0;
LABEL_17:

  return v28;
}

+ (id)validateInitialSuggestions:(id)a3 minResultCountPerSuggestion:(unint64_t)a4 psiDatabase:(id)a5 suggestionStyleType:(unint64_t)a6
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v64 = a5;
  v57 = [MEMORY[0x1E4F1C9C8] date];
  v56 = [MEMORY[0x1E4F1CA20] currentLocale];
  v9 = [[PLSearchSuggestionTemplateProvider alloc] initWithLocale:v56];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v74 objects:v83 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v75 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v74 + 1) + 8 * i) suggestionTemplate];
        id v17 = -[PLSearchSuggestionTemplateProvider dateFilterForSearchSuggestionTemplateDateType:](v9, "dateFilterForSearchSuggestionTemplateDateType:", [v16 templateDateType]);

        if (v17) {
          [v10 addObject:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v74 objects:v83 count:16];
    }
    while (v13);
  }
  v54 = v9;

  id v53 = v10;
  v62 = [(id)objc_opt_class() _fetchAssetIdsForDateFilters:v10 psiDatabase:v64];
  id v55 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v71;
    id v60 = v18;
    unint64_t v61 = a6;
    uint64_t v59 = *(void *)v71;
    do
    {
      uint64_t v22 = 0;
      uint64_t v63 = v20;
      do
      {
        if (*(void *)v71 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v70 + 1) + 8 * v22);
        if ([v23 styleType] == a6)
        {
          v24 = [v23 suggestionTemplate];
          uint64_t v25 = [v24 templateDateType];

          v26 = [v23 suggestionTemplate];
          int v27 = [v26 isDateOnlyTemplate];

          v28 = [v23 firstGroup];

          v29 = [v23 secondGroup];

          if (v28)
          {
            v30 = [v23 firstGroup];
            v68 = [a1 _updatedGroupFromGroup:v30 psiDatabase:v64];

            if (v29) {
              goto LABEL_18;
            }
LABEL_20:
            uint64_t v32 = 0;
          }
          else
          {
            v68 = 0;
            if (!v29) {
              goto LABEL_20;
            }
LABEL_18:
            uint64_t v31 = [v23 secondGroup];
            uint64_t v32 = [a1 _updatedGroupFromGroup:v31 psiDatabase:v64];
          }
          id v33 = [v23 firstGroup];
          v67 = [v33 displayString];

          uint64_t v34 = [v23 secondGroup];
          v66 = [v34 displayString];

          uint64_t v35 = NSNumber;
          v36 = [v23 suggestionTemplate];
          uint64_t v37 = objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v36, "templateDateType"));
          v38 = [v62 objectForKeyedSubscript:v37];

          CFIndex Count = [v38 assetIds];
          if (Count) {
            CFIndex Count = CFArrayGetCount((CFArrayRef)[v38 assetIds]);
          }
          a6 = v61;
          v40 = v32;
          if (v61)
          {
            char v41 = v25 ? 1 : v27;
            if ((v41 & 1) != 0 || v38 || v29 || !v28) {
              goto LABEL_44;
            }
          }
          if (v28 && !v68)
          {
            v42 = PLSearchBackendInitialSuggestionsGetLog();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
              goto LABEL_42;
            }
LABEL_43:

LABEL_44:
            uint64_t v21 = v59;
            id v18 = v60;
            uint64_t v20 = v63;
            goto LABEL_45;
          }
          if (v29 && !v32)
          {
            v42 = PLSearchBackendInitialSuggestionsGetLog();
            if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
              goto LABEL_43;
            }
            goto LABEL_42;
          }
          if (v25 && !Count)
          {
            v42 = PLSearchBackendInitialSuggestionsGetLog();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
              goto LABEL_42;
            }
            goto LABEL_43;
          }
          if (v68 && v32)
          {
            CFArrayRef theArray = 0;
            if ([v68 assetIds])
            {
              CFArrayRef theArray = CFArrayCreateCopy(0, (CFArrayRef)[v68 assetIds]);
              if (theArray)
              {
                if ([v32 assetIds])
                {
                  +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &theArray, [v32 assetIds], a4);
                  unint64_t v43 = CFArrayGetCount(theArray);
                }
                else
                {
                  unint64_t v43 = 0;
                }
                if (theArray) {
                  CFRelease(theArray);
                }
                v40 = v32;
              }
              else
              {
                unint64_t v43 = 0;
              }
            }
            else
            {
              unint64_t v43 = 0;
              CFArrayRef theArray = 0;
            }
            if (v43 < a4)
            {
              v42 = PLSearchBackendInitialSuggestionsGetLog();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
                goto LABEL_43;
              }
              goto LABEL_42;
            }
          }
          else if (v68 && v38)
          {
            CFArrayRef theArray = 0;
            if ([v68 assetIds])
            {
              CFArrayRef theArray = CFArrayCreateCopy(0, (CFArrayRef)[v68 assetIds]);
              if (theArray)
              {
                if ([v38 assetIds])
                {
                  v40 = v32;
                  +[PLScopedSearchUtilities intersectSortedArray:withOtherSortedArray:intersectionLimit:](PLScopedSearchUtilities, "intersectSortedArray:withOtherSortedArray:intersectionLimit:", &theArray, [v38 assetIds], a4);
                  unint64_t v44 = CFArrayGetCount(theArray);
                }
                else
                {
                  unint64_t v44 = 0;
                }
                if (theArray) {
                  CFRelease(theArray);
                }
              }
              else
              {
                unint64_t v44 = 0;
              }
            }
            else
            {
              unint64_t v44 = 0;
              CFArrayRef theArray = 0;
            }
            if (v44 < a4)
            {
              v42 = PLSearchBackendInitialSuggestionsGetLog();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
                goto LABEL_43;
              }
LABEL_42:
              *(_DWORD *)buf = 138412290;
              uint64_t v79 = (uint64_t)v23;
              _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_INFO, "Stored initial suggestion is no longer valid: %@", buf, 0xCu);
              goto LABEL_43;
            }
          }
          else if (v68)
          {
            unint64_t v45 = [v68 assetIds];
            if (v45) {
              unint64_t v45 = CFArrayGetCount((CFArrayRef)[v68 assetIds]);
            }
            if (v45 < a4)
            {
              v42 = PLSearchBackendInitialSuggestionsGetLog();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
                goto LABEL_43;
              }
              goto LABEL_42;
            }
          }
          else if (v27)
          {
            unint64_t v46 = [v38 assetIds];
            if (v46) {
              unint64_t v46 = CFArrayGetCount((CFArrayRef)[v38 assetIds]);
            }
            if (v46 < a4)
            {
              v42 = PLSearchBackendInitialSuggestionsGetLog();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
                goto LABEL_43;
              }
              goto LABEL_42;
            }
          }
          v42 = [a1 _updatedCandidateFromCandidate:v23 firstGroup:v68 secondGroup:v40 firstGroupDisplayString:v67 secondGroupDisplayString:v66 dateFilter:v38 todayDate:v57 locale:v56 minResultCountPerSuggestion:a4 suggestionStyleType:v61];
          if (v42)
          {
            [v55 addObject:v42];
          }
          else
          {
            v47 = PLSearchBackendInitialSuggestionsGetLog();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v79 = (uint64_t)v23;
              _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_ERROR, "Unable to validate candidate: %@", buf, 0xCu);
            }
          }
          goto LABEL_43;
        }
LABEL_45:
        ++v22;
      }
      while (v20 != v22);
      uint64_t v48 = [v18 countByEnumeratingWithState:&v70 objects:v82 count:16];
      uint64_t v20 = v48;
    }
    while (v48);
  }

  v49 = PLSearchBackendInitialSuggestionsGetLog();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v50 = [v55 count];
    uint64_t v51 = [v18 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v79 = v50;
    __int16 v80 = 2048;
    uint64_t v81 = v51;
    _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_DEFAULT, "Validated %tu initial suggestions out of %tu retrieved from disk", buf, 0x16u);
  }

  return v55;
}

void __44__PLInitialSuggestionsManager_sharedManager__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___PLInitialSuggestionsManager;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_alloc), "init");
  v2 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = v1;
}

- (id)fetchInitialSuggestionsWithLimit:(unint64_t)a3 minimumResultCountPerSuggestion:(unint64_t)a4 suggestionStyleType:(unint64_t)a5 photoLibrary:(id)a6 psiDatabase:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  id v14 = a7;
  v15 = v14;
  if (v13)
  {
    if (v14)
    {
LABEL_3:
      unint64_t v41 = a3;
      PLPhotosSearchGetLog();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v17 = os_signpost_id_generate(v16);

      id v18 = v16;
      uint64_t v19 = v18;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PLSearchBackendInitialSuggestionGetAssetCount", "", buf, 2u);
      }

      if ([(PLInitialSuggestionsManager *)self cachedTotalNumberOfIndexedAssets]) {
        uint64_t v20 = 1;
      }
      else {
        uint64_t v20 = [v15 countOfAssets];
      }
      [(PLInitialSuggestionsManager *)self setCachedTotalNumberOfIndexedAssets:v20];
      uint64_t v21 = v19;
      uint64_t v22 = v21;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_END, v17, "PLSearchBackendInitialSuggestionGetAssetCount", "", buf, 2u);
      }

      if (v20)
      {
        uint64_t v23 = [(id)objc_opt_class() recentAssetLimitForInitialSuggestionGenerationForIndexedAssetCount:v20];
        if (v23)
        {
          unint64_t v24 = [(id)objc_opt_class() scaledMinimumNumberOfResultsPerSuggestion:v20];
          if (v24 <= a4) {
            unint64_t v25 = a4;
          }
          else {
            unint64_t v25 = v24;
          }
          if (a4) {
            unint64_t v26 = v25;
          }
          else {
            unint64_t v26 = v24;
          }
          int v27 = PLSearchBackendInitialSuggestionsGetLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v43 = v26;
            _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Fetching initial suggestions with a required minimum of %tu results per suggestion.", buf, 0xCu);
          }

          v28 = [MEMORY[0x1E4F1CA20] currentLocale];
          v29 = [(PLInitialSuggestionsManager *)self _preGeneratedInitialSuggestionsForPhotoLibrary:v13 minResultCountPerSuggestion:v26 suggestionLimit:v41 psiDatabase:v15 locale:v28 suggestionStyleType:a5];
          if ([v29 count])
          {
            v30 = v29;
            uint64_t v31 = PLSearchBackendInitialSuggestionsGetLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = [v30 count];
              *(_DWORD *)buf = 134217984;
              uint64_t v43 = v32;
              id v33 = "Found pre-generated initial suggestions, returning %tu.";
LABEL_33:
              _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, v33, buf, 0xCu);
            }
          }
          else
          {
            LOBYTE(v40) = 0;
            v30 = [(PLInitialSuggestionsManager *)self _generateSuggestionsOnDemandWithLimitOfMostRecentAssets:v23 suggestionLimit:v41 minimumNumberOfResultsPerSuggestion:v26 photoLibrary:v13 psiDatabase:v15 minResultCountPerSuggestion:v26 locale:v28 shouldGenerateAllSuggestions:v40 suggestionStyleType:a5];
            uint64_t v31 = PLSearchBackendInitialSuggestionsGetLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v36 = [v30 count];
              *(_DWORD *)buf = 134217984;
              uint64_t v43 = v36;
              id v33 = "Generated initial suggestions on demand, returning %tu.";
              goto LABEL_33;
            }
          }

          id v35 = [v30 copy];
          goto LABEL_35;
        }
        v30 = PLSearchBackendInitialSuggestionsGetLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          uint64_t v34 = "No available assets for generating initial suggestions. No initial suggestions will be generated.";
          goto LABEL_29;
        }
      }
      else
      {
        v30 = PLSearchBackendInitialSuggestionsGetLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          uint64_t v34 = "0 assets available for search, no initial suggestions will be generated";
LABEL_29:
          _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, v34, buf, 2u);
        }
      }
      id v35 = (id)MEMORY[0x1E4F1CBF0];
LABEL_35:

      goto LABEL_40;
    }
  }
  else
  {
    unint64_t v37 = a3;
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"PLInitialSuggestionsManager.m", 64, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

    a3 = v37;
    if (v15) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = PLSearchBackendInitialSuggestionsGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Unexpected nil psiDatabase. No initial suggestions will be generated.", buf, 2u);
  }
  id v35 = (id)MEMORY[0x1E4F1CBF0];
LABEL_40:

  return v35;
}

- (void)setCachedTotalNumberOfIndexedAssets:(unint64_t)a3
{
  self->_cachedTotalNumberOfIndexedAssets = a3;
}

- (unint64_t)cachedTotalNumberOfIndexedAssets
{
  return self->_cachedTotalNumberOfIndexedAssets;
}

- (id)_preGeneratedInitialSuggestionsForPhotoLibrary:(id)a3 minResultCountPerSuggestion:(unint64_t)a4 suggestionLimit:(unint64_t)a5 psiDatabase:(id)a6 locale:(id)a7 suggestionStyleType:(unint64_t)a8
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  os_signpost_id_t v17 = [(PLInitialSuggestionsManager *)self cachedInitialSuggestions];

  if (!v17)
  {
    uint64_t v44 = 0;
    id v18 = +[PLInitialSuggestionsStorageManager initialSearchSuggestionsForPhotoLibrary:v14 error:&v44];
    if (![v18 count])
    {
      uint64_t v34 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_20;
    }
    uint64_t v19 = [(id)objc_opt_class() validateInitialSuggestions:v18 minResultCountPerSuggestion:a4 psiDatabase:v15 suggestionStyleType:a8];
    uint64_t v20 = (void *)[v19 copy];
    [(PLInitialSuggestionsManager *)self setCachedInitialSuggestions:v20];
  }
  id v37 = v15;
  id v38 = v14;
  id v36 = v16;
  [(PLInitialSuggestionsManager *)self cachedInitialSuggestions];
  if (a5 == -1) {
    unint64_t v24 = {;
  }
    uint64_t v22 = (void *)[v24 mutableCopy];

    uint64_t v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"rankingScore" ascending:0];
    v48[0] = v23;
    unint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    [v22 sortUsingDescriptors:v25];
  }
  else {
    uint64_t v21 = {;
  }
    uint64_t v22 = +[PLInitialSuggestionRanker rankSearchSuggestionCandidates:v21 suggestionLimit:a5 maxNumberOfSuggestionsPerContentType:25 locale:v16];

    uint64_t v23 = [(PLInitialSuggestionsManager *)self cachedInitialSuggestions];
    uint64_t v43 = 0;
    +[PLInitialSuggestionsStorageManager saveInitialSuggestions:v23 photoLibrary:v14 error:&v43];
  }

  unint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v18 = v22;
  uint64_t v27 = [v18 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(v18);
        }
        uint64_t v31 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v32 = [v31 populatedTemplateQueryString];
        if ([v32 length])
        {
          [v26 addObject:v32];
        }
        else
        {
          id v33 = PLSearchBackendInitialSuggestionsGetLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v46 = v31;
            _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Unable to populate suggestion candidate: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v28 = [v18 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v28);
  }

  uint64_t v34 = (void *)[v26 copy];
  id v15 = v37;
  id v14 = v38;
  id v16 = v36;
LABEL_20:

  return v34;
}

- (NSArray)cachedInitialSuggestions
{
  return self->_cachedInitialSuggestions;
}

+ (unint64_t)scaledMinimumNumberOfResultsPerSuggestion:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t v3 = vcvtad_u64_f64(sqrt((float)((float)a3 * 0.25)));
  if (v3 >= 0x1F4) {
    unint64_t v3 = 500;
  }
  if (v3 <= 0x14) {
    return 20;
  }
  else {
    return v3;
  }
}

+ (unint64_t)recentAssetLimitForInitialSuggestionGenerationForIndexedAssetCount:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v5 = vcvtmd_u64_f64((double)a3 * 0.25);
    unint64_t result = 7500;
    if (v5 <= 0x1D4C)
    {
      unint64_t v7 = 2500;
      if (a3 < 0x9C4) {
        unint64_t v7 = a3;
      }
      if (v5 >= 0x9C4) {
        return v5;
      }
      else {
        return v7;
      }
    }
  }
  else
  {
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    id v8 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Obtained count of 0 assets available for search, no initial suggestions will be generated", v9, 2u);
    }

    return 0;
  }
  return result;
}

+ (id)_fetchAssetIdsForDateFilters:(id)a3 psiDatabase:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "psiDateFilter", (void)v18);
        objc_msgSend(v13, "setAssetIds:", objc_msgSend(v6, "assetIdsWithDateFilter:", v14));

        id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "templateDateType"));
        [v7 setObject:v13 forKeyedSubscript:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v16 = (void *)[v7 copy];
  return v16;
}

+ (id)_updatedGroupFromGroup:(id)a3 psiDatabase:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5
    && v6
    && [v5 searchIndexingCategory]
    && ([v5 displayString],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 length],
        v8,
        v9))
  {
    uint64_t v10 = [v5 searchIndexingCategory];
    uint64_t v11 = [v5 contentString];
    uint64_t v12 = [v5 lookupIdentifier];
    if ([v5 isMePerson]) {
      id v13 = 0;
    }
    else {
      id v13 = v11;
    }
    id v14 = [v7 groupForText:v13 identifier:v12 category:v10 resultTypes:1];
    id v15 = [v14 contentString];
    uint64_t v16 = [v15 length];

    if (v16)
    {
      id v17 = v14;
    }
    else
    {
      long long v19 = PLSearchBackendInitialSuggestionsGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412546;
        id v21 = v14;
        __int16 v22 = 2112;
        id v23 = v5;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Invalid PSI group detected: %@ from ranked group: %@", (uint8_t *)&v20, 0x16u);
      }

      id v17 = 0;
    }
  }
  else
  {
    uint64_t v11 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412546;
      id v21 = v5;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Invalid ranked group detected: %@ or nil psidatabase: %@", (uint8_t *)&v20, 0x16u);
    }
    id v17 = 0;
  }

  return v17;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PLInitialSuggestionsManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedInstance;
  return v2;
}

+ (id)rankedGroupCandidatesForInitialSuggestionsForPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pathManager];
  id v6 = [[PSIDatabase alloc] initWithPathManager:v5 options:1];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v8 = [[PLSearchSuggestionTemplateProvider alloc] initWithLocale:v7];
    uint64_t v9 = [(PSIDatabase *)v6 countOfAssets];
    uint64_t v10 = [a1 recentAssetLimitForInitialSuggestionGenerationForIndexedAssetCount:v9];
    uint64_t v11 = [a1 _mePersonUUIDForPhotoLibrary:v4];
    uint64_t v12 = [(PSIDatabase *)v6 mostRecentSortedAssetIdsWithLimit:v10];
    id v13 = objc_msgSend(a1, "_rankedGroupsFromPSIDatabase:photoLibrary:assetIds:templateProvider:mePersonUUID:minResultCountPerSuggestion:", v6, v4, v12, v8, v11, objc_msgSend(a1, "scaledMinimumNumberOfResultsPerSuggestion:", v9));
    if (v12) {
      CFRelease(v12);
    }
  }
  else
  {
    id v14 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Unexpected nil psiDatabase. No ranked groups will be generated.", v16, 2u);
    }

    id v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

+ (id)_rankedGroupsFromPSIDatabase:(id)a3 photoLibrary:(id)a4 assetIds:(__CFArray *)a5 templateProvider:(id)a6 mePersonUUID:(id)a7 minResultCountPerSuggestion:(unint64_t)a8
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v43 = a4;
  id v13 = a6;
  id v14 = a7;
  if (v12)
  {
    id v39 = v14;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v42 = [v13 nonIdentifierBasedSupportedSearchEntityTypes];
    long long v41 = [v12 groupsForSearchIndexCategories:v42 searchResultTypes:1 dateFilter:0];
    [v15 addObjectsFromArray:v41];
    long long v40 = [v13 supportedIdentifiers];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke;
    v64[3] = &unk_1E586FC78;
    id v65 = v12;
    id v16 = v15;
    id v66 = v16;
    [v40 enumerateObjectsUsingBlock:v64];
    if ([v16 count])
    {
      PLPhotosSearchGetLog();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t spid = os_signpost_id_generate(v17);

      long long v18 = v17;
      long long v19 = v18;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PLSearchBackendInitialSuggestionGenerateRankedGroups", "", buf, 2u);
      }

      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke_57;
      v62[3] = &unk_1E5861A08;
      id v21 = v20;
      id v63 = v21;
      [v16 enumerateObjectsUsingBlock:v62];
      *(void *)buf = 0;
      uint64_t v59 = buf;
      uint64_t v60 = 0x2020000000;
      char v61 = 0;
      if ([v21 count])
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke_2;
        v52[3] = &unk_1E5875BD0;
        id v53 = v21;
        id v54 = v43;
        v57 = buf;
        id v23 = v22;
        id v55 = v23;
        id v56 = v16;
        [v54 performBlockAndWait:v52];
      }
      else
      {
        id v23 = 0;
      }
      if (v59[24])
      {
        unint64_t v26 = [v21 allValues];
        BOOL v27 = [v26 count] == 0;

        if (!v27)
        {
          uint64_t v28 = [v21 allValues];
          [v16 removeObjectsInArray:v28];
        }
      }
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke_69;
      v45[3] = &unk_1E5861A30;
      v49 = a5;
      unint64_t v50 = a8;
      id v51 = a1;
      id v46 = v39;
      id v29 = v23;
      id v47 = v29;
      id v30 = v35;
      id v48 = v30;
      [v16 enumerateObjectsUsingBlock:v45];
      uint64_t v31 = v19;
      unint64_t v25 = v31;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)uint64_t v44 = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v25, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendInitialSuggestionGenerateRankedGroups", "", v44, 2u);
      }

      uint64_t v32 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"rankingScore" ascending:0];
      v67[0] = v32;
      id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
      [v30 sortUsingDescriptors:v33];

      id v24 = v30;
      _Block_object_dispose(buf, 8);
    }
    else
    {
      unint64_t v25 = PLSearchBackendInitialSuggestionsGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_INFO, "No entities found for initial suggestion generation, no suggestions will be generated.", buf, 2u);
      }
      id v24 = (id)MEMORY[0x1E4F1CBF0];
    }

    id v14 = v39;
  }
  else
  {
    id v24 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v24;
}

void __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) groupForLookupIdentifier:a2 searchResultTypes:1];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v3 = v4;
  }
}

void __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke_57(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 category] == 1300
    || [v5 category] == 1301
    || [v5 category] == 1330
    || [v5 category] == 1331)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v5 lookupIdentifier];
    [v3 setObject:v5 forKeyedSubscript:v4];
  }
}

void __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke_2(uint64_t a1)
{
  v49[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PLPerson fetchRequest];
  [v2 setResultType:0];
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [*(id *)(a1 + 32) allKeys];
  id v5 = [v3 predicateWithFormat:@"%K IN %@", @"personUUID", v4];
  [v2 setPredicate:v5];

  v49[0] = @"userFeedbacks";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  [v2 setRelationshipKeyPathsForPrefetching:v6];

  id v7 = [*(id *)(a1 + 40) managedObjectContext];
  id v44 = 0;
  id v8 = [v7 executeFetchRequest:v2 error:&v44];
  id v9 = v44;
  if (v9 || ![v8 count])
  {
    uint64_t v10 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Encountered error fetching persons for candidate groups: %@.", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    id v30 = v7;
    uint64_t v31 = v2;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v29 = v8;
    obuint64_t j = v8;
    uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v41 != v33) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v13 = [v12 displayName];
          uint64_t v14 = [v13 length];
          if (v14)
          {
            uint64_t v15 = [v12 displayName];
            id v35 = (void *)v15;
          }
          else
          {
            uint64_t v15 = 0;
          }
          id v16 = *(void **)(a1 + 48);
          id v17 = [v12 personUUID];
          [v16 setObject:v15 forKeyedSubscript:v17];

          if (v14) {
          long long v18 = [v12 userFeedbacks];
          }
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v45 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v37;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v37 != v21) {
                  objc_enumerationMutation(v18);
                }
                id v23 = *(void **)(*((void *)&v36 + 1) + 8 * j);
                if ([v23 type] == 2 || objc_msgSend(v23, "type") == 3)
                {
                  id v24 = [v12 personUUID];
                  uint64_t v25 = [v24 length];

                  if (v25)
                  {
                    unint64_t v26 = *(void **)(a1 + 32);
                    BOOL v27 = [v12 personUUID];
                    uint64_t v28 = [v26 objectForKeyedSubscript:v27];

                    if (v28) {
                      [*(id *)(a1 + 56) removeObject:v28];
                    }
                  }
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v45 count:16];
            }
            while (v20);
          }
        }
        uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v34);
    }

    id v7 = v30;
    v2 = v31;
    id v8 = v29;
    id v9 = 0;
  }
}

void __140__PLInitialSuggestionsManager__rankedGroupsFromPSIDatabase_photoLibrary_assetIds_templateProvider_mePersonUUID_minResultCountPerSuggestion___block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 category] == 1103)
  {
    [v3 score];
    BOOL v5 = v4 != 0.0;
  }
  else
  {
    BOOL v5 = 1;
  }
  if (PLSearchIndexCategoryIsEligibleForSuggestion((int)[v3 category]))
  {
    id v6 = [v3 contentString];
    if (![v6 length]) {
      BOOL v5 = 0;
    }

    if (v5)
    {
      if ([v3 assetIds])
      {
        CFArrayRef theArray = CFArrayCreateCopy(0, (CFArrayRef)[v3 assetIds]);
        if (theArray)
        {
          +[PLScopedSearchUtilities intersectSortedArray:&theArray withOtherSortedArray:*(void *)(a1 + 56) intersectionLimit:*(void *)(a1 + 64)];
          if (theArray)
          {
            if (CFArrayGetCount(theArray))
            {
              uint64_t v7 = [(id)objc_opt_class() _groupIsMePerson:v3 mePersonUUID:*(void *)(a1 + 32)];
              id v8 = [v3 lookupIdentifier];
              if ([v8 length])
              {
                id v9 = *(void **)(a1 + 40);
                uint64_t v10 = [v3 lookupIdentifier];
                uint64_t v11 = [v9 objectForKeyedSubscript:v10];
              }
              else
              {
                uint64_t v11 = 0;
              }

              id v12 = [[PSIRankedGroupV2 alloc] initWithGroup:v3 displayString:v11 isMePerson:v7];
              if (v12) {
                [*(id *)(a1 + 48) addObject:v12];
              }
            }
            if (theArray) {
              CFRelease(theArray);
            }
          }
        }
      }
    }
  }
}

+ (id)_mePersonUUIDForPhotoLibrary:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PLInitialSuggestionsManager__mePersonUUIDForPhotoLibrary___block_invoke;
  v9[3] = &unk_1E5875E68;
  id v4 = v3;
  id v10 = v4;
  uint64_t v11 = &v12;
  [v4 performBlockAndWait:v9];
  if (![(id)v13[5] length])
  {
    BOOL v5 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Unable to fetch Me person from photolibrary. Initial suggestions will not include Me templates", v8, 2u);
    }
  }
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __60__PLInitialSuggestionsManager__mePersonUUIDForPhotoLibrary___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v6 = +[PLPerson fetchMePersonInManagedObjectContext:v2];

  uint64_t v3 = [v6 personUUID];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (BOOL)_groupIsMePerson:(id)a3 mePersonUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 length]
    || (__int16 v7 = [v5 category],
        (unsigned __int16)(v7 - 1302) != 65534 && (unsigned __int16)(v7 - 1302) != 0xFFFF))
  {
    char v9 = 0;
  }
  else
  {
    id v8 = [v5 lookupIdentifier];
    char v9 = [v8 isEqualToString:v6];
  }
  return v9;
}

+ (id)_dateTemplateCandidatesFromTemplates:(id)a3 assetIdsByDateFilter:(id)a4 scopedAssetIds:(__CFArray *)a5 minResultCountPerSuggestion:(unint64_t)a6 suggestionStyleType:(unint64_t)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    unint64_t v13 = 0x1E4F28000uLL;
    uint64_t v31 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v16 = [v15 dateFilter];
        if (!v16)
        {
          id v17 = PLSearchBackendInitialSuggestionsGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            long long v38 = v15;
            _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Unable to generate date filter for date based template: %@.", buf, 0xCu);
          }
          goto LABEL_17;
        }
        id v17 = objc_msgSend(*(id *)(v13 + 3792), "numberWithUnsignedInteger:", objc_msgSend(v15, "templateDateType"));
        long long v18 = [v9 objectForKeyedSubscript:v17];
        if (![v18 assetIds])
        {

LABEL_17:
          goto LABEL_18;
        }
        uint64_t v19 = objc_msgSend(*(id *)(v13 + 3792), "numberWithUnsignedInteger:", objc_msgSend(v15, "templateDateType"));
        [v9 objectForKeyedSubscript:v19];
        uint64_t v20 = v16;
        uint64_t v21 = v11;
        v23 = id v22 = v9;
        CFArrayRef Copy = CFArrayCreateCopy(0, (CFArrayRef)[v23 assetIds]);

        id v9 = v22;
        uint64_t v11 = v21;
        id v16 = v20;

        uint64_t v12 = v31;
        unint64_t v13 = 0x1E4F28000;

        if (Copy)
        {
          if (CFArrayGetCount(Copy))
          {
            uint64_t v25 = [[PLSearchSuggestionCandidate alloc] initWithSearchSuggestionTemplate:v15 firstGroup:0 secondGroup:0 assetIdsForDateFilter:Copy minAssetResultCountPerSuggestion:a6 styleType:a7];
            if (v25) {
              [v28 addObject:v25];
            }
          }
          CFRelease(Copy);
        }
LABEL_18:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v11);
  }

  unint64_t v26 = (void *)[v28 copy];
  return v26;
}

+ (id)_singleEntitySearchCandidatesFromRankedGroups:(id)a3 minAssetResultCountPerSuggestion:(unint64_t)a4 locale:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = +[PLSearchSuggestionTemplateProvider templateForRankedGroup:v14 locale:v8];
        if (v15)
        {
          id v16 = [[PLSearchSuggestionCandidate alloc] initWithSearchSuggestionTemplate:v15 firstGroup:v14 secondGroup:0 assetIdsForDateFilter:0 minAssetResultCountPerSuggestion:a4 styleType:1];
          if (v16) {
            [v19 addObject:v16];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  id v17 = (void *)[v19 copy];
  return v17;
}

+ (id)_templateCandidatesForFirstRankedGroup:(id)a3 secondRankedGroup:(id)a4 allTemplates:(id)a5 assetIdsByDateFilter:(id)a6 scopedAssetIdsCount:(unint64_t)a7 templateProvider:(id)a8 mePersonExists:(BOOL)a9 minResultCountPerSuggestion:(unint64_t)a10
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v73 = v16;
  if (a7)
  {
    long long v74 = v18;
    id v70 = v19;
    id v71 = v17;
    long long v20 = objc_msgSend(v19, "templatesForSearchIndexCategory:secondIndexCategory:limitedTemplates:", objc_msgSend(v15, "searchIndexingCategory"), objc_msgSend(v16, "searchIndexingCategory"), v17);
    id v72 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v21 = v20;
    long long v22 = v16;
    BOOL v23 = a9;
    uint64_t v77 = [v21 countByEnumeratingWithState:&v78 objects:v84 count:16];
    if (!v77) {
      goto LABEL_70;
    }
    uint64_t v76 = *(void *)v79;
    unint64_t v24 = 0x1E4F28000uLL;
    long long v75 = v21;
    while (1)
    {
      for (uint64_t i = 0; i != v77; ++i)
      {
        if (*(void *)v79 != v76) {
          objc_enumerationMutation(v21);
        }
        unint64_t v26 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        if (v23)
        {
          if ((([v15 isMePerson] & 1) != 0 || objc_msgSend(v22, "isMePerson"))
            && ([v26 isMeTemplate] & 1) == 0)
          {
            continue;
          }
        }
        else if ([*(id *)(*((void *)&v78 + 1) + 8 * i) isMeTemplate])
        {
          continue;
        }
        int v27 = [v26 templateType];
        id v28 = [v26 dateFilter];
        if (v28)
        {
          id v29 = objc_msgSend(*(id *)(v24 + 3792), "numberWithUnsignedInteger:", objc_msgSend(v26, "templateDateType"));
          id v30 = [v74 objectForKeyedSubscript:v29];
          if ([v30 assetIds])
          {
            uint64_t v31 = objc_msgSend(*(id *)(v24 + 3792), "numberWithUnsignedInteger:", objc_msgSend(v26, "templateDateType"));
            uint64_t v32 = [v74 objectForKeyedSubscript:v31];
            CFArrayRef Copy = CFArrayCreateCopy(0, (CFArrayRef)[v32 assetIds]);

            long long v22 = v73;
          }
          else
          {
            CFArrayRef Copy = 0;
          }

          BOOL v23 = a9;
          long long v21 = v75;
        }
        else
        {
          CFArrayRef Copy = 0;
        }
        if ((~v27 & 3) != 0)
        {
          if ((v27 & 1) == 0)
          {
            p_super = PLSearchBackendInitialSuggestionsGetLog();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v83 = v26;
              _os_log_impl(&dword_19B3C7000, p_super, OS_LOG_TYPE_ERROR, "Encountered invalid template during initial suggestion generation: %@.", buf, 0xCu);
            }
            goto LABEL_64;
          }
          uint64_t v45 = [v15 searchIndexingCategory];
          if (v45 == [v26 firstIndexCategory])
          {
            id v46 = [v26 identifier];

            if (v46)
            {
              id v47 = [v15 lookupIdentifier];
              id v48 = [v26 identifier];
              char v49 = [v47 isEqualToString:v48];

              long long v22 = v73;
              if ((v49 & 1) == 0) {
                goto LABEL_65;
              }
            }
            else if ([v26 isMeTemplate] && (objc_msgSend(v15, "isMePerson") & 1) == 0)
            {
              goto LABEL_65;
            }
            unint64_t v50 = [[PLSearchSuggestionCandidate alloc] initWithSearchSuggestionTemplate:v26 firstGroup:v15 secondGroup:0 assetIdsForDateFilter:Copy minAssetResultCountPerSuggestion:a10 styleType:0];
            if ([(PLSearchSuggestionCandidate *)v50 intersectionCount]) {
              [v72 addObject:v50];
            }
          }
          uint64_t v51 = [v22 searchIndexingCategory];
          if (v51 == [v26 firstIndexCategory])
          {
            id v52 = [v26 identifier];

            if (v52)
            {
              id v53 = [v22 lookupIdentifier];
              id v54 = [v26 identifier];
              char v55 = [v53 isEqualToString:v54];

              long long v22 = v73;
              if ((v55 & 1) == 0) {
                goto LABEL_65;
              }
            }
            else if ([v26 isMeTemplate] && (objc_msgSend(v22, "isMePerson") & 1) == 0)
            {
              goto LABEL_65;
            }
            id v63 = [[PLSearchSuggestionCandidate alloc] initWithSearchSuggestionTemplate:v26 firstGroup:v22 secondGroup:0 assetIdsForDateFilter:Copy minAssetResultCountPerSuggestion:a10 styleType:0];
            p_super = &v63->super;
LABEL_62:
            if ([(PLSearchSuggestionCandidate *)v63 intersectionCount]) {
              [v72 addObject:p_super];
            }
LABEL_64:
          }
        }
        else
        {
          uint64_t v34 = [v15 searchIndexingCategory];
          if (v34 == [v26 firstIndexCategory]
            && (uint64_t v35 = [v22 searchIndexingCategory], v35 == objc_msgSend(v26, "secondIndexCategory")))
          {
            long long v36 = [v26 identifier];

            if (v36)
            {
              long long v37 = [v15 lookupIdentifier];
              long long v38 = [v26 identifier];
              if ([v37 isEqualToString:v38])
              {

                BOOL v23 = a9;
LABEL_51:
                uint64_t v59 = [PLSearchSuggestionCandidate alloc];
                uint64_t v60 = v26;
                id v61 = v15;
                id v62 = v22;
LABEL_60:
                p_super = [(PLSearchSuggestionCandidate *)v59 initWithSearchSuggestionTemplate:v60 firstGroup:v61 secondGroup:v62 assetIdsForDateFilter:Copy minAssetResultCountPerSuggestion:a10 styleType:0];
                long long v21 = v75;
                goto LABEL_61;
              }
              id v56 = [v22 lookupIdentifier];
              v57 = [v26 identifier];
              char v58 = [v56 isEqualToString:v57];

              long long v22 = v73;
              BOOL v23 = a9;
              if (v58) {
                goto LABEL_51;
              }
            }
            else if (![v26 isMeTemplate] || (objc_msgSend(v15, "isMePerson") & 1) != 0)
            {
              goto LABEL_51;
            }
          }
          else
          {
            uint64_t v40 = [v15 searchIndexingCategory];
            if (v40 != [v26 secondIndexCategory]
              || (uint64_t v41 = [v22 searchIndexingCategory], v41 != objc_msgSend(v26, "firstIndexCategory")))
            {
              p_super = 0;
LABEL_61:
              id v63 = (PLSearchSuggestionCandidate *)p_super;
              goto LABEL_62;
            }
            long long v42 = [v26 identifier];

            if (v42)
            {
              long long v43 = [v22 lookupIdentifier];
              id v44 = [v26 identifier];
              if ([v43 isEqualToString:v44])
              {

                BOOL v23 = a9;
LABEL_59:
                uint64_t v59 = [PLSearchSuggestionCandidate alloc];
                uint64_t v60 = v26;
                id v61 = v22;
                id v62 = v15;
                goto LABEL_60;
              }
              id v64 = [v15 lookupIdentifier];
              id v65 = [v26 identifier];
              char v66 = [v64 isEqualToString:v65];

              long long v22 = v73;
              BOOL v23 = a9;
              if (v66) {
                goto LABEL_59;
              }
            }
            else if (![v26 isMeTemplate] || (objc_msgSend(v22, "isMePerson") & 1) != 0)
            {
              goto LABEL_59;
            }
          }
          long long v21 = v75;
        }
LABEL_65:
        if (Copy) {
          CFRelease(Copy);
        }

        unint64_t v24 = 0x1E4F28000;
      }
      uint64_t v77 = [v21 countByEnumeratingWithState:&v78 objects:v84 count:16];
      if (!v77)
      {
LABEL_70:

        v67 = (void *)[v72 copy];
        id v18 = v74;
        v68 = v21;
        id v19 = v70;
        id v17 = v71;
        goto LABEL_74;
      }
    }
  }
  v68 = PLSearchBackendInitialSuggestionsGetLog();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v68, OS_LOG_TYPE_INFO, "No scoped asset Ids provided for template generation, aborting initial suggestion generation", buf, 2u);
  }
  v67 = (void *)MEMORY[0x1E4F1CBF0];
  long long v22 = v73;
LABEL_74:

  return v67;
}

+ (id)_templateCandidatesFromRankedGroups:(id)a3 assetIdsByDateFilter:(id)a4 scopedAssetIds:(__CFArray *)a5 templateProvider:(id)a6 mePersonExists:(BOOL)a7 shouldGenerateAllSuggestions:(BOOL)a8 minResultCountPerSuggestion:(unint64_t)a9 suggestionStyleType:(unint64_t)a10
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v59 = a4;
  id v60 = a6;
  char v55 = v14;
  if ([v14 count])
  {
    id v54 = (void *)[v14 mutableCopy];
    id v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"rankingScore" ascending:0];
    v67[0] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
    id v17 = (id)[v54 sortedArrayUsingDescriptors:v16];

    if ((unint64_t)[v14 count] <= 0x1F3)
    {
      id v18 = v54;
    }
    else
    {
      objc_msgSend(v54, "subarrayWithRange:", 0, 500);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v20 = v18;
    if (a8) {
      [v60 allTemplates];
    }
    else {
    char v58 = [v60 limitedTemplates];
    }
    if ([v58 count])
    {
      id v56 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      if (a10)
      {
        long long v21 = [v60 locale];
        long long v22 = [a1 _singleEntitySearchCandidatesFromRankedGroups:v55 minAssetResultCountPerSuggestion:a9 locale:v21];

        [v56 addObjectsFromArray:v22];
      }
      else
      {
        PLPhotosSearchGetLog();
        unint64_t v24 = (id)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t spid = os_signpost_id_generate(v24);

        uint64_t v25 = v24;
        unint64_t v26 = v25;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PLSearchBackendInitialSuggestionPopulateNonDateRankedTemplates", "", buf, 2u);
        }
        uint64_t v51 = v26;

        if (a5) {
          CFIndex Count = CFArrayGetCount(a5);
        }
        else {
          CFIndex Count = 0;
        }
        for (unint64_t i = 0; i < [v20 count] - 1; ++i)
        {
          for (unint64_t j = i + 1; j < [v20 count]; ++j)
          {
            id v30 = (void *)MEMORY[0x19F38D3B0]();
            uint64_t v31 = [v20 objectAtIndexedSubscript:i];
            uint64_t v32 = [v20 objectAtIndexedSubscript:j];
            if (([v31 isEqual:v32] & 1) == 0)
            {
              LOBYTE(v50) = a7;
              long long v33 = [a1 _templateCandidatesForFirstRankedGroup:v31 secondRankedGroup:v32 allTemplates:v58 assetIdsByDateFilter:v59 scopedAssetIdsCount:Count templateProvider:v60 mePersonExists:v50 minResultCountPerSuggestion:a9];
              [v56 addObjectsFromArray:v33];
            }
          }
        }
        uint64_t v34 = v51;
        long long v22 = v34;
        if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v34))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendInitialSuggestionPopulateNonDateRankedTemplates", "", buf, 2u);
        }

        PLPhotosSearchGetLog();
        uint64_t v35 = (id)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v36 = os_signpost_id_generate(v35);

        long long v37 = v35;
        long long v38 = v37;
        if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "PLSearchBackendInitialSuggestionPopulateDateOnlyRankedTemplates", "", buf, 2u);
        }

        long long v39 = [v60 dateOnlyTemplates];
        uint64_t v40 = [a1 _dateTemplateCandidatesFromTemplates:v39 assetIdsByDateFilter:v59 scopedAssetIds:a5 minResultCountPerSuggestion:a9 suggestionStyleType:0];
        [v56 addObjectsFromArray:v40];
        uint64_t v41 = v38;
        long long v42 = v41;
        if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v42, OS_SIGNPOST_INTERVAL_END, v36, "PLSearchBackendInitialSuggestionPopulateDateOnlyRankedTemplates", "", buf, 2u);
        }
      }
      id v43 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      BOOL v23 = v56;
      uint64_t v44 = [v23 countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v62;
        do
        {
          for (uint64_t k = 0; k != v44; ++k)
          {
            if (*(void *)v62 != v45) {
              objc_enumerationMutation(v23);
            }
            id v47 = *(void **)(*((void *)&v61 + 1) + 8 * k);
            if ([v47 intersectionCount] >= a9) {
              [v43 addObject:v47];
            }
          }
          uint64_t v44 = [v23 countByEnumeratingWithState:&v61 objects:v66 count:16];
        }
        while (v44);
      }

      id v48 = [v43 allObjects];
      id v19 = (void *)[v48 copy];
    }
    else
    {
      BOOL v23 = PLSearchBackendInitialSuggestionsGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Could not locate any templates for initial suggestions, no initial suggestions will be generated.", buf, 2u);
      }
      id v19 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

+ (void)generateInitialSuggestionsForPhotoLibrary:(id)a3 styleType:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 pathManager];
  id v8 = [[PSIDatabase alloc] initWithPathManager:v7 options:1];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v10 = [(PSIDatabase *)v8 countOfAssets];
    uint64_t v11 = [a1 recentAssetLimitForInitialSuggestionGenerationForIndexedAssetCount:v10];
    uint64_t v12 = [a1 scaledMinimumNumberOfResultsPerSuggestion:v10];
    unint64_t v13 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Fetching initial suggestions with a required minimum of %tu results per suggestion.", buf, 0xCu);
    }

    id v14 = +[PLInitialSuggestionsManager sharedManager];
    LOBYTE(v18) = 1;
    id v15 = [v14 _generateSuggestionsOnDemandWithLimitOfMostRecentAssets:v11 suggestionLimit:-1 minimumNumberOfResultsPerSuggestion:v12 photoLibrary:v6 psiDatabase:v8 minResultCountPerSuggestion:v12 locale:v9 shouldGenerateAllSuggestions:v18 suggestionStyleType:a4];
    id v16 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v15 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v20 = v17;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Generated %tu initial suggestions for photolibrary %@.", buf, 0x16u);
    }
  }
  else
  {
    id v9 = PLSearchBackendInitialSuggestionsGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Unexpected nil psiDatabase. No initial suggestions will be generated.", buf, 2u);
    }
  }
}

- (void).cxx_destruct
{
}

- (void)setCachedInitialSuggestions:(id)a3
{
}

- (id)_generateSuggestionsOnDemandWithLimitOfMostRecentAssets:(unint64_t)a3 suggestionLimit:(unint64_t)a4 minimumNumberOfResultsPerSuggestion:(unint64_t)a5 photoLibrary:(id)a6 psiDatabase:(id)a7 minResultCountPerSuggestion:(unint64_t)a8 locale:(id)a9 shouldGenerateAllSuggestions:(BOOL)a10 suggestionStyleType:(unint64_t)a11
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v60 = a6;
  id v61 = a7;
  id v59 = a9;
  PLPhotosSearchGetLog();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  uint64_t v18 = v16;
  id v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PLSearchBackendInitialSuggestionIndexIdsFromUUIDs", "", buf, 2u);
  }
  char v58 = v19;

  CFArrayRef v20 = (const __CFArray *)[v61 mostRecentSortedAssetIdsWithLimit:a3];
  CFArrayRef v21 = v20;
  if (v20 && CFArrayGetCount(v20))
  {
    id v22 = v19;
    uint64_t v23 = v22;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v23, OS_SIGNPOST_INTERVAL_END, v17, "PLSearchBackendInitialSuggestionIndexIdsFromUUIDs", "", buf, 2u);
    }

    v57 = [[PLSearchSuggestionTemplateProvider alloc] initWithLocale:v59];
    id v56 = [(id)objc_opt_class() _mePersonUUIDForPhotoLibrary:v60];
    id v54 = [(PLSearchSuggestionTemplateProvider *)v57 allDateFilters];
    id v53 = [(id)objc_opt_class() _fetchAssetIdsForDateFilters:v54 psiDatabase:v61];
    id v52 = [(id)objc_opt_class() _rankedGroupsFromPSIDatabase:v61 photoLibrary:v60 assetIds:v21 templateProvider:v57 mePersonUUID:v56 minResultCountPerSuggestion:a8];
    PLPhotosSearchGetLog();
    unint64_t v24 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v25 = os_signpost_id_generate(v24);

    unint64_t v26 = v24;
    int v27 = v26;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "PLSearchBackendInitialSuggestionGenerateRankedTemplates", "", buf, 2u);
    }

    char v55 = objc_msgSend((id)objc_opt_class(), "_templateCandidatesFromRankedGroups:assetIdsByDateFilter:scopedAssetIds:templateProvider:mePersonExists:shouldGenerateAllSuggestions:minResultCountPerSuggestion:suggestionStyleType:", v52, v53, v21, v57, objc_msgSend(v56, "length") != 0, a10, a8, a11);
    id v28 = v27;
    id v29 = v28;
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v29, OS_SIGNPOST_INTERVAL_END, v25, "PLSearchBackendInitialSuggestionGenerateRankedTemplates", "", buf, 2u);
    }
    uint64_t v51 = v29;

    CFRelease(v21);
    if (a10)
    {
      id v30 = +[PLInitialSuggestionRanker trimmedListCandidatesOfCandidatesFromCandidates:v55 maxNumberOfSuggestionsPerContentType:25 locale:v59];
      id v67 = 0;
      uint64_t v31 = +[PLInitialSuggestionsStorageManager initialSearchSuggestionsForPhotoLibrary:v60 error:&v67];
      uint64_t v32 = v67;
      if (v32)
      {
        long long v33 = PLSearchBackendInitialSuggestionsGetLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v71 = v60;
          __int16 v72 = 2112;
          id v73 = v32;
          _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Error retrieving initial suggestions for photoLibrary: %@, %@", buf, 0x16u);
        }
      }
      uint64_t v34 = +[PLSearchSuggestionCandidate updateCandidates:v30 withTimestampsFromPreviouslyStoredCandidates:v31];
    }
    else
    {
      if (a4 != -1)
      {
        uint64_t v34 = +[PLInitialSuggestionRanker rankSearchSuggestionCandidates:v55 suggestionLimit:a4 maxNumberOfSuggestionsPerContentType:25 locale:v59];
        goto LABEL_29;
      }
      id v30 = (void *)[v55 mutableCopy];
      id v48 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"rankingScore" ascending:0];
      v69 = v48;
      char v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
      [v30 sortUsingDescriptors:v49];

      uint64_t v34 = (void *)[v30 copy];
      uint64_t v32 = PLSearchBackendInitialSuggestionsGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "Request made for all initial suggestions, no ranking applied, returning suggestions sorted by ranking score.", buf, 2u);
      }
    }

LABEL_29:
    if (a4 == -1) {
      long long v37 = v34;
    }
    else {
      long long v37 = v55;
    }
    [(PLInitialSuggestionsManager *)self setCachedInitialSuggestions:v37];
    long long v38 = [(PLInitialSuggestionsManager *)self cachedInitialSuggestions];
    id v66 = 0;
    +[PLInitialSuggestionsStorageManager saveInitialSuggestions:v38 photoLibrary:v60 error:&v66];
    id v50 = v66;

    long long v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v34, "count"));
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v40 = v34;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v63 != v42) {
            objc_enumerationMutation(v40);
          }
          uint64_t v44 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          uint64_t v45 = [v44 populatedTemplateQueryString];
          if ([v45 length])
          {
            [v39 addObject:v45];
          }
          else
          {
            id v46 = PLSearchBackendInitialSuggestionsGetLog();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v71 = v44;
              _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_ERROR, "Unable to populate suggestion candidate %@, discarding suggestion", buf, 0xCu);
            }
          }
        }
        uint64_t v41 = [v40 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v41);
    }

    os_signpost_id_t v36 = (void *)[v39 copy];
    goto LABEL_45;
  }
  uint64_t v35 = PLSearchBackendInitialSuggestionsGetLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "Error generating recent assetIds for initial suggestions. No initial suggestions will be generated.", buf, 2u);
  }

  if (v21) {
    CFRelease(v21);
  }
  os_signpost_id_t v36 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_45:

  return v36;
}

+ (void)generateInitialSuggestionsForPhotoLibrary:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  id v8 = [v4 currentLocale];
  id v6 = [v8 localeIdentifier];
  int v7 = [&unk_1EEBF20A8 containsObject:v6];

  [a1 generateInitialSuggestionsForPhotoLibrary:v5 styleType:v7 ^ 1u];
}

@end