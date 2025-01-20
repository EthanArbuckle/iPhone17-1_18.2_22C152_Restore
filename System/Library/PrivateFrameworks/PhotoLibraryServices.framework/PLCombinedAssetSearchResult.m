@interface PLCombinedAssetSearchResult
- (BOOL)resultsCanOverlap;
- (NSArray)groupResults;
- (NSMutableArray)assetSearchResults;
- (PLCombinedAssetSearchResult)initWithAssetSearchResult:(id)a3;
- (PLCombinedAssetSearchResult)initWithAssetSearchResults:(id)a3 canOverlap:(BOOL)a4;
- (id)assetUUIDs;
- (id)groupDescription;
- (unint64_t)assetCount;
- (unint64_t)categoryMask;
- (void)addAssetSearchResult:(id)a3 isMainSearchResult:(BOOL)a4;
- (void)setAssetSearchResults:(id)a3;
- (void)setResultsCanOverlap:(BOOL)a3;
@end

@implementation PLCombinedAssetSearchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSearchResults, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
}

- (void)setResultsCanOverlap:(BOOL)a3
{
  self->_resultsCanOverlap = a3;
}

- (BOOL)resultsCanOverlap
{
  return self->_resultsCanOverlap;
}

- (void)setAssetSearchResults:(id)a3
{
}

- (NSMutableArray)assetSearchResults
{
  return self->_assetSearchResults;
}

- (NSArray)groupResults
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_assetSearchResults, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_assetSearchResults;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "groupResult", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)assetUUIDs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  assetUUIDs = self->_assetUUIDs;
  if (!assetUUIDs)
  {
    unint64_t assetCount = self->_assetCount;
    if (self->_resultsCanOverlap) {
      [MEMORY[0x1E4F1CA80] setWithCapacity:assetCount];
    }
    else {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:assetCount];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = self->_assetSearchResults;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "assetUUIDs", (void)v15);
          [v5 addObjectsFromArray:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    if (self->_resultsCanOverlap)
    {
      long long v12 = [v5 allObjects];
    }
    else
    {
      long long v12 = v5;
    }
    long long v13 = self->_assetUUIDs;
    self->_assetUUIDs = v12;

    self->_unint64_t assetCount = [v5 count];
    assetUUIDs = self->_assetUUIDs;
  }
  return assetUUIDs;
}

- (unint64_t)assetCount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t assetCount = self->_assetCount;
  if (!assetCount)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v4 = self->_assetSearchResults;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      unint64_t assetCount = 0;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          assetCount += objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "assetCount", (void)v10);
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
    else
    {
      unint64_t assetCount = 0;
    }

    self->_unint64_t assetCount = assetCount;
  }
  return assetCount;
}

- (id)groupDescription
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Combined asset result:"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_assetSearchResults;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) groupDescription];
        [v3 appendFormat:@"\t%@\n", v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"\n"];
  return v3;
}

- (unint64_t)categoryMask
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_assetSearchResults;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "categoryMask", (void)v9);
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)addAssetSearchResult:(id)a3 isMainSearchResult:(BOOL)a4
{
  assetSearchResults = self->_assetSearchResults;
  if (a4) {
    [(NSMutableArray *)assetSearchResults insertObject:a3 atIndex:0];
  }
  else {
    [(NSMutableArray *)assetSearchResults addObject:a3];
  }
}

- (PLCombinedAssetSearchResult)initWithAssetSearchResult:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];

  uint64_t v7 = -[PLCombinedAssetSearchResult initWithAssetSearchResults:canOverlap:](self, "initWithAssetSearchResults:canOverlap:", v6, 1, v9, v10);
  return v7;
}

- (PLCombinedAssetSearchResult)initWithAssetSearchResults:(id)a3 canOverlap:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 firstObject];
  uint64_t v8 = [v7 groupResult];
  v13.receiver = self;
  v13.super_class = (Class)PLCombinedAssetSearchResult;
  id v9 = [(PLSearchResult *)&v13 initWithGroupResult:v8];

  if (v9)
  {
    uint64_t v10 = [v6 mutableCopy];
    assetSearchResults = v9->_assetSearchResults;
    v9->_assetSearchResults = (NSMutableArray *)v10;

    v9->_resultsCanOverlap = a4;
  }

  return v9;
}

@end