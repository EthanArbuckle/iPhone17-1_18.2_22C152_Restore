@interface ICSearchResultSection
- (BOOL)removeSearchResultForIdentifier:(id)a3 forHiding:(BOOL)a4;
- (ICSearchResultSection)init;
- (NSMutableDictionary)hiddenSearchResults;
- (NSMutableDictionary)identifierToSearchResult;
- (NSMutableDictionary)unhiddenSearchResults;
- (NSMutableOrderedSet)searchResults;
- (id)description;
- (id)hiddenIdentifiers;
- (id)identifiers;
- (void)addSearchResults:(id)a3;
- (void)resetToSearchResults:(id)a3;
- (void)setHiddenSearchResults:(id)a3;
- (void)setIdentifierToSearchResult:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)setUnhiddenSearchResults:(id)a3;
@end

@implementation ICSearchResultSection

- (ICSearchResultSection)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICSearchResultSection;
  v2 = [(ICSearchResultSection *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    [(ICSearchResultSection *)v2 setSearchResults:v3];

    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(ICSearchResultSection *)v2 setIdentifierToSearchResult:v4];

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(ICSearchResultSection *)v2 setHiddenSearchResults:v5];

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(ICSearchResultSection *)v2 setUnhiddenSearchResults:v6];
  }
  return v2;
}

- (id)description
{
  v2 = [(ICSearchResultSection *)self searchResults];
  id v3 = [v2 description];

  return v3;
}

- (id)identifiers
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = [(ICSearchResultSection *)self identifierToSearchResult];
  id v5 = [v4 allKeys];
  id v6 = (void *)[v3 initWithArray:v5];

  return v6;
}

- (id)hiddenIdentifiers
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = [(ICSearchResultSection *)self hiddenSearchResults];
  id v5 = [v4 allKeys];
  id v6 = (void *)[v3 initWithArray:v5];

  return v6;
}

- (BOOL)removeSearchResultForIdentifier:(id)a3 forHiding:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    v7 = [(ICSearchResultSection *)self identifierToSearchResult];
    objc_super v8 = [v7 objectForKeyedSubscript:v6];

    BOOL v9 = v8 != 0;
    if (v8)
    {
      v10 = [(ICSearchResultSection *)self searchResults];
      [v10 removeObject:v8];

      v11 = [(ICSearchResultSection *)self identifierToSearchResult];
      [v11 removeObjectForKey:v6];

      if (v4)
      {
        v12 = [(ICSearchResultSection *)self hiddenSearchResults];
        [v12 setObject:v8 forKeyedSubscript:v6];

        v13 = [(ICSearchResultSection *)self unhiddenSearchResults];
        [v13 removeObjectForKey:v6];
      }
    }
  }
  else
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"identifier" functionName:"-[ICSearchResultSection removeSearchResultForIdentifier:forHiding:]" simulateCrash:1 showAlert:0 format:@"identifier is nil"];
    BOOL v9 = 0;
  }

  return v9;
}

- (void)addSearchResults:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = [v9 object];
        v11 = [v10 searchIndexingIdentifier];
        if (v11)
        {
          v12 = [(ICSearchResultSection *)self searchResults];
          [v12 addObject:v9];

          v13 = [(ICSearchResultSection *)self identifierToSearchResult];
          [v13 setObject:v9 forKeyedSubscript:v11];

          v14 = [(ICSearchResultSection *)self hiddenSearchResults];
          [v14 removeObjectForKey:v11];

          v15 = [(ICSearchResultSection *)self unhiddenSearchResults];
          [v15 removeObjectForKey:v11];
        }
        else
        {
          [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"identifier", "-[ICSearchResultSection addSearchResults:]", 1, 0, @"Search result identifier is nil %@", v10 functionName simulateCrash showAlert format];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)resetToSearchResults:(id)a3
{
  id v6 = a3;
  id v4 = objc_opt_new();
  [(ICSearchResultSection *)self setSearchResults:v4];

  uint64_t v5 = objc_opt_new();
  [(ICSearchResultSection *)self setIdentifierToSearchResult:v5];

  [(ICSearchResultSection *)self addSearchResults:v6];
}

- (NSMutableOrderedSet)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (NSMutableDictionary)identifierToSearchResult
{
  return self->_identifierToSearchResult;
}

- (void)setIdentifierToSearchResult:(id)a3
{
}

- (NSMutableDictionary)hiddenSearchResults
{
  return self->_hiddenSearchResults;
}

- (void)setHiddenSearchResults:(id)a3
{
}

- (NSMutableDictionary)unhiddenSearchResults
{
  return self->_unhiddenSearchResults;
}

- (void)setUnhiddenSearchResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unhiddenSearchResults, 0);
  objc_storeStrong((id *)&self->_hiddenSearchResults, 0);
  objc_storeStrong((id *)&self->_identifierToSearchResult, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
}

@end