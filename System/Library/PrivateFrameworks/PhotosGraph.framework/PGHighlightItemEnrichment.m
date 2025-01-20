@interface PGHighlightItemEnrichment
- (PGHighlightItemEnrichment)initWithRule:(id)a3 modelWriter:(id)a4;
- (PGHighlightItemEnrichmentRule)rule;
- (PGHighlightItemListModelWriter)modelWriter;
- (PGNeighborScoreComputer)neighborScoreComputer;
- (void)_contextualKeyAssetForYearHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4 curationContext:(id)a5 contextualOptions:(id)a6 options:(id)a7 availableContextualRules:(id)a8 progressBlock:(id)a9;
- (void)contextualKeyAssetForYearHighlightItemLists:(id)a3 withManager:(id)a4 curationContext:(id)a5 options:(id)a6 progressBlock:(id)a7;
- (void)enrichHighlightItemLists:(id)a3 progressBlock:(id)a4;
- (void)setNeighborScoreComputer:(id)a3;
- (void)updateVisibilityStateForHighlightItemLists:(id)a3 withManager:(id)a4 progressBlock:(id)a5;
@end

@implementation PGHighlightItemEnrichment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neighborScoreComputer, 0);
  objc_storeStrong((id *)&self->_modelWriter, 0);
  objc_storeStrong((id *)&self->_rule, 0);
}

- (void)setNeighborScoreComputer:(id)a3
{
}

- (PGNeighborScoreComputer)neighborScoreComputer
{
  return self->_neighborScoreComputer;
}

- (PGHighlightItemListModelWriter)modelWriter
{
  return self->_modelWriter;
}

- (PGHighlightItemEnrichmentRule)rule
{
  return self->_rule;
}

- (void)enrichHighlightItemLists:(id)a3 progressBlock:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    double v8 = 0.0;
    v37 = (void (**)(void *, unsigned char *, double))_Block_copy(v7);
    if (v37)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current >= 0.01)
      {
        char v42 = 0;
        v37[2](v37, &v42, 0.0);
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v44 = 232;
            *(_WORD *)&v44[4] = 2080;
            *(void *)&v44[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Data Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_54:

          goto LABEL_55;
        }
        double v8 = Current;
      }
    }
    v10 = [(PGHighlightItemEnrichmentRule *)self->_rule loggingConnection];
    v11 = [(PGHighlightItemEnrichment *)self modelWriter];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v10;
      uint64_t v13 = [v6 count];
      rule = self->_rule;
      *(_DWORD *)buf = 134218242;
      *(void *)v44 = v13;
      *(_WORD *)&v44[8] = 2112;
      *(void *)&v44[10] = rule;
      _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_DEFAULT, "Enriching %ld time unit list using rule %@", buf, 0x16u);
    }
    unint64_t v15 = objc_msgSend(v6, "count", v7);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v35 = v6;
    id obj = v6;
    uint64_t v16 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      double v18 = 1.0 / (double)v15;
      uint64_t v19 = *(void *)v39;
      double v20 = 0.0;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ([v11 visibilityStateForHighlightItem:v22 sharingFilter:0])
          {
            v23 = (void *)MEMORY[0x1D25FED50]();
            v24 = [(PGHighlightItemEnrichmentRule *)self->_rule keyAssetForHighlightItemList:v22 sharingFilter:0];
            if (v24)
            {
              [v22 setKeyAssetPrivate:v24];
            }
            else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v44 = v22;
              _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Failed to enrich highlight %@: no private key asset found", buf, 0xCu);
            }
          }
          else
          {
            v24 = 0;
          }
          if ([v11 visibilityStateForHighlightItem:v22 sharingFilter:1])
          {
            v25 = (void *)MEMORY[0x1D25FED50]();
            v26 = [(PGHighlightItemEnrichmentRule *)self->_rule keyAssetForHighlightItemList:v22 sharingFilter:1];
            if (v26)
            {
              [v22 setKeyAssetShared:v26];
            }
            else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v44 = v22;
              _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Failed to enrich highlight %@: no shared key asset found", buf, 0xCu);
            }
          }
          else
          {
            v26 = 0;
          }
          if ([v22 sharingComposition] == 2)
          {
            if (v24 && v26)
            {
              uint64_t v27 = +[PGHighlightEnrichmentUtilities mixedSharingCompositionKeyAssetRelationshipForKeyAssetPrivate:v24 keyAssetShared:v26 shouldCompareHighlight:1];
            }
            else if (v24)
            {
              uint64_t v27 = 1;
            }
            else
            {
              uint64_t v27 = 2 * (v26 != 0);
            }
          }
          else
          {
            uint64_t v27 = 0;
          }
          v28 = (void *)MEMORY[0x1D25FED50]([v22 setMixedSharingCompositionKeyAssetRelationship:v27]);
          [(PGHighlightItemEnrichmentRule *)self->_rule promotionScoreForHighlightItemList:v22];
          uint64_t v30 = v29;
          objc_msgSend(v22, "setPromotionScore:");
          v31 = v10;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v33 = [0 count];
            *(_DWORD *)buf = 138413058;
            *(void *)v44 = v22;
            *(_WORD *)&v44[8] = 2112;
            *(void *)&v44[10] = v24;
            __int16 v45 = 2048;
            uint64_t v46 = v33;
            __int16 v47 = 2048;
            uint64_t v48 = v30;
            _os_log_debug_impl(&dword_1D1805000, v31, OS_LOG_TYPE_DEBUG, "Enriched %@ with:\n\tKey asset: %@\n\tCurated assets count: %lu\n\tPromotion score: %.2f", buf, 0x2Au);
          }

          double v20 = v18 + v20;
          if (v37)
          {
            double v32 = CFAbsoluteTimeGetCurrent();
            if (v32 - v8 >= 0.01)
            {
              char v42 = 0;
              v37[2](v37, &v42, v20);
              if (v42)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v44 = 314;
                  *(_WORD *)&v44[4] = 2080;
                  *(void *)&v44[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Data Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                id v7 = v34;
                id v6 = v35;
                goto LABEL_53;
              }
              double v8 = v32;
            }
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    id v7 = v34;
    id v6 = v35;
    if (v37)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        char v42 = 0;
        v37[2](v37, &v42, 1.0);
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v44 = 317;
            *(_WORD *)&v44[4] = 2080;
            *(void *)&v44[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Data Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
LABEL_53:

    goto LABEL_54;
  }
LABEL_55:
}

- (void)_contextualKeyAssetForYearHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4 curationContext:(id)a5 contextualOptions:(id)a6 options:(id)a7 availableContextualRules:(id)a8 progressBlock:(id)a9
{
  uint64_t v13 = a4;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v53 = a5;
  id v54 = a6;
  id v49 = a7;
  id v15 = a8;
  id v16 = a9;
  uint64_t v50 = v15;
  if ([v15 count])
  {
    id v47 = v16;
    uint64_t v90 = 0;
    v91 = &v90;
    uint64_t v92 = 0x2020000000;
    char v93 = 0;
    uint64_t v86 = 0;
    v87 = (double *)&v86;
    uint64_t v88 = 0x2020000000;
    uint64_t v89 = 0;
    v52 = (void (**)(void *, void *, double))_Block_copy(v16);
    if (v52)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v87[3] >= 0.01)
      {
        v87[3] = Current;
        LOBYTE(v78) = 0;
        v52[2](v52, &v78, 0.0);
        char v18 = *((unsigned char *)v91 + 24) | v78;
        *((unsigned char *)v91 + 24) = v18;
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            uint64_t buf = 0x9804000202;
            LOWORD(v98) = 2080;
            *(void *)((char *)&v98 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Graph/Data Model Enrichment/HighlightCollection/PGHigh"
                                            "lightItemEnrichment.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
          }
LABEL_49:
          _Block_object_dispose(&v86, 8);
          _Block_object_dispose(&v90, 8);

          id v16 = v47;
          goto LABEL_50;
        }
      }
    }
    uint64_t buf = 0;
    *(void *)&long long v98 = &buf;
    *((void *)&v98 + 1) = 0x3032000000;
    v99 = __Block_byref_object_copy__20918;
    v100 = __Block_byref_object_dispose__20919;
    id v101 = 0;
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x2020000000;
    v85[3] = 0xFFEFFFFFFFFFFFFFLL;
    v84[0] = 0;
    v84[1] = v84;
    v84[2] = 0x2020000000;
    v84[3] = 0xFFEFFFFFFFFFFFFFLL;
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x3032000000;
    v81 = __Block_byref_object_copy__20918;
    v82 = __Block_byref_object_dispose__20919;
    id v83 = 0;
    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__20918;
    v76 = __Block_byref_object_dispose__20919;
    id v77 = 0;
    uint64_t v19 = [(PGHighlightItemEnrichment *)self modelWriter];
    os_log_t oslog = [(PGHighlightItemEnrichmentRule *)self->_rule loggingConnection];
    unint64_t v20 = [v15 count];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v69 = 0u;
    long long v68 = 0u;
    id obj = v50;
    uint64_t v21 = [obj countByEnumeratingWithState:&v68 objects:v96 count:16];
    if (!v21)
    {
LABEL_41:

LABEL_43:
      if (v52)
      {
        double v44 = CFAbsoluteTimeGetCurrent();
        if (v44 - v87[3] >= 0.01)
        {
          v87[3] = v44;
          char v56 = 0;
          ((void (**)(void *, char *, double))v52)[2](v52, &v56, 1.0);
          char v45 = *((unsigned char *)v91 + 24) | v56;
          *((unsigned char *)v91 + 24) = v45;
          if (v45)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              int v94 = 67109378;
              LODWORD(v95[0]) = 222;
              WORD2(v95[0]) = 2080;
              *(void *)((char *)v95 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Graph/Data Model Enrichment/HighlightCollection/PGHi"
                                             "ghlightItemEnrichment.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v94, 0x12u);
            }
          }
        }
      }
LABEL_48:

      _Block_object_dispose(&v72, 8);
      _Block_object_dispose(&v78, 8);

      _Block_object_dispose(v84, 8);
      _Block_object_dispose(v85, 8);
      _Block_object_dispose(&buf, 8);

      goto LABEL_49;
    }
    double v23 = 1.0 / (double)v20;
    uint64_t v24 = *(void *)v69;
    double v25 = 0.0;
    *(void *)&long long v22 = 138412546;
    long long v46 = v22;
LABEL_9:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v69 != v24) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = *(void **)(*((void *)&v68 + 1) + 8 * v26);
      v28 = (void *)MEMORY[0x1D25FED50]();
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __168__PGHighlightItemEnrichment__contextualKeyAssetForYearHighlightItemList_sharingFilter_curationContext_contextualOptions_options_availableContextualRules_progressBlock___block_invoke;
      v57[3] = &unk_1E68E72F8;
      double v25 = v23 + v25;
      p_uint64_t buf = &buf;
      v60 = v85;
      v61 = v84;
      v62 = &v78;
      v63 = &v72;
      v58 = v52;
      v64 = &v86;
      double v67 = v25;
      uint64_t v66 = 0x3F847AE147AE147BLL;
      v65 = &v90;
      [v27 enumerateContextualKeyAssetsForYearHighlight:v55 sharingFilter:v13 withOptions:v54 modelReader:v19 curationContext:v53 usingBlock:v57];
      if (*((unsigned char *)v91 + 24))
      {
        int v29 = 1;
        uint64_t v30 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int v94 = 67109378;
          LODWORD(v95[0]) = 184;
          WORD2(v95[0]) = 2080;
          *(void *)((char *)v95 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Graph/Data Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
          _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v94, 0x12u);
        }
        int v31 = 0;
        goto LABEL_34;
      }
      uint64_t v32 = *(void *)(v98 + 40);
      if (v32) {
        break;
      }
      int v29 = 0;
      int v31 = 1;
LABEL_34:

      if (!v31)
      {

        if ((v29 | 2) != 2) {
          goto LABEL_48;
        }
        goto LABEL_43;
      }
      if (v21 == ++v26)
      {
        uint64_t v43 = [obj countByEnumeratingWithState:&v68 objects:v96 count:16];
        uint64_t v21 = v43;
        if (v43) {
          goto LABEL_9;
        }
        goto LABEL_41;
      }
    }
    [v19 setContextualKeyAsset:v32 forHighlightItem:v55 sharingFilter:v13];
    [v19 setContextualKeyAsset:*(void *)(v98 + 40) forHighlightItem:v73[5] sharingFilter:v13];
    [v19 setContextualKeyAsset:*(void *)(v98 + 40) forHighlightItem:v79[5] sharingFilter:v13];
    uint64_t v33 = [v19 visibilityStateForHighlightItem:v79[5] sharingFilter:v13];
    if [(id)v79[5] kind] || (MEMORY[0x1D25FE3E0](v33))
    {
      if (objc_msgSend((id)v79[5], "kind", v46) != 3)
      {
LABEL_33:
        int v31 = 0;
        int v29 = 2;
        goto LABEL_34;
      }
      v34 = (void *)MEMORY[0x1D25FED50]();
      id v35 = +[PGContextualRuleUtils dayHighlightContainingAsset:*(void *)(v98 + 40)];
      if (v35)
      {
        [v19 setContextualKeyAsset:*(void *)(v98 + 40) forHighlightItem:v35 sharingFilter:v13];
LABEL_32:

        goto LABEL_33;
      }
      if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
LABEL_31:
        id v35 = 0;
        goto LABEL_32;
      }
      uint64_t v37 = v79[5];
      uint64_t v38 = *(void *)(v98 + 40);
      int v94 = v46;
      v95[0] = v37;
      LOWORD(v95[1]) = 2112;
      *(void *)((char *)&v95[1] + 2) = v38;
      long long v39 = oslog;
      long long v40 = "Cannot find child highlight of day group %@ containing asset %@";
    }
    else
    {
      if ([(id)v79[5] type] != 5 && objc_msgSend((id)v79[5], "type") != 6)
      {
        [v19 addVisibleHighlight:v79[5] inMonth:v73[5] withHighlightFilter:v13];
        goto LABEL_33;
      }
      v34 = (void *)MEMORY[0x1D25FED50]();
      v36 = [MEMORY[0x1E4F39238] fetchParentDayGroupHighlightForHighlight:v79[5] options:0];
      id v35 = [v36 firstObject];

      if (v35)
      {
        [v19 setContextualKeyAsset:*(void *)(v98 + 40) forHighlightItem:v35 sharingFilter:v13];
        if ((MEMORY[0x1D25FE3E0]([v35 visibilityState]) & 1) == 0) {
          [v19 addVisibleHighlight:v35 inMonth:v73[5] withHighlightFilter:v13];
        }
        goto LABEL_32;
      }
      if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      uint64_t v41 = v79[5];
      uint64_t v42 = *(void *)(v98 + 40);
      int v94 = v46;
      v95[0] = v41;
      LOWORD(v95[1]) = 2112;
      *(void *)((char *)&v95[1] + 2) = v42;
      long long v39 = oslog;
      long long v40 = "Cannot find parent day group highlight of %@ containing asset %@";
    }
    _os_log_error_impl(&dword_1D1805000, v39, OS_LOG_TYPE_ERROR, v40, (uint8_t *)&v94, 0x16u);
    goto LABEL_31;
  }
LABEL_50:
}

void __168__PGHighlightItemEnrichment__contextualKeyAssetForYearHighlightItemList_sharingFilter_curationContext_contextualOptions_options_availableContextualRules_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, unsigned char *a5, double a6)
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  [v13 promotionScore];
  double v16 = v15;
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(void *)(v17 + 40)) {
    goto LABEL_8;
  }
  double v18 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v18 < a6) {
    goto LABEL_8;
  }
  if (v18 == a6)
  {
    double v19 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v16 > v19)
    {
LABEL_8:
      objc_storeStrong((id *)(v17 + 40), a2);
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a6;
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v16;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a4);
      goto LABEL_9;
    }
    if (v16 == v19)
    {
      unint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) uuid];
      uint64_t v21 = [v13 uuid];
      uint64_t v24 = [v20 compare:v21];

      if (v24 == -1)
      {
        uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
        goto LABEL_8;
      }
    }
  }
LABEL_9:
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
    if (Current - *(double *)(v23 + 24) >= *(double *)(a1 + 96))
    {
      *(double *)(v23 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 104));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
        *a5 = 1;
      }
    }
  }
}

- (void)contextualKeyAssetForYearHighlightItemLists:(id)a3 withManager:(id)a4 curationContext:(id)a5 options:(id)a6 progressBlock:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v12 count])
  {
    uint64_t v17 = _Block_copy(v16);
    uint64_t v41 = 0;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = (double *)&v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = 0;
    if (v17
      && (double v18 = CFAbsoluteTimeGetCurrent(), v18 - v38[3] >= 0.01)
      && (v38[3] = v18,
          char v36 = 0,
          (*((void (**)(void *, char *, double))v17 + 2))(v17, &v36, 0.0),
          char v19 = *((unsigned char *)v42 + 24) | v36,
          (*((unsigned char *)v42 + 24) = v19) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        int v46 = 98;
        __int16 v47 = 2080;
        uint64_t v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Da"
              "ta Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      unint64_t v20 = [(PGHighlightItemEnrichmentRule *)self->_rule loggingConnection];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __123__PGHighlightItemEnrichment_contextualKeyAssetForYearHighlightItemLists_withManager_curationContext_options_progressBlock___block_invoke;
      v25[3] = &unk_1E68E72D0;
      id v26 = v13;
      id v27 = v15;
      id v21 = v20;
      id v28 = v21;
      id v29 = v12;
      id v22 = v17;
      uint64_t v35 = 0x3F847AE147AE147BLL;
      uint64_t v33 = &v37;
      v34 = &v41;
      id v32 = v22;
      uint64_t v30 = self;
      id v31 = v14;
      [v26 performSynchronousConcurrentGraphReadUsingBlock:v25];
      if (v17)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v38[3] >= 0.01)
        {
          v38[3] = Current;
          char v36 = 0;
          (*((void (**)(id, char *, double))v22 + 2))(v22, &v36, 1.0);
          char v24 = *((unsigned char *)v42 + 24) | v36;
          *((unsigned char *)v42 + 24) = v24;
          if (v24)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t buf = 67109378;
              int v46 = 143;
              __int16 v47 = 2080;
              uint64_t v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/Data Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
    }
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
  }
}

void __123__PGHighlightItemEnrichment_contextualKeyAssetForYearHighlightItemLists_withManager_curationContext_options_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [PGContextualOptions alloc];
  id v29 = v3;
  v5 = [v3 graph];
  id v6 = [*(id *)(a1 + 32) photoLibrary];
  id v7 = [*(id *)(a1 + 32) curationManager];
  double v8 = [(PGContextualOptions *)v4 initWithGraph:v5 photoLibrary:v6 curationManager:v7 options:*(void *)(a1 + 40) loggingConnection:*(void *)(a1 + 48)];

  id v32 = v8;
  v9 = [(PGContextualOptions *)v8 availableContextualRules];
  unint64_t v10 = [*(id *)(a1 + 56) count];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = *(id *)(a1 + 56);
  uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    double v13 = 1.0 / (double)v10;
    uint64_t v14 = *(void *)v45;
    double v15 = 0.0;
    uint64_t v30 = v9;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v45 != v14) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void **)(*((void *)&v44 + 1) + 8 * v16);
      double v15 = v13 + v15;
      if (*(void *)(a1 + 80))
      {
        double Current = CFAbsoluteTimeGetCurrent();
        uint64_t v19 = *(void *)(*(void *)(a1 + 88) + 8);
        if (Current - *(double *)(v19 + 24) >= *(double *)(a1 + 104))
        {
          *(double *)(v19 + 24) = Current;
          char v43 = 0;
          (*(void (**)(double))(*(void *)(a1 + 80) + 16))(v15);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) |= v43;
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
            goto LABEL_19;
          }
        }
      }
      int v20 = [v17 sharingComposition];
      if (!v20) {
        break;
      }
      if (v20 == 1) {
        goto LABEL_16;
      }
      if (v20 == 2)
      {
        int v21 = 1;
        goto LABEL_14;
      }
LABEL_17:
      if (v12 == ++v16)
      {
        uint64_t v12 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_19;
      }
    }
    int v21 = 0;
LABEL_14:
    id v22 = *(void **)(a1 + 64);
    uint64_t v23 = *(void *)(a1 + 72);
    uint64_t v24 = *(void *)(a1 + 40);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __123__PGHighlightItemEnrichment_contextualKeyAssetForYearHighlightItemLists_withManager_curationContext_options_progressBlock___block_invoke_2;
    v38[3] = &unk_1E68F0420;
    id v39 = *(id *)(a1 + 80);
    uint64_t v41 = *(void *)(a1 + 104);
    double v42 = v15;
    long long v40 = *(_OWORD *)(a1 + 88);
    v9 = v30;
    [v22 _contextualKeyAssetForYearHighlightItemList:v17 sharingFilter:0 curationContext:v23 contextualOptions:v32 options:v24 availableContextualRules:v30 progressBlock:v38];
    LODWORD(v22) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);

    if (v22) {
      goto LABEL_19;
    }
    if (v21)
    {
LABEL_16:
      double v25 = *(void **)(a1 + 64);
      uint64_t v26 = *(void *)(a1 + 72);
      uint64_t v27 = *(void *)(a1 + 40);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __123__PGHighlightItemEnrichment_contextualKeyAssetForYearHighlightItemLists_withManager_curationContext_options_progressBlock___block_invoke_3;
      v33[3] = &unk_1E68F0420;
      id v34 = *(id *)(a1 + 80);
      uint64_t v36 = *(void *)(a1 + 104);
      double v37 = v15;
      long long v35 = *(_OWORD *)(a1 + 88);
      [v25 _contextualKeyAssetForYearHighlightItemList:v17 sharingFilter:1 curationContext:v26 contextualOptions:v32 options:v27 availableContextualRules:v9 progressBlock:v33];
      int v28 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);

      if (v28) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    goto LABEL_17;
  }
LABEL_19:
}

void __123__PGHighlightItemEnrichment_contextualKeyAssetForYearHighlightItemLists_withManager_curationContext_options_progressBlock___block_invoke_2(uint64_t a1, unsigned char *a2)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 64));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __123__PGHighlightItemEnrichment_contextualKeyAssetForYearHighlightItemLists_withManager_curationContext_options_progressBlock___block_invoke_3(uint64_t a1, unsigned char *a2)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 64));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)updateVisibilityStateForHighlightItemLists:(id)a3 withManager:(id)a4 progressBlock:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    uint64_t v11 = _Block_copy(v10);
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    uint64_t v21 = 0;
    id v22 = (double *)&v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __98__PGHighlightItemEnrichment_updateVisibilityStateForHighlightItemLists_withManager_progressBlock___block_invoke;
    v14[3] = &unk_1E68E72A8;
    id v15 = v8;
    uint64_t v16 = self;
    id v12 = v11;
    id v17 = v12;
    double v18 = &v21;
    uint64_t v19 = &v25;
    uint64_t v20 = 0x3F847AE147AE147BLL;
    [v9 performSynchronousConcurrentGraphReadUsingBlock:v14];
    if (*((unsigned char *)v26 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        int v30 = 87;
        __int16 v31 = 2080;
        id v32 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Da"
              "ta Model Enrichment/HighlightCollection/PGHighlightItemEnrichment.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else if (v12)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v22[3] >= 0.01)
      {
        v22[3] = Current;
        buf[0] = 0;
        (*((void (**)(id, uint8_t *, double))v12 + 2))(v12, buf, 1.0);
        *((unsigned char *)v26 + 24) |= buf[0];
      }
    }

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }
}

void __98__PGHighlightItemEnrichment_updateVisibilityStateForHighlightItemLists_withManager_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  id v3 = [v16 graph];
  unint64_t v4 = [*(id *)(a1 + 32) count];
  objc_initWeak(&location, *(id *)(a1 + 40));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    double v7 = 0.0;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v24 != v6) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
      id v10 = (void *)MEMORY[0x1D25FED50]();
      if (!*(void *)(a1 + 48)) {
        goto LABEL_10;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      if (Current - *(double *)(v12 + 24) >= *(double *)(a1 + 72)
        && (*(double *)(v12 + 24) = Current,
            char v22 = 0,
            (*(void (**)(double))(*(void *)(a1 + 48) + 16))(v7),
            (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= v22) != 0))
      {
        int v13 = 0;
      }
      else
      {
LABEL_10:
        __int16 v14 = [v9 kind] == 2 ? 4 : 2;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __98__PGHighlightItemEnrichment_updateVisibilityStateForHighlightItemLists_withManager_progressBlock___block_invoke_2;
        aBlock[3] = &unk_1E68E7280;
        objc_copyWeak(&v20, &location);
        aBlock[4] = v9;
        id v19 = v3;
        __int16 v21 = v14;
        id v15 = (void (**)(void *, void))_Block_copy(aBlock);
        v15[2](v15, 0);
        v15[2](v15, 1);
        v15[2](v15, 2);

        objc_destroyWeak(&v20);
        double v7 = 1.0 / (double)v4 + v7;
        int v13 = 1;
      }
      if (!v13) {
        break;
      }
      if (v5 == ++v8)
      {
        uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  objc_destroyWeak(&location);
}

void __98__PGHighlightItemEnrichment_updateVisibilityStateForHighlightItemLists_withManager_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = [WeakRetained rule];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [WeakRetained neighborScoreComputer];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__PGHighlightItemEnrichment_updateVisibilityStateForHighlightItemLists_withManager_progressBlock___block_invoke_3;
  v11[3] = &unk_1E68E7258;
  __int16 v12 = a2;
  v11[4] = WeakRetained;
  v11[5] = &v13;
  [v5 enumerateChildVisibilityStateForHighlightItemList:v6 sharingFilter:a2 withGraph:v7 neighborScoreComputer:v8 usingBlock:v11];

  if (*((unsigned char *)v14 + 24)) {
    uint64_t v9 = *(unsigned __int16 *)(a1 + 56);
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = [WeakRetained modelWriter];
  [v10 setVisibilityState:v9 forHighlightItemList:*(void *)(a1 + 32) sharingFilter:a2];

  _Block_object_dispose(&v13, 8);
}

uint64_t __98__PGHighlightItemEnrichment_updateVisibilityStateForHighlightItemLists_withManager_progressBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 modelWriter];
  [v7 setVisibilityState:a3 forHighlightItem:v6 sharingFilter:*(unsigned __int16 *)(a1 + 48)];

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = MEMORY[0x1D25FE3E0](a3);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v8 + 24) = result;
  return result;
}

- (PGHighlightItemEnrichment)initWithRule:(id)a3 modelWriter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGHighlightItemEnrichment;
  uint64_t v9 = [(PGHighlightItemEnrichment *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rule, a3);
    objc_storeStrong((id *)&v10->_modelWriter, a4);
    uint64_t v11 = objc_alloc_init(PGNeighborScoreComputer);
    neighborScoreComputer = v10->_neighborScoreComputer;
    v10->_neighborScoreComputer = v11;
  }
  return v10;
}

@end