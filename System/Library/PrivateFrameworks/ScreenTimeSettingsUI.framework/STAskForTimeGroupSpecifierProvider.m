@interface STAskForTimeGroupSpecifierProvider
- (STAskForTimeGroupSpecifierProvider)init;
- (id)_createSpecifierForAskForMore:(id)a3;
- (id)requestSpecifiers;
- (void)confirmRespondToRequest:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)respondToRequest:(id)a3 withApproval:(BOOL)a4 timeApproved:(id)a5;
- (void)setCoordinator:(id)a3;
@end

@implementation STAskForTimeGroupSpecifierProvider

- (STAskForTimeGroupSpecifierProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)STAskForTimeGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v8 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263F5FC40];
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v5 = [v4 localizedStringForKey:@"AskForTimeGroupSpecifierName" value:&stru_26D9391A8 table:0];
    v6 = [v3 groupSpecifierWithName:v5];
    [(STGroupSpecifierProvider *)v2 setGroupSpecifier:v6];
  }
  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"viewModel.canViewAskForTimeRequests" context:"STAskForTimeGroupSpecifierProviderObservationContext"];
  [v5 removeObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.pendingAskForTimeByIdentifier" context:"STAskForTimeGroupSpecifierProviderObservationContext"];
  v6.receiver = self;
  v6.super_class = (Class)STAskForTimeGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.pendingAskForTimeByIdentifier" options:4 context:"STAskForTimeGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"viewModel.canViewAskForTimeRequests" options:4 context:"STAskForTimeGroupSpecifierProviderObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == "STAskForTimeGroupSpecifierProviderObservationContext")
  {
    id v11 = [(STAskForTimeGroupSpecifierProvider *)self requestSpecifiers];
    v7 = [(STRootGroupSpecifierProvider *)self coordinator];
    objc_super v8 = [v7 viewModel];
    if ([v8 canViewAskForTimeRequests]) {
      BOOL v9 = [v11 count] == 0;
    }
    else {
      BOOL v9 = 1;
    }
    [(STGroupSpecifierProvider *)self setIsHidden:v9];

    v10 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
    objc_msgSend(v10, "replaceObjectsInRange:withObjectsFromArray:", 0, objc_msgSend(v10, "count"), v11);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)STAskForTimeGroupSpecifierProvider;
    -[STAskForTimeGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)_createSpecifierForAskForMore:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 usageType];
  if (v5 == 2)
  {
    v13 = [v4 budgetedIdentifier];
    v14 = objc_msgSend(v13, "_lp_userVisibleHost");
    id v11 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:2 edit:objc_opt_class()];
    [v11 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x263F602D0]];
    v15 = [MEMORY[0x263F82DA0] currentTraitCollection];
    uint64_t v16 = [v15 userInterfaceStyle];
    id v17 = v14;
    if ([v17 length])
    {
      uint64_t v47 = v16;
      v48 = v15;
      v49 = v13;
      v18 = objc_opt_new();
      [v18 setScheme:@"https"];
      [v18 setHost:v17];
      v19 = [v18 URL];
      v20 = objc_msgSend(v19, "_lp_highLevelDomain");
      v21 = [v18 host];
      v22 = [v18 URL];
      id v23 = v20;
      id v24 = v21;
      id v25 = v22;
      if ([v23 length])
      {
        v26 = [v23 substringToIndex:1];
        v27 = [v26 uppercaseString];
      }
      else
      {
        v35 = [v24 substringToIndex:1];
        v27 = [v35 uppercaseString];

        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[STAllowanceItemSearchResultsController tableView:cellForRowAtIndexPath:]((uint64_t)v25, (uint64_t)v24);
        }
      }
      uint64_t v16 = v47;

      v15 = v48;
      v13 = v49;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[STAllowanceItemSearchResultsController tableView:cellForRowAtIndexPath:]((uint64_t)v17);
      }
      v27 = 0;
    }
    BOOL v36 = v16 == 2;

    v37 = [MEMORY[0x263F67408] sharedCache];
    v38 = [v37 monogramImageForInitial:v27 useDarkColors:v36];
    [v11 setObject:v38 forKeyedSubscript:*MEMORY[0x263F60140]];

    v39 = +[STScreenTimeSettingsUIBundle bundle];
    v40 = [v39 localizedStringForKey:@"AskForTimeTypeWebsite" value:&stru_26D9391A8 table:0];
    [v11 setObject:v40 forKeyedSubscript:*MEMORY[0x263F602C8]];
  }
  else
  {
    if (v5 == 1)
    {
      objc_super v6 = [v4 budgetedIdentifier];
      objc_super v8 = STCategoryNameWithIdentifier();
      id v11 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:2 edit:objc_opt_class()];
      [v11 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
      v28 = [MEMORY[0x263F67408] sharedCache];
      v29 = [v28 imageForCategoryIdentifier:v6];
      [v11 setObject:v29 forKeyedSubscript:*MEMORY[0x263F60140]];

      [v11 setObject:v8 forKeyedSubscript:*MEMORY[0x263F602D0]];
      v30 = +[STScreenTimeSettingsUIBundle bundle];
      v31 = v30;
      v32 = @"AskForTimeTypeCategory";
    }
    else
    {
      if (v5)
      {
        id v11 = 0;
        goto LABEL_22;
      }
      objc_super v6 = [v4 budgetedIdentifier];
      v7 = [MEMORY[0x263F670A8] sharedCache];
      objc_super v8 = [v7 appInfoForBundleIdentifier:v6];

      BOOL v9 = (void *)MEMORY[0x263F5FC40];
      v10 = [v8 displayName];
      id v11 = [v9 preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:2 edit:objc_opt_class()];

      if ([v8 source] == 2 && (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x263F672F0]) & 1) == 0)
      {
        [v11 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
        [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
        objc_super v12 = (__CFString **)MEMORY[0x263F60188];
      }
      else
      {
        [v11 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
        objc_super v12 = &STAppBundleIDKey;
      }
      [v11 setObject:v6 forKeyedSubscript:*v12];
      v33 = [v8 displayName];
      [v11 setObject:v33 forKeyedSubscript:*MEMORY[0x263F602D0]];

      v30 = +[STScreenTimeSettingsUIBundle bundle];
      v31 = v30;
      v32 = @"AskForTimeTypeApp";
    }
    v34 = [v30 localizedStringForKey:v32 value:&stru_26D9391A8 table:0];
    [v11 setObject:v34 forKeyedSubscript:*MEMORY[0x263F602C8]];
  }
LABEL_22:
  v41 = NSString;
  v42 = [v4 identifier];
  v43 = [v41 stringWithFormat:@"ASK_%@", v42];
  [v11 setIdentifier:v43];

  [v11 setUserInfo:v4];
  v44 = (objc_class *)objc_opt_class();
  v45 = NSStringFromClass(v44);
  [v11 setObject:v45 forKeyedSubscript:*MEMORY[0x263F60228]];

  [v11 setObject:&unk_26D966DD8 forKeyedSubscript:*MEMORY[0x263F60320]];
  [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
  [v11 setControllerLoadAction:sel_confirmRespondToRequest_];

  return v11;
}

- (id)requestSpecifiers
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v4 = [v3 timeAllowancesCoordinator];
  uint64_t v5 = [v4 viewModel];

  objc_super v6 = (void *)MEMORY[0x263EFF980];
  v7 = [v5 pendingAskForTimeByIdentifier];
  objc_super v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v9 = objc_msgSend(v5, "pendingAskForTimeByIdentifier", 0);
  v10 = [v9 allValues];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [(STAskForTimeGroupSpecifierProvider *)self _createSpecifierForAskForMore:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        [v8 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v8;
}

- (void)confirmRespondToRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = objc_msgSend(v5, "sf_isiPad");

  v7 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:v6];
  objc_super v8 = objc_opt_new();
  [v8 setAllowedUnits:64];
  [v8 setUnitsStyle:3];
  v31 = [v8 stringFromTimeInterval:900.0];
  BOOL v9 = +[STScreenTimeSettingsUIBundle bundle];
  v10 = (void *)MEMORY[0x263F82400];
  uint64_t v11 = NSString;
  uint64_t v12 = [v9 localizedStringForKey:@"AskForTimeActionApproveFifteen" value:&stru_26D9391A8 table:0];
  uint64_t v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v31);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke;
  v38[3] = &unk_264767368;
  v38[4] = self;
  id v14 = v4;
  id v39 = v14;
  v15 = [v10 actionWithTitle:v13 style:0 handler:v38];
  [v7 addAction:v15];

  uint64_t v16 = (void *)MEMORY[0x263F82400];
  long long v17 = [v9 localizedStringForKey:@"AskForTimeActionApproveHour" value:&stru_26D9391A8 table:0];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke_53;
  v36[3] = &unk_264767368;
  v36[4] = self;
  id v18 = v14;
  id v37 = v18;
  long long v19 = [v16 actionWithTitle:v17 style:0 handler:v36];
  [v7 addAction:v19];

  long long v20 = (void *)MEMORY[0x263F82400];
  v21 = [v9 localizedStringForKey:@"AskForTimeActionApproveDay" value:&stru_26D9391A8 table:0];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke_59;
  v34[3] = &unk_264767368;
  v34[4] = self;
  id v22 = v18;
  id v35 = v22;
  id v23 = [v20 actionWithTitle:v21 style:0 handler:v34];
  [v7 addAction:v23];

  id v24 = (void *)MEMORY[0x263F82400];
  id v25 = [v9 localizedStringForKey:@"AskForTimeActionDontApprove" value:&stru_26D9391A8 table:0];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke_65;
  v32[3] = &unk_264767368;
  v32[4] = self;
  id v33 = v22;
  id v26 = v22;
  v27 = [v24 actionWithTitle:v25 style:2 handler:v32];
  [v7 addAction:v27];

  v28 = (void *)MEMORY[0x263F82400];
  v29 = [v9 localizedStringForKey:@"ConfirmationButtonCancel" value:&stru_26D9391A8 table:0];
  v30 = [v28 actionWithTitle:v29 style:1 handler:0];
  [v7 addAction:v30];

  [(STGroupSpecifierProvider *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondToRequest:*(void *)(a1 + 40) withApproval:1 timeApproved:&unk_26D966DF0];
}

uint64_t __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke_53(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondToRequest:*(void *)(a1 + 40) withApproval:1 timeApproved:&unk_26D966E08];
}

uint64_t __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke_59(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondToRequest:*(void *)(a1 + 40) withApproval:1 timeApproved:&unk_26D966E20];
}

uint64_t __62__STAskForTimeGroupSpecifierProvider_confirmRespondToRequest___block_invoke_65(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondToRequest:*(void *)(a1 + 40) withApproval:0 timeApproved:0];
}

- (void)respondToRequest:(id)a3 withApproval:(BOOL)a4 timeApproved:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  BOOL v9 = [a3 userInfo];
  v10 = [(STRootGroupSpecifierProvider *)self coordinator];
  uint64_t v11 = [v10 timeAllowancesCoordinator];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__STAskForTimeGroupSpecifierProvider_respondToRequest_withApproval_timeApproved___block_invoke;
  v14[3] = &unk_2647672A0;
  BOOL v17 = v5;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [v11 respondToAskForTime:v12 withApproval:v5 timeApproved:v13 completionHandler:v14];
}

void __81__STAskForTimeGroupSpecifierProvider_respondToRequest_withApproval_timeApproved___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 48)) {
      v2 = @"Approving";
    }
    else {
      v2 = @"Not approving";
    }
    char v3 = [*(id *)(a1 + 32) isEqual:&unk_26D966E20];
    if (v3)
    {
      id v4 = @"all day";
    }
    else
    {
      BOOL v5 = NSNumber;
      [*(id *)(a1 + 32) floatValue];
      id v4 = [v5 numberWithDouble:v6 / 60.0];
    }
    v7 = [*(id *)(a1 + 40) identifier];
    int v8 = 138543874;
    BOOL v9 = v2;
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_INFO, "%{public}@ request for %{public}@ [minutes] for request %{public}@", (uint8_t *)&v8, 0x20u);

    if ((v3 & 1) == 0) {
  }
    }
}

@end