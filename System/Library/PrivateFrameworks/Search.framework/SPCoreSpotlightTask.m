@interface SPCoreSpotlightTask
- (id)_docIDsToResultsDictionaryForSection:(id)a3;
- (id)rankBatch:(id)a3 withRanker:(id)a4 withBundle:(id)a5 clientBundle:(id)a6 maxCount:(int64_t)a7 userQuery:(id)a8 queryID:(int64_t)a9 rankingConfiguration:(id)a10 isCJK:(BOOL)a11 isKeyboardCJK:(BOOL)a12 privateQuery:(BOOL)a13 collectL2Signals:(BOOL)a14;
- (id)selectFromBatch:(id)a3 withBundle:(id)a4 rankCount:(unint64_t)a5 maxCount:(unint64_t)a6 userQuery:(id)a7 queryID:(int64_t)a8 isCJK:(BOOL)a9 clientBundle:(id)a10 isKeyboardCJK:(BOOL)a11 currentTime:(double)a12;
- (void)_filterDuplicateiCloudDriveResultsForSection:(id)a3 iCloudDriveSection:(id)a4 iCloudDriveResultsDictionary:(id)a5;
- (void)enumerateTopHitResultsByBundle:(id)a3 addingToItems:(id)a4 withHandler:(id)a5;
- (void)filterItemsForL2:(id)a3 rankCount:(int64_t)a4 rankingConfiguration:(id)a5;
- (void)filterRankedItems:(id)a3 maxCount:(int64_t)a4 bundle:(id)a5 userQuery:(id)a6 queryID:(int64_t)a7 privateQuery:(BOOL)a8 rankingConfiguration:(id)a9 currentTime:(double)a10 clientBundle:(id)a11 ranker:(id)a12;
@end

@implementation SPCoreSpotlightTask

- (id)_docIDsToResultsDictionaryForSection:(id)a3
{
  id v4 = a3;
  if ([(SPCoreSpotlightTask *)self canceled])
  {
    v5 = 0;
  }
  else
  {
    v5 = +[NSMutableDictionary dictionary];
    if (v4)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      v6 = objc_msgSend(v4, "resultSet", 0);
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v15;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            v12 = [v11 documentIdentifier];
            if (v12) {
              [v5 setObject:v11 forKeyedSubscript:v12];
            }
          }
          id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }
    }
  }

  return v5;
}

- (void)_filterDuplicateiCloudDriveResultsForSection:(id)a3 iCloudDriveSection:(id)a4 iCloudDriveResultsDictionary:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v7 && a3 != v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = objc_msgSend(a3, "resultSet", 0);
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v13) documentIdentifier];
          long long v15 = [v8 objectForKeyedSubscript:v14];
          if (v15)
          {
            os_unfair_lock_lock(&stru_1000A8EE4);
            [v7 removeResults:v15];
            os_unfair_lock_unlock(&stru_1000A8EE4);
          }

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (void)enumerateTopHitResultsByBundle:(id)a3 addingToItems:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v26 = a4;
  v25 = (void (**)(id, void *, void *, void *))a5;
  if (([(SPCoreSpotlightTask *)self canceled] & 1) == 0)
  {
    [v8 sortWithOptions:1 usingComparator:&stru_1000931E8];
    uint64_t v9 = objc_opt_new();
    id v10 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v24 = v8;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      id v13 = v12;
      long long v14 = 0;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v11);
          }
          long long v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (v14
            && ([*(id *)(*((void *)&v27 + 1) + 8 * i) bundleID],
                long long v18 = objc_claimAutoreleasedReturnValue(),
                unsigned int v19 = [v14 isEqualToString:v18],
                v18,
                !v19))
          {
            v25[2](v25, v14, v10, v9);
            [v10 removeAllObjects];
            [v9 removeAllObjects];
            uint64_t v23 = [v17 bundleID];

            v22 = [v17 rankingItem];
            [v9 addObject:v22];
            long long v14 = (void *)v23;
          }
          else
          {
            v20 = objc_msgSend(v17, "rankingItem", v24);
            [v9 addObject:v20];

            v21 = [v17 rankingItem];
            [v26 addObject:v21];

            [v17 bundleID];
            long long v14 = v22 = v14;
          }

          [v10 addObject:v17];
        }
        id v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }
    else
    {
      long long v14 = 0;
    }

    if ([v9 count])
    {
      v25[2](v25, v14, v10, v9);
      [v10 removeAllObjects];
      [v9 removeAllObjects];
    }

    id v8 = v24;
  }
}

- (void)filterItemsForL2:(id)a3 rankCount:(int64_t)a4 rankingConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (([(SPCoreSpotlightTask *)self canceled] & 1) == 0)
  {
    id v10 = [v9 dominantRankingQueryCount];
    id v11 = [v9 dominatedRankingQueryCount];
    id v12 = [v9 rankingBitCount];
    if (((v12 - v10) & 0x40) != 0) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = -1 << (v12 - v10);
    }
    uint64_t v24 = v13;
    unint64_t v14 = (-1 << (v12 - v10)) | (0x7FFFFFFFFFFFFFFFuLL >> ~(v12
                                                                                              - v10));
    if (((v12 - v10) & 0x40) != 0) {
      unint64_t v14 = -1 << (v12 - v10);
    }
    unint64_t v23 = v14;
    if ((v11 & 0x40) != 0) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = -1 << (char)v11;
    }
    if ((v11 & 0x40) != 0) {
      unint64_t v16 = -1 << (char)v11;
    }
    else {
      unint64_t v16 = (-1 << (char)v11) | (0x7FFFFFFFFFFFFFFFuLL >> ~(_BYTE)v11);
    }
    long long v17 = SPLogForSPLogCategoryDefault();
    os_log_type_t v18 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)long long v27 = v10;
      *(_WORD *)&v27[8] = 2048;
      id v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "dominantRankingQueryCount:%ld dominatedRankingQueryCount:%ld", buf, 0x16u);
    }

    if ((unint64_t)[v8 count] > 2 * a4)
    {
      unsigned int v19 = SPLogForSPLogCategoryDefault();
      os_log_type_t v20 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v19, v20))
      {
        unsigned int v21 = [v8 count];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)long long v27 = v21;
        *(_WORD *)&v27[4] = 1024;
        *(_DWORD *)&v27[6] = a4;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Post pruning %d results to %d", buf, 0xEu);
      }

      +[NSDate timeIntervalSinceReferenceDate];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100033130;
      v25[3] = &unk_100093208;
      v25[4] = v24;
      v25[5] = v23;
      v25[6] = v15;
      v25[7] = v16;
      v25[8] = v22;
      [v8 sortWithOptions:1 usingComparator:v25];
      objc_msgSend(v8, "removeObjectsInRange:", a4, (char *)objc_msgSend(v8, "count") - a4);
    }
  }
}

- (void)filterRankedItems:(id)a3 maxCount:(int64_t)a4 bundle:(id)a5 userQuery:(id)a6 queryID:(int64_t)a7 privateQuery:(BOOL)a8 rankingConfiguration:(id)a9 currentTime:(double)a10 clientBundle:(id)a11 ranker:(id)a12
{
  BOOL v13 = a8;
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a9;
  uint64_t v22 = self;
  id v23 = a12;
  if ([(SPCoreSpotlightTask *)self canceled]) {
    goto LABEL_69;
  }
  if (SSPommesRankingForSectionBundle())
  {
    uint64_t v24 = +[SSPommesRanker sharedPommesRanker];
    [v24 sortAndFilterRankedItems:v18 maxCount:a4 bundleID:v19 userQuery:v20 queryID:a7 privateQuery:v13 currentTime:a10];

    goto LABEL_69;
  }
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_1000339B4;
  v105[3] = &unk_100093228;
  *(double *)&v105[4] = a10;
  *(double *)&v105[5] = a10;
  char v25 = 1;
  [v18 sortWithOptions:1 usingComparator:v105];
  id v26 = [(SPCoreSpotlightTask *)self queryContext];
  if (![v26 filterTopHits]) {
    goto LABEL_33;
  }
  id v82 = v20;
  id v27 = [(SPCoreSpotlightTask *)self queryContext];
  unsigned int v28 = [v27 generateSuggestions];
  char v29 = v28;
  if (!v28) {
    goto LABEL_9;
  }
  long long v30 = [(SPCoreSpotlightTask *)self queryContext];
  self = [v30 additionalBundleIDs];
  if (([(SPCoreSpotlightTask *)self containsObject:v19] & 1) == 0)
  {
    v79 = v30;
LABEL_9:
    v31 = [(SPCoreSpotlightTask *)v22 queryContext];
    v73 = v22;
    if ([v31 enableInstantAnswers])
    {
      v76 = self;
      v32 = v22;
      id v33 = v18;
      v34 = [(SPCoreSpotlightTask *)v32 queryContext];
      v35 = [v34 instantAnswersBundleIDs];
      unsigned __int8 v84 = [v35 containsObject:v19];

      if (v29)
      {
      }
      id v18 = v33;
      if (v84)
      {
        char v25 = 1;
        id v20 = v82;
        uint64_t v22 = v73;
        goto LABEL_34;
      }
    }
    else
    {

      if (v29)
      {
      }
    }
    id v77 = v23;
    id v80 = v21;
    id v85 = v19;
    id v26 = objc_alloc_init((Class)NSMutableSet);
    id v27 = objc_alloc_init((Class)NSMutableIndexSet);
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v74 = v18;
    id v36 = v18;
    id v37 = [v36 countByEnumeratingWithState:&v101 objects:v109 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = 0;
      uint64_t v40 = *(void *)v102;
      do
      {
        for (i = 0; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v102 != v40) {
            objc_enumerationMutation(v36);
          }
          v42 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          v43 = [v42 rankingItem];
          [v43 withinBundleScore];
          float v45 = v44;

          if (v45 >= -9500.0)
          {
            v46 = [v42 threadId];
            if (v46)
            {
              if ([v26 containsObject:v46]) {
                [v27 addIndex:(char *)i + v39];
              }
              else {
                [v26 addObject:v46];
              }
            }
          }
          else
          {
            [v27 addIndex:(char *)i + v39];
          }
        }
        id v38 = [v36 countByEnumeratingWithState:&v101 objects:v109 count:16];
        v39 += (uint64_t)i;
      }
      while (v38);
    }

    [v36 removeObjectsAtIndexes:v27];
    char v25 = 0;
    id v18 = v74;
    id v23 = v77;
    id v19 = v85;
    id v21 = v80;
    uint64_t v22 = v73;
    goto LABEL_32;
  }

  char v25 = 1;
LABEL_32:

  id v20 = v82;
LABEL_33:

LABEL_34:
  if (([(SPCoreSpotlightTask *)v22 canceled] & 1) == 0)
  {
    v78 = v23;
    v81 = v21;
    v86 = v19;
    v47 = objc_opt_new();
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v48 = v18;
    id v49 = [v48 countByEnumeratingWithState:&v97 objects:v108 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v98;
      do
      {
        for (j = 0; j != v50; j = (char *)j + 1)
        {
          if (*(void *)v98 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = [*(id *)(*((void *)&v97 + 1) + 8 * (void)j) rankingItem];
          [v47 addObject:v53];
        }
        id v50 = [v48 countByEnumeratingWithState:&v97 objects:v108 count:16];
      }
      while (v50);
    }

    v54 = +[PRSAnonymousPipelineManager sharedManager];
    id v19 = v86;
    objc_msgSend(v54, "queryWillFinishWithItems:forClient:forQuery:anonymousDataCollectionAllowed:", v47, v86, v20, objc_msgSend(v81, "allowAnonymousDataCollection"));

    if ((unint64_t)[v48 count] <= a4) {
      char v55 = 1;
    }
    else {
      char v55 = v25;
    }
    if ((v55 & 1) == 0) {
      objc_msgSend(v48, "removeObjectsInRange:", a4, (char *)objc_msgSend(v48, "count") - a4);
    }
    if (([v86 isEqualToString:PRSRankingMessagesBundleString] & 1) != 0
      || [v86 isEqualToString:PRSRankingMailBundleString])
    {
      id v83 = v20;
      id v56 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a4];
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v57 = v48;
      id v58 = [v57 countByEnumeratingWithState:&v93 objects:v107 count:16];
      if (v58)
      {
        id v59 = v58;
        uint64_t v60 = *(void *)v94;
        do
        {
          for (k = 0; k != v59; k = (char *)k + 1)
          {
            if (*(void *)v94 != v60) {
              objc_enumerationMutation(v57);
            }
            v62 = [*(id *)(*((void *)&v93 + 1) + 8 * (void)k) rankingItem];
            [v56 addObject:v62];
          }
          id v59 = [v57 countByEnumeratingWithState:&v93 objects:v107 count:16];
        }
        while (v59);
      }

      id v19 = v86;
      v63 = [v78 filterRankedItems:v56 bundle:v86 userQuery:v83];
      id v64 = [v63 count];
      if (v64 < [v56 count])
      {
        id v75 = v18;
        id v88 = objc_alloc_init((Class)NSMutableIndexSet);
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v65 = v57;
        id v66 = [v65 countByEnumeratingWithState:&v89 objects:v106 count:16];
        if (v66)
        {
          id v67 = v66;
          uint64_t v68 = 0;
          uint64_t v69 = *(void *)v90;
          do
          {
            for (m = 0; m != v67; m = (char *)m + 1)
            {
              if (*(void *)v90 != v69) {
                objc_enumerationMutation(v65);
              }
              v71 = [*(id *)(*((void *)&v89 + 1) + 8 * (void)m) rankingItem];
              unsigned __int8 v72 = [v63 containsObject:v71];

              if ((v72 & 1) == 0) {
                [v88 addIndex:(char *)m + v68];
              }
            }
            id v67 = [v65 countByEnumeratingWithState:&v89 objects:v106 count:16];
            v68 += (uint64_t)m;
          }
          while (v67);
        }

        [v65 removeObjectsAtIndexes:v88];
        id v18 = v75;
        id v19 = v86;
      }

      id v20 = v83;
    }

    id v23 = v78;
    id v21 = v81;
  }
LABEL_69:
}

- (id)selectFromBatch:(id)a3 withBundle:(id)a4 rankCount:(unint64_t)a5 maxCount:(unint64_t)a6 userQuery:(id)a7 queryID:(int64_t)a8 isCJK:(BOOL)a9 clientBundle:(id)a10 isKeyboardCJK:(BOOL)a11 currentTime:(double)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  id v83 = v18;
  if (![v19 length]) {
    goto LABEL_19;
  }
  id v20 = +[NSCharacterSet whitespaceCharacterSet];
  id v21 = [v19 stringByTrimmingCharactersInSet:v20];
  id v22 = [v21 length];

  if (!v22) {
    goto LABEL_19;
  }
  BOOL v23 = a9 || a11;
  if ([v83 isEqualToString:SSMailBundleIdentifier])
  {
    unint64_t v24 = 1;
    if (!v23) {
      unint64_t v24 = 2;
    }
    goto LABEL_10;
  }
  unsigned int v25 = [v83 isEqualToString:PommesCtlBundleID];
  unint64_t v24 = 1;
  if (!v23) {
    unint64_t v24 = 2;
  }
  if (!v25)
  {
LABEL_19:

    char IsMailOrPommesCTL = SSSectionIsMailOrPommesCTL();
    int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();
    char v34 = 0;
    id v78 = v19;
    if ((IsMailOrPommesCTL & 1) == 0 && (IsSyndicatedPhotos & 1) == 0) {
      char v34 = SSPommesRankingForSectionBundle();
    }
    v110[0] = _NSConcreteStackBlock;
    v110[1] = 3221225472;
    v110[2] = sub_100034500;
    v110[3] = &unk_100093248;
    char v111 = IsMailOrPommesCTL;
    char v112 = IsSyndicatedPhotos;
    char v113 = v34;
    *(double *)&v110[4] = a12;
    v108[0] = _NSConcreteStackBlock;
    v108[1] = 3221225472;
    v108[2] = sub_1000345BC;
    v108[3] = &unk_100093270;
    v35 = objc_retainBlock(v110);
    id v109 = v35;
    id v36 = objc_retainBlock(v108);
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = sub_100034658;
    v106[3] = &unk_100093270;
    id v37 = v35;
    id v107 = v37;
    id v38 = objc_retainBlock(v106);
    int v85 = IsSyndicatedPhotos;
    id v39 = objc_alloc((Class)SSBinaryHeap);
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_100034724;
    v104[3] = &unk_100093298;
    id v77 = v37;
    id v105 = v77;
    uint64_t v40 = v39;
    int v41 = v85;
    id v82 = [v40 initWithComparator:v104 maxCount:a5];
    id v42 = objc_alloc((Class)SSBinaryHeap);
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = sub_1000347B4;
    v102[3] = &unk_100093298;
    v76 = v36;
    id v103 = v76;
    id v81 = [v42 initWithComparator:v102 maxCount:a5];
    id v43 = objc_alloc((Class)SSBinaryHeap);
    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472;
    v100[2] = sub_100034844;
    v100[3] = &unk_100093298;
    char v29 = v83;
    id v75 = v38;
    id v101 = v75;
    id v79 = v17;
    id v80 = [v43 initWithComparator:v100 maxCount:a5];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id obj = v17;
    id v44 = [obj countByEnumeratingWithState:&v96 objects:v120 count:16];
    if (!v44)
    {
LABEL_39:

      id v65 = objc_alloc_init((Class)NSMutableArray);
      id v66 = objc_alloc_init((Class)NSMutableArray);
      id v67 = objc_alloc_init((Class)NSMutableArray);
      v93[0] = _NSConcreteStackBlock;
      v93[1] = 3221225472;
      v93[2] = sub_1000348D4;
      v93[3] = &unk_1000932C0;
      id v68 = obj;
      id v94 = v68;
      id v95 = v65;
      id v69 = v65;
      [v82 enumerateObjectsUsingBlock:v93];
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_10003495C;
      v90[3] = &unk_1000932C0;
      id v70 = v68;
      id v91 = v70;
      id v92 = v66;
      id v71 = v66;
      [v81 enumerateObjectsUsingBlock:v90];
      v87[0] = _NSConcreteStackBlock;
      v87[1] = 3221225472;
      v87[2] = sub_1000349E4;
      v87[3] = &unk_1000932C0;
      id v72 = v70;
      id v88 = v72;
      id v89 = v67;
      id v73 = v67;
      [v80 enumerateObjectsUsingBlock:v87];
      [v72 removeObjectsInArray:v69];
      [v72 removeObjectsInArray:v71];
      [v72 removeObjectsInArray:v73];
      id v31 = +[NSMutableDictionary dictionaryWithCapacity:3];
      [v31 setObject:v69 forKeyedSubscript:@"sparse"];
      [v31 setObject:v71 forKeyedSubscript:@"dense"];
      [v31 setObject:v73 forKeyedSubscript:@"hybrid"];

      id v19 = v78;
      id v17 = v79;
      goto LABEL_40;
    }
    id v45 = v44;
    uint64_t v86 = 0;
    uint64_t v46 = *(void *)v97;
LABEL_24:
    uint64_t v47 = 0;
    while (1)
    {
      if (*(void *)v97 != v46) {
        objc_enumerationMutation(obj);
      }
      id v48 = *(void **)(*((void *)&v96 + 1) + 8 * v47);
      id v49 = [v48 rankingItem];
      [v49 setSectionBundleIdentifier:v29];

      if (v41)
      {
        id v50 = [v48 rankingItem];
        [v50 attributes];
        uint64_t v51 = SSCompactRankingAttrsGetValue();

        LODWORD(v50) = [v51 isEqualToString:PhotosResultContentTypeAsset];
        if (!v50) {
          goto LABEL_37;
        }
      }
      uint64_t v52 = v86 + v47;
      v53 = [v48 rankingItem];
      v54 = [v53 retrievalType];
      if (([v54 intValue] & 1) == 0) {
        break;
      }
      char v55 = [v48 rankingItem];
      id v56 = [v55 retrievalType];
      unsigned __int8 v57 = [v56 intValue];

      char v29 = v83;
      if ((v57 & 2) == 0) {
        goto LABEL_32;
      }
      v118[0] = @"item";
      v61 = [v48 rankingItem];
      v119[0] = v61;
      v118[1] = @"index";
      v62 = +[NSNumber numberWithUnsignedInteger:v52];
      v119[1] = v62;
      v63 = +[NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:2];
      id v64 = v80;
LABEL_36:
      [v64 addObject:v63];

      int v41 = v85;
LABEL_37:
      if (v45 == (id)++v47)
      {
        id v45 = [obj countByEnumeratingWithState:&v96 objects:v120 count:16];
        v86 += v47;
        if (!v45) {
          goto LABEL_39;
        }
        goto LABEL_24;
      }
    }

LABEL_32:
    id v58 = [v48 rankingItem];
    id v59 = [v58 retrievalType];
    unsigned __int8 v60 = [v59 intValue];

    if ((v60 & 2) != 0)
    {
      v116[0] = @"item";
      v61 = [v48 rankingItem];
      v117[0] = v61;
      v116[1] = @"index";
      v62 = +[NSNumber numberWithUnsignedInteger:v52];
      v117[1] = v62;
      v63 = +[NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:2];
      id v64 = v81;
    }
    else
    {
      v114[0] = @"item";
      v61 = [v48 rankingItem];
      v115[0] = v61;
      v114[1] = @"index";
      v62 = +[NSNumber numberWithUnsignedInteger:v52];
      v115[1] = v62;
      v63 = +[NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:2];
      id v64 = v82;
    }
    goto LABEL_36;
  }
LABEL_10:
  if ((unint64_t)v22 > v24) {
    goto LABEL_19;
  }
  id v26 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    id v27 = [v19 length];
    *(_DWORD *)buf = 134218752;
    if (v23) {
      int v28 = 2;
    }
    else {
      int v28 = 3;
    }
    int64_t v122 = a8;
    __int16 v123 = 2048;
    id v124 = v27;
    __int16 v125 = 2048;
    id v126 = v22;
    __int16 v127 = 1024;
    int v128 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[qid=%lu] query (length=%lu, trimmed length=%lu) is too short (threshold=%d) for topHit results", buf, 0x26u);
  }

  char v29 = v83;
  long long v30 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v122 = a8;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[queryID: %lu] returning empty tophits", buf, 0xCu);
  }

  [v17 removeAllObjects];
  id v31 = objc_alloc_init((Class)NSMutableDictionary);
LABEL_40:

  return v31;
}

- (id)rankBatch:(id)a3 withRanker:(id)a4 withBundle:(id)a5 clientBundle:(id)a6 maxCount:(int64_t)a7 userQuery:(id)a8 queryID:(int64_t)a9 rankingConfiguration:(id)a10 isCJK:(BOOL)a11 isKeyboardCJK:(BOOL)a12 privateQuery:(BOOL)a13 collectL2Signals:(BOOL)a14
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v40 = a6;
  id v21 = a8;
  id v38 = a10;
  id v22 = [v18 mutableCopy];
  BOOL v23 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v24 = v22;
  id v25 = [v24 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v43;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v43 != v27) {
          objc_enumerationMutation(v24);
        }
        char v29 = [*(id *)(*((void *)&v42 + 1) + 8 * i) rankingItem];
        [v23 addObject:v29];
      }
      id v26 = [v24 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v26);
  }

  if (SSSectionIsSyndicatedPhotos())
  {
    long long v30 = +[SSPommesPhotosRanker sharedInstance];
    [v19 currentTime];
    double v32 = v31;
    id v33 = [v19 keyboardLanguage];
    LOBYTE(v37) = 0;
    int64_t v34 = a9;
    [v30 updateScoresForItems:v23 withSectionBundle:v20 userQuery:v21 queryID:a9 currentTime:0 collectL2Signals:v33 keyboardLanguage:v32 onlyEmbeddingResults:v37];

    v35 = v40;
  }
  else
  {
    kdebug_trace();
    [v19 prepareItems:v23 inBundle:v20];
    kdebug_trace();
    kdebug_trace();
    v35 = v40;
    [v19 updateScoresForPreparedItems:v23 isCJK:a11 clientBundleID:v40 thresholdValue:0 queryNodeMatchInfo:a14 collectL2Signals:-1.79769313e308];
    kdebug_trace();
    int64_t v34 = a9;
  }
  [v19 currentTime];
  -[SPCoreSpotlightTask filterRankedItems:maxCount:bundle:userQuery:queryID:privateQuery:rankingConfiguration:currentTime:clientBundle:ranker:](self, "filterRankedItems:maxCount:bundle:userQuery:queryID:privateQuery:rankingConfiguration:currentTime:clientBundle:ranker:", v24, a7, v20, v21, v34, a13, v38, v35, v19);
  [v18 removeObjectsInArray:v24];

  return v24;
}

@end