@interface SUSUISoftwareUpdateAutomaticUpdateController
- (BOOL)isAllowedToGetNeRDInfo;
- (PSSpecifier)automaticallyDownloadUpdatesSwitchSpecifier;
- (PSSpecifier)automaticallyInstallSwitchSpecifier;
- (PSSpecifier)securityResponseSwitchSpecifier;
- (SUManagerClient)manager;
- (SUSUISoftwareUpdateAutomaticUpdateController)init;
- (id)automaticDownloadEnabled;
- (id)automaticDownloadStatus;
- (id)automaticUpdateStatus;
- (id)automaticallyDownloadGroup;
- (id)automaticallyDownloadSecurityResponseAndSystemFilesSwitch;
- (id)automaticallyDownloadUpdatesSwitch;
- (id)automaticallyInstallGroup;
- (id)automaticallyInstallSwitch;
- (id)getNeRDDisplayInfo;
- (id)previousUserSpecifiedAutomaticUpdateStatus;
- (id)previousUserSpecifiedSecurityResponseStatus;
- (id)securityResponseStatus;
- (id)specifiers;
- (id)updateController;
- (void)cmdZPressed:(id)a3;
- (void)dealloc;
- (void)displayNeRDAlertToUser;
- (void)motionBegan:(int64_t)a3 withEvent:(id)a4;
- (void)preferences:(id)a3 didChangePreference:(id)a4 toValue:(id)a5;
- (void)setArmedAutomaticallyInstallToggledWithValue:(id)a3 forSpecifier:(id)a4;
- (void)setAutomaticallyDownloadUpdatesSwitchSpecifier:(id)a3;
- (void)setAutomaticallyDownloadUpdatesToggledWithValue:(id)a3 forSpecifier:(id)a4;
- (void)setAutomaticallyInstallSecurityResponsesAndSystemDataToggledWithValue:(id)a3 forSpecifier:(id)a4;
- (void)setAutomaticallyInstallSwitchSpecifier:(id)a3;
- (void)setAutomaticallyInstallUpdatesToggledWithValue:(id)a3 forSpecifier:(id)a4;
- (void)setManager:(id)a3;
- (void)setNonArmedAutomaticallyInstallToggledWithValue:(id)a3 forSpecifier:(id)a4;
- (void)setSecurityResponseSwitchSpecifier:(id)a3;
- (void)setSecurityResponseToggleState:(id)a3 toggleCellEnabled:(id)a4 userSpecified:(BOOL)a5 specifier:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SUSUISoftwareUpdateAutomaticUpdateController

- (void)cmdZPressed:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(SUSUISoftwareUpdateAutomaticUpdateController *)v4 isAllowedToGetNeRDInfo]) {
    [(SUSUISoftwareUpdateAutomaticUpdateController *)v4 displayNeRDAlertToUser];
  }
  objc_storeStrong(location, 0);
}

- (void)motionBegan:(int64_t)a3 withEvent:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v6 = self;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if ([(SUSUISoftwareUpdateAutomaticUpdateController *)v6 isAllowedToGetNeRDInfo]
    && [location[0] type] == 1)
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v7, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) motionBegan:withEvent:]");
      _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%s: RecoveryOS info is about to be displayed.", v7, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(SUSUISoftwareUpdateAutomaticUpdateController *)v6 displayNeRDAlertToUser];
  }
  objc_storeStrong(location, 0);
}

- (BOOL)isAllowedToGetNeRDInfo
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v8 = self;
  SEL v7 = a2;
  id v3 = (id)[MEMORY[0x263F78500] sharedDefaults];
  char v4 = [v3 isNeRDProfileStatusInstalled];

  char v6 = v4 & 1;
  if (v4)
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) isAllowedToGetNeRDInfo]");
      _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%s: RecoveryOS info profile is Enabled", v9, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  return v6 & 1;
}

- (id)getNeRDDisplayInfo
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12 = self;
  location[1] = (id)a2;
  location[0] = @"No info provided";
  id v10 = (id)[(SUSUISoftwareUpdateAutomaticUpdateController *)v12 parentController];
  if (v10)
  {
    id v4 = (id)[v10 manager];
    id v9 = (id)[v4 rvGetCurrentNeRDInfo];

    if (v9 && [v9 count])
    {
      id v8 = (id)[v9 description];
      if (v8 && ([v8 isEqual:&stru_26DCD7690] & 1) == 0) {
        objc_storeStrong(location, v8);
      }
      objc_storeStrong(&v8, 0);
    }
    else
    {
      id v7 = _SUSUILoggingFacility();
      os_log_type_t v6 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) getNeRDDisplayInfo]");
        _os_log_error_impl(&dword_228401000, (os_log_t)v7, v6, "%s: Dictionary from RecoveryOS info is nil", v14, 0xCu);
      }
      objc_storeStrong(&v7, 0);
    }
    objc_storeStrong(&v9, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v13, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) getNeRDDisplayInfo]");
      _os_log_error_impl(&dword_228401000, oslog, OS_LOG_TYPE_ERROR, "%s: parentController is not 'SUSUISoftwareUpdateController'", v13, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v3 = location[0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v3;
}

- (void)displayNeRDAlertToUser
{
  v13 = self;
  v12[1] = (id)a2;
  v2 = (void *)MEMORY[0x263F82418];
  id v3 = [(SUSUISoftwareUpdateAutomaticUpdateController *)self getNeRDDisplayInfo];
  v12[0] = (id)objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", @"RecoveryOS profile detected\n Current info:");

  id v4 = (void *)MEMORY[0x263F82400];
  v5[1] = (id)MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __76__SUSUISoftwareUpdateAutomaticUpdateController_NeRD__displayNeRDAlertToUser__block_invoke;
  id v9 = &unk_26483B738;
  id v10 = v13;
  id v11 = (id)objc_msgSend(v4, "actionWithTitle:style:handler:", @"Update Now", 0);
  v5[0] = (id)[MEMORY[0x263F82400] actionWithTitle:@"Close" style:1 handler:&__block_literal_global_1];
  [v12[0] addAction:v5[0]];
  [v12[0] addAction:v11];
  -[SUSUISoftwareUpdateAutomaticUpdateController presentViewController:animated:completion:](v13, "presentViewController:animated:completion:", v12[0], 1);
  objc_storeStrong(v5, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(v12, 0);
}

void __76__SUSUISoftwareUpdateAutomaticUpdateController_NeRD__displayNeRDAlertToUser__block_invoke(id *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  v7[0] = _SUSUILoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) displayNeRDAlertToUser]_block_invoke");
    _os_log_impl(&dword_228401000, (os_log_t)v7[0], v6, "%s: RecoveryOS updated triggered by user.", v10, 0xCu);
  }
  objc_storeStrong(v7, 0);
  id v5 = (id)[a1[4] parentController];
  if (v5)
  {
    id v2 = (id)[v5 manager];
    [v2 rvTriggerNeRDUpdate];
  }
  else
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v9, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) displayNeRDAlertToUser]_block_invoke");
      _os_log_error_impl(&dword_228401000, oslog, OS_LOG_TYPE_ERROR, "%s: parentController is not 'SUSUISoftwareUpdateController'", v9, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

void __76__SUSUISoftwareUpdateAutomaticUpdateController_NeRD__displayNeRDAlertToUser__block_invoke_289(NSObject *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v5, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController(NeRD) displayNeRDAlertToUser]_block_invoke");
    _os_log_error_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_ERROR, "%s: RecoveryOS alert dismissed without action", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong(location, 0);
}

- (SUSUISoftwareUpdateAutomaticUpdateController)init
{
  SEL v8 = a2;
  id v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)SUSUISoftwareUpdateAutomaticUpdateController;
  uint64_t v6 = [(SUSUISoftwareUpdateAutomaticUpdateController *)&v7 init];
  id v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    id v2 = (SUManagerClient *)objc_alloc_init(MEMORY[0x263F78200]);
    manager = v9->_manager;
    v9->_manager = v2;
  }
  id v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)dealloc
{
  objc_super v7 = self;
  SEL v6 = a2;
  id v4 = [(SUSUISoftwareUpdateAutomaticUpdateController *)self updateController];
  id v3 = (id)[v4 manager];
  id v2 = (id)[v3 preferences];
  [v2 removeObserver:v7];

  v5.receiver = v7;
  v5.super_class = (Class)SUSUISoftwareUpdateAutomaticUpdateController;
  [(SUSUISoftwareUpdateAutomaticUpdateController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  id v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)SUSUISoftwareUpdateAutomaticUpdateController;
  [(SUSUISoftwareUpdateAutomaticUpdateController *)&v8 viewDidLoad];
  id v4 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = (id)[v4 localizedStringForKey:@"AUTOMATIC_UPDATES" value:&stru_26DCD7690 table:@"Software Update"];
  id v2 = (id)[(SUSUISoftwareUpdateAutomaticUpdateController *)v10 navigationItem];
  [v2 setTitle:v3];

  id v7 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v10 updateController];
  id v6 = (id)[v7 manager];
  id v5 = (id)[v6 preferences];
  [v5 addObserver:v10];
}

- (void)viewDidAppear:(BOOL)a3
{
  SEL v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUSUISoftwareUpdateAutomaticUpdateController;
  [(SUSUISoftwareUpdateAutomaticUpdateController *)&v6 viewDidAppear:a3];
  id v3 = v9;
  id v5 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = (id)[v5 localizedStringForKey:@"AUTOMATIC_UPDATES" value:&stru_26DCD7690 table:@"Software Update"];
  -[PSListController addNavigationEventForSystemSettings:andRelativeLinkToSoftwareUpdate:](v3, "addNavigationEventForSystemSettings:andRelativeLinkToSoftwareUpdate:");
}

- (id)specifiers
{
  v14[5] = *MEMORY[0x263EF8340];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]))
  {
    id v13 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  }
  else
  {
    id v10 = [(SUSUISoftwareUpdateAutomaticUpdateController *)self automaticallyInstallGroup];
    v14[0] = v10;
    id v9 = [(SUSUISoftwareUpdateAutomaticUpdateController *)self automaticallyInstallSwitch];
    v14[1] = v9;
    id v8 = [(SUSUISoftwareUpdateAutomaticUpdateController *)self automaticallyDownloadSecurityResponseAndSystemFilesSwitch];
    v14[2] = v8;
    id v7 = [(SUSUISoftwareUpdateAutomaticUpdateController *)self automaticallyDownloadGroup];
    v14[3] = v7;
    id v6 = [(SUSUISoftwareUpdateAutomaticUpdateController *)self automaticallyDownloadUpdatesSwitch];
    v14[4] = v6;
    id v2 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:5];
    uint64_t v11 = (int *)MEMORY[0x263F5FDB8];
    id v3 = (void **)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
    id v4 = *v3;
    *id v3 = v2;

    id v13 = *(id *)((char *)&self->super.super.super.super.super.isa + *v11);
  }
  return v13;
}

- (id)automaticallyInstallGroup
{
  v15[2] = self;
  v15[1] = (id)a2;
  id v4 = (void *)MEMORY[0x263F5FC40];
  id v6 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:", @"AUTOMATIC_UPDATES_AUTO_INSTALL_HEADER");
  v15[0] = (id)objc_msgSend(v4, "groupSpecifierWithName:");

  if (MGGetBoolAnswer() & 1) {
    id v2 = @"WLAN";
  }
  else {
    id v2 = @"WIFI";
  }
  v14 = v2;
  id v12 = (id)[NSString stringWithFormat:@"AUTOMATIC_UPDATES_AUTO_INSTALL_EXPLANATION_%@", v14];
  id v7 = v15[0];
  id v10 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:v12];
  id v8 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:");
  objc_msgSend(v7, "setProperty:forKey:");

  [v15[0] setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  id v11 = v15[0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(v15, 0);
  return v11;
}

- (id)automaticallyInstallSwitch
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = (id)[(SUSUISoftwareUpdateAutomaticUpdateController *)self parentController];
  v19 = 0;
  id v18 = (id)[location[0] manager];
  if ([v18 isTargetedUpdateScheduledForAutoInstall]) {
    v17 = sel_setArmedAutomaticallyInstallToggledWithValue_forSpecifier_;
  }
  else {
    v17 = sel_setNonArmedAutomaticallyInstallToggledWithValue_forSpecifier_;
  }
  id v6 = v17;

  v19 = v17;
  id v8 = (id)MEMORY[0x263F5FC40];
  uint64_t v7 = MEMORY[0x263F086E0];
  id v12 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"AUTOMATIC_INSTALL_TOGGLE_TEXT"];
  id v10 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:");
  id v9 = (id)objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
  -[SUSUISoftwareUpdateAutomaticUpdateController setAutomaticallyInstallSwitchSpecifier:](v21, "setAutomaticallyInstallSwitchSpecifier:");

  id v13 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v21 automaticallyInstallSwitchSpecifier];
  [v13 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];

  v14 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v21 automaticallyInstallSwitchSpecifier];
  [(PSSpecifier *)v14 setIdentifier:@"AUTOMATIC_INSTALL_SWITCH_SPECIFIER"];

  uint64_t v15 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v21 manager];
  BOOL v16 = [(SUManagerClient *)v15 shouldDisableAutoInstallIOSUpdatesToggle];

  if (v16)
  {
    id v5 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v21 automaticallyInstallSwitchSpecifier];
    [v5 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }
  id v4 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v21 automaticallyInstallSwitchSpecifier];
  objc_storeStrong(location, 0);
  id v2 = v4;
  return v2;
}

- (id)automaticallyDownloadGroup
{
  v11[2] = self;
  v11[1] = (id)a2;
  id v3 = (void *)MEMORY[0x263F5FC40];
  id v5 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", @"AUTOMATIC_UPDATES_AUTO_DOWNLOAD_HEADER");
  v11[0] = (id)objc_msgSend(v3, "groupSpecifierWithName:");

  id v6 = v11[0];
  id v9 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"AUTOMATIC_UPDATES_AUTO_DOWNLOAD_EXPLANATION"];
  id v7 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:");
  objc_msgSend(v6, "setProperty:forKey:");

  [v11[0] setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  id v10 = v11[0];
  objc_storeStrong(v11, 0);
  return v10;
}

- (id)automaticallyDownloadUpdatesSwitch
{
  uint64_t v15 = self;
  SEL v14 = a2;
  id v5 = (id)MEMORY[0x263F5FC40];
  uint64_t v4 = MEMORY[0x263F086E0];
  id v9 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"AUTOMATIC_INSTALL_TOGGLE_TEXT"];
  id v7 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:");
  id v6 = (id)objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
  -[SUSUISoftwareUpdateAutomaticUpdateController setAutomaticallyDownloadUpdatesSwitchSpecifier:](v15, "setAutomaticallyDownloadUpdatesSwitchSpecifier:");

  id v10 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v15 automaticallyDownloadUpdatesSwitchSpecifier];
  [(PSSpecifier *)v10 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];

  id v11 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v15 automaticallyDownloadUpdatesSwitchSpecifier];
  [(PSSpecifier *)v11 setIdentifier:@"AUTOMATIC_DOWNLOAD_SWITCH_SPECIFIER"];

  id v12 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v15 manager];
  BOOL v13 = [(SUManagerClient *)v12 shouldDisableAutoDownloadIOSUpdatesToggle];

  if (v13)
  {
    id v3 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v15 automaticallyDownloadUpdatesSwitchSpecifier];
    [v3 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }
  return [(SUSUISoftwareUpdateAutomaticUpdateController *)v15 automaticallyDownloadUpdatesSwitchSpecifier];
}

- (id)automaticallyDownloadSecurityResponseAndSystemFilesSwitch
{
  SEL v14 = self;
  SEL v13 = a2;
  id v5 = (id)MEMORY[0x263F5FC40];
  uint64_t v4 = MEMORY[0x263F086E0];
  id v8 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = (id)[v8 localizedStringForKey:@"AUTOMATIC_UPDATES_DOWNLOAD_TOGGLE_SECURITY_RESPONSE_AND_SYSTEM_FILES" value:&stru_26DCD7690 table:@"Software Update"];
  id v6 = (id)objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
  -[SUSUISoftwareUpdateAutomaticUpdateController setSecurityResponseSwitchSpecifier:](v14, "setSecurityResponseSwitchSpecifier:");

  id v9 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v14 securityResponseSwitchSpecifier];
  [v9 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];

  id v10 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v14 securityResponseSwitchSpecifier];
  [(PSSpecifier *)v10 setIdentifier:@"AUTOMATIC_INSTALL_SYSTEM_DATA_FILES_SWITCH_SPECIFIER"];

  id v11 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v14 manager];
  BOOL v12 = [(SUManagerClient *)v11 shouldDisableAutoInstallRSRToggle];

  if (v12)
  {
    id v3 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v14 securityResponseSwitchSpecifier];
    [v3 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }
  return [(SUSUISoftwareUpdateAutomaticUpdateController *)v14 securityResponseSwitchSpecifier];
}

- (id)automaticUpdateStatus
{
  id v3 = [(SUSUISoftwareUpdateAutomaticUpdateController *)self updateController];
  id v4 = (id)[v3 automaticUpdateStatus];

  return v4;
}

- (id)automaticDownloadEnabled
{
  id v3 = [(SUSUISoftwareUpdateAutomaticUpdateController *)self updateController];
  id v4 = (id)[v3 automaticDownloadStatus];

  return v4;
}

- (id)automaticDownloadStatus
{
  id v3 = [(SUSUISoftwareUpdateAutomaticUpdateController *)self updateController];
  id v4 = (id)[v3 automaticDownloadStatus];

  return v4;
}

- (id)previousUserSpecifiedAutomaticUpdateStatus
{
  id v3 = [(SUSUISoftwareUpdateAutomaticUpdateController *)self updateController];
  id v4 = (id)[v3 previousUserSpecifiedAutomaticUpdateStatus];

  return v4;
}

- (id)securityResponseStatus
{
  id v3 = [(SUSUISoftwareUpdateAutomaticUpdateController *)self updateController];
  id v4 = (id)[v3 securityResponseStatus];

  return v4;
}

- (id)previousUserSpecifiedSecurityResponseStatus
{
  id v3 = [(SUSUISoftwareUpdateAutomaticUpdateController *)self updateController];
  id v4 = (id)[v3 previousUserSpecifiedSecurityResponseStatus];

  return v4;
}

- (void)setNonArmedAutomaticallyInstallToggledWithValue:(id)a3 forSpecifier:(id)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v4 = objc_alloc(MEMORY[0x263F781C8]);
  id v14 = (id)[v4 initWithEventName:*MEMORY[0x263F78398]];
  uint64_t v12 = *MEMORY[0x263F783A0];
  if (([location[0] BOOLValue] & 1) == 1) {
    uint64_t v10 = *MEMORY[0x263F783E0];
  }
  else {
    uint64_t v10 = *MEMORY[0x263F783D8];
  }
  [v14 setEventPayloadEntry:v12 stringValue:v10];
  [(SUManagerClient *)v17->_manager submitSUAnalyticsEvent:v14];
  if ([location[0] BOOLValue])
  {
    id v5 = objc_alloc(MEMORY[0x263F781C8]);
    id v13 = (id)[v5 initWithEventName:*MEMORY[0x263F78398]];
    [v13 setEventPayloadEntry:*MEMORY[0x263F783A0] stringValue:*MEMORY[0x263F783B0]];
    [(SUManagerClient *)v17->_manager submitSUAnalyticsEvent:v13];
    id v9 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v17 updateController];
    id v7 = location[0];
    id v8 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v17 automaticallyDownloadUpdatesSwitchSpecifier];
    objc_msgSend(v9, "setAutomaticDownloadFromUI:forSpecifier:", v7);

    -[SUManagerClient autoScanAndDownloadIfAvailable:](v17->_manager, "autoScanAndDownloadIfAvailable:");
    [(SUSUISoftwareUpdateAutomaticUpdateController *)v17 setSecurityResponseToggleState:location[0] toggleCellEnabled:location[0] userSpecified:1 specifier:v15];
    objc_storeStrong(&v13, 0);
  }
  -[SUSUISoftwareUpdateAutomaticUpdateController setAutomaticallyInstallUpdatesToggledWithValue:forSpecifier:](v17, "setAutomaticallyInstallUpdatesToggledWithValue:forSpecifier:", location[0], v15, &v15);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
}

- (void)setArmedAutomaticallyInstallToggledWithValue:(id)a3 forSpecifier:(id)a4
{
  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v45 = 0;
  objc_storeStrong(&v45, a4);
  if (([location[0] BOOLValue] & 1) == 1)
  {
    id v18 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v47 updateController];
    [v18 setAutomaticUpdatesFromUI:location[0] forSpecifier:v45];

    int v44 = 1;
  }
  else
  {
    id v4 = (void *)MEMORY[0x263F82418];
    id v8 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", @"AUTOMATIC_UPDATES_WITH_AUTOINSTALL_SHEET_TITLE");
    id v6 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = (id)[v6 localizedStringForKey:@"AUTOMATIC_UPDATES_WITH_AUTOINSTALL_SHEET_DESCRIPTION" value:&stru_26DCD7690 table:@"Software Update"];
    id v43 = (id)objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v7);

    id v9 = (void *)MEMORY[0x263F82400];
    id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = (id)[v11 localizedStringForKey:@"AUTOMATIC_UPDATES_WITH_AUTOINSTALL_SHEET_AUTOUPDATE_OFF" value:&stru_26DCD7690 table:@"Software Update"];
    uint64_t v34 = MEMORY[0x263EF8330];
    int v35 = -1073741824;
    int v36 = 0;
    v37 = __106__SUSUISoftwareUpdateAutomaticUpdateController_setArmedAutomaticallyInstallToggledWithValue_forSpecifier___block_invoke;
    v38 = &unk_2648427B8;
    v39 = v47;
    id v40 = location[0];
    id v41 = v45;
    id v42 = (id)[v9 actionWithTitle:v10 style:2 handler:&v34];

    uint64_t v12 = (void *)MEMORY[0x263F82400];
    id v14 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v13 = (id)[v14 localizedStringForKey:@"AUTOMATIC_UPDATES_WITH_AUTOINSTALL_SHEET_AUTOINSTALL_OFF" value:&stru_26DCD7690 table:@"Software Update"];
    uint64_t v27 = MEMORY[0x263EF8330];
    int v28 = -1073741824;
    int v29 = 0;
    v30 = __106__SUSUISoftwareUpdateAutomaticUpdateController_setArmedAutomaticallyInstallToggledWithValue_forSpecifier___block_invoke_2;
    v31 = &unk_26483B738;
    v32 = v47;
    id v33 = (id)[v12 actionWithTitle:v13 style:0 handler:&v27];

    id v15 = (void *)MEMORY[0x263F82400];
    id v17 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v16 = (id)[v17 localizedStringForKey:@"AUTOMATIC_UPDATES_WITH_AUTOINSTALL_SHEET_CANCEL" value:&stru_26DCD7690 table:@"Software Update"];
    uint64_t v20 = MEMORY[0x263EF8330];
    int v21 = -1073741824;
    int v22 = 0;
    v23 = __106__SUSUISoftwareUpdateAutomaticUpdateController_setArmedAutomaticallyInstallToggledWithValue_forSpecifier___block_invoke_3;
    v24 = &unk_26483B738;
    v25 = v47;
    id v26 = (id)[v15 actionWithTitle:v16 style:1 handler:&v20];

    [v43 addAction:v33];
    [v43 addAction:v42];
    [v43 addAction:v26];
    -[SUSUISoftwareUpdateAutomaticUpdateController presentViewController:animated:completion:](v47, "presentViewController:animated:completion:", v43, 1);
    objc_storeStrong(&v26, 0);
    objc_storeStrong((id *)&v25, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong((id *)&v32, 0);
    objc_storeStrong(&v42, 0);
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v40, 0);
    objc_storeStrong((id *)&v39, 0);
    objc_storeStrong(&v43, 0);
    int v44 = 0;
  }
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
}

void __106__SUSUISoftwareUpdateAutomaticUpdateController_setArmedAutomaticallyInstallToggledWithValue_forSpecifier___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6[1] = (id)a1;
  id v2 = objc_alloc(MEMORY[0x263F781C8]);
  v6[0] = (id)[v2 initWithEventName:*MEMORY[0x263F78398]];
  [v6[0] setEventPayloadEntry:*MEMORY[0x263F783A0] stringValue:*MEMORY[0x263F783E8]];
  [*(id *)(*(void *)(a1 + 32) + 1408) submitSUAnalyticsEvent:v6[0]];
  id v3 = (id)[*(id *)(a1 + 32) updateController];
  [v3 setAutomaticUpdatesFromUI:*(void *)(a1 + 40) forSpecifier:*(void *)(a1 + 48)];

  id v5 = (id)[*(id *)(a1 + 32) updateController];
  [v5 unscheduleTargetedUpdateAutomaticInstallation];

  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
}

void __106__SUSUISoftwareUpdateAutomaticUpdateController_setArmedAutomaticallyInstallToggledWithValue_forSpecifier___block_invoke_2(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  id v2 = objc_alloc(MEMORY[0x263F781C8]);
  v7[0] = (id)[v2 initWithEventName:*MEMORY[0x263F78398]];
  [v7[0] setEventPayloadEntry:*MEMORY[0x263F783A0] stringValue:*MEMORY[0x263F783C8]];
  [*((id *)a1[4] + 176) submitSUAnalyticsEvent:v7[0]];
  id v3 = (id)[a1[4] updateController];
  [v3 unscheduleTargetedUpdateAutomaticInstallation];

  id v5 = a1[4];
  id v6 = (id)[v5 automaticallyInstallSwitchSpecifier];
  objc_msgSend(v5, "reloadSpecifier:");

  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
}

void __106__SUSUISoftwareUpdateAutomaticUpdateController_setArmedAutomaticallyInstallToggledWithValue_forSpecifier___block_invoke_3(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6[1] = a1;
  id v2 = objc_alloc(MEMORY[0x263F781C8]);
  v6[0] = (id)[v2 initWithEventName:*MEMORY[0x263F78398]];
  [v6[0] setEventPayloadEntry:*MEMORY[0x263F783A0] stringValue:*MEMORY[0x263F783D0]];
  [*(id *)(a1[4] + 1408) submitSUAnalyticsEvent:v6[0]];
  id v4 = (void *)a1[4];
  id v5 = (id)[v4 automaticallyInstallSwitchSpecifier];
  objc_msgSend(v4, "reloadSpecifier:");

  objc_storeStrong(v6, 0);
  objc_storeStrong(location, 0);
}

- (void)setAutomaticallyInstallUpdatesToggledWithValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v4 = objc_alloc(MEMORY[0x263F781C8]);
  id v9 = (id)[v4 initWithEventName:*MEMORY[0x263F78398]];
  uint64_t v8 = *MEMORY[0x263F783A0];
  if (([location[0] BOOLValue] & 1) == 1) {
    uint64_t v6 = *MEMORY[0x263F783E0];
  }
  else {
    uint64_t v6 = *MEMORY[0x263F783D8];
  }
  [v9 setEventPayloadEntry:v8 stringValue:v6];
  [(SUManagerClient *)v12->_manager submitSUAnalyticsEvent:v9];
  id v5 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v12 updateController];
  [v5 setAutomaticUpdatesFromUI:location[0] forSpecifier:v10];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)setAutomaticallyDownloadUpdatesToggledWithValue:(id)a3 forSpecifier:(id)a4
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v10 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v18 updateController];
  [v10 setAutomaticDownloadFromUI:location[0] forSpecifier:v16];

  id v4 = objc_alloc(MEMORY[0x263F781C8]);
  id v15 = (id)[v4 initWithEventName:*MEMORY[0x263F78398]];
  uint64_t v11 = *MEMORY[0x263F783A0];
  if (([location[0] BOOLValue] & 1) == 1) {
    uint64_t v8 = *MEMORY[0x263F783B0];
  }
  else {
    uint64_t v8 = *MEMORY[0x263F783A8];
  }
  [v15 setEventPayloadEntry:v11 stringValue:v8];
  [(SUManagerClient *)v18->_manager submitSUAnalyticsEvent:v15];
  if ([location[0] BOOLValue])
  {
    [(SUManagerClient *)v18->_manager autoScanAndDownloadIfAvailable:0];
  }
  else
  {
    id v7 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v18 updateController];
    [v7 unscheduleTargetedUpdateAutomaticInstallation];
  }
  char v12 = 0;
  if ([location[0] BOOLValue])
  {
    id v13 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v18 previousUserSpecifiedAutomaticUpdateStatus];
    char v12 = 1;
    id v5 = v13;
  }
  else
  {
    id v5 = MEMORY[0x263EFFA80];
  }
  id v14 = v5;
  if (v12) {

  }
  -[SUSUISoftwareUpdateAutomaticUpdateController setSecurityResponseToggleState:toggleCellEnabled:userSpecified:specifier:](v18, "setSecurityResponseToggleState:toggleCellEnabled:userSpecified:specifier:", v14, location[0], 0, v16, &v14);
  objc_storeStrong(v6, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)setAutomaticallyInstallSecurityResponsesAndSystemDataToggledWithValue:(id)a3 forSpecifier:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v4 = objc_alloc(MEMORY[0x263F781C8]);
  id v10 = (id)[v4 initWithEventName:*MEMORY[0x263F78398]];
  uint64_t v9 = *MEMORY[0x263F783A0];
  if (([location[0] BOOLValue] & 1) == 1) {
    uint64_t v7 = *MEMORY[0x263F783C0];
  }
  else {
    uint64_t v7 = *MEMORY[0x263F783B8];
  }
  [v10 setEventPayloadEntry:v9 stringValue:v7];
  [(SUManagerClient *)v13->_manager submitSUAnalyticsEvent:v10];
  id v5 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v13 updateController];
  [v5 setAutomaticInstallSystemDataFilesFromUI:location[0] forSpecifier:v11];

  id v6 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v13 updateController];
  [v6 setSecurityResponseFromUI:location[0] forSpecifier:v11];

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)setSecurityResponseToggleState:(id)a3 toggleCellEnabled:(id)a4 userSpecified:(BOOL)a5 specifier:(id)a6
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  BOOL v15 = a5;
  id v14 = 0;
  objc_storeStrong(&v14, a6);
  id v9 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v18 updateController];
  [v9 setAutomaticUpdatesFromUI:location[0] userSpecified:v15 forSpecifier:v14];

  id v10 = v18;
  id v11 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v18 automaticallyDownloadUpdatesSwitchSpecifier];
  -[SUSUISoftwareUpdateAutomaticUpdateController reloadSpecifier:animated:](v10, "reloadSpecifier:animated:");

  char v12 = v18;
  id v13 = [(SUSUISoftwareUpdateAutomaticUpdateController *)v18 automaticallyInstallSwitchSpecifier];
  -[SUSUISoftwareUpdateAutomaticUpdateController reloadSpecifier:animated:](v12, "reloadSpecifier:animated:");

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)preferences:(id)a3 didChangePreference:(id)a4 toValue:(id)a5
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  queue = MEMORY[0x263EF83A0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __88__SUSUISoftwareUpdateAutomaticUpdateController_preferences_didChangePreference_toValue___block_invoke;
  char v12 = &unk_26483BA90;
  id v13 = v17;
  dispatch_async(queue, &v8);

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

uint64_t __88__SUSUISoftwareUpdateAutomaticUpdateController_preferences_didChangePreference_toValue___block_invoke(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  os_log_t oslog[2] = a1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v4, (uint64_t)"-[SUSUISoftwareUpdateAutomaticUpdateController preferences:didChangePreference:toValue:]_block_invoke");
    _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: SUPreferences have been changed. Reloading the screen.", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  return [(objc_class *)a1[4].isa reloadSpecifiers];
}

- (id)updateController
{
  return (id)[(SUSUISoftwareUpdateAutomaticUpdateController *)self parentController];
}

- (PSSpecifier)automaticallyInstallSwitchSpecifier
{
  return self->_automaticallyInstallSwitchSpecifier;
}

- (void)setAutomaticallyInstallSwitchSpecifier:(id)a3
{
}

- (PSSpecifier)automaticallyDownloadUpdatesSwitchSpecifier
{
  return self->_automaticallyDownloadUpdatesSwitchSpecifier;
}

- (void)setAutomaticallyDownloadUpdatesSwitchSpecifier:(id)a3
{
}

- (PSSpecifier)securityResponseSwitchSpecifier
{
  return self->_securityResponseSwitchSpecifier;
}

- (void)setSecurityResponseSwitchSpecifier:(id)a3
{
}

- (SUManagerClient)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end