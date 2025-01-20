@interface TUSearchResults
- (NSArray)allDataItems;
- (NSArray)allSearchItems;
- (NSMutableArray)allDataItemsCache;
- (NSMutableArray)allSearchItemsCache;
- (NSMutableArray)resultGroups;
- (NSString)searchTerm;
- (TUSearchController)searchController;
- (TUSearchResults)initWithSearchTerm:(id)a3 shouldAddAdhocResults:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resultGroupForSection:(int64_t)a3;
- (int64_t)numberOfResults;
- (int64_t)numberOfSections;
- (int64_t)numberOfTableViewRows;
- (void)_clearCaches;
- (void)addAdhocResultGroup;
- (void)addResultGroup:(id)a3;
- (void)addSearchResults:(id)a3;
- (void)finalizeSearchResults;
- (void)removeDuplicateResults;
- (void)removeSearchItem:(id)a3;
- (void)setAllDataItemsCache:(id)a3;
- (void)setAllSearchItemsCache:(id)a3;
- (void)setResultGroups:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchTerm:(id)a3;
@end

@implementation TUSearchResults

- (TUSearchResults)initWithSearchTerm:(id)a3 shouldAddAdhocResults:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUSearchResults;
  v8 = [(TUSearchResults *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_searchTerm, a3);
    if (MEMORY[0x19F397470](v9->_searchTerm)) {
      BOOL v10 = !v4;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10) {
      [(TUSearchResults *)v9 addAdhocResultGroup];
    }
  }

  return v9;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@: %li sections, %li total results", objc_opt_class(), -[TUSearchResults numberOfSections](self, "numberOfSections"), -[TUSearchResults numberOfResults](self, "numberOfResults")];
  if ([(TUSearchResults *)self numberOfSections] >= 1)
  {
    int64_t v4 = 0;
    do
    {
      v5 = [(TUSearchResults *)self resultGroups];
      v6 = [v5 objectAtIndex:v4];

      id v7 = [v6 title];
      v8 = [v6 results];
      [v3 appendFormat:@"\n\nSection %@ (%li)", v7, objc_msgSend(v8, "count")];

      v9 = [v6 results];
      [v3 appendFormat:@"\n%@", v9];

      ++v4;
    }
    while (v4 < [(TUSearchResults *)self numberOfSections]);
  }

  return v3;
}

- (int64_t)numberOfSections
{
  v2 = [(TUSearchResults *)self resultGroups];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)numberOfResults
{
  if ([(TUSearchResults *)self numberOfSections] < 1) {
    return 0;
  }
  int64_t v3 = 0;
  int64_t v4 = 0;
  do
  {
    v5 = [(TUSearchResults *)self resultGroups];
    v6 = [v5 objectAtIndex:v4];

    id v7 = [v6 results];
    v3 += [v7 count];

    ++v4;
  }
  while (v4 < [(TUSearchResults *)self numberOfSections]);
  return v3;
}

- (id)resultGroupForSection:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 < 0 || [(TUSearchResults *)self numberOfSections] <= a3)
  {
    id v7 = TUDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218240;
      int64_t v10 = a3;
      __int16 v11 = 2048;
      int64_t v12 = [(TUSearchResults *)self numberOfSections] - 1;
      _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Attempting to get section results with out of bounds range (%li) for actual range (0..%li)", (uint8_t *)&v9, 0x16u);
    }

    v6 = 0;
  }
  else
  {
    v5 = [(TUSearchResults *)self resultGroups];
    v6 = [v5 objectAtIndex:a3];
  }

  return v6;
}

- (void)_clearCaches
{
  [(TUSearchResults *)self setAllDataItemsCache:0];

  [(TUSearchResults *)self setAllSearchItemsCache:0];
}

- (void)finalizeSearchResults
{
  if (![(TUSearchResults *)self numberOfSections]) {
    [(TUSearchResults *)self addAdhocResultGroup];
  }

  [(TUSearchResults *)self removeDuplicateResults];
}

- (void)removeDuplicateResults
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(TUSearchResults *)self resultGroups];
  int64_t v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"groupType=%d", 1);
  v5 = [v3 filteredArrayUsingPredicate:v4];
  v6 = [v5 lastObject];

  v44 = self;
  id v7 = [(TUSearchResults *)self resultGroups];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"groupType=%d", 2);
  int v9 = [v7 filteredArrayUsingPredicate:v8];

  v49 = v6;
  v45 = v9;
  if ([v9 count])
  {
    int64_t v10 = [MEMORY[0x1E4F1CA48] array];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    obuint64_t j = v9;
    uint64_t v52 = [obj countByEnumeratingWithState:&v78 objects:v87 count:16];
    if (v52)
    {
      uint64_t v50 = *(void *)v79;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v79 != v50) {
            objc_enumerationMutation(obj);
          }
          uint64_t v54 = v11;
          int64_t v12 = *(void **)(*((void *)&v78 + 1) + 8 * v11);
          uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          v14 = [v12 results];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v74 objects:v86 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v75;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v75 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v74 + 1) + 8 * i);
                v73[0] = MEMORY[0x1E4F143A8];
                v73[1] = 3221225472;
                v73[2] = __41__TUSearchResults_removeDuplicateResults__block_invoke;
                v73[3] = &unk_1E58E7478;
                v73[4] = v19;
                if ([v10 indexOfObjectPassingTest:v73] == 0x7FFFFFFFFFFFFFFFLL) {
                  v20 = v10;
                }
                else {
                  v20 = v13;
                }
                [v20 addObject:v19];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v74 objects:v86 count:16];
            }
            while (v16);
          }

          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v21 = v13;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v69 objects:v85 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v70;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v70 != v24) {
                  objc_enumerationMutation(v21);
                }
                [v12 removeSearchItem:*(void *)(*((void *)&v69 + 1) + 8 * j)];
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v69 objects:v85 count:16];
            }
            while (v23);
          }

          uint64_t v11 = v54 + 1;
        }
        while (v54 + 1 != v52);
        uint64_t v52 = [obj countByEnumeratingWithState:&v78 objects:v87 count:16];
      }
      while (v52);
    }

    v6 = v49;
  }
  if ([v9 count])
  {
    v55 = [MEMORY[0x1E4F1CA48] array];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v46 = v9;
    uint64_t v51 = [v46 countByEnumeratingWithState:&v65 objects:v84 count:16];
    if (v51)
    {
      id obja = *(id *)v66;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(id *)v66 != obja) {
            objc_enumerationMutation(v46);
          }
          uint64_t v53 = v26;
          v27 = *(void **)(*((void *)&v65 + 1) + 8 * v26);
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          v28 = [v6 results];
          uint64_t v29 = [v28 countByEnumeratingWithState:&v61 objects:v83 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v62;
            do
            {
              for (uint64_t k = 0; k != v30; ++k)
              {
                if (*(void *)v62 != v31) {
                  objc_enumerationMutation(v28);
                }
                uint64_t v33 = *(void *)(*((void *)&v61 + 1) + 8 * k);
                v34 = [v27 results];
                v60[0] = MEMORY[0x1E4F143A8];
                v60[1] = 3221225472;
                v60[2] = __41__TUSearchResults_removeDuplicateResults__block_invoke_2;
                v60[3] = &unk_1E58E7478;
                v60[4] = v33;
                uint64_t v35 = [v34 indexOfObjectPassingTest:v60];

                if (v35 != 0x7FFFFFFFFFFFFFFFLL) {
                  [v55 addObject:v33];
                }
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v61 objects:v83 count:16];
            }
            while (v30);
          }

          uint64_t v26 = v53 + 1;
          v6 = v49;
        }
        while (v53 + 1 != v51);
        uint64_t v51 = [v46 countByEnumeratingWithState:&v65 objects:v84 count:16];
      }
      while (v51);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v36 = v55;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v82 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v57;
      do
      {
        for (uint64_t m = 0; m != v38; ++m)
        {
          if (*(void *)v57 != v39) {
            objc_enumerationMutation(v36);
          }
          [v6 removeSearchItem:*(void *)(*((void *)&v56 + 1) + 8 * m)];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v56 objects:v82 count:16];
      }
      while (v38);
    }

    int v9 = v45;
  }
  if (v6)
  {
    v41 = [v6 results];
    uint64_t v42 = [v41 count];

    if (!v42)
    {
      v43 = [(TUSearchResults *)v44 resultGroups];
      [v43 removeObject:v6];
    }
  }
}

uint64_t __41__TUSearchResults_removeDuplicateResults__block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 backingContactIdentifier];
  int64_t v4 = [*(id *)(a1 + 32) backingContactIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __41__TUSearchResults_removeDuplicateResults__block_invoke_2(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 destinationId];
  int64_t v4 = [*(id *)(a1 + 32) destinationId];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)addAdhocResultGroup
{
  if ([(NSString *)self->_searchTerm length])
  {
    id v7 = [[TUAdhocResult alloc] initWithString:self->_searchTerm];
    int64_t v3 = [(TUSearchResults *)self searchController];
    [(TUAdhocResult *)v7 setSearchController:v3];

    int64_t v4 = [TUResultGroup alloc];
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
    v6 = [(TUResultGroup *)v4 initWithTitle:0 results:v5];

    [(TUSearchResults *)self addResultGroup:v6];
  }
}

- (void)addResultGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUSearchResults *)self resultGroups];

  if (!v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    [(TUSearchResults *)self setResultGroups:v6];
  }
  id v7 = [(TUSearchResults *)self resultGroups];
  [v7 addObject:v4];

  [(TUSearchResults *)self _clearCaches];
}

- (void)addSearchResults:(id)a3
{
  id v6 = a3;
  if ([v6 numberOfSections] >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = [v6 resultGroupForSection:v4];
      [(TUSearchResults *)self addResultGroup:v5];

      ++v4;
    }
    while (v4 < [v6 numberOfSections]);
  }
  [(TUSearchResults *)self _clearCaches];
}

- (void)removeSearchItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(TUSearchResults *)self resultGroups];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v9++) removeSearchItem:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  int64_t v10 = [(TUSearchResults *)self allSearchItemsCache];
  [v10 removeObject:v4];

  uint64_t v11 = [(TUSearchResults *)self allDataItemsCache];
  [v11 removeObject:v4];
}

- (int64_t)numberOfTableViewRows
{
  v2 = [(TUSearchResults *)self allSearchItems];
  int64_t v3 = [v2 count];

  return v3;
}

- (NSArray)allSearchItems
{
  int64_t v3 = [(TUSearchResults *)self allSearchItemsCache];

  if (!v3)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[TUSearchResults numberOfResults](self, "numberOfResults")+ -[TUSearchResults numberOfSections](self, "numberOfSections"));
    [(TUSearchResults *)self setAllSearchItemsCache:v4];

    if ([(TUSearchResults *)self numberOfSections] >= 1)
    {
      int64_t v5 = 0;
      do
      {
        uint64_t v6 = [(TUSearchResults *)self resultGroups];
        uint64_t v7 = [v6 objectAtIndex:v5];

        uint64_t v8 = [v7 title];
        if (v8)
        {
          uint64_t v9 = [(TUSearchResults *)self allSearchItemsCache];
          int64_t v10 = [v7 title];
          [v9 addObject:v10];
        }
        uint64_t v11 = [(TUSearchResults *)self allSearchItemsCache];
        long long v12 = [v7 results];
        [v11 addObjectsFromArray:v12];

        ++v5;
      }
      while (v5 < [(TUSearchResults *)self numberOfSections]);
    }
  }

  return (NSArray *)[(TUSearchResults *)self allSearchItemsCache];
}

- (NSArray)allDataItems
{
  int64_t v3 = [(TUSearchResults *)self allDataItemsCache];

  if (!v3)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[TUSearchResults numberOfResults](self, "numberOfResults"));
    [(TUSearchResults *)self setAllDataItemsCache:v4];

    int64_t v5 = [(TUSearchResults *)self searchTerm];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      uint64_t v7 = [TUAdhocResult alloc];
      uint64_t v8 = [(TUSearchResults *)self searchTerm];
      uint64_t v9 = [(TUAdhocResult *)v7 initWithString:v8];

      int64_t v10 = [(TUSearchResults *)self searchController];
      [(TUAdhocResult *)v9 setSearchController:v10];

      uint64_t v11 = [(TUSearchResults *)self allDataItemsCache];
      [v11 addObject:v9];
    }
    if ([(TUSearchResults *)self numberOfSections] >= 1)
    {
      int64_t v12 = 0;
      do
      {
        long long v13 = [(TUSearchResults *)self resultGroups];
        long long v14 = [v13 objectAtIndex:v12];

        long long v15 = [(TUSearchResults *)self allDataItemsCache];
        uint64_t v16 = [v14 results];
        [v15 addObjectsFromArray:v16];

        ++v12;
      }
      while (v12 < [(TUSearchResults *)self numberOfSections]);
    }
  }

  return (NSArray *)[(TUSearchResults *)self allDataItemsCache];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);
    objc_storeWeak(v4 + 3, WeakRetained);

    objc_storeStrong(v4 + 1, self->_searchTerm);
    objc_storeStrong(v4 + 2, self->_resultGroups);
    objc_storeStrong(v4 + 4, self->_allSearchItemsCache);
    objc_storeStrong(v4 + 5, self->_allDataItemsCache);
  }
  return v4;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
}

- (NSMutableArray)resultGroups
{
  return self->_resultGroups;
}

- (void)setResultGroups:(id)a3
{
}

- (TUSearchController)searchController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);

  return (TUSearchController *)WeakRetained;
}

- (void)setSearchController:(id)a3
{
}

- (NSMutableArray)allSearchItemsCache
{
  return self->_allSearchItemsCache;
}

- (void)setAllSearchItemsCache:(id)a3
{
}

- (NSMutableArray)allDataItemsCache
{
  return self->_allDataItemsCache;
}

- (void)setAllDataItemsCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allDataItemsCache, 0);
  objc_storeStrong((id *)&self->_allSearchItemsCache, 0);
  objc_destroyWeak((id *)&self->_searchController);
  objc_storeStrong((id *)&self->_resultGroups, 0);

  objc_storeStrong((id *)&self->_searchTerm, 0);
}

@end