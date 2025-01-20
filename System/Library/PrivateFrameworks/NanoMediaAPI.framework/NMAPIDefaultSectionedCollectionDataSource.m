@interface NMAPIDefaultSectionedCollectionDataSource
- (BOOL)_isSupportedItem:(id)a3;
- (NMAPIDefaultSectionedCollectionDataSource)initWithRequest:(id)a3 results:(id)a4 storeURLBag:(id)a5;
- (id)_musicURLWithPartialURLString:(id)a3;
- (id)_storeBrowseSectionWithDictionary:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)sectionAtIndex:(unint64_t)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_addItemsFromArray:(id)a3;
- (void)_addSectionWithIdentifier:(id)a3 dictionary:(id)a4;
- (void)_parseResults;
- (void)_updateImportedIdentifierSetsWithIdentifier:(id)a3 dictionary:(id)a4;
@end

@implementation NMAPIDefaultSectionedCollectionDataSource

- (NMAPIDefaultSectionedCollectionDataSource)initWithRequest:(id)a3 results:(id)a4 storeURLBag:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NMAPIDefaultSectionedCollectionDataSource;
  v12 = [(NMAPIDefaultSectionedCollectionDataSource *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_results, a4);
    objc_storeStrong((id *)&v13->_storeURLBag, a5);
    v14 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cachedSections = v13->_cachedSections;
    v13->_cachedSections = v14;

    v16 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cachedItems = v13->_cachedItems;
    v13->_cachedItems = v16;

    [(NMAPIDefaultSectionedCollectionDataSource *)v13 _parseResults];
  }

  return v13;
}

- (unint64_t)numberOfSections
{
  return [(NSMutableArray *)self->_sectionResultIDs count];
}

- (id)sectionAtIndex:(unint64_t)a3
{
  v4 = [(NSMutableArray *)self->_sectionResultIDs objectAtIndexedSubscript:a3];
  v5 = [(NSCache *)self->_cachedSections objectForKey:v4];
  if (!v5)
  {
    v6 = [(NSMutableDictionary *)self->_importedIdentifierSets objectForKey:v4];
    if (v6)
    {
      v7 = [MEMORY[0x263F12218] sharedServerObjectDatabase];
      v8 = [(NMAPIRequest *)self->_request sectionProperties];
      id v9 = [v7 modelObjectMatchingIdentifierSet:v6 propertySet:v8];
      v5 = [v9 anyObject];
    }
    else
    {
      v7 = [(NSMutableDictionary *)self->_sectionResults objectForKey:v4];
      if (v7)
      {
        v5 = [(NMAPIDefaultSectionedCollectionDataSource *)self _storeBrowseSectionWithDictionary:v7];
        if (v5) {
          [(NSCache *)self->_cachedSections setObject:v5 forKey:v4];
        }
      }
      else
      {
        v5 = 0;
      }
    }
  }

  return v5;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->_sectionedItemResultIDs objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)itemAtIndexPath:(id)a3
{
  sectionedItemResultIDs = self->_sectionedItemResultIDs;
  id v5 = a3;
  v6 = -[NSMutableArray objectAtIndexedSubscript:](sectionedItemResultIDs, "objectAtIndexedSubscript:", [v5 section]);
  uint64_t v7 = [v5 item];

  v8 = [v6 objectAtIndexedSubscript:v7];

  id v9 = [(NSCache *)self->_cachedItems objectForKey:v8];
  if (!v9)
  {
    id v10 = [(NSMutableDictionary *)self->_importedIdentifierSets objectForKey:v8];
    if (v10)
    {
      id v11 = [MEMORY[0x263F12218] sharedServerObjectDatabase];
      v12 = [(NMAPIRequest *)self->_request itemProperties];
      v13 = [v11 modelObjectMatchingIdentifierSet:v10 propertySet:v12];
      id v9 = [v13 anyObject];
    }
    else
    {
      id v11 = [(NSMutableDictionary *)self->_itemResults objectForKey:v8];
      if (v11)
      {
        id v9 = [(NMAPIDefaultSectionedCollectionDataSource *)self _storeBrowseSectionWithDictionary:v11];
        if (v9) {
          [(NSCache *)self->_cachedItems setObject:v9 forKey:v8];
        }
      }
      else
      {
        id v9 = 0;
      }
    }
  }

  return v9;
}

- (void)_parseResults
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  sectionResultIDs = self->_sectionResultIDs;
  self->_sectionResultIDs = v3;

  id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  sectionResults = self->_sectionResults;
  self->_sectionResults = v5;

  uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  sectionedItemResultIDs = self->_sectionedItemResultIDs;
  self->_sectionedItemResultIDs = v7;

  id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  itemResults = self->_itemResults;
  self->_itemResults = v9;

  id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  importedIdentifierSets = self->_importedIdentifierSets;
  self->_importedIdentifierSets = v11;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obj = self->_results;
  uint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v18 = [v17 itemsArray];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __58__NMAPIDefaultSectionedCollectionDataSource__parseResults__block_invoke;
        v29[3] = &unk_2647C11A0;
        v29[4] = self;
        objc_super v19 = [MEMORY[0x263F08A98] predicateWithBlock:v29];
        v20 = [v18 filteredArrayUsingPredicate:v19];

        if ([v20 count])
        {
          v21 = [v17 sectionIdentifier];
          v22 = [v17 sectionDictionary];
          [(NMAPIDefaultSectionedCollectionDataSource *)self _addSectionWithIdentifier:v21 dictionary:v22];

          [(NMAPIDefaultSectionedCollectionDataSource *)self _addItemsFromArray:v20];
        }
      }
      uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v14);
  }

  v23 = NMLogForCategory(10);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = self->_sectionResultIDs;
    v25 = self->_sectionResults;
    v26 = self->_sectionedItemResultIDs;
    v27 = self->_itemResults;
    *(_DWORD *)buf = 138413058;
    v35 = v24;
    __int16 v36 = 2112;
    v37 = v25;
    __int16 v38 = 2112;
    v39 = v26;
    __int16 v40 = 2112;
    v41 = v27;
    _os_log_debug_impl(&dword_2269EF000, v23, OS_LOG_TYPE_DEBUG, "[NanoMediaAPI] _sectionResultIDs: %@, _sectionResults: %@, _sectionedItemResultIDs: %@, _itemResults: %@", buf, 0x2Au);
  }
}

uint64_t __58__NMAPIDefaultSectionedCollectionDataSource__parseResults__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isSupportedItem:a2];
}

- (void)_addSectionWithIdentifier:(id)a3 dictionary:(id)a4
{
  sectionResultIDs = self->_sectionResultIDs;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableArray *)sectionResultIDs addObject:v8];
  [(NSMutableDictionary *)self->_sectionResults setObject:v7 forKeyedSubscript:v8];
  [(NMAPIDefaultSectionedCollectionDataSource *)self _updateImportedIdentifierSetsWithIdentifier:v8 dictionary:v7];
}

- (void)_addItemsFromArray:(id)a3
{
  unint64_t v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __64__NMAPIDefaultSectionedCollectionDataSource__addItemsFromArray___block_invoke;
  uint64_t v13 = &unk_2647C11C8;
  id v14 = v6;
  uint64_t v15 = self;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  sectionedItemResultIDs = self->_sectionedItemResultIDs;
  id v9 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  [(NSMutableArray *)sectionedItemResultIDs addObject:v9];
}

void __64__NMAPIDefaultSectionedCollectionDataSource__addItemsFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 valueForKeyPath:@"attributes.editorialElementKind"];
  if ([v4 isEqualToString:@"489"])
  {
    id v5 = [v3 valueForKeyPath:@"relationships.contents.data"];
    uint64_t v6 = [v5 firstObject];

    id v3 = (id)v6;
  }
  id v7 = [v3 objectForKey:@"id"];
  if (v7
    || ([v3 objectForKey:@"label"], (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [*(id *)(a1 + 32) addObject:v7];
    [*(id *)(*(void *)(a1 + 40) + 56) setValue:v3 forKey:v7];
    [*(id *)(a1 + 40) _updateImportedIdentifierSetsWithIdentifier:v7 dictionary:v3];
  }
  else
  {
    id v7 = NMLogForCategory(9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__NMAPIDefaultSectionedCollectionDataSource__addItemsFromArray___block_invoke_cold_1((uint64_t)v3, v7);
    }
  }
}

- (BOOL)_isSupportedItem:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 valueForKeyPath:@"attributes.mediaKind"];
  char v5 = [v4 isEqualToString:@"video"];

  uint64_t v6 = [v3 valueForKeyPath:@"type"];

  LOBYTE(v3) = [v6 isEqualToString:@"music-movies"];
  return (v5 | v3) ^ 1;
}

- (void)_updateImportedIdentifierSetsWithIdentifier:(id)a3 dictionary:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKey:*MEMORY[0x263F11C80]];

  if (v7)
  {
    id v8 = [v6 objectForKey:*MEMORY[0x263F11C88]];
    [(NSMutableDictionary *)self->_importedIdentifierSets setValue:v8 forKey:v9];
  }
}

- (id)_musicURLWithPartialURLString:(id)a3
{
  unint64_t v4 = [MEMORY[0x263F08BA0] componentsWithString:a3];
  char v5 = [v4 scheme];

  if (!v5)
  {
    id v6 = MusicURLComponentsWithURLBag(self->_storeURLBag, 0);
    id v7 = [v6 scheme];
    [v4 setScheme:v7];
  }
  id v8 = [v4 host];

  if (!v8)
  {
    id v9 = MusicURLComponentsWithURLBag(self->_storeURLBag, 0);
    uint64_t v10 = [v9 host];
    [v4 setHost:v10];
  }
  uint64_t v11 = [v4 URL];

  return v11;
}

- (id)_storeBrowseSectionWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F12068]);
  id v6 = [MEMORY[0x263F11DB0] emptyIdentifierSet];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__NMAPIDefaultSectionedCollectionDataSource__storeBrowseSectionWithDictionary___block_invoke;
  v10[3] = &unk_2647C11F0;
  id v11 = v4;
  v12 = self;
  id v7 = v4;
  id v8 = (void *)[v5 initWithIdentifiers:v6 block:v10];

  return v8;
}

void __79__NMAPIDefaultSectionedCollectionDataSource__storeBrowseSectionWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  id v3 = [*(id *)(a1 + 32) objectForKey:@"name"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) valueForKeyPath:@"attributes.name"];
    id v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      id v8 = [*(id *)(a1 + 32) valueForKeyPath:@"attributes.title"];
      id v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [*(id *)(a1 + 32) objectForKey:@"label"];
      }
      id v5 = v10;
    }
  }

  [v21 setTitle:v5];
  id v11 = [*(id *)(a1 + 32) objectForKey:@"href"];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [*(id *)(a1 + 32) objectForKey:@"url"];
  }
  id v14 = v13;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && [*(id *)(*(void *)(a1 + 40) + 8) performSelector:sel_resultsPerSection] >= 1)
  {
    uint64_t v15 = [*(id *)(a1 + 32) objectForKey:@"next"];
    if (!v15)
    {

      id v14 = 0;
    }
  }
  if (v14)
  {
    v16 = [*(id *)(a1 + 40) _musicURLWithPartialURLString:v14];
    [v21 setLoadAdditionalContentURL:v16];
  }
  else
  {
    [v21 setLoadAdditionalContentURL:0];
  }
  v17 = [*(id *)(a1 + 32) valueForKeyPath:@"attributes.editorialElementKind"];
  if ([v17 isEqualToString:@"488"])
  {
    uint64_t v18 = 13;
  }
  else if ([v17 isEqualToString:@"388"])
  {
    uint64_t v18 = 10;
  }
  else if ([v17 isEqualToString:@"391"])
  {
    uint64_t v18 = 11;
  }
  else
  {
    uint64_t v18 = 0;
  }
  objc_super v19 = [*(id *)(a1 + 32) objectForKey:@"isRecentlyPlayed"];

  if (v19) {
    uint64_t v20 = 9;
  }
  else {
    uint64_t v20 = v18;
  }
  [v21 setSectionType:v20];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importedIdentifierSets, 0);
  objc_storeStrong((id *)&self->_cachedItems, 0);
  objc_storeStrong((id *)&self->_cachedSections, 0);
  objc_storeStrong((id *)&self->_itemResults, 0);
  objc_storeStrong((id *)&self->_sectionedItemResultIDs, 0);
  objc_storeStrong((id *)&self->_sectionResults, 0);
  objc_storeStrong((id *)&self->_sectionResultIDs, 0);
  objc_storeStrong((id *)&self->_storeURLBag, 0);
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

void __64__NMAPIDefaultSectionedCollectionDataSource__addItemsFromArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2269EF000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve object %@", (uint8_t *)&v2, 0xCu);
}

@end