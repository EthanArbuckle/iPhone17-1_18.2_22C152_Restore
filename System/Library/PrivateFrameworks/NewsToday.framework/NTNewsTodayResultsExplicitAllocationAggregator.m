@interface NTNewsTodayResultsExplicitAllocationAggregator
- (FCCoreConfigurationManager)configurationManager;
- (FCFeedPersonalizing)feedPersonalizer;
- (FCTodayPrivateData)todayData;
- (NSDate)filterDate;
- (NTNewsTodayResultsExplicitAllocationAggregator)init;
- (NTNewsTodayResultsExplicitAllocationAggregator)initWithConfigurationManager:(id)a3 feedPersonalizer:(id)a4 filterDate:(id)a5 todayData:(id)a6;
- (id)_itemsForSection:(id)a3 items:(id)a4 withBudgetInfo:(id)a5 previouslyChosenItems:(id)a6 priorClusterIDsInOtherSections:(id)a7 sectionItemsLimit:(unint64_t)a8 otherArticleIDs:(id)a9 remainingSlots:(double)a10 slotsUsed:(double *)a11 noMoreItemsToGive:(BOOL *)a12 noRoomForMoreItems:(BOOL *)a13;
- (id)_sectionFilterTransformationWithDescriptor:(id)a3 priorClusterIDsInOtherSections:(id)a4 priorClusterIDsInSection:(id)a5 otherArticleIDs:(id)a6;
- (id)aggregateSections:(id)a3 itemsBySectionDescriptor:(id)a4 budgetInfo:(id)a5;
- (void)setConfigurationManager:(id)a3;
- (void)setFeedPersonalizer:(id)a3;
- (void)setFilterDate:(id)a3;
- (void)setTodayData:(id)a3;
@end

@implementation NTNewsTodayResultsExplicitAllocationAggregator

- (id)aggregateSections:(id)a3 itemsBySectionDescriptor:(id)a4 budgetInfo:(id)a5
{
  v43[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsExplicitAllocationAggregator aggregateSections:itemsBySectionDescriptor:budgetInfo:]();
  }
  if (!v9 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsExplicitAllocationAggregator aggregateSections:itemsBySectionDescriptor:budgetInfo:]();
  }
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  uint64_t v41 = 0;
  [v10 slotsLimit];
  uint64_t v41 = v11;
  v12 = objc_opt_new();
  v13 = objc_opt_new();
  v14 = objc_opt_new();
  v15 = objc_opt_new();
  if ([v10 respectMinMaxLimit])
  {
    v43[0] = &__block_literal_global_7;
    v16 = (void **)v43;
    v17 = &__block_literal_global_119;
  }
  else
  {
    v42 = &__block_literal_global_122;
    v16 = &v42;
    v17 = &__block_literal_global_124;
  }
  v16[1] = v17;
  v18 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:");
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_5;
  v29[3] = &unk_26475CF68;
  id v19 = v8;
  id v30 = v19;
  v39 = v40;
  id v20 = v9;
  id v31 = v20;
  id v21 = v15;
  id v32 = v21;
  id v22 = v14;
  id v33 = v22;
  id v23 = v13;
  id v34 = v23;
  v35 = self;
  id v24 = v10;
  id v36 = v24;
  id v25 = v12;
  id v37 = v25;
  id v26 = v18;
  id v38 = v26;
  [v26 enumerateObjectsUsingBlock:v29];
  v27 = [[NTItemAggregationResult alloc] initWithAggregatedItemsBySectionDescriptor:v22 unusedSectionDescriptors:v21];

  _Block_object_dispose(v40, 8);

  return v27;
}

- (NTNewsTodayResultsExplicitAllocationAggregator)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[NTNewsTodayResultsExplicitAllocationAggregator init]";
    __int16 v9 = 2080;
    id v10 = "NTNewsTodayResultsExplicitAllocationAggregator.m";
    __int16 v11 = 1024;
    int v12 = 155;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTNewsTodayResultsExplicitAllocationAggregator init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTNewsTodayResultsExplicitAllocationAggregator)initWithConfigurationManager:(id)a3 feedPersonalizer:(id)a4 filterDate:(id)a5 todayData:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsExplicitAllocationAggregator initWithConfigurationManager:feedPersonalizer:filterDate:todayData:]();
    if (v13) {
      goto LABEL_6;
    }
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsExplicitAllocationAggregator initWithConfigurationManager:feedPersonalizer:filterDate:todayData:]();
  }
LABEL_6:
  v22.receiver = self;
  v22.super_class = (Class)NTNewsTodayResultsExplicitAllocationAggregator;
  uint64_t v15 = [(NTNewsTodayResultsExplicitAllocationAggregator *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configurationManager, a3);
    objc_storeStrong((id *)&v16->_feedPersonalizer, a4);
    uint64_t v17 = [v13 copy];
    filterDate = v16->_filterDate;
    v16->_filterDate = (NSDate *)v17;

    uint64_t v19 = [v14 copy];
    todayData = v16->_todayData;
    v16->_todayData = (FCTodayPrivateData *)v19;
  }
  return v16;
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 minimumStoriesAllocation];
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 maximumStoriesAllocation];
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_3()
{
  return -1;
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_4()
{
  return -1;
}

void __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_6;
  v13[3] = &unk_26475CF40;
  uint64_t v23 = *(void *)(a1 + 104);
  uint64_t v24 = a4;
  id v8 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v22 = v7;
  id v9 = *(id *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  id v11 = *(void **)(a1 + 80);
  id v17 = v9;
  uint64_t v18 = v10;
  id v19 = v11;
  id v20 = *(id *)(a1 + 88);
  uint64_t v25 = a3;
  id v21 = *(id *)(a1 + 96);
  id v12 = v7;
  [v8 enumerateObjectsUsingBlock:v13];
}

void __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a2;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_7;
  v38[3] = &__block_descriptor_48_e5_v8__0l;
  v38[4] = *(void *)(a1 + 112);
  v38[5] = a4;
  uint64_t v7 = MEMORY[0x22A638590](v38);
  id v8 = (void (**)(void))v7;
  if (*(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) <= 0.0)
  {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    if ([v9 count])
    {
      uint64_t v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:v6];
      uint64_t v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 96) + 16))();
      uint64_t v12 = [v10 count];
      if (v11 != v12)
      {
        uint64_t v30 = v11 - v12;
        id v13 = (void *)[*(id *)(a1 + 56) copy];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v31 = v10;
        id v14 = v10;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v35 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = [*(id *)(*((void *)&v34 + 1) + 8 * i) clusterID];
              if (v19) {
                [v13 removeObject:v19];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
          }
          while (v16);
        }

        double v33 = 0.0;
        __int16 v32 = 0;
        if (v14) {
          id v20 = v14;
        }
        else {
          id v20 = (id)MEMORY[0x263EFFA68];
        }
        id v21 = [*(id *)(a1 + 64) _itemsForSection:v6 items:v9 withBudgetInfo:*(void *)(a1 + 72) previouslyChosenItems:v20 priorClusterIDsInOtherSections:v13 sectionItemsLimit:v30 otherArticleIDs:*(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) remainingSlots:*(void *)(a1 + 80) slotsUsed:&v33 noMoreItemsToGive:(char *)&v32 + 1 noRoomForMoreItems:&v32];
        if ((_BYTE)v32)
        {
          v8[2](v8);
          uint64_t v10 = v31;
        }
        else
        {
          uint64_t v22 = [v14 count];
          uint64_t v23 = *(void *)(a1 + 120);
          uint64_t v24 = [*(id *)(a1 + 88) count];
          if (!v22 && HIBYTE(v32) && v23 + 1 == v24) {
            [*(id *)(a1 + 40) addObject:v6];
          }
          uint64_t v25 = *(void **)(a1 + 80);
          id v26 = objc_msgSend(v21, "fc_setByTransformingWithBlock:", &__block_literal_global_129);
          [v25 unionSet:v26];

          v27 = *(void **)(a1 + 56);
          v28 = objc_msgSend(v21, "fc_setByTransformingWithBlock:", &__block_literal_global_131);
          [v27 unionSet:v28];

          if (v14)
          {
            [v14 addObjectsFromArray:v21];
          }
          else
          {
            v29 = (void *)[v21 mutableCopy];
            [*(id *)(a1 + 48) setObject:v29 forKeyedSubscript:v6];
          }
          uint64_t v10 = v31;
          *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 104)
                                                                                               + 8)
                                                                                   + 24)
                                                                       - v33;
        }
      }
    }
    else
    {
      [*(id *)(a1 + 40) addObject:v6];
    }
  }
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_7(uint64_t result)
{
  v1 = *(unsigned char **)(result + 32);
  **(unsigned char **)(result + 40) = 1;
  unsigned char *v1 = 1;
  return result;
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __104__NTNewsTodayResultsExplicitAllocationAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 clusterID];
}

- (id)_itemsForSection:(id)a3 items:(id)a4 withBudgetInfo:(id)a5 previouslyChosenItems:(id)a6 priorClusterIDsInOtherSections:(id)a7 sectionItemsLimit:(unint64_t)a8 otherArticleIDs:(id)a9 remainingSlots:(double)a10 slotsUsed:(double *)a11 noMoreItemsToGive:(BOOL *)a12 noRoomForMoreItems:(BOOL *)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v55 = a7;
  uint64_t v23 = v19;
  id v24 = a9;
  if (!v23 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:]1();
    if (v20) {
      goto LABEL_6;
    }
  }
  else if (v20)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:]0();
  }
LABEL_6:
  if (!v21 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.9();
    if (v22) {
      goto LABEL_11;
    }
  }
  else if (v22)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.8();
  }
LABEL_11:
  if (!v24 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.7();
  }
  if (!v55 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.6();
  }
  if (!a8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.5();
  }
  if (a10 < 0.0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:].cold.4();
    if (a11) {
      goto LABEL_25;
    }
  }
  else if (a11)
  {
    goto LABEL_25;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:]();
  }
LABEL_25:
  if (!a12 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:]();
  }
  if (!a13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsExplicitAllocationAggregator _itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:]();
  }
  uint64_t v25 = [(NTNewsTodayResultsExplicitAllocationAggregator *)self feedPersonalizer];
  id v26 = [v23 incrementalSortTransformationWithFeedPersonalizer:v25];
  v52 = v20;
  v27 = [v26 transformFeedItems:v20];
  v28 = objc_msgSend(v22, "fc_setByTransformingWithBlock:", &__block_literal_global_146);
  v50 = v24;
  v29 = [(NTNewsTodayResultsExplicitAllocationAggregator *)self _sectionFilterTransformationWithDescriptor:v23 priorClusterIDsInOtherSections:v55 priorClusterIDsInSection:v28 otherArticleIDs:v24];
  uint64_t v30 = [v29 transformFeedItems:v27];
  id v31 = v22;
  v53 = v23;
  v51 = v21;
  if ([v22 count])
  {
    __int16 v32 = [v21 sectionSlotCostInfo];
    double v33 = 0.0;
  }
  else
  {
    long long v34 = [v23 name];
    long long v35 = v21;
    if (v34) {
      int v36 = [v21 allowSectionTitles];
    }
    else {
      int v36 = 0;
    }

    long long v37 = [v35 sectionSlotCostInfo];
    __int16 v32 = v37;
    double v38 = 0.0;
    if (v36)
    {
      [v37 sectionTitleSlotCost];
      double v38 = v39;
    }
    [v32 sectionFooterSlotCost];
    double v33 = v38 + v40;
    uint64_t v23 = v53;
  }
  double v41 = a10 - v33;
  [v32 headlineSlotCost];
  double v43 = v41 / v42;
  if (v43 >= (double)a8) {
    double v43 = (double)a8;
  }
  v44 = [v23 incrementalLimitTransformationWithFeedPersonalizer:v25 limit:(unint64_t)v43 priorFeedItems:v31];
  v45 = [v44 transformFeedItems:v30];
  if ([v45 count])
  {
    double v46 = (double)(unint64_t)[v45 count];
    [v32 headlineSlotCost];
    double v48 = v33 + v46 * v47;
  }
  else
  {
    double v48 = 0.0;
  }
  *a11 = v48;
  *a13 = v41 <= 0.0;
  *a12 = [v30 count] == 0;

  return v45;
}

uint64_t __237__NTNewsTodayResultsExplicitAllocationAggregator__itemsForSection_items_withBudgetInfo_previouslyChosenItems_priorClusterIDsInOtherSections_sectionItemsLimit_otherArticleIDs_remainingSlots_slotsUsed_noMoreItemsToGive_noRoomForMoreItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 clusterID];
}

- (id)_sectionFilterTransformationWithDescriptor:(id)a3 priorClusterIDsInOtherSections:(id)a4 priorClusterIDsInSection:(id)a5 otherArticleIDs:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsExplicitAllocationAggregator _sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:].cold.4();
    if (v11) {
      goto LABEL_6;
    }
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsExplicitAllocationAggregator _sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:]();
  }
LABEL_6:
  if (!v13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsExplicitAllocationAggregator _sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:]();
    if (v12) {
      goto LABEL_11;
    }
  }
  else if (v12)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsExplicitAllocationAggregator _sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:]();
  }
LABEL_11:
  char v14 = [v10 supplementalInterSectionFilterOptions];
  char v15 = [v10 supplementalIntraSectionFilterOptions];
  uint64_t v16 = objc_opt_new();
  uint64_t v17 = [v10 supplementalIntraSectionFilterOptions];
  if ((v14 & 4) != 0) {
    [v16 unionSet:v11];
  }
  v28 = v12;
  v29 = v11;
  if ((v15 & 4) != 0)
  {
    uint64_t v18 = v17 | 4;
    [v16 unionSet:v12];
  }
  else
  {
    uint64_t v18 = v17 | 0x84;
  }
  id v19 = [(NTNewsTodayResultsExplicitAllocationAggregator *)self todayData];
  id v20 = [NTSectionFeedFilterTransformation alloc];
  id v21 = [(NTNewsTodayResultsExplicitAllocationAggregator *)self configurationManager];
  uint64_t v22 = [v10 readArticlesFilterMethod];
  uint64_t v23 = [v10 seenArticlesFilterMethod];
  double v24 = (double)[v10 seenArticlesMinimumTimeSinceFirstSeenToFilter];
  uint64_t v25 = [(NTNewsTodayResultsExplicitAllocationAggregator *)self filterDate];
  id v26 = -[NTSectionFeedFilterTransformation initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:paywalledArticlesMaxCount:](v20, "initWithTodayData:configurationManager:readArticlesFilterMethod:seenArticlesFilterMethod:minimumTimeSinceFirstSeenToFilter:supplementalFeedFilterOptions:otherArticleIDs:otherClusterIDs:filterDate:paywalledArticlesMaxCount:", v19, v21, v22, v23, v18, v13, v24, v16, v25, [v10 paywalledArticlesMaxCount]);

  return v26;
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
}

- (NSDate)filterDate
{
  return self->_filterDate;
}

- (void)setFilterDate:(id)a3
{
}

- (FCTodayPrivateData)todayData
{
  return self->_todayData;
}

- (void)setTodayData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todayData, 0);
  objc_storeStrong((id *)&self->_filterDate, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);

  objc_storeStrong((id *)&self->_configurationManager, 0);
}

- (void)initWithConfigurationManager:feedPersonalizer:filterDate:todayData:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"filterDate", v6, 2u);
}

- (void)initWithConfigurationManager:feedPersonalizer:filterDate:todayData:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"configurationManager", v6, 2u);
}

- (void)aggregateSections:itemsBySectionDescriptor:budgetInfo:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"itemsBySectionDescriptor", v6, 2u);
}

- (void)aggregateSections:itemsBySectionDescriptor:budgetInfo:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptors", v6, 2u);
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"noRoomForMoreItemsOut", v6, 2u);
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"noMoreItemsToGive", v6, 2u);
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"slotsUsedOut", v6, 2u);
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"remainingSlots >= 0", v6, 2u);
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionItemsLimit > 0", v6, 2u);
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.6()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"priorClusterIDsInOtherSections", v6, 2u);
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.7()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"otherArticleIDs", v6, 2u);
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.8()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"previouslyChosenItems", v6, 2u);
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.9()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"budgetInfo", v6, 2u);
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.10()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"items", v6, 2u);
}

- (void)_itemsForSection:items:withBudgetInfo:previouslyChosenItems:priorClusterIDsInOtherSections:sectionItemsLimit:otherArticleIDs:remainingSlots:slotsUsed:noMoreItemsToGive:noRoomForMoreItems:.cold.11()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptor", v6, 2u);
}

- (void)_sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"priorClusterIDsInSection", v6, 2u);
}

- (void)_sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"otherArticleIDs", v6, 2u);
}

- (void)_sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"priorClusterIDsInOtherSections", v6, 2u);
}

- (void)_sectionFilterTransformationWithDescriptor:priorClusterIDsInOtherSections:priorClusterIDsInSection:otherArticleIDs:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptor", v6, 2u);
}

@end