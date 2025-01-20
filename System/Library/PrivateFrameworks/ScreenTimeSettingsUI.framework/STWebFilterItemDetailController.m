@interface STWebFilterItemDetailController
- (BOOL)isNamedSite;
- (BOOL)shouldSelectResponderOnAppearance;
- (NSString)pageTitle;
- (NSString)pageURL;
- (STContentPrivacyViewModelCoordinator)coordinator;
- (STRestrictionItem)restriction;
- (STWebFilterDetailController)parentWebFilterController;
- (STWebFilterItemDetailController)init;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)saveFilterItem;
- (void)setCoordinator:(id)a3;
- (void)setIsNamedSite:(BOOL)a3;
- (void)setPageTitle:(id)a3;
- (void)setPageURL:(id)a3;
- (void)setParentWebFilterController:(id)a3;
- (void)setRestriction:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation STWebFilterItemDetailController

- (STWebFilterItemDetailController)init
{
  v7.receiver = self;
  v7.super_class = (Class)STWebFilterItemDetailController;
  v2 = [(STWebFilterItemDetailController *)&v7 init];
  if (v2)
  {
    v3 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v5 = [v4 localizedStringForKey:@"AddWebsiteLabel" value:&stru_26D9391A8 table:v3];
    [(STWebFilterItemDetailController *)v2 setTitle:v5];
  }
  return v2;
}

- (id)specifiers
{
  v24[3] = *MEMORY[0x263EF8340];
  v3 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  v4 = +[STScreenTimeSettingsUIBundle bundle];
  v5 = (void *)MEMORY[0x263F5FC40];
  v6 = [v4 localizedStringForKey:@"AddWebsiteLabel" value:&stru_26D9391A8 table:v3];
  objc_super v7 = [v5 groupSpecifierWithID:v6];

  BOOL v8 = [(STWebFilterItemDetailController *)self isNamedSite];
  if (v8)
  {
    v9 = [v4 localizedStringForKey:@"TitleLabel" value:&stru_26D9391A8 table:v3];
    v10 = [MEMORY[0x263F5FCA8] preferenceSpecifierNamed:v9 target:self set:sel_setPageTitle_ get:sel_pageTitle detail:0 cell:8 edit:0];
    v11 = [v4 localizedStringForKey:@"TitlePlaceholderText" value:&stru_26D9391A8 table:v3];
    [v10 setPlaceholder:v11];
  }
  else
  {
    v10 = 0;
  }
  v12 = [v4 localizedStringForKey:@"URLLabel" value:&stru_26D9391A8 table:v3];
  v13 = [MEMORY[0x263F5FCA8] preferenceSpecifierNamed:v12 target:self set:sel_setPageURL_ get:sel_pageURL detail:0 cell:8 edit:0];
  v14 = [v4 localizedStringForKey:@"URLPlaceholderText" value:&stru_26D9391A8 table:v3];
  [v13 setPlaceholder:v14];

  [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A0]];
  if (v8)
  {
    v24[0] = v7;
    v24[1] = v10;
    v24[2] = v13;
    v15 = (void *)MEMORY[0x263EFF8C0];
    v16 = v24;
    uint64_t v17 = 3;
  }
  else
  {
    v23[0] = v7;
    v23[1] = v13;
    v15 = (void *)MEMORY[0x263EFF8C0];
    v16 = v23;
    uint64_t v17 = 2;
  }
  v18 = [v15 arrayWithObjects:v16 count:v17];
  uint64_t v19 = (int)*MEMORY[0x263F5FDB8];
  v20 = *(Class *)((char *)&self->super.super.super.super.super.isa + v19);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v19) = v18;

  id v21 = *(id *)((char *)&self->super.super.super.super.super.isa + v19);
  return v21;
}

- (void)saveFilterItem
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v4 = [(STWebFilterItemDetailController *)self restriction];

  if (!v4)
  {
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"STWebFilterItemDetailController.m", 77, @"Invalid parameter not satisfying: %@", @"self.restriction" object file lineNumber description];
  }
  v5 = [(STWebFilterItemDetailController *)self pageURL];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    objc_super v7 = +[STUILog contentPrivacy];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(STWebFilterItemDetailController *)self pageURL];
      v9 = [(STWebFilterItemDetailController *)self pageTitle];
      *(_DWORD *)buf = 138412546;
      v31 = v8;
      __int16 v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_225B06000, v7, OS_LOG_TYPE_DEFAULT, "Going to save URL '%@' title '%@'", buf, 0x16u);
    }
    v10 = [(STWebFilterItemDetailController *)self coordinator];
    v11 = [v10 viewModel];

    v12 = [v11 valuesByRestriction];
    v13 = [(STWebFilterItemDetailController *)self restriction];
    v14 = [v12 objectForKeyedSubscript:v13];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      uint64_t v17 = [(STWebFilterItemDetailController *)self restriction];
      id v16 = [v11 defaultValueForRestriction:v17];
    }
    if ([(STWebFilterItemDetailController *)self isNamedSite])
    {
      v18 = (void *)MEMORY[0x263F33398];
      id v19 = v16;
      v20 = [(STWebFilterItemDetailController *)self pageURL];
      id v21 = [(STWebFilterItemDetailController *)self pageTitle];
      if ([v21 length]) {
        [(STWebFilterItemDetailController *)self pageTitle];
      }
      else {
      v24 = [(STWebFilterItemDetailController *)self pageURL];
      }
      v23 = [v18 buildWithAddress:v20 withPageTitle:v24];
    }
    else
    {
      id v22 = v16;
      v23 = [(STWebFilterItemDetailController *)self pageURL];
    }
    v25 = [v16 arrayByAddingObject:v23];

    v26 = [(STWebFilterItemDetailController *)self coordinator];
    v27 = [(STWebFilterItemDetailController *)self restriction];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __49__STWebFilterItemDetailController_saveFilterItem__block_invoke;
    v29[3] = &unk_2647671B0;
    v29[4] = self;
    [v26 saveRestrictionValue:v25 forItem:v27 completionHandler:v29];
  }
}

void __49__STWebFilterItemDetailController_saveFilterItem__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) parentWebFilterController];
  [v1 performSelectorOnMainThread:sel_reloadSpecifiers withObject:0 waitUntilDone:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STWebFilterItemDetailController;
  [(STWebFilterItemDetailController *)&v6 viewDidAppear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE78]));
  [(STWebFilterItemDetailController *)self setParentWebFilterController:WeakRetained];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STWebFilterItemDetailController.viewDidAppear", v5, 2u);
  }
}

- (void)willResignActive
{
  v4.receiver = self;
  v4.super_class = (Class)STWebFilterItemDetailController;
  [(STWebFilterItemDetailController *)&v4 willResignActive];
  v3 = [(STWebFilterItemDetailController *)self view];
  [v3 endEditing:0];

  [(STWebFilterItemDetailController *)self saveFilterItem];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STWebFilterItemDetailController;
  [(STWebFilterItemDetailController *)&v6 viewWillDisappear:a3];
  objc_super v4 = [(STWebFilterItemDetailController *)self view];
  [v4 endEditing:0];

  [(STWebFilterItemDetailController *)self saveFilterItem];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STWebFilterItemDetailController.viewWillDisappear", v5, 2u);
  }
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)STWebFilterItemDetailController;
  v5 = [(STWebFilterItemDetailController *)&v18 tableView:a3 cellForRowAtIndexPath:a4];
  objc_super v6 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  objc_super v7 = +[STScreenTimeSettingsUIBundle bundle];
  BOOL v8 = [v5 specifier];
  v9 = [v8 name];
  v10 = [v7 localizedStringForKey:@"TitleLabel" value:&stru_26D9391A8 table:v6];
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    v12 = [v5 editableTextField];
    [v12 setAutocapitalizationType:1];
    [v12 setAdjustsFontSizeToFitWidth:1];
  }
  else
  {
    v13 = [v5 specifier];
    v14 = [v13 name];
    v15 = [v7 localizedStringForKey:@"URLLabel" value:&stru_26D9391A8 table:v6];
    int v16 = [v14 isEqualToString:v15];

    if (!v16) {
      goto LABEL_6;
    }
    v12 = [v5 editableTextField];
    [v12 setAutocapitalizationType:0];
    [v12 setAutocorrectionType:1];
    [v12 setAdjustsFontSizeToFitWidth:1];
    [v12 setKeyboardType:3];
    [v12 setReturnKeyType:9];
  }
  [v12 setClearButtonMode:1];
  [v5 setControllerDelegate:self];

LABEL_6:

  return v5;
}

- (STRestrictionItem)restriction
{
  return self->_restriction;
}

- (void)setRestriction:(id)a3
{
}

- (BOOL)isNamedSite
{
  return self->_isNamedSite;
}

- (void)setIsNamedSite:(BOOL)a3
{
  self->_isNamedSite = a3;
}

- (NSString)pageURL
{
  return self->_pageURL;
}

- (void)setPageURL:(id)a3
{
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (void)setPageTitle:(id)a3
{
}

- (STContentPrivacyViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (STWebFilterDetailController)parentWebFilterController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentWebFilterController);

  return (STWebFilterDetailController *)WeakRetained;
}

- (void)setParentWebFilterController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentWebFilterController);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);

  objc_storeStrong((id *)&self->_restriction, 0);
}

@end