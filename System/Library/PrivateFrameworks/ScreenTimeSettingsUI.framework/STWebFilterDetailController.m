@interface STWebFilterDetailController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (STContentPrivacyMediaRestrictionsDetailController)parentMediaRestrictionsController;
- (STWebFilterDetailController)init;
- (id)_addButtonSpecifierWithGroup:(id)a3 action:(SEL)a4;
- (id)_listItemSpecifiersForNamedSitesGroup:(id)a3;
- (id)_listItemSpecifiersForSitesGroup:(id)a3;
- (id)getItemSpecifierValue:(id)a3;
- (id)groupSpecifierWithConfiguration:(id)a3 key:(id)a4 footerText:(id)a5 radio:(BOOL)a6;
- (id)listItemSpecifierWithGroup:(id)a3 name:(id)a4 value:(id)a5;
- (id)specifiers;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)addNamedSite:(id)a3;
- (void)addSite:(id)a3;
- (void)dealloc;
- (void)didCancelEnteringPIN;
- (void)gatedAddNamedSite:(id)a3;
- (void)gatedAddSite:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)saveItemValue:(id)a3 specifier:(id)a4;
- (void)saveRemovingItem:(id)a3 value:(id)a4;
- (void)setCoordinator:(id)a3;
- (void)setParentMediaRestrictionsController:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateParent;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation STWebFilterDetailController

- (STWebFilterDetailController)init
{
  v7.receiver = self;
  v7.super_class = (Class)STWebFilterDetailController;
  v2 = [(STPINListViewController *)&v7 init];
  if (v2)
  {
    v3 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v5 = [v4 localizedStringForKey:@"WebContentSpecifierName" value:&stru_26D9391A8 table:v3];
    [(STWebFilterDetailController *)v2 setTitle:v5];
  }
  return v2;
}

- (id)specifiers
{
  v39[4] = *MEMORY[0x263EF8340];
  v3 = [(STPINListViewController *)self coordinator];
  v4 = [v3 contentPrivacyCoordinator];
  v5 = [v4 viewModel];

  if (![v5 isLoaded])
  {
    id v25 = (id)MEMORY[0x263EFFA68];
    goto LABEL_9;
  }
  v35 = v5;
  v6 = objc_opt_new();
  objc_super v7 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  v8 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v9 = [v8 localizedStringForKey:@"UnrestrictedAccessSpecifierName" value:&stru_26D9391A8 table:v7];
  uint64_t v10 = [v8 localizedStringForKey:@"LimitAdultWebsitesSpecifierName" value:&stru_26D9391A8 table:v7];
  uint64_t v11 = [v8 localizedStringForKey:@"AADC_AllowedWebsitesSpecifierName" value:&stru_26D9391A8 table:v7];
  v12 = [(STWebFilterDetailController *)self groupSpecifierWithConfiguration:0x26D93CE68 key:0x26D93CF68 footerText:0 radio:1];
  v39[0] = v12;
  v37 = (void *)v9;
  v13 = [(STWebFilterDetailController *)self listItemSpecifierWithGroup:v12 name:v9 value:&unk_26D967558];
  v39[1] = v13;
  v36 = (void *)v10;
  v14 = [(STWebFilterDetailController *)self listItemSpecifierWithGroup:v12 name:v10 value:&unk_26D967570];
  v39[2] = v14;
  v38 = (void *)v11;
  v15 = [(STWebFilterDetailController *)self listItemSpecifierWithGroup:v12 name:v11 value:&unk_26D967588];
  v39[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];
  [v6 addObjectsFromArray:v16];

  v17 = [(STWebFilterDetailController *)self getItemSpecifierValue:v12];
  uint64_t v18 = [v17 unsignedIntegerValue];

  if (v18 == 1)
  {
    v26 = [v8 localizedStringForKey:@"WebContentAutoFilterFooterText" value:&stru_26D9391A8 table:v7];
    [v12 setObject:v26 forKeyedSubscript:*MEMORY[0x263F600F8]];

    v27 = [(STWebFilterDetailController *)self groupSpecifierWithConfiguration:@"system.webcontentfilter.basic" key:@"filterWhiteList" footerText:0 radio:0];
    [v6 addObject:v27];
    v28 = [(STWebFilterDetailController *)self _listItemSpecifiersForSitesGroup:v27];
    [v6 addObjectsFromArray:v28];

    v29 = [(STWebFilterDetailController *)self _addButtonSpecifierWithGroup:v27 action:sel_gatedAddSite_];
    [v6 addObject:v29];

    v22 = [(STWebFilterDetailController *)self groupSpecifierWithConfiguration:@"system.webcontentfilter.basic" key:@"filterBlackList" footerText:0 radio:0];
    [v6 addObject:v22];
    v30 = [(STWebFilterDetailController *)self _listItemSpecifiersForSitesGroup:v22];
    [v6 addObjectsFromArray:v30];

    v24 = [(STWebFilterDetailController *)self _addButtonSpecifierWithGroup:v22 action:sel_gatedAddSite_];
    v20 = v36;
    v19 = v37;
    v5 = v35;
    goto LABEL_7;
  }
  v20 = v36;
  v19 = v37;
  v5 = v35;
  if (v18 == 2)
  {
    v21 = [v8 localizedStringForKey:@"WebContentCustomFilterFooterText" value:&stru_26D9391A8 table:v7];
    [v12 setObject:v21 forKeyedSubscript:*MEMORY[0x263F600F8]];

    v22 = [(STWebFilterDetailController *)self groupSpecifierWithConfiguration:@"system.webcontentfilter.basic" key:@"siteWhiteList" footerText:0 radio:0];
    [v6 addObject:v22];
    v23 = [(STWebFilterDetailController *)self _listItemSpecifiersForNamedSitesGroup:v22];
    [v6 addObjectsFromArray:v23];

    v24 = [(STWebFilterDetailController *)self _addButtonSpecifierWithGroup:v22 action:sel_gatedAddNamedSite_];
LABEL_7:
    [v6 addObject:v24];
  }
  v31 = (objc_class *)[v6 copy];
  uint64_t v32 = (int)*MEMORY[0x263F5FDB8];
  v33 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v32);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v32) = v31;

  id v25 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + v32);
LABEL_9:

  return v25;
}

- (id)_listItemSpecifiersForNamedSitesGroup:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(STWebFilterDetailController *)self getItemSpecifierValue:v4];
  v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  objc_super v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"payloadPageTitle" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  v24[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  uint64_t v9 = [v5 sortedArrayUsingDescriptors:v8];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "payloadPageTitle", (void)v19);
        v17 = [(STWebFilterDetailController *)self listItemSpecifierWithGroup:v4 name:v16 value:v15];
        [v6 addObject:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  return v6;
}

- (id)_listItemSpecifiersForSitesGroup:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(STWebFilterDetailController *)self getItemSpecifierValue:v4];
  v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  objc_super v7 = [v5 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = -[STWebFilterDetailController listItemSpecifierWithGroup:name:value:](self, "listItemSpecifierWithGroup:name:value:", v4, *(void *)(*((void *)&v15 + 1) + 8 * i), *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        [v6 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(STPINListViewController *)self coordinator];
  id v4 = [v3 contentPrivacyCoordinator];
  [v4 removeObserver:self forKeyPath:@"viewModel.isLoaded" context:@"WebFilterViewModelLoadedContext"];

  v5.receiver = self;
  v5.super_class = (Class)STWebFilterDetailController;
  [(STListViewController *)&v5 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(STPINListViewController *)self coordinator];

  if (v5 != v4)
  {
    v6 = [(STPINListViewController *)self coordinator];
    objc_super v7 = [v6 contentPrivacyCoordinator];
    [v7 removeObserver:self forKeyPath:@"viewModel.isLoaded" context:@"WebFilterViewModelLoadedContext"];

    v10.receiver = self;
    v10.super_class = (Class)STWebFilterDetailController;
    [(STPINListViewController *)&v10 setCoordinator:v4];
    id v8 = [(STPINListViewController *)self coordinator];
    uint64_t v9 = [v8 contentPrivacyCoordinator];
    [v9 addObserver:self forKeyPath:@"viewModel.isLoaded" options:0 context:@"WebFilterViewModelLoadedContext"];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"WebFilterViewModelLoadedContext")
  {
    objc_super v7 = [(STPINListViewController *)self coordinator];
    id v8 = [v7 contentPrivacyCoordinator];
    uint64_t v9 = [v8 viewModel];
    int v10 = [v9 isLoaded];

    if (v10)
    {
      [(STWebFilterDetailController *)self reloadSpecifiers];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)STWebFilterDetailController;
    -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)gatedAddNamedSite:(id)a3
{
  id v4 = a3;
  if ([(PSListController *)self st_shouldShowPINSheetForPINSpecifier])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __49__STWebFilterDetailController_gatedAddNamedSite___block_invoke;
    v5[3] = &unk_264766FD8;
    v5[4] = self;
    id v6 = v4;
    [(PSListController *)self st_showPINSheetWithCompletion:v5];
  }
  else
  {
    [(STWebFilterDetailController *)self addNamedSite:v4];
  }
}

uint64_t __49__STWebFilterDetailController_gatedAddNamedSite___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) addNamedSite:*(void *)(result + 40)];
  }
  return result;
}

- (void)gatedAddSite:(id)a3
{
  id v4 = a3;
  if ([(PSListController *)self st_shouldShowPINSheetForPINSpecifier])
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __44__STWebFilterDetailController_gatedAddSite___block_invoke;
    v5[3] = &unk_264766FD8;
    v5[4] = self;
    id v6 = v4;
    [(PSListController *)self st_showPINSheetWithCompletion:v5];
  }
  else
  {
    [(STWebFilterDetailController *)self addSite:v4];
  }
}

uint64_t __44__STWebFilterDetailController_gatedAddSite___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) addSite:*(void *)(result + 40)];
  }
  return result;
}

- (void)addNamedSite:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_opt_new();
  id v5 = [(STPINListViewController *)self coordinator];
  id v6 = [v5 contentPrivacyCoordinator];
  [v8 setCoordinator:v6];

  [v8 setParentController:self];
  objc_super v7 = [v4 objectForKeyedSubscript:0x26D93CEC8];

  [v8 setRestriction:v7];
  [v8 setIsNamedSite:1];
  [(STWebFilterDetailController *)self showController:v8 animate:1];
}

- (void)addSite:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_opt_new();
  id v5 = [(STPINListViewController *)self coordinator];
  id v6 = [v5 contentPrivacyCoordinator];
  [v8 setCoordinator:v6];

  [v8 setParentController:self];
  objc_super v7 = [v4 objectForKeyedSubscript:0x26D93CEC8];

  [v8 setRestriction:v7];
  [(STWebFilterDetailController *)self showController:v8 animate:1];
}

- (id)getItemSpecifierValue:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:0x26D93CEC8];
  id v5 = [(STPINListViewController *)self coordinator];
  id v6 = [v5 contentPrivacyCoordinator];
  objc_super v7 = [v6 viewModel];

  id v8 = [v7 valuesByRestriction];
  uint64_t v9 = [v8 objectForKeyedSubscript:v4];
  int v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v7 defaultValueForRestriction:v4];
  }
  uint64_t v12 = v11;

  return v12;
}

- (void)saveRemovingItem:(id)a3 value:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  objc_super v7 = [(STPINListViewController *)self coordinator];
  id v8 = [v7 contentPrivacyCoordinator];
  uint64_t v9 = [v8 viewModel];

  int v10 = [v9 valuesByRestriction];
  id v11 = [v10 objectForKeyedSubscript:v24];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v9 defaultValueForRestriction:v24];
  }
  v14 = v13;

  long long v15 = [v24 payloadKey];
  int v16 = [v15 isEqualToString:@"siteWhiteList"];

  long long v17 = (void *)MEMORY[0x263F08A98];
  if (v16)
  {
    long long v18 = [v6 payloadAddress];
    long long v19 = [v17 predicateWithFormat:@"%K != %@", @"payloadAddress", v18];
    uint64_t v20 = [v14 filteredArrayUsingPredicate:v19];
  }
  else
  {
    long long v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"self != %@", v6];
    uint64_t v20 = [v14 filteredArrayUsingPredicate:v18];
  }

  long long v21 = [(STPINListViewController *)self coordinator];
  long long v22 = [v21 contentPrivacyCoordinator];
  v23 = (void *)[v20 copy];
  [v22 saveRestrictionValue:v23 forItem:v24 completionHandler:&__block_literal_global_27];
}

- (void)saveItemValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  objc_super v7 = [a4 objectForKeyedSubscript:0x26D93CEC8];
  id v8 = [(STPINListViewController *)self coordinator];
  uint64_t v9 = [v8 contentPrivacyCoordinator];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__STWebFilterDetailController_saveItemValue_specifier___block_invoke;
  v17[3] = &unk_2647671B0;
  v17[4] = self;
  [v9 saveRestrictionValue:v6 forItem:v7 completionHandler:v17];

  if (_os_feature_enabled_impl())
  {
    int v10 = [MEMORY[0x263F67088] sharedController];
    id v11 = [MEMORY[0x263F67088] sharedController];
    uint64_t v12 = [v11 viewContext];
    id v16 = 0;
    char v13 = [v10 saveContext:v12 error:&v16];
    id v14 = v16;

    if ((v13 & 1) == 0)
    {
      long long v15 = +[STUILog communicationSafety];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        __58__STLimitUsageGroupSpecifierProvider_setUpScreenDistance___block_invoke_cold_1((uint64_t)v14, v15);
      }
    }
  }
}

uint64_t __55__STWebFilterDetailController_saveItemValue_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelectorOnMainThread:sel_reloadSpecifiers withObject:0 waitUntilDone:0];
}

- (void)updateParent
{
  id v2 = [(STWebFilterDetailController *)self parentMediaRestrictionsController];
  [v2 performSelectorOnMainThread:sel_reloadSpecifiers withObject:0 waitUntilDone:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STWebFilterDetailController;
  [(STPINListViewController *)&v6 viewDidAppear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE78]));
  [(STWebFilterDetailController *)self setParentMediaRestrictionsController:WeakRetained];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STWebFilterDetailController.viewDidAppear", v5, 2u);
  }
}

- (void)willResignActive
{
  v3.receiver = self;
  v3.super_class = (Class)STWebFilterDetailController;
  [(STWebFilterDetailController *)&v3 willResignActive];
  [(STWebFilterDetailController *)self updateParent];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STWebFilterDetailController;
  [(STWebFilterDetailController *)&v5 viewWillDisappear:a3];
  [(STWebFilterDetailController *)self updateParent];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STWebFilterDetailController.viewWillDisappear", v4, 2u);
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v4 = [(STWebFilterDetailController *)self specifierAtIndexPath:a4];
  objc_super v5 = [v4 objectForKeyedSubscript:0x26D93CEC8];
  BOOL v6 = [v5 restrictionType] == 2 && objc_msgSend(v4, "cellType") != 13;

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  BOOL v6 = -[STWebFilterDetailController specifierAtIndexPath:](self, "specifierAtIndexPath:", a5, a4);
  if ([(PSListController *)self st_shouldShowPINSheetForPINSpecifier])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __78__STWebFilterDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
    v9[3] = &unk_264766FD8;
    v9[4] = self;
    id v10 = v6;
    [(PSListController *)self st_showPINSheetWithCompletion:v9];
  }
  else
  {
    [(STWebFilterDetailController *)self removeSpecifier:v6 animated:1];
    objc_super v7 = [v6 objectForKeyedSubscript:0x26D93CEC8];
    id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F60308]];
    [(STWebFilterDetailController *)self saveRemovingItem:v7 value:v8];
  }
}

void __78__STWebFilterDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) removeSpecifier:*(void *)(a1 + 40) animated:1];
    objc_super v3 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:0x26D93CEC8];
    id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x263F60308]];
    [v3 saveRemovingItem:v5 value:v4];
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(STWebFilterDetailController *)self specifierAtIndexPath:v5];
  objc_super v7 = [(STWebFilterDetailController *)self getGroupSpecifierForSpecifier:v6];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F60168]];
  if ([v8 BOOLValue])
  {
  }
  else
  {
    uint64_t v9 = [v6 cellType];

    if (v9 == 3)
    {
      id v10 = 0;
      goto LABEL_6;
    }
  }
  id v10 = v5;
LABEL_6:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STWebFilterDetailController *)self specifierAtIndexPath:v7];
  uint64_t v9 = [(STWebFilterDetailController *)self getGroupSpecifierForSpecifier:v8];
  id v10 = [v8 objectForKeyedSubscript:0x26D93CEC8];
  id v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F60168]];
  int v12 = [v11 BOOLValue];

  if (v12) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if ([(PSListController *)self st_shouldShowPINSheetForPINSpecifier])
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __65__STWebFilterDetailController_tableView_didSelectRowAtIndexPath___block_invoke;
      v16[3] = &unk_264766FD8;
      v16[4] = self;
      id v17 = v8;
      [(PSListController *)self st_showPINSheetWithCompletion:v16];
    }
    else
    {
      id v14 = [v8 objectForKeyedSubscript:*MEMORY[0x263F60308]];
      [(STWebFilterDetailController *)self saveItemValue:v14 specifier:v8];
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)STWebFilterDetailController;
  [(STPINListViewController *)&v15 tableView:v6 didSelectRowAtIndexPath:v7];
}

void __65__STWebFilterDetailController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_super v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x263F60308]];
    [v3 saveItemValue:v4 specifier:*(void *)(a1 + 40)];
  }
}

- (id)groupSpecifierWithConfiguration:(id)a3 key:(id)a4 footerText:(id)a5 radio:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  BOOL v13 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  id v14 = +[STScreenTimeSettingsUIBundle bundle];
  objc_super v15 = [(STPINListViewController *)self coordinator];
  id v16 = [v15 contentPrivacyCoordinator];
  id v17 = [v16 viewModel];
  long long v18 = [v17 visibleRestrictionWithConfiguration:v12 key:v11];

  long long v19 = (void *)MEMORY[0x263F5FC40];
  uint64_t v20 = [v18 uiLabel];
  long long v21 = [v14 localizedStringForKey:v20 value:&stru_26D9391A8 table:v13];
  long long v22 = [v19 groupSpecifierWithName:v21];

  [v22 setObject:v18 forKeyedSubscript:0x26D93CEC8];
  v23 = [NSNumber numberWithBool:v6];
  [v22 setObject:v23 forKeyedSubscript:*MEMORY[0x263F60168]];

  if (v10) {
    [v22 setObject:v10 forKeyedSubscript:*MEMORY[0x263F600F8]];
  }

  return v22;
}

- (id)listItemSpecifierWithGroup:(id)a3 name:(id)a4 value:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x263F5FC40];
  id v10 = a5;
  id v11 = [v9 preferenceSpecifierNamed:a4 target:self set:0 get:0 detail:0 cell:3 edit:0];
  id v12 = [v8 objectForKeyedSubscript:0x26D93CEC8];
  BOOL v13 = NSNumber;
  id v14 = [(STPINListViewController *)self coordinator];
  objc_super v15 = [v14 contentPrivacyCoordinator];
  id v16 = [v15 viewModel];
  id v17 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v16, "restrictionsEnabled"));
  [v11 setObject:v17 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [v11 setObject:v12 forKeyedSubscript:0x26D93CEC8];
  [v11 setObject:v10 forKeyedSubscript:*MEMORY[0x263F60308]];
  long long v18 = [(STWebFilterDetailController *)self getItemSpecifierValue:v11];
  LODWORD(v9) = [v10 isEqual:v18];

  if (v9) {
    [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x263F60200]];
  }

  return v11;
}

- (id)_addButtonSpecifierWithGroup:(id)a3 action:(SEL)a4
{
  id v5 = [a3 objectForKeyedSubscript:0x26D93CEC8];
  BOOL v6 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  id v7 = +[STScreenTimeSettingsUIBundle bundle];
  id v8 = [v7 localizedStringForKey:@"AddWebsiteButton" value:&stru_26D9391A8 table:v6];
  uint64_t v9 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:13 edit:0];
  id v10 = NSNumber;
  id v11 = [(STPINListViewController *)self coordinator];
  id v12 = [v11 contentPrivacyCoordinator];
  BOOL v13 = [v12 viewModel];
  id v14 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v13, "restrictionsEnabled"));
  [v9 setObject:v14 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [v9 setObject:v5 forKeyedSubscript:0x26D93CEC8];
  [v9 setButtonAction:a4];

  return v9;
}

- (void)didCancelEnteringPIN
{
  v3.receiver = self;
  v3.super_class = (Class)STWebFilterDetailController;
  [(STPINListViewController *)&v3 didCancelEnteringPIN];
  [(STWebFilterDetailController *)self reloadSpecifiers];
}

- (STContentPrivacyMediaRestrictionsDetailController)parentMediaRestrictionsController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentMediaRestrictionsController);

  return (STContentPrivacyMediaRestrictionsDetailController *)WeakRetained;
}

- (void)setParentMediaRestrictionsController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end