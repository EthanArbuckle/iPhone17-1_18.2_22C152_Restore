@interface STAllowanceProgressGroupSpecifierProvider
- (NSSet)budgetedIdentifiers;
- (PSSpecifier)addAllowanceSpecifier;
- (STAllowanceProgressGroupSpecifierProvider)init;
- (STAllowanceProgressGroupSpecifierProvider)initWithBudgetedIdentifiers:(id)a3 usageItem:(id)a4;
- (STUsageItem)usageItem;
- (id)_allowanceDetailText:(id)a3;
- (id)_specifierForAllowance:(id)a3;
- (void)_allowancesByIdentifierDidChangeFrom:(id)a3 to:(id)a4;
- (void)_didFetchAppInfo:(id)a3;
- (void)_showAllowanceDetailListController:(id)a3;
- (void)_showAllowanceSetupListController:(id)a3;
- (void)allowanceDetailController:(id)a3 didDeleteAllowance:(id)a4;
- (void)allowanceDetailController:(id)a3 didSaveAllowance:(id)a4;
- (void)allowanceDetailControllerDidCancel:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
@end

@implementation STAllowanceProgressGroupSpecifierProvider

- (STAllowanceProgressGroupSpecifierProvider)init
{
  v3 = [MEMORY[0x263EFFA08] set];
  v4 = [(STAllowanceProgressGroupSpecifierProvider *)self initWithBudgetedIdentifiers:v3 usageItem:0];

  return v4;
}

- (STAllowanceProgressGroupSpecifierProvider)initWithBudgetedIdentifiers:(id)a3 usageItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)STAllowanceProgressGroupSpecifierProvider;
  v8 = [(STGroupSpecifierProvider *)&v22 init];
  if (v8)
  {
    v9 = +[STScreenTimeSettingsUIBundle bundle];
    v10 = (void *)MEMORY[0x263F5FC40];
    v11 = [v9 localizedStringForKey:@"AllowancesGroupName" value:&stru_26D9391A8 table:0];
    v12 = [v10 groupSpecifierWithName:v11];
    [(STGroupSpecifierProvider *)v8 setGroupSpecifier:v12];

    [(STGroupSpecifierProvider *)v8 setIsHidden:1];
    uint64_t v13 = [v6 copy];
    budgetedIdentifiers = v8->_budgetedIdentifiers;
    v8->_budgetedIdentifiers = (NSSet *)v13;

    objc_storeStrong((id *)&v8->_usageItem, a4);
    if (v7)
    {
      v15 = [v9 localizedStringForKey:@"AddLimitSpecifierName" value:&stru_26D9391A8 table:0];
      uint64_t v16 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v15 target:v8 set:0 get:0 detail:0 cell:13 edit:objc_opt_class()];
      addAllowanceSpecifier = v8->_addAllowanceSpecifier;
      v8->_addAllowanceSpecifier = (PSSpecifier *)v16;

      [(PSSpecifier *)v8->_addAllowanceSpecifier setButtonAction:sel__showAllowanceSetupListController_];
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      [(PSSpecifier *)v8->_addAllowanceSpecifier setObject:v19 forKeyedSubscript:*MEMORY[0x263F60228]];

      [(PSSpecifier *)v8->_addAllowanceSpecifier setObject:&unk_26D966D78 forKeyedSubscript:*MEMORY[0x263F60320]];
      [(PSSpecifier *)v8->_addAllowanceSpecifier setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
      if ([MEMORY[0x263F82438] isRunningInStoreDemoMode]) {
        [(PSSpecifier *)v8->_addAllowanceSpecifier setButtonAction:sel_showStoreDemoAlert];
      }
      v20 = [(STGroupSpecifierProvider *)v8 mutableSpecifiers];
      [v20 addObject:v8->_addAllowanceSpecifier];
    }
  }

  return v8;
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STUsageGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.allowancesByIdentifier" context:"KVOContextAllowanceProgressGroupSpecifierProvider"];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.hasUsageData" context:"KVOContextAllowanceProgressGroupSpecifierProvider"];
  v6.receiver = self;
  v6.super_class = (Class)STAllowanceProgressGroupSpecifierProvider;
  [(STUsageGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.allowancesByIdentifier" options:7 context:"KVOContextAllowanceProgressGroupSpecifierProvider"];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.hasUsageData" options:5 context:"KVOContextAllowanceProgressGroupSpecifierProvider"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextAllowanceProgressGroupSpecifierProvider")
  {
    [(STUsageGroupSpecifierProvider *)self coordinator];

    if ([v10 isEqualToString:@"timeAllowancesCoordinator.viewModel.allowancesByIdentifier"])
    {
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      uint64_t v13 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v13)
      {

        v12 = 0;
      }
      v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        v14 = 0;
      }
      [(STAllowanceProgressGroupSpecifierProvider *)self _allowancesByIdentifierDidChangeFrom:v12 to:v14];
    }
    else
    {
      [(STUsageGroupSpecifierProvider *)self coordinator];

      if (![v10 isEqualToString:@"usageDetailsCoordinator.viewModel.hasUsageData"]) {
        goto LABEL_16;
      }
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      uint64_t v16 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v16)
      {

        v12 = 0;
      }
      if (([v12 BOOLValue] & 1) == 0)
      {
        [(STGroupSpecifierProvider *)self setIsHidden:1];
        goto LABEL_10;
      }
      v14 = [(STGroupSpecifierProvider *)self specifiers];
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v14 count] == 0);
    }

LABEL_10:
    goto LABEL_16;
  }
  v17.receiver = self;
  v17.super_class = (Class)STAllowanceProgressGroupSpecifierProvider;
  [(STAllowanceProgressGroupSpecifierProvider *)&v17 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_16:
}

- (void)_allowancesByIdentifierDidChangeFrom:(id)a3 to:(id)a4
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(STAllowanceProgressGroupSpecifierProvider *)self budgetedIdentifiers];
  if ([v8 count])
  {
    v9 = (void *)MEMORY[0x263F08A98];
    v108[0] = MEMORY[0x263EF8330];
    v108[1] = 3221225472;
    v108[2] = __85__STAllowanceProgressGroupSpecifierProvider__allowancesByIdentifierDidChangeFrom_to___block_invoke;
    v108[3] = &unk_264767188;
    id v109 = v8;
    id v10 = [v9 predicateWithBlock:v108];
    id v11 = [v6 allValues];
    v12 = [v11 filteredArrayUsingPredicate:v10];

    uint64_t v13 = [v7 allValues];
    v14 = [v13 filteredArrayUsingPredicate:v10];
  }
  else
  {
    v12 = [v6 allValues];
    v14 = [v7 allValues];
  }
  if (v12 != v14 && ([v12 isEqual:v14] & 1) == 0)
  {
    v69 = v8;
    id v70 = v7;
    v76 = v6;
    v71 = v12;
    v15 = (void *)[v12 mutableCopy];
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v68 = v14;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v104 objects:v115 count:16];
    v83 = v15;
    if (v17)
    {
      uint64_t v18 = v17;
      v19 = 0;
      uint64_t v20 = *(void *)v105;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v105 != v20) {
            objc_enumerationMutation(v16);
          }
          objc_super v22 = *(void **)(*((void *)&v104 + 1) + 8 * i);
          if (v15
            && (uint64_t v23 = [v15 indexOfObject:*(void *)(*((void *)&v104 + 1) + 8 * i)],
                v23 != 0x7FFFFFFFFFFFFFFFLL))
          {
            [v15 removeObjectAtIndex:v23];
          }
          else
          {
            if (v19)
            {
              v24 = [v22 bundleIdentifiers];
              [v19 addObjectsFromArray:v24];
            }
            else
            {
              id v25 = objc_alloc(MEMORY[0x263EFF9C0]);
              v24 = [v22 bundleIdentifiers];
              v26 = v25;
              v15 = v83;
              v19 = (void *)[v26 initWithArray:v24];
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v104 objects:v115 count:16];
      }
      while (v18);
    }
    else
    {
      v19 = 0;
    }

    v27 = [MEMORY[0x263F670A8] sharedCache];
    v28 = (void *)[v16 mutableCopy];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    obuint64_t j = v12;
    uint64_t v29 = [obj countByEnumeratingWithState:&v100 objects:v114 count:16];
    v77 = v28;
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v80 = *(void *)v101;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v101 != v80) {
            objc_enumerationMutation(obj);
          }
          v32 = *(void **)(*((void *)&v100 + 1) + 8 * j);
          if (v28
            && (uint64_t v33 = [v28 indexOfObject:*(void *)(*((void *)&v100 + 1) + 8 * j)],
                v33 != 0x7FFFFFFFFFFFFFFFLL))
          {
            [v28 removeObjectAtIndex:v33];
          }
          else
          {
            long long v98 = 0u;
            long long v99 = 0u;
            long long v96 = 0u;
            long long v97 = 0u;
            v34 = [v32 bundleIdentifiers];
            uint64_t v35 = [v34 countByEnumeratingWithState:&v96 objects:v113 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v97;
              do
              {
                for (uint64_t k = 0; k != v36; ++k)
                {
                  if (*(void *)v97 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  uint64_t v39 = *(void *)(*((void *)&v96 + 1) + 8 * k);
                  if ([v19 containsObject:v39]) {
                    [v19 removeObject:v39];
                  }
                  else {
                    [v27 removeObserver:self bundleIdentifier:v39];
                  }
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v96 objects:v113 count:16];
              }
              while (v36);
            }

            v15 = v83;
            v28 = v77;
          }
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v100 objects:v114 count:16];
      }
      while (v30);
    }

    v72 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v15, "count"));
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v75 = [(STGroupSpecifierProvider *)self specifiers];
    uint64_t v81 = [v75 countByEnumeratingWithState:&v92 objects:v112 count:16];
    if (v81)
    {
      id obja = *(id *)v93;
      do
      {
        for (uint64_t m = 0; m != v81; ++m)
        {
          if (*(id *)v93 != obja) {
            objc_enumerationMutation(v75);
          }
          v41 = *(void **)(*((void *)&v92 + 1) + 8 * m);
          v42 = [v41 userInfo];
          if (v42)
          {
            [v28 removeObject:v42];
            v43 = [v42 identifier];
            v44 = [v76 objectForKeyedSubscript:v43];
            int v45 = [v83 containsObject:v44];

            if (v45)
            {
              v46 = [v28 firstObject];
              if (v46)
              {
                [v28 removeObject:v46];
                [v41 setUserInfo:v46];
                v73 = (void *)MEMORY[0x263F67108];
                v74 = [v46 categoryIdentifiers];
                v47 = [v46 bundleIdentifiers];
                v48 = [v46 webDomains];
                v49 = [v73 displayNameForUsageLimitWithCategoryIdentifiers:v74 bundleIdentifiers:v47 webDomains:v48];
                [v41 setName:v49];

                v28 = v77;
                [(STGroupSpecifierProvider *)self reloadSpecifier:v41 animated:1];
              }
              else
              {
                [v72 addObject:v41];
              }
            }
          }
        }
        uint64_t v81 = [v75 countByEnumeratingWithState:&v92 objects:v112 count:16];
      }
      while (v81);
    }

    v50 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v28, "count"));
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v51 = v28;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v88 objects:v111 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v89;
      do
      {
        for (uint64_t n = 0; n != v53; ++n)
        {
          if (*(void *)v89 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = [(STAllowanceProgressGroupSpecifierProvider *)self _specifierForAllowance:*(void *)(*((void *)&v88 + 1) + 8 * n)];
          [v50 addObject:v56];
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v88 objects:v111 count:16];
      }
      while (v53);
    }

    v57 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
    [v57 removeObjectsInArray:v72];
    v58 = [(STAllowanceProgressGroupSpecifierProvider *)self addAllowanceSpecifier];

    if (v58)
    {
      v59 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", objc_msgSend(v57, "count") - 1, objc_msgSend(v50, "count"));
      [v57 insertObjects:v50 atIndexes:v59];
    }
    else
    {
      [v57 addObjectsFromArray:v50];
    }
    v82 = v57;
    if ([v57 count])
    {
      v60 = [(STUsageGroupSpecifierProvider *)self coordinator];
      v61 = [v60 usageDetailsCoordinator];
      v62 = [v61 viewModel];
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v62 hasUsageData] ^ 1);
    }
    else
    {
      [(STGroupSpecifierProvider *)self setIsHidden:1];
    }
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v63 = v19;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v84 objects:v110 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v85;
      do
      {
        for (iuint64_t i = 0; ii != v65; ++ii)
        {
          if (*(void *)v85 != v66) {
            objc_enumerationMutation(v63);
          }
          [v27 addObserver:self selector:sel__didFetchAppInfo_ bundleIdentifier:*(void *)(*((void *)&v84 + 1) + 8 * ii)];
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v84 objects:v110 count:16];
      }
      while (v65);
    }

    id v6 = v76;
    v8 = v69;
    id v7 = v70;
    v12 = v71;
    v14 = v68;
  }
}

uint64_t __85__STAllowanceProgressGroupSpecifierProvider__allowancesByIdentifierDidChangeFrom_to___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 bundleIdentifiers];
  v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(v8);
      }
      if (objc_msgSend(v7, "containsObject:", *(void *)(*((void *)&v28 + 1) + 8 * v12), (void)v28)) {
        goto LABEL_26;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v13 = [v3 webDomains];
  v14 = *(void **)(a1 + 32);
  id v15 = v13;
  id v7 = v14;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v15;
  uint64_t v16 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
LABEL_11:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v29 != v18) {
        objc_enumerationMutation(v8);
      }
      if ([v7 containsObject:*(void *)(*((void *)&v28 + 1) + 8 * v19)]) {
        break;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v17) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_26:

    uint64_t v24 = 1;
    goto LABEL_27;
  }
LABEL_17:

  uint64_t v20 = [v3 categoryIdentifiers];
  v21 = *(void **)(a1 + 32);
  id v22 = v20;
  id v23 = v21;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v22;
  uint64_t v24 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v8);
        }
        if ([v23 containsObject:*(void *)(*((void *)&v28 + 1) + 8 * i)])
        {
          uint64_t v24 = 1;
          goto LABEL_29;
        }
      }
      uint64_t v24 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }
LABEL_29:

LABEL_27:
  return v24;
}

- (id)_specifierForAllowance:(id)a3
{
  id v4 = (void *)MEMORY[0x263F67108];
  id v5 = a3;
  id v6 = [v5 categoryIdentifiers];
  id v7 = [v5 bundleIdentifiers];
  id v8 = [v5 webDomains];
  uint64_t v9 = [v4 displayNameForUsageLimitWithCategoryIdentifiers:v6 bundleIdentifiers:v7 webDomains:v8];

  uint64_t v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v9 target:self set:0 get:sel__allowanceDetailText_ detail:0 cell:2 edit:objc_opt_class()];
  [v10 setUserInfo:v5];

  [v10 setControllerLoadAction:sel__showAllowanceDetailListController_];
  uint64_t v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x263F60228]];

  [v10 setObject:&unk_26D966D78 forKeyedSubscript:*MEMORY[0x263F60320]];
  [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];

  return v10;
}

- (id)_allowanceDetailText:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 timeByDay];

    if (v5)
    {
      id v6 = +[STScreenTimeSettingsUIBundle bundle];
      id v7 = [v6 localizedStringForKey:@"AllowanceCustomScheduleDetailText" value:&stru_26D9391A8 table:0];
    }
    else
    {
      id v6 = objc_msgSend(MEMORY[0x263F08780], "st_sharedShortDynamicDateFormatter");
      id v8 = [v4 time];
      +[STAllowance timeIntervalForAllowanceDateComponents:v8];
      objc_msgSend(v6, "stringFromTimeInterval:");
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v7 = 0;
  }
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = &stru_26D9391A8;
  }
  uint64_t v10 = v9;

  return v10;
}

- (void)_showAllowanceDetailListController:(id)a3
{
  id v4 = a3;
  id v5 = [STAllowanceDetailListController alloc];
  id v6 = [(STUsageGroupSpecifierProvider *)self coordinator];
  uint64_t v10 = [(STAllowanceDetailListController *)v5 initWithCoordinator:v6];

  id v7 = [v4 userInfo];
  [(STAllowanceDetailListController *)v10 setAllowance:v7];

  [(STAllowanceDetailListController *)v10 setDelegate:self];
  id v8 = [(STGroupSpecifierProvider *)self delegate];
  [(STAllowanceDetailListController *)v10 setParentController:v8];
  uint64_t v9 = [v8 rootController];
  [(STAllowanceDetailListController *)v10 setRootController:v9];

  [(STAllowanceDetailListController *)v10 setSpecifier:v4];
  [(STGroupSpecifierProvider *)self showController:v10 animated:1];
}

- (void)_showAllowanceSetupListController:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(STAllowanceProgressGroupSpecifierProvider *)self usageItem];
  id v7 = [(STUsageGroupSpecifierProvider *)self coordinator];
  id v8 = objc_opt_new();
  objc_msgSend(v8, "setBehaviorType:", objc_msgSend(v7, "isPasscodeEnabled"));
  switch([v6 itemType])
  {
    case 1:
      uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STAllowanceProgressGroupSpecifierProvider.m", 279, @"Unexpected usage item: @", v6);

      break;
    case 2:
    case 5:
    case 6:
      uint64_t v9 = [v6 budgetItemIdentifier];
      v16[0] = v9;
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
      [v8 setBundleIdentifiers:v10];
      goto LABEL_6;
    case 3:
      uint64_t v9 = [v6 budgetItemIdentifier];
      v14 = v9;
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
      [v8 setCategoryIdentifiers:v10];
      goto LABEL_6;
    case 4:
      uint64_t v9 = [v6 budgetItemIdentifier];
      id v15 = v9;
      uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
      [v8 setWebDomains:v10];
LABEL_6:

      break;
    default:
      break;
  }
  uint64_t v12 = [[STAllowanceDetailListController alloc] initWithCoordinator:v7];
  [(STAllowanceDetailListController *)v12 setAllowance:v8];
  [(STAllowanceDetailListController *)v12 setDelegate:self];
  [(STAllowanceDetailListController *)v12 setIsSetupController:1];
  [(STAllowanceDetailListController *)v12 setCreatingNewAllowance:1];
  uint64_t v13 = objc_opt_new();
  [v13 setSpecifier:v5];

  [v13 showController:v12];
  [(STGroupSpecifierProvider *)self showController:v13 animated:1];
}

- (void)allowanceDetailController:(id)a3 didSaveAllowance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STUsageGroupSpecifierProvider *)self coordinator];
  uint64_t v9 = [v8 timeAllowancesCoordinator];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didSaveAllowance___block_invoke;
  v11[3] = &unk_264767160;
  id v12 = v6;
  uint64_t v13 = self;
  id v10 = v6;
  [v9 saveAllowance:v7 completionHandler:v11];
}

void __88__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didSaveAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[STUILog persistence];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __88__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didSaveAllowance___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
  if ([*(id *)(a1 + 32) isSetupController]) {
    [*(id *)(a1 + 40) dismissViewControllerAnimated:1];
  }
}

- (void)allowanceDetailController:(id)a3 didDeleteAllowance:(id)a4
{
  id v5 = a4;
  id v6 = [(STUsageGroupSpecifierProvider *)self coordinator];
  id v7 = [v6 timeAllowancesCoordinator];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didDeleteAllowance___block_invoke;
  v8[3] = &unk_2647671B0;
  v8[4] = self;
  [v7 deleteAllowance:v5 completionHandler:v8];
}

void __90__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didDeleteAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[STUILog persistence];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __90__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didDeleteAllowance___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
  [*(id *)(a1 + 32) popToViewControllerAnimated:1];
}

- (void)allowanceDetailControllerDidCancel:(id)a3
{
}

- (void)_didFetchAppInfo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F67360]];
  id v6 = [v5 bundleIdentifier];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v18 = self;
  obuint64_t j = [(STGroupSpecifierProvider *)self specifiers];
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [v11 userInfo];
        uint64_t v13 = [v12 bundleIdentifiers];
        if ([v13 containsObject:v6])
        {
          v14 = (void *)MEMORY[0x263F67108];
          id v15 = [v12 categoryIdentifiers];
          uint64_t v16 = [v12 webDomains];
          uint64_t v17 = [v14 displayNameForUsageLimitWithCategoryIdentifiers:v15 bundleIdentifiers:v13 webDomains:v16];
          [v11 setName:v17];

          [(STGroupSpecifierProvider *)v18 reloadSpecifier:v11 animated:1];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
}

- (NSSet)budgetedIdentifiers
{
  return self->_budgetedIdentifiers;
}

- (STUsageItem)usageItem
{
  return self->_usageItem;
}

- (PSSpecifier)addAllowanceSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addAllowanceSpecifier, 0);
  objc_storeStrong((id *)&self->_usageItem, 0);

  objc_storeStrong((id *)&self->_budgetedIdentifiers, 0);
}

void __88__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didSaveAllowance___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225B06000, a2, OS_LOG_TYPE_FAULT, "Failed to save edited allowance: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __90__STAllowanceProgressGroupSpecifierProvider_allowanceDetailController_didDeleteAllowance___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225B06000, a2, OS_LOG_TYPE_FAULT, "Failed to delete allowance: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end