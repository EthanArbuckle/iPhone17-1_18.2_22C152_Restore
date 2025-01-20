@interface PUIReportSensorListController
+ (id)appSpecifiersFromManager:(id)a3;
+ (id)valueForSpecifier:(id)a3;
- (BOOL)alphabeticalSort;
- (BOOL)shouldReloadSpecifiersOnResume;
- (PUIReportSensorListController)init;
- (PUIReportSensorManager)manager;
- (id)specifiers;
- (void)dealloc;
- (void)setAlphabeticalSort:(BOOL)a3;
- (void)setManager:(id)a3;
- (void)sortByWasTapped;
@end

@implementation PUIReportSensorListController

+ (id)appSpecifiersFromManager:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setUnitsStyle:2];
  v5 = objc_opt_new();
  v6 = [v3 allEvents];
  v7 = [v3 bundleIDsAndLatestDatesFromEvents:v6];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v47 = v7;
  id obj = [v7 allKeys];
  uint64_t v48 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v48)
  {
    uint64_t v44 = *(void *)v55;
    uint64_t v43 = *MEMORY[0x1E4F931C0];
    uint64_t v42 = *MEMORY[0x1E4F931D0];
    uint64_t v41 = *MEMORY[0x1E4F930A8];
    uint64_t v40 = *MEMORY[0x1E4F93250];
    v37 = v4;
    id v38 = v3;
    v45 = v5;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v55 != v44) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v10 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v9 allowPlaceholder:0 error:0];
        v11 = [v10 localizedName];

        v12 = (void *)MEMORY[0x1E4F92E70];
        if ([v11 length]) {
          v13 = v11;
        }
        else {
          v13 = v9;
        }
        v14 = [v12 preferenceSpecifierNamed:v13 target:a1 set:0 get:sel_valueForSpecifier_ detail:objc_opt_class() cell:2 edit:0];
        [v14 setIdentifier:v9];
        [v14 setObject:v9 forKeyedSubscript:@"PUIReportAppIDKey"];
        [v14 setObject:v9 forKeyedSubscript:v43];
        [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v42];
        [v14 setObject:v3 forKeyedSubscript:@"PUIReportSensorManagerKey"];
        [v14 setObject:objc_opt_class() forKeyedSubscript:v41];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __58__PUIReportSensorListController_appSpecifiersFromManager___block_invoke;
        v53[3] = &unk_1E6E9DD30;
        v53[4] = v9;
        v49 = [v3 eventsFiltered:v53];
        v15 = objc_msgSend(v3, "categoriesAndLatestDatesFromEvents:");
        v16 = [v15 allKeys];

        v17 = [v47 objectForKeyedSubscript:v9];
        v18 = [MEMORY[0x1E4F1C9C8] now];
        v19 = [v4 localizedStringForDate:v17 relativeToDate:v18];

        v50 = v11;
        if ([v16 count] == 1)
        {
          v20 = NSString;
          v21 = PUI_LocalizedStringForAppReport(@"TIME_AND_CATEGORY_1");
          v22 = objc_opt_class();
          v23 = [v16 objectAtIndexedSubscript:0];
          v24 = [v22 localizedStringForCategory:v23];
          v25 = objc_msgSend(v20, "stringWithFormat:", v21, v19, v24);
        }
        else
        {
          uint64_t v26 = [v16 count];
          v27 = NSString;
          if (v26 == 2)
          {
            v21 = PUI_LocalizedStringForAppReport(@"TIME_AND_CATEGORY_2");
            v28 = objc_opt_class();
            v23 = [v16 objectAtIndexedSubscript:0];
            v24 = [v28 localizedStringForCategory:v23];
            v29 = objc_opt_class();
            v30 = [v16 objectAtIndexedSubscript:1];
            v31 = [v29 localizedStringForCategory:v30];
            objc_msgSend(v27, "stringWithFormat:", v21, v19, v24, v31);
          }
          else
          {
            v21 = PUI_LocalizedStringForAppReport(@"TIME_AND_CATEGORY_3");
            v32 = objc_opt_class();
            v23 = [v16 objectAtIndexedSubscript:0];
            v24 = [v32 localizedStringForCategory:v23];
            v33 = objc_opt_class();
            v30 = [v16 objectAtIndexedSubscript:1];
            v31 = [v33 localizedStringForCategory:v30];
            objc_msgSend(v27, "localizedStringWithFormat:", v21, v19, v24, v31, objc_msgSend(v16, "count") - 2);
          v25 = };

          v4 = v37;
          id v3 = v38;
        }

        [v14 setObject:v25 forKeyedSubscript:v40];
        v5 = v45;
        [v45 addObject:v14];
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v48);
  }

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __58__PUIReportSensorListController_appSpecifiersFromManager___block_invoke_2;
  v51[3] = &unk_1E6E9DD58;
  id v52 = v47;
  v34 = v4;
  id v35 = v47;
  [v5 sortUsingComparator:v51];

  return v5;
}

uint64_t __58__PUIReportSensorListController_appSpecifiersFromManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 access];
  v4 = [v3 accessor];
  v5 = [v4 identifier];
  uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];

  return v6;
}

uint64_t __58__PUIReportSensorListController_appSpecifiersFromManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [a3 identifier];
  v8 = [v5 objectForKeyedSubscript:v7];
  v9 = *(void **)(a1 + 32);
  v10 = [v6 identifier];

  v11 = [v9 objectForKeyedSubscript:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

+ (id)valueForSpecifier:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F93250]];
}

- (PUIReportSensorListController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PUIReportSensorListController;
  v2 = [(PUIReportSensorListController *)&v7 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_dataDidChange name:@"PUIReportSensorManagerDataHasChangedNotification" object:0];

    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    PUIAnalyticsLogView(v5, 0, 0);
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUIReportSensorListController;
  [(PUIReportSensorListController *)&v4 dealloc];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(PUIReportSensorListController *)self manager];

    if (!v5)
    {
      id v6 = [(PUIReportSensorListController *)self specifier];
      objc_super v7 = [v6 objectForKeyedSubscript:@"PUIReportSensorManagerKey"];
      [(PUIReportSensorListController *)self setManager:v7];
    }
    v8 = PUI_LocalizedStringForAppReport(@"DATA_SENSOR_ACCESS_TITLE");
    [(PUIReportSensorListController *)self setTitle:v8];

    id v9 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v10 = PUI_LocalizedStringForAppReport(@"SORT_BY");
    v11 = (void *)[v9 initWithTitle:v10 style:0 target:self action:sel_sortByWasTapped];
    uint64_t v12 = [(PUIReportSensorListController *)self navigationItem];
    [v12 setRightBarButtonItem:v11];

    v13 = objc_opt_new();
    if ([(PUIReportSensorListController *)self alphabeticalSort])
    {
      v14 = &stru_1F4072988;
    }
    else
    {
      PUI_LocalizedStringForAppReport(@"MOST_RECENT_ACCESS");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v15 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"HEADER_GROUP" name:v14];
    [v13 addObject:v15];
    v16 = objc_opt_class();
    v17 = [(PUIReportSensorListController *)self manager];
    v18 = [v16 appSpecifiersFromManager:v17];
    v19 = (void *)[v18 mutableCopy];

    if ([(PUIReportSensorListController *)self alphabeticalSort]) {
      [v19 sortUsingComparator:&__block_literal_global_18];
    }
    [v13 addObjectsFromArray:v19];
    v20 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v13;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

uint64_t __43__PUIReportSensorListController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)sortByWasTapped
{
  uint64_t v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v4 = (void *)MEMORY[0x1E4FB1410];
  v5 = PUI_LocalizedStringForAppReport(@"RECENT_ACCESS");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__PUIReportSensorListController_sortByWasTapped__block_invoke;
  v14[3] = &unk_1E6E9D610;
  v14[4] = self;
  id v6 = [v4 actionWithTitle:v5 style:0 handler:v14];

  objc_msgSend(v6, "_setChecked:", -[PUIReportSensorListController alphabeticalSort](self, "alphabeticalSort") ^ 1);
  [v3 addAction:v6];
  uint64_t v7 = (void *)MEMORY[0x1E4FB1410];
  v8 = PUI_LocalizedStringForAppReport(@"ALPHABETICAL");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__PUIReportSensorListController_sortByWasTapped__block_invoke_2;
  v13[3] = &unk_1E6E9D610;
  v13[4] = self;
  id v9 = [v7 actionWithTitle:v8 style:0 handler:v13];

  objc_msgSend(v9, "_setChecked:", -[PUIReportSensorListController alphabeticalSort](self, "alphabeticalSort"));
  [v3 addAction:v9];
  v10 = (void *)MEMORY[0x1E4FB1410];
  v11 = PUI_LocalizedStringForAppReport(@"CANCEL");
  uint64_t v12 = [v10 actionWithTitle:v11 style:1 handler:0];

  [v3 addAction:v12];
  [(PUIReportSensorListController *)self presentViewController:v3 animated:1 completion:0];
}

uint64_t __48__PUIReportSensorListController_sortByWasTapped__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) alphabeticalSort];
  if (result)
  {
    [*(id *)(a1 + 32) setAlphabeticalSort:0];
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 reloadSpecifiers];
  }
  return result;
}

uint64_t __48__PUIReportSensorListController_sortByWasTapped__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) alphabeticalSort];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setAlphabeticalSort:1];
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 reloadSpecifiers];
  }
  return result;
}

- (PUIReportSensorManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (BOOL)alphabeticalSort
{
  return self->_alphabeticalSort;
}

- (void)setAlphabeticalSort:(BOOL)a3
{
  self->_alphabeticalSort = a3;
}

- (void).cxx_destruct
{
}

@end