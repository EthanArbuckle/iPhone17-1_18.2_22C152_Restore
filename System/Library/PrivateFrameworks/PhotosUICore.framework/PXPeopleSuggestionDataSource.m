@interface PXPeopleSuggestionDataSource
+ (void)_mergeAndSaveUserFeedbackForPersons:(id)a3 personChangeRequest:(id)a4;
- (BOOL)cancelSuggestionForPerson:(id)a3 withToken:(id)a4 error:(id *)a5;
- (NSArray)mergeCandidates;
- (PHFetchResult)mergeCandidateFetchResult;
- (PXPeopleSuggestionDataSource)initWithFlowType:(unint64_t)a3;
- (id)commitSuggestionsForPerson:(id)a3 withConfirmedSuggestions:(id)a4 andRejectedSuggestions:(id)a5;
- (id)fetchAndCacheMergeCandidatesForPerson:(id)a3;
- (id)suggestionsForPerson:(id)a3 withConfirmedSuggestions:(id)a4 andRejectedSuggestions:(id)a5 completion:(id)a6;
- (unint64_t)flowType;
- (unint64_t)initialPageLimit;
- (unint64_t)suggestionFetchType;
- (void)photoLibraryDidChange:(id)a3;
- (void)setFlowType:(unint64_t)a3;
- (void)setInitialPageLimit:(unint64_t)a3;
- (void)setMergeCandidateFetchResult:(id)a3;
- (void)setMergeCandidates:(id)a3;
- (void)setSuggestionFetchType:(unint64_t)a3;
- (void)startListeningForLibraryChanges;
- (void)stopListeningForLibraryChanges;
@end

@implementation PXPeopleSuggestionDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeCandidateFetchResult, 0);
  objc_storeStrong((id *)&self->_mergeCandidates, 0);
}

- (void)setMergeCandidateFetchResult:(id)a3
{
}

- (PHFetchResult)mergeCandidateFetchResult
{
  return self->_mergeCandidateFetchResult;
}

- (void)setMergeCandidates:(id)a3
{
}

- (NSArray)mergeCandidates
{
  return self->_mergeCandidates;
}

- (unint64_t)flowType
{
  return self->_flowType;
}

- (void)setSuggestionFetchType:(unint64_t)a3
{
  self->_suggestionFetchType = a3;
}

- (unint64_t)suggestionFetchType
{
  return self->_suggestionFetchType;
}

- (void)setInitialPageLimit:(unint64_t)a3
{
  self->_initialPageLimit = a3;
}

- (unint64_t)initialPageLimit
{
  return self->_initialPageLimit;
}

- (void)photoLibraryDidChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXPeopleSuggestionDataSource *)self mergeCandidateFetchResult];
  v6 = [v4 changeDetailsForFetchResult:v5];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v14 = [v13 objectID];
          if ([v4 keyFaceChangedForPersonOID:v14]) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      v23 = @"PXPeopleUpdatedKeyFacePersonsKey";
      v24 = v7;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__PXPeopleSuggestionDataSource_photoLibraryDidChange___block_invoke;
      block[3] = &unk_1E5DD36F8;
      id v18 = v15;
      id v16 = v15;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __54__PXPeopleSuggestionDataSource_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"PXPeopleSuggestionManagerKeyFaceUpdateNotification" object:0 userInfo:*(void *)(a1 + 32)];
}

- (void)stopListeningForLibraryChanges
{
  if ([(PXPeopleSuggestionDataSource *)self flowType] == 1)
  {
    objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 unregisterChangeObserver:self];
  }
}

- (void)startListeningForLibraryChanges
{
  if ([(PXPeopleSuggestionDataSource *)self flowType] == 1)
  {
    objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 registerChangeObserver:self];
  }
}

- (id)commitSuggestionsForPerson:(id)a3 withConfirmedSuggestions:(id)a4 andRejectedSuggestions:(id)a5
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  id v96 = a3;
  id v95 = a4;
  id v94 = a5;
  v97 = +[PXPeopleUISettings sharedInstance];
  if (([v97 enableBootstrapDemoMode] & 1) != 0
    || [v97 useBootstrapMockDataSource])
  {
    id v8 = v96;
  }
  else
  {
    uint64_t v9 = PLUIGetLog();
    os_signpost_id_t v10 = os_signpost_id_generate(v9);
    uint64_t v11 = v9;
    v12 = v11;
    os_signpost_id_t spid = v10;
    unint64_t v90 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "commitSuggestionsForPerson", "", buf, 2u);
    }
    v91 = v12;

    objc_opt_class();
    uint64_t v13 = objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v78 = [MEMORY[0x1E4F28B00] currentHandler];
      [v78 handleFailureInMethod:a2, self, @"PXPeopleSuggestionDataSource.m", 206, @"Invalid parameter not satisfying: %@", @"[person isKindOfClass:personClass]" object file lineNumber description];
    }
    if ([v95 count])
    {
      v14 = [v95 firstObject];
      if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)
      {
        v79 = [MEMORY[0x1E4F28B00] currentHandler];
        [v79 handleFailureInMethod:a2, self, @"PXPeopleSuggestionDataSource.m", 209, @"Invalid parameter not satisfying: %@", @"[confirmedSuggestion isKindOfClass:suggestionClass] || [confirmedSuggestion isKindOfClass:personClass]" object file lineNumber description];
      }
    }
    if ([v94 count])
    {
      v15 = [v94 firstObject];
      if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)
      {
        v80 = [MEMORY[0x1E4F28B00] currentHandler];
        [v80 handleFailureInMethod:a2, self, @"PXPeopleSuggestionDataSource.m", 213, @"Invalid parameter not satisfying: %@", @"[rejectedSuggestion isKindOfClass:suggestionClass] || [rejectedSuggestion isKindOfClass:personClass]" object file lineNumber description];
      }
    }
    id v92 = v96;
    if (v92)
    {
      v103 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v95, "count"));
      v100 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v95, "count"));
      id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v94, "count"));
      v102 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v94, "count"));
      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      obuint64_t j = v95;
      uint64_t v17 = [obj countByEnumeratingWithState:&v145 objects:v160 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v146;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v146 != v18) {
              objc_enumerationMutation(obj);
            }
            long long v20 = *(void **)(*((void *)&v145 + 1) + 8 * i);
            if (objc_opt_isKindOfClass())
            {
              [v103 addObject:v20];
            }
            else if (objc_opt_isKindOfClass())
            {
              long long v21 = [v20 person];
              [v100 addObject:v21];
            }
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v145 objects:v160 count:16];
        }
        while (v17);
      }

      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      id v22 = v94;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v141 objects:v159 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v142;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v142 != v24) {
              objc_enumerationMutation(v22);
            }
            uint64_t v26 = *(void *)(*((void *)&v141 + 1) + 8 * j);
            char isKindOfClass = objc_opt_isKindOfClass();
            v28 = v16;
            if ((isKindOfClass & 1) == 0)
            {
              char v29 = objc_opt_isKindOfClass();
              v28 = v102;
              if ((v29 & 1) == 0) {
                continue;
              }
            }
            [v28 addObject:v26];
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v141 objects:v159 count:16];
        }
        while (v23);
      }

      v89 = objc_msgSend(v102, "_pl_map:", &__block_literal_global_227_65798);
      uint64_t v30 = [v103 count];
      uint64_t v31 = [v100 count];
      uint64_t v32 = [v16 count];
      uint64_t v87 = [v89 count];
      BOOL v85 = v32 != 0;
      *(void *)buf = 0;
      v136 = buf;
      uint64_t v137 = 0x3032000000;
      v138 = __Block_byref_object_copy__65799;
      v139 = __Block_byref_object_dispose__65800;
      id v140 = 0;
      v33 = PLUIGetLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v151 = 134218752;
        uint64_t v152 = v30;
        __int16 v153 = 2048;
        uint64_t v154 = v32;
        __int16 v155 = 2048;
        uint64_t v156 = v31;
        __int16 v157 = 2048;
        uint64_t v158 = v87;
        _os_log_impl(&dword_1A9AE7000, v33, OS_LOG_TYPE_INFO, "[People][Commit] %lu / %lu persons, %lu / %lu suggestions", v151, 0x2Au);
      }

      if (v30 != 0 || v31 != 0 || v32 != 0 || v87 != 0)
      {
        v84 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
        id v101 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        if (PFOSVariantHasInternalDiagnostics())
        {
          id v83 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if (v30)
          {
            v34 = objc_msgSend(v103, "_pl_map:", &__block_literal_global_232_65803);
            [v83 addObjectsFromArray:v34];
          }
          if (v32)
          {
            v35 = objc_msgSend(v16, "_pl_map:", &__block_literal_global_234);
            [v83 addObjectsFromArray:v35];
          }
          if ([v83 count])
          {
            v36 = v91;
            v37 = v36;
            if (v90 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
            {
              *(_WORD *)v151 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v37, OS_SIGNPOST_INTERVAL_BEGIN, spid, "fetchMergeCandidateWithConfidencePersons", "", v151, 2u);
            }
            v81 = v37;

            v82 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v92];
            [v82 setIncludeOnlyPersonsWithVisibleKeyFaces:1];
            v38 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personUUID IN %@", v83];
            [v82 setInternalPredicate:v38];

            v39 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
            [v82 setIncludedDetectionTypes:v39];

            [MEMORY[0x1E4F391F0] fetchMergeCandidateWithConfidencePersonsForPerson:v92 options:v82];
            long long v133 = 0u;
            long long v134 = 0u;
            long long v131 = 0u;
            long long v132 = 0u;
            id v98 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v40 = [v98 countByEnumeratingWithState:&v131 objects:v150 count:16];
            if (v40)
            {
              uint64_t v41 = *(void *)v132;
              do
              {
                for (uint64_t k = 0; k != v40; ++k)
                {
                  if (*(void *)v132 != v41) {
                    objc_enumerationMutation(v98);
                  }
                  v43 = *(void **)(*((void *)&v131 + 1) + 8 * k);
                  v44 = NSNumber;
                  [v43 mergeCandidateConfidence];
                  v45 = objc_msgSend(v44, "numberWithDouble:");
                  v46 = [v43 uuid];
                  [v101 setObject:v45 forKeyedSubscript:v46];
                }
                uint64_t v40 = [v98 countByEnumeratingWithState:&v131 objects:v150 count:16];
              }
              while (v40);
            }

            [MEMORY[0x1E4F391F0] fetchMergeCandidatePersonsForPerson:v92 options:v82];
            long long v129 = 0u;
            long long v130 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            id v47 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v48 = [v47 countByEnumeratingWithState:&v127 objects:v149 count:16];
            if (v48)
            {
              uint64_t v49 = *(void *)v128;
              do
              {
                for (uint64_t m = 0; m != v48; ++m)
                {
                  if (*(void *)v128 != v49) {
                    objc_enumerationMutation(v47);
                  }
                  v51 = *(void **)(*((void *)&v127 + 1) + 8 * m);
                  v52 = NSNumber;
                  [v51 mergeCandidateConfidence];
                  v53 = objc_msgSend(v52, "numberWithDouble:");
                  v54 = [v51 uuid];
                  [v101 setObject:v53 forKeyedSubscript:v54];
                }
                uint64_t v48 = [v47 countByEnumeratingWithState:&v127 objects:v149 count:16];
              }
              while (v48);
            }

            v55 = PLUIGetLog();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              uint64_t v56 = [v101 count];
              *(_DWORD *)v151 = 134217984;
              uint64_t v152 = v56;
              _os_log_impl(&dword_1A9AE7000, v55, OS_LOG_TYPE_INFO, "[People][Commit] fetched %lu candidates with confidence", v151, 0xCu);
            }

            v57 = v81;
            v58 = v57;
            if (v90 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v57))
            {
              *(_WORD *)v151 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v58, OS_SIGNPOST_INTERVAL_END, spid, "fetchMergeCandidateWithConfidencePersons", "", v151, 2u);
            }
          }
        }
        v59 = v91;
        v60 = v59;
        if (v90 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
        {
          *(_WORD *)v151 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v60, OS_SIGNPOST_INTERVAL_BEGIN, spid, "updateDatabaseWithSuggestions", "", v151, 2u);
        }

        v118[0] = MEMORY[0x1E4F143A8];
        v118[1] = 3221225472;
        v118[2] = __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_239;
        v118[3] = &unk_1E5DB50B0;
        id v61 = v103;
        id v119 = v61;
        id v99 = v100;
        id v120 = v99;
        id v62 = v92;
        id v121 = v62;
        BOOL v125 = v87 != 0;
        id v122 = v89;
        BOOL v126 = v85;
        id v86 = v16;
        id v123 = v86;
        v124 = buf;
        id v117 = 0;
        [v84 performChangesAndWait:v118 error:&v117];
        id v63 = v117;
        v64 = v60;
        v65 = v64;
        if (v90 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
        {
          *(_WORD *)v151 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v65, OS_SIGNPOST_INTERVAL_END, spid, "updateDatabaseWithSuggestions", "", v151, 2u);
        }

        unint64_t v66 = [(PXPeopleSuggestionDataSource *)self flowType];
        if (!v66)
        {
          v67 = [MEMORY[0x1E4F1CAD0] setWithArray:v61];
          v68 = [PXPeopleConfirmationInfo alloc];
          v69 = [(PXPeopleConfirmationInfo *)v68 initWithSourcePerson:v62 targetPerson:*((void *)v136 + 5) confirmedSuggestions:v67];
          v70 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v70 postNotificationName:@"PXPeopleConfirmationDidFinish" object:v69];
        }
        if (v63)
        {
          v71 = PLUIGetLog();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v151 = 138412290;
            uint64_t v152 = (uint64_t)v63;
            _os_log_impl(&dword_1A9AE7000, v71, OS_LOG_TYPE_DEBUG, "Persisting confirmation choices failed: %@", v151, 0xCu);
          }
        }
        v72 = dispatch_get_global_queue(17, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_245;
        block[3] = &unk_1E5DB5148;
        id v106 = v99;
        id v107 = v61;
        id v108 = v86;
        id v109 = v62;
        unint64_t v114 = v66;
        id v110 = v102;
        id v111 = v101;
        uint64_t v115 = v87;
        uint64_t v116 = v13;
        id v112 = obj;
        id v113 = v22;
        id v73 = v101;
        dispatch_async(v72, block);
      }
      v74 = v91;
      v75 = v74;
      if (v90 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
      {
        *(_WORD *)v151 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v75, OS_SIGNPOST_INTERVAL_END, spid, "commitSuggestionsForPerson", "", v151, 2u);
      }

      v76 = (void *)*((void *)v136 + 5);
      if (!v76) {
        v76 = v92;
      }
      id v8 = v76;
      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

void __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_239(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count") + objc_msgSend(*(id *)(a1 + 40), "count") + 1);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 addObjectsFromArray:*(void *)(a1 + 32)];
  [v11 addObjectsFromArray:*(void *)(a1 + 40)];
  [v11 addObject:*(void *)(a1 + 48)];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  if (v2 + [*(id *)(a1 + 40) count])
  {
    uint64_t v4 = [*(id *)(a1 + 48) verifiedType];
    v5 = (void *)MEMORY[0x1E4F39200];
    if (v4 >= 1)
    {
      v6 = [*(id *)(a1 + 48) localIdentifier];
      v7 = [v5 changeRequestForMergingPersons:v11 nominalTargetIdentifier:v6];

      goto LABEL_7;
    }
    uint64_t v3 = [MEMORY[0x1E4F39200] changeRequestForMergingPersons:v11];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F39200] changeRequestForPerson:*(void *)(a1 + 48)];
  }
  v7 = (void *)v3;
LABEL_7:
  if ([*(id *)(a1 + 48) verifiedType] != 1) {
    [v7 setVerifiedType:1];
  }
  if (*(unsigned char *)(a1 + 80)) {
    [v7 addRejectedFaces:*(void *)(a1 + 56) forCluster:1];
  }
  if (*(unsigned char *)(a1 + 81)) {
    [v7 rejectMergeCandidatePersons:*(void *)(a1 + 64)];
  }
  +[PXPeopleSuggestionDataSource _mergeAndSaveUserFeedbackForPersons:v11 personChangeRequest:v7];
  uint64_t v8 = [v7 targetPerson];
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  os_signpost_id_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_245(uint64_t a1)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v74 objects:v83 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v75 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v74 + 1) + 8 * i) faceCount];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v74 objects:v83 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v71 = 0u;
  long long v70 = 0u;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v71 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v70 + 1) + 8 * j) faceCount];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v70 objects:v82 count:16];
    }
    while (v10);
  }

  uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_249];
  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_251];
  v15 = [*(id *)(a1 + 40) filteredArrayUsingPredicate:v13];
  id v16 = [*(id *)(a1 + 40) filteredArrayUsingPredicate:v14];
  v60 = (void *)v13;
  uint64_t v17 = [*(id *)(a1 + 48) filteredArrayUsingPredicate:v13];
  v59 = (void *)v14;
  uint64_t v18 = [*(id *)(a1 + 48) filteredArrayUsingPredicate:v14];
  long long v19 = [v15 valueForKeyPath:@"@sum.faceCount"];
  uint64_t v52 = [v19 integerValue];

  long long v20 = [v17 valueForKeyPath:@"@sum.faceCount"];
  uint64_t v51 = [v20 integerValue];

  long long v21 = [v16 valueForKeyPath:@"@sum.faceCount"];
  uint64_t v22 = [v21 integerValue];

  uint64_t v23 = [v18 valueForKeyPath:@"@sum.faceCount"];
  uint64_t v24 = [v23 integerValue];

  v80[0] = @"mergeCandidatesVerifiedConfirmed";
  v58 = v15;
  v54 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  v81[0] = v54;
  v80[1] = @"mergeCandidatesVerifiedRejected";
  uint64_t v56 = v17;
  v53 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
  v81[1] = v53;
  v80[2] = @"mergeCandidatesUnverifiedConfirmed";
  v57 = v16;
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  v81[2] = v25;
  v80[3] = @"mergeCandidatesUnverifiedRejected";
  v55 = v18;
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
  v81[3] = v26;
  v80[4] = @"facesVerifiedConfirmed";
  v27 = [NSNumber numberWithInteger:v52];
  v81[4] = v27;
  v80[5] = @"facesVerifiedRejected";
  v28 = [NSNumber numberWithInteger:v51];
  v81[5] = v28;
  v80[6] = @"facesUnverifiedConfirmed";
  char v29 = [NSNumber numberWithInteger:v22];
  v81[6] = v29;
  v80[7] = @"facesUnverifiedRejected";
  uint64_t v30 = [NSNumber numberWithInteger:v24];
  v81[7] = v30;
  v80[8] = @"type";
  uint64_t v31 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(*(id *)(a1 + 56), "detectionType"));
  v81[8] = v31;
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:9];

  uint64_t v33 = *(void *)(a1 + 96);
  if (v33)
  {
    v34 = (void *)v32;
    unint64_t v35 = 0x1E4F28000;
    if (v33 == 1) {
      [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.bootstrap.mergeCandidates.confirmedAndRejectedCounts" withPayload:v32];
    }
  }
  else
  {
    v34 = (void *)v32;
    [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.confirmAdditional.mergeCandidates.confirmedAndRejectedCounts" withPayload:v32];
    v36 = (void *)MEMORY[0x1E4F56658];
    v78[0] = @"suggestionsConfirmed";
    unint64_t v35 = 0x1E4F28000uLL;
    v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v79[0] = v37;
    v78[1] = @"suggestionsRejected";
    v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v79[1] = v38;
    v78[2] = @"facesConfirmed";
    v39 = [NSNumber numberWithUnsignedInteger:v5];
    v79[2] = v39;
    v78[3] = @"facesRejected";
    uint64_t v40 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 104)];
    v79[3] = v40;
    uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:4];
    [v36 sendEvent:@"com.apple.photos.CPAnalytics.people.confirmAdditional.personSuggestions.confirmedAndRejectedCounts" withPayload:v41];
  }
  if (objc_msgSend(*(id *)(a1 + 72), "count", v51)
    || [*(id *)(a1 + 32) count]
    || [*(id *)(a1 + 64) count])
  {
    v42 = objc_msgSend(*(id *)(v35 + 3792), "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "faceCount"));
    v43 = objc_msgSend(*(id *)(v35 + 3792), "numberWithShort:", objc_msgSend(*(id *)(a1 + 56), "detectionType"));
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_4;
    aBlock[3] = &unk_1E5DB50F8;
    id v66 = *(id *)(a1 + 72);
    id v44 = v42;
    id v67 = v44;
    id v68 = *(id *)(a1 + 56);
    id v45 = v43;
    id v69 = v45;
    v46 = (void (**)(void *, __CFString *, void))_Block_copy(aBlock);
    v46[2](v46, @"confirmed", *(void *)(a1 + 40));
    v46[2](v46, @"rejected", *(void *)(a1 + 48));
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_5;
    v61[3] = &unk_1E5DB5120;
    uint64_t v47 = *(void *)(a1 + 112);
    id v63 = v44;
    uint64_t v64 = v47;
    id v62 = v45;
    id v48 = v44;
    id v49 = v45;
    v50 = (void (**)(void *, __CFString *, void))_Block_copy(v61);
    v50[2](v50, @"confirmed", *(void *)(a1 + 80));
    v50[2](v50, @"rejected", *(void *)(a1 + 88));
  }
}

void __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = [v9 uuid];
        uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
        v12 = (void *)v11;
        if (v11)
        {
          v25[0] = @"personUUID";
          v25[1] = @"action";
          v26[0] = v10;
          v26[1] = v20;
          v26[2] = v11;
          v25[2] = @"confidence";
          v25[3] = @"candidateFaceCount";
          uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "faceCount"));
          uint64_t v15 = *(void *)(a1 + 40);
          uint64_t v14 = *(void **)(a1 + 48);
          v26[3] = v13;
          v26[4] = v15;
          v25[4] = @"targetFaceCount";
          v25[5] = @"targetAgeType";
          id v16 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v14, "ageType"));
          v25[6] = @"type";
          uint64_t v17 = *(void *)(a1 + 56);
          v26[5] = v16;
          v26[6] = v17;
          uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:7];

          [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.people.candidateWithConfidence" withPayload:v18];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v6);
  }
}

void __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v21 = a2;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * v8);
        if (objc_opt_isKindOfClass())
        {
          long long v23 = (void *)MEMORY[0x1E4F56658];
          v29[0] = @"action";
          v29[1] = @"type";
          uint64_t v10 = *(void *)(a1 + 32);
          uint64_t v11 = *(void *)(a1 + 40);
          v30[0] = v21;
          v30[1] = v10;
          v30[2] = v11;
          v29[2] = @"targetFaceCount";
          v29[3] = @"suggestionFaceCount";
          v12 = NSNumber;
          id v13 = v9;
          long long v24 = [v13 person];
          uint64_t v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v24, "faceCount"));
          v30[3] = v14;
          v29[4] = @"similarityScore";
          uint64_t v15 = NSNumber;
          [v13 similarityScore];
          id v16 = objc_msgSend(v15, "numberWithDouble:");
          v30[4] = v16;
          v29[5] = @"personUUID";
          uint64_t v17 = [v13 person];
          [v17 uuid];
          v19 = uint64_t v18 = v6;
          v30[5] = v19;
          id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:6];
          [v23 sendEvent:@"com.apple.photos.CPAnalytics.people.confirmAdditional.suggestion" withPayload:v20];

          uint64_t v6 = v18;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v6);
  }
}

uint64_t __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isVerified] ^ 1;
}

uint64_t __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_2_246(uint64_t a1, void *a2)
{
  return [a2 isVerified];
}

uint64_t __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke_229(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __107__PXPeopleSuggestionDataSource_commitSuggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 keyFace];
}

- (BOOL)cancelSuggestionForPerson:(id)a3 withToken:(id)a4 error:(id *)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [v5 cancel];
  uint64_t v6 = [v5 token];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6];
    v11[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v7 cancelOperationsWithIdentifiers:v9 reply:&__block_literal_global_65933];
  }
  return 1;
}

- (id)suggestionsForPerson:(id)a3 withConfirmedSuggestions:(id)a4 andRejectedSuggestions:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = objc_opt_class();
  id v16 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PXPeopleSuggestionDataSource.m", 97, @"Invalid parameter not satisfying: %@", @"[person isKindOfClass:personClass]" object file lineNumber description];
  }
  if ([v12 count])
  {
    uint64_t v17 = [v12 firstObject];
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2, self, @"PXPeopleSuggestionDataSource.m", 100, @"Invalid parameter not satisfying: %@", @"[confirmedSuggestion isKindOfClass:suggestionClass] || [confirmedSuggestion isKindOfClass:personClass]" object file lineNumber description];
    }
  }
  if ([v13 count])
  {
    uint64_t v18 = [v13 firstObject];
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a2, self, @"PXPeopleSuggestionDataSource.m", 104, @"Invalid parameter not satisfying: %@", @"[rejectedSuggestion isKindOfClass:suggestionClass] || [rejectedSuggestion isKindOfClass:personClass]" object file lineNumber description];
    }
  }
  id v19 = v11;
  id v20 = PLUIGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEBUG, "Suggestions UI: Fetching suggestions", (uint8_t *)buf, 2u);
  }

  id v21 = objc_alloc_init(PXSuggestionToken);
  objc_initWeak(buf, self);
  long long v22 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__PXPeopleSuggestionDataSource_suggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions_completion___block_invoke;
  block[3] = &unk_1E5DB5048;
  objc_copyWeak(v40, buf);
  void block[4] = self;
  id v35 = v19;
  id v36 = v12;
  id v37 = v13;
  id v39 = v14;
  long long v23 = v21;
  v38 = v23;
  v40[1] = v15;
  v40[2] = v16;
  id v24 = v14;
  id v25 = v13;
  id v26 = v12;
  id v27 = v19;
  dispatch_async(v22, block);

  long long v28 = v38;
  char v29 = v23;

  objc_destroyWeak(v40);
  objc_destroyWeak(buf);

  return v29;
}

void __112__PXPeopleSuggestionDataSource_suggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions_completion___block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v4 = [WeakRetained suggestionFetchType];

  if (v4 != 1)
  {
    id v5 = [*(id *)(a1 + 32) mergeCandidates];

    if (!v5)
    {
      uint64_t v6 = PLUIGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "Suggestions UI: Fetching merge candidates from database", buf, 2u);
      }

      id v7 = objc_loadWeakRetained(v2);
      id v8 = (id)[v7 fetchAndCacheMergeCandidatesForPerson:*(void *)(a1 + 40)];
    }
  }
  id v9 = objc_loadWeakRetained(v2);
  uint64_t v10 = [v9 mergeCandidates];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = objc_loadWeakRetained(v2);
    id v13 = [v12 mergeCandidates];
    id v14 = (void *)[v13 mutableCopy];

    [v14 removeObjectsInArray:*(void *)(a1 + 48)];
    [v14 removeObjectsInArray:*(void *)(a1 + 56)];
    id v15 = objc_loadWeakRetained(v2);
    [v15 setMergeCandidates:v14];
  }
  id v16 = objc_loadWeakRetained(v2);
  uint64_t v17 = [v16 mergeCandidates];

  if ([v17 count] && *(void *)(a1 + 72))
  {
    uint64_t v18 = PLUIGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEBUG, "Suggestions UI: Suggestion dataSource returning merge candidates", buf, 2u);
    }

    id v19 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_19;
  }
  if (([*(id *)(a1 + 64) canceled] & 1) != 0 || !v4)
  {
    uint64_t v22 = *(void *)(a1 + 72);
    if (v22)
    {
      id v19 = *(void (**)(void))(v22 + 16);
LABEL_19:
      v19();
    }
  }
  else
  {
    id v20 = [*(id *)(a1 + 48) arrayByAddingObjectsFromArray:*(void *)(a1 + 56)];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __112__PXPeopleSuggestionDataSource_suggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions_completion___block_invoke_215;
    v63[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v63[4] = *(void *)(a1 + 88);
    id v21 = objc_msgSend(v20, "_pl_filter:", v63);
    id v49 = v20;
    v50 = v17;
    uint64_t v47 = v21;
    if ([v21 count])
    {
      uint64_t v51 = objc_msgSend(MEMORY[0x1E4F39050], "fetchKeyFaceByPersonLocalIdentifierForPersons:options:", v21, 0, v21, v20);
    }
    else
    {
      uint64_t v51 = (void *)MEMORY[0x1E4F1CC08];
    }
    long long v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count", v47));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v24 = *(id *)(a1 + 48);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v59 objects:v66 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v60 != v27) {
            objc_enumerationMutation(v24);
          }
          char v29 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            [v23 addObject:v29];
          }
          else if (objc_opt_isKindOfClass())
          {
            id v30 = v29;
            uint64_t v31 = [v30 localIdentifier];
            uint64_t v32 = [v51 objectForKeyedSubscript:v31];

            if (v32)
            {
              uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F39218]) initWithKeyFace:v32 person:v30 confirmed:1 similarityScore:0.0];
              [v23 addObject:v33];
            }
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v59 objects:v66 count:16];
      }
      while (v26);
    }

    v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v35 = *(id *)(a1 + 56);
    uint64_t v36 = [v35 countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v56 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void **)(*((void *)&v55 + 1) + 8 * j);
          if (objc_opt_isKindOfClass())
          {
            [v34 addObject:v40];
          }
          else if (objc_opt_isKindOfClass())
          {
            id v41 = v40;
            v42 = [v41 localIdentifier];
            v43 = [v51 objectForKeyedSubscript:v42];

            if (v43)
            {
              id v44 = (void *)[objc_alloc(MEMORY[0x1E4F39218]) initWithKeyFace:v43 person:v41 confirmed:0 similarityScore:0.0];
              [v34 addObject:v44];
            }
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v55 objects:v65 count:16];
      }
      while (v37);
    }

    id v45 = (void *)MEMORY[0x1E4F391F0];
    uint64_t v46 = *(void *)(a1 + 40);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __112__PXPeopleSuggestionDataSource_suggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions_completion___block_invoke_2;
    v52[3] = &unk_1E5DB5020;
    id v53 = *(id *)(a1 + 64);
    id v54 = *(id *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 64), "setToken:", objc_msgSend(v45, "personSuggestionsForPerson:confirmedPersonSuggestions:rejectedPersonSuggestions:completion:", v46, v23, v34, v52));

    uint64_t v17 = v50;
  }
}

uint64_t __112__PXPeopleSuggestionDataSource_suggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions_completion___block_invoke_215()
{
  return objc_opt_isKindOfClass() & 1;
}

void __112__PXPeopleSuggestionDataSource_suggestionsForPerson_withConfirmedSuggestions_andRejectedSuggestions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([*(id *)(a1 + 32) canceled] & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
    }
  }
}

- (void)setFlowType:(unint64_t)a3
{
  self->_flowType = a3;
  if (a3 == 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    if (a3) {
      return;
    }
    uint64_t v3 = 2;
  }
  [(PXPeopleSuggestionDataSource *)self setSuggestionFetchType:v3];
}

- (id)fetchAndCacheMergeCandidatesForPerson:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXPeopleSuggestionDataSource *)self mergeCandidateFetchResult];
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v4];
    [v6 setIncludeOnlyPersonsWithVisibleKeyFaces:1];
    v18[0] = *MEMORY[0x1E4F397E0];
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v6 setFetchPropertySets:v7];

    id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"faceCount" ascending:0];
    id v9 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"uuid", 0, v8);
    v17[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    [v6 setSortDescriptors:v10];

    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
    [v6 setIncludedDetectionTypes:v11];

    id v12 = +[PXPeopleUISettings sharedInstance];
    LODWORD(v9) = [v12 useBootstrapMockDataSource];

    if (v9)
    {
      [v6 setFetchLimit:9];
      [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v6];
    }
    else
    {
      [MEMORY[0x1E4F391F0] fetchMergeCandidatePersonsForPerson:v4 options:v6];
    id v5 = };
    [(PXPeopleSuggestionDataSource *)self setMergeCandidateFetchResult:v5];
    id v13 = (void *)MEMORY[0x1E4F1C978];
    id v14 = [v5 fetchedObjects];
    id v15 = [v13 arrayWithArray:v14];
    [(PXPeopleSuggestionDataSource *)self setMergeCandidates:v15];
  }
  return v5;
}

- (PXPeopleSuggestionDataSource)initWithFlowType:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXPeopleSuggestionDataSource;
  id v4 = [(PXPeopleSuggestionDataSource *)&v7 init];
  id v5 = v4;
  if (v4)
  {
    v4->_initialPageLimit = 1;
    [(PXPeopleSuggestionDataSource *)v4 setFlowType:a3];
  }
  return v5;
}

+ (void)_mergeAndSaveUserFeedbackForPersons:(id)a3 personChangeRequest:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v12 fetchPropertySetsIfNeeded];
        id v13 = [v12 userFeedbackProperties];
        id v14 = [v13 userFeedback];

        if (v14) {
          uint64_t v9 = objc_msgSend(MEMORY[0x1E4F39330], "mergeFeedbackType:withOtherFeedbackType:", objc_msgSend(v14, "type"), v9);
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v15 = [v6 targetPerson];
  id v16 = [v15 userFeedbackProperties];
  uint64_t v17 = [v16 userFeedback];
  uint64_t v18 = [v17 type];

  if (v9 != v18)
  {
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F39330]) initWithType:v9 feature:0 context:0];
    [v6 setUserFeedback:v19];
  }
}

@end