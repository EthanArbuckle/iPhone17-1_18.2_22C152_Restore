@interface STMostUsedGroupSpecifierProvider
- (NSDictionary)allowancesByActiveBudgetedIdentifier;
- (STMostUsedGroupSpecifierProvider)init;
- (id)allowanceIconForUsageItem:(id)a3;
- (id)getUsageItem:(id)a3;
- (id)newSpecifierWithUsageItem:(id)a3;
- (unint64_t)selectedItemType;
- (void)_allowancesByIdentifierDidChangeFrom:(id)a3 to:(id)a4;
- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4;
- (void)loadActiveBudgetedIdentifiers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadMostUsedSpecifiers;
- (void)setAllowancesByActiveBudgetedIdentifier:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setSelectedItemType:(unint64_t)a3;
- (void)showMostUsedDetailListController:(id)a3;
- (void)toggleSelectedItemType:(id)a3;
- (void)updateSpecifier:(id)a3 usageItem:(id)a4;
@end

@implementation STMostUsedGroupSpecifierProvider

- (STMostUsedGroupSpecifierProvider)init
{
  v12.receiver = self;
  v12.super_class = (Class)STMostUsedGroupSpecifierProvider;
  v2 = [(STShowMoreUsageGroupSpecifierProvider *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_selectedItemType = 0;
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v5 = (void *)MEMORY[0x263F5FC40];
    v6 = [v4 localizedStringForKey:@"MostUsedGroupSpecifierName" value:&stru_26D9391A8 table:0];
    v7 = [v5 groupSpecifierWithName:v6];

    [v7 setTarget:v3];
    [v7 setButtonAction:sel_toggleSelectedItemType_];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x263F60118]];

    v10 = [v4 localizedStringForKey:@"ShowMostUsedCategoriesButtonText" value:&stru_26D9391A8 table:0];
    [v7 setObject:v10 forKeyedSubscript:0x26D941808];

    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D941828];
    [(STGroupSpecifierProvider *)v3 setGroupSpecifier:v7];
    [(STShowMoreUsageGroupSpecifierProvider *)v3 setNumberOfItemsToShow:8];
  }
  return v3;
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STUsageGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedUsageReport" context:"KVOContextMostUsedGroupSpecifierProvider"];
  [v5 removeObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.allowancesByIdentifier" context:"KVOContextMostUsedGroupSpecifierProvider"];
  v6.receiver = self;
  v6.super_class = (Class)STMostUsedGroupSpecifierProvider;
  [(STUsageGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedUsageReport" options:7 context:"KVOContextMostUsedGroupSpecifierProvider"];
  [v4 addObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.allowancesByIdentifier" options:7 context:"KVOContextMostUsedGroupSpecifierProvider"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextMostUsedGroupSpecifierProvider")
  {
    [(STUsageGroupSpecifierProvider *)self coordinator];

    if ([v10 isEqualToString:@"usageDetailsCoordinator.viewModel.selectedUsageReport"])
    {
      objc_super v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      v13 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v13)
      {

        objc_super v12 = 0;
      }
      v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        v14 = 0;
      }
      [(STMostUsedGroupSpecifierProvider *)self _selectedUsageReportDidChangeFrom:v12 to:v14];
    }
    else
    {
      [(STUsageGroupSpecifierProvider *)self coordinator];

      if (![v10 isEqualToString:@"timeAllowancesCoordinator.viewModel.allowancesByIdentifier"])goto LABEL_16; {
      objc_super v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      }
      v16 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v16)
      {

        objc_super v12 = 0;
      }
      v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v17 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v17)
      {

        v14 = 0;
      }
      [(STMostUsedGroupSpecifierProvider *)self _allowancesByIdentifierDidChangeFrom:v12 to:v14];
    }

    goto LABEL_16;
  }
  v18.receiver = self;
  v18.super_class = (Class)STMostUsedGroupSpecifierProvider;
  [(STMostUsedGroupSpecifierProvider *)&v18 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_16:
}

- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = [v6 appAndWebUsages];
  uint64_t v8 = [v7 count];

  [(STGroupSpecifierProvider *)self setIsHidden:v8 == 0];
  if (v13 != v6 && ([v13 isEqual:v6] & 1) == 0)
  {
    v9 = [v6 categoryUsageByTrustIdentifier];
    BOOL v10 = ![v9 count]
       && (unint64_t)([(STMostUsedGroupSpecifierProvider *)self selectedItemType] == 0);

    id v11 = [NSNumber numberWithBool:v10];
    objc_super v12 = [(STGroupSpecifierProvider *)self groupSpecifier];
    [v12 setObject:v11 forKeyedSubscript:0x26D941828];

    if (v8) {
      [(STMostUsedGroupSpecifierProvider *)self reloadMostUsedSpecifiers];
    }
  }
}

- (void)_allowancesByIdentifierDidChangeFrom:(id)a3 to:(id)a4
{
  id v6 = a4;
  id v8 = [a3 allValues];
  id v7 = [v6 allValues];

  if (v8 != v7 && ([v8 isEqual:v7] & 1) == 0)
  {
    [(STMostUsedGroupSpecifierProvider *)self loadActiveBudgetedIdentifiers];
    [(STShowMoreUsageGroupSpecifierProvider *)self refreshUsageSpecifiersWithUpdates:1];
  }
}

- (id)newSpecifierWithUsageItem:(id)a3
{
  id v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = a3;
  id v6 = [v5 displayName];
  id v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:sel_getUsageItem_ detail:0 cell:2 edit:0];

  [v7 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
  id v8 = [v5 displayName];
  [v7 setName:v8];

  [v7 setUserInfo:v5];
  [v7 setControllerLoadAction:sel_showMostUsedDetailListController_];
  v9 = [(STMostUsedGroupSpecifierProvider *)self allowanceIconForUsageItem:v5];

  if (v9) {
    [v7 setObject:v9 forKeyedSubscript:0x26D93F988];
  }
  else {
    [v7 removePropertyForKey:0x26D93F988];
  }

  return v7;
}

- (void)updateSpecifier:(id)a3 usageItem:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v6 displayName];
  [v9 setName:v7];

  [v9 setUserInfo:v6];
  id v8 = [(STMostUsedGroupSpecifierProvider *)self allowanceIconForUsageItem:v6];

  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:0x26D93F988];
  }
  else {
    [v9 removePropertyForKey:0x26D93F988];
  }
}

- (void)loadActiveBudgetedIdentifiers
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v41 = self;
  id v4 = [(STUsageGroupSpecifierProvider *)self coordinator];
  id v5 = [v4 timeAllowancesCoordinator];
  id v6 = [v5 viewModel];
  id v7 = [v6 allowancesByIdentifier];
  id v8 = [v7 allValues];

  id obj = v8;
  uint64_t v44 = [v8 countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v59;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v59 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = v9;
        BOOL v10 = *(void **)(*((void *)&v58 + 1) + 8 * v9);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v11 = [v10 bundleIdentifiers];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v64 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v55;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v55 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(id *)(*((void *)&v54 + 1) + 8 * v15);
              id v17 = v10;
              id v18 = v3;
              v19 = [v18 objectForKeyedSubscript:v16];
              if (v19)
              {
                v20 = v19;
                [v19 addObject:v17];
              }
              else
              {
                v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", v17, 0);
                [v18 setObject:v20 forKeyedSubscript:v16];
              }

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v54 objects:v64 count:16];
          }
          while (v13);
        }

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        v21 = [v10 webDomains];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v63 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v51;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v51 != v24) {
                objc_enumerationMutation(v21);
              }
              id v26 = *(id *)(*((void *)&v50 + 1) + 8 * v25);
              id v27 = v10;
              id v28 = v3;
              v29 = [v28 objectForKeyedSubscript:v26];
              if (v29)
              {
                v30 = v29;
                [v29 addObject:v27];
              }
              else
              {
                v30 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", v27, 0);
                [v28 setObject:v30 forKeyedSubscript:v26];
              }

              ++v25;
            }
            while (v23 != v25);
            uint64_t v23 = [v21 countByEnumeratingWithState:&v50 objects:v63 count:16];
          }
          while (v23);
        }

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v31 = [v10 categoryIdentifiers];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v46 objects:v62 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v47;
          do
          {
            uint64_t v35 = 0;
            do
            {
              if (*(void *)v47 != v34) {
                objc_enumerationMutation(v31);
              }
              id v36 = *(id *)(*((void *)&v46 + 1) + 8 * v35);
              id v37 = v10;
              id v38 = v3;
              v39 = [v38 objectForKeyedSubscript:v36];
              if (v39)
              {
                v40 = v39;
                [v39 addObject:v37];
              }
              else
              {
                v40 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", v37, 0);
                [v38 setObject:v40 forKeyedSubscript:v36];
              }

              ++v35;
            }
            while (v33 != v35);
            uint64_t v33 = [v31 countByEnumeratingWithState:&v46 objects:v62 count:16];
          }
          while (v33);
        }

        uint64_t v9 = v45 + 1;
      }
      while (v45 + 1 != v44);
      uint64_t v44 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v44);
  }

  [(STMostUsedGroupSpecifierProvider *)v41 setAllowancesByActiveBudgetedIdentifier:v3];
}

- (id)getUsageItem:(id)a3
{
  return (id)[a3 userInfo];
}

- (void)toggleSelectedItemType:(id)a3
{
  id v6 = a3;
  unint64_t selectedItemType = self->_selectedItemType;
  if (selectedItemType)
  {
    if (selectedItemType != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  [(STMostUsedGroupSpecifierProvider *)self setSelectedItemType:v5];
LABEL_6:
  [(STMostUsedGroupSpecifierProvider *)self reloadMostUsedSpecifiers];
}

- (void)reloadMostUsedSpecifiers
{
  id v14 = [(STGroupSpecifierProvider *)self groupSpecifier];
  v3 = [(STUsageGroupSpecifierProvider *)self coordinator];
  id v4 = [v3 usageDetailsCoordinator];
  uint64_t v5 = [v4 viewModel];

  id v6 = [v5 selectedUsageReport];
  unint64_t v7 = [(STMostUsedGroupSpecifierProvider *)self selectedItemType];
  if (v7 == 1)
  {
    id v8 = [v6 categoryUsages];
    uint64_t v9 = +[STScreenTimeSettingsUIBundle bundle];
    BOOL v10 = v9;
    id v11 = @"ShowMostUsedAppsButtonText";
    goto LABEL_5;
  }
  if (!v7)
  {
    id v8 = [v6 appAndWebUsages];
    uint64_t v9 = +[STScreenTimeSettingsUIBundle bundle];
    BOOL v10 = v9;
    id v11 = @"ShowMostUsedCategoriesButtonText";
LABEL_5:
    uint64_t v12 = [v9 localizedStringForKey:v11 value:&stru_26D9391A8 table:0];
    [v14 setObject:v12 forKeyedSubscript:0x26D941808];

    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  uint64_t v13 = [v14 objectForKeyedSubscript:*MEMORY[0x263F60128]];
  [v13 reloadFromSpecifier];
  [(STShowMoreUsageGroupSpecifierProvider *)self setUsageItems:v8];
  -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v8 count] == 0);
}

- (void)showMostUsedDetailListController:(id)a3
{
  id v4 = a3;
  id v10 = [v4 userInfo];
  uint64_t v5 = [STDrillInDetailListController alloc];
  id v6 = [(STUsageGroupSpecifierProvider *)self coordinator];
  unint64_t v7 = [(STDrillInDetailListController *)v5 initWithUsageItem:v10 coordinator:v6];

  id v8 = [(STGroupSpecifierProvider *)self delegate];
  [(STDrillInDetailListController *)v7 setParentController:v8];
  uint64_t v9 = [v8 rootController];
  [(STDrillInDetailListController *)v7 setRootController:v9];

  [(STDrillInDetailListController *)v7 setSpecifier:v4];
  [(STGroupSpecifierProvider *)self showController:v7 animated:1];
}

- (id)allowanceIconForUsageItem:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 budgetItemIdentifier];
  id v6 = [(STMostUsedGroupSpecifierProvider *)self allowancesByActiveBudgetedIdentifier];
  unint64_t v7 = [v6 objectForKeyedSubscript:v5];

  if (![v7 count])
  {
LABEL_14:
    uint64_t v9 = 0;
    goto LABEL_18;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  uint64_t v9 = (void *)[v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    char v10 = 0;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v13, "allowanceEnabled", (void)v22))
        {
          [v13 timeToday];
          double v15 = v14;
          id v16 = [v4 totalUsage];
          [v16 doubleValue];
          double v18 = v15 - v17;

          if (v18 <= 0.0)
          {

            v19 = @"HourGlassEmpty";
            goto LABEL_16;
          }
          char v10 = 1;
        }
      }
      uint64_t v9 = (void *)[v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }

    if (v10)
    {
      v19 = @"HourGlassFilling";
LABEL_16:
      v20 = (void *)MEMORY[0x263F827E8];
      id v8 = +[STScreenTimeSettingsUIBundle bundle];
      uint64_t v9 = [v20 imageNamed:v19 inBundle:v8];
      goto LABEL_17;
    }
    goto LABEL_14;
  }
LABEL_17:

LABEL_18:

  return v9;
}

- (NSDictionary)allowancesByActiveBudgetedIdentifier
{
  return self->_allowancesByActiveBudgetedIdentifier;
}

- (void)setAllowancesByActiveBudgetedIdentifier:(id)a3
{
}

- (unint64_t)selectedItemType
{
  return self->_selectedItemType;
}

- (void)setSelectedItemType:(unint64_t)a3
{
  self->_unint64_t selectedItemType = a3;
}

- (void).cxx_destruct
{
}

@end