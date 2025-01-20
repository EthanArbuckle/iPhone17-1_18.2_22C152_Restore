@interface PGDayHighlightSharingSuggester
+ (BOOL)canSuggestHighlightNodeWithoutPeople:(id)a3 loggingConnection:(id)a4;
+ (BOOL)shouldSuggestHighlightNode:(id)a3 neighborScoreComputer:(id)a4 loggingConnection:(id)a5;
+ (NSIndexSet)suggestionSubtypes;
+ (NSIndexSet)suggestionTypes;
- (id)suggestionsWithOptions:(id)a3 progress:(id)a4;
@end

@implementation PGDayHighlightSharingSuggester

+ (BOOL)canSuggestHighlightNodeWithoutPeople:(id)a3 loggingConnection:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = a4;
  if (![v5 isInteresting]) {
    goto LABEL_7;
  }
  v7 = [v5 localEndDate];
  v8 = [v5 localStartDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 < 7200.0) {
    goto LABEL_7;
  }
  v11 = [v5 collection];
  v12 = [v11 momentNodes];
  unint64_t v13 = [v12 numberOfAssets];

  if (v13 >= 0x1E)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412802;
      id v17 = v5;
      __int16 v18 = 2048;
      double v19 = v10;
      __int16 v20 = 2048;
      unint64_t v21 = v13;
      _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Considering highlight node %@ interesting enough to suggest without person detected in it (duration %.0f, number of assets %lu).", (uint8_t *)&v16, 0x20u);
    }
    BOOL v14 = 1;
  }
  else
  {
LABEL_7:
    BOOL v14 = 0;
  }

  return v14;
}

+ (BOOL)shouldSuggestHighlightNode:(id)a3 neighborScoreComputer:(id)a4 loggingConnection:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = a5;
  [a4 neighborScoreWithHighlightNode:v7];
  double v10 = v9;
  int v11 = [v7 isInteresting];
  int v12 = [v7 isSmartInteresting];
  unint64_t v13 = [v7 meaningLabels];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138413314;
    id v24 = v7;
    __int16 v25 = 1024;
    int v26 = v11;
    __int16 v27 = 1024;
    int v28 = v12;
    __int16 v29 = 2048;
    double v30 = v10;
    __int16 v31 = 2112;
    v32 = v13;
    _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node %@: isInteresting %d, isSmartInteresting %d, neighborScore %.2f, meanings %@", (uint8_t *)&v23, 0x2Cu);
  }
  if (v10 > 0.43) {
    int v14 = 1;
  }
  else {
    int v14 = v11;
  }
  if (((v14 | v12) & 1) == 0 && ![v13 count])
  {
    BOOL v18 = 0;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    LOWORD(v23) = 0;
    double v19 = "[Sharing Suggestion] Highlight node not interesting for sharing.";
    __int16 v20 = v8;
    uint32_t v21 = 2;
    goto LABEL_17;
  }
  if ([v7 isPartOfTrip])
  {
    v15 = +[PGGraph mostSignificantMeaningLabels];
    char v16 = [v13 intersectsSet:v15];

    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v17)
      {
        int v23 = 138412290;
        id v24 = v13;
        _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node is contained in a trip and meaningful enough for sharing (%@).", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_12;
    }
    if (!v17)
    {
LABEL_18:
      BOOL v18 = 0;
      goto LABEL_19;
    }
    int v23 = 138412290;
    id v24 = v13;
    double v19 = "[Sharing Suggestion] Highlight node is contained in a trip, but not meaningful enough for sharing (%@).";
    __int16 v20 = v8;
    uint32_t v21 = 12;
LABEL_17:
    _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v23, v21);
    goto LABEL_18;
  }
LABEL_12:
  BOOL v18 = 1;
LABEL_19:

  return v18;
}

+ (NSIndexSet)suggestionSubtypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:101];
}

+ (NSIndexSet)suggestionTypes
{
  return (NSIndexSet *)[MEMORY[0x1E4F28D60] indexSetWithIndex:1];
}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [(PGAbstractSuggester *)self session];
  v8 = [v7 photoLibrary];
  double v9 = [v7 loggingConnection];
  double v10 = [v7 workingContext];
  int v11 = [v10 curationManager];
  int v12 = [v7 curationContext];
  unint64_t v13 = [v10 serviceManager];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__PGDayHighlightSharingSuggester_suggestionsWithOptions_progress___block_invoke;
  v26[3] = &unk_1E68EA5F8;
  id v27 = v5;
  id v28 = v7;
  id v29 = v9;
  id v30 = v8;
  id v31 = v13;
  v32 = self;
  id v33 = v10;
  id v34 = v11;
  id v35 = v12;
  id v14 = v6;
  id v36 = v14;
  id v25 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  id v18 = v8;
  id v19 = v9;
  id v20 = v7;
  id v21 = v5;
  [v16 performSynchronousConcurrentGraphReadUsingBlock:v26];
  uint64_t v22 = v36;
  id v23 = v14;

  return v23;
}

void __66__PGDayHighlightSharingSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
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
  if (v7)
  {
    v8 = [*(id *)(a1 + 40) loggingConnection];
    v77 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v118 = v4;
      __int16 v119 = 2112;
      v120 = v6;
      _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Start date or end date invalid: %@ - %@", buf, 0x16u);
    }
    goto LABEL_86;
  }
  uint64_t v86 = a1;
  id v75 = v3;
  uint64_t v9 = [v3 graph];
  v74 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v4 endDate:v6];
  v77 = (void *)v9;
  double v10 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:");
  if (![v10 count])
  {
    v76 = v10;
    v70 = *(NSObject **)(a1 + 48);
    if (!os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_85;
    }
    *(_DWORD *)buf = 138412546;
    v118 = v4;
    __int16 v119 = 2112;
    v120 = v6;
    v71 = "[Sharing Suggestion] No moments found between %@ and %@";
LABEL_77:
    _os_log_impl(&dword_1D1805000, v70, OS_LOG_TYPE_DEFAULT, v71, buf, 0x16u);
    goto LABEL_85;
  }
  uint64_t v11 = [v10 subsetWithEnoughScenesProcessed];
  int v12 = v10;
  unint64_t v13 = (void *)v11;

  id v14 = [v13 subsetWithEnoughFacesProcessed];

  v76 = v14;
  if (![v14 count])
  {
    v70 = *(NSObject **)(v86 + 48);
    if (!os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_85;
    }
    *(_DWORD *)buf = 138412546;
    v118 = v4;
    __int16 v119 = 2112;
    v120 = v6;
    v71 = "[Sharing Suggestion] No moments analyzed found between %@ and %@";
    goto LABEL_77;
  }
  id v15 = [v14 highlightNodes];
  id v16 = [v15 set];

  if (![v16 count])
  {
    v72 = *(NSObject **)(v86 + 48);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v118 = v4;
      __int16 v119 = 2112;
      v120 = v6;
      __int16 v121 = 2112;
      v122 = v76;
      _os_log_impl(&dword_1D1805000, v72, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] No highlight nodes found between %@ and %@ for moment nodes %@", buf, 0x20u);
    }
    goto LABEL_84;
  }
  id v17 = (void *)[v16 mutableCopy];
  v96 = objc_opt_new();
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id obj = [*(id *)(v86 + 40) existingSuggestions];
  uint64_t v18 = [obj countByEnumeratingWithState:&v109 objects:v116 count:16];
  v80 = v6;
  v81 = v4;
  v87 = v17;
  v79 = v16;
  if (!v18) {
    goto LABEL_42;
  }
  uint64_t v19 = v18;
  uint64_t v20 = *(void *)v110;
  uint64_t v78 = *(void *)v110;
  do
  {
    uint64_t v21 = 0;
    uint64_t v82 = v19;
    do
    {
      if (*(void *)v110 != v20) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void **)(*((void *)&v109 + 1) + 8 * v21);
      id v23 = (void *)MEMORY[0x1D25FED50]();
      if ([v22 subtype] == 101)
      {
        v84 = v23;
        uint64_t v85 = v21;
        id v24 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v22 options:0];
        v90 = [v24 fetchedObjectIDsSet];

        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v94 = v16;
        uint64_t v25 = [v94 countByEnumeratingWithState:&v105 objects:v115 count:16];
        if (!v25) {
          goto LABEL_39;
        }
        uint64_t v26 = v25;
        id v27 = v22;
        uint64_t v28 = *(void *)v106;
        v88 = v22;
        while (1)
        {
          uint64_t v29 = 0;
          uint64_t v92 = v26;
          do
          {
            if (*(void *)v106 != v28) {
              objc_enumerationMutation(v94);
            }
            id v30 = *(void **)(*((void *)&v105 + 1) + 8 * v29);
            id v31 = (void *)MEMORY[0x1D25FED50]();
            if ([v17 containsObject:v30])
            {
              v32 = [v27 universalStartDate];
              id v33 = [v27 universalEndDate];
              id v34 = v32;
              if (v34 && v33)
              {
                id v35 = v30;
                id v36 = [v35 universalStartDate];
                v37 = [v35 universalEndDate];

                if ([v36 compare:v33] == 1)
                {

                  id v17 = v87;
                  goto LABEL_27;
                }
                uint64_t v42 = [v37 compare:v34];

                BOOL v7 = v42 == -1;
                id v17 = v87;
                id v27 = v88;
                if (!v7)
                {
                  [v87 removeObject:v35];
LABEL_33:
                  uint64_t v26 = v92;
                  goto LABEL_34;
                }
              }
              else
              {
LABEL_27:
              }
              v38 = [v30 localIdentifier];
              v39 = [v96 objectForKeyedSubscript:v38];
              if (!v39)
              {
                v40 = [v30 fetchAssetCollectionInPhotoLibrary:*(void *)(v86 + 56)];
                v41 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v40 options:0];
                v39 = [v41 fetchedObjectIDsSet];

                [v96 setObject:v39 forKeyedSubscript:v38];
                id v27 = v88;
              }
              if ([v90 intersectsSet:v39]) {
                [v17 removeObject:v30];
              }

              goto LABEL_33;
            }
LABEL_34:
            ++v29;
          }
          while (v26 != v29);
          uint64_t v43 = [v94 countByEnumeratingWithState:&v105 objects:v115 count:16];
          uint64_t v26 = v43;
          if (!v43)
          {
LABEL_39:

            id v6 = v80;
            v4 = v81;
            uint64_t v20 = v78;
            id v16 = v79;
            uint64_t v19 = v82;
            id v23 = v84;
            uint64_t v21 = v85;
            break;
          }
        }
      }
      ++v21;
    }
    while (v21 != v19);
    uint64_t v19 = [obj countByEnumeratingWithState:&v109 objects:v116 count:16];
  }
  while (v19);
LABEL_42:

  if ([v17 count])
  {
    v44 = objc_alloc_init(PGNeighborScoreComputer);
    uint64_t v45 = v86;
    v91 = [[PGTitleGenerationContext alloc] initWithGraph:v77 serviceManager:*(void *)(v86 + 64)];
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v95 = v17;
    uint64_t v46 = [v95 countByEnumeratingWithState:&v101 objects:v114 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v102;
      uint64_t v89 = *(void *)v102;
      do
      {
        uint64_t v49 = 0;
        uint64_t v93 = v47;
        do
        {
          if (*(void *)v102 != v48) {
            objc_enumerationMutation(v95);
          }
          v50 = *(void **)(*((void *)&v101 + 1) + 8 * v49);
          v51 = (void *)MEMORY[0x1D25FED50]();
          if ([(id)objc_opt_class() shouldSuggestHighlightNode:v50 neighborScoreComputer:v44 loggingConnection:*(void *)(v45 + 48)])
          {
            v52 = *(void **)(v45 + 72);
            [v50 eventEnrichmentMomentNodes];
            v54 = uint64_t v53 = v45;
            v55 = [v54 array];
            v56 = [v52 sharingSuggestionResultsForMomentNodes:v55 withWorkingContext:*(void *)(v53 + 80)];

            long long v99 = 0u;
            long long v100 = 0u;
            long long v97 = 0u;
            long long v98 = 0u;
            v57 = v56;
            uint64_t v58 = [(PGEnrichableEventSuggestion *)v57 countByEnumeratingWithState:&v97 objects:v113 count:16];
            v59 = v57;
            if (v58)
            {
              uint64_t v60 = v58;
              v61 = v44;
              uint64_t v62 = *(void *)v98;
LABEL_51:
              uint64_t v63 = 0;
              while (1)
              {
                if (*(void *)v98 != v62) {
                  objc_enumerationMutation(v57);
                }
                v64 = [*(id *)(*((void *)&v97 + 1) + 8 * v63) person];
                int v65 = [v64 isVerified];

                if (v65) {
                  break;
                }
                if (v60 == ++v63)
                {
                  uint64_t v60 = [(PGEnrichableEventSuggestion *)v57 countByEnumeratingWithState:&v97 objects:v113 count:16];
                  if (v60) {
                    goto LABEL_51;
                  }
                  v59 = v57;
                  id v17 = v87;
                  v44 = v61;
                  goto LABEL_68;
                }
              }
              v66 = *(NSObject **)(v86 + 48);
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1805000, v66, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node contains verified people", buf, 2u);
              }

              uint64_t v67 = v86;
              v59 = [[PGEnrichableEventSuggestion alloc] initWithType:1 subtype:101 enrichableEvent:v50 sharingSuggestionResults:v57 photoLibrary:*(void *)(v86 + 56) curationManager:*(void *)(v86 + 88) curationContext:*(void *)(v86 + 96) loggingConnection:*(void *)(v86 + 48) titleGenerationContext:v91];
              id v17 = v87;
              v44 = v61;
              if (!v59)
              {
LABEL_68:
                uint64_t v48 = v89;
                goto LABEL_69;
              }
              [*(id *)(v86 + 104) addObject:v59];
              uint64_t v48 = v89;
              if ([*(id *)(v86 + 32) allowNotification])
              {
                v68 = [*(id *)(v86 + 40) notificationProfile];
                if ([v68 eligibleForNotification])
                {
                  -[PGEnrichableEventSuggestion setNotificationQuality:](v59, "setNotificationQuality:", [v68 notificationQualityForHighlightNode:v50]);
                  if ([v68 shouldNotifyForSuggestion:v59 withOptions:*(void *)(v86 + 32)])-[PGEnrichableEventSuggestion setNotificationState:](v59, "setNotificationState:", 1); {
                }
                  }

                uint64_t v67 = v86;
              }
              unint64_t v69 = [*(id *)(v67 + 104) count];
              if (v69 >= [*(id *)(v67 + 32) maximumNumberOfSuggestions])
              {

                goto LABEL_82;
              }
            }
LABEL_69:

            uint64_t v45 = v86;
            uint64_t v47 = v93;
          }
          ++v49;
        }
        while (v49 != v47);
        uint64_t v47 = [v95 countByEnumeratingWithState:&v101 objects:v114 count:16];
      }
      while (v47);
    }
LABEL_82:

    id v6 = v80;
    v4 = v81;
    id v16 = v79;
  }
  else
  {
    v73 = *(NSObject **)(v86 + 48);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v118 = v4;
      __int16 v119 = 2112;
      v120 = v6;
      _os_log_impl(&dword_1D1805000, v73, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlights found between %@ and %@ are already covered in exising sharing suggestions", buf, 0x16u);
    }
  }

LABEL_84:
LABEL_85:

  id v3 = v75;
LABEL_86:
}

@end