@interface SCWWatchlistOrderDiff
+ (id)reorderedWatchlistIDsFrom:(id)a3 to:(id)a4;
- (BOOL)isEmpty;
- (NSArray)addedWatchlistIDs;
- (NSArray)removedWatchlistIDs;
- (NSArray)reorderedWatchlistIDs;
- (NSArray)watchlistIDsPostDiff;
- (NSArray)watchlistIDsPreDiff;
- (NSDictionary)indexesOfAddedWatchlistIDs;
- (NSDictionary)indexesOfReorderedWatchlistIDs;
- (SCWWatchlistOrderDiff)initWithOldWatchlistIDs:(id)a3 newWatchlistIDs:(id)a4;
@end

@implementation SCWWatchlistOrderDiff

- (SCWWatchlistOrderDiff)initWithOldWatchlistIDs:(id)a3 newWatchlistIDs:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v67.receiver = self;
  v67.super_class = (Class)SCWWatchlistOrderDiff;
  v8 = [(SCWWatchlistOrderDiff *)&v67 init];
  v9 = v8;
  if (v8)
  {
    v57 = v8;
    v10 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v6];
    v11 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v7];
    v56 = (void *)[v10 mutableCopy];
    [v56 minusOrderedSet:v11];
    v53 = v11;
    v12 = (void *)[v11 mutableCopy];
    v54 = v10;
    [v12 minusOrderedSet:v10];
    v13 = [MEMORY[0x1E4F1CA60] dictionary];
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
    v20 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v6];
    [v20 minusOrderedSet:v56];
    [v20 minusOrderedSet:obj];
    v21 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v7];
    [v21 minusOrderedSet:v56];
    [v21 minusOrderedSet:obj];
    v22 = [(id)objc_opt_class() reorderedWatchlistIDsFrom:v20 to:v21];
    v51 = v21;
    v52 = v20;
    v23 = [(id)objc_opt_class() reorderedWatchlistIDsFrom:v21 to:v20];
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
    v27 = [MEMORY[0x1E4F1CA60] dictionary];
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
    watchlistIDsPreDiff = v57->_watchlistIDsPreDiff;
    v57->_watchlistIDsPreDiff = (NSArray *)v35;

    uint64_t v37 = [v7 copy];
    watchlistIDsPostDiff = v57->_watchlistIDsPostDiff;
    v57->_watchlistIDsPostDiff = (NSArray *)v37;

    uint64_t v39 = [obj array];
    addedWatchlistIDs = v57->_addedWatchlistIDs;
    v57->_addedWatchlistIDs = (NSArray *)v39;

    indexesOfAddedWatchlistIDs = v57->_indexesOfAddedWatchlistIDs;
    v57->_indexesOfAddedWatchlistIDs = v13;
    v42 = v13;

    uint64_t v43 = [v56 array];
    removedWatchlistIDs = v57->_removedWatchlistIDs;
    v57->_removedWatchlistIDs = (NSArray *)v43;

    uint64_t v45 = [v28 allObjects];
    reorderedWatchlistIDs = v57->_reorderedWatchlistIDs;
    v57->_reorderedWatchlistIDs = (NSArray *)v45;

    indexesOfReorderedWatchlistIDs = v57->_indexesOfReorderedWatchlistIDs;
    v57->_indexesOfReorderedWatchlistIDs = v27;
  }
  return v9;
}

+ (id)reorderedWatchlistIDsFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA80] set];
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
  v3 = [(SCWWatchlistOrderDiff *)self addedWatchlistIDs];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(SCWWatchlistOrderDiff *)self removedWatchlistIDs];
    if ([v5 count])
    {
      BOOL v4 = 0;
    }
    else
    {
      id v6 = [(SCWWatchlistOrderDiff *)self reorderedWatchlistIDs];
      BOOL v4 = [v6 count] == 0;
    }
  }

  return v4;
}

- (NSArray)addedWatchlistIDs
{
  return self->_addedWatchlistIDs;
}

- (NSDictionary)indexesOfAddedWatchlistIDs
{
  return self->_indexesOfAddedWatchlistIDs;
}

- (NSArray)removedWatchlistIDs
{
  return self->_removedWatchlistIDs;
}

- (NSArray)reorderedWatchlistIDs
{
  return self->_reorderedWatchlistIDs;
}

- (NSDictionary)indexesOfReorderedWatchlistIDs
{
  return self->_indexesOfReorderedWatchlistIDs;
}

- (NSArray)watchlistIDsPreDiff
{
  return self->_watchlistIDsPreDiff;
}

- (NSArray)watchlistIDsPostDiff
{
  return self->_watchlistIDsPostDiff;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchlistIDsPostDiff, 0);
  objc_storeStrong((id *)&self->_watchlistIDsPreDiff, 0);
  objc_storeStrong((id *)&self->_indexesOfReorderedWatchlistIDs, 0);
  objc_storeStrong((id *)&self->_reorderedWatchlistIDs, 0);
  objc_storeStrong((id *)&self->_removedWatchlistIDs, 0);
  objc_storeStrong((id *)&self->_indexesOfAddedWatchlistIDs, 0);

  objc_storeStrong((id *)&self->_addedWatchlistIDs, 0);
}

@end