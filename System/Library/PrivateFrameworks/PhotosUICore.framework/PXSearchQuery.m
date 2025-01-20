@interface PXSearchQuery
- (BOOL)hasSearchText;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToRecentSearchQuery:(id)a3;
- (BOOL)supportsRecentSearch;
- (NSArray)queryTokens;
- (NSArray)searchTokens;
- (NSSet)scopedSearchIdentifiers;
- (NSString)localizedQueryString;
- (NSString)priorityAssetUUID;
- (NSString)searchText;
- (PXSearchQuery)init;
- (PXSearchQuery)initWithDictionary:(id)a3;
- (PXSearchQuery)initWithSearchText:(id)a3 searchTokens:(id)a4 scopedSearchIdentifiers:(id)a5 searchResultTypes:(unint64_t)a6 options:(id)a7;
- (PXSearchQueryOptions)options;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)localizedQueryStringWithQuotationDelimitersForSearchText:(BOOL)a3;
- (unint64_t)hash;
- (unint64_t)searchResultTypes;
- (unint64_t)searchSuggestionType;
- (unint64_t)searchTermCount;
@end

@implementation PXSearchQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityAssetUUID, 0);
  objc_storeStrong((id *)&self->_scopedSearchIdentifiers, 0);
  objc_storeStrong((id *)&self->_searchTokens, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (unint64_t)searchSuggestionType
{
  return self->_searchSuggestionType;
}

- (unint64_t)searchResultTypes
{
  return self->_searchResultTypes;
}

- (NSString)priorityAssetUUID
{
  return self->_priorityAssetUUID;
}

- (NSSet)scopedSearchIdentifiers
{
  return self->_scopedSearchIdentifiers;
}

- (NSArray)searchTokens
{
  return self->_searchTokens;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (PXSearchQueryOptions)options
{
  return self->_options;
}

- (unint64_t)hash
{
  v3 = [(PXSearchQuery *)self searchTokens];
  uint64_t v4 = [v3 hash];
  v5 = [(PXSearchQuery *)self searchText];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXSearchQuery *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(PXSearchQuery *)self searchTermCount];
      uint64_t v7 = [(PXSearchQuery *)v5 searchTermCount];
      v8 = [(PXSearchQuery *)self queryTokens];
      v9 = [(PXSearchQuery *)v5 queryTokens];
      char v10 = [v8 isEqualToArray:v9];

      v11 = [(PXSearchQuery *)self searchText];
      v12 = [(PXSearchQuery *)v5 searchText];
      if (v11 == v12) {
        char v13 = 1;
      }
      else {
        char v13 = [v11 isEqualToString:v12];
      }

      v15 = [(PXSearchQuery *)self options];
      v16 = [(PXSearchQuery *)v5 options];
      char v17 = [v15 isEqual:v16];

      if (v6 == v7) {
        char v18 = v10;
      }
      else {
        char v18 = 0;
      }
      char v14 = v18 & v13 & v17;
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (BOOL)isEquivalentToRecentSearchQuery:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(PXSearchQuery *)self localizedQueryString];
    uint64_t v7 = [v5 localizedQueryString];

    BOOL v8 = [v6 localizedCaseInsensitiveCompare:v7] == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [PXSearchQuery alloc];
  unint64_t v6 = [(PXSearchQuery *)self searchText];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  BOOL v8 = [(PXSearchQuery *)self searchTokens];
  v9 = (void *)[v8 copyWithZone:a3];
  char v10 = [(PXSearchQuery *)self options];
  v11 = (void *)[v10 copyWithZone:a3];
  v12 = [(PXSearchQuery *)v5 initWithSearchText:v7 searchTokens:v9 scopedSearchIdentifiers:0 searchResultTypes:3 options:v11];

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@:%p\n", v5, self];

  unint64_t v6 = [(PXSearchQuery *)self localizedQueryString];
  [v3 appendFormat:@"Query String: %@\n", v6];

  uint64_t v7 = [(PXSearchQuery *)self searchText];
  [v3 appendFormat:@"Search Text: %@\n", v7];

  BOOL v8 = [(PXSearchQuery *)self searchTokens];
  [v3 appendFormat:@"Search Tokens: %@\n", v8];

  return v3;
}

- (BOOL)supportsRecentSearch
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(PXSearchQuery *)self searchTokens];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) isPersistable])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (unint64_t)searchTermCount
{
  BOOL v3 = [(PXSearchQuery *)self hasSearchText];
  uint64_t v4 = [(PXSearchQuery *)self searchTokens];
  unint64_t v5 = [v4 count] + v3;

  return v5;
}

- (BOOL)isEmpty
{
  if ([(PXSearchQuery *)self hasSearchText]) {
    return 0;
  }
  uint64_t v4 = [(PXSearchQuery *)self searchTokens];
  BOOL v3 = [v4 count] == 0;

  return v3;
}

- (BOOL)hasSearchText
{
  v2 = [(PXSearchQuery *)self searchText];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)localizedQueryStringWithQuotationDelimitersForSearchText:(BOOL)a3
{
  BOOL v19 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unint64_t v5 = [(PXSearchQuery *)self searchTokens];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v11 = [v10 queryToken];
        long long v12 = [v11 text];
        char v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          v15 = [v10 attributedTitle];
          id v14 = [v15 string];
        }
        if ([v14 length]) {
          [v4 addObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  v16 = [(PXSearchQuery *)self searchText];
  char v17 = +[PXSearchDisplayUtility localizedListStringFromSearchTokenNames:v4 searchText:v16 includeQuotationDelimitersForSearchText:v19];

  return v17;
}

- (NSString)localizedQueryString
{
  return (NSString *)[(PXSearchQuery *)self localizedQueryStringWithQuotationDelimitersForSearchText:0];
}

- (NSArray)queryTokens
{
}

uint64_t __28__PXSearchQuery_queryTokens__block_invoke(uint64_t a1, void *a2)
{
  return [a2 queryToken];
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(PXSearchQuery *)self searchText];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"SearchText"];
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [(PXSearchQuery *)self searchTokens];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
        if (!v11)
        {
          v15 = PLUIGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)char v17 = 0;
            _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "Failed to convert PXNewSearchToken to Dictionary", v17, 2u);
          }

          id v14 = 0;
          goto LABEL_15;
        }
        long long v12 = (void *)v11;
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  char v13 = (void *)[v5 copy];
  [v3 setObject:v13 forKeyedSubscript:@"RepresentedObjects"];

  id v14 = (void *)[v3 copy];
LABEL_15:

  return v14;
}

- (PXSearchQuery)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v4 objectForKeyedSubscript:@"RepresentedObjects"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v12 = [PXNewSearchToken alloc];
        uint64_t v13 = -[PXNewSearchToken initWithDictionaryRepresentation:](v12, "initWithDictionaryRepresentation:", v11, (void)v19);
        if (!v13)
        {
          PLUIGetLog();
          v16 = (PXSearchQueryOptions *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A9AE7000, &v16->super, OS_LOG_TYPE_ERROR, "Failed to initialize PXNewSearchToken from represented object for Recent Search. Unable to initalize PXSearchQuery.", buf, 2u);
          }
          char v17 = 0;
          v15 = v6;
          goto LABEL_17;
        }
        id v14 = (void *)v13;
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v15 = [v4 objectForKeyedSubscript:@"SearchText"];
  if (!v15) {
    PXAssertGetLog();
  }
  if (!objc_msgSend(v15, "length", (void)v19) && !objc_msgSend(v5, "count")) {
    PXAssertGetLog();
  }
  v16 = objc_alloc_init(PXSearchQueryOptions);
  self = [(PXSearchQuery *)self initWithSearchText:v15 searchTokens:v5 scopedSearchIdentifiers:0 searchResultTypes:3 options:v16];
  char v17 = self;
LABEL_17:

  return v17;
}

- (PXSearchQuery)initWithSearchText:(id)a3 searchTokens:(id)a4 scopedSearchIdentifiers:(id)a5 searchResultTypes:(unint64_t)a6 options:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_18:
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PXSearchQuery.m", 40, @"Invalid parameter not satisfying: %@", @"searchTokens" object file lineNumber description];

    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_19;
  }
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"PXSearchQuery.m", 39, @"Invalid parameter not satisfying: %@", @"searchText" object file lineNumber description];

  if (!v14) {
    goto LABEL_18;
  }
LABEL_3:
  if (v16) {
    goto LABEL_4;
  }
LABEL_19:
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"PXSearchQuery.m", 41, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

LABEL_4:
  v37.receiver = self;
  v37.super_class = (Class)PXSearchQuery;
  char v17 = [(PXSearchQuery *)&v37 init];
  if (!v17) {
    goto LABEL_14;
  }
  uint64_t v18 = [v13 copy];
  searchText = v17->_searchText;
  v17->_searchText = (NSString *)v18;

  uint64_t v20 = [v14 copy];
  searchTokens = v17->_searchTokens;
  v17->_searchTokens = (NSArray *)v20;

  uint64_t v22 = [v16 copy];
  options = v17->_options;
  v17->_options = (PXSearchQueryOptions *)v22;

  uint64_t v24 = [v15 copy];
  scopedSearchIdentifiers = v17->_scopedSearchIdentifiers;
  v17->_scopedSearchIdentifiers = (NSSet *)v24;

  v17->_searchResultTypes = a6;
  uint64_t v26 = [v13 length];
  if ([v13 length])
  {
    if (!v26) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  uint64_t v27 = [v14 count];
  if (v26)
  {
LABEL_9:
    uint64_t v28 = 1;
    goto LABEL_10;
  }
  if (!v27) {
    goto LABEL_11;
  }
  uint64_t v28 = 2;
LABEL_10:
  v17->_searchSuggestionType = v28;
LABEL_11:
  if (![v13 length] && objc_msgSend(v14, "count") == 1)
  {
    v29 = [v14 firstObject];
    v30 = [v29 priorityAssetUUID];
    uint64_t v31 = [v30 copy];
    priorityAssetUUID = v17->_priorityAssetUUID;
    v17->_priorityAssetUUID = (NSString *)v31;
  }
LABEL_14:

  return v17;
}

- (PXSearchQuery)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSearchQuery.m", 33, @"%s is not available as initializer", "-[PXSearchQuery init]");

  abort();
}

@end