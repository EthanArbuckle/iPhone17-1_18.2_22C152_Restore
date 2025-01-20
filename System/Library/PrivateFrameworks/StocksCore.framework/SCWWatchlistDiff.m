@interface SCWWatchlistDiff
+ (id)reorderedSymbolsFrom:(id)a3 to:(id)a4;
- (BOOL)isEmpty;
- (NSArray)addedSymbols;
- (NSArray)removedSymbols;
- (NSArray)reorderedSymbols;
- (NSArray)symbolsPostDiff;
- (NSArray)symbolsPreDiff;
- (NSDictionary)indexesOfAddedSymbols;
- (NSDictionary)indexesOfReorderedSymbols;
- (NSNumber)updatedDisplayState;
- (NSNumber)updatedSortOrderState;
- (NSNumber)updatedSortState;
- (NSString)updatedName;
- (SCWWatchlistDiff)initWithOldSymbols:(id)a3 newSymbols:(id)a4 updatedName:(id)a5 updatedSortState:(id)a6 updatedSortOrderState:(id)a7 updatedDisplayState:(id)a8;
@end

@implementation SCWWatchlistDiff

- (SCWWatchlistDiff)initWithOldSymbols:(id)a3 newSymbols:(id)a4 updatedName:(id)a5 updatedSortState:(id)a6 updatedSortOrderState:(id)a7 updatedDisplayState:(id)a8
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v90.receiver = self;
  v90.super_class = (Class)SCWWatchlistDiff;
  v20 = [(SCWWatchlistDiff *)&v90 init];
  if (v20)
  {
    v75 = v19;
    v76 = v18;
    v78 = v17;
    v80 = v14;
    v21 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
    v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
    v79 = (void *)[v21 mutableCopy];
    [v79 minusSet:v22];
    v73 = v22;
    v23 = (void *)[v22 mutableCopy];
    v74 = v21;
    [v23 minusSet:v21];
    v24 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    obuint64_t j = v23;
    uint64_t v25 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v87;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v87 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v86 + 1) + 8 * i);
          v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "indexOfObject:", v29));
          [(NSDictionary *)v24 setObject:v30 forKey:v29];
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
      }
      while (v26);
    }

    v31 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v80];
    [v31 minusSet:v79];
    [v31 minusSet:obj];
    v32 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v15];
    [v32 minusSet:v79];
    [v32 minusSet:obj];
    v33 = [(id)objc_opt_class() reorderedSymbolsFrom:v31 to:v32];
    v77 = v20;
    v71 = v32;
    v72 = v31;
    v34 = [(id)objc_opt_class() reorderedSymbolsFrom:v32 to:v31];
    unint64_t v35 = [v33 count];
    v69 = v34;
    v70 = v33;
    if (v35 >= [v34 count]) {
      v36 = v34;
    }
    else {
      v36 = v33;
    }
    id v37 = v36;
    v38 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v39 = v37;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v82 objects:v91 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v83;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v83 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void *)(*((void *)&v82 + 1) + 8 * j);
          v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "indexOfObject:", v44));
          [(NSDictionary *)v38 setObject:v45 forKey:v44];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v82 objects:v91 count:16];
      }
      while (v41);
    }

    uint64_t v46 = [v16 copy];
    updatedName = v77->_updatedName;
    v77->_updatedName = (NSString *)v46;

    id v14 = v80;
    uint64_t v48 = [v80 copy];
    symbolsPreDiff = v77->_symbolsPreDiff;
    v77->_symbolsPreDiff = (NSArray *)v48;

    uint64_t v50 = [v15 copy];
    symbolsPostDiff = v77->_symbolsPostDiff;
    v77->_symbolsPostDiff = (NSArray *)v50;

    uint64_t v52 = [obj allObjects];
    addedSymbols = v77->_addedSymbols;
    v77->_addedSymbols = (NSArray *)v52;

    indexesOfAddedSymbols = v77->_indexesOfAddedSymbols;
    v77->_indexesOfAddedSymbols = v24;
    v68 = v24;

    uint64_t v55 = [v79 allObjects];
    removedSymbols = v77->_removedSymbols;
    v77->_removedSymbols = (NSArray *)v55;

    uint64_t v57 = [v39 allObjects];
    reorderedSymbols = v77->_reorderedSymbols;
    v77->_reorderedSymbols = (NSArray *)v57;

    indexesOfReorderedSymbols = v77->_indexesOfReorderedSymbols;
    v77->_indexesOfReorderedSymbols = v38;
    v60 = v38;

    v20 = v77;
    id v17 = v78;
    uint64_t v61 = [v78 copy];
    updatedSortState = v77->_updatedSortState;
    v77->_updatedSortState = (NSNumber *)v61;

    id v18 = v76;
    uint64_t v63 = [v76 copy];
    updatedSortOrderState = v77->_updatedSortOrderState;
    v77->_updatedSortOrderState = (NSNumber *)v63;

    id v19 = v75;
    uint64_t v65 = [v75 copy];
    updatedDisplayState = v77->_updatedDisplayState;
    v77->_updatedDisplayState = (NSNumber *)v65;
  }
  return v20;
}

+ (id)reorderedSymbolsFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA80] set];
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
  v3 = [(SCWWatchlistDiff *)self addedSymbols];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(SCWWatchlistDiff *)self removedSymbols];
    if ([v5 count])
    {
      BOOL v4 = 0;
    }
    else
    {
      id v6 = [(SCWWatchlistDiff *)self reorderedSymbols];
      if ([v6 count])
      {
        BOOL v4 = 0;
      }
      else
      {
        v7 = [(SCWWatchlistDiff *)self updatedName];
        if ([v7 length])
        {
          BOOL v4 = 0;
        }
        else
        {
          v8 = [(SCWWatchlistDiff *)self updatedSortState];
          if (v8)
          {
            BOOL v4 = 0;
          }
          else
          {
            v9 = [(SCWWatchlistDiff *)self updatedSortOrderState];
            if (v9)
            {
              BOOL v4 = 0;
            }
            else
            {
              v10 = [(SCWWatchlistDiff *)self updatedDisplayState];
              BOOL v4 = v10 == 0;
            }
          }
        }
      }
    }
  }

  return v4;
}

- (NSString)updatedName
{
  return self->_updatedName;
}

- (NSArray)addedSymbols
{
  return self->_addedSymbols;
}

- (NSDictionary)indexesOfAddedSymbols
{
  return self->_indexesOfAddedSymbols;
}

- (NSArray)removedSymbols
{
  return self->_removedSymbols;
}

- (NSArray)reorderedSymbols
{
  return self->_reorderedSymbols;
}

- (NSDictionary)indexesOfReorderedSymbols
{
  return self->_indexesOfReorderedSymbols;
}

- (NSArray)symbolsPreDiff
{
  return self->_symbolsPreDiff;
}

- (NSArray)symbolsPostDiff
{
  return self->_symbolsPostDiff;
}

- (NSNumber)updatedSortState
{
  return self->_updatedSortState;
}

- (NSNumber)updatedSortOrderState
{
  return self->_updatedSortOrderState;
}

- (NSNumber)updatedDisplayState
{
  return self->_updatedDisplayState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedDisplayState, 0);
  objc_storeStrong((id *)&self->_updatedSortOrderState, 0);
  objc_storeStrong((id *)&self->_updatedSortState, 0);
  objc_storeStrong((id *)&self->_symbolsPostDiff, 0);
  objc_storeStrong((id *)&self->_symbolsPreDiff, 0);
  objc_storeStrong((id *)&self->_indexesOfReorderedSymbols, 0);
  objc_storeStrong((id *)&self->_reorderedSymbols, 0);
  objc_storeStrong((id *)&self->_removedSymbols, 0);
  objc_storeStrong((id *)&self->_indexesOfAddedSymbols, 0);
  objc_storeStrong((id *)&self->_addedSymbols, 0);

  objc_storeStrong((id *)&self->_updatedName, 0);
}

@end