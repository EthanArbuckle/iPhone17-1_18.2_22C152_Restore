@interface NTNewsTodayResultsSourceFetchHelper
- (NSMutableArray)sectionQueueDescriptors;
- (NSMutableDictionary)remainingSectionsBySectionQueueDescriptors;
- (NTNewsTodayResultsSourceFetchHelper)init;
- (NTNewsTodayResultsSourceFetchHelper)initWithSectionQueueDescriptors:(id)a3;
- (id)sectionDescriptorsAtHeadsOfQueues;
- (void)removeSectionDescriptors:(id)a3;
- (void)setRemainingSectionsBySectionQueueDescriptors:(id)a3;
- (void)setSectionQueueDescriptors:(id)a3;
@end

@implementation NTNewsTodayResultsSourceFetchHelper

- (NTNewsTodayResultsSourceFetchHelper)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTNewsTodayResultsSourceFetchHelper init]";
    __int16 v9 = 2080;
    v10 = "NTNewsTodayResultsSourceFetchHelper.m";
    __int16 v11 = 1024;
    int v12 = 33;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTNewsTodayResultsSourceFetchHelper init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTNewsTodayResultsSourceFetchHelper)initWithSectionQueueDescriptors:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsSourceFetchHelper initWithSectionQueueDescriptors:]();
  }
  v25.receiver = self;
  v25.super_class = (Class)NTNewsTodayResultsSourceFetchHelper;
  v5 = [(NTNewsTodayResultsSourceFetchHelper *)&v25 init];
  if (v5)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    v7 = (NSMutableDictionary *)objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v14 = [v13 sectionDescriptors];
          if ([v14 count])
          {
            [(NSMutableArray *)v6 addObject:v13];
            uint64_t v15 = (void *)[v14 mutableCopy];
            [(NSMutableDictionary *)v7 setObject:v15 forKeyedSubscript:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v10);
    }

    sectionQueueDescriptors = v5->_sectionQueueDescriptors;
    v5->_sectionQueueDescriptors = v6;
    v17 = v6;

    remainingSectionsBySectionQueueDescriptors = v5->_remainingSectionsBySectionQueueDescriptors;
    v5->_remainingSectionsBySectionQueueDescriptors = v7;

    id v4 = v20;
  }

  return v5;
}

- (id)sectionDescriptorsAtHeadsOfQueues
{
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  v5 = [(NTNewsTodayResultsSourceFetchHelper *)self sectionQueueDescriptors];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__NTNewsTodayResultsSourceFetchHelper_sectionDescriptorsAtHeadsOfQueues__block_invoke;
  v11[3] = &unk_26475CA48;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [v5 enumerateObjectsUsingBlock:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

void __72__NTNewsTodayResultsSourceFetchHelper_sectionDescriptorsAtHeadsOfQueues__block_invoke(id *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1[4] remainingSectionsBySectionQueueDescriptors];
  v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = objc_msgSend(v5, "fc_subarrayWithMaxCount:", objc_msgSend(v3, "visibleSectionConfigsLimit"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "identifier", (void)v15);
        if (([a1[5] containsObject:v13] & 1) == 0)
        {
          v14 = [[NTNewsTodayResultsSourceFetchHelperSectionDescriptor alloc] initWithSectionDescriptor:v12 parentSectionQueueDescriptor:v3];
          [a1[6] addObject:v14];
          [a1[5] addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)removeSectionDescriptors:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsSourceFetchHelper removeSectionDescriptors:]();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        uint64_t v10 = FCCheckedDynamicCast();
        uint64_t v11 = [v10 parentSectionQueueDescriptor];
        id v12 = [(NTNewsTodayResultsSourceFetchHelper *)self remainingSectionsBySectionQueueDescriptors];
        id v13 = [v12 objectForKeyedSubscript:v11];

        if (![v13 count] && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          long long v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"expected inequality between %s and %s", "remainingSectionsForParent.count", "0");
          *(_DWORD *)buf = 136315906;
          long long v22 = "-[NTNewsTodayResultsSourceFetchHelper removeSectionDescriptors:]";
          __int16 v23 = 2080;
          long long v24 = "NTNewsTodayResultsSourceFetchHelper.m";
          __int16 v25 = 1024;
          int v26 = 104;
          __int16 v27 = 2114;
          v28 = v16;
          _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        if ([v13 count] == 1)
        {
          v14 = [(NTNewsTodayResultsSourceFetchHelper *)self sectionQueueDescriptors];
          [v14 removeObject:v11];

          long long v15 = [(NTNewsTodayResultsSourceFetchHelper *)self remainingSectionsBySectionQueueDescriptors];
          [v15 removeObjectForKey:v11];
        }
        else
        {
          [v13 removeObjectAtIndex:0];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v29 count:16];
    }
    while (v7);
  }
}

- (NSMutableArray)sectionQueueDescriptors
{
  return self->_sectionQueueDescriptors;
}

- (void)setSectionQueueDescriptors:(id)a3
{
}

- (NSMutableDictionary)remainingSectionsBySectionQueueDescriptors
{
  return self->_remainingSectionsBySectionQueueDescriptors;
}

- (void)setRemainingSectionsBySectionQueueDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingSectionsBySectionQueueDescriptors, 0);

  objc_storeStrong((id *)&self->_sectionQueueDescriptors, 0);
}

- (void)initWithSectionQueueDescriptors:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionQueueDescriptors", v6, 2u);
}

- (void)removeSectionDescriptors:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptors", v6, 2u);
}

@end