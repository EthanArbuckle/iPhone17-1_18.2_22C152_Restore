@interface STAlwaysAllowListController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (NSArray)allowedAppsSpecifiers;
- (NSArray)chooseAppsSpecifiers;
- (NSArray)chooseBundleIDs;
- (NSSet)installedBundleIDs;
- (PSSpecifier)allowedAppsGroupSpecifier;
- (PSSpecifier)allowedContactsSpecifier;
- (PSSpecifier)chooseAppsGroupSpecifier;
- (STAlwaysAllowList)alwaysAllowList;
- (STAlwaysAllowListController)init;
- (STAlwaysAllowListControllerDelegate)delegate;
- (id)_allowedContactsDuringDowntimeText:(id)a3;
- (id)appSpecifiersForBundleIDs:(id)a3;
- (id)createAllowedAppsSpecifiers;
- (id)createChooseAppsSpecifiers;
- (id)removeMessagesConfirmationPrompt;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_alwaysAllowListDidChange:(id)a3;
- (void)_communicationLimitsDidChangeFrom:(id)a3 to:(id)a4;
- (void)_insertAllowedAppSpecifier:(id)a3;
- (void)_removeAllowedAppSpecifier:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllowedIdentifier:(id)a3 withSpecifier:(id)a4;
- (void)setAllowedAppsGroupSpecifier:(id)a3;
- (void)setAllowedAppsSpecifiers:(id)a3;
- (void)setAllowedContactsSpecifier:(id)a3;
- (void)setAlwaysAllowList:(id)a3;
- (void)setChooseAppsGroupSpecifier:(id)a3;
- (void)setChooseAppsSpecifiers:(id)a3;
- (void)setChooseBundleIDs:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInstalledBundleIDs:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation STAlwaysAllowListController

- (STAlwaysAllowListController)init
{
  v8.receiver = self;
  v8.super_class = (Class)STAlwaysAllowListController;
  v2 = [(STPINListViewController *)&v8 init];
  if (v2)
  {
    v3 = +[STScreenTimeSettingsUIBundle bundle];
    v4 = [v3 localizedStringForKey:@"AlwaysAllowTitle" value:&stru_26D9391A8 table:0];
    [(STAlwaysAllowListController *)v2 setTitle:v4];
  }
  v7.receiver = v2;
  v7.super_class = (Class)STAlwaysAllowListController;
  v5 = [(STPINListViewController *)&v7 coordinator];
  [v5 addObserver:v2 forKeyPath:@"timeAllowancesCoordinator.viewModel.alwaysAllowList" options:3 context:"KVOContextAlwaysAllowedListController"];
  [v5 addObserver:v2 forKeyPath:@"contentPrivacyCoordinator.viewModel.communicationLimits" options:3 context:"KVOContextAlwaysAllowedListController"];

  return v2;
}

- (void)dealloc
{
  v3 = [(STPINListViewController *)self coordinator];
  [v3 removeObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.alwaysAllowList" context:"KVOContextAlwaysAllowedListController"];
  [v3 removeObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.communicationLimits" context:"KVOContextAlwaysAllowedListController"];

  v4.receiver = self;
  v4.super_class = (Class)STAlwaysAllowListController;
  [(STListViewController *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STPINListViewController *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.alwaysAllowList" context:"KVOContextAlwaysAllowedListController"];
  [v5 removeObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.communicationLimits" context:"KVOContextAlwaysAllowedListController"];
  v12.receiver = self;
  v12.super_class = (Class)STAlwaysAllowListController;
  [(STPINListViewController *)&v12 setCoordinator:v4];
  v6 = [v5 contentPrivacyCoordinator];
  objc_super v7 = [v6 viewModel];
  objc_super v8 = [v7 communicationLimits];
  v9 = [v4 contentPrivacyCoordinator];
  v10 = [v9 viewModel];
  v11 = [v10 communicationLimits];
  [(STAlwaysAllowListController *)self _communicationLimitsDidChangeFrom:v8 to:v11];

  [v4 addObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.alwaysAllowList" options:3 context:"KVOContextAlwaysAllowedListController"];
  [v4 addObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.communicationLimits" options:3 context:"KVOContextAlwaysAllowedListController"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextAlwaysAllowedListController")
  {
    [(STPINListViewController *)self coordinator];

    if ([v10 isEqualToString:@"contentPrivacyCoordinator.viewModel.communicationLimits"])
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
      [(STAlwaysAllowListController *)self _communicationLimitsDidChangeFrom:v12 to:v14];
    }
    else
    {
      [(STPINListViewController *)self coordinator];

      if (![v10 isEqualToString:@"timeAllowancesCoordinator.viewModel.alwaysAllowList"])goto LABEL_14; {
      objc_super v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      }
      v16 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v16)
      {

        objc_super v12 = 0;
      }
      [(STAlwaysAllowListController *)self _alwaysAllowListDidChange:v12];
    }

    goto LABEL_14;
  }
  v17.receiver = self;
  v17.super_class = (Class)STAlwaysAllowListController;
  [(STListViewController *)&v17 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_14:
}

- (void)_alwaysAllowListDidChange:(id)a3
{
  id v31 = a3;
  id v4 = (void *)MEMORY[0x263EFFA08];
  v5 = [(STAlwaysAllowListController *)self alwaysAllowList];
  v6 = [v5 allowedBundleIDs];
  objc_super v7 = [v4 setWithArray:v6];

  objc_super v8 = (void *)MEMORY[0x263EFFA08];
  if (v31)
  {
    v9 = [v31 allowedBundleIDs];
    id v10 = [v8 setWithArray:v9];
  }
  else
  {
    id v10 = objc_opt_new();
  }
  if (([v7 isEqualToSet:v10] & 1) == 0)
  {
    id v11 = [(STPINListViewController *)self coordinator];
    objc_super v12 = [v11 timeAllowancesCoordinator];
    v13 = [v12 viewModel];
    v14 = [v13 alwaysAllowList];
    [(STAlwaysAllowListController *)self setAlwaysAllowList:v14];

    v15 = objc_opt_new();
    v16 = [MEMORY[0x263F318B0] systemUnblockableBundleIdentifiersForDeviceFamily:102];
    if (v16)
    {
      [v15 unionSet:v16];
    }
    else
    {
      objc_super v17 = objc_opt_new();
      [v15 unionSet:v17];
    }
    v18 = [MEMORY[0x263F318B0] systemBlockableBundleIdentifiersForDeviceFamily:102];
    if (v18)
    {
      [v15 unionSet:v18];
    }
    else
    {
      v19 = objc_opt_new();
      [v15 unionSet:v19];
    }
    v20 = [MEMORY[0x263F318B0] systemHiddenBundleIdentifiersForDeviceFamily:102];
    if (v20)
    {
      [v15 unionSet:v20];
    }
    else
    {
      v21 = objc_opt_new();
      [v15 unionSet:v21];
    }
    id v22 = objc_alloc(MEMORY[0x263EFF9C0]);
    v23 = [(STAlwaysAllowListController *)self alwaysAllowList];
    v24 = [v23 allowedBundleIDs];
    v25 = (void *)[v22 initWithArray:v24];

    [v25 unionSet:v15];
    v26 = [(STPINListViewController *)self coordinator];
    v27 = [v26 viewModel];
    v28 = [v27 installedBundleIDs];

    [(STAlwaysAllowListController *)self setInstalledBundleIDs:v28];
    v29 = (void *)[v28 mutableCopy];
    [v29 minusSet:v25];
    v30 = [v29 allObjects];
    [(STAlwaysAllowListController *)self setChooseBundleIDs:v30];

    [(STAlwaysAllowListController *)self reloadSpecifiers];
  }
}

- (void)_communicationLimitsDidChangeFrom:(id)a3 to:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 != v6 && ([v8 isEqual:v6] & 1) == 0)
  {
    objc_super v7 = [(STAlwaysAllowListController *)self allowedContactsSpecifier];
    [(STAlwaysAllowListController *)self reloadSpecifier:v7];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)STAlwaysAllowListController;
  [(STAlwaysAllowListController *)&v5 viewDidLoad];
  uint64_t v3 = (int)*MEMORY[0x263F5FDD0];
  [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v3) setEditing:1];
  [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v3) setAllowsSelectionDuringEditing:1];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STAlwaysAllowListController.viewDidLoad", v4, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)STAlwaysAllowListController;
  [(STPINListViewController *)&v16 viewDidAppear:a3];
  id v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.ScreenTime/ALWAYS_ALLOWED"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  id v6 = [MEMORY[0x263EFF960] currentLocale];
  objc_super v7 = +[STScreenTimeSettingsUIBundle bundle];
  id v8 = [v7 bundleURL];
  v9 = (void *)[v5 initWithKey:@"AlwaysAllowTitle" table:@"Localizable" locale:v6 bundleURL:v8];

  id v10 = objc_alloc(MEMORY[0x263F08DB0]);
  id v11 = [MEMORY[0x263EFF960] currentLocale];
  objc_super v12 = +[STScreenTimeSettingsUIBundle bundle];
  v13 = [v12 bundleURL];
  v14 = (void *)[v10 initWithKey:@"ScreenTimeControllerTitle" table:@"Localizable" locale:v11 bundleURL:v13];

  v17[0] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(STAlwaysAllowListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.screen-time" title:v9 localizedNavigationComponents:v15 deepLink:v4];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(STAlwaysAllowListController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(STAlwaysAllowListController *)self alwaysAllowList];
    [v5 alwaysAllowListController:self didFinishEditingAlwaysAllowList:v6];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STAlwaysAllowListController.viewWillDisappear", buf, 2u);
  }
  v7.receiver = self;
  v7.super_class = (Class)STAlwaysAllowListController;
  [(STAlwaysAllowListController *)&v7 viewWillDisappear:v3];
}

- (void)willResignActive
{
  BOOL v3 = [(STAlwaysAllowListController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(STAlwaysAllowListController *)self alwaysAllowList];
    [v3 alwaysAllowListController:self didFinishEditingAlwaysAllowList:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)STAlwaysAllowListController;
  [(STAlwaysAllowListController *)&v5 willResignActive];
}

- (id)specifiers
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_21;
  }
  objc_super v5 = objc_opt_new();
  id v6 = +[STScreenTimeSettingsUIBundle bundle];
  v53 = [(STPINListViewController *)self coordinator];
  objc_super v7 = [v53 viewModel];
  id v8 = [v7 me];

  v51 = v8;
  v52 = v6;
  if ([v8 type])
  {
    v9 = (void *)MEMORY[0x263F5FC40];
    id v10 = [v6 localizedStringForKey:@"AllowedContactsGroupSpecifierName" value:&stru_26D9391A8 table:0];
    id v11 = [v9 groupSpecifierWithName:v10];

    objc_super v12 = [v8 givenName];
    if ([v8 isRemoteUser])
    {
      if (v12)
      {
        v13 = [v6 localizedStringForKey:@"AllowedContactsGroupSpecifierRemoteHeader" value:&stru_26D9391A8 table:0];
        v14 = v6;
        id v15 = [NSString alloc];
        objc_super v16 = [MEMORY[0x263EFF960] currentLocale];
        objc_super v17 = objc_msgSend(v15, "initWithFormat:locale:", v13, v16, v12);

LABEL_10:
        uint64_t v18 = *MEMORY[0x263F60120];
        [v11 setObject:v17 forKeyedSubscript:*MEMORY[0x263F60120]];
        [v5 addObject:v11];
        v20 = (void *)MEMORY[0x263F5FC40];
        v21 = [v14 localizedStringForKey:@"AllowedContactsSpecifierName" value:&stru_26D9391A8 table:0];
        v50 = v11;
        uint64_t v22 = objc_opt_class();
        v23 = [v20 preferenceSpecifierNamed:v21 target:self set:0 get:sel__allowedContactsDuringDowntimeText_ detail:v22 cell:2 edit:objc_opt_class()];

        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        [v23 setObject:v25 forKeyedSubscript:*MEMORY[0x263F60228]];

        [v23 setObject:&unk_26D966DC0 forKeyedSubscript:*MEMORY[0x263F60320]];
        [v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __41__STAlwaysAllowListController_specifiers__block_invoke;
        aBlock[3] = &unk_2647671D8;
        aBlock[4] = self;
        v26 = _Block_copy(aBlock);
        v27 = _Block_copy(v26);
        [v23 setObject:v27 forKeyedSubscript:0x26D93FF08];

        [v23 setObject:v53 forKeyedSubscript:0x26D940528];
        [(STAlwaysAllowListController *)self setAllowedContactsSpecifier:v23];
        [v5 addObject:v23];

        id v6 = v52;
        goto LABEL_11;
      }
      v19 = @"AllowedContactsGroupSpecifierRemoteGenericHeader";
    }
    else
    {
      v19 = @"AllowedContactsGroupSpecifierLocalHeader";
    }
    [v6 localizedStringForKey:v19 value:&stru_26D9391A8 table:0];
    objc_super v17 = v14 = v6;
    goto LABEL_10;
  }
  uint64_t v18 = *MEMORY[0x263F60120];
LABEL_11:
  v28 = (void *)MEMORY[0x263F5FC40];
  v29 = [v6 localizedStringForKey:@"AllowedAppsGroupSpecifierName" value:&stru_26D9391A8 table:0];
  v30 = [v28 groupSpecifierWithName:v29];

  id v31 = [v6 localizedStringForKey:@"AllowedAppsGroupSpecifierFooter" value:&stru_26D9391A8 table:0];
  [v30 setObject:v31 forKeyedSubscript:v18];

  [(STAlwaysAllowListController *)self setAllowedAppsGroupSpecifier:v30];
  [v5 addObject:v30];
  v32 = (void *)MEMORY[0x263F5FC40];
  uint64_t v33 = [v6 localizedStringForKey:@"ChooseAppsGroupSpecifierName" value:&stru_26D9391A8 table:0];
  v34 = [v32 groupSpecifierWithName:v33];
  [(STAlwaysAllowListController *)self setChooseAppsGroupSpecifier:v34];

  v35 = [(STAlwaysAllowListController *)self createAllowedAppsSpecifiers];
  [(STAlwaysAllowListController *)self setAllowedAppsSpecifiers:v35];

  v36 = [(STAlwaysAllowListController *)self allowedAppsSpecifiers];
  [v5 addObjectsFromArray:v36];

  v37 = [(STAlwaysAllowListController *)self chooseAppsGroupSpecifier];
  [v5 addObject:v37];

  v38 = [(STAlwaysAllowListController *)self createChooseAppsSpecifiers];
  [(STAlwaysAllowListController *)self setChooseAppsSpecifiers:v38];

  v39 = [(STAlwaysAllowListController *)self chooseAppsSpecifiers];
  [v5 addObjectsFromArray:v39];

  v40 = [(STAlwaysAllowListController *)self alwaysAllowList];
  LOBYTE(v33) = [v40 shouldAllowEditing];

  if ((v33 & 1) == 0)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v41 = v5;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v55;
      uint64_t v45 = *MEMORY[0x263F600A8];
      uint64_t v46 = MEMORY[0x263EFFA80];
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v55 != v44) {
            objc_enumerationMutation(v41);
          }
          [*(id *)(*((void *)&v54 + 1) + 8 * i) setObject:v46 forKeyedSubscript:v45];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v43);
    }

    id v6 = v52;
  }
  v48 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)v5;

  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
LABEL_21:

  return v4;
}

void __41__STAlwaysAllowListController_specifiers__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v7 = [v3 table];
    id v4 = *(void **)(a1 + 32);
    objc_super v5 = [v4 allowedContactsSpecifier];
    id v6 = [v4 indexPathForSpecifier:v5];
    [v3 tableView:v7 didSelectRowAtIndexPath:v6];
  }
}

- (id)_allowedContactsDuringDowntimeText:(id)a3
{
  uint64_t v3 = [(STPINListViewController *)self coordinator];
  id v4 = [v3 contentPrivacyCoordinator];
  objc_super v5 = [v4 viewModel];
  id v6 = [v5 communicationLimits];
  uint64_t v7 = [v6 downtimeCommunicationLimit];

  switch(v7)
  {
    case 0:
      id v8 = +[STScreenTimeSettingsUIBundle bundle];
      v9 = v8;
      id v10 = @"AllowEveryoneSpecifierName";
      goto LABEL_7;
    case 1:
      id v8 = +[STScreenTimeSettingsUIBundle bundle];
      v9 = v8;
      id v10 = @"AllowGroupsWithOneContactSpecifierName";
      goto LABEL_7;
    case 2:
      id v8 = +[STScreenTimeSettingsUIBundle bundle];
      v9 = v8;
      id v10 = @"AllowContactsOnlySpecifierName";
      goto LABEL_7;
    case 3:
      id v8 = +[STScreenTimeSettingsUIBundle bundle];
      v9 = v8;
      id v10 = @"AllowSpecificContactsSpecifierName";
LABEL_7:
      id v11 = [v8 localizedStringForKey:v10 value:&stru_26D9391A8 table:0];

      break;
    default:
      id v11 = 0;
      break;
  }

  return v11;
}

- (id)createAllowedAppsSpecifiers
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F67108] defaultAlwaysAllowBundleIDs];
  id v4 = [(STAlwaysAllowListController *)self alwaysAllowList];
  objc_super v5 = [v4 allowedBundleIDs];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", v13, (void)v19))
        {
          [v6 removeObject:v13];
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  v14 = [(STAlwaysAllowListController *)self appSpecifiersForBundleIDs:v7];
  id v15 = [(STAlwaysAllowListController *)self appSpecifiersForBundleIDs:v6];
  objc_super v16 = (void *)[v15 mutableCopy];

  [v16 sortUsingSelector:sel_titleCompare_];
  objc_super v17 = [v14 arrayByAddingObjectsFromArray:v16];

  return v17;
}

- (id)createChooseAppsSpecifiers
{
  uint64_t v3 = [(STAlwaysAllowListController *)self chooseBundleIDs];
  id v4 = [(STAlwaysAllowListController *)self appSpecifiersForBundleIDs:v3];
  objc_super v5 = (void *)[v4 mutableCopy];

  [v5 sortUsingSelector:sel_titleCompare_];

  return v5;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v5 = [(STAlwaysAllowListController *)self indexForIndexPath:a4];
  id v6 = [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndexedSubscript:v5];
  uint64_t v7 = [v6 userInfo];
  char v8 = [v7 isEqualToString:@"com.apple.mobilephone"] ^ 1;

  return v8;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5 = [(STAlwaysAllowListController *)self indexForIndexPath:a4];
  id v6 = [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndexedSubscript:v5];
  uint64_t v7 = [v6 cellType];
  char v8 = [v6 userInfo];
  uint64_t v9 = v8;
  if (v7 == 3 && ([v8 isEqualToString:@"com.apple.mobilephone"] & 1) == 0)
  {
    uint64_t v11 = [(STAlwaysAllowListController *)self alwaysAllowList];
    objc_super v12 = [v11 allowedBundleIDs];
    int v13 = [v12 containsObject:v9];

    if (v13) {
      int64_t v10 = 1;
    }
    else {
      int64_t v10 = 2;
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(STAlwaysAllowListController *)self allowedContactsSpecifier];
  uint64_t v7 = [(STAlwaysAllowListController *)self specifierAtIndexPath:v5];

  return v6 == v7;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(STAlwaysAllowListController *)self allowedContactsSpecifier];
  uint64_t v7 = [(STAlwaysAllowListController *)self specifierAtIndexPath:v5];

  return v6 != v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)STAlwaysAllowListController;
  id v6 = a4;
  uint64_t v7 = [(STListViewController *)&v11 tableView:a3 cellForRowAtIndexPath:v6];
  char v8 = [(STAlwaysAllowListController *)self allowedContactsSpecifier];
  id v9 = [(STAlwaysAllowListController *)self indexPathForSpecifier:v8];

  if (v9 == v6) {
    [v7 setEditingAccessoryType:1];
  }

  return v7;
}

- (id)removeMessagesConfirmationPrompt
{
  uint64_t v3 = [(STPINListViewController *)self coordinator];
  id v4 = [v3 viewModel];
  id v5 = [v4 me];

  LODWORD(v4) = [v5 isRemoteUser];
  id v6 = +[STScreenTimeSettingsUIBundle bundle];
  if (v4)
  {
    uint64_t v7 = [v5 givenName];
    if (v7)
    {
      char v8 = (void *)v7;
      id v9 = NSString;
      int64_t v10 = [v6 localizedStringForKey:@"AlwaysAllowRemoveMessagesConfirmPromptRemote" value:&stru_26D9391A8 table:0];
      objc_super v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);

      goto LABEL_8;
    }
  }
  else
  {
    objc_super v12 = [(STPINListViewController *)self coordinator];
    int v13 = [v12 viewModel];
    int v14 = [v13 isCloudSyncEnabled];

    if (!v14)
    {
      id v15 = @"AlwaysAllowRemoveMessagesConfirmPromptLocal";
      goto LABEL_7;
    }
  }
  id v15 = @"AlwaysAllowRemoveMessagesConfirmPromptCloud";
LABEL_7:
  objc_super v11 = [v6 localizedStringForKey:v15 value:&stru_26D9391A8 table:0];
LABEL_8:

  return v11;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7 = [(STAlwaysAllowListController *)self indexForIndexPath:a5];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    char v8 = [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndexedSubscript:v7];
    id v9 = [(STPINListViewController *)self coordinator];
    if ([v9 isPasscodeEnabled]) {
      int v10 = [v9 hasAlreadyEnteredPINForSession] ^ 1;
    }
    else {
      int v10 = 0;
    }
    if (a4 == 1)
    {
      if (!v10)
      {
        [(STAlwaysAllowListController *)self _removeAllowedAppSpecifier:v8];
        goto LABEL_14;
      }
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __78__STAlwaysAllowListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2;
      v12[3] = &unk_264766FD8;
      v12[4] = self;
      id v13 = v8;
      [(STPINListViewController *)self showPINSheet:v13 completion:v12];
      objc_super v11 = v13;
    }
    else
    {
      if (a4 != 2)
      {
LABEL_14:

        return;
      }
      if (!v10)
      {
        [(STAlwaysAllowListController *)self _insertAllowedAppSpecifier:v8];
        goto LABEL_14;
      }
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __78__STAlwaysAllowListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
      v14[3] = &unk_264766FD8;
      v14[4] = self;
      id v15 = v8;
      [(STPINListViewController *)self showPINSheet:v15 completion:v14];
      objc_super v11 = v15;
    }

    goto LABEL_14;
  }
}

uint64_t __78__STAlwaysAllowListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _insertAllowedAppSpecifier:*(void *)(result + 40)];
  }
  return result;
}

uint64_t __78__STAlwaysAllowListController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _removeAllowedAppSpecifier:*(void *)(result + 40)];
  }
  return result;
}

- (void)_insertAllowedAppSpecifier:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(STAlwaysAllowListController *)self chooseBundleIDs];
  uint64_t v7 = (void *)[v6 mutableCopy];

  [v7 removeObject:v5];
  v30 = v7;
  char v8 = (void *)[v7 copy];
  [(STAlwaysAllowListController *)self setChooseBundleIDs:v8];

  id v9 = [(STAlwaysAllowListController *)self chooseAppsSpecifiers];
  int v10 = (void *)[v9 mutableCopy];

  [v10 removeObject:v4];
  [(STAlwaysAllowListController *)self setChooseAppsSpecifiers:v10];
  [(STAlwaysAllowListController *)self removeSpecifier:v4 animated:1];
  objc_super v11 = [(STAlwaysAllowListController *)self alwaysAllowList];
  objc_super v12 = [v11 allowedBundleIDs];
  id v13 = (void *)[v12 mutableCopy];

  [v13 addObject:v5];
  int v14 = (void *)[v13 copy];
  id v15 = [(STAlwaysAllowListController *)self alwaysAllowList];
  [v15 setAllowedBundleIDs:v14];

  [(STAlwaysAllowListController *)self createAllowedAppsSpecifiers];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    v28 = v13;
    v29 = v10;
    uint64_t v19 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v22 = [v21 identifier];
        int v23 = [v22 isEqualToString:v5];

        if (v23)
        {
          uint64_t v24 = [v16 indexOfObject:v21];
          goto LABEL_11;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v18) {
        continue;
      }
      break;
    }
    uint64_t v24 = 0;
LABEL_11:
    id v13 = v28;
    int v10 = v29;
  }
  else
  {
    uint64_t v24 = 0;
  }

  v25 = [(STAlwaysAllowListController *)self allowedAppsSpecifiers];
  v26 = (void *)[v25 mutableCopy];

  [v26 insertObject:v4 atIndex:v24];
  [(STAlwaysAllowListController *)self setAllowedAppsSpecifiers:v26];
  if (v24) {
    [v26 objectAtIndexedSubscript:v24 - 1];
  }
  else {
  v27 = [(STAlwaysAllowListController *)self allowedAppsGroupSpecifier];
  }
  [(STAlwaysAllowListController *)self insertSpecifier:v4 afterSpecifier:v27 animated:1];
}

- (void)_removeAllowedAppSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  if ([v5 isEqualToString:@"com.apple.MobileSMS"])
  {
    id v6 = +[STScreenTimeSettingsUIBundle bundle];
    uint64_t v7 = [v6 localizedStringForKey:@"AlwaysAllowRemoveMessagesConfirmTitle" value:&stru_26D9391A8 table:0];
    char v8 = [(STAlwaysAllowListController *)self removeMessagesConfirmationPrompt];
    id v9 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
    int v10 = (void *)MEMORY[0x263F82400];
    objc_super v11 = [v6 localizedStringForKey:@"AlwaysAllowRemove" value:&stru_26D9391A8 table:0];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __58__STAlwaysAllowListController__removeAllowedAppSpecifier___block_invoke;
    v16[3] = &unk_2647672F0;
    v16[4] = self;
    id v17 = v5;
    id v18 = v4;
    objc_super v12 = [v10 actionWithTitle:v11 style:2 handler:v16];
    [v9 addAction:v12];

    id v13 = (void *)MEMORY[0x263F82400];
    int v14 = [v6 localizedStringForKey:@"ConfirmationButtonCancel" value:&stru_26D9391A8 table:0];
    id v15 = [v13 actionWithTitle:v14 style:1 handler:0];
    [v9 addAction:v15];

    [(STAlwaysAllowListController *)self presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    [(STAlwaysAllowListController *)self removeAllowedIdentifier:v5 withSpecifier:v4];
  }
}

uint64_t __58__STAlwaysAllowListController__removeAllowedAppSpecifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllowedIdentifier:*(void *)(a1 + 40) withSpecifier:*(void *)(a1 + 48)];
}

- (void)removeAllowedIdentifier:(id)a3 withSpecifier:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(STAlwaysAllowListController *)self alwaysAllowList];
  id v9 = [v8 allowedBundleIDs];
  int v10 = (void *)[v9 mutableCopy];

  [v10 removeObject:v6];
  long long v32 = v10;
  objc_super v11 = (void *)[v10 copy];
  objc_super v12 = [(STAlwaysAllowListController *)self alwaysAllowList];
  [v12 setAllowedBundleIDs:v11];

  id v13 = [(STAlwaysAllowListController *)self allowedAppsSpecifiers];
  int v14 = (void *)[v13 mutableCopy];

  [v14 removeObject:v7];
  [(STAlwaysAllowListController *)self setAllowedAppsSpecifiers:v14];
  [(STAlwaysAllowListController *)self removeSpecifier:v7 animated:0];
  id v15 = [(STAlwaysAllowListController *)self chooseBundleIDs];
  id v16 = (void *)[v15 mutableCopy];

  [v16 addObject:v6];
  id v17 = (void *)[v16 copy];
  [(STAlwaysAllowListController *)self setChooseBundleIDs:v17];

  [(STAlwaysAllowListController *)self createChooseAppsSpecifiers];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    v30 = v16;
    long long v31 = v14;
    uint64_t v21 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v18);
        }
        int v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v24 = [v23 identifier];
        int v25 = [v24 isEqualToString:v6];

        if (v25)
        {
          uint64_t v26 = [v18 indexOfObject:v23];
          goto LABEL_11;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v20) {
        continue;
      }
      break;
    }
    uint64_t v26 = 0;
LABEL_11:
    id v16 = v30;
    int v14 = v31;
  }
  else
  {
    uint64_t v26 = 0;
  }

  v27 = [(STAlwaysAllowListController *)self chooseAppsSpecifiers];
  v28 = (void *)[v27 mutableCopy];

  [v28 insertObject:v7 atIndex:v26];
  [(STAlwaysAllowListController *)self setChooseAppsSpecifiers:v28];
  if (v26) {
    [v28 objectAtIndexedSubscript:v26 - 1];
  }
  else {
  v29 = [(STAlwaysAllowListController *)self chooseAppsGroupSpecifier];
  }
  [(STAlwaysAllowListController *)self insertSpecifier:v7 afterSpecifier:v29 animated:1];
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v4 = +[STScreenTimeSettingsUIBundle bundle];
  id v5 = [v4 localizedStringForKey:@"AlwaysAllowRemove" value:&stru_26D9391A8 table:0];

  return v5;
}

- (id)appSpecifiersForBundleIDs:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    uint64_t v7 = *MEMORY[0x263F67308];
    uint64_t v26 = *MEMORY[0x263F60228];
    uint64_t v25 = *MEMORY[0x263F60320];
    uint64_t v22 = *MEMORY[0x263F672F0];
    uint64_t v20 = (__CFString *)*MEMORY[0x263F60188];
    uint64_t v21 = *MEMORY[0x263F601A8];
    uint64_t v24 = *MEMORY[0x263F5FFE0];
    uint64_t v8 = MEMORY[0x263EFFA88];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v11 = [v10 isEqualToString:v7];
        objc_super v12 = [MEMORY[0x263F670A8] sharedCache];
        id v13 = [v12 appInfoForBundleIdentifier:v10 localOnly:v11];

        if (v11 && [v13 source] != 2)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            long long v34 = v10;
            _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_INFO, "Not showing %@ because it's been deleted", buf, 0xCu);
          }
        }
        else
        {
          int v14 = [v13 displayName];
          id v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:3 edit:objc_opt_class()];
          id v16 = (objc_class *)objc_opt_class();
          id v17 = NSStringFromClass(v16);
          [v15 setObject:v17 forKeyedSubscript:v26];

          [v15 setObject:&unk_26D966DC0 forKeyedSubscript:v25];
          [v15 setObject:v8 forKeyedSubscript:0x26D940308];
          [v15 setObject:v8 forKeyedSubscript:0x26D940328];
          [v15 setIdentifier:v10];
          [v15 setUserInfo:v10];
          if ([v13 source] == 2 && (objc_msgSend(v10, "isEqualToString:", v22) & 1) == 0)
          {
            [v15 setObject:v8 forKeyedSubscript:v21];
            id v18 = v20;
          }
          else
          {
            [v15 setObject:objc_opt_class() forKeyedSubscript:v24];
            id v18 = @"STAppBundleID";
          }
          [v15 setObject:v10 forKeyedSubscript:v18];
          [v28 addObject:v15];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v5);
  }

  return v28;
}

- (STAlwaysAllowListControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STAlwaysAllowListControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (STAlwaysAllowList)alwaysAllowList
{
  return self->_alwaysAllowList;
}

- (void)setAlwaysAllowList:(id)a3
{
}

- (NSArray)chooseBundleIDs
{
  return self->_chooseBundleIDs;
}

- (void)setChooseBundleIDs:(id)a3
{
}

- (NSSet)installedBundleIDs
{
  return self->_installedBundleIDs;
}

- (void)setInstalledBundleIDs:(id)a3
{
}

- (PSSpecifier)allowedContactsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setAllowedContactsSpecifier:(id)a3
{
}

- (PSSpecifier)allowedAppsGroupSpecifier
{
  return self->_allowedAppsGroupSpecifier;
}

- (void)setAllowedAppsGroupSpecifier:(id)a3
{
}

- (NSArray)allowedAppsSpecifiers
{
  return self->_allowedAppsSpecifiers;
}

- (void)setAllowedAppsSpecifiers:(id)a3
{
}

- (PSSpecifier)chooseAppsGroupSpecifier
{
  return self->_chooseAppsGroupSpecifier;
}

- (void)setChooseAppsGroupSpecifier:(id)a3
{
}

- (NSArray)chooseAppsSpecifiers
{
  return self->_chooseAppsSpecifiers;
}

- (void)setChooseAppsSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chooseAppsSpecifiers, 0);
  objc_storeStrong((id *)&self->_chooseAppsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_allowedAppsSpecifiers, 0);
  objc_storeStrong((id *)&self->_allowedAppsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_allowedContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_installedBundleIDs, 0);
  objc_storeStrong((id *)&self->_chooseBundleIDs, 0);
  objc_storeStrong((id *)&self->_alwaysAllowList, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end