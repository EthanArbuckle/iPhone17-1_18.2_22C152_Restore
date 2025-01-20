@interface PXSearchActiveSearch
- (BOOL)hasSearchText;
- (BOOL)hasSearchTokens;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSArray)representedObjects;
- (NSArray)searchTokens;
- (NSString)priorityAssetUUID;
- (NSString)searchTermsString;
- (NSString)searchText;
- (PXSearchActiveSearch)initWithSearchText:(id)a3 searchTokens:(id)a4 libraryScope:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)libraryScope;
- (unint64_t)searchTermCount;
- (unint64_t)searchTokenCount;
- (void)_generateRelatedSearchObjects;
- (void)setPriorityAssetUUID:(id)a3;
- (void)setRepresentedObjects:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setSearchTokens:(id)a3;
@end

@implementation PXSearchActiveSearch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityAssetUUID, 0);
  objc_storeStrong((id *)&self->_representedObjects, 0);
  objc_storeStrong((id *)&self->_searchTokens, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
}

- (unint64_t)libraryScope
{
  return self->_libraryScope;
}

- (void)setPriorityAssetUUID:(id)a3
{
}

- (NSString)priorityAssetUUID
{
  return self->_priorityAssetUUID;
}

- (void)setRepresentedObjects:(id)a3
{
}

- (NSArray)representedObjects
{
  return self->_representedObjects;
}

- (void)setSearchTokens:(id)a3
{
}

- (NSArray)searchTokens
{
  return self->_searchTokens;
}

- (void)setSearchText:(id)a3
{
}

- (NSString)searchText
{
  return self->_searchText;
}

- (NSString)searchTermsString
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(PXSearchActiveSearch *)self searchTokens];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "text", (void)v14);
        if ([v10 length]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if ([(PXSearchActiveSearch *)self hasSearchText])
  {
    v11 = [(PXSearchActiveSearch *)self searchText];
    [v4 addObject:v11];
  }
  v12 = objc_msgSend(MEMORY[0x1E4F28DF8], "localizedStringByJoiningStrings:", v4, (void)v14);

  return (NSString *)v12;
}

- (void)_generateRelatedSearchObjects
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(PXSearchActiveSearch *)self searchTokenCount])
  {
    v3 = objc_opt_new();
    id v4 = [(PXSearchActiveSearch *)self searchTokens];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) representedObject];
          v10 = [v9 queryToken];
          if (!v10) {
            PXAssertGetLog();
          }
          [v3 addObject:v10];
          if (!v9) {
            PXAssertGetLog();
          }
          if (!-[PXSearchActiveSearch hasSearchText](self, "hasSearchText") && [v4 count] == 1)
          {
            v11 = [v9 priorityAssetUUID];
            [(PXSearchActiveSearch *)self setPriorityAssetUUID:v11];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
    v12 = (void *)[v3 copy];
    [(PXSearchActiveSearch *)self setRepresentedObjects:v12];
  }
  else
  {
    uint64_t v13 = MEMORY[0x1E4F1CBF0];
    [(PXSearchActiveSearch *)self setRepresentedObjects:v13];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSearchActiveSearch;
  if ([(PXSearchActiveSearch *)&v14 isEqual:v4])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      unint64_t v7 = [(PXSearchActiveSearch *)self searchTokenCount];
      if (v7 == [v6 searchTokenCount]
        && (unint64_t v8 = -[PXSearchActiveSearch libraryScope](self, "libraryScope"), v8 == [v6 libraryScope]))
      {
        v9 = [(PXSearchActiveSearch *)self representedObjects];
        v10 = [v6 representedObjects];
        int v5 = [v9 isEqualToArray:v10];

        if ([(PXSearchActiveSearch *)self hasSearchText]
          || [v6 hasSearchText])
        {
          v11 = [(PXSearchActiveSearch *)self searchText];
          v12 = [v6 searchText];
          v5 &= [v11 isEqualToString:v12];
        }
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [PXSearchActiveSearch alloc];
  id v6 = [(PXSearchActiveSearch *)self searchText];
  unint64_t v7 = (void *)[v6 copyWithZone:a3];
  unint64_t v8 = [(PXSearchActiveSearch *)self searchTokens];
  v9 = (void *)[v8 copyWithZone:a3];
  v10 = [(PXSearchActiveSearch *)v5 initWithSearchText:v7 searchTokens:v9 libraryScope:[(PXSearchActiveSearch *)self libraryScope]];

  return v10;
}

- (unint64_t)searchTermCount
{
  BOOL v3 = [(PXSearchActiveSearch *)self hasSearchText];
  return [(PXSearchActiveSearch *)self searchTokenCount] + v3;
}

- (unint64_t)searchTokenCount
{
  v2 = [(PXSearchActiveSearch *)self searchTokens];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)isEmpty
{
  if ([(PXSearchActiveSearch *)self hasSearchText]) {
    return 0;
  }
  else {
    return ![(PXSearchActiveSearch *)self hasSearchTokens];
  }
}

- (BOOL)hasSearchTokens
{
  return [(PXSearchActiveSearch *)self searchTokenCount] != 0;
}

- (BOOL)hasSearchText
{
  v2 = [(PXSearchActiveSearch *)self searchText];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (PXSearchActiveSearch)initWithSearchText:(id)a3 searchTokens:(id)a4 libraryScope:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXSearchActiveSearch;
  v10 = [(PXSearchActiveSearch *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_libraryScope = a5;
    uint64_t v12 = [v8 copy];
    searchText = v11->_searchText;
    v11->_searchText = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    searchTokens = v11->_searchTokens;
    v11->_searchTokens = (NSArray *)v14;

    [(PXSearchActiveSearch *)v11 _generateRelatedSearchObjects];
  }

  return v11;
}

@end