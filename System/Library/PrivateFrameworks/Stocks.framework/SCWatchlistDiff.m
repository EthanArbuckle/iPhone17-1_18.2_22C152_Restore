@interface SCWatchlistDiff
+ (id)reorderedStocksFrom:(id)a3 to:(id)a4;
- (BOOL)isEmpty;
- (NSArray)addedStocks;
- (NSArray)removedStocks;
- (NSArray)reorderedStocks;
- (NSArray)stocksPostDiff;
- (NSArray)stocksPreDiff;
- (NSDictionary)indexesOfAddedStocks;
- (NSDictionary)indexesOfReorderedStocks;
- (SCWatchlistDiff)initWithOldStocks:(id)a3 newStocks:(id)a4;
@end

@implementation SCWatchlistDiff

- (SCWatchlistDiff)initWithOldStocks:(id)a3 newStocks:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v67.receiver = self;
  v67.super_class = (Class)SCWatchlistDiff;
  v8 = [(SCWatchlistDiff *)&v67 init];
  v9 = v8;
  if (v8)
  {
    v57 = v8;
    v10 = [MEMORY[0x263EFFA08] setWithArray:v6];
    v11 = [MEMORY[0x263EFFA08] setWithArray:v7];
    v56 = (void *)[v10 mutableCopy];
    [v56 minusSet:v11];
    v53 = v11;
    v12 = (void *)[v11 mutableCopy];
    v54 = v10;
    [v12 minusSet:v10];
    v13 = [MEMORY[0x263EFF9A0] dictionary];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    obuint64_t j = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v64 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v63 + 1) + 8 * i);
          v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "indexOfObject:", v18));
          [(NSDictionary *)v13 setObject:v19 forKey:v18];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
      }
      while (v15);
    }

    v55 = v6;
    v20 = [MEMORY[0x263EFF9B0] orderedSetWithArray:v6];
    [v20 minusSet:v56];
    [v20 minusSet:obj];
    v21 = [MEMORY[0x263EFF9B0] orderedSetWithArray:v7];
    [v21 minusSet:v56];
    [v21 minusSet:obj];
    v22 = [(id)objc_opt_class() reorderedStocksFrom:v20 to:v21];
    v51 = v21;
    v52 = v20;
    v23 = [(id)objc_opt_class() reorderedStocksFrom:v21 to:v20];
    unint64_t v24 = [v22 count];
    v49 = v23;
    v50 = v22;
    if (v24 >= [v23 count]) {
      v25 = v23;
    }
    else {
      v25 = v22;
    }
    id v26 = v25;
    v27 = [MEMORY[0x263EFF9A0] dictionary];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v28 = v26;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v60 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v59 + 1) + 8 * j);
          v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "indexOfObject:", v33, v49, v50));
          [(NSDictionary *)v27 setObject:v34 forKey:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v30);
    }

    id v6 = v55;
    uint64_t v35 = [v55 copy];
    v9 = v57;
    stocksPreDiff = v57->_stocksPreDiff;
    v57->_stocksPreDiff = (NSArray *)v35;

    uint64_t v37 = [v7 copy];
    stocksPostDiff = v57->_stocksPostDiff;
    v57->_stocksPostDiff = (NSArray *)v37;

    uint64_t v39 = [obj allObjects];
    addedStocks = v57->_addedStocks;
    v57->_addedStocks = (NSArray *)v39;

    indexesOfAddedStocks = v57->_indexesOfAddedStocks;
    v57->_indexesOfAddedStocks = v13;
    v42 = v13;

    uint64_t v43 = [v56 allObjects];
    removedStocks = v57->_removedStocks;
    v57->_removedStocks = (NSArray *)v43;

    uint64_t v45 = [v28 allObjects];
    reorderedStocks = v57->_reorderedStocks;
    v57->_reorderedStocks = (NSArray *)v45;

    indexesOfReorderedStocks = v57->_indexesOfReorderedStocks;
    v57->_indexesOfReorderedStocks = v27;
  }
  return v9;
}

+ (id)reorderedStocksFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF9C0] set];
  v8 = (void *)[v5 mutableCopy];
  v9 = (void *)[v6 mutableCopy];
  v10 = v9;
  while ([v9 count])
  {
    v11 = [v10 firstObject];
    uint64_t v12 = [v8 indexOfObject:v11];
    if (v12) {
      [v7 addObject:v11];
    }
    [v10 removeObjectAtIndex:0];
    [v8 removeObjectAtIndex:v12];

    v9 = v10;
  }

  return v7;
}

- (BOOL)isEmpty
{
  v3 = [(SCWatchlistDiff *)self addedStocks];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(SCWatchlistDiff *)self removedStocks];
    if ([v5 count])
    {
      BOOL v4 = 0;
    }
    else
    {
      id v6 = [(SCWatchlistDiff *)self reorderedStocks];
      BOOL v4 = [v6 count] == 0;
    }
  }

  return v4;
}

- (NSArray)addedStocks
{
  return self->_addedStocks;
}

- (NSDictionary)indexesOfAddedStocks
{
  return self->_indexesOfAddedStocks;
}

- (NSArray)removedStocks
{
  return self->_removedStocks;
}

- (NSArray)reorderedStocks
{
  return self->_reorderedStocks;
}

- (NSDictionary)indexesOfReorderedStocks
{
  return self->_indexesOfReorderedStocks;
}

- (NSArray)stocksPreDiff
{
  return self->_stocksPreDiff;
}

- (NSArray)stocksPostDiff
{
  return self->_stocksPostDiff;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stocksPostDiff, 0);
  objc_storeStrong((id *)&self->_stocksPreDiff, 0);
  objc_storeStrong((id *)&self->_indexesOfReorderedStocks, 0);
  objc_storeStrong((id *)&self->_reorderedStocks, 0);
  objc_storeStrong((id *)&self->_removedStocks, 0);
  objc_storeStrong((id *)&self->_indexesOfAddedStocks, 0);

  objc_storeStrong((id *)&self->_addedStocks, 0);
}

@end