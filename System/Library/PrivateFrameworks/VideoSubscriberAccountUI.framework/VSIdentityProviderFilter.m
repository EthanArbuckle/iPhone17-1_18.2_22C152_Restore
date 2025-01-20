@interface VSIdentityProviderFilter
+ (id)keyPathsForValuesAffectingFilteredIdentityProviders;
- (NSArray)allIdentityProviders;
- (NSArray)filteredIdentityProviders;
- (NSArray)supportedAccountProviderIDs;
- (NSArray)supportedIdentityProviders;
- (NSString)searchQuery;
- (VSIdentityProviderFilter)init;
- (VSTrie)searchTree;
- (id)_camelAndWordBasedPrefixesForProvider:(id)a3;
- (void)_refreshProviderList;
- (void)setAllIdentityProviders:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setSearchTree:(id)a3;
- (void)setSupportedAccountProviderIDs:(id)a3;
- (void)setSupportedIdentityProviders:(id)a3;
@end

@implementation VSIdentityProviderFilter

- (VSIdentityProviderFilter)init
{
  v12.receiver = self;
  v12.super_class = (Class)VSIdentityProviderFilter;
  v2 = [(VSIdentityProviderFilter *)&v12 init];
  v3 = v2;
  if (v2)
  {
    allIdentityProviders = v2->_allIdentityProviders;
    v5 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_allIdentityProviders = (NSArray *)MEMORY[0x263EFFA68];

    supportedAccountProviderIDs = v3->_supportedAccountProviderIDs;
    v3->_supportedAccountProviderIDs = v5;

    supportedIdentityProviders = v3->_supportedIdentityProviders;
    v3->_supportedIdentityProviders = v5;

    searchQuery = v3->_searchQuery;
    v3->_searchQuery = (NSString *)&stru_26F361E90;

    v9 = (VSTrie *)objc_alloc_init(MEMORY[0x263F1E2C8]);
    searchTree = v3->_searchTree;
    v3->_searchTree = v9;
  }
  return v3;
}

- (id)_camelAndWordBasedPrefixesForProvider:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v30 = v3;
  v5 = [v3 displayName];
  v6 = [v5 forceUnwrapObject];

  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v8 = [v6 length];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __66__VSIdentityProviderFilter__camelAndWordBasedPrefixesForProvider___block_invoke;
  v35[3] = &unk_265076CF8;
  id v9 = v7;
  id v36 = v9;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v35);
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  v11 = [NSNumber numberWithUnsignedInteger:0];
  [v10 addObject:v11];

  uint64_t v12 = [v9 count];
  uint64_t v13 = v12 - 1;
  if (v12 != 1)
  {
    do
    {
      v14 = [v9 objectAtIndex:v13 - 1];
      v15 = [v9 objectAtIndex:v13];
      if (v13 == 1)
      {
        v16 = 0;
      }
      else
      {
        v16 = [v9 objectAtIndex:v13 - 2];
      }
      int v17 = objc_msgSend(v14, "vs_composedCharacterIsWhitespace");
      if (objc_msgSend(v15, "vs_composedCharacterIsLowercase"))
      {
        int v18 = objc_msgSend(v14, "vs_composedCharacterIsUppercase");
        if (!v16) {
          goto LABEL_15;
        }
      }
      else
      {
        int v18 = 0;
        if (!v16)
        {
LABEL_15:
          uint64_t v20 = v13;
          if (!v17) {
            goto LABEL_12;
          }
          goto LABEL_11;
        }
      }
      int v19 = objc_msgSend(v16, "vs_composedCharacterIsWhitespace");
      if ((v18 & (v19 ^ 1)) != 0) {
        uint64_t v20 = v13 - 1;
      }
      else {
        uint64_t v20 = v13;
      }
      if (((v18 & (v19 ^ 1) | v17) & 1) == 0) {
        goto LABEL_12;
      }
LABEL_11:
      v21 = [NSNumber numberWithUnsignedInteger:v20];
      [v10 addObject:v21];

LABEL_12:
      --v13;
    }
    while (v13);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v22 = v10;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = [*(id *)(*((void *)&v31 + 1) + 8 * i) unsignedIntegerValue];
        v28 = objc_msgSend(v6, "substringWithRange:", v27, objc_msgSend(v6, "length") - v27);
        [v4 addObject:v28];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v24);
  }

  return v4;
}

void __66__VSIdentityProviderFilter__camelAndWordBasedPrefixesForProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  if (!v3)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The substring parameter must not be nil."];
    id v3 = 0;
  }
  [v4 addObject:v3];
}

- (void)_refreshProviderList
{
  v2 = self;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = [(VSIdentityProviderFilter *)self allIdentityProviders];
  id v4 = [(VSIdentityProviderFilter *)v2 supportedAccountProviderIDs];
  id v5 = &off_23FA0F000;
  if ([v4 count])
  {
    v26 = v2;
    uint64_t v27 = v4;
    uint64_t v25 = (void *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithArray:v4];
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v7 = v3;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v13 = [v12 providerID];
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __48__VSIdentityProviderFilter__refreshProviderList__block_invoke;
          v34[3] = &unk_265076D20;
          id v35 = v6;
          id v36 = v12;
          [v13 conditionallyUnwrapObject:v34];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v9);
    }

    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = v25;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [v6 objectForKey:*(void *)(*((void *)&v30 + 1) + 8 * j)];
          if (v20) {
            [v14 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v41 count:16];
      }
      while (v17);
    }

    id v3 = (NSArray *)[v14 copy];
    v2 = v26;
    id v4 = v27;
    id v5 = &off_23FA0F000;
  }
  id v21 = objc_alloc_init(MEMORY[0x263F1E2C8]);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = *((void *)v5 + 147);
  v28[2] = __48__VSIdentityProviderFilter__refreshProviderList__block_invoke_2;
  v28[3] = &unk_265076D48;
  v28[4] = v2;
  id v29 = v21;
  id v22 = v21;
  [(NSArray *)v3 enumerateObjectsUsingBlock:v28];
  [(VSIdentityProviderFilter *)v2 setSearchTree:v22];
  supportedIdentityProviders = v2->_supportedIdentityProviders;
  v2->_supportedIdentityProviders = v3;
  uint64_t v24 = v3;
}

uint64_t __48__VSIdentityProviderFilter__refreshProviderList__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:a2];
}

void __48__VSIdentityProviderFilter__refreshProviderList__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _camelAndWordBasedPrefixesForProvider:v3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(a1 + 40);
        uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) lowercaseString];
        [v9 insertString:v10 withAssociatedObject:v3];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)setAllIdentityProviders:(id)a3
{
  objc_storeStrong((id *)&self->_allIdentityProviders, a3);
  [(VSIdentityProviderFilter *)self _refreshProviderList];
}

- (void)setSupportedAccountProviderIDs:(id)a3
{
  objc_storeStrong((id *)&self->_supportedAccountProviderIDs, a3);
  [(VSIdentityProviderFilter *)self _refreshProviderList];
}

+ (id)keyPathsForValuesAffectingFilteredIdentityProviders
{
  if (keyPathsForValuesAffectingFilteredIdentityProviders___vs_lazy_init_predicate != -1) {
    dispatch_once(&keyPathsForValuesAffectingFilteredIdentityProviders___vs_lazy_init_predicate, &__block_literal_global_2);
  }
  v2 = (void *)keyPathsForValuesAffectingFilteredIdentityProviders___vs_lazy_init_variable;
  return v2;
}

uint64_t __79__VSIdentityProviderFilter_keyPathsForValuesAffectingFilteredIdentityProviders__block_invoke()
{
  uint64_t v0 = __79__VSIdentityProviderFilter_keyPathsForValuesAffectingFilteredIdentityProviders__block_invoke_2();
  uint64_t v1 = keyPathsForValuesAffectingFilteredIdentityProviders___vs_lazy_init_variable;
  keyPathsForValuesAffectingFilteredIdentityProviders___vs_lazy_init_variable = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id __79__VSIdentityProviderFilter_keyPathsForValuesAffectingFilteredIdentityProviders__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v0 addObject:@"supportedAccountProviderIDs"];
  [v0 addObject:@"searchQuery"];
  [v0 addObject:@"allIdentityProviders"];
  uint64_t v1 = (void *)[v0 copy];

  return v1;
}

- (NSArray)filteredIdentityProviders
{
  id v3 = [(VSIdentityProviderFilter *)self supportedIdentityProviders];
  id v4 = [(VSIdentityProviderFilter *)self searchQuery];
  uint64_t v5 = [v4 lowercaseString];

  if ([v5 length])
  {
    uint64_t v6 = [(VSIdentityProviderFilter *)self searchTree];
    uint64_t v7 = [v6 objectsMatchingPrefix:v5];

    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithArray:v7];
    uint64_t v9 = [v8 array];

    id v3 = (void *)v9;
  }

  return (NSArray *)v3;
}

- (NSArray)allIdentityProviders
{
  return self->_allIdentityProviders;
}

- (NSArray)supportedAccountProviderIDs
{
  return self->_supportedAccountProviderIDs;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
}

- (NSArray)supportedIdentityProviders
{
  return self->_supportedIdentityProviders;
}

- (void)setSupportedIdentityProviders:(id)a3
{
}

- (VSTrie)searchTree
{
  return self->_searchTree;
}

- (void)setSearchTree:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTree, 0);
  objc_storeStrong((id *)&self->_supportedIdentityProviders, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_supportedAccountProviderIDs, 0);
  objc_storeStrong((id *)&self->_allIdentityProviders, 0);
}

@end