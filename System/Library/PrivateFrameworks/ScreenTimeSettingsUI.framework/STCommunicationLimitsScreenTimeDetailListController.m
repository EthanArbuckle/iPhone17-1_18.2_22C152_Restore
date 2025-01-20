@interface STCommunicationLimitsScreenTimeDetailListController
+ (void)showCompatibilityAlertIfNeededWithCoordinator:(id)a3 presentingViewController:(id)a4 okHandler:(id)a5;
- (PSSpecifier)allowContactsOnlySpecifier;
- (PSSpecifier)allowEveryoneSpecifier;
- (PSSpecifier)allowGroupsWithOneContactSpecifier;
- (PSSpecifier)allowedCommunicationGroupSpecifier;
- (STCommunicationLimits)communicationLimits;
- (id)_allowedCommunicationGroupFooterText:(id)a3;
- (id)specifiers;
- (void)_didFinishEditingCommunicationLimit;
- (void)_updateAllowedCommunicationGroupFooterText;
- (void)setAllowContactsOnlySpecifier:(id)a3;
- (void)setAllowEveryoneSpecifier:(id)a3;
- (void)setAllowGroupsWithOneContactSpecifier:(id)a3;
- (void)setAllowedCommunicationGroupSpecifier:(id)a3;
- (void)setCommunicationLimits:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation STCommunicationLimitsScreenTimeDetailListController

- (void)viewDidLoad
{
  v3 = [(STCommunicationLimitsScreenTimeDetailListController *)self specifier];
  v4 = [v3 objectForKeyedSubscript:0x26D940528];

  v5 = [v4 contentPrivacyCoordinator];
  v6 = [v5 viewModel];
  v7 = [v6 communicationLimits];
  v8 = (void *)[v7 copy];
  [(STCommunicationLimitsScreenTimeDetailListController *)self setCommunicationLimits:v8];

  v9 = +[STScreenTimeSettingsUIBundle bundle];
  v10 = [v9 localizedStringForKey:@"DuringScreenTimeTitle" value:&stru_26D9391A8 table:0];
  [(STCommunicationLimitsScreenTimeDetailListController *)self setTitle:v10];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STCommunicationLimitsScreenTimeDetailListController.viewDidLoad", buf, 2u);
  }
  v11.receiver = self;
  v11.super_class = (Class)STCommunicationLimitsScreenTimeDetailListController;
  [(STCommunicationLimitsScreenTimeDetailListController *)&v11 viewDidLoad];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(STCommunicationLimitsScreenTimeDetailListController *)self _didFinishEditingCommunicationLimit];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STCommunicationLimitsScreenTimeDetailListController.viewWillDisappear", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)STCommunicationLimitsScreenTimeDetailListController;
  [(STCommunicationLimitsScreenTimeDetailListController *)&v5 viewWillDisappear:v3];
}

- (void)willResignActive
{
  [(STCommunicationLimitsScreenTimeDetailListController *)self _didFinishEditingCommunicationLimit];
  v3.receiver = self;
  v3.super_class = (Class)STCommunicationLimitsScreenTimeDetailListController;
  [(STCommunicationLimitsScreenTimeDetailListController *)&v3 willResignActive];
}

- (void)_didFinishEditingCommunicationLimit
{
  v4 = [(STCommunicationLimitsScreenTimeDetailListController *)self specifier];
  id v25 = [v4 objectForKeyedSubscript:0x26D940528];

  objc_super v5 = [(STCommunicationLimitsScreenTimeDetailListController *)self communicationLimits];
  v6 = [(STCommunicationLimitsScreenTimeDetailListController *)self allowedCommunicationGroupSpecifier];
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F60200]];

  v8 = [(STCommunicationLimitsScreenTimeDetailListController *)self allowContactsOnlySpecifier];

  if (v7 == v8)
  {
    uint64_t v10 = 2;
  }
  else
  {
    v9 = [(STCommunicationLimitsScreenTimeDetailListController *)self allowGroupsWithOneContactSpecifier];
    uint64_t v10 = v7 == v9;
  }
  [v5 setScreenTimeCommunicationLimit:v10];
  uint64_t v11 = [v5 screenTimeCommunicationLimit];
  v12 = [v25 contentPrivacyCoordinator];
  v13 = [v12 viewModel];
  v14 = [v13 communicationLimits];
  uint64_t v15 = [v14 screenTimeCommunicationLimit];

  if (v11 != v15)
  {
    uint64_t v16 = [v5 downtimeCommunicationLimit];
    uint64_t v17 = [v5 screenTimeCommunicationLimit];
    v18 = v25;
    switch(v17)
    {
      case 0:
        if (v16) {
          [v5 setDowntimeCommunicationLimit:0];
        }
        v19 = v5;
        uint64_t v20 = 1;
        goto LABEL_16;
      case 1:
        if (v16 == 1) {
          goto LABEL_15;
        }
        v21 = v5;
        uint64_t v22 = 1;
        break;
      case 2:
        if (v16 == 2) {
          goto LABEL_15;
        }
        v21 = v5;
        uint64_t v22 = 2;
        break;
      case 3:
        v23 = [MEMORY[0x263F08690] currentHandler];
        [v23 handleFailureInMethod:a2 object:self file:@"STCommunicationLimitsScreenTimeDetailListController.m" lineNumber:97 description:@"Unexpected general communication policy whitelisted contacts"];

        goto LABEL_17;
      default:
        goto LABEL_18;
    }
    [v21 setDowntimeCommunicationLimit:v22];
LABEL_15:
    v19 = v5;
    uint64_t v20 = 0;
LABEL_16:
    [v19 setContactsEditable:v20];
LABEL_17:
    v18 = v25;
LABEL_18:
    v24 = [v18 contentPrivacyCoordinator];
    [v24 saveCommunicationLimits:v5 completionHandler:0];
  }
}

+ (void)showCompatibilityAlertIfNeededWithCoordinator:(id)a3 presentingViewController:(id)a4 okHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [a3 viewModel];
  uint64_t v10 = [v9 me];
  uint64_t v11 = [v10 dsid];
  v12 = [v11 stringValue];

  if ([v9 shouldShowCompatibilityAlerts]
    && !+[STCommunicationLimits hasShownCompatibilityAlertForDSID:v12])
  {
    v13 = +[STScreenTimeSettingsUIBundle bundle];
    if ([v10 isRemoteUser])
    {
      v14 = [v10 givenName];
      if (v14)
      {
        v24 = [v13 localizedStringForKey:@"UpdateChildDevicesAlertTitleFormat" value:&stru_26D9391A8 table:0];
        uint64_t v15 = [MEMORY[0x263EFF960] currentLocale];
        uint64_t v25 = objc_msgSend([NSString alloc], "initWithFormat:locale:", v24, v15, v14);
        uint64_t v16 = [v13 localizedStringForKey:@"CommunicationLimitsChildCompatibilityAlertMessageFormat" value:&stru_26D9391A8 table:0];
        uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:locale:", v16, v15, v14);

        uint64_t v18 = v25;
LABEL_9:
        v26 = (void *)v18;

        v21 = [MEMORY[0x263F82418] alertControllerWithTitle:v18 message:v17 preferredStyle:1];
        uint64_t v22 = [v13 localizedStringForKey:@"ConfirmationButtonOK" value:&stru_26D9391A8 table:0];
        v23 = [MEMORY[0x263F82400] actionWithTitle:v22 style:0 handler:v8];
        [v21 addAction:v23];
        [v21 setPreferredAction:v23];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __136__STCommunicationLimitsScreenTimeDetailListController_showCompatibilityAlertIfNeededWithCoordinator_presentingViewController_okHandler___block_invoke;
        v27[3] = &unk_264766F30;
        id v28 = v12;
        [v7 presentViewController:v21 animated:1 completion:v27];

        goto LABEL_10;
      }
      uint64_t v18 = [v13 localizedStringForKey:@"UpdateChildDevicesAlertTitle" value:&stru_26D9391A8 table:0];
      uint64_t v20 = @"CommunicationLimitsChildCompatibilityAlertMessage";
      v19 = v13;
    }
    else
    {
      uint64_t v18 = [v13 localizedStringForKey:@"UpdateOtherDevicesAlertTitle" value:&stru_26D9391A8 table:0];
      v14 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"CommunicationLimitsCompatibilityAlertMessage"];
      v19 = v13;
      uint64_t v20 = v14;
    }
    uint64_t v17 = [v19 localizedStringForKey:v20 value:&stru_26D9391A8 table:0];
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __136__STCommunicationLimitsScreenTimeDetailListController_showCompatibilityAlertIfNeededWithCoordinator_presentingViewController_okHandler___block_invoke(uint64_t a1)
{
  return +[STCommunicationLimits setHasShownCompatibilityAlert:1 forDSID:*(void *)(a1 + 32)];
}

- (id)specifiers
{
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v44 = (int)*MEMORY[0x263F5FDB8];
    v4 = objc_opt_new();
    v45 = +[STScreenTimeSettingsUIBundle bundle];
    objc_super v5 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v6 = [(STCommunicationLimitsScreenTimeDetailListController *)self specifier];
    id v7 = [v6 objectForKeyedSubscript:0x26D940528];

    v43 = v7;
    id v8 = [v7 viewModel];
    v9 = [v8 me];

    id v10 = v9;
    if ([v10 isRemoteUser])
    {
      uint64_t v11 = [v10 givenName];
      v12 = +[STScreenTimeSettingsUIBundle bundle];
      v13 = v12;
      if (v11)
      {
        uint64_t v14 = [v12 localizedStringForKey:@"CommunicationLimitsRemoteHeaderText" value:&stru_26D9391A8 table:0];

        uint64_t v15 = objc_msgSend(NSString, "localizedStringWithFormat:", v14, v11);
        v13 = (void *)v14;
      }
      else
      {
        uint64_t v15 = [v12 localizedStringForKey:@"CommunicationLimitsRemoteGenericHeaderText" value:&stru_26D9391A8 table:0];
      }
    }
    else
    {
      uint64_t v11 = +[STScreenTimeSettingsUIBundle bundle];
      uint64_t v15 = [v11 localizedStringForKey:@"CommunicationLimitsLocalHeaderText" value:&stru_26D9391A8 table:0];
    }

    v42 = v10;
    uint64_t v41 = *MEMORY[0x263F600F8];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15);

    [v4 addObject:v5];
    uint64_t v16 = (void *)MEMORY[0x263F5FC40];
    uint64_t v17 = [v45 localizedStringForKey:@"AllowedCommunicationSectionTitle" value:&stru_26D9391A8 table:0];
    uint64_t v18 = [v16 groupSpecifierWithName:v17];

    [v18 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60168]];
    [(STCommunicationLimitsScreenTimeDetailListController *)self setAllowedCommunicationGroupSpecifier:v18];
    [v4 addObject:v18];
    v19 = (void *)MEMORY[0x263F5FC40];
    uint64_t v20 = [v45 localizedStringForKey:@"AllowContactsOnlySpecifierName" value:&stru_26D9391A8 table:0];
    v21 = [v19 preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:0 cell:3 edit:0];

    uint64_t v22 = *MEMORY[0x263F600A8];
    uint64_t v23 = MEMORY[0x263EFFA88];
    [v21 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
    [(STCommunicationLimitsScreenTimeDetailListController *)self setAllowContactsOnlySpecifier:v21];
    [v4 addObject:v21];
    v40 = [v45 localizedStringForKey:@"AllowGroupsWithOneContactSpecifierName" value:&stru_26D9391A8 table:0];
    v24 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    [v24 setObject:v23 forKeyedSubscript:*MEMORY[0x263F5FEF8]];
    [(STCommunicationLimitsScreenTimeDetailListController *)self setAllowGroupsWithOneContactSpecifier:v24];
    [v4 addObject:v24];
    uint64_t v25 = (void *)MEMORY[0x263F5FC40];
    v26 = [v45 localizedStringForKey:@"AllowEveryoneSpecifierName" value:&stru_26D9391A8 table:0];
    v27 = [v25 preferenceSpecifierNamed:v26 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v27 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v22];
    [(STCommunicationLimitsScreenTimeDetailListController *)self setAllowEveryoneSpecifier:v27];
    [v4 addObject:v27];
    id v28 = [(STCommunicationLimitsScreenTimeDetailListController *)self communicationLimits];
    uint64_t v29 = [v28 screenTimeCommunicationLimit];

    v30 = (void *)MEMORY[0x263F60200];
    switch(v29)
    {
      case 0:
        uint64_t v31 = *MEMORY[0x263F60200];
        v32 = v18;
        v33 = v27;
        goto LABEL_12;
      case 1:
        uint64_t v31 = *MEMORY[0x263F60200];
        v32 = v18;
        v33 = v24;
        goto LABEL_12;
      case 2:
        uint64_t v31 = *MEMORY[0x263F60200];
        v32 = v18;
        v33 = v21;
LABEL_12:
        [v32 setObject:v33 forKeyedSubscript:v31];
        break;
      case 3:
        v34 = [MEMORY[0x263F08690] currentHandler];
        [v34 handleFailureInMethod:a2 object:self file:@"STCommunicationLimitsScreenTimeDetailListController.m" lineNumber:191 description:@"Unexpected general communication policy whitelisted contacts"];

        break;
      default:
        break;
    }
    v35 = [v18 objectForKeyedSubscript:*v30];
    v36 = [(STCommunicationLimitsScreenTimeDetailListController *)self _allowedCommunicationGroupFooterText:v35];
    [v18 setObject:v36 forKeyedSubscript:v41];

    v37 = *(Class *)((char *)&self->super.super.super.super.super.isa + v44);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v44) = (Class)v4;

    objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v44);
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)STCommunicationLimitsScreenTimeDetailListController;
  id v6 = a4;
  [(STCommunicationLimitsScreenTimeDetailListController *)&v14 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(STCommunicationLimitsScreenTimeDetailListController *)self allowedCommunicationGroupSpecifier];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F60200]];
  v9 = [(STCommunicationLimitsScreenTimeDetailListController *)self allowEveryoneSpecifier];
  id v10 = [(STCommunicationLimitsScreenTimeDetailListController *)self specifierAtIndexPath:v6];

  if (v10 != v9 && v8 != v9)
  {
    uint64_t v11 = [(STCommunicationLimitsScreenTimeDetailListController *)self specifier];
    v12 = [v11 objectForKeyedSubscript:0x26D940528];

    [(id)objc_opt_class() showCompatibilityAlertIfNeededWithCoordinator:v12 presentingViewController:self okHandler:0];
  }
  v13 = [(STCommunicationLimitsScreenTimeDetailListController *)self _allowedCommunicationGroupFooterText:v10];
  [v7 setObject:v13 forKeyedSubscript:*MEMORY[0x263F600F8]];

  [(STCommunicationLimitsScreenTimeDetailListController *)self _updateAllowedCommunicationGroupFooterText];
}

- (id)_allowedCommunicationGroupFooterText:(id)a3
{
  id v4 = a3;
  id v5 = [(STCommunicationLimitsScreenTimeDetailListController *)self allowEveryoneSpecifier];

  if (v5 == v4)
  {
    id v7 = +[STScreenTimeSettingsUIBundle bundle];
    uint64_t v15 = [v7 localizedStringForKey:@"DuringScreenTimeEveryoneFooterText" value:&stru_26D9391A8 table:0];
  }
  else
  {
    id v6 = [(STCommunicationLimitsScreenTimeDetailListController *)self specifier];
    id v7 = [v6 objectForKeyedSubscript:0x26D940528];

    id v8 = [v7 viewModel];
    v9 = [v8 me];

    if ([v9 isRemoteUser])
    {
      id v10 = [v9 givenName];
      id v11 = [(STCommunicationLimitsScreenTimeDetailListController *)self allowContactsOnlySpecifier];

      v12 = +[STScreenTimeSettingsUIBundle bundle];
      v13 = v12;
      if (v10)
      {
        if (v11 == v4)
        {
          uint64_t v14 = [v12 localizedStringForKey:@"DuringScreenTimeContactsOnlyRemoteFooterText" value:&stru_26D9391A8 table:0];

          objc_msgSend(NSString, "localizedStringWithFormat:", v14, v10, v21);
        }
        else
        {
          uint64_t v14 = [v12 localizedStringForKey:@"DuringScreenTimeGroupsWithOneContactRemoteFooterText" value:&stru_26D9391A8 table:0];

          objc_msgSend(NSString, "localizedStringWithFormat:", v14, v10, v10);
        uint64_t v15 = };
        v13 = (void *)v14;
      }
      else
      {
        if (v11 == v4) {
          v19 = @"DuringScreenTimeContactsOnlyRemoteGenericFooterText";
        }
        else {
          v19 = @"DuringScreenTimeGroupsWithOneContactRemoteGenericFooterText";
        }
        uint64_t v15 = [v12 localizedStringForKey:v19 value:&stru_26D9391A8 table:0];
      }
    }
    else
    {
      id v16 = [(STCommunicationLimitsScreenTimeDetailListController *)self allowContactsOnlySpecifier];

      uint64_t v17 = +[STScreenTimeSettingsUIBundle bundle];
      id v10 = v17;
      if (v16 == v4) {
        uint64_t v18 = @"DuringScreenTimeContactsOnlyLocalFooterText";
      }
      else {
        uint64_t v18 = @"DuringScreenTimeGroupsWithOneContactLocalFooterText";
      }
      uint64_t v15 = [v17 localizedStringForKey:v18 value:&stru_26D9391A8 table:0];
    }
  }

  return v15;
}

- (void)_updateAllowedCommunicationGroupFooterText
{
  id v3 = [(STCommunicationLimitsScreenTimeDetailListController *)self allowedCommunicationGroupSpecifier];
  [(STCommunicationLimitsScreenTimeDetailListController *)self reloadSpecifier:v3 animated:1];
}

- (PSSpecifier)allowedCommunicationGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setAllowedCommunicationGroupSpecifier:(id)a3
{
}

- (PSSpecifier)allowEveryoneSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setAllowEveryoneSpecifier:(id)a3
{
}

- (PSSpecifier)allowContactsOnlySpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setAllowContactsOnlySpecifier:(id)a3
{
}

- (PSSpecifier)allowGroupsWithOneContactSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setAllowGroupsWithOneContactSpecifier:(id)a3
{
}

- (STCommunicationLimits)communicationLimits
{
  return (STCommunicationLimits *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setCommunicationLimits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationLimits, 0);
  objc_storeStrong((id *)&self->_allowGroupsWithOneContactSpecifier, 0);
  objc_storeStrong((id *)&self->_allowContactsOnlySpecifier, 0);
  objc_storeStrong((id *)&self->_allowEveryoneSpecifier, 0);

  objc_storeStrong((id *)&self->_allowedCommunicationGroupSpecifier, 0);
}

@end