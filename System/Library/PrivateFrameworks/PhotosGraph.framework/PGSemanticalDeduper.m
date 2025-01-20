@interface PGSemanticalDeduper
- (BOOL)usesAdaptiveSimilarStacking;
- (id)deduplicatedItemsWithItems:(id)a3 debugInfo:(id)a4 progressBlock:(id)a5;
- (id)itemsNeedingSceneprintInTimeClusters:(id)a3;
- (id)sceneprintByItemIdentifierWithItems:(id)a3;
- (void)setUsesAdaptiveSimilarStacking:(BOOL)a3;
@end

@implementation PGSemanticalDeduper

- (void)setUsesAdaptiveSimilarStacking:(BOOL)a3
{
  self->_usesAdaptiveSimilarStacking = a3;
}

- (BOOL)usesAdaptiveSimilarStacking
{
  return self->_usesAdaptiveSimilarStacking;
}

- (id)itemsNeedingSceneprintInTimeClusters:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "objects", (void)v14);
        if ((unint64_t)[v10 count] >= 2)
        {
          v11 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_45];
          v12 = [v10 filteredArrayUsingPredicate:v11];

          if ((unint64_t)[v12 count] >= 2) {
            [v4 addObjectsFromArray:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

BOOL __60__PGSemanticalDeduper_itemsNeedingSceneprintInTimeClusters___block_invoke(uint64_t a1, void *a2)
{
  return [a2 clsPeopleCount] == 0;
}

- (id)deduplicatedItemsWithItems:(id)a3 debugInfo:(id)a4 progressBlock:(id)a5
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  id v83 = a4;
  id v69 = a5;
  uint64_t v132 = 0;
  v133 = &v132;
  uint64_t v134 = 0x2020000000;
  char v135 = 0;
  uint64_t v128 = 0;
  v129 = (double *)&v128;
  uint64_t v130 = 0x2020000000;
  uint64_t v131 = 0;
  v76 = _Block_copy(v69);
  if (v76
    && (double v7 = CFAbsoluteTimeGetCurrent(), v7 - v129[3] >= 0.01)
    && (v129[3] = v7,
        char v127 = 0,
        (*((void (**)(void *, char *, double))v76 + 2))(v76, &v127, 0.0),
        char v8 = *((unsigned char *)v133 + 24) | v127,
        (*((unsigned char *)v133 + 24) = v8) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v138 = 54;
      *(_WORD *)&v138[4] = 2080;
      *(void *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Curation/PGSemanticalDeduper.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    unint64_t v81 = [v75 count];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F8A780]) initWithDistanceBlock:&__block_literal_global_39505];
    [v10 setMaximumDistance:90.0];
    [v10 setMinimumNumberOfObjects:1];
    v122[0] = MEMORY[0x1E4F143A8];
    v122[1] = 3221225472;
    v122[2] = __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_2;
    v122[3] = &unk_1E68F03F8;
    id v74 = v76;
    id v123 = v74;
    v124 = &v128;
    uint64_t v126 = 0x3F847AE147AE147BLL;
    v125 = &v132;
    v68 = v10;
    v71 = [v10 performWithDataset:v75 progressBlock:v122];
    if (*((unsigned char *)v133 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v138 = 68;
        *(_WORD *)&v138[4] = 2080;
        *(void *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Curation/PGSemanticalDeduper.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v9 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v67 = [(PGSemanticalDeduper *)self itemsNeedingSceneprintInTimeClusters:v71];
      v11 = -[PGSemanticalDeduper sceneprintByItemIdentifierWithItems:](self, "sceneprintByItemIdentifierWithItems:");
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F76DA0]) initWithSimilarityModelClass:objc_opt_class()];
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_31;
      v120[3] = &unk_1E68E9E10;
      id v66 = v11;
      id v121 = v66;
      [v12 setSceneprintGetterBlock:v120];
      v79 = v12;
      if (v76
        && (double v13 = CFAbsoluteTimeGetCurrent(), v13 - v129[3] >= 0.01)
        && (v129[3] = v13,
            char v127 = 0,
            (*((void (**)(id, char *, double))v74 + 2))(v74, &v127, 0.2),
            char v14 = *((unsigned char *)v133 + 24) | v127,
            (*((unsigned char *)v133 + 24) = v14) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v138 = 80;
          *(_WORD *)&v138[4] = 2080;
          *(void *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGSemanticalDeduper.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v9 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        unint64_t v15 = [v71 count];
        id v85 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        id obj = v71;
        uint64_t v16 = [obj countByEnumeratingWithState:&v116 objects:v143 count:16];
        if (v16)
        {
          double v17 = 0.8 / (double)v15;
          uint64_t v73 = *(void *)v117;
          double v18 = 0.2;
          do
          {
            uint64_t v80 = 0;
            uint64_t v72 = v16;
            do
            {
              if (*(void *)v117 != v73) {
                objc_enumerationMutation(obj);
              }
              uint64_t v19 = *(void **)(*((void *)&v116 + 1) + 8 * v80);
              v77 = (void *)MEMORY[0x1D25FED50]();
              v78 = [v19 objects];
              unint64_t v20 = [v78 count];
              if (v20 >= 2)
              {
                v109[0] = MEMORY[0x1E4F143A8];
                v109[1] = 3221225472;
                v109[2] = __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_34;
                v109[3] = &unk_1E68ECB50;
                id v21 = v74;
                id v110 = v21;
                v111 = &v128;
                double v114 = v18;
                double v115 = v17;
                uint64_t v113 = 0x3F847AE147AE147BLL;
                v112 = &v132;
                uint64_t v22 = [v79 stackSimilarItems:v78 withSimilarity:2 timestampSupport:0 progressBlock:v109];
                v23 = (void *)v22;
                if (*((unsigned char *)v133 + 24))
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v138 = 97;
                    *(_WORD *)&v138[4] = 2080;
                    *(void *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Curation/PGSemanticalDeduper.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  goto LABEL_94;
                }
                if (self->_usesAdaptiveSimilarStacking)
                {
                  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  long long v107 = 0u;
                  long long v108 = 0u;
                  long long v105 = 0u;
                  long long v106 = 0u;
                  id v26 = v23;
                  uint64_t v27 = [v26 countByEnumeratingWithState:&v105 objects:v142 count:16];
                  if (!v27) {
                    goto LABEL_48;
                  }
                  uint64_t v28 = *(void *)v106;
LABEL_31:
                  uint64_t v29 = 0;
                  while (1)
                  {
                    if (*(void *)v106 != v28) {
                      objc_enumerationMutation(v26);
                    }
                    v30 = *(void **)(*((void *)&v105 + 1) + 8 * v29);
                    unint64_t v31 = [v30 count];
                    if (v31 >= 4 && 3 * v31 > v81)
                    {
                      v98[0] = MEMORY[0x1E4F143A8];
                      v98[1] = 3221225472;
                      v98[2] = __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_35;
                      v98[3] = &unk_1E68ECB50;
                      id v99 = v21;
                      v100 = &v128;
                      double v103 = v18;
                      double v104 = v17;
                      uint64_t v102 = 0x3F847AE147AE147BLL;
                      v101 = &v132;
                      v33 = [v79 adaptiveStackSimilarItems:v30 progressBlock:v98];
                      v34 = v33;
                      if (*((unsigned char *)v133 + 24))
                      {
                        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 67109378;
                          *(_DWORD *)v138 = 111;
                          *(_WORD *)&v138[4] = 2080;
                          *(void *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanaly"
                                                "sis/PhotosGraph/Framework/Curation/PGSemanticalDeduper.m";
                          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                        }

LABEL_94:
LABEL_95:
                        int v61 = 0;
                        goto LABEL_96;
                      }
                      if ([v33 count])
                      {
                        [v25 addObjectsFromArray:v34];
                        v35 = MEMORY[0x1E4F14500];
                        id v36 = MEMORY[0x1E4F14500];
                        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                        {
                          uint64_t v37 = [v34 count];
                          *(_DWORD *)buf = 134218240;
                          *(void *)v138 = v31;
                          *(_WORD *)&v138[8] = 2048;
                          *(void *)&v138[10] = v37;
                          _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "Semantically deduping cluster of %lu items is too lossy, deduping at first split to %lu items", buf, 0x16u);
                        }
                      }
                      else
                      {
                        [v25 addObject:v30];
                      }
                    }
                    else
                    {
                      [v25 addObject:v30];
                    }
                    if (v27 == ++v29)
                    {
                      uint64_t v27 = [v26 countByEnumeratingWithState:&v105 objects:v142 count:16];
                      if (!v27)
                      {
LABEL_48:

                        goto LABEL_50;
                      }
                      goto LABEL_31;
                    }
                  }
                }
                id v25 = (id)v22;
LABEL_50:
                long long v96 = 0u;
                long long v97 = 0u;
                long long v94 = 0u;
                long long v95 = 0u;
                id v84 = v25;
                uint64_t v38 = [v84 countByEnumeratingWithState:&v94 objects:v141 count:16];
                if (!v38) {
                  goto LABEL_83;
                }
                uint64_t v86 = *(void *)v95;
                while (2)
                {
                  uint64_t v39 = 0;
                  uint64_t v88 = v38;
LABEL_53:
                  if (*(void *)v95 != v86) {
                    objc_enumerationMutation(v84);
                  }
                  v40 = *(void **)(*((void *)&v94 + 1) + 8 * v39);
                  context = (void *)MEMORY[0x1D25FED50]();
                  unint64_t v41 = [v40 count];
                  v42 = [(PGDeduper *)self requiredItemsInItems:v40];
                  unint64_t v43 = [v42 count];
                  if (v43)
                  {
                    [v85 addObjectsFromArray:v42];
                    if (v41 > v43)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 134218498;
                        v44 = @"it is";
                        if (v43 > 1) {
                          v44 = @"they are";
                        }
                        *(void *)v138 = v41;
                        *(_WORD *)&v138[8] = 2048;
                        *(void *)&v138[10] = v43;
                        __int16 v139 = 2112;
                        v140 = v44;
                        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Semantically deduped %lu items to %lu because %@ required", buf, 0x20u);
                      }
                      [v83 dedupItems:v40 toRequiredItems:v42 withDedupingType:2];
                    }
LABEL_81:

                    if (++v39 == v88)
                    {
                      uint64_t v38 = [v84 countByEnumeratingWithState:&v94 objects:v141 count:16];
                      if (!v38)
                      {
LABEL_83:

                        id v24 = v110;
LABEL_84:

                        goto LABEL_85;
                      }
                      continue;
                    }
                    goto LABEL_53;
                  }
                  break;
                }
                if (v41 < 2)
                {
                  v47 = [v40 firstObject];
                  if (v47) {
LABEL_79:
                  }
                    [v85 addObject:v47];
                }
                else
                {
                  long long v92 = 0u;
                  long long v93 = 0u;
                  long long v90 = 0u;
                  long long v91 = 0u;
                  id v45 = v40;
                  uint64_t v46 = [v45 countByEnumeratingWithState:&v90 objects:v136 count:16];
                  unint64_t v82 = v41;
                  v47 = 0;
                  if (v46)
                  {
                    int v48 = 0;
                    uint64_t v49 = *(void *)v91;
                    double v50 = -1.79769313e308;
                    do
                    {
                      for (uint64_t i = 0; i != v46; ++i)
                      {
                        if (*(void *)v91 != v49) {
                          objc_enumerationMutation(v45);
                        }
                        v52 = *(void **)(*((void *)&v90 + 1) + 8 * i);
                        [v52 clsContentScore];
                        double v54 = v53;
                        int v55 = [v52 isFavorite];
                        int v56 = v55;
                        if (!v47 || v54 > v50 && ((v48 ^ 1 | v55) & 1) != 0)
                        {
                          id v57 = v52;

                          v47 = v57;
                          double v50 = v54;
                          int v48 = v56;
                        }
                      }
                      uint64_t v46 = [v45 countByEnumeratingWithState:&v90 objects:v136 count:16];
                    }
                    while (v46);
                  }

                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(void *)v138 = v82;
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Semantically deduped %lu assets to 1", buf, 0xCu);
                  }
                  if (v47)
                  {
                    [v83 dedupItems:v45 toItem:v47 withDedupingType:2];
                    goto LABEL_79;
                  }
                }

                goto LABEL_81;
              }
              if (v20 == 1)
              {
                id v24 = [v78 firstObject];
                [v85 addObject:v24];
                goto LABEL_84;
              }
LABEL_85:
              double v18 = v17 + v18;
              if (v76)
              {
                double Current = CFAbsoluteTimeGetCurrent();
                if (Current - v129[3] >= 0.01)
                {
                  v129[3] = Current;
                  char v127 = 0;
                  (*((void (**)(id, char *, double))v74 + 2))(v74, &v127, v18);
                  v59 = MEMORY[0x1E4F14500];
                  char v60 = *((unsigned char *)v133 + 24) | v127;
                  *((unsigned char *)v133 + 24) = v60;
                  if (v60)
                  {
                    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v138 = 197;
                      *(_WORD *)&v138[4] = 2080;
                      *(void *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Curation/PGSemanticalDeduper.m";
                      _os_log_impl(&dword_1D1805000, v59, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }
                    goto LABEL_95;
                  }
                }
              }
              int v61 = 1;
LABEL_96:

              if (!v61)
              {

                goto LABEL_105;
              }
              ++v80;
            }
            while (v80 != v72);
            uint64_t v16 = [obj countByEnumeratingWithState:&v116 objects:v143 count:16];
          }
          while (v16);
        }

        if (v76
          && (double v62 = CFAbsoluteTimeGetCurrent(), v62 - v129[3] >= 0.01)
          && (v129[3] = v62,
              char v127 = 0,
              (*((void (**)(id, char *, double))v74 + 2))(v74, &v127, 1.0),
              char v63 = *((unsigned char *)v133 + 24) | v127,
              (*((unsigned char *)v133 + 24) = v63) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v138 = 201;
            *(_WORD *)&v138[4] = 2080;
            *(void *)&v138[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGSemanticalDeduper.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_105:
          id v9 = (id)MEMORY[0x1E4F1CBF0];
          v64 = v85;
        }
        else
        {
          v64 = v85;
          id v9 = v85;
        }
      }
    }
  }
  _Block_object_dispose(&v128, 8);
  _Block_object_dispose(&v132, 8);

  return v9;
}

void __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.2);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

id __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_31(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 clsIdentifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

void __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_34(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 64) + *(double *)(a1 + 72) * a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke_35(uint64_t a1, unsigned char *a2)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 64) + *(double *)(a1 + 72));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

double __74__PGSemanticalDeduper_deduplicatedItemsWithItems_debugInfo_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a2, "cls_universalDate");
  uint64_t v6 = objc_msgSend(v4, "cls_universalDate");

  [v5 timeIntervalSinceDate:v6];
  double v8 = fabs(v7);

  return v8;
}

- (id)sceneprintByItemIdentifierWithItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D25FED50](v6);
        v12 = objc_msgSend(v10, "clsSceneprint", (void)v15);
        if (v12)
        {
          double v13 = [v10 clsIdentifier];
          [v4 setObject:v12 forKeyedSubscript:v13];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  return v4;
}

@end