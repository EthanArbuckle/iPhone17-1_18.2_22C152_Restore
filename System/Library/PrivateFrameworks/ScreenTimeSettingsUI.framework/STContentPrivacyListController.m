@interface STContentPrivacyListController
- (BOOL)isEligibleForAppDistribution;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3;
- (NSArray)distributionStoreDetailSpecifiers;
- (NSArray)storeDetailSpecifiers;
- (PSSpecifier)contentRestrictionsSpecifier;
- (PSSpecifier)enableRestrictionsSwitchSpecifier;
- (STContentPrivacyListController)init;
- (id)_allowChangesSpecifiers;
- (id)_enableRestrictionsSwitchSpecifier;
- (id)_privacySpecifiers;
- (id)_topLevelSpecifierWithAction:(SEL)a3 name:(id)a4;
- (id)_topLevelSpecifiers;
- (id)defaultLinkListSpecifierWithConfiguration:(id)a3 key:(id)a4;
- (id)defaultLinkListSpecifierWithItem:(id)a3;
- (id)defaultRadioItemSpecifierWithGroup:(id)a3 name:(id)a4 value:(id)a5;
- (id)getItemSpecifierValue:(id)a3;
- (id)getRestrictionsEnabled:(id)a3;
- (id)groupSpecifierWithConfiguration:(id)a3 key:(id)a4 footerText:(id)a5 radio:(BOOL)a6;
- (id)radioGroupSpecifierWithName:(id)a3 footerText:(id)a4 item:(id)a5;
- (id)specifiers;
- (id)tccSpecifierWithCapabilityKey:(id)a3 id:(id)a4;
- (void)_isLoadedDidChange:(BOOL)a3;
- (void)_viewProfilesAndDeviceManagement:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setContentRestrictionsSpecifier:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setEnableRestrictionsSwitchSpecifier:(id)a3;
- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4;
- (void)setItemSpecifierValueForUIOnly:(id)a3 specifier:(id)a4;
- (void)setRestrictionsEnabled:(id)a3 specifier:(id)a4;
- (void)showAllowedAppsRestrictions:(id)a3;
- (void)showMediaRestrictions:(id)a3;
- (void)showSiriAndIntelligenceRestrictions:(id)a3;
- (void)showiTunesPurchasesRestrictions:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation STContentPrivacyListController

- (STContentPrivacyListController)init
{
  v6.receiver = self;
  v6.super_class = (Class)STContentPrivacyListController;
  v2 = [(STPINListViewController *)&v6 init];
  if (v2)
  {
    v3 = +[STScreenTimeSettingsUIBundle bundle];
    v4 = [v3 localizedStringForKey:@"ContentPrivacySpecifierName" value:&stru_26D9391A8 table:0];
    [(STContentPrivacyListController *)v2 setTitle:v4];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)STContentPrivacyListController;
  [(STPINListViewController *)&v16 viewDidAppear:a3];
  v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.ScreenTime/CONTENT_PRIVACY"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  objc_super v6 = [MEMORY[0x263EFF960] currentLocale];
  v7 = +[STScreenTimeSettingsUIBundle bundle];
  v8 = [v7 bundleURL];
  v9 = (void *)[v5 initWithKey:@"ContentPrivacySpecifierName" table:@"Localizable" locale:v6 bundleURL:v8];

  id v10 = objc_alloc(MEMORY[0x263F08DB0]);
  v11 = [MEMORY[0x263EFF960] currentLocale];
  v12 = +[STScreenTimeSettingsUIBundle bundle];
  v13 = [v12 bundleURL];
  v14 = (void *)[v10 initWithKey:@"ScreenTimeControllerTitle" table:@"Localizable" locale:v11 bundleURL:v13];

  v17[0] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(STContentPrivacyListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.screen-time" title:v9 localizedNavigationComponents:v15 deepLink:v4];
}

- (BOOL)isEligibleForAppDistribution
{
  v3 = [(STPINListViewController *)self coordinator];
  v4 = [v3 viewModel];
  id v5 = [v4 me];
  if ([v5 isRemoteUser])
  {
    char v6 = 0;
  }
  else
  {
    v7 = [(STPINListViewController *)self coordinator];
    v8 = [v7 contentPrivacyCoordinator];
    v9 = [v8 viewModel];
    char v6 = [v9 isEligibleForAppDistribution];
  }
  return v6;
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  id v4 = a3;
  id v5 = [(STContentPrivacyListController *)self specifierForID:v4];
  if ([v4 isEqualToString:@"ALLOWED_APPS"]
    && ![*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) containsObject:v5])
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STContentPrivacyListController;
    BOOL v6 = [(STPINListViewController *)&v8 shouldDeferPushForSpecifierID:v4];
  }

  return v6;
}

- (id)specifiers
{
  v3 = [(STContentPrivacyListController *)self specifier];
  id v4 = [v3 objectForKeyedSubscript:0x26D940528];
  [(STContentPrivacyListController *)self setCoordinator:v4];

  id v5 = [v4 contentPrivacyCoordinator];
  BOOL v6 = [v5 viewModel];
  int v7 = [v6 isLoaded];

  if (!v7)
  {
    id v18 = (id)MEMORY[0x263EFFA68];
    goto LABEL_20;
  }
  objc_super v8 = objc_opt_new();
  v9 = [v4 viewModel];
  id v10 = [v9 me];
  char v11 = [v10 isRemoteUser];

  if ((v11 & 1) == 0)
  {
    v12 = [MEMORY[0x263F53C50] sharedConnection];
    v13 = [v12 installedMDMProfileIdentifier];
    v14 = [v12 installedProfileIdentifiersWithFilterFlags:69];
    v15 = (void *)[v14 mutableCopy];

    if (v13)
    {
      v47 = v12;
      [v15 removeObject:v13];
      unint64_t v16 = [v15 count];
      BOOL v17 = v16 != 0;
    }
    else
    {
      uint64_t v19 = [v15 count];
      BOOL v17 = v19 != 0;
      if (!v19)
      {
LABEL_18:

        goto LABEL_19;
      }
      unint64_t v16 = v19;
      v47 = v12;
    }
    v48 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    v20 = +[STScreenTimeSettingsUIBundle bundle];
    v21 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
    v49 = v13;
    v50 = v15;
    if (v13)
    {
      if (v17)
      {
        v22 = [v20 localizedStringForKey:@"ViewProfilesDeviceManagementFooterText" value:&stru_26D9391A8 table:v21];
        v23 = v48;
        [v48 setObject:v22 forKeyedSubscript:*MEMORY[0x263F600F8]];

        v24 = @"ViewProfilesDeviceManagementButtonTitle";
      }
      else
      {
        v30 = [v20 localizedStringForKey:@"ViewDeviceManagementFooterText" value:&stru_26D9391A8 table:v21];
        v23 = v48;
        [v48 setObject:v30 forKeyedSubscript:*MEMORY[0x263F600F8]];

        v24 = @"ViewDeviceManagementButtonTitle";
      }
      v31 = v23;
      v27 = [v20 localizedStringForKey:v24 value:&stru_26D9391A8 table:v21];
      v32 = v20;
      v33 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v27 target:self set:0 get:0 detail:0 cell:13 edit:0];
    }
    else
    {
      v46 = [MEMORY[0x263EFF960] currentLocale];
      id v25 = [NSString alloc];
      if (v16 < 2)
      {
        v34 = [v20 localizedStringForKey:@"ViewProfileButtonTitle" value:&stru_26D9391A8 table:v21];
        v27 = objc_msgSend(v25, "initWithFormat:locale:", v34, v46, v16);

        id v28 = [NSString alloc];
        v29 = @"ViewProfileFooterText";
      }
      else
      {
        v26 = [v20 localizedStringForKey:@"ViewProfilesButtonTitle" value:&stru_26D9391A8 table:v21];
        v27 = objc_msgSend(v25, "initWithFormat:locale:", v26, v46, v16);

        id v28 = [NSString alloc];
        v29 = @"ViewProfilesFooterText";
      }
      v35 = [v20 localizedStringForKey:v29 value:&stru_26D9391A8 table:v21];
      v36 = objc_msgSend(v28, "initWithFormat:locale:", v35, v46, v16);
      [v48 setObject:v36 forKeyedSubscript:*MEMORY[0x263F600F8]];

      v31 = v48;
      v32 = v20;
      v33 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v27 target:self set:0 get:0 detail:0 cell:13 edit:0];
    }
    v12 = v47;

    [v33 setButtonAction:sel__viewProfilesAndDeviceManagement_];
    [v33 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
    [v8 addObject:v31];
    [v8 addObject:v33];
    objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    v38 = v37 = v31;
    [v8 addObject:v38];

    v13 = v49;
    v15 = v50;
    goto LABEL_18;
  }
LABEL_19:
  v39 = [(STContentPrivacyListController *)self _enableRestrictionsSwitchSpecifier];
  [(STContentPrivacyListController *)self setEnableRestrictionsSwitchSpecifier:v39];
  [v8 addObject:v39];
  v40 = [(STContentPrivacyListController *)self _topLevelSpecifiers];
  [v8 addObjectsFromArray:v40];

  v41 = [(STContentPrivacyListController *)self _allowChangesSpecifiers];
  [v8 addObjectsFromArray:v41];

  v42 = (objc_class *)[v8 copy];
  uint64_t v43 = (int)*MEMORY[0x263F5FDB8];
  v44 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v43);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v43) = v42;

  id v18 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + v43);
LABEL_20:

  return v18;
}

- (id)_enableRestrictionsSwitchSpecifier
{
  v3 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  id v4 = +[STScreenTimeSettingsUIBundle bundle];
  id v5 = [v4 localizedStringForKey:@"ContentPrivacySpecifierName" value:&stru_26D9391A8 table:v3];
  BOOL v6 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel_setRestrictionsEnabled_specifier_, sel_getRestrictionsEnabled_, 0, 6, +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
  int v7 = [(STPINListViewController *)self coordinator];
  objc_super v8 = [v7 contentPrivacyCoordinator];
  v9 = [v8 viewModel];
  char v10 = [v9 shouldAllowEditing];

  if ((v10 & 1) == 0) {
    [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
  }
  [(STPINListViewController *)self setUpPasscodeAndLineWrapBehaviorForSpecifier:v6];
  [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940328];

  return v6;
}

- (id)_topLevelSpecifiers
{
  if (_os_feature_enabled_impl()) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 3;
  }
  id v4 = [MEMORY[0x263EFF980] arrayWithCapacity:v3];
  uint64_t v5 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  BOOL v6 = +[STScreenTimeSettingsUIBundle bundle];
  int v7 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
  [v4 addObject:v7];

  if ([(STContentPrivacyListController *)self isEligibleForAppDistribution]) {
    objc_super v8 = @"AppsInstallationsAndPurchasesSpecifierName";
  }
  else {
    objc_super v8 = @"ITunesAppStorePurchasesSpecifierName";
  }
  v9 = [v6 localizedStringForKey:v8 value:&stru_26D9391A8 table:v5];
  char v10 = [(STContentPrivacyListController *)self _topLevelSpecifierWithAction:sel_showiTunesPurchasesRestrictions_ name:v9];

  [v10 setIdentifier:@"PURCHASES"];
  v26 = v10;
  [v4 addObject:v10];
  id v25 = [v6 localizedStringForKey:@"AADC_AllowedAppsAndFeaturesSpecifierName" value:&stru_26D9391A8 table:v5];
  char v11 = -[STContentPrivacyListController _topLevelSpecifierWithAction:name:](self, "_topLevelSpecifierWithAction:name:", sel_showAllowedAppsRestrictions_);
  [v11 setIdentifier:@"ALLOWED_APPS"];
  [v4 addObject:v11];
  v12 = [v4 lastObject];
  uint64_t v13 = *MEMORY[0x263F5FEF8];
  uint64_t v14 = MEMORY[0x263EFFA88];
  [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];

  if (_os_feature_enabled_impl()) {
    v15 = @"AADC_ContentRestrictionsSpecifierName";
  }
  else {
    v15 = @"AADC_Old_ContentRestrictionsSpecifierName";
  }
  v27 = (void *)v5;
  unint64_t v16 = [v6 localizedStringForKey:v15 value:&stru_26D9391A8 table:v5];
  BOOL v17 = [(STContentPrivacyListController *)self _topLevelSpecifierWithAction:sel_showMediaRestrictions_ name:v16];
  [v17 setIdentifier:@"CONTENT_RESTRICTIONS"];
  [v4 addObject:v17];
  id v18 = [v4 lastObject];
  [v18 setObject:v14 forKeyedSubscript:v13];

  uint64_t v19 = [v4 lastObject];
  [(STContentPrivacyListController *)self setContentRestrictionsSpecifier:v19];

  if (_os_feature_enabled_impl())
  {
    v20 = [v6 localizedStringForKey:@"AADC_SiriAndIntelligenceRestrictionsSpecifierName" value:&stru_26D9391A8 table:v27];
    v21 = [(STContentPrivacyListController *)self _topLevelSpecifierWithAction:sel_showSiriAndIntelligenceRestrictions_ name:v20];
    [v21 setIdentifier:@"SIRI_AND_INTELLIGENCE_RESTRICTIONS"];
    [v4 addObject:v21];
    v22 = [v4 lastObject];
    [v22 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v13];
  }
  v23 = [(STContentPrivacyListController *)self _privacySpecifiers];
  [v4 addObjectsFromArray:v23];

  return v4;
}

- (NSArray)storeDetailSpecifiers
{
  uint64_t v3 = objc_opt_new();
  id v4 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  uint64_t v5 = +[STScreenTimeSettingsUIBundle bundle];
  BOOL v6 = (void *)MEMORY[0x263F5FC40];
  int v7 = [v5 localizedStringForKey:@"StorePurchasesLabel" value:&stru_26D9391A8 table:v4];
  objc_super v8 = [v6 groupSpecifierWithName:v7];
  [v3 addObject:v8];

  uint64_t v9 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"application.store" key:@"allowAppInstallation"];
  uint64_t v10 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"application.store" key:@"allowUIAppInstallation"];
  char v11 = [(STContentPrivacyListController *)self getItemSpecifierValue:v9];
  int v12 = [v11 BOOLValue];

  v39 = (void *)v10;
  uint64_t v13 = [(STContentPrivacyListController *)self getItemSpecifierValue:v10];
  unsigned int v14 = [v13 BOOLValue];

  if (v12 != v14)
  {
    v15 = [NSNumber numberWithInt:v12 & v14];
    [(STContentPrivacyListController *)self setItemSpecifierValueForUIOnly:v15 specifier:v9];
  }
  [v3 addObject:v9];
  unint64_t v16 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"application.store" key:@"allowAppRemoval"];
  [v3 addObject:v16];

  BOOL v17 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"application.store" key:@"allowInAppPurchases"];
  [v3 addObject:v17];

  id v18 = [(STPINListViewController *)self coordinator];
  uint64_t v19 = [v18 contentPrivacyCoordinator];
  v20 = [v19 viewModel];

  v40 = (void *)v9;
  if (![v20 isLocalDevice]) {
    goto LABEL_6;
  }
  v21 = (void *)MEMORY[0x263F29280];
  v22 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  v23 = objc_msgSend(v22, "ams_activeiTunesAccount");
  [v23 username];
  id v25 = v24 = v4;
  v26 = [v21 formattedUsernameFromUsername:v25];

  id v4 = v24;
  if (v26)
  {
    v27 = [v5 localizedStringForKey:@"RequirePasswordDetailText" value:&stru_26D9391A8 table:v24];
    uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", v27, v26);
  }
  else
  {
LABEL_6:
    uint64_t v28 = [v5 localizedStringForKey:@"RequirePasswordNoUserDetailText" value:&stru_26D9391A8 table:v4];
  }
  v38 = (void *)v28;
  v29 = [v20 visibleRestrictionWithConfiguration:@"application.store" key:@"forceITunesStorePasswordEntry"];
  v30 = [v5 localizedStringForKey:@"RequirePasswordLabel" value:&stru_26D9391A8 table:v4];
  v31 = [(STContentPrivacyListController *)self radioGroupSpecifierWithName:v30 footerText:v28 item:v29];
  [v3 addObject:v31];
  v32 = [v5 localizedStringForKey:@"AlwaysRequireSpecifierName" value:&stru_26D9391A8 table:v4];
  [(STContentPrivacyListController *)self defaultRadioItemSpecifierWithGroup:v31 name:v32 value:MEMORY[0x263EFFA88]];
  v33 = v37 = v20;
  [v3 addObject:v33];

  v34 = [v5 localizedStringForKey:@"DontRequireSpecifierName" value:&stru_26D9391A8 table:v4];
  v35 = [(STContentPrivacyListController *)self defaultRadioItemSpecifierWithGroup:v31 name:v34 value:MEMORY[0x263EFFA80]];
  [v3 addObject:v35];

  return (NSArray *)v3;
}

- (NSArray)distributionStoreDetailSpecifiers
{
  v46[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  uint64_t v5 = +[STScreenTimeSettingsUIBundle bundle];
  BOOL v6 = (void *)MEMORY[0x263F5FC40];
  int v7 = [v5 localizedStringForKey:@"AppInstallationsLabel" value:&stru_26D9391A8 table:v4];
  objc_super v8 = [v6 groupSpecifierWithName:v7];

  uint64_t v9 = [v5 localizedStringForKey:@"AppInstallationsDetailText" value:&stru_26D9391A8 table:v4];
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x263F600F8]];

  v45 = v8;
  [v3 addObject:v8];
  uint64_t v10 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"application.store" key:@"allowAppInstallation"];
  [v3 addObject:v10];
  v44 = (void *)v10;
  char v11 = [(STContentPrivacyListController *)self getItemSpecifierValue:v10];
  int v12 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"application.store" key:@"allowUIAppInstallation"];
  uint64_t v13 = *MEMORY[0x263F600A8];
  [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x263F600A8]];
  if (([v11 BOOLValue] & 1) == 0) {
    [(STContentPrivacyListController *)self setItemSpecifierValueForUIOnly:v11 specifier:v12];
  }
  uint64_t v43 = v12;
  [v3 addObject:v12];
  if (_os_feature_enabled_impl())
  {
    unsigned int v14 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"application.store" key:@"allowWebDistributionAppInstallation"];
    [v14 setObject:v11 forKeyedSubscript:v13];
    if (([v11 BOOLValue] & 1) == 0) {
      [(STContentPrivacyListController *)self setItemSpecifierValueForUIOnly:v11 specifier:v14];
    }
    [v3 addObject:v14];
  }
  v15 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"application.store" key:@"allowMarketplaceAppInstallation"];
  [v15 setObject:v11 forKeyedSubscript:v13];
  if (([v11 BOOLValue] & 1) == 0) {
    [(STContentPrivacyListController *)self setItemSpecifierValueForUIOnly:v11 specifier:v15];
  }
  v40 = v11;
  v42 = v15;
  [v3 addObject:v15];
  unint64_t v16 = (void *)MEMORY[0x263F5FC40];
  BOOL v17 = [v5 localizedStringForKey:@"PurchasesLabel" value:&stru_26D9391A8 table:v4];
  id v18 = [v16 groupSpecifierWithName:v17];
  [v3 addObject:v18];

  uint64_t v19 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"application.store" key:@"allowInAppPurchases"];
  [v3 addObject:v19];

  v20 = [(STPINListViewController *)self coordinator];
  v21 = [v20 contentPrivacyCoordinator];
  v22 = [v21 viewModel];

  v41 = v22;
  if (![v22 isLocalDevice]) {
    goto LABEL_12;
  }
  v23 = (void *)MEMORY[0x263F29280];
  v24 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  id v25 = objc_msgSend(v24, "ams_activeiTunesAccount");
  v26 = [v25 username];
  v27 = [v23 formattedUsernameFromUsername:v26];

  if (v27)
  {
    uint64_t v28 = [v5 localizedStringForKey:@"RequirePasswordDetailText" value:&stru_26D9391A8 table:v4];
    v29 = objc_msgSend(NSString, "stringWithFormat:", v28, v27);
  }
  else
  {
LABEL_12:
    v29 = [v5 localizedStringForKey:@"RequirePasswordNoUserDetailText" value:&stru_26D9391A8 table:v4];
  }
  v30 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"application.store" key:@"forceITunesStorePasswordEntry"];
  v31 = [v5 localizedStringForKey:@"AlwaysRequireSpecifierName" value:&stru_26D9391A8 table:v4];
  v32 = [v5 localizedStringForKey:@"DontRequireSpecifierName" value:&stru_26D9391A8 table:v4];
  v46[0] = v31;
  v46[1] = v32;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
  v34 = v33 = (void *)v4;
  [v30 setValues:&unk_26D9675E8 titles:v34];

  [v30 setObject:v29 forKeyedSubscript:*MEMORY[0x263F60280]];
  [v3 addObject:v30];
  v35 = (void *)MEMORY[0x263F5FC40];
  v36 = [v5 localizedStringForKey:@"AppManagementLabel" value:&stru_26D9391A8 table:v33];
  v37 = [v35 groupSpecifierWithName:v36];
  [v3 addObject:v37];

  v38 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"application.store" key:@"allowAppRemoval"];
  [v3 addObject:v38];

  return (NSArray *)v3;
}

- (id)groupSpecifierWithConfiguration:(id)a3 key:(id)a4 footerText:(id)a5 radio:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  unsigned int v14 = +[STScreenTimeSettingsUIBundle bundle];
  v15 = [(STPINListViewController *)self coordinator];
  unint64_t v16 = [v15 contentPrivacyCoordinator];
  BOOL v17 = [v16 viewModel];
  id v18 = [v17 visibleRestrictionWithConfiguration:v12 key:v11];

  uint64_t v19 = (void *)MEMORY[0x263F5FC40];
  v20 = [v18 uiLabel];
  v21 = [v14 localizedStringForKey:v20 value:&stru_26D9391A8 table:v13];
  v22 = [v19 groupSpecifierWithName:v21];

  [v22 setObject:v18 forKeyedSubscript:0x26D93CEC8];
  v23 = [NSNumber numberWithBool:v6];
  [v22 setObject:v23 forKeyedSubscript:*MEMORY[0x263F60168]];

  if (v10) {
    [v22 setObject:v10 forKeyedSubscript:*MEMORY[0x263F600F8]];
  }

  return v22;
}

- (id)_privacySpecifiers
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  uint64_t v5 = +[STScreenTimeSettingsUIBundle bundle];
  BOOL v6 = [v5 localizedStringForKey:@"PrivacySpecifierName" value:&stru_26D9391A8 table:v4];
  int v7 = [(STContentPrivacyListController *)self radioGroupSpecifierWithName:v6 footerText:0 item:0];
  [v3 addObject:v7];

  objc_super v8 = [(STPINListViewController *)self coordinator];
  uint64_t v9 = [v8 contentPrivacyCoordinator];
  id v10 = [v9 viewModel];

  if ([v10 isLocalDevice])
  {
    id v11 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:0x26D93CEA8 key:0x26D93CFE8];
    [v3 addObject:v11];

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v3 lastObject];
    [v13 setDetailControllerClass:v12];

    unsigned int v14 = [(STContentPrivacyListController *)self tccSpecifierWithCapabilityKey:0x26D93D028 id:*MEMORY[0x263F60338]];
    [v3 addObject:v14];

    v15 = [(STContentPrivacyListController *)self tccSpecifierWithCapabilityKey:0x26D93D068 id:*MEMORY[0x263F60330]];
    [v3 addObject:v15];

    unint64_t v16 = [(STContentPrivacyListController *)self tccSpecifierWithCapabilityKey:0x26D93D0E8 id:*MEMORY[0x263F60360]];
    [v3 addObject:v16];

    BOOL v17 = [(STContentPrivacyListController *)self tccSpecifierWithCapabilityKey:0x26D93D0C8 id:*MEMORY[0x263F60358]];
    [v3 addObject:v17];

    id v18 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"system.icloud" key:@"allowFindMyFriendsModification"];
    [v3 addObject:v18];

    uint64_t v19 = [(STContentPrivacyListController *)self tccSpecifierWithCapabilityKey:0x26D93D048 id:*MEMORY[0x263F60328]];
    [v3 addObject:v19];

    v20 = [(STContentPrivacyListController *)self tccSpecifierWithCapabilityKey:0x26D93D0A8 id:*MEMORY[0x263F60350]];
    [v3 addObject:v20];

    v21 = [(STContentPrivacyListController *)self tccSpecifierWithCapabilityKey:0x26D93D108 id:*MEMORY[0x263F60368]];
    [v3 addObject:v21];

    v22 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:0x26D93CEA8 key:0x26D93CFC8];
    [v3 addObject:v22];

    v23 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"system.web.tracking" key:@"forceLimitAdTracking"];
    [v3 addObject:v23];

    uint64_t v24 = objc_opt_class();
    id v25 = [v3 lastObject];
    [v25 setDetailControllerClass:v24];

    v26 = [v3 lastObject];
    [v26 setObject:@"USER_TRACKING" forKeyedSubscript:*MEMORY[0x263F60138]];

    [(STContentPrivacyListController *)self tccSpecifierWithCapabilityKey:0x26D93D088 id:*MEMORY[0x263F60348]];
  }
  else
  {
    [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"system.icloud" key:@"allowFindMyFriendsModification"];
  v27 = };
  [v3 addObject:v27];

  uint64_t v28 = (void *)[v3 copy];

  return v28;
}

- (id)_allowChangesSpecifiers
{
  uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:6];
  uint64_t v4 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  uint64_t v5 = +[STScreenTimeSettingsUIBundle bundle];
  BOOL v6 = [v5 localizedStringForKey:@"AADC_AllowChangesLabel" value:&stru_26D9391A8 table:v4];
  int v7 = [(STContentPrivacyListController *)self radioGroupSpecifierWithName:v6 footerText:0 item:0];
  [v3 addObject:v7];

  objc_super v8 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"passcode.settings" key:@"allowPasscodeModification"];
  [v3 addObject:v8];

  uint64_t v9 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"account.settings" key:@"allowAccountModification"];
  [v3 addObject:v9];

  id v10 = [v5 localizedStringForKey:@"AccountChangesFooterText" value:&stru_26D9391A8 table:v4];
  id v11 = [v3 lastObject];
  [v11 setObject:v10 forKeyedSubscript:*MEMORY[0x263F60280]];

  uint64_t v12 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:0x26D93CE68 key:0x26D93CF48];
  [v3 addObject:v12];

  uint64_t v13 = [(STPINListViewController *)self coordinator];
  unsigned int v14 = [v13 contentPrivacyCoordinator];
  v15 = [v14 viewModel];
  int v16 = [v15 isLocalDevice];

  if (v16)
  {
    BOOL v17 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:0x26D93CEA8 key:0x26D93D008];
    [v3 addObject:v17];
  }
  if (_os_feature_enabled_impl())
  {
    id v18 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"system.music" key:@"allowSpeakerVolumeLimitModification"];
    [v3 addObject:v18];
  }
  uint64_t v19 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"system.donotdisturb" key:@"allowDriverDoNotDisturbModifications"];
  [v3 addObject:v19];

  v20 = [v5 localizedStringForKey:@"AADC_DrivingFocusSpecifierTitle" value:&stru_26D9391A8 table:v4];
  v21 = [v3 lastObject];
  uint64_t v22 = *MEMORY[0x263F60048];
  [v21 setObject:v20 forKeyedSubscript:*MEMORY[0x263F60048]];

  v23 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"system.tvprovider" key:@"allowTVProviderModification"];
  [v3 addObject:v23];

  uint64_t v24 = [v5 localizedStringForKey:@"AADC_TVProviderSpecifierTitle" value:&stru_26D9391A8 table:v4];
  id v25 = [v3 lastObject];
  [v25 setObject:v24 forKeyedSubscript:v22];

  v26 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:@"application.settings" key:@"allowAutomaticAppUpdatesModification"];
  [v3 addObject:v26];

  v27 = [v5 localizedStringForKey:@"AADC_BackgroundAppActivitiesSpecifierTitle" value:&stru_26D9391A8 table:v4];
  uint64_t v28 = [v3 lastObject];
  [v28 setObject:v27 forKeyedSubscript:v22];

  v29 = (void *)[v3 copy];

  return v29;
}

- (void)_viewProfilesAndDeviceManagement:(id)a3
{
  id v3 = objc_alloc(NSURL);
  id v5 = (id)[v3 initWithString:*MEMORY[0x263F53E48]];
  uint64_t v4 = [MEMORY[0x263F01880] defaultWorkspace];
  [v4 openSensitiveURL:v5 withOptions:0];
}

- (void)showiTunesPurchasesRestrictions:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_opt_new();
  id v5 = [(STPINListViewController *)self coordinator];
  [v7 setCoordinator:v5];

  [v7 setContentPrivacyController:self];
  [v7 setParentController:self];
  BOOL v6 = [(STContentPrivacyListController *)self rootController];
  [v7 setRootController:v6];

  [v7 setSpecifier:v4];
  [(STContentPrivacyListController *)self showController:v7 animate:1];
}

- (void)showAllowedAppsRestrictions:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_opt_new();
  id v5 = [(STPINListViewController *)self coordinator];
  [v7 setCoordinator:v5];

  [v7 setParentController:self];
  BOOL v6 = [(STContentPrivacyListController *)self rootController];
  [v7 setRootController:v6];

  [v7 setSpecifier:v4];
  [(STContentPrivacyListController *)self showController:v7 animate:1];
}

- (void)showMediaRestrictions:(id)a3
{
  id v4 = a3;
  id v5 = [(STContentPrivacyListController *)self contentRestrictionsSpecifier];
  objc_msgSend(v5, "st_startSpinner");

  BOOL v6 = [(STContentPrivacyListController *)self isEligibleForAppDistribution];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__STContentPrivacyListController_showMediaRestrictions___block_invoke;
  v8[3] = &unk_264767808;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  +[STRegionRatings loadRegionRatingsWithUnrated:v6 completionHandler:v8];
}

void __56__STContentPrivacyListController_showMediaRestrictions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 contentRestrictionsSpecifier];
  objc_msgSend(v5, "st_stopSpinner");

  objc_super v8 = [[STContentPrivacyMediaRestrictionsDetailController alloc] initWithRegionRatings:v4];
  BOOL v6 = [*(id *)(a1 + 32) coordinator];
  [(STContentPrivacyMediaRestrictionsDetailController *)v8 setCoordinator:v6];

  [(STContentPrivacyMediaRestrictionsDetailController *)v8 setParentController:*(void *)(a1 + 32)];
  id v7 = [*(id *)(a1 + 32) rootController];
  [(STContentPrivacyMediaRestrictionsDetailController *)v8 setRootController:v7];

  [(STContentPrivacyMediaRestrictionsDetailController *)v8 setSpecifier:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) showController:v8 animate:1];
}

- (void)showSiriAndIntelligenceRestrictions:(id)a3
{
  id v4 = a3;
  id v5 = [STContentPrivacySiriAndIntelligenceRestrictionsDetailController alloc];
  BOOL v6 = [(STPINListViewController *)self coordinator];
  objc_super v8 = [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)v5 initWithRootViewModelCoordinator:v6];

  [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)v8 setParentController:self];
  id v7 = [(STContentPrivacyListController *)self rootController];
  [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)v8 setRootController:v7];

  [(STContentPrivacySiriAndIntelligenceRestrictionsDetailController *)v8 setSpecifier:v4];
  [(STContentPrivacyListController *)self showController:v8 animate:1];
}

- (id)_topLevelSpecifierWithAction:(SEL)a3 name:(id)a4
{
  BOOL v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:a4 target:self set:0 get:0 detail:0 cell:2 edit:0];
  id v7 = [(STPINListViewController *)self coordinator];
  objc_super v8 = [v7 contentPrivacyCoordinator];
  id v9 = [v8 viewModel];

  if (![v9 restrictionsEnabled] || (objc_msgSend(v9, "shouldAllowEditing") & 1) == 0) {
    [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
  }
  [v6 setControllerLoadAction:a3];

  return v6;
}

- (id)getRestrictionsEnabled:(id)a3
{
  id v3 = NSNumber;
  id v4 = [(STPINListViewController *)self coordinator];
  id v5 = [v4 contentPrivacyCoordinator];
  BOOL v6 = [v5 viewModel];
  id v7 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v6, "restrictionsEnabled"));

  return v7;
}

- (void)setRestrictionsEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(STPINListViewController *)self coordinator];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke;
  aBlock[3] = &unk_2647671B0;
  aBlock[4] = self;
  id v9 = _Block_copy(aBlock);
  if ([v8 isPasscodeEnabled]
    && ([v8 hasAlreadyEnteredPINForSession] & 1) == 0)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_301;
    v11[3] = &unk_264767830;
    id v12 = v8;
    id v13 = v6;
    unsigned int v14 = self;
    id v15 = v9;
    [(STPINListViewController *)self showPINSheet:v7 completion:v11];

    id v10 = v12;
  }
  else
  {
    id v10 = [v8 contentPrivacyCoordinator];
    objc_msgSend(v10, "saveContentPrivacyEnabled:completionHandler:", objc_msgSend(v6, "BOOLValue"), v9);
  }
}

void __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    id v5 = +[STUILog persistence];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_cold_2();
    }
LABEL_4:

    goto LABEL_10;
  }
  if (!_os_feature_enabled_impl())
  {
    id v4 = 0;
    goto LABEL_10;
  }
  id v6 = [MEMORY[0x263F67088] sharedController];
  id v7 = [MEMORY[0x263F67088] sharedController];
  objc_super v8 = [v7 viewContext];
  id v10 = 0;
  char v9 = [v6 saveContext:v8 error:&v10];
  id v4 = v10;

  if ((v9 & 1) == 0)
  {
    id v5 = +[STUILog communicationSafety];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_cold_1();
    }
    goto LABEL_4;
  }
LABEL_10:
  [*(id *)(a1 + 32) performSelectorOnMainThread:sel_reloadSpecifiers withObject:0 waitUntilDone:0];
}

void __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_301(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) contentPrivacyCoordinator];
    objc_msgSend(v4, "saveContentPrivacyEnabled:completionHandler:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"), *(void *)(a1 + 56));
  }
  else
  {
    id v3 = *(void **)(a1 + 48);
    id v4 = [v3 enableRestrictionsSwitchSpecifier];
    objc_msgSend(v3, "reloadSpecifier:animated:");
  }
}

- (id)getItemSpecifierValue:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:0x26D93CEC8];
  id v5 = [(STPINListViewController *)self coordinator];
  id v6 = [v5 contentPrivacyCoordinator];
  id v7 = [v6 viewModel];

  objc_super v8 = [v7 valuesByRestriction];
  char v9 = [v8 objectForKeyedSubscript:v4];

  id v10 = [v7 defaultValueForRestriction:v4];
  id v11 = v10;
  if (v9) {
    id v10 = v9;
  }
  id v12 = v10;

  return v12;
}

- (void)setItemSpecifierValueForUIOnly:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v11 = [a4 objectForKeyedSubscript:0x26D93CEC8];
  id v7 = [(STPINListViewController *)self coordinator];
  objc_super v8 = [v7 contentPrivacyCoordinator];
  char v9 = [v8 viewModel];

  id v10 = [v9 valuesByRestriction];
  [v10 setObject:v6 forKeyedSubscript:v11];
}

- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v6 objectForKeyedSubscript:0x26D93CEC8];
  char v9 = [(STPINListViewController *)self coordinator];
  id v10 = [v9 contentPrivacyCoordinator];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __66__STContentPrivacyListController_setItemSpecifierValue_specifier___block_invoke;
  v20[3] = &unk_264767858;
  id v11 = v8;
  id v21 = v11;
  uint64_t v22 = self;
  id v12 = v6;
  id v23 = v12;
  [v10 saveRestrictionValue:v7 forItem:v11 completionHandler:v20];

  if (_os_feature_enabled_impl())
  {
    id v13 = [MEMORY[0x263F67088] sharedController];
    unsigned int v14 = [MEMORY[0x263F67088] sharedController];
    id v15 = [v14 viewContext];
    id v19 = 0;
    char v16 = [v13 saveContext:v15 error:&v19];
    id v17 = v19;

    if ((v16 & 1) == 0)
    {
      id v18 = +[STUILog communicationSafety];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_cold_1();
      }
    }
  }
}

void __66__STContentPrivacyListController_setItemSpecifierValue_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[STUILog persistence];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __66__STContentPrivacyListController_setItemSpecifierValue_specifier___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
  [*(id *)(a1 + 40) performSelectorOnMainThread:sel_reloadSpecifier_ withObject:*(void *)(a1 + 48) waitUntilDone:0];
}

- (id)defaultRadioItemSpecifierWithGroup:(id)a3 name:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:a4 target:self set:0 get:0 detail:0 cell:3 edit:0];
  id v11 = [v8 objectForKeyedSubscript:0x26D93CEC8];
  objc_msgSend(v10, "setEditPaneClass:", +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
  id v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  [v10 setObject:v13 forKeyedSubscript:*MEMORY[0x263F60228]];

  [v10 setObject:&unk_26D966EE0 forKeyedSubscript:*MEMORY[0x263F60320]];
  [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
  unsigned int v14 = [(STPINListViewController *)self coordinator];
  [v10 setObject:v14 forKeyedSubscript:0x26D940528];

  [v10 setObject:v11 forKeyedSubscript:0x26D93CEC8];
  [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x263F60308]];
  id v15 = [(STPINListViewController *)self coordinator];
  char v16 = [v15 contentPrivacyCoordinator];
  id v17 = [v16 viewModel];

  if (![v17 restrictionsEnabled] || (objc_msgSend(v17, "shouldAllowEditing") & 1) == 0) {
    [v10 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
  }
  id v18 = [(STContentPrivacyListController *)self getItemSpecifierValue:v10];
  if ([v9 isEqualToNumber:v18]) {
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F60200]];
  }

  return v10;
}

- (id)defaultLinkListSpecifierWithItem:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  id v7 = +[STScreenTimeSettingsUIBundle bundle];
  id v8 = [v5 uiLabel];
  id v9 = [v7 localizedStringForKey:v8 value:&stru_26D9391A8 table:v6];

  id v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v9 target:self set:sel_setItemSpecifierValue_specifier_ get:sel_getItemSpecifierValue_ detail:objc_opt_class() cell:2 edit:0];
  id v11 = [(STPINListViewController *)self coordinator];
  [v10 setObject:v11 forKeyedSubscript:0x26D940528];

  uint64_t v12 = [v5 restrictionType];
  if (v12 == 1)
  {
    id v18 = [v7 localizedStringForKey:@"AllowLabel" value:&stru_26D9391A8 table:v6];
    id v19 = [v7 localizedStringForKey:@"DontAllowLabel" value:&stru_26D9391A8 table:v6];
    v25[0] = v18;
    v25[1] = v19;
    char v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];

    id v17 = &unk_26D967618;
  }
  else
  {
    uint64_t v13 = v12;
    if (v12)
    {
      v20 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STContentPrivacyListController.m", 747, @"Unimplemented type %d", v13);

      char v16 = 0;
      id v17 = 0;
    }
    else
    {
      unsigned int v14 = [v7 localizedStringForKey:@"AllowLabel" value:&stru_26D9391A8 table:v6];
      id v15 = [v7 localizedStringForKey:@"DontAllowLabel" value:&stru_26D9391A8 table:v6];
      v26[0] = v14;
      v26[1] = v15;
      char v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];

      id v17 = &unk_26D967600;
    }
  }
  [v10 setObject:v5 forKeyedSubscript:0x26D93CEC8];
  [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  [v10 setValues:v17 titles:v16];
  id v21 = [(STPINListViewController *)self coordinator];
  uint64_t v22 = [v21 contentPrivacyCoordinator];
  id v23 = [v22 viewModel];

  if (![v23 restrictionsEnabled] || (objc_msgSend(v23, "shouldAllowEditing") & 1) == 0) {
    [v10 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
  }

  return v10;
}

- (id)defaultLinkListSpecifierWithConfiguration:(id)a3 key:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STPINListViewController *)self coordinator];
  id v9 = [v8 contentPrivacyCoordinator];
  id v10 = [v9 viewModel];
  id v11 = [v10 visibleRestrictionWithConfiguration:v7 key:v6];

  uint64_t v12 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithItem:v11];

  return v12;
}

- (id)tccSpecifierWithCapabilityKey:(id)a3 id:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STContentPrivacyListController *)self defaultLinkListSpecifierWithConfiguration:0x26D93CEA8 key:v6];
  if (([v6 isEqualToString:0x26D93D0C8] & 1) == 0
    && ([v6 isEqualToString:0x26D93D068] & 1) == 0
    && [v6 isEqualToString:0x26D93D028])
  {
    _os_feature_enabled_impl();
  }
  [v8 setDetailControllerClass:objc_opt_class()];
  [v8 setObject:v6 forKeyedSubscript:@"capability"];
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x263F60138]];

  return v8;
}

- (id)radioGroupSpecifierWithName:(id)a3 footerText:(id)a4 item:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x263F5FC40] groupSpecifierWithName:a3];
  [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60168]];
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x263F600F8]];
  }
  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:0x26D93CEC8];
  }

  return v9;
}

- (void)dealloc
{
  id v3 = [(STPINListViewController *)self coordinator];
  [v3 removeObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.isLoaded" context:@"KVOContextContentPrivacyListController"];

  v4.receiver = self;
  v4.super_class = (Class)STContentPrivacyListController;
  [(STListViewController *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(STPINListViewController *)self coordinator];
  id v6 = v5;
  if (v5 == v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)STContentPrivacyListController;
    [(STPINListViewController *)&v7 setCoordinator:v4];
  }
  else
  {
    [v5 removeObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.isLoaded" context:@"KVOContextContentPrivacyListController"];
    v7.receiver = self;
    v7.super_class = (Class)STContentPrivacyListController;
    [(STPINListViewController *)&v7 setCoordinator:v4];
    [v4 addObserver:self forKeyPath:@"contentPrivacyCoordinator.viewModel.isLoaded" options:1 context:@"KVOContextContentPrivacyListController"];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == @"KVOContextContentPrivacyListController")
  {
    id v12 = a3;
    [(STPINListViewController *)self coordinator];

    int v13 = [v12 isEqualToString:@"contentPrivacyCoordinator.viewModel.isLoaded"];
    if (v13)
    {
      unsigned int v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      id v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        unsigned int v14 = 0;
      }
      -[STContentPrivacyListController _isLoadedDidChange:](self, "_isLoadedDidChange:", [v14 BOOLValue]);
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STContentPrivacyListController;
    id v11 = a3;
    [(STListViewController *)&v16 observeValueForKeyPath:v11 ofObject:a4 change:v10 context:a6];
  }
}

- (void)_isLoadedDidChange:(BOOL)a3
{
  if (a3)
  {
    [(STContentPrivacyListController *)self reloadSpecifiers];
    id v5 = [(STContentPrivacyListController *)self specifierIDPendingPush];
    id v4 = -[STContentPrivacyListController specifierForID:](self, "specifierForID:");
    if (v4)
    {
      if ([(STPINListViewController *)self shouldShowPINSheetForSpecifier:v4])
      {
        [(STContentPrivacyListController *)self setSpecifierIDPendingPush:0];
        [(STPINListViewController *)self showPINSheet:v4];
      }
      else
      {
        [(STContentPrivacyListController *)self handlePendingURL];
      }
    }
  }
}

- (PSSpecifier)enableRestrictionsSwitchSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setEnableRestrictionsSwitchSpecifier:(id)a3
{
}

- (PSSpecifier)contentRestrictionsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setContentRestrictionsSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRestrictionsSpecifier, 0);

  objc_storeStrong((id *)&self->_enableRestrictionsSwitchSpecifier, 0);
}

void __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "Failed to save Communication Safety settings: %{public}@", v2, v3, v4, v5, v6);
}

void __67__STContentPrivacyListController_setRestrictionsEnabled_specifier___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "Failure enabling restrictions: %{public}@", v2, v3, v4, v5, v6);
}

void __66__STContentPrivacyListController_setItemSpecifierValue_specifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_225B06000, log, OS_LOG_TYPE_FAULT, "Failure saving restriction %@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end