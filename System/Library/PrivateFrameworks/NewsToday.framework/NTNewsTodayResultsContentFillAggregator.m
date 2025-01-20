@interface NTNewsTodayResultsContentFillAggregator
- (NTNewsTodayResultsContentFillAggregator)init;
- (NTNewsTodayResultsContentFillAggregator)initWithAggregator:(id)a3 minHeadlineScale:(double)a4 maxHeadlineScale:(double)a5;
- (NTTodayResultsAggregator)aggregator;
- (double)maxHeadlineScale;
- (double)minHeadlineScale;
- (id)_aggregateSections:(id)a3 itemsBySectionDescriptor:(id)a4 budgetInfo:(id)a5 scale:(double)a6;
- (id)_bestResultOfResults:(id)a3 withBudgetInfo:(id)a4;
- (id)aggregateSections:(id)a3 itemsBySectionDescriptor:(id)a4 budgetInfo:(id)a5;
- (void)setAggregator:(id)a3;
- (void)setMaxHeadlineScale:(double)a3;
- (void)setMinHeadlineScale:(double)a3;
@end

@implementation NTNewsTodayResultsContentFillAggregator

- (NTNewsTodayResultsContentFillAggregator)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTNewsTodayResultsContentFillAggregator init]";
    __int16 v9 = 2080;
    v10 = "NTNewsTodayResultsContentFillAggregator.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTNewsTodayResultsContentFillAggregator init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTNewsTodayResultsContentFillAggregator)initWithAggregator:(id)a3 minHeadlineScale:(double)a4 maxHeadlineScale:(double)a5
{
  id v9 = a3;
  if (!v9 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsContentFillAggregator initWithAggregator:minHeadlineScale:maxHeadlineScale:].cold.4();
  }
  if (a4 < 0.0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsContentFillAggregator initWithAggregator:minHeadlineScale:maxHeadlineScale:]();
  }
  if (a5 < 0.0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsContentFillAggregator initWithAggregator:minHeadlineScale:maxHeadlineScale:]();
  }
  if (a4 > a5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsContentFillAggregator initWithAggregator:minHeadlineScale:maxHeadlineScale:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)NTNewsTodayResultsContentFillAggregator;
  v10 = [(NTNewsTodayResultsContentFillAggregator *)&v15 init];
  __int16 v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_aggregator, a3);
    double v12 = 1.0;
    if (a4 == 0.0) {
      double v13 = 1.0;
    }
    else {
      double v13 = a4;
    }
    if (a5 != 0.0) {
      double v12 = a5;
    }
    v11->_minHeadlineScale = v13;
    v11->_maxHeadlineScale = v12;
  }

  return v11;
}

- (id)aggregateSections:(id)a3 itemsBySectionDescriptor:(id)a4 budgetInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(NTNewsTodayResultsContentFillAggregator *)self minHeadlineScale];
  double v12 = v11;
  [(NTNewsTodayResultsContentFillAggregator *)self maxHeadlineScale];
  double v14 = v13;
  objc_super v15 = [v10 sectionSlotCostInfo];
  [v15 headlineSlotCost];
  double v17 = v16;
  v18 = [v10 sectionSlotCostInfo];
  [v18 sectionTitleSlotCost];
  double v20 = v19;
  v21 = [v10 sectionSlotCostInfo];
  [v21 sectionFooterSlotCost];
  double v23 = v22;
  [v10 slotsLimit];
  double v25 = v24;

  v26 = [v10 sectionSlotCostInfo];
  [v26 sectionTitleSlotCost];
  double v28 = v27;
  [v10 slotsLimit];
  double v30 = v28 / v29;

  v31 = objc_opt_new();
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __97__NTNewsTodayResultsContentFillAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke;
  v52[3] = &unk_26475CFB8;
  v52[4] = self;
  id v32 = v8;
  id v53 = v32;
  id v33 = v9;
  id v54 = v33;
  id v34 = v10;
  id v55 = v34;
  id v35 = v31;
  id v56 = v35;
  v36 = (void (**)(void, double))MEMORY[0x22A638590](v52);
  if (v12 != 1.0)
  {
    double v37 = v12 - (v17 + v20 + v23) / v25;
    double v38 = 1.0 - v30;
    if (1.0 - v30 >= v37 && v38 > 0.0)
    {
      do
      {
        v36[2](v36, v38);
        double v38 = v38 - v30;
      }
      while (v38 >= v37 && v38 > 0.0);
    }
  }
  if (v14 != 1.0)
  {
    for (double i = v30 + 1.0; i <= v14; double i = v30 + i)
      v36[2](v36, i);
  }
  v36[2](v36, 1.0);
  if (![v35 count])
  {
    v40 = [(NTNewsTodayResultsContentFillAggregator *)self aggregator];
    v41 = [v40 aggregateSections:v32 itemsBySectionDescriptor:v33 budgetInfo:v34];

    [(NTNewsTodayResultsContentFillAggregator *)self maxHeadlineScale];
    v42 = objc_msgSend(v41, "copyWithHeadlineScale:");
    [v42 slotCostWithInfo:v34];
    double v44 = v43;
    [v34 slotsLimit];
    if (v44 <= v45)
    {
      v48 = v35;
      v49 = v42;
    }
    else
    {
      [(NTNewsTodayResultsContentFillAggregator *)self minHeadlineScale];
      if (v46 > 1.0)
      {
        [(NTNewsTodayResultsContentFillAggregator *)self minHeadlineScale];
        v47 = objc_msgSend(v41, "copyWithHeadlineScale:");
        [v35 addObject:v47];

LABEL_16:
        goto LABEL_17;
      }
      v48 = v35;
      v49 = v41;
    }
    [v48 addObject:v49];
    goto LABEL_16;
  }
LABEL_17:
  v50 = [(NTNewsTodayResultsContentFillAggregator *)self _bestResultOfResults:v35 withBudgetInfo:v34];

  return v50;
}

uint64_t __97__NTNewsTodayResultsContentFillAggregator_aggregateSections_itemsBySectionDescriptor_budgetInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v5 = v2;
    uint64_t v2 = [*(id *)(a1 + 64) addObject:v2];
    uint64_t v3 = v5;
  }

  return MEMORY[0x270F9A758](v2, v3);
}

- (id)_aggregateSections:(id)a3 itemsBySectionDescriptor:(id)a4 budgetInfo:(id)a5 scale:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsContentFillAggregator _aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:].cold.4();
    if (v11) {
      goto LABEL_6;
    }
  }
  else if (v11)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsContentFillAggregator _aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:]();
  }
LABEL_6:
  if (!v12 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsContentFillAggregator _aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:]();
  }
  if (a6 <= 0.0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsContentFillAggregator _aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:]();
  }
  double v13 = (void *)[v12 copy];
  double v14 = [v13 sectionSlotCostInfo];
  [v14 headlineSlotCost];
  [v14 setHeadlineSlotCost:v15 * a6];

  double v16 = [(NTNewsTodayResultsContentFillAggregator *)self aggregator];
  double v17 = [v16 aggregateSections:v10 itemsBySectionDescriptor:v11 budgetInfo:v13];

  [v17 sectionOverheadSlotCostWithInfo:v12];
  double v19 = v18;
  double v20 = [v12 sectionSlotCostInfo];
  [v20 headlineSlotCost];
  objc_msgSend(v17, "headlineSlotCostWithSlotCost:");
  double v22 = v21;

  [v12 slotsLimit];
  double v24 = (v23 - v19) / v22;
  [(NTNewsTodayResultsContentFillAggregator *)self minHeadlineScale];
  if (v25 <= v24 && ([(NTNewsTodayResultsContentFillAggregator *)self maxHeadlineScale], v24 <= v26)) {
    double v27 = (void *)[v17 copyWithHeadlineScale:v24];
  }
  else {
    double v27 = 0;
  }

  return v27;
}

- (id)_bestResultOfResults:(id)a3 withBudgetInfo:(id)a4
{
  v18[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__NTNewsTodayResultsContentFillAggregator__bestResultOfResults_withBudgetInfo___block_invoke;
  v16[3] = &unk_26475CFE0;
  id v7 = v6;
  id v17 = v7;
  id v8 = objc_msgSend(v5, "fc_arrayOfObjectsPassingTest:", v16);
  if ([v8 count])
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"itemCount" ascending:0];
    id v10 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"headlineScale" ascending:1 comparator:&__block_literal_global_8];
    v18[0] = v10;
    v18[1] = v9;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    id v12 = [v8 sortedArrayUsingDescriptors:v11];
    double v13 = [v12 firstObject];
  }
  else
  {
    id v15 = v5;
    double v13 = [v15 firstObject];
    id v9 = v15;
  }

  return v13;
}

BOOL __79__NTNewsTodayResultsContentFillAggregator__bestResultOfResults_withBudgetInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 slotsLimit];
  double v6 = v5;
  [v4 slotCostWithInfo:*(void *)(a1 + 32)];
  double v8 = v7;

  return vabdd_f64(v6, v8) < 0.01;
}

uint64_t __79__NTNewsTodayResultsContentFillAggregator__bestResultOfResults_withBudgetInfo___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) firstObject];
}

uint64_t __79__NTNewsTodayResultsContentFillAggregator__bestResultOfResults_withBudgetInfo___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 doubleValue];
  double v7 = v6 + -1.0;
  if (v7 < 0.0) {
    double v7 = -v7;
  }
  double v8 = [v4 numberWithDouble:v7];
  id v9 = NSNumber;
  [v5 doubleValue];
  double v11 = v10;

  double v12 = v11 + -1.0;
  if (v11 + -1.0 < 0.0) {
    double v12 = -(v11 + -1.0);
  }
  double v13 = [v9 numberWithDouble:v12];
  uint64_t v14 = [v8 compare:v13];

  return v14;
}

- (double)minHeadlineScale
{
  return self->_minHeadlineScale;
}

- (void)setMinHeadlineScale:(double)a3
{
  self->_minHeadlineScale = a3;
}

- (double)maxHeadlineScale
{
  return self->_maxHeadlineScale;
}

- (void)setMaxHeadlineScale:(double)a3
{
  self->_maxHeadlineScale = a3;
}

- (NTTodayResultsAggregator)aggregator
{
  return self->_aggregator;
}

- (void)setAggregator:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithAggregator:minHeadlineScale:maxHeadlineScale:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"minHeadlineScale <= maxHeadlineScale", v6, 2u);
}

- (void)initWithAggregator:minHeadlineScale:maxHeadlineScale:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"0 <= maxHeadlineScale", v6, 2u);
}

- (void)initWithAggregator:minHeadlineScale:maxHeadlineScale:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"0 <= minHeadlineScale", v6, 2u);
}

- (void)initWithAggregator:minHeadlineScale:maxHeadlineScale:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aggregator", v6, 2u);
}

- (void)_aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"inputScale > 0", v6, 2u);
}

- (void)_aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"budgetInfo", v6, 2u);
}

- (void)_aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"itemsBySectionDescriptor", v6, 2u);
}

- (void)_aggregateSections:itemsBySectionDescriptor:budgetInfo:scale:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptors", v6, 2u);
}

@end