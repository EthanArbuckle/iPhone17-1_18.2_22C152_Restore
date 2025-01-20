@interface PGSharingManager
+ (id)_defaultOptions;
- (BOOL)_canIncludeUnverified;
- (BOOL)canProvideSuggestionsWithOptions:(id)a3 forGraph:(id)a4;
- (PGSharingManager)initWithWorkingContext:(id)a3;
- (id)_filteredSuggestionResults:(id)a3 withOptions:(id)a4 graph:(id)a5;
- (id)_sortedSuggestionResults:(id)a3 withOptions:(id)a4;
- (id)contextualStream;
- (id)presenceStream;
- (id)suggestionResultsForAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 options:(id)a5;
- (id)suggestionSourcesForSharingStream:(unint64_t)a3;
- (void)_mergeSuggestionResultByPersonIdentifer:(id)a3 withSourceSuggestionResults:(id)a4;
@end

@implementation PGSharingManager

- (void).cxx_destruct
{
}

- (id)_sortedSuggestionResults:(id)a3 withOptions:(id)a4
{
  id v5 = a4;
  v6 = [a3 sortedArrayUsingComparator:&__block_literal_global_3351];
  if ([v5 fetchLimit])
  {
    unint64_t v7 = [v5 fetchLimit];
    unint64_t v8 = [v6 count];
    if (v7 >= v8) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v7;
    }
    uint64_t v10 = objc_msgSend(v6, "subarrayWithRange:", 0, v9);

    v6 = (void *)v10;
  }

  return v6;
}

uint64_t __57__PGSharingManager__sortedSuggestionResults_withOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 score];
  double v7 = v6;
  [v5 score];
  if (v7 <= v8)
  {
    [v4 score];
    double v11 = v10;
    [v5 score];
    if (v11 >= v12)
    {
      v13 = [v4 person];
      v14 = [v5 person];
      uint64_t v9 = [v13 compareToPerson:v14];
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (id)_filteredSuggestionResults:(id)a3 withOptions:(id)a4 graph:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(PGManagerWorkingContext *)self->_workingContext serviceManager];
  double v12 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
  int v13 = [v9 filterLowWeightResults];
  char v14 = v13;
  if (v13)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v15 = v8;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v44;
      double v19 = 2.22507386e-308;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * i) sourceWeight];
          double v19 = fmax(v19, v21);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v17);
    }
    else
    {
      double v19 = 2.22507386e-308;
    }
  }
  else
  {
    double v19 = 2.22507386e-308;
  }
  v22 = [v11 mePerson];
  v23 = [v22 fullName];
  v24 = [v10 children];
  v25 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __65__PGSharingManager__filteredSuggestionResults_withOptions_graph___block_invoke;
  v36 = &unk_1E68E50D8;
  id v37 = v24;
  id v38 = v11;
  char v42 = v14;
  double v41 = v19;
  id v39 = v23;
  id v40 = v12;
  id v26 = v12;
  id v27 = v23;
  id v28 = v11;
  id v29 = v24;
  v30 = [v25 predicateWithBlock:&v33];
  v31 = objc_msgSend(v8, "filteredArrayUsingPredicate:", v30, v33, v34, v35, v36);

  return v31;
}

BOOL __65__PGSharingManager__filteredSuggestionResults_withOptions_graph___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 person];
  id v5 = [v4 contactIdentifier];
  if ([v5 length] || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) == 0)
  {
    double v7 = [v4 birthdayDate];
    if ([v5 length])
    {
      if (v7)
      {
        id v8 = [MEMORY[0x1E4F1C9C8] date];
        [v8 timeIntervalSinceDate:v7];
        double v10 = v9;

        if (v10 < 189345600.0) {
          goto LABEL_19;
        }
      }
    }
    if ([v4 isInferredChild])
    {
      if (![v5 length]) {
        goto LABEL_19;
      }
      double v11 = [*(id *)(a1 + 40) personForIdentifier:v5];
      double v12 = [v11 emailAddresses];
      if ([v12 count])
      {
      }
      else
      {
        int v13 = [v11 phoneNumbers];
        uint64_t v14 = [v13 count];

        if (!v14) {
          goto LABEL_19;
        }
      }
    }
    if (*(unsigned char *)(a1 + 72) && *(double *)(a1 + 64) > 0.25)
    {
      [v3 sourceWeight];
      BOOL v6 = v15 > 0.25;
      goto LABEL_21;
    }
    if (![*(id *)(a1 + 48) length]
      || (uint64_t v16 = *(void **)(a1 + 48),
          [v4 fullName],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v16) = [v16 isEqualToString:v17],
          v17,
          !v16))
    {
      BOOL v6 = 1;
      goto LABEL_21;
    }
    uint64_t v18 = *(NSObject **)(a1 + 56);
    BOOL v6 = 0;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:

      goto LABEL_22;
    }
    int v20 = 138477827;
    double v21 = v4;
    _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Suggested person %{private}@ matches me contact name", (uint8_t *)&v20, 0xCu);
LABEL_19:
    BOOL v6 = 0;
    goto LABEL_21;
  }
  BOOL v6 = 0;
LABEL_22:

  return v6;
}

- (void)_mergeSuggestionResultByPersonIdentifer:(id)a3 withSourceSuggestionResults:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        double v12 = [v11 person];
        int v13 = [v12 localIdentifier];

        if (![v13 length])
        {
          uint64_t v14 = [v11 person];
          uint64_t v15 = [v14 contactIdentifier];

          int v13 = (void *)v15;
        }
        uint64_t v16 = [v5 objectForKeyedSubscript:v13];
        uint64_t v17 = v16;
        if (v16) {
          [v16 mergeWithSuggestionResult:v11];
        }
        else {
          [v5 setObject:v11 forKeyedSubscript:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

- (BOOL)_canIncludeUnverified
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  unint64_t v4 = [v3 countOfClusteringEligibleFaces];
  if (v4)
  {
    double v5 = (double)(unint64_t)[v3 countOfUnclusteredFaces] / (double)v4;
    BOOL v6 = v5 < 0.1;
  }
  else
  {
    BOOL v6 = 0;
    double v5 = 0.0;
  }
  uint64_t v7 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218752;
    unint64_t v10 = v4;
    __int16 v11 = 2048;
    double v12 = v5;
    __int16 v13 = 2048;
    uint64_t v14 = 0x3FB999999999999ALL;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Can include unverified result: countOfClusteringEligibleFaces %lu, percentageOfFacesNotClustered %.2f < %.2f == %d", (uint8_t *)&v9, 0x26u);
  }

  return v6;
}

- (BOOL)canProvideSuggestionsWithOptions:(id)a3 forGraph:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 includeUnverified])
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__PGSharingManager_canProvideSuggestionsWithOptions_forGraph___block_invoke;
    v9[3] = &unk_1E68EAF38;
    __int16 v11 = &v17;
    id v10 = v5;
    double v12 = &v13;
    [v6 enumeratePersonNodesIncludingMe:0 withBlock:v9];
    if (*((unsigned char *)v18 + 24)) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = *((unsigned char *)v14 + 24) != 0;
    }

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }

  return v7;
}

void __62__PGSharingManager_canProvideSuggestionsWithOptions_forGraph___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v5 = [v10 contactIdentifier];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = a1 + 40;
LABEL_3:
    *(unsigned char *)(*(void *)(*(void *)v7 + 8) + 24) = 1;
    *a3 = 1;
    goto LABEL_4;
  }
  if ([*(id *)(a1 + 32) useContactSuggestion])
  {
    uint64_t v8 = [v10 suggestedContactIdentifier];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v7 = a1 + 48;
      goto LABEL_3;
    }
  }
LABEL_4:
}

- (id)suggestionResultsForAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 options:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
  uint64_t v12 = [v9 count];
  id v13 = (id)MEMORY[0x1E4F1CBF0];
  if (v12)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v14 = mach_absolute_time();
    if (!v10)
    {
      id v10 = [(id)objc_opt_class() _defaultOptions];
    }
    if ([v10 includeUnverified]) {
      objc_msgSend(v10, "setIncludeUnverified:", -[PGSharingManager _canIncludeUnverified](self, "_canIncludeUnverified"));
    }
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__3360;
    v66 = __Block_byref_object_dispose__3361;
    id v67 = v13;
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__3360;
    v60 = __Block_byref_object_dispose__3361;
    id v61 = 0;
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__3360;
    v54 = __Block_byref_object_dispose__3361;
    id v55 = 0;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    char v49 = 1;
    workingContext = self->_workingContext;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke;
    v39[3] = &unk_1E68E5088;
    long long v43 = &v46;
    v39[4] = self;
    id v10 = v10;
    id v40 = v10;
    long long v44 = &v50;
    id v41 = v8;
    id v42 = v9;
    long long v45 = &v56;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v39];
    if (*((unsigned char *)v47 + 24))
    {
      uint64_t v16 = v14;
      uint64_t v17 = objc_opt_new();
      size_t v18 = [(id)v57[5] count];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke_271;
      block[3] = &unk_1E68E50B0;
      block[4] = self;
      id v37 = &v56;
      id v19 = v10;
      id v34 = v19;
      char v20 = v11;
      v35 = v20;
      id v38 = &v50;
      id v21 = v17;
      id v36 = v21;
      dispatch_apply(v18, 0, block);
      if ([v21 count])
      {
        uint64_t v22 = self->_workingContext;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke_273;
        v29[3] = &unk_1E68EF5F0;
        v32 = &v62;
        v29[4] = self;
        id v30 = v21;
        id v31 = v19;
        [(PGManagerWorkingContext *)v22 performSynchronousConcurrentGraphReadUsingBlock:v29];
      }
      else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = v51[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v70 = v23;
        _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] No suggestions found for %@", buf, 0xCu);
      }
      v24 = v20;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = [(id)v63[5] count];
        uint64_t v26 = mach_absolute_time();
        uint64_t v27 = v63[5];
        *(_DWORD *)buf = 134218498;
        uint64_t v70 = v25;
        __int16 v71 = 2048;
        double v72 = (float)((float)((float)((float)(v26 - v16) * (float)info.numer) / (float)info.denom) / 1000000.0);
        __int16 v73 = 2112;
        uint64_t v74 = v27;
        _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Returning %lu suggestions in %.4fms:\n%@", buf, 0x20u);
      }

      id v13 = (id)v63[5];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v70 = (uint64_t)v10;
        _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Cannot run with options %@, no eligible persons to suggest", buf, 0xCu);
      }
      id v13 = (id)MEMORY[0x1E4F1CBF0];
    }

    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v62, 8);
  }
  return v13;
}

void __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke(uint64_t a1, void *a2)
{
  id v13 = [a2 graph];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "canProvideSuggestionsWithOptions:forGraph:", *(void *)(a1 + 40));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v3 = [PGSharingSuggestionInput alloc];
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) photoLibrary];
    uint64_t v7 = [(PGSharingSuggestionInput *)v3 initWithAssetLocalIdentifiers:v4 momentLocalIdentifiers:v5 graph:v13 photoLibrary:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "suggestionSourcesForSharingStream:", objc_msgSend(*(id *)(a1 + 40), "sharingStream"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

void __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke_271(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke_2;
  v6[3] = &unk_1E68F0628;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v13 = a2;
  id v7 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = *(id *)(a1 + 56);
  [v3 performSynchronousConcurrentGraphReadUsingBlock:v6];
}

void __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke_273(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) allValues];
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [v3 graph];
  uint64_t v8 = [v4 _filteredSuggestionResults:v5 withOptions:v6 graph:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = [*(id *)(a1 + 32) _sortedSuggestionResults:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) withOptions:*(void *)(a1 + 48)];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  if ([*(id *)(a1 + 48) useContactSuggestion])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "setUseContactSuggestion:", 1, (void)v19);
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
}

void __93__PGSharingManager_suggestionResultsForAssetLocalIdentifiers_momentLocalIdentifiers_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectAtIndexedSubscript:*(void *)(a1 + 80)];
  if (([v4 canRunWithOptions:*(void *)(a1 + 32)] & 1) == 0)
  {
    uint64_t v12 = *(NSObject **)(a1 + 40);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v4;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    id v14 = "[Sharing Suggestion] Source %@ cannot run with options %@";
LABEL_10:
    _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);
    goto LABEL_11;
  }
  if (([v4 canRunWithInput:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)] & 1) == 0)
  {
    uint64_t v12 = *(NSObject **)(a1 + 40);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v4;
    __int16 v19 = 2112;
    uint64_t v20 = v15;
    id v14 = "[Sharing Suggestion] Source %@ cannot run with input %@";
    goto LABEL_10;
  }
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v5 = mach_absolute_time();
  uint64_t v6 = [v4 suggestedResultsForInput:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) withOptions:*(void *)(a1 + 32)];
  id v7 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    uint64_t v9 = [v6 count];
    uint64_t v10 = mach_absolute_time();
    *(_DWORD *)buf = 138413058;
    uint64_t v18 = v4;
    __int16 v19 = 2048;
    uint64_t v20 = v9;
    __int16 v21 = 2048;
    double v22 = (float)((float)((float)((float)(v10 - v5) * (float)info.numer) / (float)info.denom) / 1000000.0);
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Source %@ returned %lu suggestions in %.4fms:\n%@", buf, 0x2Au);
  }
  id v11 = *(id *)(a1 + 48);
  objc_sync_enter(v11);
  [*(id *)(a1 + 48) _mergeSuggestionResultByPersonIdentifer:*(void *)(a1 + 56) withSourceSuggestionResults:v6];
  objc_sync_exit(v11);

LABEL_11:
}

- (id)suggestionSourcesForSharingStream:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v5 = objc_opt_new();
  if (v3)
  {
    uint64_t v6 = [(PGSharingManager *)self presenceStream];
    [v5 addObjectsFromArray:v6];
  }
  if ((v3 & 2) != 0)
  {
    id v7 = [(PGSharingManager *)self contextualStream];
    [v5 addObjectsFromArray:v7];
  }
  return v5;
}

- (id)contextualStream
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v11[0] = v2;
  char v3 = objc_opt_new();
  v11[1] = v3;
  id v4 = objc_opt_new();
  v11[2] = v4;
  uint64_t v5 = objc_opt_new();
  v11[3] = v5;
  uint64_t v6 = objc_opt_new();
  v11[4] = v6;
  id v7 = objc_opt_new();
  v11[5] = v7;
  uint64_t v8 = objc_opt_new();
  v11[6] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

- (id)presenceStream
{
  v11[4] = *MEMORY[0x1E4F143B8];
  char v3 = objc_opt_new();
  v11[0] = v3;
  id v4 = [PGSharingSuggestionSourceMergeCandidates alloc];
  uint64_t v5 = [(PGManagerWorkingContext *)self->_workingContext serviceManager];
  uint64_t v6 = [(PGSharingSuggestionSourceMergeCandidates *)v4 initWithServiceManager:v5];
  v11[1] = v6;
  id v7 = objc_opt_new();
  v11[2] = v7;
  uint64_t v8 = objc_opt_new();
  v11[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];

  return v9;
}

- (PGSharingManager)initWithWorkingContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGSharingManager;
  uint64_t v6 = [(PGSharingManager *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_workingContext, a3);
  }

  return v7;
}

+ (id)_defaultOptions
{
  v2 = objc_opt_new();
  return v2;
}

@end