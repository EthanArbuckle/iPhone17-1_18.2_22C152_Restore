@interface PGKeyCurator
- (BOOL)cluster:(id)a3 isBetterThanCluster:(id)a4 forMemories:(BOOL)a5 allowGuestAsset:(BOOL)a6;
- (BOOL)cluster:(id)a3 scoresBetterThanCluster:(id)a4;
- (BOOL)item:(id)a3 passesCriteria:(id)a4 score:(double *)a5;
- (BOOL)scoreLevelOfCluster:(id)a3 isAboveScoreLevelOfCluster:(id)a4;
- (PGKeyCurator)initWithCurationCriteriaFactory:(id)a3;
- (id)_keyItemInItems:(id)a3 options:(id)a4 criteria:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7;
- (id)bestItemIdentifierWithItems:(id)a3 options:(id)a4 debugInfo:(id *)a5 criteria:(id)a6 curationOptions:(id)a7;
- (id)bestItemInItems:(id)a3 options:(id)a4 criteria:(id)a5 minimumCriteriaScore:(double)a6 triedAndFailedToDoBetter:(BOOL *)a7;
- (id)bestItemInItems:(id)a3 options:(id)a4 criteria:(id)a5 minimumCriteriaScore:(double)a6 useIconicScore:(BOOL)a7;
- (id)clusterWithSubclusters:(id)a3 keyItem:(id)a4;
- (id)itemsByIconicScoreBucketWithItems:(id)a3;
- (id)keyItemIdentifierWithItems:(id)a3 options:(id)a4 debugInfo:(id *)a5;
- (id)keyItemInItems:(id)a3 options:(id)a4 criteria:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7;
- (id)keyItemWithFeeder:(id)a3 options:(id)a4 criteria:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7;
@end

@implementation PGKeyCurator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationCriteriaFactory, 0);
  objc_storeStrong((id *)&self->_similarStacker, 0);
  objc_storeStrong((id *)&self->_beautifier, 0);
}

- (id)bestItemInItems:(id)a3 options:(id)a4 criteria:(id)a5 minimumCriteriaScore:(double)a6 triedAndFailedToDoBetter:(BOOL *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v54 = v12;
  v15 = [(CLSAssetsBeautifier *)self->_beautifier bestItemInItems:v12];
  if (v15)
  {
    uint64_t v16 = [v13 isForMemories];
    uint64_t v17 = [v13 allowGuestAsset];
    v66[0] = 1.0;
    if (v14) {
      int v18 = ![(PGKeyCurator *)self item:v15 passesCriteria:v14 score:v66];
    }
    else {
      int v18 = 0;
    }
    int v53 = [v15 clsAvoidIfPossibleAsKeyItemForMemories:v16 allowGuestAsset:v17];
    int v19 = [v13 wantsGoodSquareCropScore];
    char v50 = v16;
    if (v19 && [v15 clsPeopleCount])
    {
      [v15 clsSquareCropScore];
      BOOL v21 = v20 < *MEMORY[0x1E4F8E758];
    }
    else
    {
      BOOL v21 = 0;
    }
    int v51 = [v13 promoteAutoplayableItems];
    char v49 = v17;
    v22 = a7;
    if (v51)
    {
      [v15 clsAutoplaySuggestionScore];
      BOOL v24 = v23 <= 0.71;
    }
    else
    {
      BOOL v24 = 0;
    }
    v25 = self;
    if (v18)
    {

      v15 = 0;
    }
    if (v66[0] < a6) {
      int v26 = 1;
    }
    else {
      int v26 = v18;
    }
    unint64_t v27 = objc_msgSend(v54, "count", v66[0]);
    int v28 = v27 > 1;
    if (v27 < 2) {
      int v29 = 1;
    }
    else {
      int v29 = v26;
    }
    int v30 = v53;
    if (!(v29 | v53)) {
      int v28 = v24 || v21;
    }
    if (v28 == 1)
    {
      int v52 = v26;
      v31 = v22;
      if (v22) {
        BOOL *v22 = 1;
      }
      id v32 = v54;
      v33 = v32;
      p_isa = (id *)&v25->super.isa;
      if (v14 || v19)
      {
        v36 = (void *)MEMORY[0x1E4F28F60];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __95__PGKeyCurator_bestItemInItems_options_criteria_minimumCriteriaScore_triedAndFailedToDoBetter___block_invoke;
        v61[3] = &unk_1E68EA268;
        char v65 = v19;
        id v62 = v14;
        v63 = v25;
        double v64 = a6;
        v37 = [v36 predicateWithBlock:v61];
        v35 = [v33 filteredArrayUsingPredicate:v37];

        int v30 = v53;
      }
      else
      {
        v35 = v32;
      }
      if (v51)
      {
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __95__PGKeyCurator_bestItemInItems_options_criteria_minimumCriteriaScore_triedAndFailedToDoBetter___block_invoke_2;
        v58[3] = &__block_descriptor_34_e49_B24__0___CLSInvestigationItem__8__NSDictionary_16l;
        char v59 = v50;
        char v60 = v49;
        v38 = [MEMORY[0x1E4F28F60] predicateWithBlock:v58];
        v39 = [v35 filteredArrayUsingPredicate:v38];

        if ([v39 count])
        {
          id v40 = [p_isa[1] bestItemInItems:v39];

          int v30 = v53;
          if (v40) {
            goto LABEL_41;
          }
        }
        else
        {

          int v30 = v53;
        }
      }
      if ((v52 | v30 | v21) == 1)
      {
        v48 = v31;
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __95__PGKeyCurator_bestItemInItems_options_criteria_minimumCriteriaScore_triedAndFailedToDoBetter___block_invoke_3;
        v55[3] = &__block_descriptor_34_e49_B24__0___CLSInvestigationItem__8__NSDictionary_16l;
        char v56 = v50;
        char v57 = v49;
        v41 = [MEMORY[0x1E4F28F60] predicateWithBlock:v55];
        v42 = [v35 filteredArrayUsingPredicate:v41];

        if ([v42 count])
        {
          id v40 = [p_isa[1] bestItemInItems:v42];

          v31 = v48;
          int v30 = v53;
          if (v40) {
            goto LABEL_41;
          }
        }
        else
        {

          v31 = v48;
          int v30 = v53;
        }
      }
      if ((v52 | v21) != 1)
      {
        id v40 = 0;
        goto LABEL_53;
      }
      id v40 = [p_isa[1] bestItemInItems:v35];
      if (!v40)
      {
LABEL_53:

        goto LABEL_54;
      }
LABEL_41:
      if (v14 && ([p_isa item:v40 passesCriteria:v14 score:v66] | v52) != 1) {
        goto LABEL_53;
      }
      int v43 = v30 | v52 | v21;
      if ((v43 & 1) == 0 && ((v51 ^ 1) & 1) == 0)
      {
        [v40 clsContentScore];
        double v44 = *MEMORY[0x1E4F8E738];
        if (v45 < *MEMORY[0x1E4F8E738])
        {
          [v15 clsContentScore];
          if (v46 >= v44) {
            goto LABEL_53;
          }
        }
LABEL_50:
        id v40 = v40;

        if (v31) {
          BOOL *v31 = 0;
        }
        v15 = v40;
        goto LABEL_53;
      }
      if (v43) {
        goto LABEL_50;
      }
      goto LABEL_53;
    }
  }
LABEL_54:

  return v15;
}

BOOL __95__PGKeyCurator_bestItemInItems_options_criteria_minimumCriteriaScore_triedAndFailedToDoBetter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v11 = 0.0;
  if (*(unsigned char *)(a1 + 56))
  {
    if ([v5 clsPeopleCount])
    {
      [v5 clsSquareCropScore];
      if (v7 < *MEMORY[0x1E4F8E758]) {
        goto LABEL_7;
      }
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (!v8)
  {
    BOOL v9 = 1;
    goto LABEL_9;
  }
  if (![*(id *)(a1 + 40) item:v5 passesCriteria:v8 score:&v11]) {
LABEL_7:
  }
    BOOL v9 = 0;
  else {
    BOOL v9 = v11 >= *(double *)(a1 + 48);
  }
LABEL_9:

  return v9;
}

BOOL __95__PGKeyCurator_bestItemInItems_options_criteria_minimumCriteriaScore_triedAndFailedToDoBetter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 clsAvoidIfPossibleAsKeyItemForMemories:*(unsigned __int8 *)(a1 + 32) allowGuestAsset:*(unsigned __int8 *)(a1 + 33)])
  {
    BOOL v4 = 0;
  }
  else
  {
    [v3 clsAutoplaySuggestionScore];
    BOOL v4 = v5 > 0.71;
  }

  return v4;
}

uint64_t __95__PGKeyCurator_bestItemInItems_options_criteria_minimumCriteriaScore_triedAndFailedToDoBetter___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 clsAvoidIfPossibleAsKeyItemForMemories:*(unsigned __int8 *)(a1 + 32) allowGuestAsset:*(unsigned __int8 *)(a1 + 33)] ^ 1;
}

- (id)bestItemInItems:(id)a3 options:(id)a4 criteria:(id)a5 minimumCriteriaScore:(double)a6 useIconicScore:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v7)
  {
    unsigned int v47 = [v12 promoteAutoplayableItems];
    if ([v12 promoteAutoplayableItems]) {
      uint64_t v14 = [v12 avoidPromotingAutoplayableItemsWhenUsingIconicScore] ^ 1;
    }
    else {
      uint64_t v14 = 0;
    }
    id v45 = v13;
    [v12 setPromoteAutoplayableItems:v14];
    id v46 = v11;
    char v50 = [(PGKeyCurator *)self itemsByIconicScoreBucketWithItems:v11];
    double v44 = [v50 allKeys];
    uint64_t v16 = [v44 sortedArrayUsingSelector:sel_compare_];
    uint64_t v17 = [v16 reverseObjectEnumerator];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = v17;
    uint64_t v18 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      BOOL v51 = 0;
      id v15 = 0;
      uint64_t v49 = *(void *)v55;
LABEL_8:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v55 != v49) {
          objc_enumerationMutation(obj);
        }
        BOOL v21 = *(void **)(*((void *)&v54 + 1) + 8 * v20);
        if (![v21 intValue]) {
          break;
        }
        v22 = [v50 objectForKeyedSubscript:v21];
        char v53 = 0;
        double v23 = [(PGKeyCurator *)self bestItemInItems:v22 options:v12 criteria:0 minimumCriteriaScore:&v53 triedAndFailedToDoBetter:a6];
        BOOL v24 = v23;
        if (v23)
        {
          v25 = [v23 curationModel];
          int v26 = [v25 iconicScoreModel];

          unint64_t v27 = [v15 curationModel];
          int v28 = [v27 iconicScoreModel];

          [v26 similarIconicScoreThreshold];
          double v30 = v29;
          uint64_t v31 = [v26 version];
          uint64_t v32 = [v28 version];
          [v15 clsIconicScore];
          double v34 = v33;
          [v24 clsIconicScore];
          double v36 = v35;
          [v24 clsContentScore];
          double v38 = v37;
          [v15 clsContentScore];
          if (!v15 || v51 && v53 == 0 || v53 == v51 && v31 == v32 && v34 - v36 <= v30 && v38 - v39 >= 0.05)
          {
            id v40 = v24;

            BOOL v51 = v53 != 0;
            id v15 = v40;
          }
        }
        if (v19 == ++v20)
        {
          uint64_t v19 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
          if (v19) {
            goto LABEL_8;
          }
          break;
        }
      }
    }
    else
    {
      BOOL v51 = 0;
      id v15 = 0;
    }

    [v12 setPromoteAutoplayableItems:v47];
    if (v15 && !v51)
    {
      id v15 = v15;

      v41 = v15;
      id v13 = v45;
      id v11 = v46;
      goto LABEL_32;
    }

    id v13 = v45;
    id v11 = v46;
  }
  else
  {
    id v15 = 0;
  }
  char v53 = 0;
  v41 = [(PGKeyCurator *)self bestItemInItems:v11 options:v12 criteria:v13 minimumCriteriaScore:&v53 triedAndFailedToDoBetter:a6];
  if (v53 && v15)
  {
    id v42 = v15;

    v41 = v42;
  }
LABEL_32:

  return v41;
}

- (id)itemsByIconicScoreBucketWithItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "clsIconicScore", (void)v18);
        double v12 = v11;
        id v13 = [v10 curationModel];
        uint64_t v14 = [v13 iconicScoreModel];

        id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "bucketForIconicScore:", v12));
        id v16 = [v4 objectForKeyedSubscript:v15];
        if (!v16)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v4 setObject:v16 forKeyedSubscript:v15];
        }
        [v16 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)cluster:(id)a3 isBetterThanCluster:(id)a4 forMemories:(BOOL)a5 allowGuestAsset:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  double v12 = [v10 keyItem];
  int v13 = [v12 clsAvoidIfPossibleAsKeyItemForMemories:v7 allowGuestAsset:v6];

  uint64_t v14 = [v11 keyItem];
  int v15 = [v14 clsAvoidIfPossibleAsKeyItemForMemories:v7 allowGuestAsset:v6];

  BOOL v16 = (v13 & 1) == 0 && v15
     || (v13 ^ 1 | v15) == 1
     && [(PGKeyCurator *)self cluster:v10 scoresBetterThanCluster:v11];

  return v16;
}

- (BOOL)cluster:(id)a3 scoresBetterThanCluster:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 subclusters];
  unint64_t v9 = [v8 count];

  id v10 = [v7 subclusters];
  unint64_t v11 = [v10 count];

  if (v9 <= v11)
  {
    [v6 score];
    double v14 = v13;
    [v7 score];
    BOOL v17 = v14 < v15 || v9 < v11 >> 1;
    if (v9 < (3 * v11) >> 2 || v14 <= v15)
    {
      LOBYTE(v12) = !v17
                 && [(PGKeyCurator *)self scoreLevelOfCluster:v6 isAboveScoreLevelOfCluster:v7];
    }
    else
    {
      long long v18 = [v6 keyItem];
      [v18 clsContentScore];
      double v20 = v19;
      long long v21 = [v7 keyItem];
      [v21 clsContentScore];
      LOBYTE(v12) = v20 > v22;
      char v23 = v20 > v22 || v17;
      if ((v23 & 1) == 0) {
        LOBYTE(v12) = [(PGKeyCurator *)self scoreLevelOfCluster:v6 isAboveScoreLevelOfCluster:v7];
      }
    }
  }
  else
  {
    BOOL v12 = ![(PGKeyCurator *)self cluster:v7 scoresBetterThanCluster:v6];
  }

  return v12;
}

- (BOOL)scoreLevelOfCluster:(id)a3 isAboveScoreLevelOfCluster:(id)a4
{
  id v5 = (BOOL (**)(double, double))ContentScoreLevelIsBetterThanOtherContentScoreLevel;
  id v6 = a4;
  id v7 = [a3 keyItem];
  [v7 clsContentScore];
  double v9 = v8;
  id v10 = [v6 keyItem];

  [v10 clsContentScore];
  LOBYTE(v5) = v5[2](v9, v11);

  return (char)v5;
}

- (id)clusterWithSubclusters:(id)a3 keyItem:(id)a4
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
        [*(id *)(*((void *)&v15 + 1) + 8 * i) score];
        double v10 = v10 + v12;
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }
  double v13 = -[PGKeyCuratorCluster initWithSubclusters:keyItem:score:]([PGKeyCuratorCluster alloc], "initWithSubclusters:keyItem:score:", v5, v6, v10 / (double)(unint64_t)[v5 count]);

  return v13;
}

- (BOOL)item:(id)a3 passesCriteria:(id)a4 score:(double *)a5
{
  return [a4 passesForItem:a3 score:a5];
}

- (id)_keyItemInItems:(id)a3 options:(id)a4 criteria:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  id v11 = a4;
  id v12 = a5;
  id v75 = a6;
  id v65 = a7;
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x2020000000;
  char v118 = 0;
  uint64_t v111 = 0;
  v112 = (double *)&v111;
  uint64_t v113 = 0x2020000000;
  uint64_t v114 = 0;
  v66 = (void (**)(void *, unsigned char *, double))_Block_copy(v65);
  if (v66)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v112[3] >= 0.01)
    {
      v112[3] = Current;
      char v110 = 0;
      v66[2](v66, &v110, 0.0);
      char v14 = *((unsigned char *)v116 + 24) | v110;
      *((unsigned char *)v116 + 24) = v14;
      if (v14)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 284;
          __int16 v126 = 2080;
          v127 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curat"
                 "ion/PGKeyCurator.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_9;
      }
    }
  }
  uint64_t v15 = [v67 count];
  if (!v15)
  {
LABEL_9:
    long long v16 = 0;
    goto LABEL_10;
  }
  if (v15 == 1)
  {
    long long v16 = [v67 firstObject];
  }
  else
  {
    if ([v11 complete]) {
      uint64_t v18 = 4;
    }
    else {
      uint64_t v18 = 2;
    }
    double v19 = +[PGCurationManager summaryClusteringForDuration:v18];
    [v19 setDiffuseDensityClusteringMaximumDistance:28800.0];
    [v19 setConciseDensityClusteringMaximumDistance:2700.0];
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __73__PGKeyCurator__keyItemInItems_options_criteria_debugInfo_progressBlock___block_invoke;
    v105[3] = &unk_1E68F03F8;
    v73 = v66;
    id v106 = v73;
    v107 = &v111;
    uint64_t v109 = 0x3F847AE147AE147BLL;
    v108 = &v115;
    double v64 = v19;
    uint64_t v20 = [v19 densityClustersWithItems:v67 progressBlock:v105];
    long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v20, "count"));
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id obj = v20;
    uint64_t v22 = [obj countByEnumeratingWithState:&v101 objects:v124 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v102;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v102 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = [MEMORY[0x1E4F8A788] clusterWithObjects:*(void *)(*((void *)&v101 + 1) + 8 * i)];
          [v21 addObject:v25];
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v101 objects:v124 count:16];
      }
      while (v22);
    }

    [v75 setClusters:v21 withReason:@"Summarizer"];
    if ([v11 useIconicScore])
    {
      int v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"iconicScoreBucket" ascending:0];
      v123[0] = v26;
      unint64_t v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
      v123[1] = v27;
      int v28 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"keyItem.clsIdentifier" ascending:0];
      v123[2] = v28;
      v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:3];
    }
    else
    {
      int v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
      v122[0] = v26;
      unint64_t v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"keyItem.clsIdentifier" ascending:0];
      v122[1] = v27;
      v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:2];
    }

    unsigned int v70 = [v11 isForMemories];
    unsigned int v69 = [v11 allowGuestAsset];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v68 = v21;
    uint64_t v74 = [v68 countByEnumeratingWithState:&v97 objects:v121 count:16];
    if (v74)
    {
      v76 = 0;
      uint64_t v71 = *(void *)v98;
      do
      {
        for (uint64_t j = 0; j != v74; ++j)
        {
          if (*(void *)v98 != v71) {
            objc_enumerationMutation(v68);
          }
          double v29 = *(void **)(*((void *)&v97 + 1) + 8 * j);
          v82 = [v75 debugInfoForCluster:v29];
          similarStacker = self->_similarStacker;
          uint64_t v31 = [v29 objects];
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __73__PGKeyCurator__keyItemInItems_options_criteria_debugInfo_progressBlock___block_invoke_2;
          v92[3] = &unk_1E68F03F8;
          v93 = v73;
          v94 = &v111;
          uint64_t v96 = 0x3F847AE147AE147BLL;
          v95 = &v115;
          uint64_t v32 = [(CLSSimilarStacker *)similarStacker stackSimilarItems:v31 withSimilarity:0 timestampSupport:0 progressBlock:v92];

          double v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v32, "count"));
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          id v34 = v32;
          uint64_t v35 = [v34 countByEnumeratingWithState:&v88 objects:v120 count:16];
          if (v35)
          {
            uint64_t v36 = *(void *)v89;
            do
            {
              for (uint64_t k = 0; k != v35; ++k)
              {
                if (*(void *)v89 != v36) {
                  objc_enumerationMutation(v34);
                }
                double v38 = [MEMORY[0x1E4F8A788] clusterWithObjects:*(void *)(*((void *)&v88 + 1) + 8 * k)];
                [v33 addObject:v38];
              }
              uint64_t v35 = [v34 countByEnumeratingWithState:&v88 objects:v120 count:16];
            }
            while (v35);
          }

          [v82 setClusters:v33 withReason:@"Stack Similar"];
          v80 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v34, "count"));
          v81 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v34, "count"));
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          id v79 = v34;
          uint64_t v39 = [v79 countByEnumeratingWithState:&v84 objects:v119 count:16];
          if (v39)
          {
            uint64_t v40 = *(void *)v85;
            double v41 = 0.0;
            do
            {
              for (uint64_t m = 0; m != v39; ++m)
              {
                if (*(void *)v85 != v40) {
                  objc_enumerationMutation(v79);
                }
                uint64_t v43 = *(void *)(*((void *)&v84 + 1) + 8 * m);
                double v44 = -[PGKeyCurator bestItemInItems:options:criteria:minimumCriteriaScore:useIconicScore:](self, "bestItemInItems:options:criteria:minimumCriteriaScore:useIconicScore:", v43, v11, v12, [v11 useIconicScore], 0.0);
                if (v44)
                {
                  *(double *)buf = 0.0;
                  [(PGKeyCurator *)self item:v44 passesCriteria:v12 score:buf];
                  [v81 addObject:v44];
                  if (v12)
                  {
                    double v45 = *(double *)buf;
                    [v44 clsContentScore];
                    double v47 = (v45 + v46) * 0.5;
                  }
                  else
                  {
                    [v44 clsContentScore];
                    double v47 = v49;
                  }
                  if ([v11 useIconicScore])
                  {
                    [v44 clsIconicScore];
                    double v51 = v50;
                    int v52 = [v44 curationModel];
                    char v53 = [v52 iconicScoreModel];

                    [v53 minimumMeaningfulIconicScore];
                    if (v51 < v54) {
                      double v55 = 0.0;
                    }
                    else {
                      double v55 = v51;
                    }
                    uint64_t v56 = [v53 bucketForIconicScore:v55];
                  }
                  else
                  {
                    uint64_t v56 = 0;
                  }
                  long long v57 = [[PGKeyCuratorSubcluster alloc] initWithItems:v43 keyItem:v44 score:v56 iconicScoreBucket:v47];
                  [v80 addObject:v57];
                  double v58 = *(double *)buf;
                  [v82 dedupItems:v43 toItem:v44 withDedupingType:1];
                  if (!v12) {
                    double v58 = -0.0;
                  }

                  double v41 = v41 + v58;
                }
                else
                {
                  v48 = [MEMORY[0x1E4F1CAD0] setWithArray:v43];
                  [v82 setState:2 ofItems:v48 withReason:@"No key item"];
                }
              }
              uint64_t v39 = [v79 countByEnumeratingWithState:&v84 objects:v119 count:16];
            }
            while (v39);
          }
          else
          {
            double v41 = 0.0;
          }

          unint64_t v59 = [v81 count];
          if (v59) {
            double v41 = v41 / (double)v59;
          }
          char v60 = -[PGKeyCurator bestItemInItems:options:criteria:minimumCriteriaScore:useIconicScore:](self, "bestItemInItems:options:criteria:minimumCriteriaScore:useIconicScore:", v81, v11, v12, [v11 useIconicScore], fmin(v41, 0.5));
          [v82 setState:3 ofItem:v60 withReason:@"Key item in subcluster"];
          [v80 sortUsingDescriptors:v72];
          v61 = [(PGKeyCurator *)self clusterWithSubclusters:v80 keyItem:v60];
          id v62 = v76;
          if (!v76
            || (id v62 = v76,
                [(PGKeyCurator *)self cluster:v61 isBetterThanCluster:v76 forMemories:v70 allowGuestAsset:v69]))
          {
            id v63 = v61;

            v76 = v63;
          }
        }
        uint64_t v74 = [v68 countByEnumeratingWithState:&v97 objects:v121 count:16];
      }
      while (v74);
    }
    else
    {
      v76 = 0;
    }

    long long v16 = [v76 keyItem];
    if (v16) {
      [v75 forceState:4 ofItem:v16 withReason:@"Key item in town"];
    }
  }
LABEL_10:
  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(&v115, 8);

  return v16;
}

void __73__PGKeyCurator__keyItemInItems_options_criteria_debugInfo_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
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

void __73__PGKeyCurator__keyItemInItems_options_criteria_debugInfo_progressBlock___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
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

- (id)bestItemIdentifierWithItems:(id)a3 options:(id)a4 debugInfo:(id *)a5 criteria:(id)a6 curationOptions:(id)a7
{
  id v12 = a4;
  double v13 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v14 = a7;
  id v15 = a6;
  id v16 = a3;
  id v17 = objc_alloc_init(v13);
  id v18 = objc_alloc_init(MEMORY[0x1E4F8E778]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __87__PGKeyCurator_bestItemIdentifierWithItems_options_debugInfo_criteria_curationOptions___block_invoke;
  v26[3] = &unk_1E68EBF78;
  id v19 = v18;
  id v27 = v19;
  id v20 = v12;
  id v28 = v20;
  id v21 = v17;
  id v29 = v21;
  [v16 enumerateKeysAndObjectsUsingBlock:v26];

  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F76C78]) initWithItems:v21];
  uint64_t v23 = [(PGKeyCurator *)self keyItemInItems:v21 options:v14 criteria:v15 debugInfo:v22 progressBlock:0];

  if (a5)
  {
    *a5 = [v22 dictionaryRepresentationWithAppendExtraItemInfoBlock:0];
  }
  BOOL v24 = [v23 clsIdentifier];

  return v24;
}

void __87__PGKeyCurator_bestItemIdentifierWithItems_options_debugInfo_criteria_curationOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  id v10 = [v5 curationModelForItemInfo:v7 options:v6];
  uint64_t v9 = +[PGCuratorInvestigationItem itemWithUUID:v8 itemInfo:v7 curationModel:v10];

  [*(id *)(a1 + 48) addObject:v9];
}

- (id)keyItemIdentifierWithItems:(id)a3 options:(id)a4 debugInfo:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  id v12 = objc_alloc_init(MEMORY[0x1E4F8E778]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __61__PGKeyCurator_keyItemIdentifierWithItems_options_debugInfo___block_invoke;
  v25[3] = &unk_1E68EBF78;
  id v13 = v12;
  id v26 = v13;
  id v14 = v8;
  id v27 = v14;
  id v15 = v11;
  id v28 = v15;
  [v10 enumerateKeysAndObjectsUsingBlock:v25];

  id v16 = [v14 objectForKeyedSubscript:@"useSummarizer"];

  if (v16) {
    id v17 = [[PGKeyAssetCurationOptions alloc] initWithDictionaryRepresentation:v14];
  }
  else {
    id v17 = objc_alloc_init(PGKeyAssetCurationOptions);
  }
  id v18 = v17;
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F76C78]) initWithItems:v15];
  id v20 = [v14 objectForKeyedSubscript:@"meaningForCriteria"];
  if (v20)
  {
    id v21 = [(PGCurationCriteriaFactory *)self->_curationCriteriaFactory curationCriteriaWithCollection:0 meaningLabel:v20 inGraph:0 client:0];
  }
  else
  {
    id v21 = 0;
  }
  uint64_t v22 = [(PGKeyCurator *)self keyItemInItems:v15 options:v18 criteria:v21 debugInfo:v19 progressBlock:0];
  if (a5)
  {
    *a5 = [v19 dictionaryRepresentationWithAppendExtraItemInfoBlock:0];
  }
  uint64_t v23 = [v22 clsIdentifier];

  return v23;
}

void __61__PGKeyCurator_keyItemIdentifierWithItems_options_debugInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  id v10 = [v5 curationModelForItemInfo:v7 options:v6];
  uint64_t v9 = +[PGCuratorInvestigationItem itemWithUUID:v8 itemInfo:v7 curationModel:v10];

  [*(id *)(a1 + 48) addObject:v9];
}

- (id)keyItemInItems:(id)a3 options:(id)a4 criteria:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (![v12 count])
  {
    id v17 = 0;
    goto LABEL_10;
  }
  id v17 = [(PGKeyCurator *)self _keyItemInItems:v12 options:v13 criteria:v14 debugInfo:v15 progressBlock:v16];
  if (v17) {
    goto LABEL_10;
  }
  if (([v13 complete] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Couldn't find a key item with complete == NO, retrying with complete == YES", (uint8_t *)&buf, 2u);
    }
    [v15 resetWithReason:@"Couldn't find a key item with complete == NO, retrying with complete == YES"];
    [v13 setComplete:1];
    id v17 = [(PGKeyCurator *)self _keyItemInItems:v12 options:v13 criteria:v14 debugInfo:v15 progressBlock:v16];
    [v13 setComplete:0];
    if (v17)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
      id v18 = [v17 clsIdentifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      id v19 = MEMORY[0x1E4F14500];
      id v20 = "Found '%@' as key item with complete == YES";
      goto LABEL_52;
    }
  }
  double v55 = self;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Couldn't find a key item with complete == YES, try and use the highest content scoring non-utility item, or the if none the highest aesthetic scoring utility item", (uint8_t *)&buf, 2u);
  }
  id v52 = v16;
  char v53 = v15;
  [v15 resetWithReason:@"Couldn't find a key item with complete == YES, try and use the highest content scoring non-utility item, or the if none the highest aesthetic scoring utility item"];
  uint64_t v22 = [v13 isForMemories];
  uint64_t v23 = [v13 allowGuestAsset];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v24 = v12;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    id obj = v24;
    id v50 = v13;
    id v51 = v12;
    id v27 = 0;
    id v28 = 0;
    uint64_t v29 = *(void *)v57;
    double v30 = 0.0;
    double v31 = 0.0;
    double v32 = 0.0;
    double v33 = 0.0;
    double v34 = 0.0;
    double v35 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v57 != v29) {
          objc_enumerationMutation(obj);
        }
        double v37 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        long long buf = 0uLL;
        double v61 = 0.0;
        objc_msgSend(v37, "clsContentScore", v50, v51);
        *(void *)&long long buf = v38;
        if (!v14
          || [(PGKeyCurator *)v55 item:v37 passesCriteria:v14 score:(char *)&buf + 8])
        {
          [v37 clsAestheticScore];
          double v61 = v39;
          if ([v37 clsAvoidIfPossibleAsKeyItemForMemories:v22 allowGuestAsset:v23])
          {
            if (!v27
              || (*((BOOL (**)(double, double, double, double, double, double))ItemScoreIsBetterThanOtherItemScore
                  + 2))(*(double *)&buf, *((double *)&buf + 1), v61, v33, v34, v35))
            {
              id v40 = v37;

              double v34 = *((double *)&buf + 1);
              double v33 = *(double *)&buf;
              id v27 = v40;
              double v35 = v61;
            }
          }
          else if (!v28 {
                 || (*((BOOL (**)(double, double, double, double, double, double))ItemScoreIsBetterThanOtherItemScore
          }
                     + 2))(*(double *)&buf, *((double *)&buf + 1), v61, v30, v31, v32))
          {
            id v41 = v37;

            double v31 = *((double *)&buf + 1);
            double v30 = *(double *)&buf;
            id v28 = v41;
            double v32 = v61;
          }
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v26);
    id v42 = obj;

    uint64_t v43 = (double *)MEMORY[0x1E4F8E750];
    id v17 = v28;
    if (v28)
    {
      double v44 = *MEMORY[0x1E4F8E750];
      if (v30 != *MEMORY[0x1E4F8E750] || v33 <= v44)
      {
        double v33 = v30;
        id v13 = v50;
        id v12 = v51;
        goto LABEL_40;
      }
    }
    id v46 = v27;

    id v13 = v50;
    id v12 = v51;
    if (v46)
    {
      double v44 = *v43;
      id v17 = v46;
LABEL_40:
      id v15 = v53;
      if (v33 <= v44)
      {
        [v53 chooseItem:v17 inItems:obj withReason:@"Key utility item"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          double v47 = [v17 clsIdentifier];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v47;
          v48 = MEMORY[0x1E4F14500];
          double v49 = "Found utility item '%@' for key item";
          goto LABEL_55;
        }
      }
      else
      {
        [v53 chooseItem:v17 inItems:obj withReason:@"Key non-utility item"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          double v47 = [v17 clsIdentifier];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v47;
          v48 = MEMORY[0x1E4F14500];
          double v49 = "Found non-utility item '%@' for key item";
LABEL_55:
          _os_log_impl(&dword_1D1805000, v48, OS_LOG_TYPE_INFO, v49, (uint8_t *)&buf, 0xCu);
        }
      }

      id v16 = v52;
      goto LABEL_10;
    }
  }
  else
  {

    id v42 = v24;
  }
  id v16 = v52;
  id v15 = v53;
  if (!v14) {
    goto LABEL_59;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Couldn't find a key item with criteria, retrying without criteria", (uint8_t *)&buf, 2u);
  }
  [v53 resetWithReason:@"Couldn't find a key item with criteria, retrying without criteria"];
  id v17 = [(PGKeyCurator *)v55 keyItemInItems:v42 options:v13 criteria:0 debugInfo:v53 progressBlock:v52];
  if (!v17)
  {
LABEL_59:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Couldn't find anything although we have items, this should never happen", (uint8_t *)&buf, 2u);
    }
    id v17 = [v42 firstObject];
    [v53 chooseItem:v17 inItems:v42 withReason:@"At least it's an item"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v18 = [v17 clsIdentifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      id v19 = MEMORY[0x1E4F14500];
      id v20 = "Found '%@' item for key item";
LABEL_52:
      _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, v20, (uint8_t *)&buf, 0xCu);
    }
  }
LABEL_10:

  return v17;
}

- (id)keyItemWithFeeder:(id)a3 options:(id)a4 criteria:(id)a5 debugInfo:(id)a6 progressBlock:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = [a3 allItems];
  id v17 = [(PGKeyCurator *)self keyItemInItems:v16 options:v15 criteria:v14 debugInfo:v13 progressBlock:v12];

  return v17;
}

- (PGKeyCurator)initWithCurationCriteriaFactory:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PGKeyCurator;
  uint64_t v6 = [(PGKeyCurator *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F76C48]) initWithSimilarityModelClass:objc_opt_class()];
    beautifier = v6->_beautifier;
    v6->_beautifier = (CLSAssetsBeautifier *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F76DA0]) initWithSimilarityModelClass:objc_opt_class()];
    similarStacker = v6->_similarStacker;
    v6->_similarStacker = (CLSSimilarStacker *)v9;

    objc_storeStrong((id *)&v6->_curationCriteriaFactory, a3);
  }

  return v6;
}

@end