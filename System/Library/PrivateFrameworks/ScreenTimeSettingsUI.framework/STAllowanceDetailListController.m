@interface STAllowanceDetailListController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)creatingNewAllowance;
- (BOOL)didDeleteAllowance;
- (BOOL)hasSetBudgetTime;
- (BOOL)hasSetBudgetTimeOrCustomSchedule;
- (BOOL)isSetupController;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)useBackButton;
- (NSArray)budgetedItemSpecifiers;
- (PSSpecifier)customizeDaysSpecifier;
- (PSSpecifier)selectedTimeSpecifier;
- (PSSpecifier)timeGroupSpecifier;
- (PSSpecifier)timePickerSpecifier;
- (PSSpecifier)timeSpecifier;
- (STAllowance)allowance;
- (STAllowanceDetailListController)initWithCoordinator:(id)a3;
- (STAllowanceDetailListControllerDelegate)delegate;
- (STRootViewModelCoordinator)coordinator;
- (UIColor)defaultTimeCellDetailTextColor;
- (id)_allowanceEnabled:(id)a3;
- (id)_askForMoreTime:(id)a3;
- (id)_categoryDetailText:(id)a3;
- (id)atEndOfLimitFooterText;
- (id)budgetTime;
- (id)createBudgetedItemSpecifiers;
- (id)datePickerForSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)timeFooterText;
- (int64_t)tableViewStyle;
- (void)_editListButtonPressed:(id)a3;
- (void)_setAllowanceEnabled:(id)a3 specifier:(id)a4;
- (void)_setAskForMoreTime:(id)a3 specifier:(id)a4;
- (void)_showOrHidePickerSpecifierForSpecifier:(id)a3 highlight:(BOOL)a4;
- (void)cancelButtonTapped:(id)a3;
- (void)confirmDeletion:(id)a3;
- (void)createBudgetedItemSpecifiers;
- (void)customizeDaysListController:(id)a3 didFinishEditingTimeByDay:(id)a4;
- (void)datePickerChanged:(id)a3;
- (void)deleteAllowance:(id)a3;
- (void)loadView;
- (void)saveButtonTapped:(id)a3;
- (void)setAllowance:(id)a3;
- (void)setBudgetedItemSpecifiers:(id)a3;
- (void)setCreatingNewAllowance:(BOOL)a3;
- (void)setCustomizeDaysSpecifier:(id)a3;
- (void)setDefaultTimeCellDetailTextColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidDeleteAllowance:(BOOL)a3;
- (void)setIsSetupController:(BOOL)a3;
- (void)setSelectedTimeSpecifier:(id)a3;
- (void)setTimeGroupSpecifier:(id)a3;
- (void)setTimePickerSpecifier:(id)a3;
- (void)setTimeSpecifier:(id)a3;
- (void)setUseBackButton:(BOOL)a3;
- (void)showCustomizeDaysController:(id)a3;
- (void)showOrHideCustomizeDaysSpecifier;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSaveButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation STAllowanceDetailListController

- (STAllowanceDetailListController)initWithCoordinator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STAllowanceDetailListController;
  v6 = [(STAllowanceDetailListController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_coordinator, a3);
  }

  return v7;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)STAllowanceDetailListController;
  [(STAllowanceDetailListController *)&v8 loadView];
  if ([(STAllowanceDetailListController *)self isSetupController])
  {
    v3 = [(STAllowanceDetailListController *)self navigationItem];
    if (![(STAllowanceDetailListController *)self useBackButton])
    {
      v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonTapped_];
      [v3 setLeftBarButtonItem:v4];
    }
    id v5 = +[STScreenTimeSettingsUIBundle bundle];
    v6 = [v5 localizedStringForKey:@"AllowanceAddBarButtonItemTitle" value:&stru_26D9391A8 table:0];

    v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v6 style:2 target:self action:sel_saveButtonTapped_];
    [v3 setRightBarButtonItem:v7];
  }
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)STAllowanceDetailListController;
  [(STAllowanceDetailListController *)&v10 viewDidLoad];
  v3 = [(STAllowanceDetailListController *)self allowance];
  v4 = (void *)MEMORY[0x263F67108];
  id v5 = [v3 categoryIdentifiers];
  v6 = [v3 bundleIdentifiers];
  v7 = [v3 webDomains];
  objc_super v8 = [v4 displayNameForUsageLimitWithCategoryIdentifiers:v5 bundleIdentifiers:v6 webDomains:v7];
  [(STAllowanceDetailListController *)self setTitle:v8];

  [(STAllowanceDetailListController *)self updateSaveButton];
  [(STAllowanceDetailListController *)self showOrHideCustomizeDaysSpecifier];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v9 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceDetailListController.viewDidLoad", v9, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STAllowanceDetailListController;
  [(STAllowanceDetailListController *)&v10 viewDidAppear:a3];
  v4 = [(STAllowanceDetailListController *)self defaultTimeCellDetailTextColor];

  if (!v4)
  {
    id v5 = [(STAllowanceDetailListController *)self timeSpecifier];
    v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F602B0]];

    v7 = [v6 detailTextLabel];
    objc_super v8 = [v7 textColor];
    [(STAllowanceDetailListController *)self setDefaultTimeCellDetailTextColor:v8];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v9 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceDetailListController.viewDidAppear", v9, 2u);
  }
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    uint64_t v55 = (int)*MEMORY[0x263F5FDB8];
    [(STAllowanceDetailListController *)self setSelectedTimeSpecifier:0];
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    uint64_t v63 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    v58 = [v4 localizedStringForKey:@"AllowanceEnableAllowanceSpecifierName" value:&stru_26D9391A8 table:0];
    uint64_t v65 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    id v5 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    v6 = [(STAllowanceDetailListController *)self timeFooterText];
    uint64_t v50 = *MEMORY[0x263F600F8];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6);

    [(STAllowanceDetailListController *)self setTimeGroupSpecifier:v5];
    v57 = [v4 localizedStringForKey:@"AllowanceTimeSpecifierName" value:&stru_26D9391A8 table:0];
    v7 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    [(STAllowanceDetailListController *)self setTimeSpecifier:v7];
    objc_super v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D9391A8 target:self set:0 get:0 detail:0 cell:4 edit:0];
    objc_super v9 = [MEMORY[0x263F08C38] UUID];
    objc_super v10 = [v9 UUIDString];
    [v8 setIdentifier:v10];

    v11 = NSNumber;
    [MEMORY[0x263F5FB58] preferredHeight];
    v12 = objc_msgSend(v11, "numberWithDouble:");
    [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x263F602A8]];

    [v8 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    v56 = v8;
    [(STAllowanceDetailListController *)self setTimePickerSpecifier:v8];
    v53 = [v4 localizedStringForKey:@"AllowanceCustomizeDaysSpecifierName" value:&stru_26D9391A8 table:0];
    v13 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    [v13 setControllerLoadAction:sel_showCustomizeDaysController_];
    v54 = v13;
    [(STAllowanceDetailListController *)self setCustomizeDaysSpecifier:v13];
    v14 = (void *)MEMORY[0x263F5FC40];
    v15 = [v4 localizedStringForKey:@"CategoriesAppsWebsitesGroupSpecifierName" value:&stru_26D9391A8 table:0];
    v64 = [v14 groupSpecifierWithName:v15];

    v16 = [(STAllowanceDetailListController *)self createBudgetedItemSpecifiers];
    -[STAllowanceDetailListController setBudgetedItemSpecifiers:](self, "setBudgetedItemSpecifiers:");
    v17 = (void *)MEMORY[0x263F5FC40];
    v18 = [v4 localizedStringForKey:@"AllowanceDeleteSpecifierName" value:&stru_26D9391A8 table:0];
    v60 = [v17 deleteButtonSpecifierWithName:v18 target:self action:sel_confirmDeletion_];

    LODWORD(v17) = [(STAllowanceDetailListController *)self creatingNewAllowance];
    id v19 = objc_alloc(MEMORY[0x263EFF980]);
    if (v17)
    {
      v20 = objc_msgSend(v19, "initWithObjects:", v5, v7, 0);
      v21 = (void *)v63;
    }
    else
    {
      v21 = (void *)v63;
      v20 = objc_msgSend(v19, "initWithObjects:", v63, v65, v5, v7, 0);
    }
    v22 = v5;
    v59 = [(STAllowanceDetailListController *)self coordinator];
    v61 = v7;
    v62 = v5;
    if ([v59 isPasscodeEnabled])
    {
      v23 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
      v24 = [(STAllowanceDetailListController *)self atEndOfLimitFooterText];
      [v23 setObject:v24 forKeyedSubscript:v50];

      [v20 addObject:v23];
      v25 = [v4 localizedStringForKey:@"BlockAtEndOfLimit" value:&stru_26D9391A8 table:0];
      v26 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v25 target:self set:sel__setAskForMoreTime_specifier_ get:sel__askForMoreTime_ detail:0 cell:6 edit:0];
      [v20 addObject:v26];

      v22 = v5;
      v7 = v61;
    }
    [v20 addObject:v64];
    [v20 addObjectsFromArray:v16];
    v27 = [(STAllowanceDetailListController *)self allowance];
    if (![(STAllowanceDetailListController *)self useBackButton])
    {
      v51 = [v4 localizedStringForKey:@"EditListSpecifierName" value:&stru_26D9391A8 table:0];
      v28 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v51 target:self set:0 get:0 detail:0 cell:13 edit:0];
      [v28 setButtonAction:sel__editListButtonPressed_];
      v29 = [MEMORY[0x263F67408] sharedCache];
      v30 = objc_msgSend(v29, "blankSpaceImageWithSize:", 29.0, 29.0);
      [v28 setObject:v30 forKeyedSubscript:*MEMORY[0x263F60140]];

      v22 = v62;
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      [v28 setObject:v32 forKeyedSubscript:*MEMORY[0x263F60228]];

      v33 = [v27 bundleIdentifiers];
      [v28 setObject:v33 forKeyedSubscript:0x26D9394E8];

      v34 = [v27 webDomains];
      [v28 setObject:v34 forKeyedSubscript:0x26D939508];

      v35 = [v27 categoryIdentifiers];
      [v28 setObject:v35 forKeyedSubscript:0x26D939528];

      [v28 setObject:v59 forKeyedSubscript:0x26D940528];
      v36 = [v4 localizedStringForKey:@"AllowanceAddBarButtonItemTitle" value:&stru_26D9391A8 table:0];
      [v28 setObject:v36 forKeyedSubscript:0x26D939548];
      [v20 addObject:v28];

      v7 = v61;
    }
    v37 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    [v20 addObject:v37];

    v38 = (void *)v65;
    if (![(STAllowanceDetailListController *)self isSetupController]) {
      [v20 addObject:v60];
    }
    if (([v27 shouldAllowEditing] & 1) == 0)
    {
      v52 = v4;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v39 = v20;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v66 objects:v70 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v67;
        uint64_t v43 = *MEMORY[0x263F600A8];
        uint64_t v44 = MEMORY[0x263EFFA80];
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v67 != v42) {
              objc_enumerationMutation(v39);
            }
            [*(id *)(*((void *)&v66 + 1) + 8 * i) setObject:v44 forKeyedSubscript:v43];
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v66 objects:v70 count:16];
        }
        while (v41);
      }

      v4 = v52;
      v22 = v62;
      v21 = (void *)v63;
      v38 = (void *)v65;
      v7 = v61;
    }
    uint64_t v3 = v55;
    v46 = *(Class *)((char *)&self->super.super.super.super.super.isa + v55);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v55) = (Class)v20;
  }
  if (![(STAllowanceDetailListController *)self hasSetBudgetTimeOrCustomSchedule])
  {
    v47 = [(STAllowanceDetailListController *)self timeSpecifier];
    [(STAllowanceDetailListController *)self _showOrHidePickerSpecifierForSpecifier:v47 highlight:0];
  }
  v48 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);

  return v48;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(STAllowanceDetailListController *)self delegate];
  if (![(STAllowanceDetailListController *)self isSetupController]
    && ![(STAllowanceDetailListController *)self didDeleteAllowance]
    && [(STAllowanceDetailListController *)self hasSetBudgetTimeOrCustomSchedule]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = [(STAllowanceDetailListController *)self allowance];
    [v5 allowanceDetailController:self didSaveAllowance:v6];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceDetailListController.viewDidAppear", buf, 2u);
  }
  v7.receiver = self;
  v7.super_class = (Class)STAllowanceDetailListController;
  [(STAllowanceDetailListController *)&v7 viewWillDisappear:v3];
}

- (void)willResignActive
{
  BOOL v3 = [(STAllowanceDetailListController *)self delegate];
  if (![(STAllowanceDetailListController *)self isSetupController]
    && ![(STAllowanceDetailListController *)self didDeleteAllowance]
    && [(STAllowanceDetailListController *)self hasSetBudgetTimeOrCustomSchedule]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = [(STAllowanceDetailListController *)self allowance];
    [v3 allowanceDetailController:self didSaveAllowance:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)STAllowanceDetailListController;
  [(STAllowanceDetailListController *)&v5 willResignActive];
}

- (void)saveButtonTapped:(id)a3
{
  v4 = +[STUILog persistence];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v7 = 0;
    _os_log_impl(&dword_225B06000, v4, OS_LOG_TYPE_INFO, "User saved edited allowance", v7, 2u);
  }

  objc_super v5 = [(STAllowanceDetailListController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(STAllowanceDetailListController *)self allowance];
    [v5 allowanceDetailController:self didSaveAllowance:v6];
  }
}

- (void)updateSaveButton
{
  if ([(STAllowanceDetailListController *)self isSetupController])
  {
    id v5 = [(STAllowanceDetailListController *)self navigationItem];
    BOOL v3 = [(STAllowanceDetailListController *)self hasSetBudgetTimeOrCustomSchedule];
    v4 = [v5 rightBarButtonItem];
    [v4 setEnabled:v3];
  }
}

- (void)showOrHideCustomizeDaysSpecifier
{
  id v6 = [(STAllowanceDetailListController *)self customizeDaysSpecifier];
  BOOL v3 = [(STAllowanceDetailListController *)self timePickerSpecifier];
  int v4 = [(STAllowanceDetailListController *)self containsSpecifier:v6];
  BOOL v5 = [(STAllowanceDetailListController *)self hasSetBudgetTimeOrCustomSchedule];
  if (!v5 || (v4 & 1) != 0)
  {
    if (((v5 | v4 ^ 1) & 1) == 0) {
      [(STAllowanceDetailListController *)self removeSpecifier:v6 animated:1];
    }
  }
  else
  {
    [(STAllowanceDetailListController *)self insertSpecifier:v6 afterSpecifier:v3 animated:1];
  }
}

- (BOOL)hasSetBudgetTime
{
  v2 = [(STAllowanceDetailListController *)self allowance];
  BOOL v3 = [v2 time];
  +[STAllowance timeIntervalForAllowanceDateComponents:v3];
  double v5 = v4;

  return v5 > 0.0;
}

- (BOOL)hasSetBudgetTimeOrCustomSchedule
{
  if ([(STAllowanceDetailListController *)self hasSetBudgetTime]) {
    return 1;
  }
  double v4 = [(STAllowanceDetailListController *)self allowance];
  double v5 = [v4 timeByDay];
  BOOL v3 = v5 != 0;

  return v3;
}

- (void)cancelButtonTapped:(id)a3
{
  double v4 = +[STUILog persistence];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_225B06000, v4, OS_LOG_TYPE_INFO, "User cancelled editing allowance", v6, 2u);
  }

  double v5 = [(STAllowanceDetailListController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 allowanceDetailControllerDidCancel:self];
  }
}

- (void)_showOrHidePickerSpecifierForSpecifier:(id)a3 highlight:(BOOL)a4
{
  BOOL v4 = a4;
  id v28 = a3;
  id v6 = [(STAllowanceDetailListController *)self selectedTimeSpecifier];

  if (v6 == v28)
  {
    if ([(STAllowanceDetailListController *)self hasSetBudgetTime])
    {
      id v19 = [(STAllowanceDetailListController *)self allowance];
      v20 = [v19 timeByDay];

      if (!v20)
      {
        v21 = [v28 objectForKeyedSubscript:*MEMORY[0x263F602B0]];
        v22 = [MEMORY[0x263F825C8] tableCellGrayTextColor];
        v23 = [v21 detailTextLabel];
        [v23 setTextColor:v22];
      }
    }
    v24 = [(STAllowanceDetailListController *)self timePickerSpecifier];
    [(STAllowanceDetailListController *)self removeSpecifier:v24 animated:1];

    v25 = [(STAllowanceDetailListController *)self customizeDaysSpecifier];
    [(STAllowanceDetailListController *)self removeSpecifier:v25 animated:1];

    if (v4)
    {
      v26 = [(STAllowanceDetailListController *)self selectedTimeSpecifier];
      v27 = [v26 identifier];
      [(STAllowanceDetailListController *)self highlightSpecifierWithID:v27];
    }
    [(STAllowanceDetailListController *)self setSelectedTimeSpecifier:0];
  }
  else
  {
    -[STAllowanceDetailListController setSelectedTimeSpecifier:](self, "setSelectedTimeSpecifier:");
    if ([(STAllowanceDetailListController *)self hasSetBudgetTime])
    {
      objc_super v7 = [(STAllowanceDetailListController *)self allowance];
      objc_super v8 = [v7 timeByDay];

      if (!v8)
      {
        objc_super v9 = [(STAllowanceDetailListController *)self timeSpecifier];
        objc_super v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F602B0]];

        v11 = [MEMORY[0x263F825C8] tableCellBlueTextColor];
        v12 = [v10 detailTextLabel];
        [v12 setTextColor:v11];
      }
    }
    v13 = [(STAllowanceDetailListController *)self timePickerSpecifier];
    v14 = [(STAllowanceDetailListController *)self timeSpecifier];
    [(STAllowanceDetailListController *)self insertSpecifier:v13 afterSpecifier:v14 animated:1];

    v15 = [(STAllowanceDetailListController *)self customizeDaysSpecifier];
    v16 = [(STAllowanceDetailListController *)self timePickerSpecifier];
    [(STAllowanceDetailListController *)self insertSpecifier:v15 afterSpecifier:v16 animated:1];

    if (v4)
    {
      v17 = [(STAllowanceDetailListController *)self selectedTimeSpecifier];
      v18 = [v17 identifier];
      [(STAllowanceDetailListController *)self highlightSpecifierWithID:v18];
    }
  }
}

- (id)budgetTime
{
  BOOL v3 = +[STScreenTimeSettingsUIBundle bundle];
  BOOL v4 = [(STAllowanceDetailListController *)self allowance];
  double v5 = [v4 timeByDay];

  if (v5)
  {
    id v6 = @"AllowanceCustomScheduleDetailText";
  }
  else
  {
    objc_super v7 = [(STAllowanceDetailListController *)self allowance];
    objc_super v8 = [v7 time];
    +[STAllowance timeIntervalForAllowanceDateComponents:v8];
    double v10 = v9;

    if (v10 > 0.0)
    {
      v11 = objc_opt_new();
      [v11 setFormattingContext:1];
      [v11 setUnitsStyle:2];
      v12 = [v11 stringFromTimeInterval:v10];
      v13 = [v3 localizedStringForKey:@"AppLimitEveryDayFormat" value:&stru_26D9391A8 table:0];
      id v14 = [NSString alloc];
      v15 = [MEMORY[0x263EFF960] currentLocale];
      v16 = objc_msgSend(v14, "initWithFormat:locale:", v13, v15, v12);

      goto LABEL_7;
    }
    id v6 = @"AllowanceSetTimeDetailText";
  }
  v16 = [v3 localizedStringForKey:v6 value:&stru_26D9391A8 table:0];
LABEL_7:

  return v16;
}

- (id)timeFooterText
{
  BOOL v3 = [(STAllowanceDetailListController *)self coordinator];
  BOOL v4 = [v3 viewModel];
  double v5 = [v4 me];

  LODWORD(v4) = [v5 isRemoteUser];
  id v6 = +[STScreenTimeSettingsUIBundle bundle];
  if (v4)
  {
    uint64_t v7 = [v5 givenName];
    if (v7)
    {
      objc_super v8 = (void *)v7;
      double v9 = NSString;
      double v10 = [v6 localizedStringForKey:@"AllowanceTimeFooterTextRemote" value:&stru_26D9391A8 table:0];
      v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);

      goto LABEL_8;
    }
  }
  else
  {
    v12 = [(STAllowanceDetailListController *)self coordinator];
    v13 = [v12 viewModel];
    int v14 = [v13 isCloudSyncEnabled];

    if (!v14)
    {
      v15 = @"AllowanceTimeFooterTextLocal";
      goto LABEL_7;
    }
  }
  v15 = @"AllowanceTimeFooterTextCloud";
LABEL_7:
  v11 = [v6 localizedStringForKey:v15 value:&stru_26D9391A8 table:0];
LABEL_8:

  return v11;
}

- (void)showCustomizeDaysController:(id)a3
{
  id v4 = a3;
  id v11 = (id)objc_opt_new();
  double v5 = [(STAllowanceDetailListController *)self allowance];
  id v6 = [v5 timeByDay];

  uint64_t v7 = [(STAllowanceDetailListController *)self allowance];
  objc_super v8 = v7;
  if (v6) {
    [v7 timeByDay];
  }
  else {
  double v9 = [v7 defaultTimeByDay];
  }
  [v11 setTimeByDay:v9];

  [v11 setDelegate:self];
  [v11 setParentController:self];
  double v10 = [(STAllowanceDetailListController *)self rootController];
  [v11 setRootController:v10];

  [v11 setSpecifier:v4];
  [(STAllowanceDetailListController *)self showController:v11 animate:1];
}

- (void)_editListButtonPressed:(id)a3
{
  id v4 = a3;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __58__STAllowanceDetailListController__editListButtonPressed___block_invoke;
  v13 = &unk_264766EE0;
  int v14 = self;
  id v15 = v4;
  id v5 = v4;
  id v6 = _Block_copy(&v10);
  uint64_t v7 = _Block_copy(v6);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, 0x26D939568, v10, v11, v12, v13, v14);

  objc_super v8 = objc_opt_new();
  [v8 setParentController:self];
  double v9 = [(STAllowanceDetailListController *)self rootController];
  [v8 setRootController:v9];

  [v8 setSpecifier:v5];
  [v8 setupController];
  [(STAllowanceDetailListController *)self showController:v8 animate:1];
}

void __58__STAllowanceDetailListController__editListButtonPressed___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  double v9 = *(void **)(a1 + 32);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id v23 = [v9 allowance];
  [v23 setBundleIdentifiers:v12];
  [v23 setWebDomains:v11];
  [v23 setCategoryIdentifiers:v10];
  [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:0x26D9394E8];

  [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:0x26D939508];
  [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:0x26D939528];

  int v14 = [*(id *)(a1 + 32) createBudgetedItemSpecifiers];
  id v15 = *(void **)(a1 + 32);
  v16 = [v15 budgetedItemSpecifiers];
  [v15 replaceContiguousSpecifiers:v16 withSpecifiers:v14 animated:1];

  [*(id *)(a1 + 32) setBudgetedItemSpecifiers:v14];
  v17 = (void *)MEMORY[0x263F67108];
  v18 = [v23 categoryIdentifiers];
  id v19 = [v23 bundleIdentifiers];
  v20 = [v23 webDomains];
  v21 = [v17 displayNameForUsageLimitWithCategoryIdentifiers:v18 bundleIdentifiers:v19 webDomains:v20];
  [*(id *)(a1 + 32) setTitle:v21];

  [v13 dismissViewControllerAnimated:1 completion:0];
  v22 = [v13 specifier];

  [v22 removePropertyForKey:0x26D939568];
}

- (void)confirmDeletion:(id)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  id v5 = +[STScreenTimeSettingsUIBundle bundle];
  v13[0] = *MEMORY[0x263F60018];
  id v6 = [v5 localizedStringForKey:@"AllowanceDeleteSpecifierName" value:&stru_26D9391A8 table:0];
  v14[0] = v6;
  v13[1] = *MEMORY[0x263F60010];
  uint64_t v7 = [v5 localizedStringForKey:@"AllowanceDeletionPrompt" value:&stru_26D9391A8 table:0];
  v14[1] = v7;
  v13[2] = *MEMORY[0x263F60008];
  objc_super v8 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v8, "sf_isiPad")) {
    double v9 = @"ConfirmationTitleDelete";
  }
  else {
    double v9 = @"AllowanceDeleteSpecifierName";
  }
  id v10 = [v5 localizedStringForKey:v9 value:&stru_26D9391A8 table:0];
  v14[2] = v10;
  v13[3] = *MEMORY[0x263F5FFF8];
  id v11 = [v5 localizedStringForKey:@"ConfirmationButtonCancel" value:&stru_26D9391A8 table:0];
  v14[3] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  [v4 setupWithDictionary:v12];

  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60000]];
  [v4 setTarget:self];
  [v4 setConfirmationAction:sel_deleteAllowance_];
  [(STAllowanceDetailListController *)self showConfirmationViewForSpecifier:v4];
}

- (void)deleteAllowance:(id)a3
{
  id v5 = [(STAllowanceDetailListController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(STAllowanceDetailListController *)self setDidDeleteAllowance:1];
    id v4 = [(STAllowanceDetailListController *)self allowance];
    [v5 allowanceDetailController:self didDeleteAllowance:v4];
  }
}

- (id)createBudgetedItemSpecifiers
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_opt_new();
  id v4 = [(STAllowanceDetailListController *)self allowance];
  id v5 = objc_alloc(MEMORY[0x263EFF9D8]);
  v62 = v4;
  id v6 = [v4 categoryIdentifiers];
  uint64_t v7 = (void *)[v5 initWithArray:v6];

  id v8 = objc_alloc(MEMORY[0x263EFFA08]);
  double v9 = STAvailableCategoriesExcludingSystemCategories();
  uint64_t v10 = [v8 initWithArray:v9];

  id v11 = [v7 set];
  v60 = (void *)v10;
  LODWORD(v9) = [v11 isEqualToSet:v10];

  v73 = self;
  v74 = v3;
  v61 = v7;
  if (v9)
  {
    id v12 = +[STScreenTimeSettingsUIBundle bundle];
    id v13 = [v12 localizedStringForKey:@"AllAppsAndCategoriesSpecifierName" value:&stru_26D9391A8 table:0];

    int v14 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];
    id v15 = [MEMORY[0x263F67408] sharedCache];
    v16 = [v15 imageForCategoryIdentifier:*MEMORY[0x263F673D8]];
    [v14 setObject:v16 forKeyedSubscript:*MEMORY[0x263F60140]];

    [v3 addObject:v14];
  }
  else
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    obuint64_t j = v7;
    uint64_t v17 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v84;
      uint64_t v20 = *MEMORY[0x263F60140];
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v84 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v83 + 1) + 8 * i);
          id v23 = STCategoryNameWithIdentifier();
          v24 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v23 target:v73 set:0 get:sel__categoryDetailText_ detail:0 cell:4 edit:0];
          [v24 setUserInfo:v22];
          v25 = [MEMORY[0x263F67408] sharedCache];
          v26 = [v25 imageForCategoryIdentifier:v22];
          [v24 setObject:v26 forKeyedSubscript:v20];

          [v74 addObject:v24];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
      }
      while (v18);
    }

    self = v73;
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obja = [v62 bundleIdentifiers];
  uint64_t v27 = [obja countByEnumeratingWithState:&v79 objects:v88 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v80;
    uint64_t v68 = *MEMORY[0x263F672F0];
    v64 = (__CFString *)*MEMORY[0x263F60188];
    uint64_t v66 = *MEMORY[0x263F601A8];
    uint64_t v30 = *MEMORY[0x263F5FFE0];
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v80 != v29) {
          objc_enumerationMutation(obja);
        }
        uint64_t v32 = *(void *)(*((void *)&v79 + 1) + 8 * j);
        v33 = [MEMORY[0x263F670A8] sharedCache];
        v34 = [v33 appInfoForBundleIdentifier:v32];

        v35 = [v34 bundleIdentifier];
        v36 = [v34 displayName];
        v37 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v36 target:self set:0 get:0 detail:0 cell:3 edit:0];
        [v37 setIdentifier:v35];
        [v37 setUserInfo:v35];
        if ([v34 source] == 2 && (objc_msgSend(v35, "isEqualToString:", v68) & 1) == 0)
        {
          [v37 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v66];
          v38 = v64;
        }
        else
        {
          [v37 setObject:objc_opt_class() forKeyedSubscript:v30];
          v38 = @"STAppBundleID";
        }
        [v37 setObject:v35 forKeyedSubscript:v38];
        [v74 addObject:v37];

        self = v73;
      }
      uint64_t v28 = [obja countByEnumeratingWithState:&v79 objects:v88 count:16];
    }
    while (v28);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v63 = [v62 webDomains];
  id v39 = v74;
  uint64_t v69 = [v63 countByEnumeratingWithState:&v75 objects:v87 count:16];
  if (v69)
  {
    uint64_t v67 = *(void *)v76;
    uint64_t v65 = *MEMORY[0x263F60140];
    do
    {
      for (uint64_t k = 0; k != v69; ++k)
      {
        if (*(void *)v76 != v67) {
          objc_enumerationMutation(v63);
        }
        uint64_t v41 = *(void **)(*((void *)&v75 + 1) + 8 * k);
        uint64_t v42 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v41 target:self set:0 get:0 detail:0 cell:3 edit:0];
        [v42 setUserInfo:v41];
        uint64_t v43 = [MEMORY[0x263F82DA0] currentTraitCollection];
        uint64_t v44 = [v43 userInterfaceStyle];

        id v45 = v41;
        if ([v45 length])
        {
          id objb = (id)v44;
          v46 = objc_opt_new();
          [v46 setScheme:@"https"];
          [v46 setHost:v45];
          v47 = [v46 URL];
          v48 = objc_msgSend(v47, "_lp_highLevelDomain");
          v49 = [v46 host];
          uint64_t v50 = [v46 URL];
          id v51 = v48;
          id v52 = v49;
          id v53 = v50;
          if ([v51 length])
          {
            v54 = [v51 substringToIndex:1];
            uint64_t v55 = [v54 uppercaseString];
          }
          else
          {
            v56 = [v52 substringToIndex:1];
            uint64_t v55 = [v56 uppercaseString];

            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v93 = v53;
              __int16 v94 = 2112;
              id v95 = v52;
              _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to extract high level domain for URL: %@. Creating initial for host instead: %@", buf, 0x16u);
            }
          }
          id v39 = v74;

          uint64_t v44 = (uint64_t)objb;
          self = v73;
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            [(STAllowanceDetailListController *)v90 createBudgetedItemSpecifiers];
          }
          uint64_t v55 = 0;
        }

        v57 = [MEMORY[0x263F67408] sharedCache];
        v58 = [v57 monogramImageForInitial:v55 useDarkColors:v44 == 2];
        [v42 setObject:v58 forKeyedSubscript:v65];

        [v39 addObject:v42];
      }
      uint64_t v69 = [v63 countByEnumeratingWithState:&v75 objects:v87 count:16];
    }
    while (v69);
  }

  return v39;
}

- (id)_categoryDetailText:(id)a3
{
  BOOL v3 = +[STScreenTimeSettingsUIBundle bundle];
  id v4 = [v3 localizedStringForKey:@"AllItemsSelectedDetailText" value:&stru_26D9391A8 table:0];

  return v4;
}

- (void)_setAskForMoreTime:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  id v6 = [(STAllowanceDetailListController *)self allowance];
  [v6 setBehaviorType:v5];
}

- (id)_askForMoreTime:(id)a3
{
  BOOL v3 = NSNumber;
  id v4 = [(STAllowanceDetailListController *)self allowance];
  uint64_t v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "behaviorType") == 1);

  return v5;
}

- (void)_setAllowanceEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  id v6 = [(STAllowanceDetailListController *)self allowance];
  [v6 setAllowanceEnabled:v5];
}

- (id)_allowanceEnabled:(id)a3
{
  BOOL v3 = NSNumber;
  id v4 = [(STAllowanceDetailListController *)self allowance];
  uint64_t v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "allowanceEnabled"));

  return v5;
}

- (id)atEndOfLimitFooterText
{
  v2 = [(STAllowanceDetailListController *)self coordinator];
  BOOL v3 = [v2 viewModel];
  id v4 = [v3 me];

  if ([v4 isRemoteUser])
  {
    uint64_t v5 = [v4 name];

    if (v5)
    {
      id v6 = objc_opt_new();
      uint64_t v7 = [v4 name];
      id v8 = [v6 personNameComponentsFromString:v7];

      double v9 = [v8 givenName];
      if ([v9 length])
      {
        uint64_t v10 = NSString;
        id v11 = +[STScreenTimeSettingsUIBundle bundle];
        id v12 = [v11 localizedStringForKey:@"AtAllowanceRemoteFooterText" value:&stru_26D9391A8 table:0];
        id v13 = objc_msgSend(v10, "localizedStringWithFormat:", v12, v9);

        goto LABEL_9;
      }
    }
    int v14 = +[STScreenTimeSettingsUIBundle bundle];
    id v8 = v14;
    id v15 = @"AtAllowanceRemoteGenericFooterText";
  }
  else
  {
    int v14 = +[STScreenTimeSettingsUIBundle bundle];
    id v8 = v14;
    id v15 = @"AtAllowanceLocalFooterText";
  }
  id v13 = [v14 localizedStringForKey:v15 value:&stru_26D9391A8 table:0];
LABEL_9:

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)STAllowanceDetailListController;
  id v6 = a4;
  uint64_t v7 = [(STAllowanceDetailListController *)&v13 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[STAllowanceDetailListController indexForIndexPath:](self, "indexForIndexPath:", v6, v13.receiver, v13.super_class);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = 0;
  }
  else
  {
    double v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndexedSubscript:v8];
    uint64_t v10 = [(STAllowanceDetailListController *)self budgetedItemSpecifiers];
    int v11 = [v10 containsObject:v9];

    if (v11) {
      [v7 setSelectionStyle:0];
    }
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(STAllowanceDetailListController *)self indexForIndexPath:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = 0;
  }
  else
  {
    double v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndexedSubscript:v8];
  }
  uint64_t v10 = [(STAllowanceDetailListController *)self timeSpecifier];

  if (v9 == v10) {
    [(STAllowanceDetailListController *)self _showOrHidePickerSpecifierForSpecifier:v9 highlight:1];
  }
  v11.receiver = self;
  v11.super_class = (Class)STAllowanceDetailListController;
  [(STAllowanceDetailListController *)&v11 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (void)datePickerChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 calendar];
  id v6 = [v4 date];

  id v14 = [v5 components:96 fromDate:v6];

  id v7 = [(STAllowanceDetailListController *)self allowance];
  [v7 setTime:v14];

  uint64_t v8 = [(STAllowanceDetailListController *)self allowance];
  [v8 setTimeByDay:0];

  double v9 = [(STAllowanceDetailListController *)self timeSpecifier];
  [(STAllowanceDetailListController *)self reloadSpecifier:v9];

  uint64_t v10 = [(STAllowanceDetailListController *)self selectedTimeSpecifier];
  objc_super v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F602B0]];

  if ([(STAllowanceDetailListController *)self hasSetBudgetTime]) {
    [MEMORY[0x263F825C8] tableCellBlueTextColor];
  }
  else {
  id v12 = [(STAllowanceDetailListController *)self defaultTimeCellDetailTextColor];
  }
  objc_super v13 = [v11 detailTextLabel];
  [v13 setTextColor:v12];

  [(STAllowanceDetailListController *)self updateSaveButton];
  [(STAllowanceDetailListController *)self showOrHideCustomizeDaysSpecifier];
}

- (id)datePickerForSpecifier:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F82650];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v7 setPreferredDatePickerStyle:1];
  [v7 setDatePickerMode:3];
  [v7 _setAllowsZeroCountDownDuration:1];
  uint64_t v8 = objc_opt_new();
  id v9 = [(STAllowanceDetailListController *)self timePickerSpecifier];

  if (v9 == v5)
  {
    objc_super v11 = [(STAllowanceDetailListController *)self allowance];
    uint64_t v12 = [v11 time];

    uint64_t v8 = (void *)v12;
  }
  else
  {
    uint64_t v10 = +[STUILog persistence];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[STAllowanceDetailListController datePickerForSpecifier:](v10);
    }
  }
  objc_super v13 = [v7 calendar];
  id v14 = [v13 dateFromComponents:v8];
  [v7 setDate:v14 animated:1];

  return v7;
}

- (void)customizeDaysListController:(id)a3 didFinishEditingTimeByDay:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v21 = v5;
  id v7 = [v5 allValues];
  uint64_t v8 = [v6 setWithArray:v7];

  if ([v8 count] == 1)
  {
    id v9 = [v8 anyObject];
    uint64_t v10 = [(STAllowanceDetailListController *)self allowance];
    [v10 setTime:v9];

    objc_super v11 = [(STAllowanceDetailListController *)self allowance];
    uint64_t v12 = v11;
    id v13 = 0;
  }
  else
  {
    objc_super v11 = [(STAllowanceDetailListController *)self allowance];
    uint64_t v12 = v11;
    id v13 = v21;
  }
  [v11 setTimeByDay:v13];

  id v14 = [(STAllowanceDetailListController *)self timePickerSpecifier];
  [(STAllowanceDetailListController *)self removeSpecifier:v14 animated:1];

  id v15 = [(STAllowanceDetailListController *)self customizeDaysSpecifier];
  [(STAllowanceDetailListController *)self removeSpecifier:v15 animated:1];

  v16 = [(STAllowanceDetailListController *)self selectedTimeSpecifier];
  uint64_t v17 = [v16 objectForKeyedSubscript:*MEMORY[0x263F602B0]];

  uint64_t v18 = [(STAllowanceDetailListController *)self defaultTimeCellDetailTextColor];
  uint64_t v19 = [v17 detailTextLabel];
  [v19 setTextColor:v18];

  [(STAllowanceDetailListController *)self setSelectedTimeSpecifier:0];
  uint64_t v20 = [(STAllowanceDetailListController *)self timeSpecifier];
  [(STAllowanceDetailListController *)self reloadSpecifier:v20];

  [(STAllowanceDetailListController *)self updateSaveButton];
  [(STAllowanceDetailListController *)self showOrHideCustomizeDaysSpecifier];
}

- (STAllowanceDetailListControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STAllowanceDetailListControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (STAllowance)allowance
{
  return self->_allowance;
}

- (void)setAllowance:(id)a3
{
}

- (BOOL)isSetupController
{
  return self->_isSetupController;
}

- (void)setIsSetupController:(BOOL)a3
{
  self->_isSetupController = a3;
}

- (BOOL)useBackButton
{
  return self->_useBackButton;
}

- (void)setUseBackButton:(BOOL)a3
{
  self->_useBackButton = a3;
}

- (BOOL)creatingNewAllowance
{
  return self->_creatingNewAllowance;
}

- (void)setCreatingNewAllowance:(BOOL)a3
{
  self->_creatingNewAllowance = a3;
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (PSSpecifier)timeGroupSpecifier
{
  return self->_timeGroupSpecifier;
}

- (void)setTimeGroupSpecifier:(id)a3
{
}

- (PSSpecifier)timeSpecifier
{
  return self->_timeSpecifier;
}

- (void)setTimeSpecifier:(id)a3
{
}

- (PSSpecifier)timePickerSpecifier
{
  return self->_timePickerSpecifier;
}

- (void)setTimePickerSpecifier:(id)a3
{
}

- (PSSpecifier)customizeDaysSpecifier
{
  return self->_customizeDaysSpecifier;
}

- (void)setCustomizeDaysSpecifier:(id)a3
{
}

- (PSSpecifier)selectedTimeSpecifier
{
  return self->_selectedTimeSpecifier;
}

- (void)setSelectedTimeSpecifier:(id)a3
{
}

- (NSArray)budgetedItemSpecifiers
{
  return self->_budgetedItemSpecifiers;
}

- (void)setBudgetedItemSpecifiers:(id)a3
{
}

- (BOOL)didDeleteAllowance
{
  return self->_didDeleteAllowance;
}

- (void)setDidDeleteAllowance:(BOOL)a3
{
  self->_didDeleteAllowance = a3;
}

- (UIColor)defaultTimeCellDetailTextColor
{
  return self->_defaultTimeCellDetailTextColor;
}

- (void)setDefaultTimeCellDetailTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTimeCellDetailTextColor, 0);
  objc_storeStrong((id *)&self->_budgetedItemSpecifiers, 0);
  objc_storeStrong((id *)&self->_selectedTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_customizeDaysSpecifier, 0);
  objc_storeStrong((id *)&self->_timePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_timeSpecifier, 0);
  objc_storeStrong((id *)&self->_timeGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_allowance, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)createBudgetedItemSpecifiers
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Web domain name must have at least one character for monogram: %@", buf, 0xCu);
}

- (void)datePickerForSpecifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_225B06000, log, OS_LOG_TYPE_ERROR, "Trying to get date picker for invalid specifier.", v1, 2u);
}

@end