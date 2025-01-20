@interface PLHighlightItemClusterer
- (PLHighlightItemClusterer)initWithRule:(id)a3;
- (PLHighlightItemClustererRule)rule;
- (id)processHighlightItems:(id)a3 withRestoredHighlightItemLists:(id)a4 progressBlock:(id)a5;
- (void)restoreExistingHighlightItemListsFromUpdatedHighlightItems:(id)a3 deletedHighlightItems:(id)a4 usingModelReader:(id)a5 progressBlock:(id)a6 restoreBlock:(id)a7;
@end

@implementation PLHighlightItemClusterer

- (void).cxx_destruct
{
}

- (PLHighlightItemClustererRule)rule
{
  return self->_rule;
}

- (id)processHighlightItems:(id)a3 withRestoredHighlightItemLists:(id)a4 progressBlock:(id)a5
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v91 = a5;
  v10 = (void (**)(void, void, double))MEMORY[0x19F38D650]();
  id v11 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v12 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v11 setTimeZone:v12];

  v97 = v11;
  [v11 setDateFormat:@"MM/dd/yyyy"];
  v13 = PLMomentsGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int buf = 134218240;
    uint64_t v111 = [v8 count];
    __int16 v112 = 2048;
    uint64_t v113 = [v9 count];
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "[HighlightCluster] Clustering %lu highlight items with existing lists (%lu)", (uint8_t *)&buf, 0x16u);
  }

  v14 = (void *)[v9 mutableCopy];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F1CA48] array];
  }
  v17 = v16;

  v18 = +[PLHighlightItemList timeSortDescriptors];
  [v17 sortUsingDescriptors:v18];

  v19 = +[PLHighlightItemList timeSortDescriptors];
  v20 = [v8 sortedArrayUsingDescriptors:v19];
  v21 = (void *)[v20 mutableCopy];

  if (![v21 count]) {
    goto LABEL_60;
  }
  id v79 = v8;
  unint64_t v22 = [v21 count];
  id v23 = [v17 firstObject];
  id v93 = v9;
  v94 = v10;
  v95 = v21;
  v96 = v17;
  if (![v21 count])
  {
    double v25 = 0.0;
LABEL_38:
    v59 = +[PLHighlightItemList timeSortDescriptors];
    [v17 sortUsingDescriptors:v59];

    v90 = [MEMORY[0x1E4F1CA48] array];
    if ([v17 count])
    {
      unint64_t v60 = 0;
      v101 = v23;
      v78 = self;
      while (1)
      {
        if (v60 >= [v17 count] - 1) {
          goto LABEL_59;
        }
        v61 = [v17 objectAtIndexedSubscript:v60];
        v62 = [v17 objectAtIndexedSubscript:v60 + 1];
        v63 = [(PLHighlightItemClusterer *)self rule];
        int v64 = [v63 highlightItemList:v61 canBeMergedWithOtherHighlightItemList:v62];

        if (v64) {
          break;
        }
        if (!v10)
        {
          ++v60;
LABEL_57:
          id v23 = v101;
          goto LABEL_58;
        }
        char v104 = 0;
        ((void (**)(void, char *, double))v10)[2](v10, &v104, v25);
        id v23 = v101;
        if (v104)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            int buf = 67109120;
            LODWORD(v111) = 162;
            _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
          }

          id v75 = (id)MEMORY[0x1E4F1CBF0];
          id v8 = v79;
          id v9 = v93;
          goto LABEL_61;
        }
        ++v60;
LABEL_58:

        if (![v17 count]) {
          goto LABEL_59;
        }
      }
      v65 = PLMomentsGetLog();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        v103 = [v61 startDate];
        v92 = [v97 stringFromDate:v103];
        v98 = [v61 endDate];
        v66 = [v97 stringFromDate:v98];
        v67 = [v62 startDate];
        v68 = [v97 stringFromDate:v67];
        v69 = [v62 endDate];
        v70 = [v97 stringFromDate:v69];
        int buf = 138413058;
        uint64_t v111 = (uint64_t)v92;
        __int16 v112 = 2112;
        uint64_t v113 = (uint64_t)v66;
        __int16 v114 = 2112;
        uint64_t v115 = (uint64_t)v68;
        __int16 v116 = 2112;
        v117 = v70;
        _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_DEBUG, "[HighlightCluster] Highlight Item lists should be merged (%@ - %@) - (%@ - %@)", (uint8_t *)&buf, 0x2Au);

        v10 = v94;
        v17 = v96;

        v21 = v95;
        self = v78;
      }
      if ([v61 isNewList]) {
        v71 = v62;
      }
      else {
        v71 = v61;
      }
      id v72 = v71;
      if ([v61 isNewList]) {
        v73 = v61;
      }
      else {
        v73 = v62;
      }
      id v74 = v73;
      [v72 mergeWithHighlightItemList:v74];
      if (([v74 isNewList] & 1) == 0)
      {
        [v90 addObject:v74];
        [v74 reset];
      }
      [v17 removeObject:v74];

      goto LABEL_57;
    }
LABEL_59:
    [v17 addObjectsFromArray:v90];

    id v8 = v79;
    id v9 = v93;
LABEL_60:
    id v75 = v17;
LABEL_61:
    v76 = v91;
    goto LABEL_62;
  }
  double v24 = 1.0 / (double)v22;
  double v25 = 0.0;
  while (1)
  {
    uint64_t v26 = MEMORY[0x19F38D3B0]();
    double v25 = v24 + v25;
    v27 = [v21 firstObject];
    v102 = (void *)v26;
    if (v23) {
      break;
    }
LABEL_30:
    id v52 = [[PLHighlightItemList alloc] initAsNewList];
    [v52 addHighlightItem:v27];
    [v17 addObject:v52];

    v53 = PLMomentsGetLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      v54 = [v27 startDate];
      v55 = [v97 stringFromDate:v54];
      v56 = [v27 endDate];
      v57 = [v97 stringFromDate:v56];
      int buf = 138412546;
      uint64_t v111 = (uint64_t)v55;
      __int16 v112 = 2112;
      uint64_t v113 = (uint64_t)v57;
      _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_DEBUG, "[HighlightCluster] New list for time period (%@ - %@)", (uint8_t *)&buf, 0x16u);

      v17 = v96;
      v21 = v95;
    }
    id v23 = v52;
LABEL_33:
    [v21 removeObject:v27];
    v58 = v102;
    if (v10)
    {
      char v104 = 0;
      ((void (**)(void, char *, double))v10)[2](v10, &v104, v25);
      if (v104)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int buf = 67109120;
          LODWORD(v111) = 136;
          _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
        }
        v76 = v91;
        goto LABEL_71;
      }
    }

    if (![v21 count]) {
      goto LABEL_38;
    }
  }
  v28 = [(PLHighlightItemClusterer *)self rule];
  int v29 = [v28 highlightItem:v27 belongsToHighlightItemList:v23];

  if (v29)
  {
    v30 = PLMomentsGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v88 = [v27 startDate];
      v82 = [v97 stringFromDate:v88];
      v86 = [v27 endDate];
      v80 = [v97 stringFromDate:v86];
      v84 = [v23 startDate];
      uint64_t v31 = [v97 stringFromDate:v84];
      [v23 endDate];
      v32 = id v99 = v23;
      v33 = [v97 stringFromDate:v32];
      v34 = [(PLHighlightItemClusterer *)self rule];
      v35 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v35);
      int buf = 138413314;
      uint64_t v111 = (uint64_t)v82;
      __int16 v112 = 2112;
      uint64_t v113 = (uint64_t)v80;
      __int16 v114 = 2112;
      uint64_t v115 = v31;
      v37 = (void *)v31;
      __int16 v116 = 2112;
      v117 = v33;
      __int16 v118 = 2112;
      v119 = v36;
      _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEBUG, "[HighlightCluster] Highlight item (%@ - %@) matches cluster (%@ - %@) for rules %@", (uint8_t *)&buf, 0x34u);

      id v9 = v93;
      id v23 = v99;

      v17 = v96;
      v21 = v95;

      v10 = v94;
    }

    [v23 addHighlightItem:v27];
    LODWORD(v38) = 1;
    if (!v10) {
      goto LABEL_29;
    }
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v39 = v17;
    uint64_t v38 = [v39 countByEnumeratingWithState:&v105 objects:v109 count:16];
    if (v38)
    {
      v100 = v23;
      uint64_t v40 = *(void *)v106;
      while (2)
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v106 != v40) {
            objc_enumerationMutation(v39);
          }
          v42 = *(void **)(*((void *)&v105 + 1) + 8 * i);
          v43 = [(PLHighlightItemClusterer *)self rule];
          int v44 = [v43 highlightItem:v27 belongsToHighlightItemList:v42];

          if (v44)
          {
            v45 = PLMomentsGetLog();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              v85 = [v27 startDate];
              v89 = [v97 stringFromDate:v85];
              v83 = [v27 endDate];
              v87 = [v97 stringFromDate:v83];
              v81 = [v42 startDate];
              v46 = [v97 stringFromDate:v81];
              v47 = [v42 endDate];
              v48 = [v97 stringFromDate:v47];
              v49 = [(PLHighlightItemClusterer *)self rule];
              v50 = (objc_class *)objc_opt_class();
              v51 = NSStringFromClass(v50);
              int buf = 138413314;
              uint64_t v111 = (uint64_t)v89;
              __int16 v112 = 2112;
              uint64_t v113 = (uint64_t)v87;
              __int16 v114 = 2112;
              uint64_t v115 = (uint64_t)v46;
              __int16 v116 = 2112;
              v117 = v48;
              __int16 v118 = 2112;
              v119 = v51;
              _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_DEBUG, "[HighlightCluster] Highlight item (%@ - %@) matches cluster (%@ - %@) for rules %@", (uint8_t *)&buf, 0x34u);

              id v9 = v93;
            }

            [v42 addHighlightItem:v27];
            id v23 = v42;

            LODWORD(v38) = 1;
            v10 = v94;
            v21 = v95;
            v17 = v96;
            goto LABEL_27;
          }
        }
        uint64_t v38 = [v39 countByEnumeratingWithState:&v105 objects:v109 count:16];
        if (v38) {
          continue;
        }
        break;
      }
      v10 = v94;
      v21 = v95;
      v17 = v96;
      id v23 = v100;
    }
LABEL_27:

    if (!v10)
    {
LABEL_29:
      if (v38) {
        goto LABEL_33;
      }
      goto LABEL_30;
    }
  }
  char v104 = 0;
  ((void (**)(void, char *, double))v10)[2](v10, &v104, v25);
  if (!v104) {
    goto LABEL_29;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int buf = 67109120;
    LODWORD(v111) = 124;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
  }
  v76 = v91;
  v58 = v102;
LABEL_71:

  id v75 = (id)MEMORY[0x1E4F1CBF0];
  id v8 = v79;
LABEL_62:

  return v75;
}

- (void)restoreExistingHighlightItemListsFromUpdatedHighlightItems:(id)a3 deletedHighlightItems:(id)a4 usingModelReader:(id)a5 progressBlock:(id)a6 restoreBlock:(id)a7
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v48 = a7;
  v53 = (void (**)(void, void, double))MEMORY[0x19F38D650](a6);
  v14 = [MEMORY[0x1E4F1CA80] setWithSet:v11];
  [v14 unionSet:v12];
  v15 = [v13 fetchNeighborHighlightItemsForHighlightItems:v14];
  [v14 addObjectsFromArray:v15];
  id v16 = [MEMORY[0x1E4F1CA48] array];
  id v52 = v13;
  v17 = [v13 fetchParentHighlightItemsForHighlightItems:v14];
  if ([v17 count])
  {
    v45 = v15;
    id v46 = v12;
    id v47 = v11;
    int v44 = v17;
    v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
    unint64_t v19 = [v18 count];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    obuint64_t j = v18;
    uint64_t v51 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v51)
    {
      double v20 = 1.0 / (double)v19;
      uint64_t v50 = *(void *)v64;
      double v21 = 0.0;
      while (2)
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          id v23 = v16;
          if (*(void *)v64 != v50) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v63 + 1) + 8 * i);
          double v25 = [v52 fetchChildHighlightItemsForHighlightItem:v24];
          uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v27 = v25;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v59 objects:v72 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v60;
            do
            {
              for (uint64_t j = 0; j != v29; ++j)
              {
                if (*(void *)v60 != v30) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v32 = *(void *)(*((void *)&v59 + 1) + 8 * j);
                if ([v14 containsObject:v32]) {
                  [v26 addObject:v32];
                }
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v59 objects:v72 count:16];
            }
            while (v29);
          }

          v33 = [[PLHighlightItemList alloc] initWithParentHighlightItem:v24 childHighlightItems:v27];
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v34 = v26;
          uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v71 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v56;
            do
            {
              for (uint64_t k = 0; k != v36; ++k)
              {
                if (*(void *)v56 != v37) {
                  objc_enumerationMutation(v34);
                }
                [(PLHighlightItemList *)v33 removeHighlightItem:*(void *)(*((void *)&v55 + 1) + 8 * k)];
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v55 objects:v71 count:16];
            }
            while (v36);
          }
          double v21 = v20 + v21;

          id v16 = v23;
          [v23 addObject:v33];
          if (v53)
          {
            char v54 = 0;
            ((void (**)(void, char *, double))v53)[2](v53, &v54, v21);
            if (v54)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                int buf = 67109120;
                LODWORD(v68) = 69;
                _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
              }

              id v12 = v46;
              id v11 = v47;
              v43 = v48;
              v17 = v44;
              v15 = v45;
              goto LABEL_34;
            }
          }
        }
        uint64_t v51 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
        if (v51) {
          continue;
        }
        break;
      }
    }

    id v12 = v46;
    id v11 = v47;
    v17 = v44;
    v15 = v45;
  }
  id v39 = PLMomentsGetLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    uint64_t v40 = v15;
    uint64_t v41 = [v16 count];
    uint64_t v42 = [v11 count];
    int buf = 134218240;
    uint64_t v68 = v41;
    v15 = v40;
    __int16 v69 = 2048;
    uint64_t v70 = v42;
    _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_INFO, "[HighlightCluster] Restored (%lu) highlight item lists for (%lu) highlights", (uint8_t *)&buf, 0x16u);
  }

  [v14 minusSet:v12];
  v43 = v48;
  (*((void (**)(id, void *, void *))v48 + 2))(v48, v16, v14);
LABEL_34:
}

- (PLHighlightItemClusterer)initWithRule:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLHighlightItemClusterer;
  v6 = [(PLHighlightItemClusterer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rule, a3);
  }

  return v7;
}

@end