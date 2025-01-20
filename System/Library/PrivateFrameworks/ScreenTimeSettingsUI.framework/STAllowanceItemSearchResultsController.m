@interface STAllowanceItemSearchResultsController
- (BOOL)hasNewSelection;
- (NSArray)allowanceItemSpecifiers;
- (NSArray)filteredAllowanceItemSpecifiers;
- (NSMutableOrderedSet)selectedBundleIdentifiers;
- (NSMutableOrderedSet)selectedWebDomains;
- (NSOrderedSet)initalBundleIdentifiers;
- (NSOrderedSet)initialWebDomains;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setAllowanceItemSpecifiers:(id)a3;
- (void)setFilteredAllowanceItemSpecifiers:(id)a3;
- (void)setHasNewSelection:(BOOL)a3;
- (void)setInitalBundleIdentifiers:(id)a3;
- (void)setInitialWebDomains:(id)a3;
- (void)setSelectedBundleIdentifiers:(id)a3;
- (void)setSelectedWebDomains:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STAllowanceItemSearchResultsController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)STAllowanceItemSearchResultsController;
  [(STAllowanceItemSearchResultsController *)&v6 viewDidLoad];
  v3 = [(STAllowanceItemSearchResultsController *)self tableView];
  [v3 setEditing:1];
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 0.0, 2.22507386e-308);
  [v3 setTableHeaderView:v4];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceItemSearchResultsController.viewDidLoad", v5, 2u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STAllowanceItemSearchResultsController;
  [(STAllowanceItemSearchResultsController *)&v7 viewWillAppear:a3];
  v4 = [(STAllowanceItemSearchResultsController *)self selectedWebDomains];
  [(STAllowanceItemSearchResultsController *)self setInitialWebDomains:v4];

  v5 = [(STAllowanceItemSearchResultsController *)self selectedBundleIdentifiers];
  [(STAllowanceItemSearchResultsController *)self setInitalBundleIdentifiers:v5];

  [(STAllowanceItemSearchResultsController *)self setHasNewSelection:0];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceItemSearchResultsController.viewWillAppear", v6, 2u);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(STAllowanceItemSearchResultsController *)self filteredAllowanceItemSpecifiers];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"AllowanceItem"];
  v8 = objc_opt_new();
  v9 = [MEMORY[0x263F825C8] clearColor];
  [v8 setBackgroundColor:v9];

  [v7 setSelectedBackgroundView:v8];
  v10 = [(STAllowanceItemSearchResultsController *)self filteredAllowanceItemSpecifiers];
  uint64_t v11 = [v6 row];

  v12 = [v10 objectAtIndexedSubscript:v11];

  v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F600A8]];
  v14 = v13;
  if (v13) {
    uint64_t v15 = [v13 BOOLValue];
  }
  else {
    uint64_t v15 = 1;
  }
  [v7 setUserInteractionEnabled:v15];
  v16 = [v7 iconImageView];
  v17 = v16;
  double v18 = 0.5;
  if (v15) {
    double v18 = 1.0;
  }
  [v16 setAlpha:v18];
  v19 = [MEMORY[0x263F67408] sharedCache];
  v20 = [v12 objectForKeyedSubscript:@"CategoryIdentifier"];
  uint64_t v21 = *MEMORY[0x263F673F0];
  v58 = v20;
  v59 = v8;
  v60 = v14;
  if ([v20 isEqualToString:*MEMORY[0x263F673F0]])
  {
    v22 = [MEMORY[0x263F82DA0] currentTraitCollection];
    uint64_t v56 = [v22 userInterfaceStyle];
    id v23 = [v12 name];
    v57 = v22;
    if ([v23 length])
    {
      uint64_t v53 = v21;
      v54 = v19;
      v55 = v17;
      v24 = objc_opt_new();
      [v24 setScheme:@"https"];
      [v24 setHost:v23];
      v52 = [v24 URL];
      v25 = objc_msgSend(v52, "_lp_highLevelDomain");
      v26 = [v24 host];
      v27 = [v24 URL];
      id v28 = v25;
      id v29 = v26;
      id v30 = v27;
      if ([v28 length])
      {
        v31 = [v28 substringToIndex:1];
        v32 = [v31 uppercaseString];
      }
      else
      {
        v38 = [v29 substringToIndex:1];
        v32 = [v38 uppercaseString];

        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[STAllowanceItemSearchResultsController tableView:cellForRowAtIndexPath:]((uint64_t)v30, (uint64_t)v29);
        }
      }
      uint64_t v21 = v53;

      v19 = v54;
      v17 = v55;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[STAllowanceItemSearchResultsController tableView:cellForRowAtIndexPath:]((uint64_t)v23);
      }
      v32 = 0;
    }
    v37 = v58;

    v39 = [v19 monogramImageForInitial:v32 useDarkColors:v56 == 2];
    [v17 setImage:v39];
  }
  else
  {
    v33 = [v12 identifier];
    v34 = [v19 imageForBundleIdentifier:v33];
    if (v34)
    {
      [v17 setImage:v34];
    }
    else
    {
      [v19 imageForBlankApplicationIcon];
      v36 = v35 = v17;
      [v35 setImage:v36];

      v17 = v35;
    }
    v37 = v58;
  }
  v40 = [v7 nameLabel];
  v41 = [v12 name];
  [v40 setText:v41];

  [v40 setEnabled:v15];
  v42 = [v7 dashLabel];
  [v42 setEnabled:v15];

  v43 = [v7 categoryLabel];
  id v44 = v37;
  if ([v44 isEqualToString:v21])
  {
    +[STScreenTimeSettingsUIBundle bundle];
    v45 = v12;
    v46 = v19;
    v48 = v47 = v17;
    v49 = [v48 localizedStringForKey:@"MostUsedWebsites" value:&stru_26D9391A8 table:0];

    v17 = v47;
    v19 = v46;
    v12 = v45;
  }
  else
  {
    if (([v44 isEqualToString:*MEMORY[0x263F31860]] & 1) != 0
      || ([v44 isEqualToString:*MEMORY[0x263F31870]] & 1) != 0
      || [v44 isEqualToString:*MEMORY[0x263F31868]])
    {
      uint64_t v50 = [MEMORY[0x263F318B8] shortLocalizedNameForIdentifier:v44];
    }
    else
    {
      uint64_t v50 = STCategoryNameWithIdentifier();
    }
    v49 = (void *)v50;
  }

  [v43 setText:v49];
  [v43 setEnabled:v15];

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v19 = a3;
  id v7 = a4;
  id v8 = a5;
  if (([v7 isUserInteractionEnabled] & 1) == 0 && (objc_msgSend(v7, "isSelected") & 1) == 0)
  {
    [v7 setUserInteractionEnabled:1];
    [v19 selectRowAtIndexPath:v8 animated:0 scrollPosition:0];
    [v7 setUserInteractionEnabled:0];
  }
  [v7 separatorInset];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [v7 contentView];
  [v15 frame];
  double MinX = CGRectGetMinX(v21);
  v17 = [v7 nameLabel];
  [v17 frame];
  double v18 = MinX + CGRectGetMinX(v22);

  objc_msgSend(v7, "setSeparatorInset:", v10, v18, v12, v14);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(STAllowanceItemSearchResultsController *)self filteredAllowanceItemSpecifiers];
  uint64_t v7 = [v5 row];

  id v16 = [v6 objectAtIndexedSubscript:v7];

  id v8 = [v16 objectForKeyedSubscript:@"CategoryIdentifier"];
  double v9 = [(STAllowanceItemSearchResultsController *)self selectedWebDomains];
  double v10 = [(STAllowanceItemSearchResultsController *)self selectedBundleIdentifiers];
  int v11 = [v8 isEqualToString:*MEMORY[0x263F673F0]];
  double v12 = [v16 identifier];
  if (v11) {
    double v13 = v9;
  }
  else {
    double v13 = v10;
  }
  [v13 addObject:v12];

  double v14 = [(STAllowanceItemSearchResultsController *)self initialWebDomains];
  if ([v9 isSubsetOfOrderedSet:v14])
  {
    uint64_t v15 = [(STAllowanceItemSearchResultsController *)self initalBundleIdentifiers];
    -[STAllowanceItemSearchResultsController setHasNewSelection:](self, "setHasNewSelection:", [v10 isSubsetOfOrderedSet:v15] ^ 1);
  }
  else
  {
    [(STAllowanceItemSearchResultsController *)self setHasNewSelection:1];
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(STAllowanceItemSearchResultsController *)self filteredAllowanceItemSpecifiers];
  uint64_t v7 = [v5 row];

  id v16 = [v6 objectAtIndexedSubscript:v7];

  id v8 = [v16 objectForKeyedSubscript:@"CategoryIdentifier"];
  double v9 = [(STAllowanceItemSearchResultsController *)self selectedWebDomains];
  double v10 = [(STAllowanceItemSearchResultsController *)self selectedBundleIdentifiers];
  int v11 = [v8 isEqualToString:*MEMORY[0x263F673F0]];
  double v12 = [v16 identifier];
  if (v11) {
    double v13 = v9;
  }
  else {
    double v13 = v10;
  }
  [v13 removeObject:v12];

  double v14 = [(STAllowanceItemSearchResultsController *)self initialWebDomains];
  if ([v9 isSubsetOfOrderedSet:v14])
  {
    uint64_t v15 = [(STAllowanceItemSearchResultsController *)self initalBundleIdentifiers];
    -[STAllowanceItemSearchResultsController setHasNewSelection:](self, "setHasNewSelection:", [v10 isSubsetOfOrderedSet:v15] ^ 1);
  }
  else
  {
    [(STAllowanceItemSearchResultsController *)self setHasNewSelection:1];
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v30 = v4;
  id v6 = [v4 searchBar];
  uint64_t v7 = [v6 text];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v29 = self;
  id v8 = [(STAllowanceItemSearchResultsController *)self allowanceItemSpecifiers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
    uint64_t v12 = *MEMORY[0x263F673F0];
    uint64_t v33 = *MEMORY[0x263F31860];
    uint64_t v32 = *MEMORY[0x263F31870];
    uint64_t v31 = *MEMORY[0x263F31868];
    do
    {
      uint64_t v13 = 0;
      uint64_t v34 = v10;
      do
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v8);
        }
        double v14 = *(void **)(*((void *)&v37 + 1) + 8 * v13);
        uint64_t v15 = [v14 name];
        int v16 = [v15 localizedCaseInsensitiveContainsString:v7];

        if (v16)
        {
          [v5 addObject:v14];
        }
        else
        {
          id v17 = [v14 objectForKeyedSubscript:@"CategoryIdentifier"];
          if ([v17 isEqualToString:v12])
          {
            +[STScreenTimeSettingsUIBundle bundle];
            double v18 = v7;
            uint64_t v19 = v11;
            v20 = v5;
            uint64_t v21 = v12;
            id v23 = v22 = v8;
            v24 = [v23 localizedStringForKey:@"MostUsedWebsites" value:&stru_26D9391A8 table:0];

            id v8 = v22;
            uint64_t v12 = v21;
            id v5 = v20;
            uint64_t v11 = v19;
            uint64_t v7 = v18;
            uint64_t v10 = v34;
          }
          else
          {
            if (([v17 isEqualToString:v33] & 1) != 0
              || ([v17 isEqualToString:v32] & 1) != 0
              || [v17 isEqualToString:v31])
            {
              uint64_t v25 = [MEMORY[0x263F318B8] shortLocalizedNameForIdentifier:v17];
            }
            else
            {
              uint64_t v25 = STCategoryNameWithIdentifier();
            }
            v24 = (void *)v25;
          }

          if ([v24 localizedCaseInsensitiveContainsString:v7]) {
            [v5 addObject:v14];
          }
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v26 = [v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
      uint64_t v10 = v26;
    }
    while (v26);
  }

  [(STAllowanceItemSearchResultsController *)v29 setFilteredAllowanceItemSpecifiers:v5];
  v27 = [(STAllowanceItemSearchResultsController *)v29 tableView];
  [v27 reloadData];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __81__STAllowanceItemSearchResultsController_updateSearchResultsForSearchController___block_invoke;
  v35[3] = &unk_264766F60;
  v35[4] = v29;
  id v36 = v27;
  id v28 = v27;
  [v5 enumerateObjectsUsingBlock:v35];
}

void __81__STAllowanceItemSearchResultsController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v15 = [v5 objectForKeyedSubscript:@"CategoryIdentifier"];
  int v6 = [v15 isEqualToString:*MEMORY[0x263F673F0]];
  uint64_t v7 = *(void **)(a1 + 32);
  if (!v6)
  {
    uint64_t v11 = [v7 selectedBundleIdentifiers];
    uint64_t v12 = [v5 identifier];

    int v13 = [v11 containsObject:v12];
    if (!v13) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v8 = [v7 selectedWebDomains];
  uint64_t v9 = [v5 identifier];

  char v10 = [v8 containsObject:v9];
  if (v10)
  {
LABEL_5:
    double v14 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:0];
    [*(id *)(a1 + 40) selectRowAtIndexPath:v14 animated:0 scrollPosition:0];
  }
LABEL_6:
}

- (NSMutableOrderedSet)selectedBundleIdentifiers
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setSelectedBundleIdentifiers:(id)a3
{
}

- (NSMutableOrderedSet)selectedWebDomains
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setSelectedWebDomains:(id)a3
{
}

- (BOOL)hasNewSelection
{
  return self->_hasNewSelection;
}

- (void)setHasNewSelection:(BOOL)a3
{
  self->_hasNewSelection = a3;
}

- (NSArray)allowanceItemSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setAllowanceItemSpecifiers:(id)a3
{
}

- (NSArray)filteredAllowanceItemSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setFilteredAllowanceItemSpecifiers:(id)a3
{
}

- (NSOrderedSet)initialWebDomains
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setInitialWebDomains:(id)a3
{
}

- (NSOrderedSet)initalBundleIdentifiers
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setInitalBundleIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initalBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_initialWebDomains, 0);
  objc_storeStrong((id *)&self->_filteredAllowanceItemSpecifiers, 0);
  objc_storeStrong((id *)&self->_allowanceItemSpecifiers, 0);
  objc_storeStrong((id *)&self->_selectedWebDomains, 0);

  objc_storeStrong((id *)&self->_selectedBundleIdentifiers, 0);
}

- (void)tableView:(uint64_t)a1 cellForRowAtIndexPath:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Web domain name must have at least one character for monogram: %@", (uint8_t *)&v1, 0xCu);
}

- (void)tableView:(uint64_t)a1 cellForRowAtIndexPath:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to extract high level domain for URL: %@. Creating initial for host instead: %@", (uint8_t *)&v2, 0x16u);
}

@end