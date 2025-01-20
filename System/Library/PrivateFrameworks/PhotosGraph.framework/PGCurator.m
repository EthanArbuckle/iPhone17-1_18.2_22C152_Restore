@interface PGCurator
+ (unint64_t)maximumNumberOfItemsToElectWithTotalNumberOfItems:(unint64_t)a3 spanningNumberOfDays:(double)a4 options:(id)a5;
+ (unint64_t)numberOfItemsToShaveOffWithNumberOfItems:(unint64_t)a3 maximumNumberOfItems:(unint64_t)a4 options:(id)a5;
- (OS_os_log)loggingConnection;
- (PGCurator)init;
- (double)evaluatedDurationWithItems:(id)a3 options:(id)a4;
- (double)maximumDurationWithItems:(id)a3 options:(id)a4;
- (id)bestItemIdentifiersWithItems:(id)a3 options:(id)a4 debugInfo:(id *)a5;
- (id)bestItemsForFeeder:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6;
- (id)completedItems:(id)a3 withNumberOfItems:(unint64_t)a4 fromAllItems:(id)a5 avoidingItems:(id)a6 options:(id)a7 debugInfo:(id)a8 progressBlock:(id)a9;
- (id)deduplicatedItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6;
- (id)defaultItemSortDescriptors;
- (id)focusedItemsInItems:(id)a3 withOptions:(id)a4;
- (id)newMovieDeduperWithOptions:(id)a3;
- (id)newSemanticalDeduperWithOptions:(id)a3;
- (id)shaveItems:(id)a3 downToNumberOfItems:(unint64_t)a4 options:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7;
- (id)summarizedItemsFromCluster:(id)a3 withBeautifier:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6;
- (unint64_t)targetDurationBasedNumberOfItemsToElectFromItems:(id)a3 options:(id)a4;
- (void)_checkRequiredItemsWithIdentifiers:(id)a3 inItems:(id)a4;
- (void)completeItems:(id)a3 withFavoriteItemsFromItems:(id)a4 upToNumberOfItems:(unint64_t)a5 debugInfo:(id)a6 progressBlock:(id)a7;
- (void)completeItems:(id)a3 withItems:(id)a4 forPersonLocalIdentifiers:(id)a5 options:(id)a6 nonRemovableItems:(id)a7 debugInfo:(id)a8 progressBlock:(id)a9;
- (void)setLoggingConnection:(id)a3;
@end

@implementation PGCurator

- (void).cxx_destruct
{
}

- (void)setLoggingConnection:(id)a3
{
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (id)newMovieDeduperWithOptions:(id)a3
{
  return 0;
}

- (id)newSemanticalDeduperWithOptions:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PGSemanticalDeduper);
  uint64_t v5 = [v3 semanticalDedupingUsesAdaptiveSimilarStacking];

  [(PGSemanticalDeduper *)v4 setUsesAdaptiveSimilarStacking:v5];
  return v4;
}

- (id)shaveItems:(id)a3 downToNumberOfItems:(unint64_t)a4 options:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  v10 = (objc_class *)MEMORY[0x1E4F76C48];
  id v11 = a7;
  id v12 = a5;
  id v13 = a3;
  v14 = (void *)[[v10 alloc] initWithSimilarityModelClass:objc_opt_class()];
  [v14 setEnableStatisticalSampling:1];
  [v14 setUsesKMeans:1];
  [v14 setEnableIntermediateNaturalClustering:0];
  [v14 setEnableFinalNaturalClustering:0];
  [v14 setEnableFinalTimeClustering:0];
  v15 = [v12 uuidsOfRequiredAssets];

  [v14 setIdentifiersOfRequiredItems:v15];
  v16 = [v14 performWithItems:v13 maximumNumberOfItemsToChoose:a4 debugInfo:0 progressBlock:v11];

  return v16;
}

- (id)bestItemIdentifiersWithItems:(id)a3 options:(id)a4 debugInfo:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F8E778]);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __60__PGCurator_bestItemIdentifiersWithItems_options_debugInfo___block_invoke;
  v33[3] = &unk_1E68EBF78;
  id v26 = v10;
  id v34 = v26;
  id v11 = v8;
  id v35 = v11;
  id v12 = v9;
  id v36 = v12;
  v28 = v7;
  [v7 enumerateKeysAndObjectsUsingBlock:v33];
  id v13 = [[PGCuratorInvestigationFeeder alloc] initWithItems:v12];
  v14 = [[PGCurationOptions alloc] initWithDictionaryRepresentation:v11];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F76C78]) initWithItems:v12];
  v25 = v13;
  v16 = [(PGCurator *)self bestItemsForFeeder:v13 options:v14 debugInfo:v15 progressBlock:0];
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [*(id *)(*((void *)&v29 + 1) + 8 * i) clsIdentifier];
        [v17 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v20);
  }

  if (a5)
  {
    *a5 = [v15 dictionaryRepresentationWithAppendExtraItemInfoBlock:0];
  }

  return v17;
}

void __60__PGCurator_bestItemIdentifiersWithItems_options_debugInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  id v10 = [v5 curationModelForItemInfo:v7 options:v6];
  id v9 = +[PGCuratorInvestigationItem itemWithUUID:v8 itemInfo:v7 curationModel:v10];

  [*(id *)(a1 + 48) addObject:v9];
}

- (id)defaultItemSortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"cls_universalDate" ascending:1];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"clsIdentifier" ascending:1];
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (id)completedItems:(id)a3 withNumberOfItems:(unint64_t)a4 fromAllItems:(id)a5 avoidingItems:(id)a6 options:(id)a7 debugInfo:(id)a8 progressBlock:(id)a9
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v51 = a5;
  id v53 = a6;
  id v52 = a7;
  id v49 = a8;
  id v14 = a9;
  v15 = _Block_copy(v14);
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  char v81 = 0;
  uint64_t v74 = 0;
  v75 = (double *)&v74;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  v48 = v14;
  if (!v15
    || (double v16 = CFAbsoluteTimeGetCurrent(), v16 - v75[3] < 0.01)
    || (v75[3] = v16,
        char v73 = 0,
        (*((void (**)(void *, char *, double))v15 + 2))(v15, &v73, 0.0),
        char v17 = *((unsigned char *)v79 + 24) | v73,
        (*((unsigned char *)v79 + 24) = v17) == 0))
  {
    if (!a4)
    {
      id v18 = v50;
      goto LABEL_45;
    }
    unint64_t v47 = a4;
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v20 = v53;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v69 objects:v83 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v70 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = [*(id *)(*((void *)&v69 + 1) + 8 * i) clsIdentifier];
          [v19 addObject:v24];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v69 objects:v83 count:16];
      }
      while (v21);
    }

    v54 = +[PGCurationManager assetsBeautifier];
    [v54 setIdentifiersOfRequiredItems:v19];
    v25 = [v52 uuidsOfEligibleAssets];
    [v54 setIdentifiersOfEligibleItems:v25];

    unint64_t v26 = [v19 count] + v47;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __105__PGCurator_completedItems_withNumberOfItems_fromAllItems_avoidingItems_options_debugInfo_progressBlock___block_invoke;
    v64[3] = &unk_1E68F03F8;
    id v27 = v15;
    id v65 = v27;
    v66 = &v74;
    v67 = &v78;
    uint64_t v68 = 0x3F847AE147AE147BLL;
    v46 = [v54 performWithItems:v51 maximumNumberOfItemsToChoose:v26 debugInfo:0 progressBlock:v64];
    if (*((unsigned char *)v79 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v85 = 939;
        __int16 v86 = 2080;
        v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v18 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_44;
    }
    v45 = (void (**)(void, void, double))v27;
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v29 = v46;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v60 objects:v82 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v61 != v31) {
            objc_enumerationMutation(v29);
          }
          v33 = *(void **)(*((void *)&v60 + 1) + 8 * j);
          id v34 = [v33 clsIdentifier];
          char v35 = [v19 containsObject:v34];

          if ((v35 & 1) == 0) {
            [v28 addObject:v33];
          }
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v60 objects:v82 count:16];
      }
      while (v30);
    }

    id v36 = v28;
    v37 = v36;
    if ([v36 count] > v47)
    {
      [v54 setIdentifiersOfRequiredItems:0];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __105__PGCurator_completedItems_withNumberOfItems_fromAllItems_avoidingItems_options_debugInfo_progressBlock___block_invoke_286;
      v55[3] = &unk_1E68F03F8;
      v56 = v45;
      v57 = &v74;
      v58 = &v78;
      uint64_t v59 = 0x3F847AE147AE147BLL;
      v37 = [v54 performWithItems:v36 maximumNumberOfItemsToChoose:v47 progressBlock:v55];
    }
    id v38 = v50;
    if ([v37 count])
    {
      v39 = [v38 arrayByAddingObjectsFromArray:v37];

      if (v49)
      {
        v40 = [NSString stringWithFormat:@"Adding %lu assets (%lu requested, %lu found) for layout purposes", objc_msgSend(v37, "count"), v47, objc_msgSend(v36, "count")];
        v41 = [MEMORY[0x1E4F1CAD0] setWithArray:v37];
        [v49 setState:3 ofItems:v41 withReason:v40];
      }
      if (!v15) {
        goto LABEL_42;
      }
    }
    else
    {
      v39 = v38;
      if (!v15) {
        goto LABEL_42;
      }
    }
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v75[3] >= 0.01)
    {
      v75[3] = Current;
      char v73 = 0;
      ((void (**)(void, char *, double))v45)[2](v45, &v73, 1.0);
      char v43 = *((unsigned char *)v79 + 24) | v73;
      *((unsigned char *)v79 + 24) = v43;
      if (v43)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v85 = 971;
          __int16 v86 = 2080;
          v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v18 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_43;
      }
    }
LABEL_42:
    id v18 = v39;
LABEL_43:

LABEL_44:
    goto LABEL_45;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v85 = 918;
    __int16 v86 = 2080;
    v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v18 = (id)MEMORY[0x1E4F1CBF0];
LABEL_45:
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

  return v18;
}

void __105__PGCurator_completedItems_withNumberOfItems_fromAllItems_avoidingItems_options_debugInfo_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __105__PGCurator_completedItems_withNumberOfItems_fromAllItems_avoidingItems_options_debugInfo_progressBlock___block_invoke_286(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)completeItems:(id)a3 withItems:(id)a4 forPersonLocalIdentifiers:(id)a5 options:(id)a6 nonRemovableItems:(id)a7 debugInfo:(id)a8 progressBlock:(id)a9
{
  uint64_t v165 = *MEMORY[0x1E4F143B8];
  id v99 = a3;
  id v108 = a4;
  id v14 = a5;
  id v15 = a6;
  id v102 = a7;
  id v16 = a8;
  double v17 = 0.0;
  v119 = (void (**)(void *, unsigned char *, double))_Block_copy(a9);
  if (!v119) {
    goto LABEL_7;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current < 0.01) {
    goto LABEL_7;
  }
  char v152 = 0;
  v119[2](v119, &v152, 0.0);
  if (!v152)
  {
    double v17 = Current;
LABEL_7:
    v97 = v15;
    v98 = v16;
    id v96 = v14;
    v118 = (void *)[v14 mutableCopy];
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    id v20 = v99;
    uint64_t v114 = [v20 countByEnumeratingWithState:&v148 objects:v160 count:16];
    v117 = v20;
    if (v114)
    {
      uint64_t v111 = *(void *)v149;
      do
      {
        for (uint64_t i = 0; i != v114; ++i)
        {
          if (*(void *)v149 != v111) {
            objc_enumerationMutation(v20);
          }
          uint64_t v22 = *(void **)(*((void *)&v148 + 1) + 8 * i);
          if (v119)
          {
            double v23 = CFAbsoluteTimeGetCurrent();
            if (v23 - v17 >= 0.01)
            {
              char v152 = 0;
              v119[2](v119, &v152, 0.5);
              if (v152)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  int v162 = 789;
                  __int16 v163 = 2080;
                  v164 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Curation/PGCurator.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                id v34 = v118;
                goto LABEL_100;
              }
              double v17 = v23;
            }
          }
          v24 = [v22 clsPersonAndPetLocalIdentifiers];
          v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v24];
          [v118 minusSet:v25];

          long long v146 = 0u;
          long long v147 = 0u;
          long long v144 = 0u;
          long long v145 = 0u;
          id v26 = v24;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v144 objects:v159 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v145;
            do
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v145 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void *)(*((void *)&v144 + 1) + 8 * j);
                long long v32 = [v19 objectForKeyedSubscript:v31];
                v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v32, "unsignedIntegerValue") + 1);

                [v19 setObject:v33 forKeyedSubscript:v31];
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v144 objects:v159 count:16];
            }
            while (v28);
          }

          id v20 = v117;
        }
        uint64_t v114 = [v117 countByEnumeratingWithState:&v148 objects:v160 count:16];
      }
      while (v114);
    }

    id v34 = v118;
    if (![v118 count])
    {
LABEL_101:

      id v14 = v96;
      id v15 = v97;
      id v16 = v98;
      goto LABEL_102;
    }
    v105 = +[PGCurationManager assetsBeautifier];
    id v101 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    obuint64_t j = (id)[v118 copy];
    uint64_t v35 = [obj countByEnumeratingWithState:&v140 objects:v158 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v141;
      uint64_t v103 = *(void *)v141;
      do
      {
        uint64_t v38 = 0;
        id v106 = (id)v36;
        do
        {
          if (*(void *)v141 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v39 = *(void *)(*((void *)&v140 + 1) + 8 * v38);
          if (v119)
          {
            double v40 = CFAbsoluteTimeGetCurrent();
            if (v40 - v17 >= 0.01)
            {
              char v152 = 0;
              v119[2](v119, &v152, 0.5);
              if (v152)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  int v162 = 812;
                  __int16 v163 = 2080;
                  v164 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Curation/PGCurator.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                goto LABEL_99;
              }
              double v17 = v40;
            }
          }
          if ([v34 containsObject:v39])
          {
            uint64_t v115 = v38;
            v41 = objc_opt_new();
            long long v136 = 0u;
            long long v137 = 0u;
            long long v138 = 0u;
            long long v139 = 0u;
            id v42 = v108;
            uint64_t v43 = [v42 countByEnumeratingWithState:&v136 objects:v157 count:16];
            if (v43)
            {
              uint64_t v44 = v43;
              uint64_t v45 = *(void *)v137;
              do
              {
                for (uint64_t k = 0; k != v44; ++k)
                {
                  if (*(void *)v137 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  unint64_t v47 = *(void **)(*((void *)&v136 + 1) + 8 * k);
                  v48 = [v47 clsPersonAndPetLocalIdentifiers];
                  int v49 = [v48 containsObject:v39];

                  if (v49) {
                    [v41 addObject:v47];
                  }
                }
                uint64_t v44 = [v42 countByEnumeratingWithState:&v136 objects:v157 count:16];
              }
              while (v44);
            }

            id v50 = [v105 bestItemInItems:v41];
            id v51 = v50;
            id v34 = v118;
            if (v50)
            {
              id v52 = [v50 clsPersonAndPetLocalIdentifiers];
              [v117 addObject:v51];
              v112 = v51;
              [v101 addObject:v51];
              id v53 = [MEMORY[0x1E4F1CAD0] setWithArray:v52];
              [v118 minusSet:v53];

              long long v134 = 0u;
              long long v135 = 0u;
              long long v132 = 0u;
              long long v133 = 0u;
              id v54 = v52;
              uint64_t v55 = [v54 countByEnumeratingWithState:&v132 objects:v156 count:16];
              if (v55)
              {
                uint64_t v56 = v55;
                uint64_t v57 = *(void *)v133;
                do
                {
                  for (uint64_t m = 0; m != v56; ++m)
                  {
                    if (*(void *)v133 != v57) {
                      objc_enumerationMutation(v54);
                    }
                    uint64_t v59 = *(void *)(*((void *)&v132 + 1) + 8 * m);
                    long long v60 = [v19 objectForKeyedSubscript:v59];
                    long long v61 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v60, "unsignedIntegerValue") + 1);

                    [v19 setObject:v61 forKeyedSubscript:v59];
                  }
                  uint64_t v56 = [v54 countByEnumeratingWithState:&v132 objects:v156 count:16];
                }
                while (v56);
              }

              id v51 = v112;
              id v34 = v118;
            }

            uint64_t v37 = v103;
            uint64_t v36 = (uint64_t)v106;
            uint64_t v38 = v115;
          }
          ++v38;
        }
        while (v38 != v36);
        uint64_t v36 = [obj countByEnumeratingWithState:&v140 objects:v158 count:16];
      }
      while (v36);
    }

    unint64_t v62 = +[PGCurationManager maximumNumberOfItemsForDuration:withTotalNumberOfItems:](PGCurationManager, "maximumNumberOfItemsForDuration:withTotalNumberOfItems:", [v97 duration], objc_msgSend(v108, "count"));
    if (v98)
    {
      [v98 setAgent:@"CompleteItems"];
      [v98 setStage:@"Repechage"];
      [v98 setState:3 ofItems:v101 withReason:@"Contains needed faces"];
    }
    long long v63 = v117;
    if ([v117 count] <= v62) {
      goto LABEL_109;
    }
    uint64_t v64 = [v117 count];
    id v65 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v107 = [v117 reverseObjectEnumerator];
    uint64_t v66 = [v107 countByEnumeratingWithState:&v128 objects:v155 count:16];
    if (!v66) {
      goto LABEL_104;
    }
    uint64_t v67 = v66;
    unint64_t v95 = v64 - v62;
    uint64_t v68 = *(void *)v129;
    id v94 = v65;
    uint64_t v100 = *(void *)v129;
LABEL_62:
    uint64_t v69 = 0;
    uint64_t v104 = v67;
    while (1)
    {
      if (*(void *)v129 != v68) {
        objc_enumerationMutation(v107);
      }
      uint64_t v116 = v69;
      long long v70 = *(void **)(*((void *)&v128 + 1) + 8 * v69);
      --v64;
      long long v71 = (void *)MEMORY[0x1E4F1CAD0];
      long long v72 = objc_msgSend(v70, "clsPersonAndPetLocalIdentifiers", v94);
      char v73 = [v71 setWithArray:v72];

      v113 = v73;
      if (([v102 containsObject:v70] & 1) == 0) {
        break;
      }
      uint64_t v74 = v116;
LABEL_90:

      uint64_t v69 = v74 + 1;
      if (v69 == v67)
      {
        uint64_t v67 = [v107 countByEnumeratingWithState:&v128 objects:v155 count:16];
        if (v67) {
          goto LABEL_62;
        }
LABEL_104:

        id v34 = v118;
        if ([v65 count])
        {
          if (v98)
          {
            v92 = [v63 objectsAtIndexes:v65];
            v93 = [MEMORY[0x1E4F1CAD0] setWithArray:v92];
            [v98 setState:2 ofItems:v93 withReason:@"Too many items after repechage"];
          }
          [v63 removeObjectsAtIndexes:v65];
        }

LABEL_109:
        if (v119)
        {
          if (CFAbsoluteTimeGetCurrent() - v17 >= 0.01)
          {
            char v152 = 0;
            v119[2](v119, &v152, 1.0);
            if (v152)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v162 = 912;
                __int16 v163 = 2080;
                v164 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework"
                       "/Curation/PGCurator.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
            }
          }
        }
LABEL_99:

        id v20 = v105;
LABEL_100:

        goto LABEL_101;
      }
    }
    id obja = (id)v64;
    if (v119)
    {
      double v75 = CFAbsoluteTimeGetCurrent();
      if (v75 - v17 >= 0.01)
      {
        char v152 = 0;
        v119[2](v119, &v152, 0.5);
        if (v152)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v162 = 871;
            __int16 v163 = 2080;
            v164 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cur"
                   "ation/PGCurator.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          id v34 = v118;
          goto LABEL_99;
        }
        double v17 = v75;
      }
    }
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id v76 = v73;
    uint64_t v77 = [v76 countByEnumeratingWithState:&v124 objects:v154 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = *(void *)v125;
LABEL_73:
      uint64_t v80 = 0;
      while (1)
      {
        if (*(void *)v125 != v79) {
          objc_enumerationMutation(v76);
        }
        char v81 = [v19 objectForKeyedSubscript:*(void *)(*((void *)&v124 + 1) + 8 * v80)];
        uint64_t v82 = [v81 unsignedIntegerValue];

        if (v82 == 1) {
          break;
        }
        if (v78 == ++v80)
        {
          uint64_t v78 = [v76 countByEnumeratingWithState:&v124 objects:v154 count:16];
          if (v78) {
            goto LABEL_73;
          }
          goto LABEL_79;
        }
      }
    }
    else
    {
LABEL_79:

      uint64_t v64 = (uint64_t)obja;
      [v65 addIndex:obja];
      if (v95 == 1)
      {

        goto LABEL_104;
      }
      --v95;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id v83 = v76;
      uint64_t v84 = [v83 countByEnumeratingWithState:&v120 objects:v153 count:16];
      if (!v84) {
        goto LABEL_89;
      }
      uint64_t v85 = v84;
      uint64_t v86 = *(void *)v121;
      do
      {
        for (uint64_t n = 0; n != v85; ++n)
        {
          if (*(void *)v121 != v86) {
            objc_enumerationMutation(v83);
          }
          uint64_t v88 = *(void *)(*((void *)&v120 + 1) + 8 * n);
          v89 = [v19 objectForKeyedSubscript:v88];
          uint64_t v90 = [v89 unsignedIntegerValue];
          v91 = [NSNumber numberWithUnsignedInteger:v90 - 1];

          [v19 setObject:v91 forKeyedSubscript:v88];
        }
        uint64_t v85 = [v83 countByEnumeratingWithState:&v120 objects:v153 count:16];
      }
      while (v85);
      long long v63 = v117;
      id v65 = v94;
    }
    uint64_t v64 = (uint64_t)obja;
LABEL_89:
    uint64_t v68 = v100;
    uint64_t v74 = v116;

    uint64_t v67 = v104;
    goto LABEL_90;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v162 = 781;
    __int16 v163 = 2080;
    v164 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_102:
}

- (void)completeItems:(id)a3 withFavoriteItemsFromItems:(id)a4 upToNumberOfItems:(unint64_t)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = (void (**)(void *, unsigned char *, double))_Block_copy(a7);
  double v15 = 0.0;
  if (!v14 || (double v16 = CFAbsoluteTimeGetCurrent(), v16 < 0.01))
  {
LABEL_7:
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v37 = v11;
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v36 = v12;
    id v19 = v12;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (([v18 containsObject:v24] & 1) == 0 && objc_msgSend(v24, "isFavorite")) {
            [v17 addObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v21);
    }

    if (v14)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      id v26 = (double *)&unk_1D1F48000;
      if (Current - v15 >= 0.01)
      {
        char v42 = 0;
        v14[2](v14, &v42, 0.5);
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v46 = 744;
            __int16 v47 = 2080;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cura"
                  "tion/PGCurator.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v12 = v36;
          id v11 = v37;
LABEL_38:

          goto LABEL_39;
        }
        double v15 = Current;
      }
    }
    else
    {
      id v26 = (double *)&unk_1D1F48000;
    }
    uint64_t v27 = [v17 count];
    if (v27)
    {
      unint64_t v28 = v27;
      [v13 setAgent:@"PGManager"];
      [v13 setStage:@"Complete with Favorite Items"];
      if (v28 > a5)
      {
        uint64_t v29 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"clsContentScore" ascending:0];
        v43[0] = v29;
        uint64_t v30 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"cls_universalDate" ascending:1];
        v43[1] = v30;
        uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];

        long long v32 = [v17 sortedArrayUsingDescriptors:v31];
        v33 = objc_msgSend(v32, "subarrayWithRange:", 0, a5);

        [v37 addObjectsFromArray:v33];
        if (v13)
        {
          id v34 = objc_msgSend(NSString, "stringWithFormat:", @"Electing %lu out of %lu available favorite items", objc_msgSend(v33, "count"), v28);
          uint64_t v35 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
          [v13 setState:3 ofItems:v35 withReason:v34];
        }
        id v26 = (double *)&unk_1D1F48000;
        goto LABEL_32;
      }
      [v37 addObjectsFromArray:v17];
      if (v13)
      {
        uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"Enough remaining slots (%lu) to include all %lu available favorite items", a5, v28);
        v33 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
        [v13 setState:3 ofItems:v33 withReason:v31];
LABEL_32:
      }
    }
    id v12 = v36;
    id v11 = v37;
    if (v14)
    {
      if (CFAbsoluteTimeGetCurrent() - v15 >= v26[87])
      {
        char v42 = 0;
        v14[2](v14, &v42, 1.0);
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v46 = 774;
            __int16 v47 = 2080;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cura"
                  "tion/PGCurator.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_38;
  }
  char v42 = 0;
  v14[2](v14, &v42, 0.0);
  if (!v42)
  {
    double v15 = v16;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v46 = 732;
    __int16 v47 = 2080;
    v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_39:
}

- (id)deduplicatedItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = _Block_copy(v13);
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = (double *)&v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  if (!v14
    || (double v15 = CFAbsoluteTimeGetCurrent(), v15 - v45[3] < 0.01)
    || (v45[3] = v15,
        char v43 = 0,
        (*((void (**)(void *, char *, double))v14 + 2))(v14, &v43, 0.0),
        char v16 = *((unsigned char *)v49 + 24) | v43,
        (*((unsigned char *)v49 + 24) = v16) == 0))
  {
    id v18 = [v11 uuidsOfRequiredAssets];
    id v19 = v10;
    if ([v11 semanticalDedupingIsEnabled])
    {
      id v20 = [(PGCurator *)self newSemanticalDeduperWithOptions:v11];
      if (v20)
      {
        int v31 = [v19 count];
        [v20 setIdentifiersOfRequiredItems:v18];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __63__PGCurator_deduplicatedItems_options_debugInfo_progressBlock___block_invoke;
        v38[3] = &unk_1E68F03F8;
        id v39 = v14;
        long long v40 = &v44;
        long long v41 = &v48;
        uint64_t v42 = 0x3F847AE147AE147BLL;
        id v21 = [v20 deduplicatedItemsWithItems:v19 debugInfo:v12 progressBlock:v38];

        if (*((unsigned char *)v49 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v53 = 704;
            __int16 v54 = 2080;
            uint64_t v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cura"
                  "tion/PGCurator.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_35;
        }
        uint64_t v22 = self->_loggingConnection;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
        {
          int v29 = [v21 count];
          *(_DWORD *)buf = 67109376;
          int v53 = v31;
          __int16 v54 = 1024;
          LODWORD(v55) = v29;
          _os_log_debug_impl(&dword_1D1805000, (os_log_t)v22, OS_LOG_TYPE_DEBUG, "Semantical deduper reduced %d assets to %d", buf, 0xEu);
        }
      }
      else
      {
        id v21 = v19;
      }
    }
    else
    {
      id v21 = v19;
    }
    if ([v11 movieDedupingIsEnabled])
    {
      id v23 = [(PGCurator *)self newMovieDeduperWithOptions:v11];
      if (v23)
      {
        int v32 = [v21 count];
        [v23 setIdentifiersOfRequiredItems:v18];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __63__PGCurator_deduplicatedItems_options_debugInfo_progressBlock___block_invoke_251;
        v33[3] = &unk_1E68F03F8;
        id v34 = v14;
        uint64_t v35 = &v44;
        id v36 = &v48;
        uint64_t v37 = 0x3F847AE147AE147BLL;
        v24 = [v23 deduplicatedItemsWithItems:v21 debugInfo:v12 progressBlock:v33];

        if (*((unsigned char *)v49 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v53 = 719;
            __int16 v54 = 2080;
            uint64_t v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Cura"
                  "tion/PGCurator.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          id v17 = (void *)MEMORY[0x1E4F1CBF0];
          id v21 = v24;
          goto LABEL_37;
        }
        v25 = self->_loggingConnection;
        if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG))
        {
          int v30 = [v24 count];
          *(_DWORD *)buf = 67109376;
          int v53 = v32;
          __int16 v54 = 1024;
          LODWORD(v55) = v30;
          _os_log_debug_impl(&dword_1D1805000, (os_log_t)v25, OS_LOG_TYPE_DEBUG, "Movie deduper reduced %d assets to %d", buf, 0xEu);
        }
      }
      else
      {
        v24 = v21;
      }

      id v21 = v24;
    }
    if (!v14
      || (double Current = CFAbsoluteTimeGetCurrent(), Current - v45[3] < 0.01)
      || (v45[3] = Current,
          char v43 = 0,
          (*((void (**)(void *, char *, double))v14 + 2))(v14, &v43, 1.0),
          char v27 = *((unsigned char *)v49 + 24) | v43,
          (*((unsigned char *)v49 + 24) = v27) == 0))
    {
      id v21 = v21;
      id v17 = v21;
      goto LABEL_37;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v53 = 724;
      __int16 v54 = 2080;
      uint64_t v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_35:
    id v17 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_37:

    goto LABEL_38;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v53 = 688;
    __int16 v54 = 2080;
    uint64_t v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation/PGCurator.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v17 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_38:
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  return v17;
}

void __63__PGCurator_deduplicatedItems_options_debugInfo_progressBlock___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __63__PGCurator_deduplicatedItems_options_debugInfo_progressBlock___block_invoke_251(uint64_t a1, unsigned char *a2)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)_checkRequiredItemsWithIdentifiers:(id)a3 inItems:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v20 = v7;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          double v15 = [v14 clsIdentifier];
          int v16 = [v6 containsObject:v15];

          if (v16)
          {
            if ([v8 containsObject:v14])
            {
              loggingConnectiouint64_t n = self->_loggingConnection;
              if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "Required items found several times in final sorted items", buf, 2u);
              }
            }
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    uint64_t v18 = [v8 count];
    if (v18 != [v6 count])
    {
      id v19 = self->_loggingConnection;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v19, OS_LOG_TYPE_ERROR, "Final sorted items don't contain all required items", buf, 2u);
      }
    }

    id v7 = v20;
  }
}

- (id)bestItemsForFeeder:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  uint64_t v372 = *MEMORY[0x1E4F143B8];
  id v239 = a3;
  id v240 = a4;
  id v237 = a5;
  id v235 = a6;
  uint64_t v10 = (void (**)(void *, void *, double))_Block_copy(v235);
  uint64_t v356 = 0;
  v357 = &v356;
  uint64_t v358 = 0x2020000000;
  char v359 = 0;
  uint64_t v352 = 0;
  v353 = (double *)&v352;
  uint64_t v354 = 0x2020000000;
  uint64_t v355 = 0;
  if (v10)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v353[3] >= 0.01)
    {
      v353[3] = Current;
      LOBYTE(v327) = 0;
      v10[2](v10, &v327, 0.0);
      char v12 = *((unsigned char *)v357 + 24) | v327;
      *((unsigned char *)v357 + 24) = v12;
      if (v12)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v362 = 155;
          *(_WORD *)&v362[4] = 2080;
          *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurator.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_11;
      }
    }
  }
  if (![v239 numberOfItems])
  {
LABEL_11:
    double v15 = MEMORY[0x1E4F1CBF0];
    goto LABEL_98;
  }
  v236 = self;
  v234 = v10;
  context = (void *)MEMORY[0x1D25FED50]();
  int v13 = [v240 sharingFilter];
  if (v13)
  {
    if (v13 == 1)
    {
      v238 = [v239 sharedItems];
      uint64_t v14 = [v238 count];
    }
    else if (v13 == 2)
    {
      v238 = [v239 allItems];
      uint64_t v14 = [v238 count];
    }
    else
    {
      v238 = 0;
      uint64_t v14 = [0 count];
    }
  }
  else
  {
    v238 = [v239 privateItems];
    uint64_t v14 = [v238 count];
  }
  if (v14)
  {
    int v16 = [v240 uuidsOfEligibleAssets];
    unsigned int v229 = [v240 identicalDedupingIsEnabled];
    v241 = [v240 uuidsOfRequiredAssets];
    uint64_t v17 = [v241 count];
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v17];
    if (v17)
    {
      long long v351 = 0u;
      long long v350 = 0u;
      long long v349 = 0u;
      long long v348 = 0u;
      id v19 = v238;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v348 objects:v371 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v349;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v349 != v21) {
              objc_enumerationMutation(v19);
            }
            long long v23 = *(void **)(*((void *)&v348 + 1) + 8 * i);
            long long v24 = [v23 clsIdentifier];
            if ([v241 containsObject:v24])
            {
              if (v16 && ([v16 containsObject:v24] & 1) == 0)
              {
                long long v25 = v236->_loggingConnection;
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v362 = v24;
                  _os_log_error_impl(&dword_1D1805000, v25, OS_LOG_TYPE_ERROR, "Required item %@ is not part of eligible items", buf, 0xCu);
                }
              }
              [v18 addObject:v23];
              if ([v18 count] == v17)
              {

                goto LABEL_34;
              }
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v348 objects:v371 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
LABEL_34:

      if (v237)
      {
        [v237 setAgent:@"Curator"];
        [v237 setStage:@"Required Items"];
        [v237 setState:4 ofItems:v18 withReason:@"Items are required"];
      }
    }
    id v26 = [(PGCurator *)v236 focusedItemsInItems:v238 withOptions:v240];
    if ([v26 count])
    {
      if ([v18 count])
      {
        uint64_t v27 = [v18 setByAddingObjectsFromArray:v26];
        uint64_t v28 = [v27 allObjects];

        id v26 = (id)v28;
      }
      if (v237)
      {
        int v29 = [MEMORY[0x1E4F1CAD0] setWithArray:v26];
        [v237 chooseItems:v29 inItems:v238 withReason:@"Focused Items"];
      }
      id v26 = v26;

      int v30 = v26;
    }
    else
    {
      int v30 = v238;
    }
    v238 = v30;
    uint64_t v31 = [v30 count];
    if (!v31)
    {
      double v15 = MEMORY[0x1E4F1CBF0];
LABEL_96:

      goto LABEL_97;
    }
    unint64_t v32 = v31;
    if (v16)
    {
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v31];
      long long v347 = 0u;
      long long v346 = 0u;
      long long v345 = 0u;
      long long v344 = 0u;
      id v34 = v238;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v344 objects:v370 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v345;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v345 != v36) {
              objc_enumerationMutation(v34);
            }
            long long v38 = [*(id *)(*((void *)&v344 + 1) + 8 * j) clsIdentifier];
            [v33 addObject:v38];
          }
          uint64_t v35 = [v34 countByEnumeratingWithState:&v344 objects:v370 count:16];
        }
        while (v35);
      }

      [v33 intersectSet:v16];
      id v232 = v33;
    }
    else
    {
      id v232 = 0;
    }
    uint64_t v227 = [v240 duration];
    int v39 = [v240 includesAllFaces];
    int v40 = [v240 useDurationBasedCuration];
    if (v40)
    {
      [(PGCurator *)v236 maximumDurationWithItems:v238 options:v240];
      double v42 = v41;
      [v240 minimumDuration];
      double v44 = v43;
      if (v43 > 0.0 && v42 < v43)
      {
        uint64_t v45 = v236->_loggingConnection;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          *(double *)v362 = v42;
          *(_WORD *)&v362[8] = 2048;
          *(double *)&v362[10] = v44;
          _os_log_impl(&dword_1D1805000, v45, OS_LOG_TYPE_INFO, "DurationEvaluation: maximumDuration with all items is %f, cannot match minimum duration %f", buf, 0x16u);
        }

        if ([v240 failIfMinimumDurationNotReached])
        {
          double v15 = MEMORY[0x1E4F1CBF0];
LABEL_95:
          int v16 = v232;
          goto LABEL_96;
        }
      }
      unint64_t v46 = [(PGCurator *)v236 targetDurationBasedNumberOfItemsToElectFromItems:v238 options:v240];
    }
    else if ([v240 targetNumberOfItems])
    {
      unint64_t v46 = [v240 targetNumberOfItems];
    }
    else
    {
      uint64_t v47 = [v239 universalEndDate];
      uint64_t v48 = [v239 universalStartDate];
      [v47 timeIntervalSinceDate:v48];
      double v50 = v49;

      unint64_t v46 = [(id)objc_opt_class() maximumNumberOfItemsToElectWithTotalNumberOfItems:v32 spanningNumberOfDays:v240 options:v50 / 86400.0];
    }
    unint64_t v51 = v46;
    if (v46 <= [v18 count])
    {
      uint64_t v57 = [(PGCurator *)v236 defaultItemSortDescriptors];
      double v15 = [v18 sortedArrayUsingDescriptors:v57];

      goto LABEL_95;
    }
    unint64_t v52 = [v232 count];
    int v53 = [v240 skipCurationIfEligibleItemsFitTargetDuration];
    if (v232) {
      int v54 = v53;
    }
    else {
      int v54 = 0;
    }
    if (v54 == 1 && v51 + 2 >= v52)
    {
      uint64_t v55 = (void *)MEMORY[0x1E4F28F60];
      v342[0] = MEMORY[0x1E4F143A8];
      v342[1] = 3221225472;
      v342[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke;
      v342[3] = &unk_1E68E5BB0;
      id v343 = v232;
      uint64_t v56 = [v55 predicateWithBlock:v342];
      double v15 = [v238 filteredArrayUsingPredicate:v56];

      goto LABEL_95;
    }
    unint64_t v225 = v51;
    v231 = +[PGCurationManager summaryClusteringForDuration:v227];
    if ([v240 shouldSkipClustering])
    {
      id v58 = objc_alloc(MEMORY[0x1E4F76DB0]);
      uint64_t v59 = [MEMORY[0x1E4F8A788] clusterWithObjects:v238];
      long long v60 = (void *)[v58 initWithCluster:v59 numberOfItemsToElect:v51];
      v369 = v60;
      v226 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v369 count:1];
    }
    else
    {
      v337[0] = MEMORY[0x1E4F143A8];
      v337[1] = 3221225472;
      v337[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_2;
      v337[3] = &unk_1E68F03F8;
      id v338 = v234;
      v339 = &v352;
      uint64_t v341 = 0x3F847AE147AE147BLL;
      v340 = &v356;
      v226 = [v231 performWithItems:v238 identifiersOfEligibleItems:v232 maximumNumberOfItemsToElect:v51 debugInfo:v237 progressBlock:v337];
      uint64_t v59 = v338;
    }

    long long v61 = v236->_loggingConnection;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      uint64_t v62 = [v238 count];
      uint64_t v63 = [v226 count];
      *(_DWORD *)buf = 134219008;
      *(void *)v362 = v62;
      *(_WORD *)&v362[8] = 1024;
      *(_DWORD *)&v362[10] = v40;
      *(_WORD *)&v362[14] = 2048;
      *(void *)&v362[16] = v51;
      *(_WORD *)&v362[24] = 1024;
      *(_DWORD *)&v362[26] = v39;
      *(_WORD *)v363 = 2048;
      *(void *)&v363[2] = v63;
      _os_log_impl(&dword_1D1805000, v61, OS_LOG_TYPE_INFO, "Curated Items: feederCount:%ld durationBased:%d maximumNumberOfItems:%ld includeAllFaces:%d clustersCount:%ld", buf, 0x2Cu);
    }

    if (*((unsigned char *)v357 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v362 = 302;
        *(_WORD *)&v362[4] = 2080;
        *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Curation/PGCurator.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      double v15 = MEMORY[0x1E4F1CBF0];
      goto LABEL_94;
    }
    if (![v226 count])
    {
      uint64_t v67 = [(PGCurator *)v236 defaultItemSortDescriptors];
      double v15 = [v18 sortedArrayUsingDescriptors:v67];

LABEL_94:
      goto LABEL_95;
    }
    uint64_t v64 = +[PGCurationManager assetsBeautifier];
    [v64 setIdentifiersOfRequiredItems:v241];
    [v64 setIdentifiersOfEligibleItems:v232];
    [v64 setDiscardNonEligibleClustersInSampling:v232 != 0];
    [v64 setEnableIntermediateNaturalClustering:v229];
    [v64 setEnableFinalNaturalClustering:v229];
    id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v217 = v39;
    int v218 = v40;
    if (v40)
    {
      id v221 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

      id v223 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v66 = v226;
    }
    else
    {
      uint64_t v66 = v226;
      id v221 = 0;
      id v223 = 0;
    }
    uint64_t v333 = 0;
    v334 = &v333;
    uint64_t v335 = 0x2020000000;
    uint64_t v336 = 0;
    uint64_t v327 = 0;
    v328 = &v327;
    uint64_t v329 = 0x3032000000;
    v330 = __Block_byref_object_copy__10726;
    v331 = __Block_byref_object_dispose__10727;
    id v332 = 0;
    uint64_t v321 = 0;
    v322 = &v321;
    uint64_t v323 = 0x3032000000;
    v324 = __Block_byref_object_copy__10726;
    v325 = __Block_byref_object_dispose__10727;
    id v326 = 0;
    uint64_t v68 = objc_alloc_init(PGUnfairLock);
    size_t v69 = [v66 count];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_213;
    block[3] = &unk_1E68E5C00;
    id v70 = v66;
    id v304 = v70;
    id v71 = v234;
    id v313 = v71;
    uint64_t v319 = 0x3F847AE147AE147BLL;
    v314 = &v352;
    v315 = &v356;
    v219 = v68;
    v305 = v219;
    v306 = v236;
    id v220 = v64;
    id v307 = v220;
    id v72 = v237;
    id v308 = v72;
    id v73 = v240;
    id v309 = v73;
    id v230 = v65;
    id v310 = v230;
    char v320 = v218;
    id v224 = v223;
    id v311 = v224;
    v316 = &v333;
    id v222 = v221;
    id v312 = v222;
    v317 = &v327;
    v318 = &v321;
    dispatch_apply(v69, 0, block);
    v226 = v66;
    if (*((unsigned char *)v357 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_92:
        double v15 = MEMORY[0x1E4F1CBF0];
LABEL_93:

        _Block_object_dispose(&v321, 8);
        _Block_object_dispose(&v327, 8);

        _Block_object_dispose(&v333, 8);
        goto LABEL_94;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v362 = 372;
      *(_WORD *)&v362[4] = 2080;
      *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Curation/PGCurator.m";
      uint64_t v74 = MEMORY[0x1E4F14500];
LABEL_91:
      _os_log_impl(&dword_1D1805000, v74, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_92;
    }
    v211 = v70;
    v214 = v72;
    v215 = v73;
    v216 = (void (**)(void, void, double))v71;
    int v76 = v217;
    if ([v18 count])
    {
      uint64_t v77 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v18];
      long long v301 = 0u;
      long long v302 = 0u;
      long long v299 = 0u;
      long long v300 = 0u;
      id v78 = v230;
      uint64_t v79 = [v78 countByEnumeratingWithState:&v299 objects:v368 count:16];
      if (v79)
      {
        uint64_t v80 = *(void *)v300;
LABEL_104:
        uint64_t v81 = 0;
        while (1)
        {
          if (*(void *)v300 != v80) {
            objc_enumerationMutation(v78);
          }
          [v77 removeObject:*(void *)(*((void *)&v299 + 1) + 8 * v81)];
          if (![v77 count]) {
            break;
          }
          if (v79 == ++v81)
          {
            uint64_t v79 = [v78 countByEnumeratingWithState:&v299 objects:v368 count:16];
            if (v79) {
              goto LABEL_104;
            }
            break;
          }
        }
      }

      int v76 = v217;
      if ([v77 count])
      {
        uint64_t v82 = [v77 allObjects];
        [v78 addObjectsFromArray:v82];

        if (v218)
        {
          id v83 = [v77 allObjects];
          [v222 addObjectsFromArray:v83];

          uint64_t v84 = [v77 count];
          v334[3] += v84;
        }
      }
    }
    uint64_t v85 = (void (**)(void, void, double))v71;
    int v86 = [v230 count];
    unint64_t v87 = [v224 count];
    if (v87)
    {
      if (v87 >= [v211 count])
      {
        LODWORD(v87) = 0;
      }
      else
      {
        int v212 = v86;
        uint64_t v88 = v236->_loggingConnection;
        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          uint64_t v89 = v334[3];
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v362 = v87;
          *(_WORD *)&v362[4] = 1024;
          *(_DWORD *)&v362[6] = v89;
          _os_log_impl(&dword_1D1805000, v88, OS_LOG_TYPE_INFO, "DurationEvaluation: Initiating second pass with %d clusters, already have %d items", buf, 0xEu);
        }

        int v90 = v76;
        unint64_t v91 = v225 - v334[3];
        v294[0] = MEMORY[0x1E4F143A8];
        v294[1] = 3221225472;
        v294[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_216;
        v294[3] = &unk_1E68F03F8;
        v92 = v216;
        id v295 = v92;
        v296 = &v352;
        uint64_t v298 = 0x3F847AE147AE147BLL;
        v297 = &v356;
        v93 = [v231 adaptiveElection:v224 identifiersOfEligibleItems:v232 maximumNumberOfItemsToElect:v91 debugInfo:v214 progressBlock:v294];
        size_t v94 = [v93 count];
        v281[0] = MEMORY[0x1E4F143A8];
        v281[1] = 3221225472;
        v281[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_2_217;
        v281[3] = &unk_1E68E5C28;
        v290 = v92;
        v282 = v219;
        v291 = &v352;
        uint64_t v293 = 0x3F847AE147AE147BLL;
        v292 = &v356;
        id v95 = v93;
        id v283 = v95;
        v284 = v236;
        id v285 = v220;
        id v286 = v214;
        id v287 = v215;
        id v96 = v230;
        id v288 = v96;
        id v97 = v222;
        id v289 = v97;
        dispatch_apply(v94, 0, v281);
        id v230 = v97;

        int v76 = v90;
        int v98 = *((unsigned __int8 *)v357 + 24);
        if (*((unsigned char *)v357 + 24))
        {
          id v99 = MEMORY[0x1E4F14500];
          id v100 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 430;
            *(_WORD *)&v362[4] = 2080;
            *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        int v86 = v212;
        if (v98) {
          goto LABEL_92;
        }
        LODWORD(v87) = 1;
        uint64_t v85 = v216;
      }
    }
    if (v218)
    {
      if (v234)
      {
        double v101 = CFAbsoluteTimeGetCurrent();
        if (v101 - v353[3] >= 0.01)
        {
          v353[3] = v101;
          char v280 = 0;
          ((void (**)(void, char *, double))v85)[2](v85, &v280, 0.5);
          char v102 = *((unsigned char *)v357 + 24) | v280;
          *((unsigned char *)v357 + 24) = v102;
          if (v102)
          {
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
              goto LABEL_92;
            }
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 440;
            *(_WORD *)&v362[4] = 2080;
            *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            uint64_t v74 = MEMORY[0x1E4F14500];
            goto LABEL_91;
          }
        }
      }
      int v228 = v87;
      int v213 = v86;
      uint64_t v111 = [(PGCurator *)v236 defaultItemSortDescriptors];
      v112 = [v230 sortedArrayUsingDescriptors:v111];

      long long v278 = 0u;
      long long v279 = 0u;
      long long v276 = 0u;
      long long v277 = 0u;
      v113 = v112;
      uint64_t v114 = [v113 countByEnumeratingWithState:&v276 objects:v367 count:16];
      id v115 = v26;
      unint64_t v116 = 0;
      uint64_t v117 = 0;
      uint64_t v118 = 0;
      if (v114)
      {
        uint64_t v119 = *(void *)v277;
        double v120 = *MEMORY[0x1E4F8E740];
        do
        {
          for (uint64_t k = 0; k != v114; ++k)
          {
            if (*(void *)v277 != v119) {
              objc_enumerationMutation(v113);
            }
            long long v122 = *(void **)(*((void *)&v276 + 1) + 8 * k);
            [v122 clsContentScore];
            if (v123 >= v120)
            {
              ++v116;
              if ([v122 isVideo]) {
                ++v118;
              }
              else {
                ++v117;
              }
            }
          }
          uint64_t v114 = [v113 countByEnumeratingWithState:&v276 objects:v367 count:16];
        }
        while (v114);
      }

      id v26 = v115;
      long long v124 = v236->_loggingConnection;
      if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        *(void *)v362 = v116;
        *(_WORD *)&v362[8] = 2048;
        *(void *)&v362[10] = v117;
        *(_WORD *)&v362[18] = 2048;
        *(void *)&v362[20] = v118;
        _os_log_impl(&dword_1D1805000, v124, OS_LOG_TYPE_INFO, "DurationEvaluation: elected %lu items, %lu photos, %lu videos", buf, 0x20u);
      }

      long long v125 = v236->_loggingConnection;
      if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
      {
        int v126 = [v238 count];
        if (v228)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%d after second pass", -[NSObject count](v113, "count"));
          long long v127 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          long long v127 = @"no second pass";
        }
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v362 = v126;
        *(_WORD *)&v362[4] = 1024;
        *(_DWORD *)&v362[6] = v225;
        *(_WORD *)&v362[10] = 1024;
        *(_DWORD *)&v362[12] = v213;
        *(_WORD *)&v362[16] = 2112;
        *(void *)&v362[18] = v127;
        _os_log_impl(&dword_1D1805000, v125, OS_LOG_TYPE_INFO, "DurationEvaluation: %d total assets, was aiming for %d elected assets, got %d after first pass, %@", buf, 0x1Eu);
        if (v228) {
      }
        }
      unint64_t v143 = [v215 minimumNumberOfItems];
      [(PGCurator *)v236 evaluatedDurationWithItems:v113 options:v215];
      uint64_t v145 = v144;
      [(PGCurator *)v236 maximumDurationWithItems:v113 options:v215];
      double v147 = v146;
      [v215 minimumDuration];
      double v149 = v148;
      BOOL v150 = v116 >= v143;
      BOOL v151 = v148 <= 0.0;
      if (v147 >= v148) {
        BOOL v151 = 1;
      }
      BOOL v153 = v150 && v151;
      BOOL v152 = !v150 || !v151;
      v154 = @"didn't pass";
      if (!v152) {
        v154 = @"passed";
      }
      v155 = v154;
      v156 = v236->_loggingConnection;
      if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
      {
        [v215 targetDuration];
        *(_DWORD *)buf = 134219266;
        *(void *)v362 = v145;
        *(_WORD *)&v362[8] = 2048;
        *(double *)&v362[10] = v147;
        *(_WORD *)&v362[18] = 2112;
        *(void *)&v362[20] = v155;
        *(_WORD *)&v362[28] = 2048;
        *(double *)v363 = v149;
        *(_WORD *)&v363[8] = 2048;
        uint64_t v364 = v157;
        __int16 v365 = 1024;
        int v366 = v143;
        _os_log_impl(&dword_1D1805000, v156, OS_LOG_TYPE_INFO, "DurationEvaluation: %.2f sec. (max %.2f sec.), %@ constraint [%.2f, %.2f, %d items]", buf, 0x3Au);
      }

      if (!v153 && [v215 failIfMinimumDurationNotReached])
      {

        v113 = MEMORY[0x1E4F1CBF0];
      }
LABEL_272:

      if (!v234
        || (double v207 = CFAbsoluteTimeGetCurrent(), v207 - v353[3] < 0.01)
        || (v353[3] = v207,
            char v280 = 0,
            ((void (**)(void, char *, double))v216)[2](v216, &v280, 1.0),
            char v208 = *((unsigned char *)v357 + 24) | v280,
            (*((unsigned char *)v357 + 24) = v208) == 0))
      {
        double v15 = v113;

        goto LABEL_93;
      }
      v209 = MEMORY[0x1E4F14500];
      id v210 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v209, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v362 = 649;
        *(_WORD *)&v362[4] = 2080;
        *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Curation/PGCurator.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

      goto LABEL_92;
    }
    if (v227 == 20 || v227 == 2)
    {
      uint64_t v103 = [v239 universalStartDate];
      uint64_t v104 = [v239 universalEndDate];
      [v104 timeIntervalSinceDate:v103];
      double v106 = v105;
      [(id)v322[5] timeIntervalSinceDate:v328[5]];
      double v108 = v107;
      if (v234)
      {
        double v109 = CFAbsoluteTimeGetCurrent();
        if (v109 - v353[3] >= 0.01)
        {
          v353[3] = v109;
          char v280 = 0;
          ((void (**)(void, char *, double))v85)[2](v85, &v280, 0.5);
          char v110 = *((unsigned char *)v357 + 24) | v280;
          *((unsigned char *)v357 + 24) = v110;
          if (v110)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v362 = 487;
              *(_WORD *)&v362[4] = 2080;
              *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurator.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            double v15 = MEMORY[0x1E4F1CBF0];
LABEL_196:

            goto LABEL_93;
          }
        }
      }
      if (v108 <= v106 * 0.05)
      {
        [v214 resetWithReason:@"All clustered items span insufficient"];
        long long v136 = (void *)[v215 copy];
        long long v137 = v136;
        if (v227 == 2) {
          uint64_t v138 = 4;
        }
        else {
          uint64_t v138 = 21;
        }
        [v136 setDuration:v138];
        v271[0] = MEMORY[0x1E4F143A8];
        v271[1] = 3221225472;
        v271[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_235;
        v271[3] = &unk_1E68F03F8;
        v272 = v85;
        v273 = &v352;
        uint64_t v275 = 0x3F847AE147AE147BLL;
        v274 = &v356;
        long long v139 = [(PGCurator *)v236 bestItemsForFeeder:v239 options:v137 debugInfo:v214 progressBlock:v271];
        long long v140 = v139;
        if (*((unsigned char *)v357 + 24))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 497;
            *(_WORD *)&v362[4] = 2080;
            *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          double v15 = MEMORY[0x1E4F1CBF0];
        }
        else
        {
          double v15 = v139;
        }

        goto LABEL_196;
      }

      uint64_t v85 = v216;
    }
    if (v76)
    {
      id v128 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v269 = 0u;
      long long v270 = 0u;
      long long v267 = 0u;
      long long v268 = 0u;
      id v129 = v238;
      uint64_t v130 = [v129 countByEnumeratingWithState:&v267 objects:v360 count:16];
      if (v130)
      {
        uint64_t v131 = *(void *)v268;
        do
        {
          for (uint64_t m = 0; m != v130; ++m)
          {
            if (*(void *)v268 != v131) {
              objc_enumerationMutation(v129);
            }
            long long v133 = [*(id *)(*((void *)&v267 + 1) + 8 * m) clsPersonAndPetLocalIdentifiers];
            [v128 addObjectsFromArray:v133];
          }
          uint64_t v130 = [v129 countByEnumeratingWithState:&v267 objects:v360 count:16];
        }
        while (v130);
      }

      if (v234)
      {
        double v134 = CFAbsoluteTimeGetCurrent();
        if (v134 - v353[3] >= 0.01)
        {
          v353[3] = v134;
          char v280 = 0;
          ((void (**)(void, char *, double))v216)[2](v216, &v280, 0.5);
          char v135 = *((unsigned char *)v357 + 24) | v280;
          *((unsigned char *)v357 + 24) = v135;
          if (v135)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v362 = 512;
              *(_WORD *)&v362[4] = 2080;
              *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurator.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_92;
          }
        }
      }
      v262[0] = MEMORY[0x1E4F143A8];
      v262[1] = 3221225472;
      v262[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_236;
      v262[3] = &unk_1E68F03F8;
      v263 = v216;
      v264 = &v352;
      uint64_t v266 = 0x3F847AE147AE147BLL;
      v265 = &v356;
      [(PGCurator *)v236 completeItems:v230 withItems:v129 forPersonLocalIdentifiers:v128 options:v215 nonRemovableItems:0 debugInfo:v214 progressBlock:v262];
      if (*((unsigned char *)v357 + 24))
      {
        long long v141 = MEMORY[0x1E4F14500];
        id v142 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v362 = 518;
          *(_WORD *)&v362[4] = 2080;
          *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurator.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        goto LABEL_92;
      }

      uint64_t v85 = v216;
    }
    if (v234)
    {
      double v158 = CFAbsoluteTimeGetCurrent();
      if (v158 - v353[3] >= 0.01)
      {
        v353[3] = v158;
        char v280 = 0;
        ((void (**)(void, char *, double))v85)[2](v85, &v280, 0.5);
        char v159 = *((unsigned char *)v357 + 24) | v280;
        *((unsigned char *)v357 + 24) = v159;
        if (v159)
        {
          v160 = MEMORY[0x1E4F14500];
          id v161 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 521;
            *(_WORD *)&v362[4] = 2080;
            *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_92;
        }
      }
    }
    uint64_t v162 = [v230 count];
    unint64_t v163 = v225 - v162;
    if (v225 != v162)
    {
      v257[0] = MEMORY[0x1E4F143A8];
      v257[1] = 3221225472;
      v257[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_237;
      v257[3] = &unk_1E68F03F8;
      v258 = v85;
      v259 = &v352;
      v260 = &v356;
      uint64_t v261 = 0x3F847AE147AE147BLL;
      [(PGCurator *)v236 completeItems:v230 withFavoriteItemsFromItems:v238 upToNumberOfItems:v163 debugInfo:v214 progressBlock:v257];

      uint64_t v85 = v216;
    }
    if (v234)
    {
      double v164 = CFAbsoluteTimeGetCurrent();
      if (v164 - v353[3] >= 0.01)
      {
        v353[3] = v164;
        char v280 = 0;
        ((void (**)(void, char *, double))v85)[2](v85, &v280, 0.5);
        char v165 = *((unsigned char *)v357 + 24) | v280;
        *((unsigned char *)v357 + 24) = v165;
        if (v165)
        {
          v166 = MEMORY[0x1E4F14500];
          id v167 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 531;
            *(_WORD *)&v362[4] = 2080;
            *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_211:

          goto LABEL_92;
        }
      }
    }
    [(PGCurator *)v236 lastPassToCompleteItems:v230 fromFeeder:v239 options:v215 maximumNumberOfItems:v225 debugInfo:v214];
    if (v234)
    {
      double v168 = CFAbsoluteTimeGetCurrent();
      if (v168 - v353[3] >= 0.01)
      {
        v353[3] = v168;
        char v280 = 0;
        ((void (**)(void, char *, double))v85)[2](v85, &v280, 0.5);
        char v169 = *((unsigned char *)v357 + 24) | v280;
        *((unsigned char *)v357 + 24) = v169;
        if (v169)
        {
          v170 = MEMORY[0x1E4F14500];
          id v171 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v170, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 535;
            *(_WORD *)&v362[4] = 2080;
            *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_211;
        }
        uint64_t v85 = v216;
      }
    }
    v252[0] = MEMORY[0x1E4F143A8];
    v252[1] = 3221225472;
    v252[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_238;
    v252[3] = &unk_1E68F03F8;
    id v172 = v85;
    v253 = (__CFString *)v172;
    v254 = &v352;
    v255 = &v356;
    uint64_t v256 = 0x3F847AE147AE147BLL;
    v173 = [(PGCurator *)v236 deduplicatedItems:v230 options:v215 debugInfo:v214 progressBlock:v252];
    v174 = v173;
    if (*((unsigned char *)v357 + 24))
    {
      v113 = MEMORY[0x1E4F14500];
      id v175 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v362 = 540;
        *(_WORD *)&v362[4] = 2080;
        *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Curation/PGCurator.m";
        _os_log_impl(&dword_1D1805000, v113, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_222;
    }
    unint64_t v176 = [v173 count];
    if (v176 > v225)
    {
      id v177 = v174;
      uint64_t v178 = [(id)objc_opt_class() numberOfItemsToShaveOffWithNumberOfItems:v176 maximumNumberOfItems:v225 options:v215];
      if (v178)
      {
        v179 = [(PGCurator *)v236 shaveItems:v177 downToNumberOfItems:v176 - v178 options:v215 debugInfo:0 progressBlock:&__block_literal_global_10748];
        if (v214)
        {
          v180 = [MEMORY[0x1E4F1CA80] setWithArray:v177];
          v181 = [MEMORY[0x1E4F1CAD0] setWithArray:v179];
          [v180 minusSet:v181];

          [v214 setState:2 ofItems:v180 withReason:@"Last minute shaving"];
        }
        id v182 = v179;

        v183 = v236->_loggingConnection;
        if (os_log_type_enabled(v183, OS_LOG_TYPE_INFO))
        {
          uint64_t v184 = [v182 count];
          *(_DWORD *)buf = 134217984;
          *(void *)v362 = v184;
          _os_log_impl(&dword_1D1805000, v183, OS_LOG_TYPE_INFO, "Shaved down to %lu items", buf, 0xCu);
        }
      }
      else
      {
        id v182 = v177;
      }

      goto LABEL_270;
    }
    int v185 = 0;
    v113 = 0;
    if (v227 > 19)
    {
      if (v227 == 21) {
        goto LABEL_244;
      }
      if (v227 != 20) {
        goto LABEL_245;
      }
    }
    else if (v227 != 2)
    {
      if (v227 != 4) {
        goto LABEL_245;
      }
      goto LABEL_244;
    }
    unint64_t v186 = [v174 count];
    unint64_t v187 = +[PGCurationManager minimumNumberOfItemsForDuration:v227 withMaximumNumberOfItems:v225];
    if (v186 < v187)
    {
      v188 = [NSString stringWithFormat:@"Not enough best items for Short curation, %lu for a minimum of %lu, switching to Complete Short", v186, v187];
      [v214 resetWithReason:v188];
      v189 = (void *)[v215 copy];
      v190 = v189;
      if (v227 == 2) {
        uint64_t v191 = 4;
      }
      else {
        uint64_t v191 = 21;
      }
      [v189 setDuration:v191];
      v247[0] = MEMORY[0x1E4F143A8];
      v247[1] = 3221225472;
      v247[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_246;
      v247[3] = &unk_1E68F03F8;
      id v248 = v172;
      v249 = &v352;
      v250 = &v356;
      uint64_t v251 = 0x3F847AE147AE147BLL;
      v113 = [(PGCurator *)v236 bestItemsForFeeder:v239 options:v190 debugInfo:v214 progressBlock:v247];
      if (*((unsigned char *)v357 + 24))
      {
        v192 = MEMORY[0x1E4F14500];
        id v193 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v362 = 607;
          *(_WORD *)&v362[4] = 2080;
          *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGCurator.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        goto LABEL_222;
      }

      int v185 = 0;
LABEL_245:
      if (v234)
      {
        double v194 = CFAbsoluteTimeGetCurrent();
        if (v194 - v353[3] >= 0.01)
        {
          v353[3] = v194;
          char v280 = 0;
          (*((void (**)(id, char *, double))v172 + 2))(v172, &v280, 0.5);
          char v195 = *((unsigned char *)v357 + 24) | v280;
          *((unsigned char *)v357 + 24) = v195;
          if (v195)
          {
            v196 = MEMORY[0x1E4F14500];
            id v197 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v362 = 615;
              *(_WORD *)&v362[4] = 2080;
              *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGCurator.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_222;
          }
        }
      }
      if (v185 && (unint64_t v198 = [v174 count], v198 < v32) && v198 + 2 >= v32)
      {
        v199 = [NSString stringWithFormat:@"Almost all items included in curation (%lu out of %lu), falling back to beautification", v198, v32];
        [v214 resetWithReason:v199];
        v242[0] = MEMORY[0x1E4F143A8];
        v242[1] = 3221225472;
        v242[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_250;
        v242[3] = &unk_1E68F03F8;
        id v243 = v172;
        v244 = &v352;
        v245 = &v356;
        uint64_t v246 = 0x3F847AE147AE147BLL;
        id v182 = [v220 performWithItems:v238 maximumNumberOfItemsToChoose:v225 debugInfo:v214 progressBlock:v242];

        if (*((unsigned char *)v357 + 24))
        {
          v200 = MEMORY[0x1E4F14500];
          id v201 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v200, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v362 = 632;
            *(_WORD *)&v362[4] = 2080;
            *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Curation/PGCurator.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          goto LABEL_265;
        }
      }
      else
      {
        id v182 = v174;
      }
      if (!v234
        || (double v202 = CFAbsoluteTimeGetCurrent(), v202 - v353[3] < 0.01)
        || (v353[3] = v202,
            char v280 = 0,
            (*((void (**)(id, char *, double))v172 + 2))(v172, &v280, 0.5),
            char v203 = *((unsigned char *)v357 + 24) | v280,
            (*((unsigned char *)v357 + 24) = v203) == 0))
      {
        if (v113)
        {
LABEL_271:

          v155 = v253;
          goto LABEL_272;
        }
LABEL_270:
        v206 = [(PGCurator *)v236 defaultItemSortDescriptors];
        v113 = [v182 sortedArrayUsingDescriptors:v206];

        goto LABEL_271;
      }
      v204 = MEMORY[0x1E4F14500];
      id v205 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v362 = 636;
        *(_WORD *)&v362[4] = 2080;
        *(void *)&v362[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Curation/PGCurator.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }

LABEL_265:
      v174 = v182;
LABEL_222:

      goto LABEL_92;
    }
LABEL_244:
    v113 = 0;
    int v185 = 1;
    goto LABEL_245;
  }
  double v15 = MEMORY[0x1E4F1CBF0];
LABEL_97:

  uint64_t v10 = (void (**)(void *, void *, double))v234;
LABEL_98:
  _Block_object_dispose(&v352, 8);
  _Block_object_dispose(&v356, 8);

  return v15;
}

uint64_t __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 clsIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_213(uint64_t a1, uint64_t a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v4 = *(void **)(a1 + 104);
  if (v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [*(id *)(a1 + 40) lock];
    uint64_t v6 = *(void *)(*(void *)(a1 + 112) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 152))
    {
      *(double *)(v6 + 24) = Current;
      char v51 = 0;
      (*(void (**)(double))(*(void *)(a1 + 104) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8)
                                                                             + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24))
      {
        [*(id *)(a1 + 40) unlock];
        goto LABEL_30;
      }
    }
    [*(id *)(a1 + 40) unlock];
    uint64_t v4 = *(void **)(a1 + 104);
  }
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_2_214;
  v46[3] = &unk_1E68E5BD8;
  id v48 = v4;
  id v47 = *(id *)(a1 + 40);
  uint64_t v50 = *(void *)(a1 + 152);
  long long v49 = *(_OWORD *)(a1 + 112);
  uint64_t v10 = [v7 summarizedItemsFromCluster:v3 withBeautifier:v8 debugInfo:v9 progressBlock:v46];
  [*(id *)(a1 + 40) lock];
  LODWORD(v7) = *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) == 0;
  [*(id *)(a1 + 40) unlock];
  if (v7)
  {
    char v12 = *(void **)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 72);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_3;
    v42[3] = &unk_1E68F03F8;
    id v43 = *(id *)(a1 + 104);
    uint64_t v45 = *(void *)(a1 + 152);
    long long v44 = *(_OWORD *)(a1 + 112);
    uint64_t v11 = [v12 deduplicatedItems:v10 options:v13 debugInfo:v14 progressBlock:v42];

    [*(id *)(a1 + 40) lock];
    LODWORD(v13) = *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) == 0;
    [*(id *)(a1 + 40) unlock];
    if (v13)
    {
      id v15 = *(id *)(a1 + 80);
      objc_sync_enter(v15);
      int v16 = [v3 cluster];
      uint64_t v17 = [v16 objects];

      if (*(unsigned char *)(a1 + 160))
      {
        unint64_t v18 = [v3 numberOfItemsToElect];
        if ([v11 count] < v18 || objc_msgSend(v17, "count") <= v18)
        {
          *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) += [v11 count];
          [*(id *)(a1 + 96) addObjectsFromArray:v11];
        }
        else
        {
          id v19 = *(void **)(a1 + 88);
          uint64_t v20 = [v3 cluster];
          [v19 addObject:v20];
        }
      }
      [*(id *)(a1 + 80) addObjectsFromArray:v11];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v21 = v17;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v52 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v39 != v23) {
              objc_enumerationMutation(v21);
            }
            long long v25 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "cls_universalDate", (void)v38);
            uint64_t v26 = *(void *)(*(void *)(a1 + 136) + 8);
            uint64_t v27 = *(void **)(v26 + 40);
            if (v27)
            {
              uint64_t v28 = [v27 earlierDate:v25];
              uint64_t v29 = *(void *)(*(void *)(a1 + 136) + 8);
              int v30 = *(void **)(v29 + 40);
              *(void *)(v29 + 40) = v28;
            }
            else
            {
              id v31 = v25;
              int v30 = *(void **)(v26 + 40);
              *(void *)(v26 + 40) = v31;
            }

            uint64_t v32 = *(void *)(*(void *)(a1 + 144) + 8);
            v33 = *(void **)(v32 + 40);
            if (v33)
            {
              uint64_t v34 = [v33 laterDate:v25];
              uint64_t v35 = *(void *)(*(void *)(a1 + 144) + 8);
              uint64_t v36 = *(void **)(v35 + 40);
              *(void *)(v35 + 40) = v34;
            }
            else
            {
              id v37 = v25;
              uint64_t v36 = *(void **)(v32 + 40);
              *(void *)(v32 + 40) = v37;
            }
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v52 count:16];
        }
        while (v22);
      }

      objc_sync_exit(v15);
    }
  }
  else
  {
    uint64_t v11 = v10;
  }

LABEL_30:
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_216(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_2_217(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 96))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [*(id *)(a1 + 32) lock];
    uint64_t v5 = *(void *)(*(void *)(a1 + 104) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 120))
    {
      *(double *)(v5 + 24) = Current;
      char v29 = 0;
      (*(void (**)(double))(*(void *)(a1 + 96) + 16))(0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8)
                                                                             + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
      {
        [*(id *)(a1 + 32) unlock];
        return;
      }
    }
    [*(id *)(a1 + 32) unlock];
  }
  uint64_t v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_3_218;
  v24[3] = &unk_1E68E5BD8;
  id v26 = *(id *)(a1 + 96);
  id v25 = *(id *)(a1 + 32);
  uint64_t v28 = *(void *)(a1 + 120);
  long long v27 = *(_OWORD *)(a1 + 104);
  uint64_t v10 = [v7 summarizedItemsFromCluster:v6 withBeautifier:v8 debugInfo:v9 progressBlock:v24];
  [*(id *)(a1 + 32) lock];
  LODWORD(v7) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
  [*(id *)(a1 + 32) unlock];
  if (v7)
  {
    uint64_t v11 = v10;
  }
  else
  {
    char v12 = *(void **)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 72);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_4;
    uint64_t v20 = &unk_1E68F03F8;
    id v21 = *(id *)(a1 + 96);
    uint64_t v23 = *(void *)(a1 + 120);
    long long v22 = *(_OWORD *)(a1 + 104);
    uint64_t v11 = [v12 deduplicatedItems:v10 options:v13 debugInfo:v14 progressBlock:&v17];

    objc_msgSend(*(id *)(a1 + 32), "lock", v17, v18, v19, v20);
    int v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
    [*(id *)(a1 + 32) unlock];
    if (!v15)
    {
      id v16 = *(id *)(a1 + 80);
      objc_sync_enter(v16);
      [*(id *)(a1 + 88) addObjectsFromArray:v11];
      objc_sync_exit(v16);
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_235(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_236(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_237(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_238(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_246(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_250(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

uint64_t __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_3_218(uint64_t result, unsigned char *a2, double a3)
{
  if (*(void *)(result + 40))
  {
    uint64_t v5 = result;
    double Current = CFAbsoluteTimeGetCurrent();
    [*(id *)(v5 + 32) lock];
    uint64_t v7 = *(void *)(*(void *)(v5 + 48) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(v5 + 64))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(v5 + 40) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(v5 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(v5 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(v5 + 56) + 8) + 24)) {
        *a2 = 1;
      }
    }
    return [*(id *)(v5 + 32) unlock];
  }
  return result;
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_4(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

uint64_t __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_2_214(uint64_t result, unsigned char *a2, double a3)
{
  if (*(void *)(result + 40))
  {
    uint64_t v5 = result;
    double Current = CFAbsoluteTimeGetCurrent();
    [*(id *)(v5 + 32) lock];
    uint64_t v7 = *(void *)(*(void *)(v5 + 48) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(v5 + 64))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(v5 + 40) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(v5 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(v5 + 56) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(v5 + 56) + 8) + 24)) {
        *a2 = 1;
      }
    }
    return [*(id *)(v5 + 32) unlock];
  }
  return result;
}

void __64__PGCurator_bestItemsForFeeder_options_debugInfo_progressBlock___block_invoke_3(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.0 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)summarizedItemsFromCluster:(id)a3 withBeautifier:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v13 numberOfItemsToElect];
  int v15 = [v13 cluster];
  id v16 = [v15 objects];

  uint64_t v17 = [v13 cluster];

  uint64_t v18 = [v11 debugInfoForCluster:v17];

  id v19 = [v12 performWithItems:v16 maximumNumberOfItemsToChoose:v14 debugInfo:v18 progressBlock:v10];

  loggingConnectiouint64_t n = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
  {
    long long v22 = loggingConnection;
    int v23 = 134218496;
    uint64_t v24 = [v16 count];
    __int16 v25 = 2048;
    uint64_t v26 = v14;
    __int16 v27 = 2048;
    uint64_t v28 = [v19 count];
    _os_log_debug_impl(&dword_1D1805000, v22, OS_LOG_TYPE_DEBUG, "Curated Items: summarize cluster of %lu items, expected to elect %lu, got %lu", (uint8_t *)&v23, 0x20u);
  }
  return v19;
}

- (double)maximumDurationWithItems:(id)a3 options:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v12 isVideo])
        {
          [v12 clsDuration];
        }
        else if ([v12 clsIsInterestingLivePhoto])
        {
          [v6 defaultDurationOfLivePhoto];
        }
        else
        {
          [v6 defaultDurationOfStillPhoto];
        }
        double v10 = v10 + v13;
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)evaluatedDurationWithItems:(id)a3 options:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v12 isVideo])
        {
          [v6 defaultDurationOfVideo];
          double v14 = v13;
          [v12 clsDuration];
          if (v14 < v15) {
            double v15 = v14;
          }
        }
        else if ([v12 clsIsInterestingLivePhoto])
        {
          [v6 defaultDurationOfLivePhoto];
        }
        else
        {
          [v6 defaultDurationOfStillPhoto];
        }
        double v10 = v10 + v15;
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (unint64_t)targetDurationBasedNumberOfItemsToElectFromItems:(id)a3 options:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 uuidsOfEligibleAssets];
  [v7 targetDuration];
  double v10 = v9;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v34 = self;
    uint64_t v35 = v7;
    unint64_t v14 = 0;
    unint64_t v36 = 0;
    unint64_t v37 = 0;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v39;
    double v17 = *MEMORY[0x1E4F8E740];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v11);
        }
        long long v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (v8)
        {
          long long v20 = [*(id *)(*((void *)&v38 + 1) + 8 * i) clsIdentifier];
          int v21 = [v8 containsObject:v20];

          if (!v21) {
            continue;
          }
        }
        objc_msgSend(v19, "clsContentScore", v34);
        if (v22 >= v17)
        {
          ++v15;
          if ([v19 isVideo])
          {
            ++v14;
          }
          else if ([v19 clsIsInterestingLivePhoto])
          {
            ++v37;
          }
          else
          {
            ++v36;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v13);

    self = v34;
    id v7 = v35;
    if (v15)
    {
      double v23 = v10 * (double)v15;
      [v35 defaultDurationOfStillPhoto];
      double v25 = v24;
      [v35 defaultDurationOfLivePhoto];
      double v27 = v26 * (double)v37 + v25 * (double)v36;
      [v35 defaultDurationOfVideo];
      unint64_t v29 = vcvtad_u64_f64(v23 / (v27 + v28 * (double)v14));
      if (v15 >= v29) {
        unint64_t v30 = v29;
      }
      else {
        unint64_t v30 = v15;
      }
      loggingConnectiouint64_t n = v34->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134219008;
        unint64_t v43 = v30;
        __int16 v44 = 2048;
        unint64_t v45 = v15;
        __int16 v46 = 2048;
        unint64_t v47 = v36;
        __int16 v48 = 2048;
        unint64_t v49 = v37;
        __int16 v50 = 2048;
        unint64_t v51 = v14;
        _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "targetNumberOfItemsToElect = %lu for %lu eligible items, %lu still photos, %lu live photos, %lu videos", buf, 0x34u);
      }
      goto LABEL_26;
    }
  }
  else
  {
  }
  uint64_t v32 = self->_loggingConnection;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "targetNumberOfItemsToElect = 0 because all items are non-eligible", buf, 2u);
  }
  unint64_t v30 = 0;
LABEL_26:

  return v30;
}

- (id)focusedItemsInItems:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 personLocalIdentifiersToFocus];
  char v8 = [v6 focusOnInterestingItems];

  uint64_t v9 = [v7 count];
  if ((v8 & 1) != 0 || v9)
  {
    id v11 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __45__PGCurator_focusedItemsInItems_withOptions___block_invoke;
    double v17 = &unk_1E68E5B88;
    char v19 = v8;
    BOOL v20 = v9 != 0;
    id v18 = v7;
    uint64_t v12 = [v11 predicateWithBlock:&v14];
    double v10 = objc_msgSend(v5, "filteredArrayUsingPredicate:", v12, v14, v15, v16, v17);
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

uint64_t __45__PGCurator_focusedItemsInItems_withOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 40))
  {
    [v5 clsContentScore];
    if (v7 < *MEMORY[0x1E4F8E748]
      && ([v5 clsIsInhabited] & 1) == 0
      && ![v5 clsHasInterestingScenes])
    {
      uint64_t v9 = 0;
      goto LABEL_15;
    }
    unsigned int v8 = [v5 clsIsUtility] ^ 1;
  }
  else
  {
    unsigned int v8 = 1;
  }
  if (*(unsigned char *)(a1 + 41)) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }
  if (*(unsigned char *)(a1 + 41)) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = [v5 clsPersonAndPetLocalIdentifiers];
    uint64_t v14 = [v12 setWithArray:v13];
    uint64_t v9 = [v11 intersectsSet:v14];
  }
LABEL_15:

  return v9;
}

- (PGCurator)init
{
  v5.receiver = self;
  v5.super_class = (Class)PGCurator;
  v2 = [(PGCurator *)&v5 init];
  id v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_loggingConnection, MEMORY[0x1E4F14500]);
  }
  return v3;
}

+ (unint64_t)numberOfItemsToShaveOffWithNumberOfItems:(unint64_t)a3 maximumNumberOfItems:(unint64_t)a4 options:(id)a5
{
  if (a3 >= a4) {
    return a3 - a4;
  }
  else {
    return 0;
  }
}

+ (unint64_t)maximumNumberOfItemsToElectWithTotalNumberOfItems:(unint64_t)a3 spanningNumberOfDays:(double)a4 options:(id)a5
{
  uint64_t v7 = [a5 duration];
  return +[PGCurationManager maximumNumberOfItemsForDuration:v7 withTotalNumberOfItems:a3 spanningNumberOfDays:a4];
}

@end