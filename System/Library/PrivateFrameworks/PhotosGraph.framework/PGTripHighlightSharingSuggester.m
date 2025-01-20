@interface PGTripHighlightSharingSuggester
+ (NSIndexSet)suggestionSubtypes;
+ (NSIndexSet)suggestionTypes;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
@end

@implementation PGTripHighlightSharingSuggester

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:102];
}

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:1];
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = [(PGAbstractSuggester *)self session];
  v8 = [v7 loggingConnection];
  v9 = [v7 workingContext];
  v10 = [v7 photoLibrary];
  v11 = [v9 curationManager];
  v12 = [v7 curationContext];
  v13 = [v9 serviceManager];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __67__PGTripHighlightSharingSuggester_suggestionsWithOptions_progress___block_invoke;
  v26[3] = &unk_1E68EA5F8;
  id v27 = v5;
  id v28 = v8;
  id v29 = v7;
  id v30 = v13;
  v31 = self;
  id v32 = v9;
  id v33 = v10;
  id v34 = v11;
  id v35 = v12;
  id v14 = v6;
  id v36 = v14;
  id v25 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  id v18 = v13;
  id v19 = v7;
  id v20 = v8;
  id v21 = v5;
  [v17 performSynchronousConcurrentGraphReadUsingBlock:v26];
  v22 = v36;
  id v23 = v14;

  return v23;
}

void __67__PGTripHighlightSharingSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) universalStartDate];
  uint64_t v5 = [*(id *)(a1 + 32) universalEndDate];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  v62 = v3;
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v102 = v4;
      __int16 v103 = 2112;
      id v104 = v6;
      _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Start date or end date invalid: %@ - %@", buf, 0x16u);
    }
    goto LABEL_67;
  }
  v61 = [v3 graph];
  [v61 allTripNodes];
  v10 = uint64_t v9 = a1;
  v11 = (void *)MEMORY[0x1E4F28F60];
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __67__PGTripHighlightSharingSuggester_suggestionsWithOptions_progress___block_invoke_192;
  v93[3] = &unk_1E68EA5D0;
  id v94 = *(id *)(v9 + 40);
  id v12 = v4;
  id v95 = v12;
  id v13 = v6;
  id v96 = v13;
  id v14 = [v11 predicateWithBlock:v93];
  v60 = v10;
  id v15 = [v10 filteredArrayUsingPredicate:v14];

  if (![v15 count])
  {
    v56 = *(NSObject **)(v9 + 40);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v102 = v12;
      __int16 v103 = 2112;
      id v104 = v13;
      _os_log_impl(&dword_1D1805000, v56, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] No trips found between %@ and %@", buf, 0x16u);
    }
    goto LABEL_66;
  }
  id v58 = v13;
  id v59 = v12;
  id v16 = (void *)[v15 mutableCopy];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v63 = v9;
  id obj = [*(id *)(v9 + 48) existingSuggestions];
  uint64_t v17 = [obj countByEnumeratingWithState:&v89 objects:v100 count:16];
  v66 = v6;
  v67 = v4;
  v72 = v16;
  v65 = v15;
  if (!v17) {
    goto LABEL_34;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v90;
  uint64_t v64 = *(void *)v90;
  do
  {
    id v20 = 0;
    uint64_t v68 = v18;
    do
    {
      if (*(void *)v90 != v19) {
        objc_enumerationMutation(obj);
      }
      v73 = *(void **)(*((void *)&v89 + 1) + 8 * (void)v20);
      if ([v73 subtype] == 102)
      {
        id v70 = v20;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id v75 = v15;
        uint64_t v21 = [v75 countByEnumeratingWithState:&v85 objects:v99 count:16];
        if (!v21) {
          goto LABEL_31;
        }
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v86;
        while (1)
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v86 != v23) {
              objc_enumerationMutation(v75);
            }
            id v25 = *(void **)(*((void *)&v85 + 1) + 8 * v24);
            v26 = (void *)MEMORY[0x1D25FED50]();
            if ([v16 containsObject:v25])
            {
              id v27 = [v73 universalStartDate];
              id v28 = [v73 universalEndDate];
              id v29 = v27;
              if (!v29 || !v28) {
                goto LABEL_25;
              }
              id v30 = v25;
              v31 = [v30 universalStartDate];
              id v32 = [v30 universalEndDate];

              if ([v31 compare:v28] == 1)
              {

LABEL_25:
                goto LABEL_26;
              }
              uint64_t v33 = [v32 compare:v29];

              BOOL v7 = v33 == -1;
              id v16 = v72;
              if (!v7) {
                [v72 removeObject:v30];
              }
            }
LABEL_26:
            ++v24;
          }
          while (v22 != v24);
          uint64_t v34 = [v75 countByEnumeratingWithState:&v85 objects:v99 count:16];
          uint64_t v22 = v34;
          if (!v34)
          {
LABEL_31:

            id v6 = v66;
            v4 = v67;
            uint64_t v19 = v64;
            id v15 = v65;
            uint64_t v18 = v68;
            id v20 = v70;
            break;
          }
        }
      }
      id v20 = (char *)v20 + 1;
    }
    while (v20 != (id)v18);
    uint64_t v18 = [obj countByEnumeratingWithState:&v89 objects:v100 count:16];
  }
  while (v18);
LABEL_34:

  if ([v16 count])
  {
    v74 = [[PGTitleGenerationContext alloc] initWithGraph:v61 serviceManager:*(void *)(v63 + 56)];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v71 = v16;
    uint64_t v35 = [v71 countByEnumeratingWithState:&v81 objects:v98 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      id v76 = *(id *)v82;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(id *)v82 != v76) {
            objc_enumerationMutation(v71);
          }
          v38 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          v39 = (void *)MEMORY[0x1D25FED50]();
          v40 = *(void **)(v63 + 64);
          v41 = [v38 collection];
          v42 = [v41 momentNodes];
          v43 = [v42 temporaryArray];
          v44 = [v40 sharingSuggestionResultsForMomentNodes:v43 withWorkingContext:*(void *)(v63 + 72)];

          long long v79 = 0u;
          long long v80 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          v45 = v44;
          uint64_t v46 = [(PGEnrichableEventSuggestion *)v45 countByEnumeratingWithState:&v77 objects:v97 count:16];
          v47 = v45;
          if (v46)
          {
            uint64_t v48 = v46;
            uint64_t v49 = *(void *)v78;
LABEL_42:
            uint64_t v50 = 0;
            while (1)
            {
              if (*(void *)v78 != v49) {
                objc_enumerationMutation(v45);
              }
              v51 = [*(id *)(*((void *)&v77 + 1) + 8 * v50) person];
              char v52 = [v51 isVerified];

              if (v52) {
                break;
              }
              if (v48 == ++v50)
              {
                uint64_t v48 = [(PGEnrichableEventSuggestion *)v45 countByEnumeratingWithState:&v77 objects:v97 count:16];
                if (v48) {
                  goto LABEL_42;
                }
                v47 = v45;
                goto LABEL_56;
              }
            }

            uint64_t v53 = v63;
            v47 = [[PGEnrichableEventSuggestion alloc] initWithType:1 subtype:102 enrichableEvent:v38 sharingSuggestionResults:v45 photoLibrary:*(void *)(v63 + 80) curationManager:*(void *)(v63 + 88) curationContext:*(void *)(v63 + 96) loggingConnection:*(void *)(v63 + 40) titleGenerationContext:v74];
            if (v47)
            {
              [*(id *)(v63 + 104) addObject:v47];
              if ([*(id *)(v63 + 32) allowNotification])
              {
                v54 = [*(id *)(v63 + 48) notificationProfile];
                if ([v54 eligibleForNotification])
                {
                  -[PGEnrichableEventSuggestion setNotificationQuality:](v47, "setNotificationQuality:", [v54 notificationQualityForEnrichableEvent:v38]);
                  if ([v54 shouldNotifyForSuggestion:v47 withOptions:*(void *)(v63 + 32)])-[PGEnrichableEventSuggestion setNotificationState:](v47, "setNotificationState:", 1); {
                }
                  }

                uint64_t v53 = v63;
              }
              unint64_t v55 = [*(id *)(v53 + 104) count];
              if (v55 >= [*(id *)(v53 + 32) maximumNumberOfSuggestions])
              {

                goto LABEL_64;
              }
            }
          }
LABEL_56:
        }
        uint64_t v36 = [v71 countByEnumeratingWithState:&v81 objects:v98 count:16];
      }
      while (v36);
    }
LABEL_64:

    id v6 = v66;
    v4 = v67;
    id v15 = v65;
    id v16 = v72;
  }
  else
  {
    v57 = *(NSObject **)(v63 + 40);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v102 = v59;
      __int16 v103 = 2112;
      id v104 = v58;
      _os_log_impl(&dword_1D1805000, v57, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Trips found between %@ and %@ are already covered in exising sharing suggestions", buf, 0x16u);
    }
  }

LABEL_66:
LABEL_67:
}

BOOL __67__PGTripHighlightSharingSuggester_suggestionsWithOptions_progress___block_invoke_192(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 collection];
  uint64_t v5 = [v4 momentNodes];

  id v6 = [v5 subsetWithEnoughScenesProcessed];
  BOOL v7 = [v6 subsetWithEnoughFacesProcessed];

  uint64_t v8 = [v5 count];
  if (v8 == [v7 count])
  {
    uint64_t v9 = (void *)a1[5];
    v10 = (void *)a1[6];
    id v11 = v3;
    id v12 = v9;
    id v13 = v10;
    id v14 = v13;
    BOOL v15 = 0;
    if (v12 && v13)
    {
      id v16 = [v11 universalStartDate];
      uint64_t v17 = [v11 universalEndDate];
      BOOL v15 = [v16 compare:v14] != 1 && objc_msgSend(v17, "compare:", v12) != -1;
    }
  }
  else
  {
    uint64_t v18 = a1[4];
    BOOL v15 = 0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v3;
      _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Not all moments analyzed for %@", (uint8_t *)&v20, 0xCu);
      BOOL v15 = 0;
    }
  }

  return v15;
}

@end