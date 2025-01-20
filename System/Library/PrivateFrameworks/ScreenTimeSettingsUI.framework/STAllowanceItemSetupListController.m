@interface STAllowanceItemSetupListController
- (BOOL)allAppsAndCategoriesSelected;
- (BOOL)canBeShownFromSuspendedState;
- (NSArray)categorySpecifiers;
- (NSMutableDictionary)applicationAndWebDomainSpecifiersByCategoryIdentifier;
- (NSMutableOrderedSet)selectedBundleIdentifiers;
- (NSMutableOrderedSet)selectedCategoryIdentifiers;
- (NSMutableOrderedSet)selectedWebDomains;
- (STAllowanceItemSearchResultsController)searchResultsController;
- (STAllowanceItemSetupListController)init;
- (id)_applicationSpecifierForBundleIdentifier:(id)a3 categoryIdentifier:(id)a4;
- (id)_categoryDetailText:(id)a3;
- (id)_categorySpecifierForIdentifier:(id)a3;
- (id)_webDomainSpecifierForDomain:(id)a3 usageItem:(id)a4;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableViewStyle;
- (void)_addCustomWebDomain:(id)a3 specifier:(id)a4;
- (void)_addWebsiteButtonPressed:(id)a3;
- (void)_cleanUpRetainCycles;
- (void)_didPressCancelButton:(id)a3;
- (void)_didPressDoneButton:(id)a3;
- (void)_hasSelectionDidChangeFrom:(BOOL)a3 to:(BOOL)a4;
- (void)_selectCellsForSelectedIdentifiers:(id)a3;
- (void)_showNewCategoriesCompatibilityAlertIfNeeded;
- (void)_updateApplicationSpecifiersWithBundleIdentifier:(id)a3 categoryIdentifier:(id)a4 shouldInsertSpecifier:(BOOL)a5;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAllAppsAndCategoriesSelected:(BOOL)a3;
- (void)setCategorySpecifiers:(id)a3;
- (void)setSearchResultsController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
- (void)willResignActive;
@end

@implementation STAllowanceItemSetupListController

- (STAllowanceItemSetupListController)init
{
  v12.receiver = self;
  v12.super_class = (Class)STAllowanceItemSetupListController;
  v2 = [(STAllowanceItemSetupListController *)&v12 init];
  uint64_t v3 = objc_opt_new();
  selectedBundleIdentifiers = v2->_selectedBundleIdentifiers;
  v2->_selectedBundleIdentifiers = (NSMutableOrderedSet *)v3;

  uint64_t v5 = objc_opt_new();
  selectedWebDomains = v2->_selectedWebDomains;
  v2->_selectedWebDomains = (NSMutableOrderedSet *)v5;

  uint64_t v7 = objc_opt_new();
  selectedCategoryIdentifiers = v2->_selectedCategoryIdentifiers;
  v2->_selectedCategoryIdentifiers = (NSMutableOrderedSet *)v7;

  uint64_t v9 = objc_opt_new();
  applicationAndWebDomainSpecifiersByCategoryIdentifier = v2->_applicationAndWebDomainSpecifiersByCategoryIdentifier;
  v2->_applicationAndWebDomainSpecifiersByCategoryIdentifier = (NSMutableDictionary *)v9;

  return v2;
}

- (void)dealloc
{
  [(STAllowanceItemSearchResultsController *)self->_searchResultsController removeObserver:self forKeyPath:@"hasNewSelection" context:@"KVOContextAllowanceItemSetupListController"];
  v3.receiver = self;
  v3.super_class = (Class)STAllowanceItemSetupListController;
  [(STAllowanceItemSetupListController *)&v3 dealloc];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)STAllowanceItemSetupListController;
  [(STAllowanceItemSetupListController *)&v20 viewDidLoad];
  objc_super v3 = +[STScreenTimeSettingsUIBundle bundle];
  v4 = [v3 localizedStringForKey:@"AllowanceChooseAppsTitle" value:&stru_26D9391A8 table:0];
  [(STAllowanceItemSetupListController *)self setTitle:v4];

  uint64_t v5 = [(STAllowanceItemSetupListController *)self navigationItem];
  v6 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__didPressCancelButton_];
  [v5 setLeftBarButtonItem:v6];

  uint64_t v7 = [(STAllowanceItemSetupListController *)self specifier];
  v8 = [v7 objectForKeyedSubscript:@"RightBarButtonTitle"];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v8 style:2 target:self action:sel__didPressDoneButton_];
  v10 = [(STAllowanceItemSetupListController *)self selectedBundleIdentifiers];
  if ([v10 count])
  {
    [v9 setEnabled:1];
  }
  else
  {
    v11 = [(STAllowanceItemSetupListController *)self selectedWebDomains];
    if ([v11 count])
    {
      [v9 setEnabled:1];
    }
    else
    {
      objc_super v12 = [(STAllowanceItemSetupListController *)self selectedCategoryIdentifiers];
      objc_msgSend(v9, "setEnabled:", objc_msgSend(v12, "count") != 0);
    }
  }

  [v5 setRightBarButtonItem:v9];
  v13 = [MEMORY[0x263F82C28] storyboardWithName:@"AllowanceItemSearch" bundle:v3];
  v14 = [v13 instantiateInitialViewController];
  v15 = [(STAllowanceItemSetupListController *)self selectedBundleIdentifiers];
  [v14 setSelectedBundleIdentifiers:v15];

  v16 = [(STAllowanceItemSetupListController *)self selectedWebDomains];
  [v14 setSelectedWebDomains:v16];

  [v14 addObserver:self forKeyPath:@"hasNewSelection" options:3 context:@"KVOContextAllowanceItemSetupListController"];
  [(STAllowanceItemSetupListController *)self setSearchResultsController:v14];
  v17 = (void *)[objc_alloc(MEMORY[0x263F82BA0]) initWithSearchResultsController:v14];
  [v17 setSearchResultsUpdater:v14];
  [v17 setDelegate:self];
  [v5 setSearchController:v17];
  v18 = [(STAllowanceItemSetupListController *)self table];
  [v18 setEditing:1];
  [v18 setAllowsMultipleSelectionDuringEditing:1];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceItemSetupListController.viewDidLoad", v19, 2u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)STAllowanceItemSetupListController;
  [(STAllowanceItemSetupListController *)&v24 viewWillAppear:a3];
  [(STAllowanceItemSetupListController *)self performSelector:sel__selectCellsForSelectedIdentifiers_ withObject:0 afterDelay:0.0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(STAllowanceItemSetupListController *)self categorySpecifiers];
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v8 = [v7 identifier];
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __53__STAllowanceItemSetupListController_viewWillAppear___block_invoke;
        aBlock[3] = &unk_264766FB0;
        aBlock[4] = self;
        id v9 = v8;
        id v19 = v9;
        v10 = _Block_copy(aBlock);
        [v7 setProperty:v10 forKey:0x26D941008];

        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __53__STAllowanceItemSetupListController_viewWillAppear___block_invoke_2;
        v16[3] = &unk_264766FD8;
        v16[4] = self;
        id v17 = v9;
        id v11 = v9;
        objc_super v12 = _Block_copy(v16);
        [v7 setProperty:v12 forKey:0x26D941028];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceItemSetupListController.viewWillAppear", buf, 2u);
  }
}

void __53__STAllowanceItemSetupListController_viewWillAppear___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v6 = [*(id *)(a1 + 32) view];
  [v6 endEditing:0];

  if (a2)
  {
    if (a2 != 1) {
      return;
    }
    uint64_t v7 = [*(id *)(a1 + 32) applicationAndWebDomainSpecifiersByCategoryIdentifier];
    v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) insertContiguousSpecifiers:v8 afterSpecifierID:*(void *)(a1 + 40) animated:1];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (!v9) {
      goto LABEL_16;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    uint64_t v23 = *MEMORY[0x263F600A8];
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "indexPathForSpecifier:", v13, v23);
        v15 = [v13 identifier];
        v16 = *(void **)(a1 + 32);
        if (a3)
        {
          id v17 = [v16 table];
          [v17 selectRowAtIndexPath:v14 animated:0 scrollPosition:0];

          [v13 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v23];
          [*(id *)(a1 + 32) reloadSpecifier:v13 animated:0];
          goto LABEL_14;
        }
        v18 = [v16 selectedBundleIdentifiers];
        if ([v18 containsObject:v15])
        {
        }
        else
        {
          id v19 = [*(id *)(a1 + 32) selectedWebDomains];
          int v20 = [v19 containsObject:v15];

          if (!v20) {
            goto LABEL_14;
          }
        }
        long long v21 = [*(id *)(a1 + 32) table];
        [v21 selectRowAtIndexPath:v14 animated:0 scrollPosition:0];

LABEL_14:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v10)
      {
LABEL_16:

        return;
      }
    }
  }
  long long v22 = [*(id *)(a1 + 32) applicationAndWebDomainSpecifiersByCategoryIdentifier];
  id obja = [v22 objectForKeyedSubscript:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) removeContiguousSpecifiers:obja animated:1];
}

void __53__STAllowanceItemSetupListController_viewWillAppear___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(a1 + 32) view];
  [v4 endEditing:0];

  uint64_t v5 = [*(id *)(a1 + 32) table];
  long long v29 = [*(id *)(a1 + 32) specifierForID:*(void *)(a1 + 40)];
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "indexPathForSpecifier:");
  uint64_t v7 = [*(id *)(a1 + 32) selectedCategoryIdentifiers];
  int v8 = [*(id *)(a1 + 40) isEqualToString:*MEMORY[0x263F673F0]];
  int v9 = v8;
  v32 = v5;
  long long v27 = v7;
  long long v28 = (void *)v6;
  if (a2)
  {
    if ((v8 & 1) == 0)
    {
      [v7 addObject:*(void *)(a1 + 40)];
      [v5 selectRowAtIndexPath:v6 animated:0 scrollPosition:0];
    }
    uint64_t v10 = MEMORY[0x263EFFA80];
  }
  else
  {
    [v7 removeObject:*(void *)(a1 + 40)];
    [v5 deselectRowAtIndexPath:v6 animated:0];
    uint64_t v10 = MEMORY[0x263EFFA88];
  }
  v30 = [*(id *)(a1 + 32) selectedBundleIdentifiers];
  uint64_t v31 = [*(id *)(a1 + 32) selectedWebDomains];
  uint64_t v11 = [*(id *)(a1 + 32) applicationAndWebDomainSpecifiersByCategoryIdentifier];
  objc_super v12 = [v11 objectForKeyedSubscript:*(void *)(a1 + 40)];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    uint64_t v16 = *MEMORY[0x263F600A8];
    if (v9) {
      id v17 = v31;
    }
    else {
      id v17 = v30;
    }
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (a2)
        {
          int v20 = [*(id *)(*((void *)&v34 + 1) + 8 * i) identifier];
          [v17 removeObject:v20];
        }
        [v19 setObject:v10 forKeyedSubscript:v16];
        if ([v19 cellType] == 3
          && [*(id *)(a1 + 32) containsSpecifier:v19])
        {
          long long v21 = [*(id *)(a1 + 32) indexPathForSpecifier:v19];
          if (a2) {
            [v32 selectRowAtIndexPath:v21 animated:0 scrollPosition:0];
          }
          else {
            [v32 deselectRowAtIndexPath:v21 animated:0];
          }
          [*(id *)(a1 + 32) reloadSpecifier:v19 animated:1];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v14);
  }

  if ([v30 count])
  {
    BOOL v22 = 1;
    uint64_t v23 = v32;
    objc_super v24 = v27;
  }
  else
  {
    objc_super v24 = v27;
    if ([v31 count]) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = [v27 count] != 0;
    }
    uint64_t v23 = v32;
  }
  v25 = [*(id *)(a1 + 32) navigationItem];
  long long v26 = [v25 rightBarButtonItem];
  [v26 setEnabled:v22];

  if (a2
    && ([*(id *)(a1 + 32) allAppsAndCategoriesSelected] & 1) == 0
    && (([*(id *)(a1 + 40) isEqualToString:*MEMORY[0x263F31880]] & 1) != 0
     || ([*(id *)(a1 + 40) isEqualToString:*MEMORY[0x263F31850]] & 1) != 0
     || [*(id *)(a1 + 40) isEqualToString:*MEMORY[0x263F31878]]))
  {
    [*(id *)(a1 + 32) _showNewCategoriesCompatibilityAlertIfNeeded];
  }
}

- (void)_showNewCategoriesCompatibilityAlertIfNeeded
{
  objc_super v3 = [(STAllowanceItemSetupListController *)self specifier];
  uint64_t v4 = [v3 objectForKeyedSubscript:0x26D940528];

  uint64_t v5 = [v4 viewModel];
  uint64_t v6 = [v5 me];
  if ([v5 shouldShowCompatibilityAlerts])
  {
    uint64_t v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v8 = [v7 objectForKey:@"HasShownNewCategoriesCompatibilityAlertByDSID"];

    int v9 = [v6 dsid];
    uint64_t v10 = [v9 stringValue];
    uint64_t v11 = [v8 objectForKeyedSubscript:v10];
    char v12 = [v11 BOOLValue];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = +[STScreenTimeSettingsUIBundle bundle];
      if ([v6 isRemoteUser])
      {
        uint64_t v14 = [v6 givenName];
        if (v14)
        {
          objc_super v24 = [v13 localizedStringForKey:@"UpdateChildDevicesAlertTitleFormat" value:&stru_26D9391A8 table:0];
          uint64_t v15 = [MEMORY[0x263EFF960] currentLocale];
          uint64_t v16 = objc_msgSend([NSString alloc], "initWithFormat:locale:", v24, v15, v14);
          id v17 = [v13 localizedStringForKey:@"AppLimitChildCompatibilityAlertMessageFormat" value:&stru_26D9391A8 table:0];
          v18 = objc_msgSend([NSString alloc], "initWithFormat:locale:", v17, v15, v14);

LABEL_9:
          long long v21 = [MEMORY[0x263F82418] alertControllerWithTitle:v16 message:v18 preferredStyle:1];
          BOOL v22 = [v13 localizedStringForKey:@"ConfirmationButtonOK" value:&stru_26D9391A8 table:0];
          uint64_t v23 = [MEMORY[0x263F82400] actionWithTitle:v22 style:0 handler:0];
          [v21 addAction:v23];
          [v21 setPreferredAction:v23];
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __82__STAllowanceItemSetupListController__showNewCategoriesCompatibilityAlertIfNeeded__block_invoke;
          v25[3] = &unk_264766F30;
          id v26 = v6;
          [(STAllowanceItemSetupListController *)self presentViewController:v21 animated:1 completion:v25];

          goto LABEL_10;
        }
        uint64_t v16 = [v13 localizedStringForKey:@"UpdateChildDevicesAlertTitle" value:&stru_26D9391A8 table:0];
        int v20 = @"AppLimitChildCompatibilityAlertMessage";
        id v19 = v13;
      }
      else
      {
        uint64_t v16 = [v13 localizedStringForKey:@"UpdateOtherDevicesAlertTitle" value:&stru_26D9391A8 table:0];
        uint64_t v14 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"AppLimitCompatibilityAlertMessage"];
        id v19 = v13;
        int v20 = v14;
      }
      v18 = [v19 localizedStringForKey:v20 value:&stru_26D9391A8 table:0];
      goto LABEL_9;
    }
  }
LABEL_10:
}

void __82__STAllowanceItemSetupListController__showNewCategoriesCompatibilityAlertIfNeeded__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  objc_super v3 = [v2 objectForKey:@"HasShownNewCategoriesCompatibilityAlertByDSID"];
  uint64_t v4 = [*(id *)(a1 + 32) dsid];
  uint64_t v5 = [v4 stringValue];

  if (v3)
  {
    uint64_t v6 = (void *)[v3 mutableCopy];
    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v5];
  }
  else
  {
    uint64_t v7 = v5;
    v8[0] = MEMORY[0x263EFFA88];
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  [v2 setObject:v6 forKey:@"HasShownNewCategoriesCompatibilityAlertByDSID"];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STAllowanceItemSetupListController;
  [(STAllowanceItemSetupListController *)&v6 viewWillDisappear:a3];
  uint64_t v4 = [(STAllowanceItemSetupListController *)self view];
  [v4 endEditing:0];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceItemSetupListController.viewWillDisappear", v5, 2u);
  }
}

- (void)willResignActive
{
  v4.receiver = self;
  v4.super_class = (Class)STAllowanceItemSetupListController;
  [(STAllowanceItemSetupListController *)&v4 willResignActive];
  objc_super v3 = [(STAllowanceItemSetupListController *)self view];
  [v3 endEditing:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == @"KVOContextAllowanceItemSetupListController")
  {
    id v12 = a3;
    [(STAllowanceItemSetupListController *)self searchResultsController];

    int v13 = [v12 isEqualToString:@"hasNewSelection"];
    if (v13)
    {
      uint64_t v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      uint64_t v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        uint64_t v14 = 0;
      }
      uint64_t v16 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      id v17 = [MEMORY[0x263EFF9D0] null];

      if (v16 == v17)
      {

        uint64_t v16 = 0;
      }
      -[STAllowanceItemSetupListController _hasSelectionDidChangeFrom:to:](self, "_hasSelectionDidChangeFrom:to:", [v14 BOOLValue], objc_msgSend(v16, "BOOLValue"));
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)STAllowanceItemSetupListController;
    id v11 = a3;
    [(STAllowanceItemSetupListController *)&v18 observeValueForKeyPath:v11 ofObject:a4 change:v10 context:a6];
  }
}

- (void)_hasSelectionDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a3 != a4)
  {
    BOOL v5 = a4;
    uint64_t v7 = +[STScreenTimeSettingsUIBundle bundle];
    int v8 = v7;
    if (v5) {
      int v9 = @"AllowanceAddBarButtonItemTitle";
    }
    else {
      int v9 = @"AllowanceCancelBarButtonItemTitle";
    }
    id v14 = [v7 localizedStringForKey:v9 value:&stru_26D9391A8 table:0];

    id v10 = [(STAllowanceItemSetupListController *)self navigationItem];
    id v11 = [v10 searchController];
    id v12 = [v11 searchBar];
    int v13 = [v12 cancelButton];
    [v13 setTitle:v14 forState:0];
  }
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)STAllowanceItemSetupListController;
  [(STAllowanceItemSetupListController *)&v16 setSpecifier:v4];
  BOOL v5 = [v4 objectForKeyedSubscript:@"InitialSelectedBundleIdentifiers"];
  if (v5)
  {
    objc_super v6 = [(STAllowanceItemSetupListController *)self selectedBundleIdentifiers];
    [v6 addObjectsFromArray:v5];
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"InitialSelectedWebDomains"];
  if (v7)
  {
    int v8 = [(STAllowanceItemSetupListController *)self selectedWebDomains];
    [v8 addObjectsFromArray:v7];
  }
  int v9 = [v4 objectForKeyedSubscript:@"InitialSelectedCategoryIdentifiers"];
  if (v9)
  {
    id v10 = [(STAllowanceItemSetupListController *)self selectedCategoryIdentifiers];
    [v10 addObjectsFromArray:v9];
    id v11 = objc_alloc(MEMORY[0x263EFF9C0]);
    id v12 = [MEMORY[0x263F318B0] sharedCategories];
    int v13 = [v12 availableCategoryIDs];
    id v14 = (void *)[v11 initWithArray:v13];

    [v14 removeObject:*MEMORY[0x263F31870]];
    [v14 removeObject:*MEMORY[0x263F31860]];
    [v14 removeObject:*MEMORY[0x263F31868]];
    uint64_t v15 = [v10 set];
    -[STAllowanceItemSetupListController setAllAppsAndCategoriesSelected:](self, "setAllAppsAndCategoriesSelected:", [v14 isEqualToSet:v15]);
  }
}

- (id)specifiers
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v76 = (int)*MEMORY[0x263F5FDB8];
    v77 = [(STAllowanceItemSetupListController *)self applicationAndWebDomainSpecifiersByCategoryIdentifier];
    [v77 removeAllObjects];
    id v4 = objc_opt_new();
    v75 = [(STAllowanceItemSetupListController *)self specifier];
    BOOL v5 = [v75 objectForKeyedSubscript:0x26D940528];
    objc_super v6 = [v5 usageDetailsCoordinator];
    uint64_t v7 = [v6 viewModel];
    int v8 = [v7 selectedWeekUsageReport];

    [v8 topUsageItemsWithMaxCount:100 type:2 includeAggregateItem:0 nonAggregateItems:0 darkColors:0];
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v98;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v98 != v11) {
            objc_enumerationMutation(obj);
          }
          int v13 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          id v14 = [v13 budgetItemIdentifier];
          [v4 addObject:v14];
          uint64_t v15 = [v13 categoryIdentifier];
          if (v15) {
            [(STAllowanceItemSetupListController *)self _updateApplicationSpecifiersWithBundleIdentifier:v14 categoryIdentifier:v15 shouldInsertSpecifier:0];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
      }
      while (v10);
    }
    v74 = v5;
    objc_super v16 = [v5 viewModel];
    id v17 = [v16 installedBundleIDsByCategoryIdentifier];
    objc_super v18 = (void *)[v17 mutableCopy];

    [v18 removeObjectForKey:*MEMORY[0x263F31868]];
    [v18 removeObjectForKey:*MEMORY[0x263F31860]];
    [v18 removeObjectForKey:*MEMORY[0x263F31870]];
    v94[0] = MEMORY[0x263EF8330];
    v94[1] = 3221225472;
    v94[2] = __48__STAllowanceItemSetupListController_specifiers__block_invoke;
    v94[3] = &unk_264767000;
    id v19 = v4;
    id v95 = v19;
    v96 = self;
    v72 = v18;
    [v18 enumerateKeysAndObjectsUsingBlock:v94];
    int v20 = [(STAllowanceItemSetupListController *)self selectedBundleIdentifiers];
    v92[0] = MEMORY[0x263EF8330];
    v92[1] = 3221225472;
    v92[2] = __48__STAllowanceItemSetupListController_specifiers__block_invoke_2;
    v92[3] = &unk_264767028;
    id v71 = v19;
    id v93 = v71;
    long long v21 = [v20 indexesOfObjectsPassingTest:v92];
    if ([v21 count])
    {
      BOOL v22 = [v20 objectsAtIndexes:v21];
      uint64_t v23 = [MEMORY[0x263F318B0] sharedCategories];
      v91[0] = MEMORY[0x263EF8330];
      v91[1] = 3221225472;
      v91[2] = __48__STAllowanceItemSetupListController_specifiers__block_invoke_3;
      v91[3] = &unk_2647670A0;
      v91[4] = self;
      [v23 categoriesForBundleIDs:v22 completionHandler:v91];
    }
    v69 = v21;
    v70 = v20;
    v73 = v8;
    objc_super v24 = [v8 topUsageItemsWithMaxCount:100 type:4 includeAggregateItem:0 nonAggregateItems:0 darkColors:0];
    v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v24, "count"));
    id v26 = objc_opt_new();
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v27 = v24;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v87 objects:v103 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v88 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v87 + 1) + 8 * j);
          v33 = [v32 budgetItemIdentifier];
          [v26 addObject:v33];
          long long v34 = [(STAllowanceItemSetupListController *)self _webDomainSpecifierForDomain:v33 usageItem:v32];
          [v25 addObject:v34];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v87 objects:v103 count:16];
      }
      while (v29);
    }

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v35 = [(STAllowanceItemSetupListController *)self selectedWebDomains];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v83 objects:v102 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v84;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v84 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v83 + 1) + 8 * k);
          if (([v26 containsObject:v40] & 1) == 0)
          {
            v41 = [(STAllowanceItemSetupListController *)self _webDomainSpecifierForDomain:v40 usageItem:0];
            [v25 addObject:v41];
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v83 objects:v102 count:16];
      }
      while (v37);
    }
    v68 = v27;

    v42 = +[STScreenTimeSettingsUIBundle bundle];
    v66 = [v42 localizedStringForKey:@"AddWebsiteButtonTitle" value:&stru_26D9391A8 table:0];
    v43 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    [v43 setButtonAction:sel__addWebsiteButtonPressed_];
    uint64_t v44 = *MEMORY[0x263F673F0];
    [v43 setObject:*MEMORY[0x263F673F0] forKeyedSubscript:0x26D939488];
    v45 = [MEMORY[0x263F67408] sharedCache];
    uint64_t v46 = objc_msgSend(v45, "blankSpaceImageWithSize:", 29.0, 29.0);

    v64 = (void *)v46;
    [v43 setObject:v46 forKeyedSubscript:*MEMORY[0x263F60140]];
    v65 = v43;
    [v25 addObject:v43];
    uint64_t v63 = v44;
    [v77 setObject:v25 forKeyedSubscript:v44];
    v62 = [v42 localizedStringForKey:@"AppsCategoriesWebsitesGroupSpecifierName" value:&stru_26D9391A8 table:0];
    v47 = objc_msgSend(MEMORY[0x263F5FC40], "groupSpecifierWithName:");
    v67 = v42;
    v60 = [v42 localizedStringForKey:@"AppsCategoriesWebsitesGroupFooter" value:&stru_26D9391A8 table:0];
    objc_msgSend(v47, "setObject:forKeyedSubscript:");
    v59 = [(STAllowanceItemSetupListController *)self _categorySpecifierForIdentifier:*MEMORY[0x263F673D8]];
    v61 = v47;
    v48 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v47, v59, 0);
    v49 = objc_opt_new();
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v50 = STSortedCategoriesForUsageLimits();
    uint64_t v51 = [v50 countByEnumeratingWithState:&v79 objects:v101 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v80;
      do
      {
        for (uint64_t m = 0; m != v52; ++m)
        {
          if (*(void *)v80 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = [(STAllowanceItemSetupListController *)self _categorySpecifierForIdentifier:*(void *)(*((void *)&v79 + 1) + 8 * m)];
          [v48 addObject:v55];
          [v49 addObject:v55];
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v79 objects:v101 count:16];
      }
      while (v52);
    }

    v56 = [(STAllowanceItemSetupListController *)self _categorySpecifierForIdentifier:v63];
    [v48 addObject:v56];
    [v49 addObject:v56];
    [(STAllowanceItemSetupListController *)self setCategorySpecifiers:v49];
    v57 = *(Class *)((char *)&self->super.super.super.super.super.isa + v76);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v76) = (Class)v48;

    objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v76);
  }

  return v3;
}

void __48__STAllowanceItemSetupListController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (([*(id *)(a1 + 32) containsObject:v11] & 1) == 0)
        {
          [*(id *)(a1 + 40) _updateApplicationSpecifiersWithBundleIdentifier:v11 categoryIdentifier:v5 shouldInsertSpecifier:0];
          [*(id *)(a1 + 32) addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

uint64_t __48__STAllowanceItemSetupListController_specifiers__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __48__STAllowanceItemSetupListController_specifiers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [MEMORY[0x263F08A48] mainQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __48__STAllowanceItemSetupListController_specifiers__block_invoke_4;
    v17[3] = &unk_264767078;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 32);
    id v18 = v8;
    uint64_t v19 = v9;
    [v7 addOperationWithBlock:v17];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __48__STAllowanceItemSetupListController_specifiers__block_invoke_3_cold_1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
  }
}

uint64_t __48__STAllowanceItemSetupListController_specifiers__block_invoke_4(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__STAllowanceItemSetupListController_specifiers__block_invoke_5;
  v3[3] = &unk_264767050;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __48__STAllowanceItemSetupListController_specifiers__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 identifier];
  [v4 _updateApplicationSpecifiersWithBundleIdentifier:v5 categoryIdentifier:v6 shouldInsertSpecifier:1];
}

- (void)_updateApplicationSpecifiersWithBundleIdentifier:(id)a3 categoryIdentifier:(id)a4 shouldInsertSpecifier:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a4;
  id v8 = [(STAllowanceItemSetupListController *)self _applicationSpecifierForBundleIdentifier:a3 categoryIdentifier:v15];
  uint64_t v9 = [(STAllowanceItemSetupListController *)self applicationAndWebDomainSpecifiersByCategoryIdentifier];
  uint64_t v10 = [v9 objectForKeyedSubscript:v15];
  if (v10)
  {
    uint64_t v11 = v10;
    [v10 addObject:v8];
    if (!v5) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v8, 0);
    [v9 setObject:v11 forKeyedSubscript:v15];
    if (!v5) {
      goto LABEL_13;
    }
  }
  uint64_t v12 = [v11 count];
  if (v12 == 1)
  {
    uint64_t v13 = [(STAllowanceItemSetupListController *)self specifierForID:v15];
    uint64_t v14 = [v13 objectForKeyedSubscript:0x26D941068];
    if ([v14 integerValue] == 1) {
      [(STAllowanceItemSetupListController *)self insertSpecifier:v8 afterSpecifier:v13 animated:1];
    }
    [(STAllowanceItemSetupListController *)self reloadSpecifier:v13 animated:1];
  }
  else
  {
    uint64_t v13 = [v11 objectAtIndexedSubscript:v12 - 2];
    if ([(STAllowanceItemSetupListController *)self containsSpecifier:v13]) {
      [(STAllowanceItemSetupListController *)self insertSpecifier:v8 afterSpecifier:v13 animated:1];
    }
    [(STAllowanceItemSetupListController *)self reloadSpecifierID:v15 animated:1];
  }

LABEL_13:
}

- (id)_applicationSpecifierForBundleIdentifier:(id)a3 categoryIdentifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x263F670A8];
  id v8 = a4;
  uint64_t v9 = [v7 sharedCache];
  uint64_t v10 = [v9 appInfoForBundleIdentifier:v6];

  uint64_t v11 = [v10 displayName];
  uint64_t v12 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];
  [v12 setIdentifier:v6];
  [v12 setObject:v8 forKeyedSubscript:0x26D939488];

  if ([v10 source] == 2 && (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x263F672F0]) & 1) == 0)
  {
    [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
    uint64_t v13 = (__CFString **)MEMORY[0x263F60188];
  }
  else
  {
    [v12 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    uint64_t v13 = &STAppBundleIDKey;
  }
  [v12 setObject:v6 forKeyedSubscript:*v13];

  return v12;
}

- (id)_categorySpecifierForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[STScreenTimeSettingsUIBundle bundle];
  if ([v4 isEqualToString:*MEMORY[0x263F673D8]])
  {
    id v6 = [v5 localizedStringForKey:@"AllAppsAndCategoriesSpecifierName" value:&stru_26D9391A8 table:0];
    uint64_t v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:3 edit:0];
  }
  else
  {
    if ([v4 isEqualToString:*MEMORY[0x263F673F0]])
    {
      id v6 = [v5 localizedStringForKey:@"MostUsedWebsites" value:&stru_26D9391A8 table:0];
      uint64_t v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:self set:0 get:sel__categoryDetailText_ detail:0 cell:3 edit:0];
      [v7 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
      uint64_t v8 = 0x26D941048;
      uint64_t v9 = MEMORY[0x263EFFA88];
    }
    else
    {
      id v6 = STCategoryNameWithIdentifier();
      uint64_t v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:self set:0 get:sel__categoryDetailText_ detail:0 cell:3 edit:0];
      uint64_t v9 = objc_opt_class();
      uint64_t v8 = *MEMORY[0x263F5FFE0];
    }
    [v7 setObject:v9 forKeyedSubscript:v8];
    if ([(STAllowanceItemSetupListController *)self allAppsAndCategoriesSelected]) {
      [v7 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
    }
  }
  [v7 setIdentifier:v4];
  uint64_t v10 = [MEMORY[0x263F67408] sharedCache];
  uint64_t v11 = [v10 imageForCategoryIdentifier:v4];
  [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x263F60140]];

  return v7;
}

- (id)_webDomainSpecifierForDomain:(id)a3 usageItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x263F5FC40];
  uint64_t v9 = objc_msgSend(v6, "_lp_userVisibleHost");
  uint64_t v10 = [v8 preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v10 setIdentifier:v6];
  [v10 setObject:*MEMORY[0x263F673F0] forKeyedSubscript:0x26D939488];
  uint64_t v11 = [MEMORY[0x263F82DA0] currentTraitCollection];
  uint64_t v12 = [v11 userInterfaceStyle];

  id v13 = v6;
  if ([v13 length])
  {
    uint64_t v35 = v12;
    uint64_t v14 = objc_opt_new();
    [v14 setScheme:@"https"];
    [v14 setHost:v13];
    id v15 = [v14 URL];
    uint64_t v16 = objc_msgSend(v15, "_lp_highLevelDomain");
    uint64_t v17 = [v14 host];
    id v18 = [v14 URL];
    id v19 = v16;
    id v20 = v17;
    id v21 = v18;
    if ([v19 length])
    {
      BOOL v22 = [v19 substringToIndex:1];
      uint64_t v23 = [v22 uppercaseString];
    }
    else
    {
      uint64_t v31 = [v20 substringToIndex:1];
      uint64_t v23 = [v31 uppercaseString];

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[STAllowanceItemSetupListController _webDomainSpecifierForDomain:usageItem:]();
      }
    }

    uint64_t v12 = v35;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[STAllowanceItemSetupListController _webDomainSpecifierForDomain:usageItem:]((uint64_t)v13, v24, v25, v26, v27, v28, v29, v30);
    }
    uint64_t v23 = 0;
  }

  if (v7)
  {
    v32 = [v7 image];
    [v10 setObject:v32 forKeyedSubscript:*MEMORY[0x263F60140]];
  }
  else
  {
    v32 = [MEMORY[0x263F67408] sharedCache];
    v33 = [v32 monogramImageForInitial:v23 useDarkColors:v12 == 2];
    [v10 setObject:v33 forKeyedSubscript:*MEMORY[0x263F60140]];
  }

  return v10;
}

- (id)_categoryDetailText:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = [a3 identifier];
  if ([(STAllowanceItemSetupListController *)self allAppsAndCategoriesSelected]
    || ([(STAllowanceItemSetupListController *)self selectedCategoryIdentifiers],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 containsObject:v4],
        v5,
        v6))
  {
    id v7 = +[STScreenTimeSettingsUIBundle bundle];
    uint64_t v8 = [v7 localizedStringForKey:@"AllItemsSelectedDetailText" value:&stru_26D9391A8 table:0];
  }
  else
  {
    if ([v4 isEqualToString:*MEMORY[0x263F673F0]])
    {
      id v7 = [(STAllowanceItemSetupListController *)self selectedWebDomains];
      uint64_t v9 = @"NumberOfWebsitesFormat";
    }
    else
    {
      id v7 = [(STAllowanceItemSetupListController *)self selectedBundleIdentifiers];
      uint64_t v9 = @"NumberOfAppsFormat";
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v10 = [(STAllowanceItemSetupListController *)self applicationAndWebDomainSpecifiersByCategoryIdentifier];
    uint64_t v11 = [v10 objectForKeyedSubscript:v4];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = [*(id *)(*((void *)&v22 + 1) + 8 * i) identifier];
          unsigned int v18 = [v7 containsObject:v17];

          v14 += v18;
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v14 = 0;
    }

    id v19 = +[STScreenTimeSettingsUIBundle bundle];
    id v20 = [v19 localizedStringForKey:v9 value:&stru_26D9391A8 table:0];

    uint64_t v8 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v20, @"%lu", 0, v14);
  }

  return v8;
}

- (void)_addWebsiteButtonPressed:(id)a3
{
  id v13 = a3;
  id v4 = [(STAllowanceItemSetupListController *)self specifierForID:@"WebDomainTextField"];
  if (!v4)
  {
    id v4 = [MEMORY[0x263F5FCA8] preferenceSpecifierNamed:0 target:self set:sel__addCustomWebDomain_specifier_ get:0 detail:0 cell:8 edit:0];
    [v4 setIdentifier:@"WebDomainTextField"];
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A0]];
    uint64_t v5 = *MEMORY[0x263F673F0];
    [v4 setObject:*MEMORY[0x263F673F0] forKeyedSubscript:0x26D939488];
    int v6 = +[STScreenTimeSettingsUIBundle bundle];
    id v7 = [v6 localizedStringForKey:@"AddWebsitePlaceholderText" value:&stru_26D9391A8 table:0];

    [v4 setPlaceholder:v7];
    uint64_t v8 = [(STAllowanceItemSetupListController *)self applicationAndWebDomainSpecifiersByCategoryIdentifier];
    uint64_t v9 = [v8 objectForKeyedSubscript:v5];

    objc_msgSend(v9, "insertObject:atIndex:", v4, objc_msgSend(v9, "indexOfObject:", v13));
    [(STAllowanceItemSetupListController *)self insertSpecifier:v4 atIndex:[(STAllowanceItemSetupListController *)self indexOfSpecifier:v13] animated:1];
  }
  uint64_t v10 = [(STAllowanceItemSetupListController *)self indexPathForSpecifier:v4];
  uint64_t v11 = [(STAllowanceItemSetupListController *)self table];
  uint64_t v12 = [v11 cellForRowAtIndexPath:v10];

  [v12 becomeFirstResponder];
}

- (void)_addCustomWebDomain:(id)a3 specifier:(id)a4
{
  v54[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(STAllowanceItemSetupListController *)self applicationAndWebDomainSpecifiersByCategoryIdentifier];
  uint64_t v9 = *MEMORY[0x263F673F0];
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F673F0]];

  uint64_t v11 = objc_msgSend(v7, "_sf_bestURLForUserTypedString");

  uint64_t v12 = [v11 host];

  if ([v12 length])
  {
    id v13 = objc_opt_new();
    uint64_t v14 = [v13 normalizeDomainName:v12];

    uint64_t v15 = [(STAllowanceItemSetupListController *)self specifierForID:v14];
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      [(STAllowanceItemSetupListController *)self removeSpecifier:v15 animated:1];
      [v10 removeObject:v16];
    }
    else
    {
      uint64_t v17 = objc_msgSend(v14, "_lp_userVisibleHost");
      uint64_t v16 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:3 edit:0];
      [v16 setIdentifier:v14];
      [v16 setObject:v9 forKeyedSubscript:0x26D939488];
      unsigned int v18 = [MEMORY[0x263F82DA0] currentTraitCollection];
      uint64_t v51 = [v18 userInterfaceStyle];

      id v19 = [MEMORY[0x263F67408] sharedCache];
      id v20 = v17;
      uint64_t v52 = v20;
      if ([v20 length])
      {
        uint64_t v46 = v19;
        id v21 = objc_opt_new();
        [v21 setScheme:@"https"];
        [v21 setHost:v20];
        v49 = [v21 URL];
        long long v22 = objc_msgSend(v49, "_lp_highLevelDomain");
        long long v23 = [v21 host];
        long long v24 = [v21 URL];
        id v25 = v22;
        id v26 = v23;
        id v50 = v24;
        uint64_t v48 = v9;
        if ([v25 length])
        {
          uint64_t v27 = [v25 substringToIndex:1];
          uint64_t v47 = [v27 uppercaseString];
        }
        else
        {
          uint64_t v36 = [v26 substringToIndex:1];
          uint64_t v37 = [v36 uppercaseString];

          uint64_t v47 = v37;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[STAllowanceItemSetupListController _webDomainSpecifierForDomain:usageItem:]();
          }
        }
        id v19 = v46;

        uint64_t v35 = (void *)v47;
        uint64_t v9 = v48;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[STAllowanceItemSetupListController _webDomainSpecifierForDomain:usageItem:]((uint64_t)v20, v28, v29, v30, v31, v32, v33, v34);
        }
        uint64_t v35 = 0;
      }

      uint64_t v38 = [v19 monogramImageForInitial:v35 useDarkColors:v51 == 2];
      [v16 setObject:v38 forKeyedSubscript:*MEMORY[0x263F60140]];
    }
    objc_msgSend(v10, "replaceObjectAtIndex:withObject:", objc_msgSend(v10, "indexOfObject:", v6), v16);
    v54[0] = v6;
    uint64_t v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:1];
    uint64_t v53 = v16;
    uint64_t v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
    [(STAllowanceItemSetupListController *)self replaceContiguousSpecifiers:v39 withSpecifiers:v40 animated:1];

    v41 = [(STAllowanceItemSetupListController *)self indexPathForSpecifier:v16];
    v42 = [(STAllowanceItemSetupListController *)self table];
    [v42 selectRowAtIndexPath:v41 animated:0 scrollPosition:0];

    v43 = [(STAllowanceItemSetupListController *)self selectedWebDomains];
    [v43 addObject:v14];

    uint64_t v44 = [(STAllowanceItemSetupListController *)self navigationItem];
    v45 = [v44 rightBarButtonItem];
    [v45 setEnabled:1];

    [(STAllowanceItemSetupListController *)self reloadSpecifierID:v9];
  }
  else
  {
    [v10 removeObject:v6];
    [(STAllowanceItemSetupListController *)self removeSpecifier:v6 animated:1];
    uint64_t v14 = v12;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)STAllowanceItemSetupListController;
  id v6 = a4;
  id v7 = [(STAllowanceItemSetupListController *)&v22 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[STAllowanceItemSetupListController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v22.receiver, v22.super_class);

  uint64_t v9 = [v8 objectForKeyedSubscript:0x26D939488];

  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = [MEMORY[0x263F825C8] tertiarySystemGroupedBackgroundColor];
    [v10 setBackgroundColor:v11];

    [v10 setAlpha:0.3];
    [v7 setBackgroundView:v10];
  }
  uint64_t v12 = [v8 identifier];
  if ([v12 isEqualToString:*MEMORY[0x263F673F0]])
  {
  }
  else
  {
    uint64_t v13 = [v8 cellType];

    if (v13 != 8) {
      goto LABEL_7;
    }
  }
  [v7 _setIgnoresMultipleSelectionDuringEditing:1];
LABEL_7:
  if ([v8 cellType] != 13)
  {
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = [MEMORY[0x263F825C8] clearColor];
    [v14 setBackgroundColor:v15];

    [v7 setSelectedBackgroundView:v14];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v7;
    [v16 setControllerDelegate:self];
    [v16 setValueChangedTarget:self action:sel__addCustomWebDomain_specifier_ specifier:v8];
    uint64_t v17 = [v16 editableTextField];
    [v17 setAutocapitalizationType:0];
    [v17 setAutocorrectionType:1];
    [v17 setKeyboardType:3];
    [v17 setReturnKeyType:9];
    [v17 setClearButtonMode:1];
    [v17 setAdjustsFontSizeToFitWidth:1];
    unsigned int v18 = [MEMORY[0x263F67408] sharedCache];
    id v19 = objc_msgSend(v18, "blankSpaceImageWithSize:", 29.0, 29.0);

    id v20 = [v16 iconImageView];

    [v20 setImage:v19];
  }

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  if (([v9 isUserInteractionEnabled] & 1) == 0 && (objc_msgSend(v9, "isSelected") & 1) == 0)
  {
    [v9 setUserInteractionEnabled:1];
    uint64_t v8 = [(STAllowanceItemSetupListController *)self table];
    [v8 selectRowAtIndexPath:v7 animated:0 scrollPosition:0];

    [v9 setUserInteractionEnabled:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(STAllowanceItemSetupListController *)self view];
  [v8 endEditing:0];

  id v9 = [(STAllowanceItemSetupListController *)self selectedBundleIdentifiers];
  uint64_t v10 = [(STAllowanceItemSetupListController *)self selectedWebDomains];
  uint64_t v11 = [(STAllowanceItemSetupListController *)self specifierAtIndexPath:v7];
  uint64_t v29 = [v11 identifier];
  uint64_t v28 = v11;
  if ([v29 isEqualToString:*MEMORY[0x263F673D8]])
  {
    id v25 = v10;
    id v26 = v7;
    id v27 = v6;
    [(STAllowanceItemSetupListController *)self setAllAppsAndCategoriesSelected:1];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v12 = [(STAllowanceItemSetupListController *)self categorySpecifiers];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v31;
      uint64_t v11 = (void *)*MEMORY[0x263F600A8];
      uint64_t v16 = MEMORY[0x263EFFA80];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v12);
          }
          unsigned int v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v19 = [v18 objectForKeyedSubscript:0x26D941028];
          v19[2](v19, 1);
          [v18 setObject:v16 forKeyedSubscript:v11];
          [(STAllowanceItemSetupListController *)self reloadSpecifier:v18 animated:0];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v14);
    }

    id v7 = v26;
    id v6 = v27;
    uint64_t v10 = v25;
  }
  else if ([v11 cellType] == 13)
  {
    [v6 deselectRowAtIndexPath:v7 animated:1];
    [v11 performButtonAction];
  }
  else if (v29 && [v11 cellType] != 8)
  {
    uint64_t v11 = [v11 objectForKeyedSubscript:0x26D939488];
    if ([v11 isEqualToString:*MEMORY[0x263F673F0]]) {
      id v20 = v10;
    }
    else {
      id v20 = v9;
    }
    [v20 addObject:v29];
    [(STAllowanceItemSetupListController *)self reloadSpecifierID:v11 animated:0];
  }
  if ([v9 count] || objc_msgSend(v10, "count"))
  {
    int v21 = 0;
    BOOL v22 = 1;
  }
  else
  {
    uint64_t v11 = [(STAllowanceItemSetupListController *)self selectedCategoryIdentifiers];
    BOOL v22 = [v11 count] != 0;
    int v21 = 1;
  }
  long long v23 = [(STAllowanceItemSetupListController *)self navigationItem];
  long long v24 = [v23 rightBarButtonItem];
  [v24 setEnabled:v22];

  if (v21) {
}
  }

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(STAllowanceItemSetupListController *)self selectedBundleIdentifiers];
  uint64_t v8 = [(STAllowanceItemSetupListController *)self selectedWebDomains];
  id v9 = [(STAllowanceItemSetupListController *)self specifierAtIndexPath:v6];
  uint64_t v10 = [v9 identifier];
  id v27 = v10;
  if ([v10 isEqualToString:*MEMORY[0x263F673D8]])
  {
    long long v24 = v9;
    id v25 = v8;
    id v26 = v6;
    [(STAllowanceItemSetupListController *)self setAllAppsAndCategoriesSelected:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v11 = [(STAllowanceItemSetupListController *)self categorySpecifiers];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      uint64_t v15 = *MEMORY[0x263F600A8];
      id v4 = (void *)MEMORY[0x263EFFA88];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          unsigned int v18 = [v17 objectForKeyedSubscript:0x26D941028];
          v18[2](v18, 0);
          [v17 setObject:v4 forKeyedSubscript:v15];
          [(STAllowanceItemSetupListController *)self reloadSpecifier:v17 animated:0];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }

    id v6 = v26;
    id v9 = v24;
    uint64_t v8 = v25;
  }
  else
  {
    id v4 = [v9 objectForKeyedSubscript:0x26D939488];
    if ([v4 isEqualToString:*MEMORY[0x263F673F0]]) {
      id v19 = v8;
    }
    else {
      id v19 = v7;
    }
    [v19 removeObject:v10];
    [(STAllowanceItemSetupListController *)self reloadSpecifierID:v4 animated:0];
  }
  if ([v7 count] || objc_msgSend(v8, "count"))
  {
    int v20 = 0;
    BOOL v21 = 1;
  }
  else
  {
    id v4 = [(STAllowanceItemSetupListController *)self selectedCategoryIdentifiers];
    BOOL v21 = [v4 count] != 0;
    int v20 = 1;
  }
  BOOL v22 = [(STAllowanceItemSetupListController *)self navigationItem];
  long long v23 = [v22 rightBarButtonItem];
  [v23 setEnabled:v21];

  if (v20) {
}
  }

- (void)_didPressCancelButton:(id)a3
{
  [(STAllowanceItemSetupListController *)self dismissViewControllerAnimated:1 completion:0];
  [(STAllowanceItemSetupListController *)self _cleanUpRetainCycles];
  id v4 = [(STAllowanceItemSetupListController *)self specifier];
  [v4 removePropertyForKey:@"CompletionHandler"];
}

- (void)_didPressDoneButton:(id)a3
{
  id v4 = [(STAllowanceItemSetupListController *)self specifier];
  uint64_t v11 = [v4 objectForKeyedSubscript:@"CompletionHandler"];

  if (v11)
  {
    uint64_t v5 = [(STAllowanceItemSetupListController *)self selectedBundleIdentifiers];
    id v6 = [v5 array];
    id v7 = [(STAllowanceItemSetupListController *)self selectedWebDomains];
    uint64_t v8 = [v7 array];
    id v9 = [(STAllowanceItemSetupListController *)self selectedCategoryIdentifiers];
    uint64_t v10 = [v9 array];
    v11[2](v11, self, v6, v8, v10);
  }
  else
  {
    [(STAllowanceItemSetupListController *)self dismissViewControllerAnimated:1 completion:0];
  }
  [(STAllowanceItemSetupListController *)self _cleanUpRetainCycles];
}

- (void)_cleanUpRetainCycles
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(STAllowanceItemSetupListController *)self categorySpecifiers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v7 removePropertyForKey:0x26D941008];
        [v7 removePropertyForKey:0x26D941028];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)willPresentSearchController:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v38 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v39 = [(STAllowanceItemSetupListController *)self applicationAndWebDomainSpecifiersByCategoryIdentifier];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v37 = self;
  uint64_t v5 = [(STAllowanceItemSetupListController *)self categorySpecifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v11 = [v10 identifier];
        uint64_t v12 = [v39 objectForKeyedSubscript:v11];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v45 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v44 + 1) + 8 * j);
              if ([v17 cellType] == 3) {
                [v4 addObject:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
          }
          while (v14);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v7);
  }

  unsigned int v18 = [(STAllowanceItemSetupListController *)v37 specifier];
  id v19 = [v18 objectForKeyedSubscript:0x26D940528];

  int v20 = [v19 viewModel];
  BOOL v21 = [v20 installedBundleIDsByCategoryIdentifier];
  uint64_t v22 = *MEMORY[0x263F31860];
  long long v23 = [v21 objectForKeyedSubscript:*MEMORY[0x263F31860]];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v24 = v23;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = [(STAllowanceItemSetupListController *)v37 _applicationSpecifierForBundleIdentifier:*(void *)(*((void *)&v40 + 1) + 8 * k) categoryIdentifier:v22];
        [v4 addObject:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v26);
  }

  long long v30 = [v38 searchResultsController];
  [v30 setAllowanceItemSpecifiers:v4];

  long long v31 = +[STScreenTimeSettingsUIBundle bundle];
  long long v32 = [v31 localizedStringForKey:@"AllowanceCancelBarButtonItemTitle" value:&stru_26D9391A8 table:0];

  uint64_t v33 = [(STAllowanceItemSetupListController *)v37 navigationItem];
  uint64_t v34 = [v33 searchController];
  uint64_t v35 = [v34 searchBar];
  uint64_t v36 = [v35 cancelButton];
  [v36 setTitle:v32 forState:0];
}

- (void)willDismissSearchController:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(STAllowanceItemSetupListController *)self table];
  uint64_t v26 = objc_opt_new();
  uint64_t v27 = v6;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = [v6 indexPathsForSelectedRows];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v3 = (void *)v8;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v4 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v11 = [(STAllowanceItemSetupListController *)self specifierAtIndexPath:v4];
        uint64_t v12 = [v11 objectForKeyedSubscript:0x26D939488];

        if (v12)
        {
          uint64_t v13 = [(STAllowanceItemSetupListController *)self selectedCategoryIdentifiers];
          char v14 = [v13 containsObject:v12];

          if ((v14 & 1) == 0)
          {
            [v27 deselectRowAtIndexPath:v4 animated:0];
            [v26 addObject:v12];
          }
        }
      }
      uint64_t v3 = (void *)[v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v3);
  }

  [(STAllowanceItemSetupListController *)self _selectCellsForSelectedIdentifiers:v26];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = v26;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        [(STAllowanceItemSetupListController *)self reloadSpecifierID:*(void *)(*((void *)&v28 + 1) + 8 * j) animated:0];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v17);
  }

  int v20 = [(STAllowanceItemSetupListController *)self selectedBundleIdentifiers];
  uint64_t v21 = [v20 count];
  if (v21)
  {
    int v22 = 0;
    BOOL v23 = 1;
  }
  else
  {
    uint64_t v3 = [(STAllowanceItemSetupListController *)self selectedWebDomains];
    if ([v3 count])
    {
      int v22 = 0;
      BOOL v23 = 1;
    }
    else
    {
      uint64_t v4 = [(STAllowanceItemSetupListController *)self selectedCategoryIdentifiers];
      BOOL v23 = [v4 count] != 0;
      int v22 = 1;
    }
  }
  id v24 = [(STAllowanceItemSetupListController *)self navigationItem];
  uint64_t v25 = [v24 rightBarButtonItem];
  [v25 setEnabled:v23];

  if (v22) {
  if (!v21)
  }
}

- (void)_selectCellsForSelectedIdentifiers:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(STAllowanceItemSetupListController *)self table];
  if ([(STAllowanceItemSetupListController *)self allAppsAndCategoriesSelected])
  {
    uint64_t v6 = [(STAllowanceItemSetupListController *)self specifierForID:*MEMORY[0x263F673D8]];
    uint64_t v7 = [(STAllowanceItemSetupListController *)self indexPathForSpecifier:v6];
    [v5 selectRowAtIndexPath:v7 animated:0 scrollPosition:0];
    if (v4)
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      uint64_t v8 = [(STAllowanceItemSetupListController *)self categorySpecifiers];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v63 objects:v70 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v64 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = [*(id *)(*((void *)&v63 + 1) + 8 * i) identifier];
            [v4 addObject:v13];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v63 objects:v70 count:16];
        }
        while (v10);
      }
    }
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  char v14 = [(STAllowanceItemSetupListController *)self selectedCategoryIdentifiers];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v60 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v59 + 1) + 8 * j);
        int v20 = [(STAllowanceItemSetupListController *)self specifierForID:v19];
        uint64_t v21 = [(STAllowanceItemSetupListController *)self indexPathForSpecifier:v20];

        [v5 selectRowAtIndexPath:v21 animated:0 scrollPosition:0];
        [v4 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v16);
  }

  long long v44 = [(STAllowanceItemSetupListController *)self applicationAndWebDomainSpecifiersByCategoryIdentifier];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  int v22 = [(STAllowanceItemSetupListController *)self selectedBundleIdentifiers];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v55 objects:v68 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v56;
    long long v42 = v53;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v56 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v55 + 1) + 8 * k);
        long long v28 = -[STAllowanceItemSetupListController specifierForID:](self, "specifierForID:", v27, v42);
        long long v29 = v28;
        if (v28)
        {
          long long v30 = [v28 objectForKeyedSubscript:0x26D939488];
          [v4 addObject:v30];

          long long v31 = [(STAllowanceItemSetupListController *)self indexPathForSpecifier:v29];
          if (v31) {
            [v5 selectRowAtIndexPath:v31 animated:0 scrollPosition:0];
          }
        }
        else if (v4)
        {
          v52[0] = MEMORY[0x263EF8330];
          v52[1] = 3221225472;
          v53[0] = __73__STAllowanceItemSetupListController__selectCellsForSelectedIdentifiers___block_invoke;
          v53[1] = &unk_2647670C8;
          v53[2] = v27;
          id v54 = v4;
          [v44 enumerateKeysAndObjectsUsingBlock:v52];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v55 objects:v68 count:16];
    }
    while (v24);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v32 = [(STAllowanceItemSetupListController *)self selectedWebDomains];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v67 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v49;
    long long v43 = v46;
    do
    {
      for (uint64_t m = 0; m != v34; ++m)
      {
        if (*(void *)v49 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v48 + 1) + 8 * m);
        uint64_t v38 = -[STAllowanceItemSetupListController specifierForID:](self, "specifierForID:", v37, v43);
        uint64_t v39 = v38;
        if (v38)
        {
          long long v40 = [v38 objectForKeyedSubscript:0x26D939488];
          [v4 addObject:v40];

          long long v41 = [(STAllowanceItemSetupListController *)self indexPathForSpecifier:v39];
          if (v41) {
            [v5 selectRowAtIndexPath:v41 animated:0 scrollPosition:0];
          }
        }
        else if (v4)
        {
          v45[0] = MEMORY[0x263EF8330];
          v45[1] = 3221225472;
          v46[0] = __73__STAllowanceItemSetupListController__selectCellsForSelectedIdentifiers___block_invoke_2;
          v46[1] = &unk_2647670C8;
          v46[2] = v37;
          id v47 = v4;
          [v44 enumerateKeysAndObjectsUsingBlock:v45];
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v48 objects:v67 count:16];
    }
    while (v34);
  }
}

void __73__STAllowanceItemSetupListController__selectCellsForSelectedIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "identifier", (void)v15);
        int v14 = [v13 isEqualToString:*(void *)(a1 + 32)];

        if (v14)
        {
          [*(id *)(a1 + 40) addObject:v7];
          *a4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __73__STAllowanceItemSetupListController__selectCellsForSelectedIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "identifier", (void)v15);
        int v14 = [v13 isEqualToString:*(void *)(a1 + 32)];

        if (v14)
        {
          [*(id *)(a1 + 40) addObject:v7];
          *a4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)allAppsAndCategoriesSelected
{
  return self->_allAppsAndCategoriesSelected;
}

- (void)setAllAppsAndCategoriesSelected:(BOOL)a3
{
  self->_allAppsAndCategoriesSelected = a3;
}

- (NSMutableOrderedSet)selectedBundleIdentifiers
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 1392, 1);
}

- (NSMutableOrderedSet)selectedWebDomains
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 1400, 1);
}

- (NSMutableOrderedSet)selectedCategoryIdentifiers
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 1408, 1);
}

- (NSArray)categorySpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setCategorySpecifiers:(id)a3
{
}

- (NSMutableDictionary)applicationAndWebDomainSpecifiersByCategoryIdentifier
{
  return self->_applicationAndWebDomainSpecifiersByCategoryIdentifier;
}

- (STAllowanceItemSearchResultsController)searchResultsController
{
  return (STAllowanceItemSearchResultsController *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setSearchResultsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_applicationAndWebDomainSpecifiersByCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_categorySpecifiers, 0);
  objc_storeStrong((id *)&self->_selectedCategoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_selectedWebDomains, 0);

  objc_storeStrong((id *)&self->_selectedBundleIdentifiers, 0);
}

void __48__STAllowanceItemSetupListController_specifiers__block_invoke_3_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_webDomainSpecifierForDomain:(uint64_t)a3 usageItem:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_webDomainSpecifierForDomain:usageItem:.cold.2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to extract high level domain for URL: %@. Creating initial for host instead: %@", v0, 0x16u);
}

@end