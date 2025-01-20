@interface STShowMoreUsageGroupSpecifierProvider
- (NSArray)usageItems;
- (PSSpecifier)showMoreSpecifier;
- (PSSpecifier)summarySpecifier;
- (STShowMoreUsageGroupSpecifierProvider)init;
- (id)newSpecifierWithUsageItem:(id)a3;
- (unint64_t)numberOfItemsToShow;
- (unint64_t)totalNumberOfItemsToShow;
- (void)refreshUsageSpecifiersWithUpdates:(BOOL)a3;
- (void)setNumberOfItemsToShow:(unint64_t)a3;
- (void)setSummarySpecifier:(id)a3;
- (void)setTotalNumberOfItemsToShow:(unint64_t)a3;
- (void)setUsageItems:(id)a3;
- (void)showMoreItems:(id)a3;
- (void)updateSpecifier:(id)a3 usageItem:(id)a4;
@end

@implementation STShowMoreUsageGroupSpecifierProvider

- (STShowMoreUsageGroupSpecifierProvider)init
{
  v11.receiver = self;
  v11.super_class = (Class)STShowMoreUsageGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_numberOfItemsToShow = 5;
    v2->_totalNumberOfItemsToShow = 5;
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v5 = [v4 localizedStringForKey:@"ShowMoreButton" value:&stru_26D9391A8 table:0];

    uint64_t v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:v3 set:0 get:0 detail:0 cell:13 edit:0];
    showMoreSpecifier = v3->_showMoreSpecifier;
    v3->_showMoreSpecifier = (PSSpecifier *)v6;

    [(PSSpecifier *)v3->_showMoreSpecifier setButtonAction:sel_showMoreItems_];
    v8 = [MEMORY[0x263F67408] sharedCache];
    v9 = objc_msgSend(v8, "blankSpaceImageWithSize:", 29.0, 29.0);

    [(PSSpecifier *)v3->_showMoreSpecifier setObject:v9 forKeyedSubscript:*MEMORY[0x263F60140]];
  }
  return v3;
}

- (void)setSummarySpecifier:(id)a3
{
  v5 = (PSSpecifier *)a3;
  p_summarySpecifier = (id *)&self->_summarySpecifier;
  summarySpecifier = self->_summarySpecifier;
  if (summarySpecifier != v5)
  {
    v10 = v5;
    summarySpecifier = (PSSpecifier *)[(PSSpecifier *)summarySpecifier isEqualToSpecifier:v5];
    v5 = v10;
    if ((summarySpecifier & 1) == 0)
    {
      v8 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
      v9 = v8;
      if (*p_summarySpecifier)
      {
        if (v10) {
          [v8 setObject:v10 atIndexedSubscript:0];
        }
        else {
          objc_msgSend(v8, "removeObjectAtIndex:");
        }
      }
      else
      {
        [v8 insertObject:v10 atIndex:0];
      }
      objc_storeStrong(p_summarySpecifier, a3);

      v5 = v10;
    }
  }

  MEMORY[0x270F9A758](summarySpecifier, v5);
}

- (void)setUsageItems:(id)a3
{
  id v5 = a3;
  uint64_t usageItems = (uint64_t)self->_usageItems;
  if ((id)usageItems != v5)
  {
    id v7 = v5;
    uint64_t usageItems = [(id)usageItems isEqualToArray:v5];
    id v5 = v7;
    if ((usageItems & 1) == 0)
    {
      objc_storeStrong((id *)&self->_usageItems, a3);
      uint64_t usageItems = [(STShowMoreUsageGroupSpecifierProvider *)self refreshUsageSpecifiersWithUpdates:1];
      id v5 = v7;
    }
  }

  MEMORY[0x270F9A758](usageItems, v5);
}

- (void)setNumberOfItemsToShow:(unint64_t)a3
{
  self->_numberOfItemsToShow = a3;
  self->_totalNumberOfItemsToShow = a3;
}

- (void)refreshUsageSpecifiersWithUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(STShowMoreUsageGroupSpecifierProvider *)self usageItems];
  unint64_t v6 = [(STShowMoreUsageGroupSpecifierProvider *)self totalNumberOfItemsToShow];
  id v7 = [(STShowMoreUsageGroupSpecifierProvider *)self summarySpecifier];

  v8 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
  unint64_t v9 = [v8 count];
  v10 = objc_opt_new();
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  if (v3) {
    [(STGroupSpecifierProvider *)self beginUpdates];
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__STShowMoreUsageGroupSpecifierProvider_refreshUsageSpecifiersWithUpdates___block_invoke;
  v17[3] = &unk_264768528;
  v21 = &v25;
  unint64_t v22 = v6;
  BOOL v24 = v7 != 0;
  unint64_t v23 = v9;
  id v11 = v8;
  id v18 = v11;
  v19 = self;
  id v12 = v10;
  id v20 = v12;
  [v5 enumerateObjectsUsingBlock:v17];
  unint64_t v13 = [v5 count];
  if (v6 >= v13) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = v6;
  }
  if (v7) {
    unint64_t v15 = v14 + 1;
  }
  else {
    unint64_t v15 = v14;
  }
  if (v9 <= v15)
  {
    v16 = [(STShowMoreUsageGroupSpecifierProvider *)self showMoreSpecifier];
    if (*((unsigned char *)v26 + 24) && ([v11 containsObject:v16] & 1) == 0) {
      [v12 addObject:v16];
    }
    if ([v12 count]) {
      [v11 addObjectsFromArray:v12];
    }
  }
  else
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", v15, v9 - v15);
    [v11 removeObjectsAtIndexes:v16];
  }

  if (v3) {
    [(STGroupSpecifierProvider *)self endUpdates];
  }

  _Block_object_dispose(&v25, 8);
}

uint64_t __75__STShowMoreUsageGroupSpecifierProvider_refreshUsageSpecifiersWithUpdates___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 64) - 1 == a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    unint64_t v8 = *(unsigned __int8 *)(a1 + 80) + a3;
    id v14 = v7;
    if (v8 >= *(void *)(a1 + 72))
    {
      unint64_t v9 = (void *)[*(id *)(a1 + 40) newSpecifierWithUsageItem:v7];
      [*(id *)(a1 + 48) addObject:v9];
    }
    else
    {
      unint64_t v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v8];
      uint64_t v10 = [v9 cellType];
      id v11 = *(void **)(a1 + 40);
      if (v10 == 13)
      {
        uint64_t v12 = [v11 newSpecifierWithUsageItem:v14];

        [*(id *)(a1 + 32) setObject:v12 atIndexedSubscript:v8];
        unint64_t v9 = (void *)v12;
      }
      else
      {
        [v11 updateSpecifier:v9 usageItem:v14];
        [*(id *)(a1 + 40) reloadSpecifier:v9 animated:1];
      }
    }
  }

  return MEMORY[0x270F9A790]();
}

- (id)newSpecifierWithUsageItem:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"STShowMoreUsageGroupSpecifierProvider.m" lineNumber:142 description:@"Subclasses must override."];

  return (id)objc_opt_new();
}

- (void)updateSpecifier:(id)a3 usageItem:(id)a4
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"STShowMoreUsageGroupSpecifierProvider.m" lineNumber:147 description:@"Subclasses must override."];
}

- (void)showMoreItems:(id)a3
{
  [(STShowMoreUsageGroupSpecifierProvider *)self setTotalNumberOfItemsToShow:[(STShowMoreUsageGroupSpecifierProvider *)self totalNumberOfItemsToShow]+ [(STShowMoreUsageGroupSpecifierProvider *)self numberOfItemsToShow]];

  [(STShowMoreUsageGroupSpecifierProvider *)self refreshUsageSpecifiersWithUpdates:1];
}

- (PSSpecifier)summarySpecifier
{
  return self->_summarySpecifier;
}

- (NSArray)usageItems
{
  return self->_usageItems;
}

- (unint64_t)numberOfItemsToShow
{
  return self->_numberOfItemsToShow;
}

- (PSSpecifier)showMoreSpecifier
{
  return self->_showMoreSpecifier;
}

- (unint64_t)totalNumberOfItemsToShow
{
  return self->_totalNumberOfItemsToShow;
}

- (void)setTotalNumberOfItemsToShow:(unint64_t)a3
{
  self->_totalNumberOfItemsToShow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showMoreSpecifier, 0);
  objc_storeStrong((id *)&self->_usageItems, 0);

  objc_storeStrong((id *)&self->_summarySpecifier, 0);
}

@end