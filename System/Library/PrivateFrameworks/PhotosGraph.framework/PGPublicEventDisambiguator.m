@interface PGPublicEventDisambiguator
- (PGPublicEventDisambiguator)initWithSceneTaxonomy:(id)a3;
- (id)_frequentLocationNodesForMomentNode:(id)a3 largeFrequentLocationNodes:(id)a4;
- (id)disambiguateEvents:(id)a3 forTimeLocationTuple:(id)a4 momentNode:(id)a5 graph:(id)a6 meaningfulEventProcessorCache:(id)a7 serviceManager:(id)a8;
- (id)publicEventCriteriaByCategoryInGraph:(id)a3;
- (void)collectConsolidatedAddressesForMomentNodes:(id)a3 largeFrequentLocationNodes:(id)a4 consolidatedAddresses:(id *)a5 consolidatedAddressesByMomentIdentifier:(id *)a6 momentNodesForConsolidatedAddresses:(id *)a7 progressBlock:(id)a8;
@end

@implementation PGPublicEventDisambiguator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_publicEventCriteriaByCategory, 0);
}

- (id)publicEventCriteriaByCategoryInGraph:(id)a3
{
  publicEventCriteriaByCategory = self->_publicEventCriteriaByCategory;
  if (!publicEventCriteriaByCategory)
  {
    v5 = +[PGPublicEventCriteriaFactory publicEventCriteriaByCategoryForGraph:a3 sceneTaxonomy:self->_sceneTaxonomy];
    v6 = self->_publicEventCriteriaByCategory;
    self->_publicEventCriteriaByCategory = v5;

    publicEventCriteriaByCategory = self->_publicEventCriteriaByCategory;
  }
  return publicEventCriteriaByCategory;
}

- (id)_frequentLocationNodesForMomentNode:(id)a3 largeFrequentLocationNodes:(id)a4
{
  id v5 = a4;
  v6 = [a3 frequentLocationNodes];
  if ([v6 count] && objc_msgSend(v6, "intersectsSet:", v5)) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)collectConsolidatedAddressesForMomentNodes:(id)a3 largeFrequentLocationNodes:(id)a4 consolidatedAddresses:(id *)a5 consolidatedAddressesByMomentIdentifier:(id *)a6 momentNodesForConsolidatedAddresses:(id *)a7 progressBlock:(id)a8
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v32 = a4;
  id v15 = a8;
  v16 = _Block_copy(v15);
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v43 = 0;
  v44 = (double *)&v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  v31 = v15;
  if (!v16
    || (double v17 = CFAbsoluteTimeGetCurrent(), v17 - v44[3] < 0.01)
    || (v44[3] = v17,
        char v42 = 0,
        (*((void (**)(void *, char *, double))v16 + 2))(v16, &v42, 0.0),
        char v18 = *((unsigned char *)v48 + 24) | v42,
        (*((unsigned char *)v48 + 24) = v18) == 0))
  {
    v19 = a7;
    v20 = a5;
    v21 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v31);
    v22 = [MEMORY[0x1E4F1CA80] set];
    v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __212__PGPublicEventDisambiguator_collectConsolidatedAddressesForMomentNodes_largeFrequentLocationNodes_consolidatedAddresses_consolidatedAddressesByMomentIdentifier_momentNodesForConsolidatedAddresses_progressBlock___block_invoke;
    v33[3] = &unk_1E68ED3B8;
    id v24 = v16;
    uint64_t v41 = 0x3F847AE147AE147BLL;
    v39 = &v43;
    v40 = &v47;
    id v38 = v24;
    v33[4] = self;
    id v34 = v32;
    id v25 = v21;
    id v35 = v25;
    id v26 = v23;
    id v36 = v26;
    id v27 = v22;
    id v37 = v27;
    [v14 enumerateNodesUsingBlock:v33];
    if (*((unsigned char *)v48 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_15:

        goto LABEL_16;
      }
      *(_DWORD *)buf = 67109378;
      int v52 = 248;
      __int16 v53 = 2080;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGPublicEventDisambiguator.m";
      v28 = MEMORY[0x1E4F14500];
    }
    else
    {
      id *v19 = v25;
      id *v20 = v27;
      *a6 = v26;
      if (!v16) {
        goto LABEL_15;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v44[3] < 0.01) {
        goto LABEL_15;
      }
      v44[3] = Current;
      char v42 = 0;
      (*((void (**)(id, char *, double))v24 + 2))(v24, &v42, 1.0);
      char v30 = *((unsigned char *)v48 + 24) | v42;
      *((unsigned char *)v48 + 24) = v30;
      if (!v30 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 67109378;
      int v52 = 254;
      __int16 v53 = 2080;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGPublicEventDisambiguator.m";
      v28 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v52 = 194;
    __int16 v53 = 2080;
    v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Ingest"
          "/Ingest Processing/PGPublicEventDisambiguator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_16:
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
}

void __212__PGPublicEventDisambiguator_collectConsolidatedAddressesForMomentNodes_largeFrequentLocationNodes_consolidatedAddresses_consolidatedAddressesByMomentIdentifier_momentNodesForConsolidatedAddresses_progressBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  v6 = (void *)MEMORY[0x1D25FED50]();
  if (*(void *)(a1 + 72)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8),
        Current - *(double *)(v8 + 24) >= *(double *)(a1 + 96))
    && (*(double *)(v8 + 24) = Current,
        char v25 = 0,
        (*(void (**)(double))(*(void *)(a1 + 72) + 16))(0.5),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    v9 = [MEMORY[0x1E4F1CA80] set];
    v10 = [*(id *)(a1 + 32) _frequentLocationNodesForMomentNode:v5 largeFrequentLocationNodes:*(void *)(a1 + 40)];
    BOOL v11 = [v10 count] != 0;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __212__PGPublicEventDisambiguator_collectConsolidatedAddressesForMomentNodes_largeFrequentLocationNodes_consolidatedAddresses_consolidatedAddressesByMomentIdentifier_momentNodesForConsolidatedAddresses_progressBlock___block_invoke_2;
    v20 = &unk_1E68ED390;
    id v12 = v5;
    id v21 = v12;
    BOOL v24 = v11;
    id v13 = v10;
    id v22 = v13;
    id v14 = v9;
    id v23 = v14;
    [v12 enumerateConsolidatedAddressesUsingBlock:&v17];
    if (objc_msgSend(v14, "count", v17, v18, v19, v20))
    {
      [*(id *)(a1 + 48) addObject:v12];
      id v15 = *(void **)(a1 + 56);
      v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier"));
      [v15 setObject:v14 forKeyedSubscript:v16];

      [*(id *)(a1 + 64) unionSet:v14];
    }
  }
}

void __212__PGPublicEventDisambiguator_collectConsolidatedAddressesForMomentNodes_largeFrequentLocationNodes_consolidatedAddresses_consolidatedAddressesByMomentIdentifier_momentNodesForConsolidatedAddresses_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 addressNode];
  if ([v4 isPersonHomeOrWorkAddress])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      [v4 coordinate];
      id v7 = [NSString stringWithFormat:@"{%.8f, %.8f}", v5, v6];
      uint64_t v8 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138478083;
      id v31 = v7;
      __int16 v32 = 2113;
      v33 = v8;
      _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[PublicEvents] Not considering address %{private}@ at home/work for Moment %{private}@", buf, 0x16u);

LABEL_17:
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 56))
    {
      [v3 coordinates];
      uint64_t v27 = v9;
      uint64_t v28 = v10;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v7 = *(id *)(a1 + 40);
      uint64_t v11 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v7);
            }
            id v15 = [*(id *)(*((void *)&v23 + 1) + 8 * i) addressNode];
            [v15 coordinate];
            uint64_t v21 = v16;
            uint64_t v22 = v17;

            CLLocationCoordinate2DGetDistanceFrom();
            if (v18 <= 200.0)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
              {
                v19 = [NSString stringWithFormat:@"{%.8f, %.8f}", v27, v28, v21, v22, (void)v23];
                v20 = [*(id *)(a1 + 32) name];
                *(_DWORD *)buf = 138412547;
                id v31 = v19;
                __int16 v32 = 2113;
                v33 = v20;
                _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[PublicEvents] Not considering address (%@) close to frequent location for Moment %{private}@", buf, 0x16u);
              }
              goto LABEL_17;
            }
          }
          uint64_t v12 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
    }
    [*(id *)(a1 + 48) addObject:v3];
  }
}

- (id)disambiguateEvents:(id)a3 forTimeLocationTuple:(id)a4 momentNode:(id)a5 graph:(id)a6 meaningfulEventProcessorCache:(id)a7 serviceManager:(id)a8
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v99 = [MEMORY[0x1E4F1CA80] set];
  v100 = [MEMORY[0x1E4F1CA60] dictionary];
  v91 = v17;
  v20 = [(PGPublicEventDisambiguator *)self publicEventCriteriaByCategoryInGraph:v17];
  id v92 = v16;
  id v93 = v15;
  v89 = v19;
  v90 = v18;
  uint64_t v21 = [[PGPublicEventMatchingOptions alloc] initWithTimeLocationTuple:v15 momentNode:v16 meaningfulEventProcessorCache:v18 serviceManager:v19];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  obuint64_t j = v14;
  v101 = v20;
  uint64_t v96 = [obj countByEnumeratingWithState:&v121 objects:v134 count:16];
  if (v96)
  {
    uint64_t v95 = *(void *)v122;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v122 != v95) {
          objc_enumerationMutation(obj);
        }
        long long v23 = *(void **)(*((void *)&v121 + 1) + 8 * v22);
        v98 = [v23 name];
        long long v24 = [v23 categories];
        long long v117 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        id v104 = v24;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v117 objects:v133 count:16];
        if (!v25)
        {
LABEL_35:
          if (PGIsAppleInternal_onceToken != -1) {
            dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8452);
          }
          if (PGIsAppleInternal_isAppleInternal)
          {
            uint64_t v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v104, "count"));
            long long v109 = 0u;
            long long v110 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            id v50 = v104;
            uint64_t v51 = [v50 countByEnumeratingWithState:&v109 objects:v131 count:16];
            if (v51)
            {
              uint64_t v52 = v51;
              uint64_t v53 = *(void *)v110;
              do
              {
                for (uint64_t i = 0; i != v52; ++i)
                {
                  if (*(void *)v110 != v53) {
                    objc_enumerationMutation(v50);
                  }
                  uint64_t v55 = [*(id *)(*((void *)&v109 + 1) + 8 * i) category];
                  [v49 addObject:v55];
                }
                uint64_t v52 = [v50 countByEnumeratingWithState:&v109 objects:v131 count:16];
              }
              while (v52);
            }

            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138478083;
              *(void *)&uint8_t buf[4] = v98;
              __int16 v142 = 2113;
              v143 = v49;
              _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event %{private}@: not matching allowed categories. event categories: %{private}@", buf, 0x16u);
            }
          }
          goto LABEL_48;
        }
        uint64_t v26 = v25;
        uint64_t v97 = v22;
        char v27 = 0;
        uint64_t v28 = *(void *)v118;
        uint64_t v102 = *(void *)v118;
        do
        {
          uint64_t v29 = 0;
          uint64_t v103 = v26;
          do
          {
            if (*(void *)v118 != v28) {
              objc_enumerationMutation(v104);
            }
            char v30 = [*(id *)(*((void *)&v117 + 1) + 8 * v29) category];
            id v31 = [v20 objectForKeyedSubscript:v30];
            uint64_t v32 = [v31 count];
            BOOL v33 = v32 != 0;
            if (!v32) {
              goto LABEL_32;
            }
            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            v107 = v31;
            id v34 = v31;
            uint64_t v35 = [v34 countByEnumeratingWithState:&v113 objects:v132 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              v105 = v30;
              BOOL v37 = 0;
              char v38 = 0;
              uint64_t v39 = *(void *)v114;
              double v40 = 1.79769313e308;
              while (1)
              {
                for (uint64_t j = 0; j != v36; ++j)
                {
                  if (*(void *)v114 != v39) {
                    objc_enumerationMutation(v34);
                  }
                  char v42 = *(void **)(*((void *)&v113 + 1) + 8 * j);
                  *(void *)buf = 0;
                  LOBYTE(v125) = 0;
                  if ([v42 isMatchingEvent:v23 matchingOptions:v21 withHighConfidence:&v125 matchingDistance:buf])
                  {
                    if ((v38 & 1) == 0)
                    {
                      double v43 = *(double *)buf;
LABEL_24:
                      BOOL v37 = v125 != 0;
                      char v38 = 1;
                      double v40 = v43;
                      continue;
                    }
                    double v43 = *(double *)buf;
                    if (!v37 && v125 != 0) {
                      goto LABEL_24;
                    }
                    char v38 = 1;
                    if ((_BYTE)v125)
                    {
                      if (*(double *)buf < v40) {
                        goto LABEL_24;
                      }
                    }
                  }
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v113 objects:v132 count:16];
                if (!v36)
                {

                  char v44 = v38 & v37;
                  v20 = v101;
                  uint64_t v28 = v102;
                  uint64_t v26 = v103;
                  char v30 = v105;
                  id v31 = v107;
                  BOOL v33 = 1;
                  if (v44)
                  {
                    uint64_t v45 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v23, "muid"));
                    uint64_t v46 = [v100 objectForKeyedSubscript:v45];

                    BOOL v33 = 1;
                    id v31 = v107;
                    if (!v46)
                    {
                      uint64_t v47 = [NSNumber numberWithDouble:v40];
                      char v30 = v105;
                      v48 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v23, "muid"));
                      [v100 setObject:v47 forKeyedSubscript:v48];

                      id v31 = v107;
                      [v99 addObject:v23];
                      goto LABEL_31;
                    }
                  }
                  goto LABEL_32;
                }
              }
            }

            id v31 = v107;
LABEL_31:
            BOOL v33 = 1;
LABEL_32:
            v27 |= v33;

            ++v29;
          }
          while (v29 != v26);
          uint64_t v26 = [v104 countByEnumeratingWithState:&v117 objects:v133 count:16];
        }
        while (v26);
        uint64_t v22 = v97;
        if ((v27 & 1) == 0) {
          goto LABEL_35;
        }
LABEL_48:

        ++v22;
      }
      while (v22 != v96);
      uint64_t v96 = [obj countByEnumeratingWithState:&v121 objects:v134 count:16];
    }
    while (v96);
  }

  id v56 = v99;
  id v57 = v100;
  uint64_t v58 = [v56 count];
  if (v58 == 1)
  {
    v61 = v92;
    v60 = v93;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      v87 = [v56 anyObject];
      v88 = [v87 name];
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = v88;
      _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event: electing single matched event %{private}@", buf, 0xCu);
    }
    id v59 = v56;
  }
  else if (v58)
  {
    id v59 = [MEMORY[0x1E4F1CA80] set];
    id v108 = v56;
    v62 = [v56 allObjects];
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = ___PGFilterMatchingPublicEvents_block_invoke;
    v129[3] = &unk_1E68ED3E0;
    id v106 = v57;
    id v63 = v57;
    id v130 = v63;
    v64 = [v62 sortedArrayUsingComparator:v129];

    v65 = [v64 objectAtIndexedSubscript:0];
    v66 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v65, "muid"));
    v67 = [v63 objectForKeyedSubscript:v66];
    [v67 floatValue];
    float v69 = v68;

    [v59 addObject:v65];
    if ((unint64_t)[v64 count] >= 2)
    {
      uint64_t v70 = 1;
      while (1)
      {
        v71 = [v64 objectAtIndexedSubscript:v70];
        v72 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v71, "muid"));
        v73 = [v63 objectForKeyedSubscript:v72];
        [v73 doubleValue];
        double v75 = v74;

        BOOL v76 = v75 - v69 <= 35.0;
        if (v69 > 100.0) {
          BOOL v76 = v75 <= v69 * 1.35;
        }
        if (!v76) {
          break;
        }
        [v59 addObject:v71];

        if (++v70 >= (unint64_t)[v64 count]) {
          goto LABEL_64;
        }
      }
    }
LABEL_64:

    v61 = v92;
    v60 = v93;
    v20 = v101;
    id v57 = v106;
    id v56 = v108;
  }
  else
  {
    id v59 = v56;
    v61 = v92;
    v60 = v93;
  }
  if (PGIsAppleInternal_onceToken != -1) {
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8452);
  }
  if (PGIsAppleInternal_isAppleInternal)
  {
    id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v78 = v59;
    uint64_t v79 = [v78 countByEnumeratingWithState:&v125 objects:buf count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v126;
      do
      {
        for (uint64_t k = 0; k != v80; ++k)
        {
          if (*(void *)v126 != v81) {
            objc_enumerationMutation(v78);
          }
          v83 = [*(id *)(*((void *)&v125 + 1) + 8 * k) name];
          [v77 addObject:v83];
        }
        uint64_t v80 = [v78 countByEnumeratingWithState:&v125 objects:buf count:16];
      }
      while (v80);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v85 = [v77 count];
      v86 = [v77 componentsJoinedByString:@", "];
      *(_DWORD *)v135 = 134218499;
      uint64_t v136 = v85;
      __int16 v137 = 2112;
      v138 = @"high";
      __int16 v139 = 2113;
      v140 = v86;
      _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[PublicEvents] Disambiguating event: found %lu %@ confidence events. %{private}@", v135, 0x20u);
    }
    v20 = v101;
    v61 = v92;
    v60 = v93;
  }

  return v59;
}

- (PGPublicEventDisambiguator)initWithSceneTaxonomy:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGPublicEventDisambiguator;
  uint64_t v6 = [(PGPublicEventDisambiguator *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sceneTaxonomy, a3);
  }

  return v7;
}

@end