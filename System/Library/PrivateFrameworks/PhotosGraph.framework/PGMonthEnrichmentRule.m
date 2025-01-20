@interface PGMonthEnrichmentRule
- (OS_os_log)loggingConnection;
- (PGHighlightItemModelReader)modelReader;
- (PGMonthEnrichmentRule)initWithModelReader:(id)a3 loggingConnection:(id)a4;
- (double)promotionScoreForHighlightItemList:(id)a3;
- (id)_momentNodesAtWorkWithGraph:(id)a3;
- (id)bestItemsFromSortedItemsByWeekOfMonth:(id)a3 previouslySelectedItemsCountByWeek:(id)a4 maximumNumberOfItems:(unint64_t)a5 sortDescriptors:(id)a6;
- (id)fallbackKeyAssetWithHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4;
- (id)keyAssetForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4;
- (id)sortedItemsByWeekOfMonthFromItems:(id)a3 sortDescriptors:(id)a4;
- (unsigned)_legacyVisibilityStateForItemPromotedToMonths:(id)a3;
- (unsigned)_visibilityStateForItemPromotedToMonths:(id)a3;
- (void)enumerateChildVisibilityStateForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4 withGraph:(id)a5 neighborScoreComputer:(id)a6 usingBlock:(id)a7;
- (void)enumerateChildVisibilityStateForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4 withGraph:(id)a5 neighborScoreComputer:(id)a6 usingBlock:(id)a7 maximumNumberOfVisibleItems:(unint64_t)a8 maximumNumberOfVisibleRegularItems:(unint64_t)a9;
@end

@implementation PGMonthEnrichmentRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_modelReader, 0);
  objc_storeStrong((id *)&self->_momentNodesAtWork, 0);
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (PGHighlightItemModelReader)modelReader
{
  return self->_modelReader;
}

- (id)sortedItemsByWeekOfMonthFromItems:(id)a3 sortDescriptors:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v19 = a4;
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v13 = [v12 startDate];
        v14 = [v7 components:4096 fromDate:v13];

        v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "weekOfMonth"));
        v16 = [v6 objectForKeyedSubscript:v15];
        if (!v16)
        {
          v16 = [MEMORY[0x1E4F1CA48] array];
          [v6 setObject:v16 forKeyedSubscript:v15];
        }
        [v16 addObject:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __75__PGMonthEnrichmentRule_sortedItemsByWeekOfMonthFromItems_sortDescriptors___block_invoke;
  v21[3] = &unk_1E68EAD88;
  id v22 = v19;
  id v17 = v19;
  [v6 enumerateKeysAndObjectsUsingBlock:v21];

  return v6;
}

uint64_t __75__PGMonthEnrichmentRule_sortedItemsByWeekOfMonthFromItems_sortDescriptors___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 sortUsingDescriptors:*(void *)(a1 + 32)];
}

- (id)bestItemsFromSortedItemsByWeekOfMonth:(id)a3 previouslySelectedItemsCountByWeek:(id)a4 maximumNumberOfItems:(unint64_t)a5 sortDescriptors:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v44 = a6;
  v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = [MEMORY[0x1E4F1CA80] set];
  v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  unint64_t v43 = a5;
  if ([v11 count] < a5)
  {
    unint64_t v45 = a5;
    v42 = v11;
    v50 = v12;
    v48 = v13;
    do
    {
      if (!objc_msgSend(v9, "count", v42)) {
        break;
      }
      v46 = [MEMORY[0x1E4F1CA48] array];
      v14 = [v9 allKeys];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id obj = v14;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v53;
        uint64_t v47 = *(void *)v53;
        do
        {
          uint64_t v18 = 0;
          uint64_t v49 = v16;
          do
          {
            if (*(void *)v53 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v52 + 1) + 8 * v18);
            v20 = [v9 objectForKeyedSubscript:v19];
            v21 = [v10 objectForKeyedSubscript:v19];
            id v22 = v21;
            if (v21)
            {
              uint64_t v23 = [v21 unsignedIntegerValue];
              if (v23 == 1)
              {
                [v10 removeObjectForKey:v19];
              }
              else
              {
                long long v24 = [NSNumber numberWithUnsignedInteger:v23 - 1];
                [v10 setObject:v24 forKeyedSubscript:v19];
              }
            }
            else
            {
              id v25 = v10;
              long long v26 = v9;
              v27 = [v20 firstObject];
              uint64_t v28 = [v27 startDate];
              v29 = [v48 components:16 fromDate:v28];

              v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v29, "day"));
              if (([v50 containsObject:v30] & 1) == 0) {
                [v46 addObject:v27];
              }
              if ([v20 count] == 1) {
                [v26 removeObjectForKey:v19];
              }
              else {
                [v20 removeObject:v27];
              }

              id v9 = v26;
              id v10 = v25;
              uint64_t v17 = v47;
              uint64_t v16 = v49;
            }

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
        }
        while (v16);
      }
      v31 = v46;
      unint64_t v32 = [v46 count];
      if (v45 >= v32) {
        unint64_t v33 = v32;
      }
      else {
        unint64_t v33 = v45;
      }
      [v46 sortUsingDescriptors:v44];
      v11 = v42;
      v13 = v48;
      if (v33)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          v35 = [v31 objectAtIndexedSubscript:i];
          [v11 addObject:v35];
          v36 = [v35 startDate];
          [v13 components:16 fromDate:v36];
          v37 = v13;
          v39 = v38 = v11;

          v40 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v39, "day"));
          [v50 addObject:v40];

          v31 = v46;
          v11 = v38;
          v13 = v37;
        }
      }
      v45 -= v33;

      v12 = v50;
    }
    while ([v11 count] < v43);
  }

  return v11;
}

- (id)_momentNodesAtWorkWithGraph:(id)a3
{
  momentNodesAtWork = self->_momentNodesAtWork;
  if (!momentNodesAtWork)
  {
    id v5 = [a3 meNodeCollection];
    v6 = [v5 workNodes];
    v7 = [v6 addressNodes];
    uint64_t v8 = [v7 momentNodes];
    id v9 = self->_momentNodesAtWork;
    self->_momentNodesAtWork = v8;

    momentNodesAtWork = self->_momentNodesAtWork;
  }
  return momentNodesAtWork;
}

- (unsigned)_visibilityStateForItemPromotedToMonths:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    unsigned int v5 = [v4 type];

    if (v5 >= 8) {
      return 0;
    }
    else {
      return word_1D1F4F360[v5];
    }
  }
  else
  {
    unsigned __int16 v7 = [(PGMonthEnrichmentRule *)self _legacyVisibilityStateForItemPromotedToMonths:v4];

    return v7;
  }
}

- (unsigned)_legacyVisibilityStateForItemPromotedToMonths:(id)a3
{
  unsigned int v3 = [a3 type];
  if (v3 > 7) {
    return 0;
  }
  else {
    return word_1D1F4F350[v3];
  }
}

- (void)enumerateChildVisibilityStateForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4 withGraph:(id)a5 neighborScoreComputer:(id)a6 usingBlock:(id)a7 maximumNumberOfVisibleItems:(unint64_t)a8 maximumNumberOfVisibleRegularItems:(unint64_t)a9
{
  unsigned int obj = a4;
  v180[3] = *MEMORY[0x1E4F143B8];
  id v128 = a3;
  id v126 = a5;
  id v131 = a6;
  v12 = (void (**)(id, void, uint64_t))a7;
  v13 = (void *)MEMORY[0x1E4F28BA0];
  v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"type", 5);
  v180[0] = v14;
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"type", 6);
  v180[1] = v15;
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"category", 1);
  v180[2] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:3];
  uint64_t v18 = [v13 andPredicateWithSubpredicates:v17];

  if (_os_feature_enabled_impl())
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28BA0];
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"kind", 0);
    v21 = v20 = (void *)v18;
    v179[0] = v21;
    id v22 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"category", 1);
    v179[1] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v179 count:2];
    uint64_t v24 = [v19 andPredicateWithSubpredicates:v23];

    uint64_t v18 = v24;
  }
  if (obj > 2)
  {
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:off_1E68EADA8[obj] ascending:0];
  }
  v122 = [v128 sortedChildHighlightItems];
  long long v26 = [v128 childHighlightItemsForHighlightFilter:obj];
  v165[0] = MEMORY[0x1E4F143A8];
  v165[1] = 3221225472;
  v165[2] = __195__PGMonthEnrichmentRule_enumerateChildVisibilityStateForHighlightItemList_sharingFilter_withGraph_neighborScoreComputer_usingBlock_maximumNumberOfVisibleItems_maximumNumberOfVisibleRegularItems___block_invoke;
  v165[3] = &__block_descriptor_34_e44_B24__0___PGHighlightItem__8__NSDictionary_16l;
  __int16 v166 = obj;
  v27 = [MEMORY[0x1E4F28F60] predicateWithBlock:v165];
  v121 = v26;
  uint64_t v28 = [v26 filteredArrayUsingPredicate:v27];

  v130 = v28;
  v123 = (void *)v18;
  v29 = [v28 filteredArrayUsingPredicate:v18];
  v30 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"promotionScore" ascending:0];
  v178[0] = v30;
  v178[1] = v25;
  v127 = (void *)v25;
  v31 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v178[2] = v31;
  unint64_t v32 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v178[3] = v32;
  v129 = [MEMORY[0x1E4F1C978] arrayWithObjects:v178 count:4];

  unint64_t v33 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %f", @"promotionScore", 0x3FECCCCCCCCCCCCDLL);
  int v34 = _os_feature_enabled_impl();
  v35 = (void *)MEMORY[0x1E4F28BA0];
  if (v34)
  {
    v177[0] = v33;
    v36 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"type", 5);
    v177[1] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v177 count:2];
    [v35 orPredicateWithSubpredicates:v37];
  }
  else
  {
    v176[0] = v33;
    v36 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"type", 3);
    v176[1] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v176 count:2];
    [v35 andPredicateWithSubpredicates:v37];
  uint64_t v38 = };

  v119 = (void *)v38;
  v118 = [v29 filteredArrayUsingPredicate:v38];
  uint64_t v39 = -[PGMonthEnrichmentRule sortedItemsByWeekOfMonthFromItems:sortDescriptors:](self, "sortedItemsByWeekOfMonthFromItems:sortDescriptors:");
  v40 = [MEMORY[0x1E4F1CA60] dictionary];
  v117 = (void *)v39;
  v41 = [(PGMonthEnrichmentRule *)self bestItemsFromSortedItemsByWeekOfMonth:v39 previouslySelectedItemsCountByWeek:v40 maximumNumberOfItems:a8 sortDescriptors:v129];

  v175[0] = v25;
  v42 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"promotionScore" ascending:0];
  v175[1] = v42;
  unint64_t v43 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v175[2] = v43;
  id v44 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v175[3] = v44;
  v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:v175 count:4];

  unint64_t v45 = v41;
  unint64_t v46 = [v41 count];
  v120 = v29;
  if (a8 <= v46)
  {
    v80 = self;
  }
  else
  {
    unint64_t v112 = a8 - v46;
    unint64_t v113 = v46;
    v139 = v41;
    uint64_t v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v29, "count"));
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    id v48 = v29;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v161 objects:v174 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v162;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v162 != v51) {
            objc_enumerationMutation(v48);
          }
          long long v53 = [*(id *)(*((void *)&v161 + 1) + 8 * i) uuid];
          [v47 addObject:v53];
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v161 objects:v174 count:16];
      }
      while (v50);
    }

    v116 = v47;
    v115 = +[PGGraphHighlightNodeCollection highlightNodesForArrayOfUUIDs:v47 inGraph:v126];
    v135 = [v115 highlightNodeByHighlightUUID];
    v134 = [(PGMonthEnrichmentRule *)self _momentNodesAtWorkWithGraph:v126];
    v132 = [MEMORY[0x1E4F1CA48] array];
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    id v54 = v48;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v157 objects:v173 count:16];
    v56 = v139;
    if (v55)
    {
      uint64_t v57 = v55;
      uint64_t v58 = *(void *)v158;
      do
      {
        for (uint64_t j = 0; j != v57; ++j)
        {
          if (*(void *)v158 != v58) {
            objc_enumerationMutation(v54);
          }
          v60 = *(void **)(*((void *)&v157 + 1) + 8 * j);
          [v60 promotionScore];
          double v62 = v61;
          if (([v56 containsObject:v60] & 1) == 0
            && [v60 type] != 3
            && v62 > 0.25)
          {
            v64 = [v60 uuid];
            v65 = [v135 objectForKeyedSubscript:v64];

            if (v65)
            {
              if (v62 >= 0.5
                || (uint64_t v66 = [v65 numberOfRegularGemAssets],
                    (unint64_t)([v65 numberOfShinyGemAssets] + v66) > 1)
                || (unint64_t)[v60 numberOfAssetsInExtendedForSharingFilter:obj] > 4
                || ([v131 neighborScoreWithHighlightNode:v65], v67 >= 0.4))
              {
                v68 = [v65 collection];
                v69 = [v68 momentNodes];
                char v70 = [v134 containsCollection:v69];

                v56 = v139;
                if ((v70 & 1) == 0) {
                  [v132 addObject:v60];
                }
              }
            }
            else
            {
              loggingConnectiouint64_t n = self->_loggingConnection;
              if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v172 = v60;
                _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, "Could not find highlight node for highlight %@: Graph might be out of date.", buf, 0xCu);
              }
            }
          }
        }
        uint64_t v57 = [v54 countByEnumeratingWithState:&v157 objects:v173 count:16];
      }
      while (v57);
    }

    unint64_t v72 = +[PGUserDefaults minimumNumberOfVisibleItems];
    v73 = v132;
    if ([v132 count] + v113 >= v72)
    {
      uint64_t v124 = [(PGMonthEnrichmentRule *)self sortedItemsByWeekOfMonthFromItems:v132 sortDescriptors:v125];
      unint64_t v81 = v112;
      if (v112 >= a9) {
        unint64_t v81 = a9;
      }
      unint64_t v114 = v81;
      v76 = [MEMORY[0x1E4F1CA60] dictionary];
      v79 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      long long v153 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      id obja = v56;
      uint64_t v82 = [obja countByEnumeratingWithState:&v153 objects:v170 count:16];
      if (v82)
      {
        uint64_t v83 = v82;
        uint64_t v140 = *(void *)v154;
        do
        {
          for (uint64_t k = 0; k != v83; ++k)
          {
            if (*(void *)v154 != v140) {
              objc_enumerationMutation(obja);
            }
            v85 = [*(id *)(*((void *)&v153 + 1) + 8 * k) startDate];
            v86 = [v79 components:4096 fromDate:v85];

            v87 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v86, "weekOfMonth"));
            v88 = NSNumber;
            [v76 objectForKeyedSubscript:v87];
            v90 = v89 = v79;
            v91 = objc_msgSend(v88, "numberWithUnsignedInteger:", objc_msgSend(v90, "unsignedIntegerValue") + 1);
            [v76 setObject:v91 forKeyedSubscript:v87];

            v79 = v89;
          }
          uint64_t v83 = [obja countByEnumeratingWithState:&v153 objects:v170 count:16];
        }
        while (v83);
      }

      v80 = self;
      v75 = (void *)v124;
      v92 = [(PGMonthEnrichmentRule *)self bestItemsFromSortedItemsByWeekOfMonth:v124 previouslySelectedItemsCountByWeek:v76 maximumNumberOfItems:v114 sortDescriptors:v125];
      unint64_t v45 = [obja arrayByAddingObjectsFromArray:v92];

      v73 = v132;
    }
    else
    {
      v74 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %f", @"promotionScore", 0x3FD0000000000000);
      v75 = [v54 filteredArrayUsingPredicate:v74];

      v76 = [v75 sortedArrayUsingDescriptors:v129];
      unint64_t v77 = [v76 count];
      if (v72 >= v77) {
        unint64_t v78 = v77;
      }
      else {
        unint64_t v78 = v72;
      }
      objc_msgSend(v76, "subarrayWithRange:", 0, v78);
      unint64_t v45 = v79 = v56;
      v80 = self;
    }
  }
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v93 = v45;
  uint64_t v94 = [v93 countByEnumeratingWithState:&v149 objects:v169 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v150;
    do
    {
      for (uint64_t m = 0; m != v95; ++m)
      {
        if (*(void *)v150 != v96) {
          objc_enumerationMutation(v93);
        }
        v12[2](v12, *(void *)(*((void *)&v149 + 1) + 8 * m), [(PGMonthEnrichmentRule *)v80 _visibilityStateForItemPromotedToMonths:*(void *)(*((void *)&v149 + 1) + 8 * m)]);
      }
      uint64_t v95 = [v93 countByEnumeratingWithState:&v149 objects:v169 count:16];
    }
    while (v95);
  }

  v98 = [v130 arrayByExcludingObjectsInArray:v93];
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  uint64_t v99 = [v98 countByEnumeratingWithState:&v145 objects:v168 count:16];
  if (v99)
  {
    uint64_t v100 = v99;
    uint64_t v101 = *(void *)v146;
    do
    {
      for (uint64_t n = 0; n != v100; ++n)
      {
        if (*(void *)v146 != v101) {
          objc_enumerationMutation(v98);
        }
        v103 = *(void **)(*((void *)&v145 + 1) + 8 * n);
        [v103 promotionScore];
        if (v104 >= 0.25)
        {
          unsigned int v106 = [v103 type];
          uint64_t v105 = 0;
          if (v106 <= 7)
          {
            if (((1 << v106) & 0xA9) != 0)
            {
              uint64_t v105 = 1;
            }
            else if (((1 << v106) & 0x16) != 0)
            {
              uint64_t v105 = _os_feature_enabled_impl();
            }
          }
        }
        else
        {
          uint64_t v105 = 0;
        }
        ((void (**)(id, void *, uint64_t))v12)[2](v12, v103, v105);
      }
      uint64_t v100 = [v98 countByEnumeratingWithState:&v145 objects:v168 count:16];
    }
    while (v100);
  }
  v107 = [v122 arrayByExcludingObjectsInArray:v130];
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  uint64_t v108 = [v107 countByEnumeratingWithState:&v141 objects:v167 count:16];
  if (v108)
  {
    uint64_t v109 = v108;
    uint64_t v110 = *(void *)v142;
    do
    {
      for (iuint64_t i = 0; ii != v109; ++ii)
      {
        if (*(void *)v142 != v110) {
          objc_enumerationMutation(v107);
        }
        v12[2](v12, *(void *)(*((void *)&v141 + 1) + 8 * ii), 0);
      }
      uint64_t v109 = [v107 countByEnumeratingWithState:&v141 objects:v167 count:16];
    }
    while (v109);
  }
}

BOOL __195__PGMonthEnrichmentRule_enumerateChildVisibilityStateForHighlightItemList_sharingFilter_withGraph_neighborScoreComputer_usingBlock_maximumNumberOfVisibleItems_maximumNumberOfVisibleRegularItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 numberOfAssetsInExtendedForSharingFilter:*(unsigned __int16 *)(a1 + 32)] != 0;
}

- (void)enumerateChildVisibilityStateForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4 withGraph:(id)a5 neighborScoreComputer:(id)a6 usingBlock:(id)a7
{
  uint64_t v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  [(PGMonthEnrichmentRule *)self enumerateChildVisibilityStateForHighlightItemList:v15 sharingFilter:v9 withGraph:v14 neighborScoreComputer:v13 usingBlock:v12 maximumNumberOfVisibleItems:+[PGUserDefaults maximumNumberOfVisibleItems](PGUserDefaults, "maximumNumberOfVisibleItems") maximumNumberOfVisibleRegularItems:+[PGUserDefaults maximumNumberOfVisibleRegularItems]];
}

- (id)fallbackKeyAssetWithHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  v6 = [v25 childHighlightItemsForHighlightFilter:v4];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v27;
    double v11 = 0.0;
    double v12 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v6);
        }
        id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (MEMORY[0x1D25FE3E0]([(PGHighlightItemModelReader *)self->_modelReader visibilityStateForHighlightItem:v14 sharingFilter:v4]))
        {
          [v14 promotionScore];
          double v16 = v15;
          uint64_t v17 = [v14 endDate];
          uint64_t v18 = [v14 startDate];
          [v17 timeIntervalSinceDate:v18];
          double v20 = v19;

          if (v16 > v12 || (v16 == v12 ? (v21 = v20 <= v11) : (v21 = 1), double v16 = v12, !v21))
          {
            id v22 = v14;

            double v11 = v20;
            double v12 = v16;
            uint64_t v9 = v22;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v23 = [v9 keyAssetForHighlightFilter:v4];

  return v23;
}

- (id)keyAssetForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PGHighlightItemModelReader *)self->_modelReader contextualKeyAssetForHighlightItem:v6 sharingFilter:v4];
  if (!v7)
  {
    loggingConnectiouint64_t n = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_INFO, "No contextual key asset for highlight item list %@, using highest promotion score as a fallback.", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v7 = [(PGMonthEnrichmentRule *)self fallbackKeyAssetWithHighlightItemList:v6 sharingFilter:v4];
  }

  return v7;
}

- (double)promotionScoreForHighlightItemList:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v3 = objc_msgSend(a3, "sortedChildHighlightItems", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) promotionScore];
        if (v7 < v9) {
          double v7 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (PGMonthEnrichmentRule)initWithModelReader:(id)a3 loggingConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMonthEnrichmentRule;
  double v9 = [(PGMonthEnrichmentRule *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelReader, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
  }

  return v10;
}

@end