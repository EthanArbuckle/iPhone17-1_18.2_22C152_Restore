@interface PPSpotlightWritebackDissector
+ (BOOL)bundleIdIsAllowed:(id)a3;
+ (id)sharedCache;
- (BOOL)consumeContentFromBundleId:(id)a3 extractions:(id)a4 spotlightIdentifier:(id)a5 fileProtectionType:(id)a6 shouldContinueBlock:(id)a7;
- (PPSpotlightWritebackDissector)init;
- (PPSpotlightWritebackDissector)initWithNamedEntityStore:(id)a3 significanceCheckEnabled:(BOOL)a4;
- (void)_getNamedEntityPortraitScores:(id)a3 priorityQueue:(id)a4;
@end

@implementation PPSpotlightWritebackDissector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_scorer, 0);
}

- (void)_getNamedEntityPortraitScores:(id)a3 priorityQueue:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = +[PPConfiguration sharedInstance];
    char v9 = [v8 storeNewExtractions];

    v10 = +[PPConfiguration sharedInstance];
    [v10 scoreThreshold];
    uint64_t v12 = v11;

    v13 = objc_opt_new();
    v14 = objc_opt_new();
    v15 = +[PPSpotlightWritebackDissector sharedCache];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __77__PPSpotlightWritebackDissector__getNamedEntityPortraitScores_priorityQueue___block_invoke_2;
    v23 = &unk_1E65D43B0;
    id v24 = v6;
    id v25 = v14;
    id v16 = v13;
    LOBYTE(v31) = v9;
    id v26 = v16;
    id v29 = &__block_literal_global_122;
    uint64_t v30 = v12;
    id v27 = v7;
    v28 = self;
    id v17 = v14;
    [v15 runWithLockAcquired:&v20];

    v18 = pp_default_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_msgSend(v16, "count", v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31);
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v19;
      _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: %lu named entities to query", buf, 0xCu);
    }
  }
}

void __77__PPSpotlightWritebackDissector__getNamedEntityPortraitScores_priorityQueue___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v36;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v35 + 1) + 8 * v7);
        char v9 = (void *)MEMORY[0x1CB79D060]();
        v10 = [v3 objectForKeyedSubscript:v8];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void **)(a1 + 40);
          v13 = [v10 cachingDate];
          [v12 timeIntervalSinceDate:v13];
          double v15 = v14;

          if (v15 > 3600.0) {
            [v3 setObject:0 forKeyedSubscript:v8];
          }
        }
        [*(id *)(a1 + 48) addObject:v8];
        if (*(unsigned char *)(a1 + 88))
        {
          id v16 = pp_default_log_handle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: Storing uncached extraction with score of 0", buf, 2u);
          }

          id v17 = (*(void (**)(double))(*(void *)(a1 + 72) + 16))(0.0);
          [*(id *)(a1 + 56) addObject:v17];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v5);
  }

  v18 = pp_default_log_handle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [*(id *)(a1 + 48) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = v19;
    _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: Querying Portrait for %lu extracted named entities", buf, 0xCu);
  }

  if ([*(id *)(a1 + 48) count])
  {
    uint64_t v20 = objc_opt_new();
    [v20 setMatchingNames:*(void *)(a1 + 48)];
    uint64_t v21 = [*(id *)(a1 + 56) getMinItemWithoutPopping];
    [v21 score];
    uint64_t v23 = v22;

    id v24 = *(void **)(*(void *)(a1 + 64) + 16);
    id v34 = 0;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __77__PPSpotlightWritebackDissector__getNamedEntityPortraitScores_priorityQueue___block_invoke_130;
    v28[3] = &unk_1E65D4388;
    id v29 = v3;
    id v30 = *(id *)(a1 + 40);
    uint64_t v32 = *(void *)(a1 + 80);
    id v31 = *(id *)(a1 + 56);
    uint64_t v33 = v23;
    LOBYTE(v24) = [v24 iterRankedNamedEntitiesWithQuery:v20 error:&v34 block:v28];
    id v25 = v34;
    if ((v24 & 1) == 0)
    {
      id v26 = pp_default_log_handle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = (uint64_t)v25;
        _os_log_error_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_ERROR, "PPSpotlightWritebackDissector: Error querying portrait for NEs: %@", buf, 0xCu);
      }
    }
  }
}

void __77__PPSpotlightWritebackDissector__getNamedEntityPortraitScores_priorityQueue___block_invoke_130(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 0x200) {
    [*(id *)(a1 + 32) removeAllObjects];
  }
  uint64_t v6 = [PPSpotlightWritebackDissectorCacheEntry alloc];
  uint64_t v7 = *(void *)(a1 + 40);
  [v5 score];
  uint64_t v8 = -[PPSpotlightWritebackDissectorCacheEntry initWithCachingDate:score:](v6, "initWithCachingDate:score:", v7);
  char v9 = *(void **)(a1 + 32);
  v10 = [v5 item];
  uint64_t v11 = [v10 name];
  [v9 setObject:v8 forKeyedSubscript:v11];

  [v5 score];
  if (v12 >= *(double *)(a1 + 56))
  {
    [*(id *)(a1 + 48) addObject:v5];
    [*(id *)(a1 + 48) count];
    if (v13 >= (double)(unint64_t)[*(id *)(a1 + 48) capacity])
    {
      [v5 score];
      if (v14 < *(double *)(a1 + 64))
      {
        double v15 = pp_default_log_handle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = *(void *)(a1 + 64);
          int v17 = 134217984;
          uint64_t v18 = v16;
          _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: Terminating processing of scored portrait NEs scoring lower than %f", (uint8_t *)&v17, 0xCu);
        }

        *a3 = 1;
      }
    }
  }
}

id __77__PPSpotlightWritebackDissector__getNamedEntityPortraitScores_priorityQueue___block_invoke(double a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F89E90];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithName:v5 category:0 language:@"unknown"];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v6 score:a1];
  return v7;
}

- (BOOL)consumeContentFromBundleId:(id)a3 extractions:(id)a4 spotlightIdentifier:(id)a5 fileProtectionType:(id)a6 shouldContinueBlock:(id)a7
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v86 = (uint64_t (**)(void))a7;
  if (!+[PPSpotlightWritebackDissector bundleIdIsAllowed:](PPSpotlightWritebackDissector, "bundleIdIsAllowed:", v13)|| [v13 isEqualToString:*MEMORY[0x1E4F8A098]]&& objc_msgSend(MEMORY[0x1E4F93B10], "lockState") == 1)
  {
    BOOL v17 = 1;
    goto LABEL_55;
  }
  SEL v74 = a2;
  v75 = self;
  id v76 = v16;
  id v79 = v15;
  id v80 = v13;
  uint64_t v18 = +[PPConfiguration sharedInstance];
  int v84 = [v18 useRawNEExtractionScores];

  uint64_t v19 = +[PPConfiguration sharedInstance];
  unsigned int v20 = [v19 maxNEExtractions];

  v78 = objc_opt_new();
  uint64_t v21 = objc_opt_new();
  v81 = objc_opt_new();
  uint64_t v22 = [[PPEvictingMinPriorityQueue alloc] initWithCapacity:v20];
  uint64_t v23 = objc_opt_new();
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v77 = v14;
  id obj = v14;
  uint64_t v85 = [obj countByEnumeratingWithState:&v104 objects:v114 count:16];
  if (!v85) {
    goto LABEL_37;
  }
  uint64_t v83 = *(void *)v105;
  while (2)
  {
    uint64_t v24 = 0;
    do
    {
      if (*(void *)v105 != v83) {
        objc_enumerationMutation(obj);
      }
      id v25 = *(void **)(*((void *)&v104 + 1) + 8 * v24);
      id v26 = (void *)MEMORY[0x1CB79D060]();
      if ((v86[2]() & 1) == 0)
      {
        v70 = pp_default_log_handle();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v70, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: deferring while processing Portrait containers.", buf, 2u);
        }

        id v16 = v76;
        goto LABEL_52;
      }
      uint64_t v87 = v24;
      v88 = v26;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      id v27 = [v25 topics];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v100 objects:v113 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v101;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v101 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = [*(id *)(*((void *)&v100 + 1) + 8 * i) item];
            uint64_t v33 = [v32 topicIdentifier];
            [v21 addQidString:v33];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v100 objects:v113 count:16];
        }
        while (v29);
      }

      if (!v84)
      {
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v34 = [v25 entities];
        uint64_t v42 = [v34 countByEnumeratingWithState:&v92 objects:v111 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v93;
          do
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v93 != v44) {
                objc_enumerationMutation(v34);
              }
              v46 = *(void **)(*((void *)&v92 + 1) + 8 * j);
              v47 = (void *)MEMORY[0x1CB79D060]();
              v48 = [v46 item];
              v49 = [v48 name];
              [v23 addObject:v49];
            }
            uint64_t v43 = [v34 countByEnumeratingWithState:&v92 objects:v111 count:16];
          }
          while (v43);
        }
LABEL_34:
        long long v38 = v88;
        goto LABEL_35;
      }
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v34 = [v25 entities];
      uint64_t v35 = [v34 countByEnumeratingWithState:&v96 objects:v112 count:16];
      if (!v35) {
        goto LABEL_34;
      }
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v97;
      long long v38 = v88;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v97 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v40 = *(void *)(*((void *)&v96 + 1) + 8 * k);
          v41 = (void *)MEMORY[0x1CB79D060]();
          [(PPEvictingMinPriorityQueue *)v22 addObject:v40];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v96 objects:v112 count:16];
      }
      while (v36);
LABEL_35:

      uint64_t v24 = v87 + 1;
    }
    while (v87 + 1 != v85);
    uint64_t v85 = [obj countByEnumeratingWithState:&v104 objects:v114 count:16];
    if (v85) {
      continue;
    }
    break;
  }
LABEL_37:

  if ((v84 & 1) == 0) {
    [(PPSpotlightWritebackDissector *)v75 _getNamedEntityPortraitScores:v23 priorityQueue:v22];
  }
  char v50 = v86[2]();
  v51 = pp_default_log_handle();
  if (v50)
  {
    v52 = v51;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      [(PPEvictingMinPriorityQueue *)v22 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v73;
      _os_log_debug_impl(&dword_1CA9A8000, v52, OS_LOG_TYPE_DEBUG, "PPSpotlightWritebackDissector: namedEntityPriorityQueue contains %f items", buf, 0xCu);
    }

    v53 = [(PPEvictingMinPriorityQueue *)v22 extractSortedMutableArray];
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __131__PPSpotlightWritebackDissector_consumeContentFromBundleId_extractions_spotlightIdentifier_fileProtectionType_shouldContinueBlock___block_invoke;
    v90[3] = &unk_1E65DB2C8;
    id v54 = v81;
    id v91 = v54;
    [v53 enumerateObjectsUsingBlock:v90];

    v55 = pp_default_log_handle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v56 = [v54 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v56;
      _os_log_impl(&dword_1CA9A8000, v55, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: namedEntityScores contains %tu items", buf, 0xCu);
    }

    if (_os_feature_enabled_impl())
    {
      if (v86[2]())
      {
        [(PPUniversalSearchSpotlightIndexScorer *)v75->_scorer computeSpotlightIndexScoreFromPortraitExtractions:v78];
        double v58 = v57;
        v59 = pp_default_log_handle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          *(double *)&uint8_t buf[4] = v58;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v79;
          *(_WORD *)&buf[22] = 2112;
          id v110 = v80;
          _os_log_debug_impl(&dword_1CA9A8000, v59, OS_LOG_TYPE_DEBUG, "PPSpotlightWritebackDissector: spotlightIndexScore of %g for CSSI item %@ from %@", buf, 0x20u);
        }

        uint64_t v23 = objc_opt_new();
        v60 = [NSNumber numberWithDouble:v58];
        [v23 setPortraitStaticScore:v60];

        v61 = [v21 encodeAsData];
        [v23 setPortraitFeatureVector:v61];

        v62 = [MEMORY[0x1E4F89F50] featureVectorVersion];
        [v23 setPortraitFeatureVectorVersion:v62];

        [v23 setPortraitNamedEntities:v54];
        v63 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v79 domainIdentifier:0 attributeSet:v23];
        BOOL v17 = 1;
        [v63 setIsUpdate:1];
        id v64 = objc_alloc(MEMORY[0x1E4F23838]);
        v65 = (void *)[[NSString alloc] initWithFormat:@"PersonalizationPortrait-harvestQueueWriteback-%@", v80];
        id v16 = v76;
        v66 = (void *)[v64 initWithName:v65 protectionClass:v76 bundleIdentifier:v80];

        v108 = v63;
        v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LODWORD(v110) = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __131__PPSpotlightWritebackDissector_consumeContentFromBundleId_extractions_spotlightIdentifier_fileProtectionType_shouldContinueBlock___block_invoke_111;
        aBlock[3] = &unk_1E65D4340;
        aBlock[5] = buf;
        aBlock[6] = v74;
        aBlock[4] = v75;
        v68 = _Block_copy(aBlock);
        v69 = _Block_copy(v68);

        _Block_object_dispose(buf, 8);
        [v66 indexSearchableItems:v67 completionHandler:v69];
      }
      else
      {
        uint64_t v23 = pp_default_log_handle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: deferring before writing back.", buf, 2u);
        }
        BOOL v17 = 0;
        id v16 = v76;
      }
      goto LABEL_53;
    }
    BOOL v17 = 1;
    id v15 = v79;
    id v13 = v80;
    id v16 = v76;
    id v14 = v77;
  }
  else
  {
    v72 = v51;
    id v16 = v76;
    id obj = v51;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v72, OS_LOG_TYPE_DEFAULT, "PPSpotlightWritebackDissector: deferring after fetching scores.", buf, 2u);
    }
LABEL_52:

    BOOL v17 = 0;
LABEL_53:

    id v15 = v79;
    id v13 = v80;
    id v14 = v77;
  }

LABEL_55:
  return v17;
}

void __131__PPSpotlightWritebackDissector_consumeContentFromBundleId_extractions_spotlightIdentifier_fileProtectionType_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v13 = v3;
  id v5 = [v3 item];
  uint64_t v6 = [v5 name];
  uint64_t v7 = [v4 objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v8 = NSNumber;
    [v13 score];
    char v9 = objc_msgSend(v8, "numberWithDouble:");
    v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v13 item];
    double v12 = [v11 name];
    [v10 setObject:v9 forKeyedSubscript:v12];
  }
}

void __131__PPSpotlightWritebackDissector_consumeContentFromBundleId_extractions_spotlightIdentifier_fileProtectionType_shouldContinueBlock___block_invoke_111(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1[5] + 8) + 24), 1u))
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a1[6] object:a1[4] file:@"PPSpotlightWritebackDissector.m" lineNumber:190 description:@"This block should not be run more than once"];

    if (!v4) {
      goto LABEL_6;
    }
  }
  else if (!v3)
  {
    goto LABEL_6;
  }
  id v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_error_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_ERROR, "PPSpotlightWritebackDissector: Error indexing updated CSSI: %@", (uint8_t *)&v7, 0xCu);
  }

LABEL_6:
}

- (PPSpotlightWritebackDissector)initWithNamedEntityStore:(id)a3 significanceCheckEnabled:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSpotlightWritebackDissector;
  uint64_t v8 = [(PPSpotlightWritebackDissector *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    scorer = v8->_scorer;
    v8->_scorer = (PPUniversalSearchSpotlightIndexScorer *)v9;

    objc_storeStrong((id *)&v8->_namedEntityStore, a3);
    v8->_significanceCheckEnabled = a4;
  }

  return v8;
}

- (PPSpotlightWritebackDissector)init
{
  id v3 = +[PPLocalNamedEntityStore defaultStore];
  uint64_t v4 = [(PPSpotlightWritebackDissector *)self initWithNamedEntityStore:v3 significanceCheckEnabled:1];

  return v4;
}

+ (BOOL)bundleIdIsAllowed:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:*MEMORY[0x1E4F8A0A8]]) {
      char v5 = 1;
    }
    else {
      char v5 = [v4 isEqualToString:*MEMORY[0x1E4F8A098]];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)sharedCache
{
  if (sharedCache__pasOnceToken4 != -1) {
    dispatch_once(&sharedCache__pasOnceToken4, &__block_literal_global_450);
  }
  v2 = (void *)sharedCache__pasExprOnceResult;
  return (id)[v2 result];
}

void __44__PPSpotlightWritebackDissector_sharedCache__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_89 idleTimeout:10.0];
  v2 = (void *)sharedCache__pasExprOnceResult;
  sharedCache__pasExprOnceResult = v1;
}

id __44__PPSpotlightWritebackDissector_sharedCache__block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x1E4F93B70]);
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:512];
  v2 = (void *)[v0 initWithGuardedData:v1];

  return v2;
}

@end