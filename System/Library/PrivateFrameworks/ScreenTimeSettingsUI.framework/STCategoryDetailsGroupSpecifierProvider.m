@interface STCategoryDetailsGroupSpecifierProvider
- (STCategoryDetailsGroupSpecifierProvider)initWithCategoryUsageItem:(id)a3 coordinator:(id)a4;
- (STRootViewModelCoordinator)coordinator;
- (STUsageDetailsViewModel)usageDetailsViewModel;
- (id)totalUsageDescription:(id)a3;
- (void)showMostUsedDetailListController:(id)a3;
@end

@implementation STCategoryDetailsGroupSpecifierProvider

- (STCategoryDetailsGroupSpecifierProvider)initWithCategoryUsageItem:(id)a3 coordinator:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v43 = v7;
  if ([v7 itemType] != 3)
  {
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"STCategoryDetailsGroupSpecifierProvider.m", 34, @"Invalid parameter not satisfying: %@", @"categoryUsageItem.itemType == STUsageItemTypeCategory" object file lineNumber description];

    id v7 = v43;
  }
  v52.receiver = self;
  v52.super_class = (Class)STCategoryDetailsGroupSpecifierProvider;
  v9 = [(STGroupSpecifierProvider *)&v52 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coordinator, a4);
    v11 = (void *)MEMORY[0x263F5FC40];
    v12 = +[STScreenTimeSettingsUIBundle bundle];
    v13 = [v12 localizedStringForKey:@"MostUsedCategoryInfoGroupSpecifierName" value:&stru_26D9391A8 table:0];
    v14 = [v11 groupSpecifierWithName:v13];
    v46 = v10;
    [(STGroupSpecifierProvider *)v10 setGroupSpecifier:v14];

    v45 = objc_opt_new();
    v44 = objc_opt_new();
    id v37 = v8;
    v15 = [v8 usageDetailsCoordinator];
    v16 = [v15 viewModel];
    v17 = [v16 selectedUsageReport];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v36 = v17;
    id obj = [v17 appAndWebUsages];
    uint64_t v18 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v49;
      uint64_t v40 = *MEMORY[0x263F672F0];
      uint64_t v39 = *MEMORY[0x263F601A8];
      v38 = (__CFString *)*MEMORY[0x263F60188];
      uint64_t v41 = *MEMORY[0x263F5FFE0];
      uint64_t v42 = *MEMORY[0x263F60140];
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v49 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v23 = [v7 budgetItemIdentifier];
          v24 = [v22 categoryIdentifier];
          int v25 = [v23 isEqualToString:v24];

          if (v25)
          {
            [v45 addObject:v22];
            v26 = (void *)MEMORY[0x263F5FC40];
            v27 = [v22 displayName];
            v28 = [v26 preferenceSpecifierNamed:v27 target:v46 set:0 get:sel_totalUsageDescription_ detail:0 cell:2 edit:0];

            if ([v22 itemType] == 4)
            {
              v29 = [v22 image];
              [v28 setObject:v29 forKeyedSubscript:v42];
            }
            else
            {
              v29 = [v22 budgetItemIdentifier];
              v30 = [MEMORY[0x263F670A8] sharedCache];
              v31 = [v30 appInfoForBundleIdentifier:v29];

              if ([v31 source] == 2 && (objc_msgSend(v29, "isEqualToString:", v40) & 1) == 0)
              {
                [v28 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v39];
                v32 = v38;
              }
              else
              {
                [v28 setObject:objc_opt_class() forKeyedSubscript:v41];
                v32 = @"STAppBundleID";
              }
              [v28 setObject:v29 forKeyedSubscript:v32];

              id v7 = v43;
            }

            [v28 setUserInfo:v22];
            [v28 setControllerLoadAction:sel_showMostUsedDetailListController_];
            [v44 addObject:v28];
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v19);
    }

    v10 = v46;
    v33 = [(STGroupSpecifierProvider *)v46 mutableSpecifiers];
    [v33 addObjectsFromArray:v44];

    id v8 = v37;
  }

  return v10;
}

- (id)totalUsageDescription:(id)a3
{
  v3 = [a3 userInfo];
  v4 = [v3 totalUsage];
  [v4 doubleValue];
  double v6 = v5;
  if (v5 >= 60.0)
  {
    id v7 = objc_opt_new();
    [v7 setAllowedUnits:96];
    [v7 setUnitsStyle:1];
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x263F08780], "st_sharedAbbreviatedSecondsDateFormatter");
  }
  id v8 = [v7 stringFromTimeInterval:v6];

  return v8;
}

- (void)showMostUsedDetailListController:(id)a3
{
  id v4 = a3;
  id v10 = [v4 userInfo];
  double v5 = [STDrillInDetailListController alloc];
  double v6 = [(STCategoryDetailsGroupSpecifierProvider *)self coordinator];
  id v7 = [(STDrillInDetailListController *)v5 initWithUsageItem:v10 coordinator:v6];

  id v8 = [(STGroupSpecifierProvider *)self delegate];
  [(STDrillInDetailListController *)v7 setParentController:v8];
  v9 = [v8 rootController];
  [(STDrillInDetailListController *)v7 setRootController:v9];

  [(STDrillInDetailListController *)v7 setSpecifier:v4];
  [(STGroupSpecifierProvider *)self showController:v7 animated:1];
}

- (STUsageDetailsViewModel)usageDetailsViewModel
{
  return self->_usageDetailsViewModel;
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_usageDetailsViewModel, 0);
}

@end