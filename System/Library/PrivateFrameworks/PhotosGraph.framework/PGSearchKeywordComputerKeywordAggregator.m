@interface PGSearchKeywordComputerKeywordAggregator
- (NSDictionary)aggregatedKeywords;
- (PGSearchKeywordComputerKeywordAggregator)init;
- (void)aggregateKeywordArraysByCategoryMask:(id)a3 forMomentUUID:(id)a4 fromUniversalStartDate:(id)a5 toEndDate:(id)a6;
- (void)aggregateKeywordsByCategoryMask:(id)a3 forMomentNode:(id)a4;
- (void)aggregateKeywordsByCategoryMask:(id)a3 forMomentUUID:(id)a4 duringDateInterval:(id)a5;
@end

@implementation PGSearchKeywordComputerKeywordAggregator

- (void).cxx_destruct
{
}

- (void)aggregateKeywordArraysByCategoryMask:(id)a3 forMomentUUID:(id)a4 fromUniversalStartDate:(id)a5 toEndDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  keywordsByCategoryMaskByDateIntervalByMomentUUID = self->_keywordsByCategoryMaskByDateIntervalByMomentUUID;
  id v13 = a6;
  id v14 = a5;
  id v15 = [(NSMutableDictionary *)keywordsByCategoryMaskByDateIntervalByMomentUUID objectForKeyedSubscript:v11];
  if (!v15)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_keywordsByCategoryMaskByDateIntervalByMomentUUID setObject:v15 forKeyedSubscript:v11];
  }
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v14 endDate:v13];

  v17 = [v15 objectForKeyedSubscript:v16];
  if (!v17)
  {
    v17 = [MEMORY[0x1E4F1CA60] dictionary];
    [v15 setObject:v17 forKeyedSubscript:v16];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __128__PGSearchKeywordComputerKeywordAggregator_aggregateKeywordArraysByCategoryMask_forMomentUUID_fromUniversalStartDate_toEndDate___block_invoke;
  v19[3] = &unk_1E68EB5B0;
  id v20 = v17;
  id v18 = v17;
  [v10 enumerateKeysAndObjectsUsingBlock:v19];
}

void __128__PGSearchKeywordComputerKeywordAggregator_aggregateKeywordArraysByCategoryMask_forMomentUUID_fromUniversalStartDate_toEndDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:v10];
  v8 = v7;
  if (v7)
  {
    [v7 addObjectsFromArray:v6];
  }
  else
  {
    uint64_t v9 = [v6 mutableCopy];

    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
    id v6 = (id)v9;
  }
}

- (void)aggregateKeywordsByCategoryMask:(id)a3 forMomentUUID:(id)a4 duringDateInterval:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(NSMutableDictionary *)self->_keywordsByCategoryMaskByDateIntervalByMomentUUID objectForKeyedSubscript:v8];
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_keywordsByCategoryMaskByDateIntervalByMomentUUID setObject:v10 forKeyedSubscript:v8];
  }
  id v11 = [v10 objectForKeyedSubscript:v9];
  v12 = v11;
  if (v11)
  {
    [v11 addEntriesFromDictionary:v14];
  }
  else
  {
    id v13 = (void *)[v14 mutableCopy];
    [v10 setObject:v13 forKeyedSubscript:v9];
  }
}

- (void)aggregateKeywordsByCategoryMask:(id)a3 forMomentNode:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F28C18];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v15 = (id)[v9 initWithStartDate:v10 endDate:v11];

  v12 = (void *)MEMORY[0x1E4F391D0];
  id v13 = [v7 localIdentifier];

  id v14 = [v12 uuidFromLocalIdentifier:v13];

  [(PGSearchKeywordComputerKeywordAggregator *)self aggregateKeywordsByCategoryMask:v8 forMomentUUID:v14 duringDateInterval:v15];
}

- (NSDictionary)aggregatedKeywords
{
  return (NSDictionary *)self->_keywordsByCategoryMaskByDateIntervalByMomentUUID;
}

- (PGSearchKeywordComputerKeywordAggregator)init
{
  v6.receiver = self;
  v6.super_class = (Class)PGSearchKeywordComputerKeywordAggregator;
  v2 = [(PGSearchKeywordComputerKeywordAggregator *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    keywordsByCategoryMaskByDateIntervalByMomentUUID = v2->_keywordsByCategoryMaskByDateIntervalByMomentUUID;
    v2->_keywordsByCategoryMaskByDateIntervalByMomentUUID = v3;
  }
  return v2;
}

@end