@interface PGSharingSuggestionSourceMergeCandidates
- (BOOL)canRunWithOptions:(id)a3;
- (PGSharingSuggestionSourceMergeCandidates)initWithServiceManager:(id)a3;
- (double)weight;
- (id)details;
- (id)filterMeNodePredicateForInput:(id)a3 photoLibrary:(id)a4;
- (id)name;
- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4;
@end

@implementation PGSharingSuggestionSourceMergeCandidates

- (void).cxx_destruct
{
}

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v83 = a4;
  v6 = [v5 momentNodes];
  v69 = v5;
  v76 = [v5 graph];
  v7 = objc_opt_new();
  v82 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v105 objects:v116 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v106 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        v13 = objc_opt_new();
        v103[0] = MEMORY[0x1E4F143A8];
        v103[1] = 3221225472;
        v103[2] = __81__PGSharingSuggestionSourceMergeCandidates_suggestedResultsForInput_withOptions___block_invoke;
        v103[3] = &unk_1E68EF528;
        id v14 = v13;
        id v104 = v14;
        [v12 enumeratePersonNodesUsingBlock:v103];
        v15 = [v12 localIdentifier];
        if ([v15 length]) {
          [v82 setObject:v14 forKeyedSubscript:v15];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v105 objects:v116 count:16];
    }
    while (v9);
  }

  v16 = [v69 moments];
  v17 = [v16 photoLibrary];
  uint64_t v18 = [(PGSharingSuggestionSourceMergeCandidates *)self filterMeNodePredicateForInput:v69 photoLibrary:v17];
  v19 = [v17 librarySpecificFetchOptions];
  [v19 setIncludeGuestAssets:1];
  v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kindSubtype != %d && kindSubtype != %d", 10, 103);
  v74 = v19;
  [v19 setInternalPredicate:v20];

  v21 = [v17 librarySpecificFetchOptions];
  [v21 setPersonContext:3];
  if (v18) {
    [v21 setPredicate:v18];
  }
  v68 = v17;
  v22 = [v17 librarySpecificFetchOptions];
  uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(verifiedType == %d || verifiedType == %d) && type != %d", 2, 1, -1);
  v66 = (void *)v23;
  v67 = (void *)v18;
  if (v18)
  {
    v24 = (void *)MEMORY[0x1E4F28BA0];
    v115[0] = v23;
    v115[1] = v18;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:2];
    v26 = [v24 andPredicateWithSubpredicates:v25];
    [v22 setPredicate:v26];
  }
  else
  {
    [v22 setPredicate:v23];
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v70 = v16;
  uint64_t v77 = [v70 countByEnumeratingWithState:&v99 objects:v114 count:16];
  if (v77)
  {
    v72 = v21;
    uint64_t v73 = *(void *)v100;
    do
    {
      for (uint64_t j = 0; j != v77; ++j)
      {
        if (*(void *)v100 != v73) {
          objc_enumerationMutation(v70);
        }
        v28 = *(void **)(*((void *)&v99 + 1) + 8 * j);
        v29 = (void *)MEMORY[0x1D25FED50]();
        v30 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v28 options:v74];
        if ([v30 count])
        {
          v80 = v29;
          uint64_t v81 = j;
          id v31 = v28;
          uint64_t v32 = [v30 count];
          uint64_t v33 = (uint64_t)v31;
          if (v32 != [v31 estimatedAssetCount])
          {
            uint64_t v33 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v30 title:0];
          }
          v78 = (void *)v33;
          v79 = v30;
          v34 = [MEMORY[0x1E4F391F0] fetchPersonsForAssetCollection:v33 options:v21];
          v35 = [v31 localIdentifier];
          v36 = [v82 objectForKeyedSubscript:v35];

          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id v37 = v34;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v95 objects:v113 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            v85 = v36;
            uint64_t v86 = *(void *)v96;
            id v84 = v37;
            do
            {
              for (uint64_t k = 0; k != v39; ++k)
              {
                if (*(void *)v96 != v86) {
                  objc_enumerationMutation(v37);
                }
                v41 = *(void **)(*((void *)&v95 + 1) + 8 * k);
                v42 = (void *)MEMORY[0x1D25FED50]();
                if ([v41 verifiedType])
                {
                  v43 = [v41 localIdentifier];
                  char v44 = [v36 containsObject:v43];

                  if ((v44 & 1) == 0) {
                    [v7 addObject:v41];
                  }
                }
                else
                {
                  v45 = [MEMORY[0x1E4F391F0] fetchMergeCandidatePersonsForPerson:v41 options:v22];
                  if ([v45 count])
                  {
                    v46 = v22;
                    long long v93 = 0u;
                    long long v94 = 0u;
                    long long v91 = 0u;
                    long long v92 = 0u;
                    id v47 = v45;
                    uint64_t v48 = [v47 countByEnumeratingWithState:&v91 objects:v112 count:16];
                    if (v48)
                    {
                      uint64_t v49 = v48;
                      uint64_t v50 = *(void *)v92;
                      do
                      {
                        for (uint64_t m = 0; m != v49; ++m)
                        {
                          if (*(void *)v92 != v50) {
                            objc_enumerationMutation(v47);
                          }
                          [v7 addObject:*(void *)(*((void *)&v91 + 1) + 8 * m)];
                        }
                        uint64_t v49 = [v47 countByEnumeratingWithState:&v91 objects:v112 count:16];
                      }
                      while (v49);
                    }

                    v22 = v46;
                    id v37 = v84;
                    v36 = v85;
                  }
                  else if ([v83 includeUnverified] && objc_msgSend(v41, "faceCount") >= 8)
                  {
                    [v7 addObject:v41];
                  }
                }
              }
              uint64_t v39 = [v37 countByEnumeratingWithState:&v95 objects:v113 count:16];
            }
            while (v39);
          }

          v21 = v72;
          v29 = v80;
          uint64_t j = v81;
          v30 = v79;
        }
      }
      uint64_t v77 = [v70 countByEnumeratingWithState:&v99 objects:v114 count:16];
    }
    while (v77);
  }

  if (![v70 count])
  {
    v52 = +[PGLogging sharedLogging];
    v53 = [v52 loggingConnection];

    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v111 = obj;
      _os_log_error_impl(&dword_1D1805000, v53, OS_LOG_TYPE_ERROR, "No asset collections fetched for %@", buf, 0xCu);
    }
  }
  v54 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v55 = v7;
  uint64_t v56 = [v55 countByEnumeratingWithState:&v87 objects:v109 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v88;
    do
    {
      for (uint64_t n = 0; n != v57; ++n)
      {
        if (*(void *)v88 != v58) {
          objc_enumerationMutation(v55);
        }
        v60 = *(void **)(*((void *)&v87 + 1) + 8 * n);
        v61 = [v60 localIdentifier];
        v62 = [v76 personNodeForPersonLocalIdentifier:v61];

        if (v62) {
          v63 = v62;
        }
        else {
          v63 = v60;
        }
        v64 = [(PGSharingSuggestionSource *)self suggestionResultWithPerson:v63];
        [v54 addObject:v64];
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v87 objects:v109 count:16];
    }
    while (v57);
  }

  return v54;
}

void __81__PGSharingSuggestionSourceMergeCandidates_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 localIdentifier];
  if ([v3 length]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)filterMeNodePredicateForInput:(id)a3 photoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 graph];
  uint64_t v9 = [v8 meNode];

  uint64_t v10 = [v9 localIdentifier];
  v11 = [v9 contactIdentifier];
  if (v9
    || ([v6 momentNodes],
        v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 count],
        v12,
        v13))
  {
    id v14 = v11;
  }
  else
  {
    v21 = [(CLSServiceManager *)self->_serviceManager mePerson];
    id v14 = [v21 CNIdentifier];

    if (v21)
    {
      v22 = [v7 librarySpecificFetchOptions];
      uint64_t v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personUri == %@", v14];
      [v22 setPredicate:v23];

      [v22 setFetchLimit:1];
      v24 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v22];
      v25 = [v24 firstObject];
      uint64_t v26 = [v25 localIdentifier];

      uint64_t v10 = (void *)v26;
    }
  }
  v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  if (v10)
  {
    v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier != %@", v10];
    [v15 addObject:v16];
  }
  if (v14)
  {
    v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personUri != %@", v14];
    [v15 addObject:v17];
  }
  if ([v15 count] == 1)
  {
    uint64_t v18 = [v15 firstObject];
LABEL_12:
    v19 = (void *)v18;
    goto LABEL_14;
  }
  if ((unint64_t)[v15 count] >= 2)
  {
    uint64_t v18 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v15];
    goto LABEL_12;
  }
  v19 = 0;
LABEL_14:

  return v19;
}

- (BOOL)canRunWithOptions:(id)a3
{
  return [a3 replaceMergeCandidates];
}

- (double)weight
{
  return 0.6;
}

- (id)details
{
  return @"Return suggestions by replacing unverified person by their verified merge candidates";
}

- (id)name
{
  return @"Merge Candidates";
}

- (PGSharingSuggestionSourceMergeCandidates)initWithServiceManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGSharingSuggestionSourceMergeCandidates;
  id v6 = [(PGSharingSuggestionSourceMergeCandidates *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serviceManager, a3);
  }

  return v7;
}

@end