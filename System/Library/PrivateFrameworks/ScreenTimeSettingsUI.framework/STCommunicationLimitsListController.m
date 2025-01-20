@interface STCommunicationLimitsListController
- (BOOL)syncingiCloudContacts;
- (CNUIFamilyMemberContactsController)familyMemberContactsController;
- (PSSpecifier)allowContactEditingSpecifier;
- (PSSpecifier)duringDowntimeSpecifier;
- (PSSpecifier)duringScreenTimeSpecifier;
- (PSSpecifier)iCloudContactsSpecifier;
- (PSSpecifier)manageContactsGroupSpecifier;
- (PSSpecifier)manageContactsSpecifier;
- (STCommunicationLimits)communicationLimits;
- (STCommunicationLimitsListController)initWithRootViewModelCoordinator:(id)a3;
- (id)_allowContactEditing:(id)a3;
- (id)_manageContacts:(id)a3;
- (id)_manageContactsGroupFooterText;
- (id)_statusPendingDetailText:(id)a3;
- (id)_totaliCloudContactsDetailText:(id)a3;
- (id)specifiers;
- (void)_communicationLimitsDidChangeFrom:(id)a3 to:(id)a4;
- (void)_didCancelSyncingiCloudContacts;
- (void)_didFinishSyncingiCloudContacts;
- (void)_didStartSyncingiCloudContacts;
- (void)_enableAllowContactEditingSwitch:(BOOL)a3;
- (void)_indicateiCloudContactsSyncingStatus;
- (void)_setAllowContactEditing:(id)a3 specifier:(id)a4;
- (void)_setManageContacts:(id)a3 specifier:(id)a4;
- (void)_startSyncingiCloudContacts;
- (void)_updateAllowContactEditing:(id)a3;
- (void)_updateAllowContactEditingWithAlertIfNeeded:(id)a3 forSpecifier:(id)a4;
- (void)_updateManageContactsGroupFooterView;
- (void)dealloc;
- (void)dismissPresentedViewController:(id)a3;
- (void)familyMemberContactsDidChange;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentViewController:(id)a3;
- (void)setAllowContactEditingSpecifier:(id)a3;
- (void)setCommunicationLimits:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDuringDowntimeSpecifier:(id)a3;
- (void)setDuringScreenTimeSpecifier:(id)a3;
- (void)setFamilyMemberContactsController:(id)a3;
- (void)setICloudContactsSpecifier:(id)a3;
- (void)setManageContactsGroupSpecifier:(id)a3;
- (void)setManageContactsSpecifier:(id)a3;
- (void)setSyncingiCloudContacts:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation STCommunicationLimitsListController

- (STCommunicationLimitsListController)initWithRootViewModelCoordinator:(id)a3
{
  v32[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)STCommunicationLimitsListController;
  v5 = [(STPINListViewController *)&v28 initWithRootViewModelCoordinator:v4];
  v6 = [v4 contentPrivacyCoordinator];
  v7 = [v6 viewModel];
  v8 = [v7 communicationLimits];
  uint64_t v9 = [v8 copy];
  communicationLimits = v5->_communicationLimits;
  v5->_communicationLimits = (STCommunicationLimits *)v9;

  v11 = [v4 viewModel];
  v12 = [v11 me];

  if (([v12 isManaged] & 1) != 0 || objc_msgSend(v12, "hasPasscode"))
  {
    v13 = [v12 altDSID];
    if (v13)
    {
      if (![v12 isRemoteUser])
      {
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v14 = [v12 givenName];
      v15 = v14;
      if (v14)
      {
        v32[0] = v14;
        v31[0] = @"member-first-name";
        v31[1] = @"member-dsid";
        v16 = [v12 dsid];
        v31[2] = @"member-altDSID";
        v32[1] = v16;
        v32[2] = v13;
        v17 = NSDictionary;
        v18 = v32;
        v19 = v31;
        uint64_t v20 = 3;
      }
      else
      {
        v21 = +[STUILog communication];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v27 = 0;
          _os_log_impl(&dword_225B06000, v21, OS_LOG_TYPE_DEFAULT, "User's givenName is nil.", v27, 2u);
        }

        v29[0] = @"member-dsid";
        v16 = [v12 dsid];
        v29[1] = @"member-altDSID";
        v30[0] = v16;
        v30[1] = v13;
        v17 = NSDictionary;
        v18 = v30;
        v19 = v29;
        uint64_t v20 = 2;
      }
      v22 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v20];

      v23 = (void *)[objc_alloc(MEMORY[0x263F3BF28]) initWithDictionaryRepresentation:v22];
      uint64_t v24 = [objc_alloc(MEMORY[0x263EFEC40]) initWithFamilyMember:v23 familyMemberContactsPresentation:v5];
      familyMemberContactsController = v5->_familyMemberContactsController;
      v5->_familyMemberContactsController = (CNUIFamilyMemberContactsController *)v24;
    }
    else
    {
      v15 = +[STUILog communication];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[STCommunicationLimitsDowntimeDetailListController viewDidLoad](v15);
      }
    }

    goto LABEL_14;
  }
LABEL_15:
  [v4 addObserver:v5 forKeyPath:@"contentPrivacyCoordinator.viewModel.communicationLimits" options:3 context:"KVOContextCommunicationLimitsListController"];

  return v5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)STCommunicationLimitsListController;
  [(STCommunicationLimitsListController *)&v4 viewDidLoad];
  [(STCommunicationLimitsListController *)self _indicateiCloudContactsSyncingStatus];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STCommunicationLimitsListController.viewDidLoad", v3, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)STCommunicationLimitsListController;
  [(STPINListViewController *)&v16 viewDidAppear:a3];
  objc_super v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.ScreenTime/COMMUNICATION_LIMITS"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  v6 = [MEMORY[0x263EFF960] currentLocale];
  v7 = +[STScreenTimeSettingsUIBundle bundle];
  v8 = [v7 bundleURL];
  uint64_t v9 = (void *)[v5 initWithKey:@"CommunicationLimitsSpecifierName" table:@"Localizable" locale:v6 bundleURL:v8];

  id v10 = objc_alloc(MEMORY[0x263F08DB0]);
  v11 = [MEMORY[0x263EFF960] currentLocale];
  v12 = +[STScreenTimeSettingsUIBundle bundle];
  v13 = [v12 bundleURL];
  uint64_t v14 = (void *)[v10 initWithKey:@"ScreenTimeControllerTitle" table:@"Localizable" locale:v11 bundleURL:v13];

  v17[0] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(STCommunicationLimitsListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.screen-time" title:v9 localizedNavigationComponents:v15 deepLink:v4];
}

- (void)dealloc
{
  v3 = [(STPINListViewController *)self coordinator];
  [v3 removeObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.communicationLimits"];

  v4.receiver = self;
  v4.super_class = (Class)STCommunicationLimitsListController;
  [(STListViewController *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(STPINListViewController *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.communicationLimits"];
  v14.receiver = self;
  v14.super_class = (Class)STCommunicationLimitsListController;
  [(STPINListViewController *)&v14 setCoordinator:v4];
  v6 = [v5 contentPrivacyCoordinator];
  v7 = [v6 viewModel];
  v8 = [v7 communicationLimits];
  uint64_t v9 = [v4 contentPrivacyCoordinator];
  id v10 = [v9 viewModel];
  v11 = [v10 communicationLimits];
  [(STCommunicationLimitsListController *)self _communicationLimitsDidChangeFrom:v8 to:v11];

  [v4 addObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.communicationLimits" options:3 context:"KVOContextCommunicationLimitsListController"];
  v12 = [(STCommunicationLimitsListController *)self duringDowntimeSpecifier];
  [v12 setObject:v4 forKeyedSubscript:0x26D940528];

  v13 = [(STCommunicationLimitsListController *)self duringScreenTimeSpecifier];
  [v13 setObject:v4 forKeyedSubscript:0x26D940528];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == "KVOContextCommunicationLimitsListController")
  {
    id v12 = a3;
    v13 = [(STPINListViewController *)self coordinator];
    int v14 = [v12 isEqualToString:@"contentPrivacyCoordinator.viewModel.communicationLimits"];

    if (v14)
    {
      v15 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
      objc_super v16 = [MEMORY[0x263EFF9D0] null];

      if (v15 == v16)
      {

        v15 = 0;
      }
      v17 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v18 = [MEMORY[0x263EFF9D0] null];

      if (v17 == v18)
      {

        v17 = 0;
      }
      [(STCommunicationLimitsListController *)self _communicationLimitsDidChangeFrom:v15 to:v17];
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)STCommunicationLimitsListController;
    id v11 = a3;
    [(STListViewController *)&v19 observeValueForKeyPath:v11 ofObject:a4 change:v10 context:a6];
  }
}

- (void)_communicationLimitsDidChangeFrom:(id)a3 to:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7 != v6 && ([v7 isEqualToCommunicationLimits:v6] & 1) == 0)
  {
    [(STCommunicationLimitsListController *)self setCommunicationLimits:v6];
    [(STCommunicationLimitsListController *)self reloadSpecifiers];
    if ([v7 contactManagementState] == 1 && objc_msgSend(v6, "contactManagementState") == 2) {
      [(STCommunicationLimitsListController *)self _indicateiCloudContactsSyncingStatus];
    }
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_61;
  }
  id v6 = objc_opt_new();
  v113 = +[STScreenTimeSettingsUIBundle bundle];
  v112 = [(STPINListViewController *)self coordinator];
  id v7 = [v112 viewModel];
  v8 = [v7 me];

  v108 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  id v9 = v8;
  v109 = v9;
  if ([v9 isRemoteUser])
  {
    id v10 = [v9 givenName];
    id v11 = +[STScreenTimeSettingsUIBundle bundle];
    id v12 = v11;
    if (v10)
    {
      uint64_t v13 = [v11 localizedStringForKey:@"CommunicationLimitsRemoteHeaderText" value:&stru_26D9391A8 table:0];

      int v14 = objc_msgSend(NSString, "localizedStringWithFormat:", v13, v10);
      id v12 = (void *)v13;
      id v9 = v109;
    }
    else
    {
      int v14 = [v11 localizedStringForKey:@"CommunicationLimitsRemoteGenericHeaderText" value:&stru_26D9391A8 table:0];
    }
  }
  else
  {
    id v10 = +[STScreenTimeSettingsUIBundle bundle];
    int v14 = [v10 localizedStringForKey:@"CommunicationLimitsLocalHeaderText" value:&stru_26D9391A8 table:0];
  }

  uint64_t v15 = *MEMORY[0x263F600F8];
  [v108 setObject:v14 forKeyedSubscript:*MEMORY[0x263F600F8]];

  [v6 addObject:v108];
  objc_super v16 = (void *)MEMORY[0x263F5FC40];
  v17 = [v113 localizedStringForKey:@"AllowedCommunicationSectionTitle" value:&stru_26D9391A8 table:0];
  v18 = [v16 groupSpecifierWithName:v17];

  uint64_t v19 = [v9 givenName];
  v106 = (void *)v19;
  int v111 = [v9 isRemoteUser];
  uint64_t v102 = v3;
  if (v111)
  {
    if (v19)
    {
      [v113 localizedStringForKey:@"DuringScreenTimeSpecifierRemoteFooterText" value:&stru_26D9391A8 table:0];
      uint64_t v20 = v15;
      v22 = uint64_t v21 = v19;
      id v23 = [NSString alloc];
      uint64_t v24 = [MEMORY[0x263EFF960] currentLocale];
      uint64_t v90 = v21;
      uint64_t v15 = v20;
      uint64_t v25 = objc_msgSend(v23, "initWithFormat:locale:", v22, v24, v90);

      goto LABEL_14;
    }
    v26 = @"DuringScreenTimeSpecifierRemoteGenericFooterText";
  }
  else
  {
    v26 = @"DuringScreenTimeSpecifierLocalFooterText";
  }
  uint64_t v25 = [v113 localizedStringForKey:v26 value:&stru_26D9391A8 table:0];
LABEL_14:
  v100 = (void *)v25;
  [v18 setObject:v25 forKeyedSubscript:v15];
  [v6 addObject:v18];
  uint64_t v27 = [v113 localizedStringForKey:@"DuringScreenTimeSpecifierName" value:&stru_26D9391A8 table:0];
  objc_super v28 = (void *)MEMORY[0x263F5FC40];
  uint64_t v29 = objc_opt_class();
  v99 = (void *)v27;
  v30 = [v28 preferenceSpecifierNamed:v27 target:self set:0 get:0 detail:v29 cell:2 edit:objc_opt_class()];
  v31 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v31);
  uint64_t v104 = *MEMORY[0x263F60228];
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v32);

  uint64_t v103 = *MEMORY[0x263F60320];
  objc_msgSend(v30, "setObject:forKeyedSubscript:", &unk_26D966EB0);
  objc_msgSend(v30, "setObject:forKeyedSubscript:", MEMORY[0x263EFFA88]);
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = *MEMORY[0x263F5FFE0];
  [v30 setObject:v33 forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v112);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__STCommunicationLimitsListController_specifiers__block_invoke;
  aBlock[3] = &unk_2647671D8;
  aBlock[4] = self;
  v98 = _Block_copy(aBlock);
  v35 = _Block_copy(v98);
  [v30 setObject:v35 forKeyedSubscript:0x26D93FF08];

  v110 = [(STCommunicationLimitsListController *)self communicationLimits];
  switch([v110 screenTimeCommunicationLimit])
  {
    case 0:
      v36 = @"AllowEveryoneSpecifierName";
      goto LABEL_18;
    case 1:
      v36 = @"AllowGroupsWithOneContactSpecifierName";
      goto LABEL_18;
    case 2:
      v36 = @"AllowContactsOnlySpecifierName";
LABEL_18:
      uint64_t v37 = [v113 localizedStringForKey:v36 value:&stru_26D9391A8 table:0];
      goto LABEL_21;
    case 3:
      v38 = [MEMORY[0x263F08690] currentHandler];
      [v38 handleFailureInMethod:a2 object:self file:@"STCommunicationLimitsListController.m" lineNumber:223 description:@"Unexpected general communication policy whitelisted contacts"];

      goto LABEL_20;
    default:
LABEL_20:
      uint64_t v37 = 0;
LABEL_21:
      uint64_t v39 = *MEMORY[0x263F602C8];
      [v30 setObject:v37 forKeyedSubscript:*MEMORY[0x263F602C8]];
      [(STCommunicationLimitsListController *)self setDuringScreenTimeSpecifier:v30];
      [v6 addObject:v30];
      v107 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      v101 = v18;
      v97 = (void *)v37;
      if (v111)
      {
        if (v106)
        {
          v40 = [v113 localizedStringForKey:@"DuringDowntimeRemoteFooterText" value:&stru_26D9391A8 table:0];
          uint64_t v41 = objc_msgSend(NSString, "localizedStringWithFormat:", v40, v106);

          uint64_t v42 = v41;
        }
        else
        {
          uint64_t v42 = [v113 localizedStringForKey:@"DuringDowntimeRemoteGenericFooterText" value:&stru_26D9391A8 table:0];
        }
      }
      else
      {
        uint64_t v42 = [v113 localizedStringForKey:@"DuringDowntimeLocalFooterText" value:&stru_26D9391A8 table:0];
      }
      v96 = (void *)v42;
      uint64_t v92 = v15;
      [v107 setObject:v42 forKeyedSubscript:v15];
      [v6 addObject:v107];
      [v113 localizedStringForKey:@"DuringDowntimeSpecifierName" value:&stru_26D9391A8 table:0];
      uint64_t v44 = v43 = v6;
      v45 = (void *)MEMORY[0x263F5FC40];
      uint64_t v46 = objc_opt_class();
      v95 = (void *)v44;
      v47 = [v45 preferenceSpecifierNamed:v44 target:self set:0 get:0 detail:v46 cell:2 edit:objc_opt_class()];
      v48 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v48);
      [v47 setObject:v49 forKeyedSubscript:v104];

      [v47 setObject:&unk_26D966EB0 forKeyedSubscript:v103];
      [v47 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
      [v47 setObject:objc_opt_class() forKeyedSubscript:v34];
      [v47 setObject:v112 forKeyedSubscript:0x26D940528];
      v114[0] = MEMORY[0x263EF8330];
      v114[1] = 3221225472;
      v114[2] = __49__STCommunicationLimitsListController_specifiers__block_invoke_2;
      v114[3] = &unk_2647671D8;
      v114[4] = self;
      v50 = _Block_copy(v114);
      v51 = _Block_copy(v50);
      [v47 setObject:v51 forKeyedSubscript:0x26D93FF08];

      unint64_t v52 = [v110 downtimeCommunicationLimit];
      uint64_t v53 = 0;
      if (v52 <= 3)
      {
        uint64_t v53 = [v113 localizedStringForKey:off_2647676C8[v52] value:&stru_26D9391A8 table:0];
      }
      v94 = (void *)v53;
      [v47 setObject:v53 forKeyedSubscript:v39];
      [(STCommunicationLimitsListController *)self setDuringDowntimeSpecifier:v47];
      [v43 addObject:v47];
      v105 = [(STCommunicationLimitsListController *)self familyMemberContactsController];
      v54 = v109;
      v55 = v43;
      if (![v109 isManaged]) {
        goto LABEL_48;
      }
      v56 = (void *)MEMORY[0x263F5FC40];
      v57 = objc_opt_new();
      v58 = [v57 UUIDString];
      v59 = [v56 groupSpecifierWithID:v58];

      uint64_t v60 = [v110 contactManagementState];
      char v61 = v111 ^ 1;
      if (v60 != 2) {
        char v61 = 1;
      }
      if ((v61 & 1) == 0 && ![v105 fetchStatus])
      {
        v62 = (objc_class *)objc_opt_class();
        v63 = NSStringFromClass(v62);
        [v59 setObject:v63 forKeyedSubscript:*MEMORY[0x263F600C0]];

        [(STCommunicationLimitsListController *)self _startSyncingiCloudContacts];
      }
      v64 = [(STCommunicationLimitsListController *)self _manageContactsGroupFooterText];
      [v59 setObject:v64 forKeyedSubscript:v92];

      [(STCommunicationLimitsListController *)self setManageContactsGroupSpecifier:v59];
      [v43 addObject:v59];
      v91 = v50;
      if (v111)
      {
        if (v106)
        {
          v65 = [v113 localizedStringForKey:@"ManageContactsRemoteSpecifierName" value:&stru_26D9391A8 table:0];
          id v66 = [NSString alloc];
          v67 = [MEMORY[0x263EFF960] currentLocale];
          v68 = objc_msgSend(v66, "initWithFormat:locale:", v65, v67, v106);

          goto LABEL_40;
        }
        v69 = @"ManageContactsRemoteGenericSpecifierName";
      }
      else
      {
        v69 = @"ManageContactsLocalSpecifierName";
      }
      v68 = [v113 localizedStringForKey:v69 value:&stru_26D9391A8 table:0];
LABEL_40:
      v70 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v68 target:self set:sel__setManageContacts_specifier_ get:sel__manageContacts_ detail:0 cell:6 edit:objc_opt_class()];
      [(STPINListViewController *)self setUpPasscodeAndLineWrapBehaviorForSpecifier:v70];
      [(STCommunicationLimitsListController *)self setManageContactsSpecifier:v70];
      [v55 addObject:v70];
      if (!v111) {
        goto LABEL_47;
      }
      if (v60 == 2)
      {
        uint64_t v93 = [v113 localizedStringForKey:@"iCloudContactsSpecifierName" value:&stru_26D9391A8 table:0];
        v72 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v93 target:self set:0 get:sel__totaliCloudContactsDetailText_ detail:0 cell:2 edit:objc_opt_class()];
        v73 = (objc_class *)objc_opt_class();
        v74 = NSStringFromClass(v73);
        [v72 setObject:v74 forKeyedSubscript:v104];

        v71 = (void *)v93;
        [v72 setObject:&unk_26D966EB0 forKeyedSubscript:v103];
        [v72 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
        [(STCommunicationLimitsListController *)self setICloudContactsSpecifier:v72];
        if ([(STCommunicationLimitsListController *)self syncingiCloudContacts]) {
          goto LABEL_46;
        }
      }
      else
      {
        if (v60 != 1) {
          goto LABEL_47;
        }
        v71 = [v113 localizedStringForKey:@"iCloudContactsSpecifierName" value:&stru_26D9391A8 table:0];
        v72 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v71 target:self set:0 get:sel__statusPendingDetailText_ detail:0 cell:4 edit:0];
        [v72 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
        [(STCommunicationLimitsListController *)self setICloudContactsSpecifier:v72];
      }
      [v55 addObject:v72];
LABEL_46:

LABEL_47:
      v54 = v109;
      v50 = v91;
LABEL_48:
      if ([v54 hasPasscode])
      {
        v75 = v50;
        v76 = (void *)MEMORY[0x263F5FC40];
        v77 = objc_opt_new();
        v78 = [v77 UUIDString];
        v79 = [v76 groupSpecifierWithID:v78];

        [v55 addObject:v79];
        v80 = [v113 localizedStringForKey:@"AllowContactEditingSpecifierName" value:&stru_26D9391A8 table:0];
        v81 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v80 target:self set:sel__setAllowContactEditing_specifier_ get:sel__allowContactEditing_ detail:0 cell:6 edit:objc_opt_class()];
        v82 = (objc_class *)objc_opt_class();
        v83 = NSStringFromClass(v82);
        [v81 setObject:v83 forKeyedSubscript:v104];

        [v81 setObject:&unk_26D966EB0 forKeyedSubscript:v103];
        [v81 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
        uint64_t v84 = [v105 fetchStatus];
        if (v84 == 2) {
          char v85 = 1;
        }
        else {
          char v85 = v111 ^ 1;
        }
        if ((v85 & 1) == 0) {
          [v81 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
        }
        [(STCommunicationLimitsListController *)self setAllowContactEditingSpecifier:v81];
        [v55 addObject:v81];
        if (v84) {
          char v86 = 1;
        }
        else {
          char v86 = v111 ^ 1;
        }
        if ((v86 & 1) == 0) {
          [(STCommunicationLimitsListController *)self _startSyncingiCloudContacts];
        }

        v54 = v109;
        v50 = v75;
      }
      v87 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v102);
      *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v102) = (Class)v55;
      id v88 = v55;

      id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v102);
      break;
  }
LABEL_61:

  return v4;
}

void __49__STCommunicationLimitsListController_specifiers__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v3 table];
    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 duringScreenTimeSpecifier];
    id v7 = [v5 indexPathForSpecifier:v6];
    v8.receiver = v3;
    v8.super_class = (Class)STCommunicationLimitsListController;
    objc_msgSendSuper2(&v8, sel_tableView_didSelectRowAtIndexPath_, v4, v7);
  }
}

void __49__STCommunicationLimitsListController_specifiers__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v3 table];
    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 duringDowntimeSpecifier];
    id v7 = [v5 indexPathForSpecifier:v6];
    v8.receiver = v3;
    v8.super_class = (Class)STCommunicationLimitsListController;
    objc_msgSendSuper2(&v8, sel_tableView_didSelectRowAtIndexPath_, v4, v7);
  }
}

- (id)_totaliCloudContactsDetailText:(id)a3
{
  id v4 = +[STScreenTimeSettingsUIBundle bundle];
  id v5 = [v4 localizedStringForKey:@"TotaliCloudContacts" value:&stru_26D9391A8 table:0];

  id v6 = NSString;
  id v7 = [(STCommunicationLimitsListController *)self familyMemberContactsController];
  objc_super v8 = objc_msgSend(v6, "localizedStringWithFormat:", v5, objc_msgSend(v7, "countOfFamilyMemberContacts"));

  return v8;
}

- (id)_manageContacts:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x263F60308]];
  if (!v4)
  {
    id v5 = [(STCommunicationLimitsListController *)self communicationLimits];
    uint64_t v6 = [v5 contactManagementState];

    id v7 = [(STPINListViewController *)self coordinator];
    objc_super v8 = [v7 viewModel];
    id v9 = [v8 me];
    int v10 = [v9 isRemoteUser];

    if (v10) {
      BOOL v11 = (unint64_t)(v6 - 1) < 2;
    }
    else {
      BOOL v11 = v6 == 2;
    }
    id v4 = [NSNumber numberWithInt:v11];
  }

  return v4;
}

- (void)_setManageContacts:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  char v7 = [a3 BOOLValue];
  objc_super v8 = [(STPINListViewController *)self coordinator];
  id v9 = [v8 viewModel];
  int v10 = [v9 me];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__STCommunicationLimitsListController__setManageContacts_specifier___block_invoke;
  aBlock[3] = &unk_264767680;
  aBlock[4] = self;
  char v18 = v7;
  id v11 = v6;
  id v17 = v11;
  id v12 = (void (**)(void))_Block_copy(aBlock);
  if ([v10 hasPasscode] && (objc_msgSend(v8, "hasAlreadyEnteredPINForSession") & 1) == 0)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __68__STCommunicationLimitsListController__setManageContacts_specifier___block_invoke_2;
    v13[3] = &unk_2647676A8;
    uint64_t v15 = v12;
    v13[4] = self;
    id v14 = v11;
    [(STPINListViewController *)self showPINSheet:v14 completion:v13];
  }
  else
  {
    v12[2](v12);
  }
}

void __68__STCommunicationLimitsListController__setManageContacts_specifier___block_invoke(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) coordinator];
  v2 = [*(id *)(a1 + 32) communicationLimits];
  int v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = [v11 viewModel];
  id v5 = [v4 me];
  int v6 = [v5 isRemoteUser];

  if (v3)
  {
    if (v6)
    {
      char v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
      [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:*MEMORY[0x263F60308]];

      [*(id *)(a1 + 32) _startSyncingiCloudContacts];
      goto LABEL_10;
    }
    objc_super v8 = v2;
    uint64_t v9 = 2;
    goto LABEL_9;
  }
  if (v6) {
    [*(id *)(a1 + 32) _didCancelSyncingiCloudContacts];
  }
  if ([v2 contactManagementState])
  {
    objc_super v8 = v2;
    uint64_t v9 = 0;
LABEL_9:
    [v8 setContactManagementState:v9];
    int v10 = [v11 contentPrivacyCoordinator];
    [v10 saveCommunicationLimits:v2 completionHandler:0];
  }
LABEL_10:
  +[STCommunicationLimitsScreenTimeDetailListController showCompatibilityAlertIfNeededWithCoordinator:v11 presentingViewController:*(void *)(a1 + 32) okHandler:0];
}

uint64_t __68__STCommunicationLimitsListController__setManageContacts_specifier___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
  }
}

- (id)_statusPendingDetailText:(id)a3
{
  int v3 = +[STScreenTimeSettingsUIBundle bundle];
  id v4 = [v3 localizedStringForKey:@"ManageContactsStatusPendingDetailText" value:&stru_26D9391A8 table:0];

  return v4;
}

- (id)_manageContactsGroupFooterText
{
  int v3 = +[STScreenTimeSettingsUIBundle bundle];
  id v4 = [(STPINListViewController *)self coordinator];
  id v5 = [v4 viewModel];
  int v6 = [v5 me];

  char v7 = [v6 givenName];
  objc_super v8 = [(STCommunicationLimitsListController *)self communicationLimits];
  uint64_t v9 = [v8 contactManagementState];

  if (([v6 isRemoteUser] & 1) == 0)
  {
    id v11 = @"ManageContactsSpecifierLocalFooterText";
    goto LABEL_6;
  }
  if ([(STCommunicationLimitsListController *)self syncingiCloudContacts])
  {
    if (v7)
    {
      int v10 = @"iCloudContactsSyncingRemoteFooterText";
LABEL_15:
      uint64_t v13 = [v3 localizedStringForKey:v10 value:&stru_26D9391A8 table:0];
      objc_super v16 = NSString;
      uint64_t v15 = [v3 localizedStringForKey:v13 value:&stru_26D9391A8 table:0];
      objc_msgSend(v16, "localizedStringWithFormat:", v15, v7, v18);
      goto LABEL_16;
    }
    id v11 = @"iCloudContactsSyncingSpecifierRemoteGenericFooterText";
    goto LABEL_6;
  }
  if (v9 != 1)
  {
    if (v7)
    {
      if (v9) {
        int v10 = @"iCloudContactsSpecifierRemoteFooterText";
      }
      else {
        int v10 = @"ManageContactsGroupSpecifierRemoteFooterText";
      }
      goto LABEL_15;
    }
    if (v9) {
      id v11 = @"iCloudContactsSpecifierRemoteGenericFooterText";
    }
    else {
      id v11 = @"ManageContactsGroupSpecifierRemoteGenericFooterText";
    }
LABEL_6:
    id v12 = [v3 localizedStringForKey:v11 value:&stru_26D9391A8 table:0];
    goto LABEL_17;
  }
  if ([v6 isRemoteUser])
  {
    if (v7)
    {
      uint64_t v13 = [v3 localizedStringForKey:@"iCloudContactsPendingRemoteFooterText" value:&stru_26D9391A8 table:0];
      id v14 = NSString;
      uint64_t v15 = [v3 localizedStringForKey:v13 value:&stru_26D9391A8 table:0];
      objc_msgSend(v14, "localizedStringWithFormat:", v15, v7, v7);
      id v12 = LABEL_16:;

      goto LABEL_17;
    }
    id v11 = @"iCloudContactsPendingRemoteGenericFooterText";
    goto LABEL_6;
  }
  id v12 = 0;
LABEL_17:

  return v12;
}

- (id)_allowContactEditing:(id)a3
{
  int v3 = NSNumber;
  id v4 = [(STCommunicationLimitsListController *)self communicationLimits];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "contactsEditable"));

  return v5;
}

- (void)_setAllowContactEditing:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(STPINListViewController *)self coordinator];
  uint64_t v9 = [v8 viewModel];
  int v10 = [v9 me];
  if (![v10 hasPasscode])
  {

    goto LABEL_5;
  }
  char v11 = [v8 hasAlreadyEnteredPINForSession];

  if (v11)
  {
LABEL_5:
    [(STCommunicationLimitsListController *)self _updateAllowContactEditingWithAlertIfNeeded:v6 forSpecifier:v7];
    goto LABEL_6;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__STCommunicationLimitsListController__setAllowContactEditing_specifier___block_invoke;
  v12[3] = &unk_264767278;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  [(STPINListViewController *)self showPINSheet:v14 completion:v12];

LABEL_6:
}

uint64_t __73__STCommunicationLimitsListController__setAllowContactEditing_specifier___block_invoke(void *a1, int a2)
{
  int v3 = (void *)a1[4];
  if (a2) {
    return [v3 _updateAllowContactEditingWithAlertIfNeeded:a1[5] forSpecifier:a1[6]];
  }
  else {
    return [v3 reloadSpecifier:a1[6] animated:1];
  }
}

- (void)_updateAllowContactEditingWithAlertIfNeeded:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(STCommunicationLimitsListController *)self communicationLimits];
  uint64_t v9 = [v8 screenTimeCommunicationLimit];

  if ([v6 BOOLValue] && (unint64_t)(v9 - 1) <= 1)
  {
    int v10 = +[STScreenTimeSettingsUIBundle bundle];
    char v11 = [(STPINListViewController *)self coordinator];
    id v12 = [v11 viewModel];
    id v13 = [v12 me];

    objc_super v28 = v13;
    if ([v13 isRemoteUser])
    {
      id v14 = [v13 givenName];
      if (v14)
      {
        uint64_t v15 = [v10 localizedStringForKey:@"AllowContactEditingRemoteAlertTitle" value:&stru_26D9391A8 table:0];
        objc_super v16 = [MEMORY[0x263EFF960] currentLocale];
        uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:locale:", v15, v16, v14);
        uint64_t v18 = [v10 localizedStringForKey:@"AllowContactEditingRemoteAlertPrompt" value:&stru_26D9391A8 table:0];
        uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:locale:", v18, v16, v14);
      }
      else
      {
        uint64_t v17 = [v10 localizedStringForKey:@"AllowContactEditingRemoteGenericAlertTitle" value:&stru_26D9391A8 table:0];
        uint64_t v19 = [v10 localizedStringForKey:@"AllowContactEditingRemoteGenericAlertPrompt" value:&stru_26D9391A8 table:0];
      }
    }
    else
    {
      uint64_t v17 = [v10 localizedStringForKey:@"AllowContactEditingLocalAlertTitle" value:&stru_26D9391A8 table:0];
      uint64_t v19 = [v10 localizedStringForKey:@"AllowContactEditingLocalAlertPrompt" value:&stru_26D9391A8 table:0];
    }
    uint64_t v27 = (void *)v17;
    uint64_t v20 = [MEMORY[0x263F82418] alertControllerWithTitle:v17 message:v19 preferredStyle:1];
    uint64_t v21 = (void *)MEMORY[0x263F82400];
    v22 = [v10 localizedStringForKey:@"ConfirmationButtonContinue" value:&stru_26D9391A8 table:0];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __96__STCommunicationLimitsListController__updateAllowContactEditingWithAlertIfNeeded_forSpecifier___block_invoke;
    void v31[3] = &unk_264767368;
    v31[4] = self;
    id v32 = v6;
    id v23 = [v21 actionWithTitle:v22 style:0 handler:v31];

    [v20 addAction:v23];
    [v20 setPreferredAction:v23];
    uint64_t v24 = (void *)MEMORY[0x263F82400];
    uint64_t v25 = [v10 localizedStringForKey:@"ConfirmationButtonCancel" value:&stru_26D9391A8 table:0];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    void v29[2] = __96__STCommunicationLimitsListController__updateAllowContactEditingWithAlertIfNeeded_forSpecifier___block_invoke_2;
    v29[3] = &unk_264767368;
    v29[4] = self;
    id v30 = v7;
    v26 = [v24 actionWithTitle:v25 style:1 handler:v29];
    [v20 addAction:v26];

    [(STCommunicationLimitsListController *)self presentViewController:v20 animated:1 completion:0];
  }
  else
  {
    [(STCommunicationLimitsListController *)self _updateAllowContactEditing:v6];
  }
}

uint64_t __96__STCommunicationLimitsListController__updateAllowContactEditingWithAlertIfNeeded_forSpecifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAllowContactEditing:*(void *)(a1 + 40)];
}

uint64_t __96__STCommunicationLimitsListController__updateAllowContactEditingWithAlertIfNeeded_forSpecifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

- (void)_updateAllowContactEditing:(id)a3
{
  id v4 = a3;
  id v8 = [(STCommunicationLimitsListController *)self communicationLimits];
  uint64_t v5 = [v4 BOOLValue];

  [v8 setContactsEditable:v5];
  id v6 = [(STPINListViewController *)self coordinator];
  id v7 = [v6 contentPrivacyCoordinator];
  [v7 saveCommunicationLimits:v8 completionHandler:0];

  +[STCommunicationLimitsScreenTimeDetailListController showCompatibilityAlertIfNeededWithCoordinator:v6 presentingViewController:self okHandler:0];
}

- (void)_startSyncingiCloudContacts
{
  id v4 = [(STCommunicationLimitsListController *)self familyMemberContactsController];
  [v4 countOfFamilyMemberContacts];
  uint64_t v3 = [v4 fetchStatus];
  if (v3 == 2)
  {
    [(STCommunicationLimitsListController *)self _didFinishSyncingiCloudContacts];
  }
  else
  {
    [(STCommunicationLimitsListController *)self setSyncingiCloudContacts:(v3 & 0xFFFFFFFFFFFFFFFDLL) == 1];
    [(STCommunicationLimitsListController *)self _didStartSyncingiCloudContacts];
  }
}

- (void)_didStartSyncingiCloudContacts
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(STCommunicationLimitsListController *)self _enableAllowContactEditingSwitch:0];
  [(STCommunicationLimitsListController *)self _updateManageContactsGroupFooterView];
  [(STCommunicationLimitsListController *)self _indicateiCloudContactsSyncingStatus];
  uint64_t v3 = [(STCommunicationLimitsListController *)self familyMemberContactsController];
  uint64_t v4 = [v3 fetchStatus];
  uint64_t v5 = [(STPINListViewController *)self coordinator];
  id v6 = [v5 viewModel];
  id v7 = [v6 me];
  id v8 = [v7 givenName];
  switch(v4)
  {
    case 0:
      uint64_t v9 = +[STUILog communication];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v11 = 138412290;
      id v12 = v8;
      int v10 = "Did not fetch %@'s iCloud contacts.";
      break;
    case 1:
      uint64_t v9 = +[STUILog communication];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v11 = 138412290;
      id v12 = v8;
      int v10 = "Fetching %@'s iCloud contacts.";
      break;
    case 2:
      uint64_t v9 = +[STUILog communication];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v11 = 138412290;
      id v12 = v8;
      int v10 = "Finished syncing %@'s iCloud contacts.";
      break;
    case 3:
      uint64_t v9 = +[STUILog communication];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v11 = 138412290;
      id v12 = v8;
      int v10 = "Syncing %@'s iCloud contacts.";
      break;
    default:
      goto LABEL_12;
  }
  _os_log_impl(&dword_225B06000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
LABEL_11:

LABEL_12:
}

- (void)_didFinishSyncingiCloudContacts
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(STCommunicationLimitsListController *)self setSyncingiCloudContacts:0];
  [(STCommunicationLimitsListController *)self _enableAllowContactEditingSwitch:1];
  uint64_t v3 = [(STCommunicationLimitsListController *)self communicationLimits];
  uint64_t v4 = [v3 contactManagementState];
  uint64_t v5 = [(STCommunicationLimitsListController *)self manageContactsSpecifier];
  id v6 = [(STCommunicationLimitsListController *)self familyMemberContactsController];
  id v7 = [(STPINListViewController *)self coordinator];
  id v8 = [(STCommunicationLimitsListController *)self _manageContacts:v5];
  int v9 = [v8 BOOLValue];

  if (!v9 || v4)
  {
    if (v4 != 2) {
      goto LABEL_11;
    }
    int v11 = [(STCommunicationLimitsListController *)self iCloudContactsSpecifier];
    if (([(STCommunicationLimitsListController *)self containsSpecifier:v11] & 1) == 0) {
      [(STCommunicationLimitsListController *)self insertSpecifier:v11 afterSpecifier:v5 animated:1];
    }
  }
  else
  {
    if ([v6 countOfFamilyMemberContacts] >= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    [v3 setContactManagementState:v10];
    int v11 = [v7 contentPrivacyCoordinator];
    [v11 saveCommunicationLimits:v3 completionHandler:0];
  }

LABEL_11:
  [v5 removePropertyForKey:*MEMORY[0x263F60308]];
  [(STCommunicationLimitsListController *)self _updateManageContactsGroupFooterView];
  [(STCommunicationLimitsListController *)self _indicateiCloudContactsSyncingStatus];
  uint64_t v12 = [v6 fetchStatus];
  uint64_t v13 = [v7 viewModel];
  id v14 = [v13 me];
  id v15 = [v14 givenName];
  switch(v12)
  {
    case 0:
      objc_super v16 = +[STUILog communication];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      int v18 = 138412290;
      id v19 = v15;
      uint64_t v17 = "Did not fetch %@'s iCloud contacts.";
      break;
    case 1:
      objc_super v16 = +[STUILog communication];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      int v18 = 138412290;
      id v19 = v15;
      uint64_t v17 = "Fetching %@'s iCloud contacts.";
      break;
    case 2:
      objc_super v16 = +[STUILog communication];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      int v18 = 138412290;
      id v19 = v15;
      uint64_t v17 = "Finished syncing %@'s iCloud contacts.";
      break;
    case 3:
      objc_super v16 = +[STUILog communication];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      int v18 = 138412290;
      id v19 = v15;
      uint64_t v17 = "Syncing %@'s iCloud contacts.";
      break;
    default:
      goto LABEL_22;
  }
  _os_log_impl(&dword_225B06000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v18, 0xCu);
LABEL_21:

LABEL_22:
}

- (void)_didCancelSyncingiCloudContacts
{
  if ([(STCommunicationLimitsListController *)self syncingiCloudContacts])
  {
    [(STCommunicationLimitsListController *)self setSyncingiCloudContacts:0];
    uint64_t v3 = [(STCommunicationLimitsListController *)self manageContactsSpecifier];
    [v3 removePropertyForKey:*MEMORY[0x263F60308]];

    [(STCommunicationLimitsListController *)self _updateManageContactsGroupFooterView];
    [(STCommunicationLimitsListController *)self _indicateiCloudContactsSyncingStatus];
  }
}

- (void)_updateManageContactsGroupFooterView
{
  id v6 = [(STCommunicationLimitsListController *)self manageContactsGroupSpecifier];
  if ([(STCommunicationLimitsListController *)self syncingiCloudContacts])
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    [v6 setObject:v4 forKeyedSubscript:*MEMORY[0x263F600C0]];
  }
  else
  {
    [v6 removePropertyForKey:*MEMORY[0x263F600C0]];
  }
  uint64_t v5 = [(STCommunicationLimitsListController *)self _manageContactsGroupFooterText];
  [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x263F600F8]];

  [(STCommunicationLimitsListController *)self reloadSpecifier:v6 animated:0];
}

- (void)_indicateiCloudContactsSyncingStatus
{
  uint64_t v3 = [(STCommunicationLimitsListController *)self manageContactsGroupSpecifier];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F60108]];

  if ([(STCommunicationLimitsListController *)self syncingiCloudContacts]) {
    [v4 startAnimatingSpinner];
  }
  else {
    [v4 stopAnimatingSpinner];
  }
}

- (void)_enableAllowContactEditingSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(STCommunicationLimitsListController *)self allowContactEditingSpecifier];
  uint64_t v5 = [NSNumber numberWithBool:v3];
  [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [(STCommunicationLimitsListController *)self reloadSpecifier:v6 animated:1];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STCommunicationLimitsListController *)self specifierAtIndexPath:v7];
  int v9 = [(STCommunicationLimitsListController *)self iCloudContactsSpecifier];
  if (v8 == v9)
  {
    uint64_t v10 = [(STCommunicationLimitsListController *)self communicationLimits];
    uint64_t v11 = [v10 contactManagementState];

    if (v11 != 2) {
      goto LABEL_7;
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__STCommunicationLimitsListController_tableView_didSelectRowAtIndexPath___block_invoke;
    aBlock[3] = &unk_264767278;
    id v19 = v6;
    id v20 = v7;
    uint64_t v21 = self;
    uint64_t v12 = _Block_copy(aBlock);
    uint64_t v13 = [(STPINListViewController *)self coordinator];
    id v14 = [v13 viewModel];
    id v15 = [v14 me];
    if ([v15 hasPasscode])
    {
      char v16 = [v13 hasAlreadyEnteredPINForSession];

      if ((v16 & 1) == 0)
      {
        [(STPINListViewController *)self showPINSheet:v8 completion:v12];
LABEL_11:

        goto LABEL_8;
      }
    }
    else
    {
    }
    (*((void (**)(void *, uint64_t))v12 + 2))(v12, 1);
    goto LABEL_11;
  }

LABEL_7:
  v17.receiver = self;
  v17.super_class = (Class)STCommunicationLimitsListController;
  [(STPINListViewController *)&v17 tableView:v6 didSelectRowAtIndexPath:v7];
LABEL_8:
}

void __73__STCommunicationLimitsListController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) deselectRowAtIndexPath:*(void *)(a1 + 40) animated:1];
    id v3 = [*(id *)(a1 + 48) familyMemberContactsController];
    [v3 performInteraction:0];
  }
}

- (void)familyMemberContactsDidChange
{
  if ([(STCommunicationLimitsListController *)self syncingiCloudContacts])
  {
    [(STCommunicationLimitsListController *)self _didFinishSyncingiCloudContacts];
  }
}

- (void)presentViewController:(id)a3
{
  id v9 = a3;
  id v4 = [MEMORY[0x263F82670] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isiPad");

  if (v5)
  {
    id v6 = [v9 popoverPresentationController];
    objc_msgSend(v6, "setSourceRect:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
    id v7 = [(STCommunicationLimitsListController *)self iCloudContactsSpecifier];
    id v8 = [(STCommunicationLimitsListController *)self cachedCellForSpecifier:v7];
    [v6 setSourceView:v8];

    [v6 setPermittedArrowDirections:3];
  }
  [(STCommunicationLimitsListController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)dismissPresentedViewController:(id)a3
{
}

- (PSSpecifier)duringScreenTimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setDuringScreenTimeSpecifier:(id)a3
{
}

- (PSSpecifier)duringDowntimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setDuringDowntimeSpecifier:(id)a3
{
}

- (PSSpecifier)manageContactsGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setManageContactsGroupSpecifier:(id)a3
{
}

- (PSSpecifier)manageContactsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setManageContactsSpecifier:(id)a3
{
}

- (PSSpecifier)iCloudContactsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1456, 1);
}

- (void)setICloudContactsSpecifier:(id)a3
{
}

- (PSSpecifier)allowContactEditingSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1464, 1);
}

- (void)setAllowContactEditingSpecifier:(id)a3
{
}

- (STCommunicationLimits)communicationLimits
{
  return (STCommunicationLimits *)objc_getProperty(self, a2, 1472, 1);
}

- (void)setCommunicationLimits:(id)a3
{
}

- (CNUIFamilyMemberContactsController)familyMemberContactsController
{
  return (CNUIFamilyMemberContactsController *)objc_getProperty(self, a2, 1480, 1);
}

- (void)setFamilyMemberContactsController:(id)a3
{
}

- (BOOL)syncingiCloudContacts
{
  return self->_syncingiCloudContacts;
}

- (void)setSyncingiCloudContacts:(BOOL)a3
{
  self->_syncingiCloudContacts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberContactsController, 0);
  objc_storeStrong((id *)&self->_communicationLimits, 0);
  objc_storeStrong((id *)&self->_allowContactEditingSpecifier, 0);
  objc_storeStrong((id *)&self->_iCloudContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_manageContactsSpecifier, 0);
  objc_storeStrong((id *)&self->_manageContactsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_duringDowntimeSpecifier, 0);

  objc_storeStrong((id *)&self->_duringScreenTimeSpecifier, 0);
}

@end