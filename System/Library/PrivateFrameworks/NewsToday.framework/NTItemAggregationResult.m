@interface NTItemAggregationResult
- (NSDictionary)aggregatedItemsBySectionDescriptor;
- (NSSet)unusedSectionDescriptors;
- (NTItemAggregationResult)init;
- (NTItemAggregationResult)initWithAggregatedItemsBySectionDescriptor:(id)a3 unusedSectionDescriptors:(id)a4;
- (double)headlineScale;
- (double)headlineSlotCostWithSlotCost:(double)a3;
- (double)sectionOverheadSlotCostWithInfo:(id)a3;
- (double)slotCostWithInfo:(id)a3;
- (double)slotsUsed;
- (id)copyWithHeadlineScale:(double)a3;
- (unint64_t)itemCount;
- (void)setAggregatedItemsBySectionDescriptor:(id)a3;
- (void)setHeadlineScale:(double)a3;
- (void)setSlotsUsed:(double)a3;
- (void)setUnusedSectionDescriptors:(id)a3;
@end

@implementation NTItemAggregationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unusedSectionDescriptors, 0);

  objc_storeStrong((id *)&self->_aggregatedItemsBySectionDescriptor, 0);
}

- (double)headlineScale
{
  return self->_headlineScale;
}

- (NTItemAggregationResult)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTItemAggregationResult init]";
    __int16 v9 = 2080;
    v10 = "NTNewsTodayResultsExplicitAllocationAggregator.m";
    __int16 v11 = 1024;
    int v12 = 56;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTItemAggregationResult init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTItemAggregationResult)initWithAggregatedItemsBySectionDescriptor:(id)a3 unusedSectionDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTItemAggregationResult initWithAggregatedItemsBySectionDescriptor:unusedSectionDescriptors:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTItemAggregationResult initWithAggregatedItemsBySectionDescriptor:unusedSectionDescriptors:]();
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)NTItemAggregationResult;
  v8 = [(NTItemAggregationResult *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    aggregatedItemsBySectionDescriptor = v8->_aggregatedItemsBySectionDescriptor;
    v8->_aggregatedItemsBySectionDescriptor = (NSDictionary *)v9;

    uint64_t v11 = [v7 copy];
    unusedSectionDescriptors = v8->_unusedSectionDescriptors;
    v8->_unusedSectionDescriptors = (NSSet *)v11;

    v8->_headlineScale = 1.0;
  }

  return v8;
}

- (id)copyWithHeadlineScale:(double)a3
{
  v5 = [NTItemAggregationResult alloc];
  id v6 = [(NTItemAggregationResult *)self aggregatedItemsBySectionDescriptor];
  id v7 = [(NTItemAggregationResult *)self unusedSectionDescriptors];
  v8 = [(NTItemAggregationResult *)v5 initWithAggregatedItemsBySectionDescriptor:v6 unusedSectionDescriptors:v7];

  [(NTItemAggregationResult *)v8 setHeadlineScale:a3];
  return v8;
}

- (double)headlineSlotCostWithSlotCost:(double)a3
{
  uint64_t v11 = 0;
  int v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v5 = [(NTItemAggregationResult *)self aggregatedItemsBySectionDescriptor];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__NTItemAggregationResult_headlineSlotCostWithSlotCost___block_invoke;
  v10[3] = &unk_26475CE90;
  v10[4] = &v11;
  *(double *)&v10[5] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  double v6 = v12[3];
  [(NTItemAggregationResult *)self headlineScale];
  double v8 = v6 * v7;
  _Block_object_dispose(&v11, 8);
  return v8;
}

double __56__NTItemAggregationResult_headlineSlotCostWithSlotCost___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = *(double *)(a1 + 40);
  unint64_t v5 = [a3 count];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v6 + 24) + v4 * (double)v5;
  *(double *)(v6 + 24) = result;
  return result;
}

- (double)sectionOverheadSlotCostWithInfo:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  unint64_t v5 = [(NTItemAggregationResult *)self aggregatedItemsBySectionDescriptor];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__NTItemAggregationResult_sectionOverheadSlotCostWithInfo___block_invoke;
  v9[3] = &unk_26475CEB8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  double v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __59__NTItemAggregationResult_sectionOverheadSlotCostWithInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  uint64_t v5 = [a3 count];
  id v6 = v15;
  if (v5)
  {
    uint64_t v7 = [v15 name];
    if (v7)
    {
      double v8 = (void *)v7;
      int v9 = [*(id *)(a1 + 32) allowSectionTitles];

      if (v9)
      {
        id v10 = [*(id *)(a1 + 32) sectionSlotCostInfo];
        [v10 sectionTitleSlotCost];
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                + 24);
      }
    }
    uint64_t v12 = [*(id *)(a1 + 32) sectionSlotCostInfo];
    [v12 sectionFooterSlotCost];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v13
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);

    id v6 = v15;
  }

  return MEMORY[0x270F9A758](v5, v6);
}

- (double)slotCostWithInfo:(id)a3
{
  id v4 = a3;
  [(NTItemAggregationResult *)self sectionOverheadSlotCostWithInfo:v4];
  double v6 = v5;
  uint64_t v7 = [v4 sectionSlotCostInfo];

  [v7 headlineSlotCost];
  -[NTItemAggregationResult headlineSlotCostWithSlotCost:](self, "headlineSlotCostWithSlotCost:");
  double v9 = v6 + v8;

  return v9;
}

- (unint64_t)itemCount
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NTItemAggregationResult *)self aggregatedItemsBySectionDescriptor];
  v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) count];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (NSDictionary)aggregatedItemsBySectionDescriptor
{
  return self->_aggregatedItemsBySectionDescriptor;
}

- (void)setAggregatedItemsBySectionDescriptor:(id)a3
{
}

- (NSSet)unusedSectionDescriptors
{
  return self->_unusedSectionDescriptors;
}

- (void)setUnusedSectionDescriptors:(id)a3
{
}

- (void)setHeadlineScale:(double)a3
{
  self->_headlineScale = a3;
}

- (double)slotsUsed
{
  return self->_slotsUsed;
}

- (void)setSlotsUsed:(double)a3
{
  self->_slotsUsed = a3;
}

- (void)initWithAggregatedItemsBySectionDescriptor:unusedSectionDescriptors:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"unusedSectionDescriptors", v6, 2u);
}

- (void)initWithAggregatedItemsBySectionDescriptor:unusedSectionDescriptors:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"aggregatedItemsBySectionDescriptor", v6, 2u);
}

@end