@interface ICSectionedSearchResults
+ (id)newSearchResultsBySection;
- (BOOL)disableAutomaticUpdates;
- (BOOL)hasSearchResults;
- (BOOL)hideSearchResultsForIdentifier:(id)a3;
- (BOOL)hideSearchResultsForObjects:(id)a3;
- (BOOL)passesVisibilityTesting:(id)a3 forSearchResult:(id)a4;
- (BOOL)removeSearchResultWithIdentifier:(id)a3 forHiding:(BOOL)a4;
- (BOOL)removeSearchResultWithIdentifier:(id)a3 fromSection:(unint64_t)a4 forHiding:(BOOL)a5;
- (BOOL)replaceSearchResultObject:(id)a3 withObject:(id)a4;
- (ICSectionedSearchResults)init;
- (NSArray)allSearchResults;
- (NSMutableDictionary)searchResultsBySection;
- (id)description;
- (id)indexPathOfObject:(id)a3;
- (id)indexPathOfSearchResult:(id)a3;
- (id)removeSearchResultAtRow:(int64_t)a3 section:(unint64_t)a4;
- (id)searchResultAtRow:(int64_t)a3 section:(unint64_t)a4;
- (id)searchResultObjectsInSection:(unint64_t)a3;
- (id)searchResultSectionForSectionIndex:(unint64_t)a3;
- (id)searchResultWithObject:(id)a3;
- (id)searchResultsBySectionForSearchResults:(id)a3 passingVisibilityTesting:(id)a4;
- (id)searchResultsInSection:(unint64_t)a3;
- (unint64_t)addSearchResults:(id)a3 removingFoundIdentifiers:(id)a4 passingVisibilityTesting:(id)a5;
- (unint64_t)addSearchResultsBySection:(id)a3;
- (unint64_t)countForSection:(unint64_t)a3;
- (unint64_t)removeSearchResultsWithIdentifiers:(id)a3 forHiding:(BOOL)a4;
- (unint64_t)sectionForSearchResult:(id)a3;
- (void)addSearchResult:(id)a3 toSection:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)addSearchResults:(id)a3 toSection:(unint64_t)a4;
- (void)clear;
- (void)dealloc;
- (void)filterSearchResultsUsingVisiblityTesting:(id)a3;
- (void)noteWillBeDeletedOrTrashed:(id)a3;
- (void)noteWillBeUndeletedOrUntrashed:(id)a3;
- (void)objectsDidChange:(id)a3;
- (void)setDisableAutomaticUpdates:(BOOL)a3;
- (void)setSearchResults:(id)a3 forSection:(unint64_t)a4;
- (void)setSearchResultsBySection:(id)a3;
- (void)updateForSortTypeChange;
@end

@implementation ICSectionedSearchResults

+ (id)newSearchResultsBySection
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  for (uint64_t i = 0; i != 3; ++i)
  {
    v4 = objc_opt_new();
    v5 = [NSNumber numberWithUnsignedInteger:i];
    [v2 setObject:v4 forKeyedSubscript:v5];
  }
  return v2;
}

- (ICSectionedSearchResults)init
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)ICSectionedSearchResults;
  v2 = [(ICSectionedSearchResults *)&v26 init];
  if (v2)
  {
    v3 = (void *)[(id)objc_opt_class() newSearchResultsBySection];
    v21 = v2;
    [(ICSectionedSearchResults *)v2 setSearchResultsBySection:v3];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v4 = [MEMORY[0x1E4F837B8] sharedIndexer];
    v5 = [v4 dataSources];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      uint64_t v9 = *MEMORY[0x1E4F1BE30];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v11 conformsToProtocol:&unk_1F0A658D8])
          {
            v12 = (void *)MEMORY[0x1E4F28EB8];
            id v13 = v11;
            v14 = [v12 defaultCenter];
            v15 = [v13 mainThreadContext];
            [v14 addObserver:v21 selector:sel_objectsDidChange_ name:v9 object:v15];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);
    }

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v2 = v21;
    [v16 addObserver:v21 selector:sel_noteWillBeUndeletedOrUntrashed_ name:*MEMORY[0x1E4F83148] object:0];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v21 selector:sel_noteWillBeUndeletedOrUntrashed_ name:*MEMORY[0x1E4F83150] object:0];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v21 selector:sel_noteWillBeDeletedOrTrashed_ name:*MEMORY[0x1E4F83140] object:0];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v21 selector:sel_noteWillBeDeletedOrTrashed_ name:*MEMORY[0x1E4F83158] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICSectionedSearchResults;
  [(ICSectionedSearchResults *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ICSectionedSearchResults;
  objc_super v4 = [(ICSectionedSearchResults *)&v9 description];
  v5 = [(ICSectionedSearchResults *)self searchResultsBySection];
  uint64_t v6 = [v5 description];
  uint64_t v7 = [v3 stringWithFormat:@"%@(%@)", v4, v6];

  return v7;
}

- (void)objectsDidChange:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(ICSectionedSearchResults *)self disableAutomaticUpdates])
  {
    v5 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v6 = [v4 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1BDC0]];

    if ([v7 count]) {
      [v5 unionSet:v7];
    }
    long long v25 = v7;
    uint64_t v8 = [v4 userInfo];
    objc_super v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1BFA8]];

    if ([v9 count]) {
      [v5 unionSet:v9];
    }
    v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v9);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([v16 conformsToProtocol:&unk_1F0A171A0])
          {
            id v17 = v16;
            if (([v17 isDeleted] & 1) != 0 || objc_msgSend(v17, "isHiddenFromSearch"))
            {
              v18 = [v17 searchIndexingIdentifier];

              if (v18)
              {
                v19 = [v17 searchIndexingIdentifier];
                [v10 addObject:v19];
              }
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v13);
    }

    v20 = [v10 allObjects];
    unint64_t v21 = [(ICSectionedSearchResults *)self removeSearchResultsWithIdentifiers:v20 forHiding:0];

    if (v21
      || ([v4 userInfo],
          long long v22 = objc_claimAutoreleasedReturnValue(),
          [v22 objectForKeyedSubscript:*MEMORY[0x1E4F1BE00]],
          long long v23 = objc_claimAutoreleasedReturnValue(),
          v23,
          v22,
          v23))
    {
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__ICSectionedSearchResults_objectsDidChange___block_invoke;
      block[3] = &unk_1E5FDAAE0;
      objc_copyWeak(&v27, &location);
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }
}

void __45__ICSectionedSearchResults_objectsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 postNotificationName:@"ICSearchResultsDidUpdateNotification" object:WeakRetained];
  }
}

- (void)noteWillBeUndeletedOrUntrashed:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 object];
  uint64_t v6 = ICCheckedDynamicCast();

  uint64_t v7 = [v6 searchIndexingIdentifier];
  if (v7)
  {
    char v8 = 0;
    for (uint64_t i = 0; i != 3; ++i)
    {
      v10 = [(ICSectionedSearchResults *)self searchResultSectionForSectionIndex:i];
      id v11 = [v10 hiddenSearchResults];
      uint64_t v12 = [v11 objectForKeyedSubscript:v7];

      if (v12)
      {
        v16[0] = v12;
        char v8 = 1;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
        [(ICSectionedSearchResults *)self addSearchResults:v13 toSection:i];

        uint64_t v14 = [v10 unhiddenSearchResults];
        [v14 setObject:v12 forKeyedSubscript:v7];
      }
    }
    if (v8)
    {
      v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 postNotificationName:@"ICSearchResultsDidUpdateNotification" object:self];
    }
  }
}

- (void)noteWillBeDeletedOrTrashed:(id)a3
{
  id v15 = a3;
  objc_opt_class();
  id v4 = [v15 object];
  v5 = ICCheckedDynamicCast();

  uint64_t v6 = [v5 searchIndexingIdentifier];
  if (v6)
  {
    char v7 = 0;
    for (uint64_t i = 0; i != 3; ++i)
    {
      objc_super v9 = [(ICSectionedSearchResults *)self searchResultSectionForSectionIndex:i];
      v10 = [v9 unhiddenSearchResults];
      id v11 = [v10 objectForKeyedSubscript:v6];

      if (v11)
      {
        uint64_t v12 = [v11 object];
        uint64_t v13 = [v12 searchIndexingIdentifier];
        char v7 = 1;
        [(ICSectionedSearchResults *)self removeSearchResultWithIdentifier:v13 forHiding:1];
      }
    }
    if (v7)
    {
      uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 postNotificationName:@"ICSearchResultsDidUpdateNotification" object:self];
    }
  }
}

- (NSArray)allSearchResults
{
  v3 = [(ICSectionedSearchResults *)self searchResultsInSection:0];
  id v4 = [(ICSectionedSearchResults *)self searchResultsInSection:1];
  v5 = [(ICSectionedSearchResults *)self searchResultsInSection:2];
  uint64_t v6 = [v3 arrayByAddingObjectsFromArray:v4];
  char v7 = [v6 arrayByAddingObjectsFromArray:v5];

  return (NSArray *)v7;
}

- (void)clear
{
  id v3 = (id)[(id)objc_opt_class() newSearchResultsBySection];
  [(ICSectionedSearchResults *)self setSearchResultsBySection:v3];
}

- (BOOL)hasSearchResults
{
  unint64_t v3 = 0;
  BOOL v4 = 1;
  do
  {
    v5 = [(ICSectionedSearchResults *)self searchResultsBySection];
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:v3];
    char v7 = [v5 objectForKeyedSubscript:v6];
    char v8 = [v7 searchResults];
    uint64_t v9 = [v8 count];

    if (v9) {
      break;
    }
    BOOL v4 = v3++ < 2;
  }
  while (v3 != 3);
  return v4;
}

- (unint64_t)countForSection:(unint64_t)a3
{
  unint64_t v3 = [(ICSectionedSearchResults *)self searchResultsInSection:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (unint64_t)sectionForSearchResult:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 configuration];
  if ([v4 isTopHit])
  {
    v5 = [v3 object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      unint64_t v7 = 0;
      goto LABEL_11;
    }
  }
  else
  {
  }
  char v8 = [v3 object];
  uint64_t v9 = v8;
  if (v8)
  {
    unint64_t v7 = [v8 searchResultsSection];
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ICSectionedSearchResults sectionForSearchResult:](v10);
    }

    unint64_t v7 = 1;
  }

LABEL_11:
  return v7;
}

- (id)searchResultAtRow:(int64_t)a3 section:(unint64_t)a4
{
  if (a4 >= 3)
  {
    unint64_t v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICSectionedSearchResults searchResultAtRow:section:]();
    }
  }
  char v8 = [(ICSectionedSearchResults *)self searchResultsInSection:a4];
  if ([v8 count] <= (unint64_t)a3)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [v8 objectAtIndexedSubscript:a3];
  }

  return v9;
}

- (id)searchResultWithObject:(id)a3
{
  id v4 = a3;
  v5 = [(ICSectionedSearchResults *)self allSearchResults];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__ICSectionedSearchResults_searchResultWithObject___block_invoke;
  v9[3] = &unk_1E5FDAB08;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = objc_msgSend(v5, "ic_objectPassingTest:", v9);

  return v7;
}

uint64_t __51__ICSectionedSearchResults_searchResultWithObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)searchResultSectionForSectionIndex:(unint64_t)a3
{
  if (a3 >= 3)
  {
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICSectionedSearchResults searchResultAtRow:section:]();
    }
  }
  id v6 = [(ICSectionedSearchResults *)self searchResultsBySection];
  unint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  char v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

- (id)searchResultsInSection:(unint64_t)a3
{
  id v3 = [(ICSectionedSearchResults *)self searchResultSectionForSectionIndex:a3];
  uint64_t v4 = [v3 searchResults];
  v5 = [v4 array];

  return v5;
}

- (id)searchResultObjectsInSection:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 >= 3)
  {
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICSectionedSearchResults searchResultAtRow:section:]();
    }
  }
  id v6 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v7 = [(ICSectionedSearchResults *)self searchResultsInSection:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
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
        uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) object];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  uint64_t v13 = (void *)[v6 copy];

  return v13;
}

- (void)setSearchResults:(id)a3 forSection:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v11 = objc_opt_class();
    id v12 = v11;
    uint64_t v13 = NSStringFromSelector(a2);
    int v14 = 138413314;
    long long v15 = v11;
    __int16 v16 = 2048;
    long long v17 = self;
    __int16 v18 = 2112;
    v19 = v13;
    __int16 v20 = 2048;
    unint64_t v21 = a4;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_debug_impl(&dword_1B08EB000, v8, OS_LOG_TYPE_DEBUG, "[%@(%p) %@] section %ld results %@", (uint8_t *)&v14, 0x34u);
  }
  if (a4 >= 3)
  {
    uint64_t v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICSectionedSearchResults searchResultAtRow:section:]();
    }
  }
  uint64_t v10 = [(ICSectionedSearchResults *)self searchResultSectionForSectionIndex:a4];
  [v10 resetToSearchResults:v7];
}

- (void)addSearchResult:(id)a3 toSection:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  if (a4 >= 3)
  {
    uint64_t v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICSectionedSearchResults searchResultAtRow:section:]();
    }
  }
  uint64_t v10 = [(ICSectionedSearchResults *)self searchResultsInSection:a4];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1C978] array];
  }
  uint64_t v13 = v12;

  int v14 = (void *)[v13 mutableCopy];
  if (a5 == 0x7FFFFFFFFFFFFFFFLL || [v13 count] <= a5) {
    [v14 addObject:v8];
  }
  else {
    [v14 insertObject:v8 atIndex:a5];
  }
  long long v15 = (void *)[v14 copy];
  [(ICSectionedSearchResults *)self setSearchResults:v15 forSection:a4];
}

- (void)addSearchResults:(id)a3 toSection:(unint64_t)a4
{
  id v6 = a3;
  if (a4 >= 3)
  {
    id v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICSectionedSearchResults searchResultAtRow:section:]();
    }
  }
  id v8 = [(ICSectionedSearchResults *)self searchResultsInSection:a4];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1C978] array];
  }
  id v11 = v10;

  id v12 = [v11 arrayByAddingObjectsFromArray:v6];
  [(ICSectionedSearchResults *)self setSearchResults:v12 forSection:a4];
}

- (id)removeSearchResultAtRow:(int64_t)a3 section:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a4 >= 3)
  {
    id v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICSectionedSearchResults searchResultAtRow:section:]();
    }
  }
  id v8 = [(ICSectionedSearchResults *)self searchResultAtRow:a3 section:a4];
  uint64_t v9 = [(ICSectionedSearchResults *)self searchResultsInSection:a4];
  id v10 = (void *)[v9 mutableCopy];
  if ([v10 count] <= (unint64_t)a3
    || ([v10 objectAtIndexedSubscript:a3],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11 != v8))
  {
    id v12 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 134218498;
      int64_t v17 = a3;
      __int16 v18 = 2048;
      unint64_t v19 = a4;
      __int16 v20 = 2112;
      unint64_t v21 = v8;
      _os_log_debug_impl(&dword_1B08EB000, v12, OS_LOG_TYPE_DEBUG, "Search result mismatch at row %ld section %ld %@", (uint8_t *)&v16, 0x20u);
    }
  }
  uint64_t v13 = [v8 object];
  int v14 = [v13 searchIndexingIdentifier];

  [(ICSectionedSearchResults *)self removeSearchResultWithIdentifier:v14 fromSection:a4 forHiding:1];
  return v8;
}

- (BOOL)removeSearchResultWithIdentifier:(id)a3 fromSection:(unint64_t)a4 forHiding:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  uint64_t v9 = [(ICSectionedSearchResults *)self searchResultSectionForSectionIndex:a4];
  LOBYTE(v5) = [v9 removeSearchResultForIdentifier:v8 forHiding:v5];

  return v5;
}

- (BOOL)removeSearchResultWithIdentifier:(id)a3 forHiding:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = 0;
  for (uint64_t i = 0; i != 3; ++i)
    v7 |= [(ICSectionedSearchResults *)self removeSearchResultWithIdentifier:a3 fromSection:i forHiding:v4];
  return v7 & 1;
}

- (unint64_t)removeSearchResultsWithIdentifiers:(id)a3 forHiding:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        objc_opt_class();
        id v12 = ICCheckedDynamicCast();
        if (v12) {
          v9 += [(ICSectionedSearchResults *)self removeSearchResultWithIdentifier:v12 forHiding:v4];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)passesVisibilityTesting:(id)a3 forSearchResult:(id)a4
{
  id v5 = a3;
  id v6 = [a4 object];
  uint64_t v7 = v6;
  if (!v6)
  {
    unint64_t v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ICSectionedSearchResults sectionForSearchResult:](v9);
    }
LABEL_11:

LABEL_12:
    char v10 = 0;
    goto LABEL_18;
  }
  if (v5
    && !objc_msgSend(v5, "supportsVisibilityTestingType:", objc_msgSend(v6, "visibilityTestingType")))
  {
    goto LABEL_12;
  }
  if ([v7 searchResultType] != 1)
  {
    if (![v7 searchResultType])
    {
      uint64_t v8 = [v5 predicateForSearchableNotes];
      goto LABEL_14;
    }
    unint64_t v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICSectionedSearchResults passesVisibilityTesting:forSearchResult:]();
    }
    goto LABEL_11;
  }
  uint64_t v8 = [v5 predicateForSearchableAttachments];
LABEL_14:
  id v11 = v8;
  if (v8) {
    char v10 = [v8 evaluateWithObject:v7];
  }
  else {
    char v10 = 1;
  }

LABEL_18:
  return v10;
}

- (id)searchResultsBySectionForSearchResults:(id)a3 passingVisibilityTesting:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v25;
    *(void *)&long long v10 = 134217984;
    long long v22 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (-[ICSectionedSearchResults passesVisibilityTesting:forSearchResult:](self, "passesVisibilityTesting:forSearchResult:", v7, v14, v22))
        {
          unint64_t v15 = [(ICSectionedSearchResults *)self sectionForSearchResult:v14];
          if (v15 >= 3)
          {
            long long v16 = os_log_create("com.apple.notes", "UI");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v22;
              unint64_t v29 = v15;
              _os_log_error_impl(&dword_1B08EB000, v16, OS_LOG_TYPE_ERROR, "Invalid search results sections %lu", buf, 0xCu);
            }
          }
          long long v17 = [NSNumber numberWithUnsignedInteger:v15];
          __int16 v18 = [v8 objectForKeyedSubscript:v17];

          if (!v18)
          {
            __int16 v18 = [MEMORY[0x1E4F1CA48] array];
            uint64_t v19 = [NSNumber numberWithUnsignedInteger:v15];
            [v8 setObject:v18 forKeyedSubscript:v19];
          }
          [v18 addObject:v14];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v11);
  }

  __int16 v20 = (void *)[v8 copy];
  return v20;
}

- (unint64_t)addSearchResultsBySection:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v6 = 134217984;
    long long v16 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v4);
        }
        unint64_t v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "integerValue", v16);
        if (v11 >= 3)
        {
          uint64_t v12 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            unint64_t v22 = v11;
            _os_log_error_impl(&dword_1B08EB000, v12, OS_LOG_TYPE_ERROR, "Invalid search results sections %lu", buf, 0xCu);
          }
        }
        uint64_t v13 = [NSNumber numberWithUnsignedInteger:v11];
        uint64_t v14 = [v4 objectForKeyedSubscript:v13];

        v8 += [v14 count];
        [(ICSectionedSearchResults *)self addSearchResults:v14 toSection:v11];
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)addSearchResults:(id)a3 removingFoundIdentifiers:(id)a4 passingVisibilityTesting:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(ICSectionedSearchResults *)self removeSearchResultsWithIdentifiers:a4 forHiding:0];
  long long v10 = [(ICSectionedSearchResults *)self searchResultsBySectionForSearchResults:v9 passingVisibilityTesting:v8];

  unint64_t v11 = [(ICSectionedSearchResults *)self addSearchResultsBySection:v10];
  return v11;
}

- (void)filterSearchResultsUsingVisiblityTesting:(id)a3
{
  id v4 = a3;
  for (uint64_t i = 0; i != 3; ++i)
  {
    long long v6 = [(ICSectionedSearchResults *)self searchResultsInSection:i];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__ICSectionedSearchResults_filterSearchResultsUsingVisiblityTesting___block_invoke;
    v9[3] = &unk_1E5FDAB30;
    void v9[4] = self;
    id v7 = v4;
    id v10 = v7;
    id v8 = objc_msgSend(v6, "ic_objectsPassingTest:", v9);
    [(ICSectionedSearchResults *)self setSearchResults:v8 forSection:i];
  }
}

uint64_t __69__ICSectionedSearchResults_filterSearchResultsUsingVisiblityTesting___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = ICCheckedDynamicCast();

  if (v4) {
    uint64_t v5 = [*(id *)(a1 + 32) passesVisibilityTesting:*(void *)(a1 + 40) forSearchResult:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hideSearchResultsForIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = 0;
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v7 = [(ICSectionedSearchResults *)self searchResultsBySection];
    id v8 = [NSNumber numberWithUnsignedInteger:i];
    id v9 = [v7 objectForKeyedSubscript:v8];

    v5 |= [v9 removeSearchResultForIdentifier:v4 forHiding:1];
  }

  return v5 & 1;
}

- (BOOL)hideSearchResultsForObjects:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v17;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = ICProtocolCast();
        objc_opt_class();
        id v10 = ICDynamicCast();
        unint64_t v11 = [v10 object];
        uint64_t v12 = [v11 searchIndexingIdentifier];
        if (v12)
        {
          uint64_t v13 = (void *)v12;
        }
        else
        {
          uint64_t v13 = [v9 searchIndexingIdentifier];

          if (!v13) {
            goto LABEL_10;
          }
        }
        v6 |= [(ICSectionedSearchResults *)self hideSearchResultsForIdentifier:v13];

LABEL_10:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (!v5) {
        goto LABEL_14;
      }
    }
  }
  LOBYTE(v6) = 0;
LABEL_14:

  return v6 & 1;
}

- (id)indexPathOfSearchResult:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICSectionedSearchResults *)self sectionForSearchResult:v4];
  int v6 = [(ICSectionedSearchResults *)self searchResultsInSection:v5];
  uint64_t v7 = [v6 indexOfObject:v4];

  id v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v7 inSection:v5];

  return v8;
}

- (id)indexPathOfObject:(id)a3
{
  id v4 = [(ICSectionedSearchResults *)self searchResultWithObject:a3];
  unint64_t v5 = [(ICSectionedSearchResults *)self indexPathOfSearchResult:v4];

  return v5;
}

- (BOOL)replaceSearchResultObject:(id)a3 withObject:(id)a4
{
  id v30 = a4;
  int v6 = [a3 searchIndexingIdentifier];
  unint64_t v7 = 0;
  BOOL v8 = 1;
  while (1)
  {
    id v9 = [(ICSectionedSearchResults *)self searchResultsBySection];
    id v10 = [NSNumber numberWithUnsignedInteger:v7];
    unint64_t v11 = [v9 objectForKeyedSubscript:v10];

    uint64_t v12 = [v11 identifierToSearchResult];
    uint64_t v13 = [v12 objectForKeyedSubscript:v6];

    if (v13) {
      break;
    }

    BOOL v8 = v7++ < 2;
    if (v7 == 3)
    {
      BOOL v8 = 0;
      goto LABEL_6;
    }
  }
  long long v26 = [ICSearchResultConfiguration alloc];
  unint64_t v29 = [v13 configuration];
  uint64_t v14 = [v29 searchString];
  uint64_t v28 = [v13 configuration];
  uint64_t v23 = [v28 searchSuggestionType];
  long long v25 = [v13 configuration];
  unsigned int v22 = [v25 isTopHit];
  uint64_t v24 = [v13 configuration];
  unint64_t v15 = [v24 foundAttachmentObjectID];
  long long v16 = [v13 configuration];
  long long v17 = [v16 sortableSearchableItem];
  long long v27 = [(ICSearchResultConfiguration *)v26 initWithSearchString:v14 searchSuggestionType:v23 isTopHit:v22 foundAttachmentObjectID:v15 sortableSearchableItem:v17];

  long long v18 = [[ICSearchResult alloc] initWithObject:v30 configuration:v27];
  -[ICSearchResult setMathNote:](v18, "setMathNote:", [v13 isMathNote]);
  long long v19 = [(ICSectionedSearchResults *)self searchResultsInSection:v7];
  uint64_t v20 = [v19 indexOfObject:v13];

  [(ICSectionedSearchResults *)self hideSearchResultsForIdentifier:v6];
  [(ICSectionedSearchResults *)self addSearchResult:v18 toSection:v7 atIndex:v20];

LABEL_6:
  return v8;
}

- (void)updateForSortTypeChange
{
  id v4 = [(ICSectionedSearchResults *)self searchResultsInSection:1];
  id v3 = [(ICSectionedSearchResults *)self searchResultsInSection:2];
  [(ICSectionedSearchResults *)self setSearchResults:v4 forSection:1];
  [(ICSectionedSearchResults *)self setSearchResults:v3 forSection:2];
}

- (BOOL)disableAutomaticUpdates
{
  return self->_disableAutomaticUpdates;
}

- (void)setDisableAutomaticUpdates:(BOOL)a3
{
  self->_disableAutomaticUpdates = a3;
}

- (NSMutableDictionary)searchResultsBySection
{
  return self->_searchResultsBySection;
}

- (void)setSearchResultsBySection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)sectionForSearchResult:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Search result object is nil", v1, 2u);
}

- (void)searchResultAtRow:section:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "Invalid search results sections %lu", v2, v3, v4, v5, v6);
}

- (void)passesVisibilityTesting:forSearchResult:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "Invalid search result object type %@", v2, v3, v4, v5, v6);
}

@end