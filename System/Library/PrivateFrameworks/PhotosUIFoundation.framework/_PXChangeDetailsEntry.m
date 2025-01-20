@interface _PXChangeDetailsEntry
- (NSDictionary)subitemChangesByItem;
- (NSMutableArray)subitemEntries;
- (PXMutableArrayChangeDetails)changeDetails;
- (_PXChangeDetailsEntry)initWithIndex:(int64_t)a3 changeDetails:(id)a4;
- (int64_t)index;
- (void)addSubitemEntry:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)updateWithSectionedChangeDetails:(id)a3;
@end

@implementation _PXChangeDetailsEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subitemEntries, 0);

  objc_storeStrong((id *)&self->_changeDetails, 0);
}

- (NSMutableArray)subitemEntries
{
  return self->_subitemEntries;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (int64_t)index
{
  return self->_index;
}

- (PXMutableArrayChangeDetails)changeDetails
{
  return self->_changeDetails;
}

- (NSDictionary)subitemChangesByItem
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_subitemEntries count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v3 = self->_subitemEntries;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v8, "index", (void)v13) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v9 = [v8 changeDetails];
            v10 = (void *)[v9 copy];
            v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "index"));
            [0 setObject:v10 forKeyedSubscript:v11];
          }
        }
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
  }
  return 0;
}

- (void)updateWithSectionedChangeDetails:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int64_t v6 = [(_PXChangeDetailsEntry *)self index];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PXSectionedChangeDetailsCoalescer.m", 53, @"Invalid parameter not satisfying: %@", @"sectionIndex != NSNotFound" object file lineNumber description];
  }
  v7 = [v5 itemChangesInSection:v6];
  v8 = [(_PXChangeDetailsEntry *)self changeDetails];
  [v8 addChangeDetails:v7];

  v9 = [(_PXChangeDetailsEntry *)self changeDetails];
  int v10 = [v9 hasIncrementalChanges];

  if (v10)
  {
    int64_t v30 = v6;
    v11 = objc_msgSend(v5, "itemsWithSubitemChangesInSection:", -[_PXChangeDetailsEntry index](self, "index"));
    v12 = (void *)[v11 mutableCopy];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v13 = [(_PXChangeDetailsEntry *)self subitemEntries];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    v29 = v7;
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend(v7, "indexAfterApplyingChangesToIndex:", objc_msgSend(v18, "index"));
          [v18 setIndex:v19];
          if (v19 != 0x7FFFFFFFFFFFFFFFLL && [v12 containsIndex:v19])
          {
            [v5 subitemChangesInItem:v19 section:v30];
            v21 = id v20 = v5;
            v22 = [v18 changeDetails];
            [v22 addChangeDetails:v21];

            [v12 removeIndex:v19];
            id v5 = v20;
            v7 = v29;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v15);
    }

    while ([v12 count])
    {
      uint64_t v23 = [v12 firstIndex];
      [v12 removeIndex:v23];
      v24 = [(_PXChangeDetailsEntry *)self changeDetails];
      uint64_t v25 = [v24 indexAfterRevertingChangesFromIndex:v23];

      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v26 = [v5 subitemChangesInItem:v23 section:v30];
        v27 = [[_PXChangeDetailsEntry alloc] initWithIndex:v23 changeDetails:v26];
        [(_PXChangeDetailsEntry *)self addSubitemEntry:v27];
      }
    }

    v7 = v29;
  }
}

- (void)addSubitemEntry:(id)a3
{
  id v4 = a3;
  subitemEntries = self->_subitemEntries;
  id v8 = v4;
  if (!subitemEntries)
  {
    int64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_subitemEntries;
    self->_subitemEntries = v6;

    id v4 = v8;
    subitemEntries = self->_subitemEntries;
  }
  [(NSMutableArray *)subitemEntries addObject:v4];
}

- (_PXChangeDetailsEntry)initWithIndex:(int64_t)a3 changeDetails:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXChangeDetailsEntry;
  v7 = [(_PXChangeDetailsEntry *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    v7->_index = a3;
    uint64_t v9 = [v6 mutableCopy];
    changeDetails = v8->_changeDetails;
    v8->_changeDetails = (PXMutableArrayChangeDetails *)v9;
  }
  return v8;
}

@end