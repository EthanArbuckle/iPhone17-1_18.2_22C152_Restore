@interface PGTimeTitleUtility
+ (BOOL)_canUseOverTheYearsForStartYear:(int64_t)a3 endYear:(int64_t)a4;
+ (BOOL)_eventNodesCoverCompleteMonth:(id)a3;
+ (BOOL)_eventNodesCoverCompleteYear:(id)a3;
+ (BOOL)_hasReachedNumberVisitsPerMonth:(unint64_t)a3 inEvents:(id)a4 withLocationNodes:(id)a5 startDateNode:(id)a6 endDateNode:(id)a7;
+ (BOOL)_hasReachedNumberVisitsPerYear:(unint64_t)a3 inEvents:(id)a4 withLocationNodes:(id)a5 startDateNode:(id)a6 endDateNode:(id)a7;
+ (BOOL)_momentNodes:(id)a3 coverCompleteMonth:(BOOL)a4 coverCompleteYear:(BOOL)a5;
+ (BOOL)_yearIsNeededForDisplayingDate:(id)a3;
+ (BOOL)yearIsNeededForDisplayingDate:(id)a3;
+ (id)_commonLocationLabelForLocationNodes:(id)a3;
+ (id)_dateNodesFromMomentNodes:(id)a3 featuredYearNodes:(id)a4 momentsLocalStartDate:(id *)a5 momentsLocalEndDate:(id *)a6;
+ (id)_featuredDateNodesFromDateNodes:(id)a3 featuredYearNodes:(id)a4;
+ (id)_locationNodesForTimeTitleFromLocationNodes:(id)a3;
+ (id)_numberOfYearsAgoWithEventNodes:(id)a3 relativeToDateComponents:(id)a4;
+ (id)_splitTimeTitleWithLocalStartDate:(id)a3 endDate:(id)a4 startDateNode:(id)a5 endDateNode:(id)a6 allowedFormats:(unint64_t)a7 locale:(id)a8;
+ (id)numberOfYearsAgoWithMomentNodes:(id)a3 relativeToDateComponents:(id)a4 useOrdinal:(BOOL)a5;
+ (id)peopleTimeTitleWithEventNodes:(id)a3;
+ (id)peopleTimeTitleWithEventNodes:(id)a3 requireMultipleYears:(BOOL)a4;
+ (id)significantDateNodesFromMomentNodes:(id)a3 dateFormatterType:(unint64_t)a4;
+ (id)splitTimeTitleWithDateInterval:(id)a3 allowedFormats:(unint64_t)a4;
+ (id)splitTimeTitleWithOptions:(id)a3;
+ (id)timeTitleWithDateInterval:(id)a3 allowedFormats:(unint64_t)a4;
+ (id)timeTitleWithOptions:(id)a3;
+ (int64_t)numberOfYearsFromDate:(id)a3 toDate:(id)a4;
+ (unint64_t)_dateIntervalFormatterTypeWithEventNodes:(id)a3 allowedFormats:(unint64_t)a4;
+ (void)_enumerateNeighborMomentNodesOfMomentNodes:(id)a3 usingBlock:(id)a4;
@end

@implementation PGTimeTitleUtility

+ (int64_t)numberOfYearsFromDate:(id)a3 toDate:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F76C68];
  id v6 = a4;
  v7 = [v5 components:4 fromDate:a3];
  v8 = [MEMORY[0x1E4F76C68] components:4 fromDate:v6];

  v9 = [MEMORY[0x1E4F76C68] components:4 fromDateComponents:v7 toDateComponents:v8 options:0];
  int64_t v10 = [v9 year];

  return v10;
}

+ (id)_locationNodesForTimeTitleFromLocationNodes:(id)a3
{
  id v3 = a3;
  v4 = [v3 anyObject];
  if (v4)
  {
    v5 = [PGGraphNodeCollection alloc];
    id v6 = [v4 graph];
    v7 = [(MAElementCollection *)v5 initWithSet:v3 graph:v6];

    v8 = +[PGGraphAreaNode filter];
    v9 = [v8 relation];
    int64_t v10 = +[MANodeCollection nodesRelatedToNodes:v7 withRelation:v9];

    v11 = +[PGGraphLocationNode filter];
    v12 = [v11 relation];
    v13 = +[MANodeCollection nodesRelatedToNodes:v7 withRelation:v12];

    v14 = [v10 addressNodes];
    v15 = [v14 cityNodes];
    v16 = [v13 collectionByFormingUnionWith:v15];

    id v17 = [v16 temporarySet];
  }
  else
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return v17;
}

+ (id)significantDateNodesFromMomentNodes:(id)a3 dateFormatterType:(unint64_t)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PGTimeTitleUtility_significantDateNodesFromMomentNodes_dateFormatterType___block_invoke;
  aBlock[3] = &__block_descriptor_40_e35___NSString_16__0__PGGraphDateNode_8l;
  aBlock[4] = a4;
  v29 = _Block_copy(aBlock);
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v30 = [MEMORY[0x1E4F1CA80] set];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v13 = [v12 numberOfAssets];
        v9 += v13;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __76__PGTimeTitleUtility_significantDateNodesFromMomentNodes_dateFormatterType___block_invoke_2;
        v35[3] = &unk_1E68E6DB8;
        id v36 = v30;
        id v38 = v29;
        id v37 = v6;
        uint64_t v39 = v13;
        [v12 enumerateDateNodesUsingBlock:v35];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v8);
    double v14 = (double)v9;
  }
  else
  {
    double v14 = 0.0;
  }

  v15 = [v6 allKeys];
  unint64_t v16 = [v15 count];
  if (v16 >= 2)
  {
    unint64_t v17 = v16;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v15;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v45 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * j)];
          v24 = [v23 objectForKeyedSubscript:@"numberOfAssets"];
          unint64_t v25 = [v24 unsignedIntegerValue];

          if ((double)v25 / v14 < 0.4 / (double)v17)
          {
            v26 = [v23 objectForKeyedSubscript:@"dateNodes"];
            [v30 minusSet:v26];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v45 count:16];
      }
      while (v20);
    }
  }
  return v30;
}

id __76__PGTimeTitleUtility_significantDateNodesFromMomentNodes_dateFormatterType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 collection];
  id v5 = [v4 dayNodes];
  id v6 = [v5 anyNode];
  uint64_t v7 = [v6 name];

  uint64_t v8 = [v3 collection];
  unint64_t v9 = [v8 monthNodes];
  uint64_t v10 = [v9 anyNode];
  v11 = [v10 name];

  v12 = [v3 collection];

  uint64_t v13 = [v12 yearNodes];
  double v14 = [v13 anyNode];
  v15 = [v14 name];

  unint64_t v16 = *(void *)(a1 + 32);
  if (v16 <= 6)
  {
    if (((1 << v16) & 0x33) != 0)
    {
      [NSString stringWithFormat:@"%@-%@-%@", v15, v11, v7];
    }
    else
    {
      if (((1 << v16) & 0x44) == 0)
      {
        id v17 = v15;
        goto LABEL_7;
      }
      [NSString stringWithFormat:@"%@-%@", v15, v11, v20];
    }
    id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    id v18 = v17;
    goto LABEL_8;
  }
  id v18 = 0;
LABEL_8:

  return v18;
}

void __76__PGTimeTitleUtility_significantDateNodesFromMomentNodes_dateFormatterType___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  [*(id *)(a1 + 32) addObject:v10];
  id v3 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  id v5 = [v4 objectForKeyedSubscript:@"dateNodes"];
  if (!v4)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];

    [v4 setObject:v6 forKeyedSubscript:@"dateNodes"];
    [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:v3];
    id v5 = (void *)v6;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"numberOfAssets"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  unint64_t v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56) + v8];
  [v4 setObject:v9 forKeyedSubscript:@"numberOfAssets"];

  [v5 addObject:v10];
}

+ (id)_dateNodesFromMomentNodes:(id)a3 featuredYearNodes:(id)a4 momentsLocalStartDate:(id *)a5 momentsLocalEndDate:(id *)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ([v9 count])
  {
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    id v36 = v10;
    if (v10)
    {
      v12 = [v10 years];
      id v13 = [v11 setWithArray:v12];
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    *a5 = [MEMORY[0x1E4F1C9C8] distantFuture];
    *a6 = [MEMORY[0x1E4F1C9C8] distantPast];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v37 = v9;
    obuint64_t j = v9;
    uint64_t v15 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v20 = [v19 localStartDate];
          uint64_t v21 = [v19 localEndDate];
          if (![v13 count])
          {
            *a5 = [v20 earlierDate:*a5];
LABEL_17:
            *a6 = [v21 laterDate:*a6];
            goto LABEL_18;
          }
          uint64_t v22 = [MEMORY[0x1E4F76C68] yearFromDate:v20];
          v23 = [NSNumber numberWithInteger:v22];
          int v24 = [v13 containsObject:v23];

          if (v24)
          {
            *a5 = [v20 earlierDate:*a5];
          }
          uint64_t v25 = [MEMORY[0x1E4F76C68] yearFromDate:v21];
          v26 = [NSNumber numberWithInteger:v25];
          char v27 = [v13 containsObject:v26];

          if (v27) {
            goto LABEL_17;
          }
LABEL_18:
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v16);
    }

    v28 = [PGGraphMomentNodeCollection alloc];
    v29 = [obj anyObject];
    id v30 = [v29 graph];
    long long v31 = [(MAElementCollection *)v28 initWithSet:obj graph:v30];

    long long v32 = [(PGGraphMomentNodeCollection *)v31 dateNodes];
    id v10 = v36;
    if (v36)
    {
      long long v33 = [v36 dateNodes];
      uint64_t v34 = [v32 collectionByIntersecting:v33];

      long long v32 = (void *)v34;
    }
    id v9 = v37;
    double v14 = [v32 set];
  }
  else
  {
    *a5 = 0;
    *a6 = 0;
    double v14 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v14;
}

+ (id)_commonLocationLabelForLocationNodes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 label];
        unint64_t v12 = +[PGCommonTitleUtility dimensionForLabel:v11];

        if (v6 < v12)
        {
          uint64_t v13 = [v10 label];

          unint64_t v6 = v12;
          uint64_t v7 = (void *)v13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)_hasReachedNumberVisitsPerYear:(unint64_t)a3 inEvents:(id)a4 withLocationNodes:(id)a5 startDateNode:(id)a6 endDateNode:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  long long v16 = [a1 _commonLocationLabelForLocationNodes:v13];
  if (v16)
  {
    id v29 = v12;
    uint64_t v17 = [v14 month];
    char v18 = [v14 isEqual:v15];
    uint64_t v19 = v17;
    if ((v18 & 1) == 0) {
      uint64_t v19 = [v15 month];
    }
    uint64_t v37 = 0;
    id v38 = &v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = 1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke;
    aBlock[3] = &unk_1E68E6D70;
    uint64_t v34 = v17;
    uint64_t v35 = v19;
    id v31 = v16;
    id v32 = v13;
    long long v33 = &v37;
    unint64_t v36 = a3;
    uint64_t v20 = (void (**)(void *, void *))_Block_copy(aBlock);
    uint64_t v21 = [v14 collection];
    uint64_t v22 = [v21 yearNodes];
    v23 = [v22 anyNode];

    if ([v14 isEqual:v15])
    {
      int v24 = 0;
    }
    else
    {
      v26 = [v15 collection];
      char v27 = [v26 yearNodes];
      int v24 = [v27 anyNode];
    }
    v20[2](v20, v23);
    if (v24 && ([v24 isSameNodeAsNode:v23] & 1) == 0) {
      v20[2](v20, v24);
    }
    BOOL v25 = v38[3] >= a3;

    _Block_object_dispose(&v37, 8);
    id v12 = v29;
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

void __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_2;
  v6[3] = &unk_1E68E6D48;
  long long v10 = *(_OWORD *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  uint64_t v11 = *(void *)(a1 + 72);
  [a2 enumerateNeighborNodesThroughEdgesWithLabel:@"YEAR" domain:400 usingBlock:v6];
}

void __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 month];
  if (v6 != *(void *)(a1 + 56) && v6 != *(void *)(a1 + 64))
  {
    id v7 = [v5 collection];
    id v8 = [v7 momentNodes];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_3;
    v11[3] = &unk_1E68E6D20;
    id v12 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    char v15 = 1;
    uint64_t v10 = *(void *)(a1 + 48);
    id v13 = v9;
    uint64_t v14 = v10;
    [v8 enumerateNodesUsingBlock:v11];

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(a1 + 72)) {
      *a3 = 1;
    }
  }
}

void __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 collection];
  uint64_t v6 = [v5 addressNodes];
  id v7 = [v6 deepParentLocationNodesWithLabel:*(void *)(a1 + 32)];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_4;
  v10[3] = &unk_1E68E6CF8;
  id v8 = *(id *)(a1 + 40);
  char v14 = *(unsigned char *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 48);
  id v11 = v8;
  uint64_t v12 = v9;
  uint64_t v13 = a3;
  [v7 enumerateNodesUsingBlock:v10];
}

uint64_t __106__PGTimeTitleUtility__hasReachedNumberVisitsPerYear_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_4(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v6 = result == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v7 = *(unsigned char **)(a1 + 48);
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    unsigned char *v7 = 1;
    *a3 = 1;
  }
  return result;
}

+ (BOOL)_hasReachedNumberVisitsPerMonth:(unint64_t)a3 inEvents:(id)a4 withLocationNodes:(id)a5 startDateNode:(id)a6 endDateNode:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  long long v16 = [a1 _commonLocationLabelForLocationNodes:v13];
  if (v16)
  {
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x2020000000;
    uint64_t v36 = 1;
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    BOOL v25 = __107__PGTimeTitleUtility__hasReachedNumberVisitsPerMonth_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke;
    v26 = &unk_1E68E6CD0;
    id v31 = a1;
    id v27 = v12;
    id v28 = v16;
    id v29 = v13;
    id v30 = &v33;
    unint64_t v32 = a3;
    uint64_t v17 = (void (**)(void *, uint64_t))_Block_copy(&v23);
    uint64_t v18 = objc_msgSend(v14, "month", v23, v24, v25, v26);
    uint64_t v19 = v18;
    if (([v14 isEqual:v15] & 1) == 0) {
      uint64_t v19 = [v15 month];
    }
    v17[2](v17, v18);
    uint64_t v20 = v34;
    if (v18 != v19 && v34[3] < a3)
    {
      v17[2](v17, v19);
      uint64_t v20 = v34;
    }
    BOOL v21 = v20[3] >= a3;

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

void __107__PGTimeTitleUtility__hasReachedNumberVisitsPerMonth_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __107__PGTimeTitleUtility__hasReachedNumberVisitsPerMonth_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_2;
  v7[3] = &unk_1E68E6CA8;
  uint64_t v11 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v9 = v5;
  uint64_t v10 = v6;
  uint64_t v12 = *(void *)(a1 + 72);
  [v3 _enumerateNeighborMomentNodesOfMomentNodes:v4 usingBlock:v7];
}

void __107__PGTimeTitleUtility__hasReachedNumberVisitsPerMonth_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_2(void *a1, void *a2, unsigned char *a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__PGTimeTitleUtility__hasReachedNumberVisitsPerMonth_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_3;
  v13[3] = &unk_1E68E6C80;
  uint64_t v8 = a1[7];
  v13[4] = &v14;
  v13[5] = v8;
  [v7 enumerateDateNodesUsingBlock:v13];
  if (*((unsigned char *)v15 + 24))
  {
    id v9 = [v7 collection];
    uint64_t v10 = [v9 addressNodes];
    uint64_t v11 = [v10 deepParentLocationNodesWithLabel:a1[4]];
    uint64_t v12 = [v11 temporarySet];

    if ([v12 count])
    {
      if ([v12 intersectsSet:a1[5]]) {
        ++*(void *)(*(void *)(a1[6] + 8) + 24);
      }
      if (*(void *)(*(void *)(a1[6] + 8) + 24) >= a1[8]) {
        *a4 = 1;
      }
    }
  }
  else
  {
    *a3 = 1;
  }
  _Block_object_dispose(&v14, 8);
}

uint64_t __107__PGTimeTitleUtility__hasReachedNumberVisitsPerMonth_inEvents_withLocationNodes_startDateNode_endDateNode___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 month];
  if (result == *(void *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

+ (void)_enumerateNeighborMomentNodesOfMomentNodes:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 anyObject];
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PGTimeTitleUtility__enumerateNeighborMomentNodesOfMomentNodes_usingBlock___block_invoke;
  aBlock[3] = &unk_1E68E6C58;
  id v8 = v5;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  uint64_t v16 = v18;
  char v17 = &v20;
  uint64_t v11 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v11[2](v11, 1);
  if (!*((unsigned char *)v21 + 24)) {
    v11[2](v11, 0);
  }

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);
}

void __76__PGTimeTitleUtility__enumerateNeighborMomentNodesOfMomentNodes_usingBlock___block_invoke(uint64_t a1, char a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__PGTimeTitleUtility__enumerateNeighborMomentNodesOfMomentNodes_usingBlock___block_invoke_2;
  v6[3] = &unk_1E68E6C30;
  char v8 = a2;
  id v7 = *(id *)(a1 + 32);
  id v3 = (void (**)(void *, id))_Block_copy(v6);
  id v4 = *(id *)(a1 + 40);
  do
  {
    id v5 = v4;
    v3[2](v3, v4);
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4) {
      break;
    }
    (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v4, *(void *)(*(void *)(a1 + 56) + 8) + 24, *(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      break;
    }
  }
  while (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
}

id __76__PGTimeTitleUtility__enumerateNeighborMomentNodesOfMomentNodes_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  do
  {
    if (*(unsigned char *)(a1 + 40)) {
      [v4 nextMomentNode];
    }
    else {
    id v5 = [v4 previousMomentNode];
    }

    if (!v5) {
      break;
    }
    id v4 = v5;
  }
  while (([*(id *)(a1 + 32) containsObject:v5] & 1) != 0);

  return v5;
}

+ (BOOL)_momentNodes:(id)a3 coverCompleteMonth:(BOOL)a4 coverCompleteYear:(BOOL)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 count])
  {
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    char v8 = [MEMORY[0x1E4F28E60] indexSet];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v26;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __72__PGTimeTitleUtility__momentNodes_coverCompleteMonth_coverCompleteYear___block_invoke;
        void v18[3] = &unk_1E68E6C08;
        BOOL v23 = a4;
        BOOL v24 = a5;
        id v19 = v8;
        id v22 = a1;
        id v14 = v9;
        id v20 = v14;
        BOOL v21 = &v29;
        [v13 enumerateDateNodesUsingBlock:v18];
        LOBYTE(v13) = *((unsigned char *)v30 + 24) == 0;

        if ((v13 & 1) == 0) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    BOOL v15 = *((unsigned char *)v30 + 24) == 0;
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

void __72__PGTimeTitleUtility__momentNodes_coverCompleteMonth_coverCompleteYear___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (*(unsigned char *)(a1 + 64))
  {
    id v7 = [v5 collection];
    char v8 = [v7 monthNodes];
  }
  else
  {
    if (!*(unsigned char *)(a1 + 65))
    {
      uint64_t v10 = 0;
      goto LABEL_6;
    }
    id v7 = [v5 collection];
    char v8 = [v7 yearNodes];
  }
  id v9 = v8;
  uint64_t v10 = [v8 anyNode];

LABEL_6:
  uint64_t v11 = [v10 calendarUnitValue];
  char v12 = [*(id *)(a1 + 32) containsIndex:v11];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL && (v12 & 1) == 0)
  {
    [*(id *)(a1 + 32) addIndex:v11];
    id v13 = *(void **)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 40);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__PGTimeTitleUtility__momentNodes_coverCompleteMonth_coverCompleteYear___block_invoke_2;
    v17[3] = &unk_1E68E6BE0;
    char v21 = *(unsigned char *)(a1 + 64);
    id v15 = v6;
    char v22 = *(unsigned char *)(a1 + 65);
    uint64_t v16 = *(void *)(a1 + 48);
    id v18 = v15;
    uint64_t v19 = v16;
    uint64_t v20 = v11;
    [v13 _enumerateNeighborMomentNodesOfMomentNodes:v14 usingBlock:v17];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a3 = 1;
    }
  }
}

void __72__PGTimeTitleUtility__momentNodes_coverCompleteMonth_coverCompleteYear___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3, uint64_t a4)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__PGTimeTitleUtility__momentNodes_coverCompleteMonth_coverCompleteYear___block_invoke_3;
  v11[3] = &unk_1E68E6BB8;
  char v16 = *(unsigned char *)(a1 + 56);
  id v8 = *(id *)(a1 + 32);
  char v17 = *(unsigned char *)(a1 + 57);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v12 = v8;
  uint64_t v13 = v9;
  uint64_t v14 = v10;
  uint64_t v15 = a4;
  [a2 enumerateDateNodesUsingBlock:v11];
  *a3 = 1;
}

void __72__PGTimeTitleUtility__momentNodes_coverCompleteMonth_coverCompleteYear___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  if (*(unsigned char *)(a1 + 64))
  {
    id v5 = [*(id *)(a1 + 32) collection];
    id v6 = [v5 monthNodes];
LABEL_5:
    id v7 = v6;
    id v8 = [v6 anyNode];

    goto LABEL_6;
  }
  if (*(unsigned char *)(a1 + 65))
  {
    id v5 = [*(id *)(a1 + 32) collection];
    id v6 = [v5 yearNodes];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_6:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 calendarUnitValue] == *(void *)(a1 + 48);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *a3 = 1;
    **(unsigned char **)(a1 + 56) = 1;
  }
}

+ (BOOL)_eventNodesCoverCompleteYear:(id)a3
{
  return [a1 _momentNodes:a3 coverCompleteMonth:0 coverCompleteYear:1];
}

+ (BOOL)_eventNodesCoverCompleteMonth:(id)a3
{
  return [a1 _momentNodes:a3 coverCompleteMonth:1 coverCompleteYear:0];
}

+ (unint64_t)_dateIntervalFormatterTypeWithEventNodes:(id)a3 allowedFormats:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    unint64_t v7 = v4 & 1;
    if ((v4 & 0xE) != 0)
    {
      int v8 = [a1 _eventNodesCoverCompleteMonth:v6];
      if ((v4 & 1) == 0 || v8)
      {
        uint64_t v9 = 2;
        if ((v4 & 2) == 0) {
          uint64_t v9 = v4 & 1;
        }
        if ((v4 & 8) != 0) {
          unint64_t v7 = 6;
        }
        else {
          unint64_t v7 = v9;
        }
        if ((v4 & 4) != 0)
        {
          int v10 = [a1 _eventNodesCoverCompleteYear:v6];
          if ((v4 & 0xB) != 0) {
            int v11 = v10;
          }
          else {
            int v11 = 1;
          }
          if (v11) {
            unint64_t v7 = 3;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)yearIsNeededForDisplayingDate:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x1E4F76C68];
  id v4 = a3;
  id v5 = [v3 currentLocalDate];
  uint64_t v6 = [v3 compareDate:v5 toDate:v4 toUnitGranularity:4];

  return v6 != 0;
}

+ (BOOL)_yearIsNeededForDisplayingDate:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F76C68];
  id v4 = a3;
  id v5 = [v3 currentLocalDate];
  uint64_t v6 = [v3 compareDate:v5 toDate:v4 toUnitGranularity:4];

  return v6 != 0;
}

+ (BOOL)_canUseOverTheYearsForStartYear:(int64_t)a3 endYear:(int64_t)a4
{
  return a3 + 2 <= a4;
}

+ (id)numberOfYearsAgoWithMomentNodes:(id)a3 relativeToDateComponents:(id)a4 useOrdinal:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = [a1 _numberOfYearsAgoWithEventNodes:a3 relativeToDateComponents:a4];
  unint64_t v7 = v6;
  if (v6)
  {
    if (v5)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      [v8 setNumberStyle:6];
      uint64_t v9 = [v8 stringFromNumber:v7];
    }
    else
    {
      uint64_t v9 = [v6 stringValue];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)_numberOfYearsAgoWithEventNodes:(id)a3 relativeToDateComponents:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v35 = 0;
  uint64_t v36 = (id *)&v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__18775;
  uint64_t v39 = __Block_byref_object_dispose__18776;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  char v32 = __Block_byref_object_copy__18775;
  uint64_t v33 = __Block_byref_object_dispose__18776;
  id v34 = 0;
  uint64_t v7 = [v6 year];
  uint64_t v8 = [v6 month];
  uint64_t v9 = [v6 day];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __79__PGTimeTitleUtility__numberOfYearsAgoWithEventNodes_relativeToDateComponents___block_invoke;
        v24[3] = &unk_1E68E6B90;
        v24[6] = v9;
        v24[7] = v8;
        v24[4] = &v29;
        v24[5] = &v35;
        [v13 enumerateDateNodesUsingBlock:v24];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v10);
  }

  id v14 = v36[5];
  if (v14) {
    goto LABEL_12;
  }
  uint64_t v15 = +[PGLogging sharedLogging];
  char v16 = [v15 loggingConnection];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "No matching date node found. Falling back to any date node from event nodes", buf, 2u);
  }

  objc_storeStrong(v36 + 5, (id)v30[5]);
  id v14 = v36[5];
  if (v14)
  {
LABEL_12:
    uint64_t v17 = [v14 year];
    if (v17 > v7)
    {
      id v18 = [NSNumber numberWithInteger:v17 - v7];
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v19 = +[PGLogging sharedLogging];
    uint64_t v20 = [v19 loggingConnection];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "Cannot generate ordinalYearsAgo string. Reason: No date node found.", buf, 2u);
    }
  }
  id v18 = 0;
LABEL_18:
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v18;
}

void __79__PGTimeTitleUtility__numberOfYearsAgoWithEventNodes_relativeToDateComponents___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(a1[4] + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  uint64_t v8 = (id *)(v7 + 40);
  id v12 = v6;
  if (!v9)
  {
    objc_storeStrong(v8, a2);
    id v6 = v12;
  }
  uint64_t v10 = [v6 month];
  uint64_t v11 = [v12 day];
  if (a1[6] == v10 && a1[7] == v11)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    *a3 = 1;
  }
}

+ (id)peopleTimeTitleWithEventNodes:(id)a3
{
  return (id)[a1 peopleTimeTitleWithEventNodes:a3 requireMultipleYears:0];
}

+ (id)peopleTimeTitleWithEventNodes:(id)a3 requireMultipleYears:(BOOL)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    uint64_t v13 = 0;
    goto LABEL_22;
  }
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestampUTCStart" ascending:1];
  v35[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  uint64_t v8 = [v5 sortedArrayUsingDescriptors:v7];

  uint64_t v9 = [v8 firstObject];
  uint64_t v10 = [v8 lastObject];
  uint64_t v11 = [v9 localStartDate];
  if ([v9 isSameNodeAsNode:v10])
  {
    id v12 = v11;
  }
  else
  {
    id v12 = [v10 localStartDate];
  }
  id v14 = v12;
  if (v11)
  {
    uint64_t v15 = [v9 graph];
    char v16 = [v15 dateNodeForLocalDate:v11];
    uint64_t v17 = v16;
    BOOL v30 = a4;
    if (v14 == v11)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [v15 dateNodeForLocalDate:v14];
    }
    uint64_t v19 = v18;
    uint64_t v33 = v15;
    id v34 = v10;
    uint64_t v20 = [v17 yearNode];
    char v32 = v19;
    if ([v17 isSameNodeAsNode:v19])
    {
      [v20 calendarUnitValue];
    }
    else
    {
      char v21 = [v19 yearNode];
      uint64_t v22 = [v20 calendarUnitValue];
      if (v20 != v21)
      {
        uint64_t v23 = v22;
        uint64_t v28 = [v21 calendarUnitValue];
        id v24 = objc_alloc_init(MEMORY[0x1E4F8A790]);
        id v25 = v24;
        if (v23 != v28)
        {
          uint64_t v31 = [v24 stringFromStartDate:v11 endDate:v14 type:3];
          long long v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          uint64_t v29 = [v26 localizedStringForKey:@"PGPeopleSubtitleFormatWithYears %@" value:@"PGPeopleSubtitleFormatWithYears %@" table:@"Localizable"];

          uint64_t v13 = objc_msgSend(NSString, "localizedStringWithFormat:", v29, v31);

LABEL_20:
          uint64_t v10 = v34;
          goto LABEL_21;
        }
LABEL_17:
        if (v30)
        {
          uint64_t v13 = 0;
        }
        else
        {
          uint64_t v13 = [v25 stringFromStartDate:v11 endDate:v14 type:3];
        }
        goto LABEL_20;
      }
    }
    id v25 = objc_alloc_init(MEMORY[0x1E4F8A790]);
    char v21 = v20;
    goto LABEL_17;
  }
  uint64_t v13 = 0;
LABEL_21:

LABEL_22:
  return v13;
}

+ (id)_splitTimeTitleWithLocalStartDate:(id)a3 endDate:(id)a4 startDateNode:(id)a5 endDateNode:(id)a6 allowedFormats:(unint64_t)a7 locale:(id)a8
{
  char v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v45 = a8;
  if (v16)
  {
    uint64_t v18 = [v16 year];
    uint64_t v19 = [v16 month];
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F76C68] yearFromDate:v14];
    uint64_t v19 = [MEMORY[0x1E4F76C68] monthFromDate:v14];
  }
  uint64_t v20 = v19;
  id v44 = v14;
  if (v17)
  {
    uint64_t v21 = [v17 year];
    uint64_t v22 = [v17 month];
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F76C68] yearFromDate:v15];
    uint64_t v22 = [MEMORY[0x1E4F76C68] monthFromDate:v15];
  }
  uint64_t v42 = v20;
  long long v43 = v16;
  uint64_t v41 = v22;
  uint64_t v23 = v15;
  if (v9)
  {
    char v27 = 0;
    long long v26 = 0;
    uint64_t v25 = 3;
    uint64_t v24 = 4;
    goto LABEL_18;
  }
  if ((v9 & 2) != 0)
  {
    char v27 = 0;
    long long v26 = 0;
    uint64_t v25 = 3;
    uint64_t v24 = 6;
    goto LABEL_18;
  }
  if ((v9 & 4) == 0)
  {
    uint64_t v24 = 0;
    if ((v9 & 0x10) == 0)
    {
      uint64_t v25 = 0;
      long long v26 = 0;
LABEL_17:
      char v27 = 1;
      goto LABEL_18;
    }
LABEL_16:
    uint64_t v25 = v24;
    uint64_t v29 = v18;
    BOOL v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v26 = [v30 localizedStringForKey:@"PGTimeTitleFormatOverTheYears" value:@"PGTimeTitleFormatOverTheYears" table:@"Localizable"];

    uint64_t v18 = v29;
    uint64_t v24 = 0;
    goto LABEL_17;
  }
  char v28 = [a1 _canUseOverTheYearsForStartYear:v18 endYear:v21];
  uint64_t v25 = 0;
  char v27 = 0;
  uint64_t v24 = 3;
  if ((v9 & 0x10) != 0)
  {
    long long v26 = 0;
    if ((v28 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  long long v26 = 0;
LABEL_18:
  if (v18 != v21 && v26 == 0) {
    uint64_t v32 = 0;
  }
  else {
    uint64_t v32 = v25;
  }
  uint64_t v33 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v34 = objc_alloc_init(MEMORY[0x1E4F8A790]);
  [v34 setLocale:v45];
  if (v27)
  {
    uint64_t v35 = v44;
  }
  else
  {
    BOOL v37 = v42 == v41 && v18 == v21;
    uint64_t v35 = v44;
    uint64_t v38 = [v34 stringFromStartDate:v44 endDate:v23 type:v24 showLongMonthFormatIfNeeded:v37];

    long long v26 = (void *)v38;
  }
  if (v26) {
    [v33 addObject:v26];
  }
  if (v32)
  {
    uint64_t v39 = [v34 stringFromStartDate:v35 endDate:v23 type:v32 showLongMonthFormatIfNeeded:0];
    if (v39) {
      [v33 addObject:v39];
    }
  }
  return v33;
}

+ (id)splitTimeTitleWithDateInterval:(id)a3 allowedFormats:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 startDate];
  uint64_t v8 = [v6 endDate];

  char v9 = [a1 _splitTimeTitleWithLocalStartDate:v7 endDate:v8 startDateNode:0 endDateNode:0 allowedFormats:a4 locale:0];

  return v9;
}

+ (id)splitTimeTitleWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 momentNodes];
  uint64_t v6 = [v4 allowedFormats];
  id v26 = 0;
  id v27 = 0;
  uint64_t v7 = [a1 _dateNodesFromMomentNodes:v5 featuredYearNodes:0 momentsLocalStartDate:&v27 momentsLocalEndDate:&v26];
  id v8 = v27;
  id v9 = v26;
  id v24 = 0;
  id v25 = 0;
  +[PGCommonTitleUtility startAndEndDateNodeFromDateNodes:v7 startDateNode:&v25 endDateNode:&v24];
  id v10 = v25;
  id v11 = v24;
  if (!v8 || ![v7 count])
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_14;
  }
  if ([v4 filterDates] && objc_msgSend(v5, "count") == 1)
  {
    id v12 = [v10 dayNode];
    uint64_t v23 = v12;
    if ([v10 isSameNodeAsNode:v11])
    {
      id v12 = v12;
      [v12 calendarUnitValue];
    }
    else
    {
      id v21 = [v11 dayNode];
      uint64_t v14 = [v12 calendarUnitValue];
      if (v21 != v12)
      {
        id v12 = v21;
        if (v14 != [v21 calendarUnitValue])
        {
          id v15 = [MEMORY[0x1E4F76C68] components:32 fromDate:v9];
          uint64_t v20 = [v15 hour];

          id v16 = v21;
          id v12 = v21;
          if (v20 > 11) {
            goto LABEL_12;
          }
        }
      }
    }
    id v22 = v8;

    id v17 = v10;
    id v16 = v12;
    id v11 = v17;
    id v9 = v22;
LABEL_12:
  }
  uint64_t v18 = [v4 locale];
  uint64_t v13 = [a1 _splitTimeTitleWithLocalStartDate:v8 endDate:v9 startDateNode:v10 endDateNode:v11 allowedFormats:v6 locale:v18];

LABEL_14:
  return v13;
}

+ (id)timeTitleWithDateInterval:(id)a3 allowedFormats:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 startDate];
  id v8 = [v6 endDate];

  uint64_t v9 = [MEMORY[0x1E4F76C68] yearFromDate:v7];
  uint64_t v10 = [MEMORY[0x1E4F76C68] yearFromDate:v8];
  uint64_t v11 = ((uint64_t)(a4 << 61) >> 63) & 3;
  if ((a4 & 2) != 0) {
    uint64_t v11 = 2;
  }
  BOOL v12 = (a4 & 1) == 0 && (a4 & 6) == 0;
  if (a4) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v11;
  }
  if ((a4 & 0x10) != 0)
  {
    if ((v12 | [a1 _canUseOverTheYearsForStartYear:v9 endYear:v10]) == 1)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v20 = [v14 localizedStringForKey:@"PGTimeTitleFormatOverTheYears" value:@"PGTimeTitleFormatOverTheYears" table:@"Localizable"];
      goto LABEL_21;
    }
  }
  else if ((a4 & 0x20) != 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F76C68] currentLocalDate];
    uint64_t v15 = [a1 numberOfYearsFromDate:v7 toDate:v14];
    uint64_t v16 = [a1 numberOfYearsFromDate:v8 toDate:v14];
    if (v16 == v15 && (unint64_t)(v16 - 1) < 0x32)
    {
      uint64_t v17 = [MEMORY[0x1E4F76C68] monthFromDate:v14];
      uint64_t v18 = [MEMORY[0x1E4F76C68] monthFromDate:v8];
      if (v15 != 1 || v17 == v18)
      {
        id v21 = NSString;
        uint64_t v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v22 = [v19 localizedStringForKey:@"PGMemoryTitleFormatWithNumberOfYears %lu" value:@"PGMemoryTitleFormatWithNumberOfYears %lu" table:@"Localizable"];
        uint64_t v20 = objc_msgSend(v21, "localizedStringWithFormat:", v22, v15);
      }
      else
      {
        uint64_t v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v20 = [v19 localizedStringForKey:@"PGRelativeDateLastYear" value:@"PGRelativeDateLastYear" table:@"Localizable"];
      }

LABEL_21:
      if (v20) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
LABEL_22:
  id v23 = objc_alloc_init(MEMORY[0x1E4F8A790]);
  uint64_t v20 = [v23 stringFromStartDate:v7 endDate:v8 type:v13];

LABEL_23:
  return v20;
}

+ (id)_featuredDateNodesFromDateNodes:(id)a3 featuredYearNodes:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [PGGraphDateNodeCollection alloc];
  id v8 = [v5 graph];
  uint64_t v9 = [(MAElementCollection *)v7 initWithSet:v6 graph:v8];

  uint64_t v10 = [v5 dateNodes];

  uint64_t v11 = [(MAElementCollection *)v9 collectionByIntersecting:v10];

  BOOL v12 = [v11 set];

  return v12;
}

+ (id)timeTitleWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 momentNodes];
  uint64_t v6 = [v4 allowedFormats];
  v116 = [MEMORY[0x1E4F76C68] currentLocalDate];
  if (![v5 count])
  {
    if ((v6 & 0x10) != 0)
    {
      uint64_t v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v19 = [v42 localizedStringForKey:@"PGTimeTitleFormatOverTheYears" value:@"PGTimeTitleFormatOverTheYears" table:@"Localizable"];
    }
    else
    {
      uint64_t v19 = 0;
    }
    id v43 = v19;
    goto LABEL_74;
  }
  uint64_t v7 = [v4 locationNodes];
  v112 = [a1 _locationNodesForTimeTitleFromLocationNodes:v7];

  int v8 = [v4 filterDates];
  uint64_t v9 = [v4 featuredYearNodes];
  id v121 = 0;
  v122[0] = 0;
  id v105 = a1;
  uint64_t v10 = v5;
  uint64_t v11 = [a1 _dateNodesFromMomentNodes:v5 featuredYearNodes:v9 momentsLocalStartDate:v122 momentsLocalEndDate:&v121];
  id v12 = v122[0];
  id v13 = v121;

  id v119 = 0;
  id v120 = 0;
  v104 = (void *)v11;
  +[PGCommonTitleUtility startAndEndDateNodeFromDateNodes:v11 startDateNode:&v120 endDateNode:&v119];
  id v14 = v120;
  id v15 = v119;
  uint64_t v16 = [v14 monthNode];
  v115 = v14;
  v110 = v16;
  int v97 = v8;
  id v17 = v4;
  if ([v14 isSameNodeAsNode:v15])
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [v15 monthNode];
  }
  uint64_t v20 = v18;
  id v21 = [v14 yearNode];
  v111 = v21;
  if ([v14 isSameNodeAsNode:v15])
  {
    id v22 = v21;
  }
  else
  {
    id v22 = [v15 yearNode];
  }
  v107 = v22;
  id v5 = v10;
  uint64_t v101 = [v105 numberOfYearsFromDate:v12 toDate:v116];
  uint64_t v95 = [MEMORY[0x1E4F76C68] monthFromDate:v116];
  uint64_t v23 = [v110 calendarUnitValue];
  v114 = v12;
  id v4 = v17;
  v103 = v20;
  uint64_t v93 = v23;
  if (v110 != v20) {
    uint64_t v23 = [v20 calendarUnitValue];
  }
  uint64_t v99 = v23;
  id v24 = v107;
  v108 = v13;
  uint64_t v25 = [v105 numberOfYearsFromDate:v13 toDate:v116];
  uint64_t v26 = [MEMORY[0x1E4F76C68] yearFromDate:v116];
  uint64_t v106 = [v111 calendarUnitValue];
  uint64_t v113 = v106;
  if (v111 != v107) {
    uint64_t v113 = [v107 calendarUnitValue];
  }
  v109 = v15;
  if ([v112 count])
  {
    uint64_t v27 = 0;
    if ([v10 count] && v12)
    {
      char v28 = [v115 localDate];
      uint64_t v29 = [v109 localDate];
      [v29 timeIntervalSinceDate:v28];
      unint64_t v31 = vcvtpd_u64_f64(v30 / 86400.0) + 1;
      if (v31 >= 2 && ((v6 & 2) != 0 || (v6 & 4) != 0 || (v6 & 8) != 0))
      {
        char v60 = [v105 _hasReachedNumberVisitsPerMonth:3 inEvents:v10 withLocationNodes:v112 startDateNode:v115 endDateNode:v109];
        if (v31 > 9 || (uint64_t v27 = v6 & 1, (v60 & 1) == 0))
        {
          uint64_t v61 = 2;
          if ((v6 & 2) == 0) {
            uint64_t v61 = v6 & 1;
          }
          if ((v6 & 8) != 0) {
            uint64_t v27 = 6;
          }
          else {
            uint64_t v27 = v61;
          }
          if ((v6 & 4) != 0
            && v31 >= 5
            && ([v105 _hasReachedNumberVisitsPerYear:3 inEvents:v10 withLocationNodes:v112 startDateNode:v115 endDateNode:v109] & 1) == 0)
          {
            int v62 = [v115 isEqual:v109];
            if (!(v106 == v113 ? v62 : 1)) {
              uint64_t v27 = 3;
            }
          }
        }
      }
      else
      {
        uint64_t v27 = v6 & 1;
      }

      id v5 = v10;
      id v24 = v107;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }
  if ((v6 & 0x40) != 0) {
    unint64_t v32 = 4;
  }
  else {
    unint64_t v32 = v27;
  }
  if (!v32) {
    unint64_t v32 = [v105 _dateIntervalFormatterTypeWithEventNodes:v5 allowedFormats:v6];
  }
  int v33 = [v105 _canUseOverTheYearsForStartYear:v106 endYear:v113];
  if ((v6 & 0x10) != 0 && (!v32 || v32 == 3 && v33))
  {
    id v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v35 = v34;
    uint64_t v36 = @"PGTimeTitleFormatOverTheYears";
    goto LABEL_40;
  }
  if ((v6 & 0x20) != 0 && v25 == v101 && (unint64_t)(v25 - 1) <= 0x31)
  {
    if (v101 != 1 || v95 == v99)
    {
      id v44 = NSString;
      id v35 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v45 = [v35 localizedStringForKey:@"PGMemoryTitleFormatWithNumberOfYears %lu" value:@"PGMemoryTitleFormatWithNumberOfYears %lu" table:@"Localizable"];
      BOOL v37 = objc_msgSend(v44, "localizedStringWithFormat:", v45, v101);

      goto LABEL_59;
    }
    id v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v35 = v34;
    uint64_t v36 = @"PGRelativeDateLastYear";
LABEL_40:
    BOOL v37 = [v34 localizedStringForKey:v36 value:v36 table:@"Localizable"];
LABEL_59:
    uint64_t v38 = v109;
    v46 = v110;
    goto LABEL_60;
  }
  uint64_t v38 = v109;
  if (!v12) {
    goto LABEL_71;
  }
  if (v32 == 1) {
    goto LABEL_65;
  }
  BOOL v40 = (v6 & 1) != 0 && v95 == v99 && v26 == v113;
  int v41 = v40;
  if (!v40 && (v6 & 2) != 0 && v26 == v113)
  {
    unint64_t v32 = 2;
    goto LABEL_65;
  }
  if (v41) {
    unint64_t v32 = 1;
  }
  if (!v32)
  {
LABEL_71:
    BOOL v37 = 0;
    v48 = v112;
    goto LABEL_72;
  }
LABEL_65:
  unint64_t v49 = 0x1E4F8A000;
  unint64_t v102 = v32;
  if (!v97) {
    goto LABEL_108;
  }
  if (v32 <= 5 && ((1 << v32) & 0x32) != 0 && [v5 count] == 1)
  {
    id v50 = [v115 dayNode];
    if ([v115 isSameNodeAsNode:v109])
    {
      [v50 calendarUnitValue];
      v51 = v12;
    }
    else
    {
      id v64 = [v109 dayNode];
      uint64_t v65 = [v50 calendarUnitValue];
      v51 = v12;
      if (v64 != v50)
      {
        uint64_t v66 = v65;
        uint64_t v67 = [v64 calendarUnitValue];
        id v68 = v12;
        if (v66 != v67)
        {
          v69 = [MEMORY[0x1E4F76C68] components:32 fromDate:v108];
          uint64_t v70 = [v69 hour];

          if (v70 >= 12)
          {
            id v71 = v108;

            id v68 = v71;
          }
        }
        goto LABEL_106;
      }
    }
    id v68 = v51;
    id v64 = v50;
LABEL_106:
    id v72 = objc_alloc_init(MEMORY[0x1E4F8A790]);
    v73 = [v4 locale];
    [v72 setLocale:v73];

    BOOL v37 = [v72 stringFromStartDate:v51 endDate:v68 type:v102];
    id v24 = v107;
    goto LABEL_107;
  }
  int v53 = [v4 filterForSignificantDateNodes];
  unint64_t v49 = 0x1E4F8A000;
  if (!v53) {
    goto LABEL_108;
  }
  if (v32 != 3)
  {
    if (v32 != 2) {
      goto LABEL_108;
    }
    if (v93 != v99) {
      goto LABEL_82;
    }
  }
  if (v106 != v113)
  {
LABEL_82:
    v54 = [v105 significantDateNodesFromMomentNodes:v5 dateFormatterType:v32];
    v55 = [v4 featuredYearNodes];
    uint64_t v56 = [v55 count];

    if (v56)
    {
      v57 = [v4 featuredYearNodes];
      uint64_t v58 = [v105 _featuredDateNodesFromDateNodes:v54 featuredYearNodes:v57];

      v54 = (void *)v58;
    }
    uint64_t v59 = [v54 count];
    if (v59 == [v104 count])
    {

      unint64_t v49 = 0x1E4F8A000;
      goto LABEL_108;
    }
    id v117 = 0;
    id v118 = 0;
    v100 = v54;
    +[PGCommonTitleUtility startAndEndDateNodeFromDateNodes:v54 startDateNode:&v118 endDateNode:&v117];
    id v64 = v118;
    id v68 = v117;
    id v72 = [v64 localDate];
    uint64_t v80 = [v68 localDate];
    v81 = (void *)v80;
    BOOL v37 = 0;
    if (v72 && v80)
    {
      uint64_t v82 = v80;
      id v83 = objc_alloc_init(MEMORY[0x1E4F8A790]);
      v84 = [v4 locale];
      [v83 setLocale:v84];

      v85 = (void *)v82;
      BOOL v37 = [v83 stringFromStartDate:v114 endDate:v108 type:v102];
      v98 = v83;
      v94 = v85;
      v86 = [v83 stringFromStartDate:v72 endDate:v85 type:v102];
      unint64_t v87 = [v86 length];
      if (v87 < [v37 length])
      {
        id v88 = v86;

        BOOL v37 = v88;
      }
      v96 = v86;
      if (v102 == 3)
      {
        uint64_t v89 = [MEMORY[0x1E4F76C68] yearFromDate:v72];
        v81 = v94;
        if (v89 != [MEMORY[0x1E4F76C68] yearFromDate:v94]
          && [v4 usePeopleSubtitleFormatWithYears])
        {
          v90 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v91 = [v90 localizedStringForKey:@"PGPeopleSubtitleFormatWithYears %@" value:@"PGPeopleSubtitleFormatWithYears %@" table:@"Localizable"];

          uint64_t v92 = objc_msgSend(NSString, "stringWithFormat:", v91, v37);

          BOOL v37 = (void *)v92;
        }
        id v24 = v107;
      }
      else
      {
        id v24 = v107;
        v81 = v94;
      }
    }
    id v50 = v100;
LABEL_107:

    v48 = v112;
    uint64_t v38 = v109;
    unint64_t v49 = 0x1E4F8A000uLL;
    if (!v37) {
      goto LABEL_108;
    }
LABEL_72:
    v46 = v110;
    uint64_t v47 = v103;
    goto LABEL_73;
  }
LABEL_108:
  id v35 = objc_alloc_init(*(Class *)(v49 + 1936));
  v74 = [v4 locale];
  [v35 setLocale:v74];

  if ((v6 & 0x40) != 0)
  {
    id v76 = v114;

    id v75 = v76;
  }
  else
  {
    id v75 = v108;
  }
  v108 = v75;
  BOOL v37 = objc_msgSend(v35, "stringFromStartDate:endDate:type:", v114);
  uint64_t v38 = v109;
  v46 = v110;
  if (v102 == 3 && v106 != v113)
  {
    uint64_t v47 = v103;
    if ([v4 usePeopleSubtitleFormatWithYears])
    {
      v77 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v78 = [v77 localizedStringForKey:@"PGPeopleSubtitleFormatWithYears %@" value:@"PGPeopleSubtitleFormatWithYears %@" table:@"Localizable"];

      uint64_t v79 = objc_msgSend(NSString, "stringWithFormat:", v78, v37);

      uint64_t v38 = v109;
      BOOL v37 = (void *)v79;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v47 = v103;
LABEL_61:

  v48 = v112;
LABEL_73:
  id v43 = v37;

LABEL_74:
  return v43;
}

@end