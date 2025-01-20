@interface PXSectionedChangeDetailsCoalescer
+ (id)changeDetailsByCoalescingChangeDetails:(id)a3;
- (PXSectionedChangeDetailsCoalescer)init;
- (PXSectionedChangeDetailsCoalescer)initWithSectionedChangeDetails:(id)a3;
- (PXSectionedDataSourceChangeDetails)coalescedChangeDetails;
- (void)addChangeDetails:(id)a3;
@end

@implementation PXSectionedChangeDetailsCoalescer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResult, 0);
  objc_storeStrong((id *)&self->_itemChangeEntries, 0);

  objc_storeStrong((id *)&self->_sectionChangeDetails, 0);
}

- (PXSectionedDataSourceChangeDetails)coalescedChangeDetails
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  cachedResult = self->_cachedResult;
  if (cachedResult)
  {
    v3 = cachedResult;
  }
  else
  {
    v4 = self;
    int64_t fromDataSourceIdentifier = self->_fromDataSourceIdentifier;
    int64_t currentToDataSourceIdentifier = self->_currentToDataSourceIdentifier;
    v7 = (void *)[(PXMutableArrayChangeDetails *)self->_sectionChangeDetails copy];
    if ([v7 hasIncrementalChanges])
    {
      int64_t v23 = currentToDataSourceIdentifier;
      int64_t v24 = fromDataSourceIdentifier;
      v25 = v4;
      v26 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSMutableArray count](v4->_itemChangeEntries, "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v8 = v4->_itemChangeEntries;
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        v11 = 0;
        uint64_t v12 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v8);
            }
            v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if ([v14 index] != 0x7FFFFFFFFFFFFFFFLL)
            {
              v15 = [v14 changeDetails];
              v16 = (void *)[v15 copy];
              v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "index"));
              [v26 setObject:v16 forKeyedSubscript:v17];

              v18 = [v14 subitemChangesByItem];
              if ([v18 count])
              {
                if (!v11)
                {
                  v11 = [MEMORY[0x263EFF9A0] dictionary];
                }
                v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "index"));
                [v11 setObject:v18 forKeyedSubscript:v19];
              }
            }
          }
          uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v10);
      }
      else
      {
        v11 = 0;
      }

      v4 = v25;
      int64_t currentToDataSourceIdentifier = v23;
      int64_t fromDataSourceIdentifier = v24;
      v20 = v26;
    }
    else
    {
      v20 = 0;
      v11 = 0;
    }
    v3 = [[PXSectionedDataSourceChangeDetails alloc] initWithFromDataSourceIdentifier:fromDataSourceIdentifier toDataSourceIdentifier:currentToDataSourceIdentifier sectionChanges:v7 itemChangeDetailsBySection:v20 subitemChangeDetailsByItemBySection:v11];
    v21 = v4->_cachedResult;
    v4->_cachedResult = v3;
  }

  return v3;
}

- (void)addChangeDetails:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  cachedResult = self->_cachedResult;
  self->_cachedResult = 0;

  int64_t currentToDataSourceIdentifier = self->_currentToDataSourceIdentifier;
  if (currentToDataSourceIdentifier == [v4 fromDataSourceIdentifier])
  {
    self->_int64_t currentToDataSourceIdentifier = [v4 toDataSourceIdentifier];
    uint64_t v7 = [v4 sectionChanges];
  }
  else
  {
    v8 = PXAssertGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int64_t v21 = self->_currentToDataSourceIdentifier;
      *(_DWORD *)buf = 134218240;
      int64_t v29 = v21;
      __int16 v30 = 2048;
      uint64_t v31 = [v4 fromDataSourceIdentifier];
      _os_log_fault_impl(&dword_259CDA000, v8, OS_LOG_TYPE_FAULT, "Invalid coalescing operation. Sectioned change details are not contiguous (data source don't match: %lu <-> %lu)", buf, 0x16u);
    }

    self->_int64_t currentToDataSourceIdentifier = [v4 toDataSourceIdentifier];
    uint64_t v7 = +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges];
  }
  uint64_t v9 = (void *)v7;
  [(PXMutableArrayChangeDetails *)self->_sectionChangeDetails addChangeDetails:v7];
  if ([(PXMutableArrayChangeDetails *)self->_sectionChangeDetails hasIncrementalChanges])
  {
    uint64_t v10 = [v4 sectionsWithItemChanges];
    v11 = [v10 mutableCopy];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v22 = self;
    uint64_t v12 = self->_itemChangeEntries;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v9, "indexAfterApplyingChangesToIndex:", objc_msgSend(v17, "index"));
          [v17 setIndex:v18];
          if (v18 != 0x7FFFFFFFFFFFFFFFLL && [v11 containsIndex:v18])
          {
            [v17 updateWithSectionedChangeDetails:v4];
            [v11 removeIndex:v18];
          }
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    while ([v11 count])
    {
      uint64_t v19 = [v11 firstIndex];
      [v11 removeIndex:v19];
      if ([(PXArrayChangeDetails *)v22->_sectionChangeDetails indexAfterRevertingChangesFromIndex:v19] != 0x7FFFFFFFFFFFFFFFLL)
      {
        v20 = _PXChangeDetailsEntryForSection(v19, v4);
        [(NSMutableArray *)v22->_itemChangeEntries addObject:v20];
      }
    }
  }
  else
  {
    v11 = PXChangeDetailsCoalescerGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259CDA000, v11, OS_LOG_TYPE_DEFAULT, "Failed to coalesce sectioned change details due to non-incremental section changes", buf, 2u);
    }
  }
}

- (PXSectionedChangeDetailsCoalescer)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSectionedChangeDetailsCoalescer.m", 159, @"%s is not available as initializer", "-[PXSectionedChangeDetailsCoalescer init]");

  abort();
}

- (PXSectionedChangeDetailsCoalescer)initWithSectionedChangeDetails:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXSectionedChangeDetailsCoalescer;
  v5 = [(PXSectionedChangeDetailsCoalescer *)&v17 init];
  if (v5)
  {
    v6 = PXChangeDetailsCoalescerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_259CDA000, v6, OS_LOG_TYPE_DEBUG, "PXSectionedChangeDetailsCoalescer: Initializing %@ with change details: %@", buf, 0x16u);
    }

    v5->_int64_t fromDataSourceIdentifier = [v4 fromDataSourceIdentifier];
    v5->_int64_t currentToDataSourceIdentifier = [v4 toDataSourceIdentifier];
    uint64_t v7 = [v4 sectionChanges];
    uint64_t v8 = [v7 mutableCopy];
    sectionChangeDetails = v5->_sectionChangeDetails;
    v5->_sectionChangeDetails = (PXMutableArrayChangeDetails *)v8;

    uint64_t v10 = [v4 sectionsWithItemChanges];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v10, "count"));
    itemChangeEntries = v5->_itemChangeEntries;
    v5->_itemChangeEntries = (NSMutableArray *)v11;

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__PXSectionedChangeDetailsCoalescer_initWithSectionedChangeDetails___block_invoke;
    v14[3] = &unk_26545BA70;
    id v15 = v4;
    v16 = v5;
    [v10 enumerateIndexesUsingBlock:v14];
  }
  return v5;
}

void __68__PXSectionedChangeDetailsCoalescer_initWithSectionedChangeDetails___block_invoke(uint64_t a1, uint64_t a2)
{
  _PXChangeDetailsEntryForSection(a2, *(void **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 40) + 32) addObject:v3];
}

+ (id)changeDetailsByCoalescingChangeDetails:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![v5 count])
  {
    __int16 v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PXSectionedChangeDetailsCoalescer.m", 163, @"Invalid parameter not satisfying: %@", @"changeDetailsArray.count > 0" object file lineNumber description];
  }
  uint64_t v6 = [v5 count];
  uint64_t v7 = PXChangeDetailsCoalescerGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6 == 1)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259CDA000, v7, OS_LOG_TYPE_DEBUG, "PXSectionedChangeDetailsCoalescer: Early return for single changeDetails", buf, 2u);
    }

    uint64_t v9 = [v5 firstObject];
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = [v5 count];
      _os_log_impl(&dword_259CDA000, v7, OS_LOG_TYPE_DEBUG, "PXSectionedChangeDetailsCoalescer: BEGIN COALESCING %lu changes", buf, 0xCu);
    }

    uint64_t v10 = [PXSectionedChangeDetailsCoalescer alloc];
    uint64_t v11 = [v5 objectAtIndexedSubscript:0];
    uint64_t v12 = [(PXSectionedChangeDetailsCoalescer *)v10 initWithSectionedChangeDetails:v11];

    if ((unint64_t)[v5 count] >= 2)
    {
      unint64_t v13 = 1;
      do
      {
        uint64_t v14 = PXChangeDetailsCoalescerGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          id v15 = [v5 objectAtIndexedSubscript:v13];
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = (uint64_t)v15;
          _os_log_impl(&dword_259CDA000, v14, OS_LOG_TYPE_DEBUG, "PXSectionedChangeDetailsCoalescer: Adding child details: %@", buf, 0xCu);
        }
        v16 = [v5 objectAtIndexedSubscript:v13];
        [(PXSectionedChangeDetailsCoalescer *)v12 addChangeDetails:v16];

        ++v13;
      }
      while (v13 < [v5 count]);
    }
    uint64_t v9 = [(PXSectionedChangeDetailsCoalescer *)v12 coalescedChangeDetails];
    objc_super v17 = PXChangeDetailsCoalescerGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = (uint64_t)v9;
      _os_log_impl(&dword_259CDA000, v17, OS_LOG_TYPE_DEBUG, "PXSectionedChangeDetailsCoalescer: Final details: %@", buf, 0xCu);
    }

    uint64_t v18 = PXChangeDetailsCoalescerGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_259CDA000, v18, OS_LOG_TYPE_DEBUG, "PXSectionedChangeDetailsCoalescer: END COALESCING", buf, 2u);
    }
  }

  return v9;
}

@end