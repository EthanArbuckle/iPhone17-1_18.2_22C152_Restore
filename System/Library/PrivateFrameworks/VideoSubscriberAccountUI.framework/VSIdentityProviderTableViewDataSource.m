@interface VSIdentityProviderTableViewDataSource
- (BOOL)hasStorefrontOrIdentityProviderAtIndexPath:(id)a3;
- (NSArray)identityProviders;
- (NSArray)providerSections;
- (NSArray)storefrontSections;
- (NSArray)tvProviderSupportedStorefronts;
- (NSDictionary)destinationsBySectionIndexTitle;
- (NSString)requestedStorefrontCountryCode;
- (UITableView)tableView;
- (VSIdentityProviderTableViewDataSource)init;
- (id)_additionalProvidersRowTitle;
- (id)_cellReuseIdentifierForRowAtIndexPath:(id)a3;
- (id)_textColorForRowAtIndexPath:(id)a3;
- (id)_titleForRowAtIndexPath:(id)a3;
- (id)identityProviderForRowAtIndexPath:(id)a3;
- (id)preferredIndexPathForIdentityProviderWithName:(id)a3;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)storefrontAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (int64_t)_cellStyleForRowAtIndexPath:(id)a3;
- (int64_t)_textAlignmentForRowAtIndexPath:(id)a3;
- (int64_t)cellAccessoryType;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_minimumProviderCountForIndexes;
- (unint64_t)additionalProvidersMode;
- (void)_scrollToTableHeaderView;
- (void)setAdditionalProvidersMode:(unint64_t)a3;
- (void)setDestinationsBySectionIndexTitle:(id)a3;
- (void)setIdentityProviders:(id)a3;
- (void)setNumberOfLinesForCell:(id)a3 atIndexPath:(id)a4;
- (void)setProviderSections:(id)a3;
- (void)setRequestedStorefrontCountryCode:(id)a3;
- (void)setStorefrontSections:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTvProviderSupportedStorefronts:(id)a3;
@end

@implementation VSIdentityProviderTableViewDataSource

- (VSIdentityProviderTableViewDataSource)init
{
  v10.receiver = self;
  v10.super_class = (Class)VSIdentityProviderTableViewDataSource;
  v2 = [(VSIdentityProviderTableViewDataSource *)&v10 init];
  v3 = v2;
  if (v2)
  {
    providerSections = v2->_providerSections;
    v5 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_providerSections = (NSArray *)MEMORY[0x263EFFA68];

    storefrontSections = v3->_storefrontSections;
    v3->_storefrontSections = v5;

    identityProviders = v3->_identityProviders;
    v3->_identityProviders = v5;

    destinationsBySectionIndexTitle = v3->_destinationsBySectionIndexTitle;
    v3->_destinationsBySectionIndexTitle = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v3;
}

- (void)setIdentityProviders:(id)a3
{
  v86[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v60 = self;
  objc_storeStrong((id *)&self->_identityProviders, a3);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  v7 = (void *)[v5 mutableCopy];
  uint64_t v8 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"rankForSorting" ascending:1];
  uint64_t v9 = [MEMORY[0x263F087F0] expressionForKeyPath:@"rankForSorting"];
  v54 = [MEMORY[0x263F087F0] expressionForConstantValue:0];
  v55 = (void *)v9;
  v53 = objc_msgSend(MEMORY[0x263F08720], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v9);
  objc_msgSend(v7, "filterUsingPredicate:");
  v56 = (void *)v8;
  v86[0] = v8;
  objc_super v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:1];
  [v7 sortUsingDescriptors:v10];

  if ([v7 count])
  {
    v11 = objc_alloc_init(VSIdentityProviderSection);
    [(VSIdentityProviderSection *)v11 setIdentityProviders:v7];
    [v6 addObject:v11];
  }
  v12 = VSDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    *(_DWORD *)buf = 138412546;
    v83 = v13;
    __int16 v84 = 2112;
    v85 = v7;
    _os_log_impl(&dword_23F9AB000, v12, OS_LOG_TYPE_DEFAULT, "Found %@ featured providers: %@", buf, 0x16u);
  }
  v59 = v5;
  v14 = (void *)[v5 mutableCopy];
  unint64_t v15 = [v14 count];
  if (v15 < -[VSIdentityProviderTableViewDataSource _minimumProviderCountForIndexes](self, "_minimumProviderCountForIndexes"))[v14 removeObjectsInArray:v7]; {
  v57 = v7;
  }
  v58 = v6;
  uint64_t v52 = [v14 count];
  v16 = [MEMORY[0x263F1C798] currentCollation];
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  v18 = [v16 sectionIndexTitles];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    unint64_t v20 = 0;
    do
    {
      id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
      [v17 addObject:v21];

      ++v20;
      v22 = [v16 sectionIndexTitles];
      unint64_t v23 = [v22 count];
    }
    while (v20 < v23);
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v24 = v14;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v75 objects:v81 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v76 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v75 + 1) + 8 * i);
        v30 = objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v16, "sectionForObject:collationStringSelector:", v29, sel_nameForSorting));
        [v30 addObject:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v75 objects:v81 count:16];
    }
    while (v26);
  }

  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v32 = v17;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v71 objects:v80 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v72 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = [v16 sortedArrayFromArray:*(void *)(*((void *)&v71 + 1) + 8 * j) collationStringSelector:sel_nameForSorting];
        [v31 addObject:v37];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v71 objects:v80 count:16];
    }
    while (v34);
  }

  id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v39 = [v58 count];
  v40 = [v16 sectionIndexTitles];
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __62__VSIdentityProviderTableViewDataSource_setIdentityProviders___block_invoke;
  v65[3] = &unk_265078190;
  id v41 = v16;
  id v66 = v41;
  id v42 = v31;
  id v67 = v42;
  uint64_t v69 = v52;
  uint64_t v70 = v39;
  id v43 = v38;
  id v68 = v43;
  [v40 enumerateObjectsUsingBlock:v65];

  [(VSIdentityProviderTableViewDataSource *)self setDestinationsBySectionIndexTitle:v43];
  id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v45 = v42;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v61 objects:v79 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v47; ++k)
      {
        if (*(void *)v62 != v48) {
          objc_enumerationMutation(v45);
        }
        [v44 addObjectsFromArray:*(void *)(*((void *)&v61 + 1) + 8 * k)];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v61 objects:v79 count:16];
    }
    while (v47);
  }

  v50 = objc_alloc_init(VSIdentityProviderSection);
  [(VSIdentityProviderSection *)v50 setIdentityProviders:v44];
  [v58 addObject:v50];
  [(VSIdentityProviderTableViewDataSource *)v60 setProviderSections:v58];
  v51 = [(VSIdentityProviderTableViewDataSource *)v60 tableView];
  [v51 reloadData];
}

void __62__VSIdentityProviderTableViewDataSource_setIdentityProviders___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) sectionForSectionIndexTitleAtIndex:a3];
  if (v5 < 1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v9 = [*(id *)(a1 + 40) objectAtIndex:i];
      v7 += [v9 count];
    }
  }
  if (v7 >= *(void *)(a1 + 56) - 1) {
    uint64_t v10 = *(void *)(a1 + 56) - 1;
  }
  else {
    uint64_t v10 = v7;
  }
  v11 = [MEMORY[0x263F088C8] indexPathForRow:v10 inSection:*(void *)(a1 + 64)];
  [*(id *)(a1 + 48) setObject:v11 forKey:v12];
}

- (void)setTvProviderSupportedStorefronts:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_tvProviderSupportedStorefronts, a3);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v14, "isFeatured", (void)v19)) {
          unint64_t v15 = v6;
        }
        else {
          unint64_t v15 = v7;
        }
        [v15 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  if ([v6 count])
  {
    v16 = objc_alloc_init(VSStorefrontSection);
    [(VSStorefrontSection *)v16 setStorefronts:v6];
    [v8 addObject:v16];
  }
  id v17 = objc_alloc_init(VSStorefrontSection);
  [(VSStorefrontSection *)v17 setStorefronts:v7];
  [v8 addObject:v17];
  [(VSIdentityProviderTableViewDataSource *)self setStorefrontSections:v8];
  v18 = [(VSIdentityProviderTableViewDataSource *)self tableView];
  [v18 reloadData];
}

- (unint64_t)_minimumProviderCountForIndexes
{
  return 50;
}

- (void)setTableView:(id)a3
{
  id v5 = (UITableView *)a3;
  tableView = self->_tableView;
  if (tableView != v5)
  {
    id v7 = v5;
    [(UITableView *)tableView setDataSource:0];
    objc_storeStrong((id *)&self->_tableView, a3);
    [(UITableView *)self->_tableView setDataSource:self];
    tableView = (UITableView *)[(UITableView *)self->_tableView setSectionIndexMinimumDisplayRowCount:[(VSIdentityProviderTableViewDataSource *)self _minimumProviderCountForIndexes]];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](tableView, v5);
}

- (void)setAdditionalProvidersMode:(unint64_t)a3
{
  if (self->_additionalProvidersMode != a3)
  {
    self->_additionalProvidersMode = a3;
    id v5 = [(VSIdentityProviderTableViewDataSource *)self tableView];
    [v5 reloadData];

    if (a3 - 5 <= 1)
    {
      id v6 = [(VSIdentityProviderTableViewDataSource *)self tableView];
      objc_msgSend(v6, "vs_scrollToTopAnimated:", 0);

      id v7 = [(VSIdentityProviderTableViewDataSource *)self tableView];
      [v7 setNeedsFocusUpdate];
    }
  }
}

- (id)identityProviderForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 section];
  id v6 = [(VSIdentityProviderTableViewDataSource *)self providerSections];
  if (v5 >= [v6 count])
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v7 = [v6 objectAtIndex:v5];
    unint64_t v8 = [v4 row];
    id v9 = [v7 identityProviders];
    if (v8 >= [v9 count])
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = [v9 objectAtIndex:v8];
    }
  }
  return v10;
}

- (id)preferredIndexPathForIdentityProviderWithName:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = [(VSIdentityProviderTableViewDataSource *)self providerSections];
  uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v23)
  {
    uint64_t v5 = 0;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        uint64_t v25 = v5;
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        unint64_t v8 = [v7 identityProviders];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = 0;
          uint64_t v12 = *(void *)v27;
LABEL_8:
          uint64_t v13 = 0;
          uint64_t v24 = v11 + v10;
          while (1)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v8);
            }
            v14 = [*(id *)(*((void *)&v26 + 1) + 8 * v13) displayName];
            unint64_t v15 = [v14 object];
            char v16 = [v15 isEqualToString:v4];

            if (v16) {
              break;
            }
            if (v10 == ++v13)
            {
              uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
              uint64_t v11 = v24;
              if (v10) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          uint64_t v18 = v11 + v13;
          uint64_t v17 = v25;
          long long v19 = [MEMORY[0x263F088C8] indexPathForRow:v18 inSection:v25];

          if (v19) {
            goto LABEL_19;
          }
        }
        else
        {
LABEL_14:

          uint64_t v17 = v25;
        }
        uint64_t v5 = v17 + 1;
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v23);
  }
  long long v19 = 0;
LABEL_19:

  return v19;
}

- (id)storefrontAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  uint64_t v6 = [v4 row];

  id v7 = [(VSIdentityProviderTableViewDataSource *)self storefrontSections];
  unint64_t v8 = [v7 objectAtIndex:v5];

  uint64_t v9 = [v8 storefronts];
  uint64_t v10 = [v9 objectAtIndex:v6];

  return v10;
}

- (BOOL)hasStorefrontOrIdentityProviderAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t additionalProvidersMode = self->_additionalProvidersMode;
  if (additionalProvidersMode == 5)
  {
    uint64_t v6 = [(VSIdentityProviderTableViewDataSource *)self identityProviderForRowAtIndexPath:v4];
  }
  else
  {
    if (additionalProvidersMode != 6)
    {
      BOOL v7 = 0;
      goto LABEL_7;
    }
    uint64_t v6 = [(VSIdentityProviderTableViewDataSource *)self storefrontAtIndexPath:v4];
  }
  BOOL v7 = v6 != 0;

LABEL_7:
  return v7;
}

- (id)_additionalProvidersRowTitle
{
  unint64_t v2 = [(VSIdentityProviderTableViewDataSource *)self additionalProvidersMode];
  switch(v2)
  {
    case 5uLL:
      v3 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
      id v4 = v3;
      uint64_t v5 = @"REGIONS_PICKER_OTHER_REGIONS_ROW_TITLE";
      goto LABEL_7;
    case 3uLL:
      v3 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
      id v4 = v3;
      uint64_t v5 = @"IDENTITY_PROVIDER_PICKER_OTHER_PROVIDERS_ROW_TITLE_DEVELOPER";
      goto LABEL_7;
    case 1uLL:
      v3 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
      id v4 = v3;
      uint64_t v5 = @"IDENTITY_PROVIDER_PICKER_OTHER_PROVIDERS_ROW_TITLE";
LABEL_7:
      uint64_t v6 = [v3 localizedStringForKey:v5 value:0 table:0];

      goto LABEL_9;
  }
  uint64_t v6 = 0;
LABEL_9:
  return v6;
}

- (id)_cellReuseIdentifierForRowAtIndexPath:(id)a3
{
  v3 = [(VSIdentityProviderTableViewDataSource *)self identityProviderForRowAtIndexPath:a3];

  if (v3) {
    return @"IdentityProviderCell";
  }
  else {
    return @"AdditionalProvidersCell";
  }
}

- (int64_t)_cellStyleForRowAtIndexPath:(id)a3
{
  v3 = [(VSIdentityProviderTableViewDataSource *)self identityProviderForRowAtIndexPath:a3];

  return v3 != 0;
}

- (id)_titleForRowAtIndexPath:(id)a3
{
  id v4 = [(VSIdentityProviderTableViewDataSource *)self identityProviderForRowAtIndexPath:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 displayName];
    BOOL v7 = [v6 forceUnwrapObject];

    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v7 = [(VSIdentityProviderTableViewDataSource *)self _additionalProvidersRowTitle];
  if (!v7) {
LABEL_3:
  }
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The title parameter must not be nil."];
LABEL_4:

  return v7;
}

- (int64_t)_textAlignmentForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(VSIdentityProviderTableViewDataSource *)self additionalProvidersMode] != 6)
  {
    [(VSIdentityProviderTableViewDataSource *)self identityProviderForRowAtIndexPath:v4];
  }
  return 4;
}

- (id)_textColorForRowAtIndexPath:(id)a3
{
  id v4 = (void *)MEMORY[0x263F1C550];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "vsa_primaryLabelColor");
  if ([(VSIdentityProviderTableViewDataSource *)self additionalProvidersMode] == 6) {
    [(VSIdentityProviderTableViewDataSource *)self storefrontAtIndexPath:v5];
  }
  else {
  BOOL v7 = [(VSIdentityProviderTableViewDataSource *)self identityProviderForRowAtIndexPath:v5];
  }

  if (v7)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263F1C550], "vsa_primaryLabelColor");

    uint64_t v6 = (void *)v8;
  }
  return v6;
}

- (void)_scrollToTableHeaderView
{
  id v3 = [(VSIdentityProviderTableViewDataSource *)self tableView];
  unint64_t v2 = [v3 tableHeaderView];
  [v2 bounds];
  objc_msgSend(v3, "convertRect:fromView:", v2);
  objc_msgSend(v3, "scrollRectToVisible:animated:", 0);
}

- (void)setNumberOfLinesForCell:(id)a3 atIndexPath:(id)a4
{
  id v4 = [a3 textLabel];
  [v4 setNumberOfLines:0];
}

- (int64_t)cellAccessoryType
{
  return 0;
}

- (id)tableView:(id)a3 indexPathForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [NSNumber numberWithInteger:a5];
    int v14 = 138412546;
    id v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "Requesting index path for title %@ at index %@", (uint8_t *)&v14, 0x16u);
  }
  if ([v7 isEqualToString:*MEMORY[0x263F1D610]])
  {
    [(VSIdentityProviderTableViewDataSource *)self performSelector:sel__scrollToTableHeaderView withObject:0 afterDelay:0.0];
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = [(VSIdentityProviderTableViewDataSource *)self destinationsBySectionIndexTitle];
    uint64_t v10 = [v11 objectForKey:v7];
  }
  uint64_t v12 = VSDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v10;
    _os_log_impl(&dword_23F9AB000, v12, OS_LOG_TYPE_DEFAULT, "Returning index path %@", (uint8_t *)&v14, 0xCu);
  }

  return v10;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 addObject:*MEMORY[0x263F1D610]];
  id v4 = [MEMORY[0x263F1C798] currentCollation];
  id v5 = [v4 sectionIndexTitles];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = [(VSIdentityProviderTableViewDataSource *)self providerSections];
  int64_t v5 = [v4 count];

  switch([(VSIdentityProviderTableViewDataSource *)self additionalProvidersMode])
  {
    case 1uLL:
    case 3uLL:
    case 5uLL:
      ++v5;
      break;
    case 6uLL:
      uint64_t v6 = [(VSIdentityProviderTableViewDataSource *)self storefrontSections];
      int64_t v5 = [v6 count];

      break;
    default:
      return v5;
  }
  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(VSIdentityProviderTableViewDataSource *)self additionalProvidersMode] == 6)
  {
    uint64_t v6 = [(VSIdentityProviderTableViewDataSource *)self storefrontSections];
    id v7 = [v6 objectAtIndex:a4];

    uint64_t v8 = [v7 storefronts];
    int64_t v9 = [v8 count];
LABEL_5:

    goto LABEL_6;
  }
  id v7 = [(VSIdentityProviderTableViewDataSource *)self providerSections];
  int64_t v10 = [v7 count];
  if (v10 > a4)
  {
    uint64_t v8 = [v7 objectAtIndex:a4];
    uint64_t v11 = [v8 identityProviders];
    int64_t v9 = [v11 count];

    goto LABEL_5;
  }
  if (v10 == a4)
  {
    unint64_t v13 = [(VSIdentityProviderTableViewDataSource *)self additionalProvidersMode];
    int64_t v9 = v13 <= 5 && ((1 << v13) & 0x2A) != 0;
  }
  else
  {
    int64_t v9 = 0;
  }
LABEL_6:

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(VSIdentityProviderTableViewDataSource *)self additionalProvidersMode] == 6)
  {
    uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"IdentityProviderCell"];
    if (!v8) {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"IdentityProviderCell"];
    }
    int64_t v9 = [(VSIdentityProviderTableViewDataSource *)self storefrontAtIndexPath:v7];
    int64_t v10 = [v9 displayName];
    objc_msgSend(v8, "setAccessoryType:", -[VSIdentityProviderTableViewDataSource cellAccessoryType](self, "cellAccessoryType"));
    uint64_t v11 = [v8 textLabel];
    [v11 setText:v10];
  }
  else
  {
    int64_t v9 = [(VSIdentityProviderTableViewDataSource *)self _cellReuseIdentifierForRowAtIndexPath:v7];
    uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:v9];
    if (!v8)
    {
      int64_t v12 = [(VSIdentityProviderTableViewDataSource *)self _cellStyleForRowAtIndexPath:v7];
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:v12 reuseIdentifier:v9];
    }
    int64_t v10 = [(VSIdentityProviderTableViewDataSource *)self _titleForRowAtIndexPath:v7];
    unint64_t v13 = [v8 textLabel];
    [v13 setText:v10];

    [(VSIdentityProviderTableViewDataSource *)self setNumberOfLinesForCell:v8 atIndexPath:v7];
    objc_msgSend(v8, "setAccessoryType:", -[VSIdentityProviderTableViewDataSource cellAccessoryType](self, "cellAccessoryType"));
    uint64_t v11 = [v8 textLabel];
  }
  objc_msgSend(v11, "setTextAlignment:", -[VSIdentityProviderTableViewDataSource _textAlignmentForRowAtIndexPath:](self, "_textAlignmentForRowAtIndexPath:", v7));
  int v14 = [(VSIdentityProviderTableViewDataSource *)self _textColorForRowAtIndexPath:v7];
  [v11 setTextColor:v14];
  [v11 setLineBreakMode:0];
  if (!v8) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The cell parameter must not be nil."];
  }

  return v8;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (NSArray)identityProviders
{
  return self->_identityProviders;
}

- (unint64_t)additionalProvidersMode
{
  return self->_additionalProvidersMode;
}

- (NSString)requestedStorefrontCountryCode
{
  return self->_requestedStorefrontCountryCode;
}

- (void)setRequestedStorefrontCountryCode:(id)a3
{
  self->_requestedStorefrontCountryCode = (NSString *)a3;
}

- (NSArray)tvProviderSupportedStorefronts
{
  return self->_tvProviderSupportedStorefronts;
}

- (NSArray)providerSections
{
  return self->_providerSections;
}

- (void)setProviderSections:(id)a3
{
}

- (NSArray)storefrontSections
{
  return self->_storefrontSections;
}

- (void)setStorefrontSections:(id)a3
{
}

- (NSDictionary)destinationsBySectionIndexTitle
{
  return self->_destinationsBySectionIndexTitle;
}

- (void)setDestinationsBySectionIndexTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationsBySectionIndexTitle, 0);
  objc_storeStrong((id *)&self->_storefrontSections, 0);
  objc_storeStrong((id *)&self->_providerSections, 0);
  objc_storeStrong((id *)&self->_tvProviderSupportedStorefronts, 0);
  objc_storeStrong((id *)&self->_identityProviders, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end