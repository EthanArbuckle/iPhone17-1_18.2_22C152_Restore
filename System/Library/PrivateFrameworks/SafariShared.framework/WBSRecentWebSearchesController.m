@interface WBSRecentWebSearchesController
+ (BOOL)_shouldTrackSearches;
+ (id)_defaultsKey;
+ (unint64_t)_maximumNumberOfSearchesToTrack;
- (id)_recentSearchDictionariesFromUserDefaultsUsingKey:(id)a3;
- (id)_recentSearchesDictionaries;
- (id)recentSearches;
- (id)recentSearchesMatchingPrefix:(id)a3;
- (id)recentWebSearcheEntries;
- (void)_addRecentSearchEntry:(id)a3;
- (void)_loadRecentSearchesIfNeeded;
- (void)_saveRecentSearchDictionaries:(id)a3 toUserDefaultsUsingKey:(id)a4;
- (void)_saveRecentSearches;
- (void)addRecentSearch:(id)a3;
- (void)clearRecentSearch:(id)a3;
- (void)clearRecentSearches;
- (void)clearRecentSearchesAddedAfterDate:(id)a3;
@end

@implementation WBSRecentWebSearchesController

- (void)addRecentSearch:(id)a3
{
  id v5 = a3;
  if ([(id)objc_opt_class() _shouldTrackSearches])
  {
    v4 = [[WBSRecentWebSearchEntry alloc] initWithSearchString:v5];
    [(WBSRecentWebSearchesController *)self _addRecentSearchEntry:v4];

    [(WBSRecentWebSearchesController *)self _saveRecentSearches];
  }
}

- (id)recentSearches
{
  return [(WBSRecentWebSearchesController *)self recentSearchesMatchingPrefix:0];
}

- (id)recentWebSearcheEntries
{
  [(WBSRecentWebSearchesController *)self _loadRecentSearchesIfNeeded];
  recentSearchEntries = self->_recentSearchEntries;
  return recentSearchEntries;
}

- (id)recentSearchesMatchingPrefix:(id)a3
{
  id v4 = a3;
  [(WBSRecentWebSearchesController *)self _loadRecentSearchesIfNeeded];
  BOOL v5 = [v4 length] == 0;
  recentSearchEntries = self->_recentSearchEntries;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__WBSRecentWebSearchesController_recentSearchesMatchingPrefix___block_invoke;
  v10[3] = &unk_1E5C9F260;
  BOOL v12 = v5;
  id v7 = v4;
  id v11 = v7;
  v8 = [(NSMutableArray *)recentSearchEntries safari_mapAndFilterObjectsUsingBlock:v10];

  return v8;
}

id __63__WBSRecentWebSearchesController_recentSearchesMatchingPrefix___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 searchString];
  id v4 = v3;
  if (!*(unsigned char *)(a1 + 40))
  {
    int v5 = objc_msgSend(v3, "safari_hasCaseInsensitivePrefix:", *(void *)(a1 + 32));
    if (v5) {
      v6 = v4;
    }
    else {
      v6 = 0;
    }
    if (v5) {
      id v7 = 0;
    }
    else {
      id v7 = v4;
    }

    id v4 = v6;
  }
  return v4;
}

- (void)clearRecentSearches
{
  [(WBSRecentWebSearchesController *)self _loadRecentSearchesIfNeeded];
  if ([(NSMutableArray *)self->_recentSearchEntries count])
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recentSearchEntries = self->_recentSearchEntries;
    self->_recentSearchEntries = v3;

    [(WBSRecentWebSearchesController *)self _saveRecentSearches];
  }
}

- (void)clearRecentSearchesAddedAfterDate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(WBSRecentWebSearchesController *)self _loadRecentSearchesIfNeeded];
  uint64_t v5 = [(NSMutableArray *)self->_recentSearchEntries count];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = v5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = self->_recentSearchEntries;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v12 = [v11 date];
        BOOL v13 = [v12 compare:v4] == 1;

        if (v13) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(NSMutableArray *)self->_recentSearchEntries removeObjectsInArray:v6];
  if (v14 != [(NSMutableArray *)self->_recentSearchEntries count]) {
    [(WBSRecentWebSearchesController *)self _saveRecentSearches];
  }
}

- (void)clearRecentSearch:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(WBSRecentWebSearchesController *)self _loadRecentSearchesIfNeeded];
  uint64_t v13 = [(NSMutableArray *)self->_recentSearchEntries count];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_recentSearchEntries;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 searchString];
        int v12 = [v11 isEqualToString:v4];

        if (v12) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_recentSearchEntries removeObjectsInArray:v5];
  if (v13 != [(NSMutableArray *)self->_recentSearchEntries count]) {
    [(WBSRecentWebSearchesController *)self _saveRecentSearches];
  }
}

- (void)_addRecentSearchEntry:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    [(WBSRecentWebSearchesController *)self _loadRecentSearchesIfNeeded];
    [(NSMutableArray *)self->_recentSearchEntries removeObject:v6];
    [(NSMutableArray *)self->_recentSearchEntries insertObject:v6 atIndex:0];
    unint64_t v4 = [(NSMutableArray *)self->_recentSearchEntries count];
    unint64_t v5 = [(id)objc_opt_class() _maximumNumberOfSearchesToTrack];
    if (v4 > v5) {
      -[NSMutableArray removeObjectsInRange:](self->_recentSearchEntries, "removeObjectsInRange:", v5, v4 - v5);
    }
  }
}

- (void)_saveRecentSearches
{
  if (!self->_recentSearchEntries)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recentSearchEntries = self->_recentSearchEntries;
    self->_recentSearchEntries = v3;
  }
  id v6 = [(WBSRecentWebSearchesController *)self _recentSearchesDictionaries];
  unint64_t v5 = [(id)objc_opt_class() _defaultsKey];
  [(WBSRecentWebSearchesController *)self _saveRecentSearchDictionaries:v6 toUserDefaultsUsingKey:v5];
}

- (id)_recentSearchesDictionaries
{
  return (id)[(NSMutableArray *)self->_recentSearchEntries safari_mapObjectsUsingBlock:&__block_literal_global_98];
}

id __61__WBSRecentWebSearchesController__recentSearchesDictionaries__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 dictionaryRepresentation];
  return v2;
}

- (void)_saveRecentSearchDictionaries:(id)a3 toUserDefaultsUsingKey:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 setObject:v7 forKey:v5];
}

- (id)_recentSearchDictionariesFromUserDefaultsUsingKey:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v5 = [v4 arrayForKey:v3];

  return v5;
}

- (void)_loadRecentSearchesIfNeeded
{
  if (!self->_recentSearchEntries)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    recentSearchEntries = self->_recentSearchEntries;
    self->_recentSearchEntries = v3;

    id v5 = [(id)objc_opt_class() _defaultsKey];
    id v6 = [(WBSRecentWebSearchesController *)self _recentSearchDictionariesFromUserDefaultsUsingKey:v5];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__WBSRecentWebSearchesController__loadRecentSearchesIfNeeded__block_invoke;
    v7[3] = &unk_1E5C9F2A8;
    v7[4] = self;
    [v6 enumerateObjectsWithOptions:2 usingBlock:v7];
    [(WBSRecentWebSearchesController *)self _saveRecentSearches];
  }
}

void __61__WBSRecentWebSearchesController__loadRecentSearchesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(void **)(a1 + 32);
    unint64_t v4 = [[WBSRecentWebSearchEntry alloc] initWithDictionaryRepresentation:v5];
    [v3 _addRecentSearchEntry:v4];
  }
}

+ (BOOL)_shouldTrackSearches
{
  return 0;
}

+ (unint64_t)_maximumNumberOfSearchesToTrack
{
  return 10;
}

+ (id)_defaultsKey
{
  return @"RecentWebSearches";
}

- (void).cxx_destruct
{
}

@end