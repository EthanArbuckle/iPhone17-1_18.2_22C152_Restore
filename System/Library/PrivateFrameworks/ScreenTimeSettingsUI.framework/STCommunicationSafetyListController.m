@interface STCommunicationSafetyListController
- (BOOL)_hasAcknowledgedIntroScreens;
- (BOOL)_isAnyCommunicationSafetySettingEnabled;
- (BOOL)_isCommunicationSafetyAnalyticsEnabled;
- (PSSpecifier)checkSpecifier;
- (PSSpecifier)enableAnalyticsSpecifier;
- (STCommunicationSafetyListController)init;
- (STCommunicationSafetyOnboardingController)onboardingController;
- (id)_checkForUnsafePhotos:(id)a3;
- (id)_createCheckForUnsafePhotosSpecifier;
- (id)_createEnableAnalyticsGroupSpecifier;
- (id)_createEnableAnalyticsSpecifier;
- (id)_createUnsafePhotosGroupSpecifier;
- (id)_createViewChildSafetyResourcesGroupSpecifier;
- (id)_createViewChildSafetyResourcesSpecifier;
- (id)_getEnableAnalytics:(id)a3;
- (id)specifiers;
- (void)_acknowledgeAnalyticsTip;
- (void)_acknowledgeIntroScreens;
- (void)_disableAnalyticsIfNeeded;
- (void)_dismissChildSafetyResourcesView:(id)a3;
- (void)_openAboutAnalytics;
- (void)_openChildSafetyWebsite;
- (void)_persistSettings;
- (void)_setCheckForUnsafePhotos:(BOOL)a3;
- (void)_setCheckForUnsafePhotos:(id)a3 specifier:(id)a4;
- (void)_setEnableAnalytics:(BOOL)a3;
- (void)_setEnableAnalytics:(id)a3 specifier:(id)a4;
- (void)_showChildSafetyResources;
- (void)_showCommunicationSafetyCompatibilityAlertIfNeeded;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCheckSpecifier:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setEnableAnalyticsSpecifier:(id)a3;
- (void)setOnboardingController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STCommunicationSafetyListController

- (STCommunicationSafetyListController)init
{
  v6.receiver = self;
  v6.super_class = (Class)STCommunicationSafetyListController;
  v2 = [(STPINListViewController *)&v6 init];
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  v4 = [v3 localizedStringForKey:@"CommunicationSafetyTitle" value:&stru_26D9391A8 table:0];
  [(STCommunicationSafetyListController *)v2 setTitle:v4];

  return v2;
}

- (void)dealloc
{
  [(STCommunicationSafetyListController *)self setCoordinator:0];
  v3.receiver = self;
  v3.super_class = (Class)STCommunicationSafetyListController;
  [(STListViewController *)&v3 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)STCommunicationSafetyListController;
  [(STPINListViewController *)&v16 viewDidAppear:a3];
  v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.ScreenTime/COMMUNICATION_SAFETY"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  objc_super v6 = [MEMORY[0x263EFF960] currentLocale];
  v7 = +[STScreenTimeSettingsUIBundle bundle];
  v8 = [v7 bundleURL];
  v9 = (void *)[v5 initWithKey:@"CommunicationSafetyTitle" table:@"Localizable" locale:v6 bundleURL:v8];

  id v10 = objc_alloc(MEMORY[0x263F08DB0]);
  v11 = [MEMORY[0x263EFF960] currentLocale];
  v12 = +[STScreenTimeSettingsUIBundle bundle];
  v13 = [v12 bundleURL];
  v14 = (void *)[v10 initWithKey:@"ScreenTimeControllerTitle" table:@"Localizable" locale:v11 bundleURL:v13];

  v17[0] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(STCommunicationSafetyListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.screen-time" title:v9 localizedNavigationComponents:v15 deepLink:v4];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(STPINListViewController *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted" context:"STCommunicationSafetyListControllerObservationContext"];
  [v5 removeObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted" context:"STCommunicationSafetyListControllerObservationContext"];
  [v5 removeObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled" context:"STCommunicationSafetyListControllerObservationContext"];
  v6.receiver = self;
  v6.super_class = (Class)STCommunicationSafetyListController;
  [(STPINListViewController *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetySendingRestricted" options:3 context:"STCommunicationSafetyListControllerObservationContext"];
  [v4 addObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyReceivingRestricted" options:3 context:"STCommunicationSafetyListControllerObservationContext"];
  [v4 addObserver:self forKeyPath:@"communicationSafetyCoordinator.viewModel.isCommunicationSafetyAnalyticsEnabled" options:3 context:"STCommunicationSafetyListControllerObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == "STCommunicationSafetyListControllerObservationContext")
  {
    uint64_t v11 = *MEMORY[0x263F081C8];
    id v12 = a5;
    id v14 = [v12 objectForKeyedSubscript:v11];
    v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];

    LODWORD(v12) = [v14 BOOLValue];
    if (v12 != [v13 BOOLValue])
    {
      [(STCommunicationSafetyListController *)self _disableAnalyticsIfNeeded];
      [(STCommunicationSafetyListController *)self reloadSpecifiers];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STCommunicationSafetyListController;
    id v10 = a5;
    [(STListViewController *)&v15 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_opt_new();
    objc_super v6 = [(STCommunicationSafetyListController *)self _createUnsafePhotosGroupSpecifier];
    [v5 addObject:v6];

    v7 = [(STCommunicationSafetyListController *)self _createCheckForUnsafePhotosSpecifier];
    [(STCommunicationSafetyListController *)self setCheckSpecifier:v7];

    v8 = [(STCommunicationSafetyListController *)self checkSpecifier];
    [v5 addObject:v8];

    v9 = [(STCommunicationSafetyListController *)self _createViewChildSafetyResourcesGroupSpecifier];
    [v5 addObject:v9];

    id v10 = [(STCommunicationSafetyListController *)self _createViewChildSafetyResourcesSpecifier];
    [v5 addObject:v10];

    uint64_t v11 = [(STCommunicationSafetyListController *)self _createEnableAnalyticsGroupSpecifier];
    [v5 addObject:v11];

    id v12 = [(STCommunicationSafetyListController *)self _createEnableAnalyticsSpecifier];
    [(STCommunicationSafetyListController *)self setEnableAnalyticsSpecifier:v12];

    v13 = [(STCommunicationSafetyListController *)self enableAnalyticsSpecifier];
    [v5 addObject:v13];

    [(STCommunicationSafetyListController *)self _disableAnalyticsIfNeeded];
    id v14 = (objc_class *)[v5 copy];
    objc_super v15 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = v14;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)_createUnsafePhotosGroupSpecifier
{
  uint64_t v3 = +[STScreenTimeSettingsUIBundle bundle];
  id v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = [v3 localizedStringForKey:@"CommunicationSafetyEnableFeatureGroupSpecifierTitle" value:&stru_26D9391A8 table:0];
  objc_super v6 = [v4 groupSpecifierWithName:v5];

  v7 = [v3 localizedStringForKey:@"CommunicationSafetyEnableFeatureGroupSpecifierFooter" value:&stru_26D9391A8 table:0];
  v8 = +[STScreenTimeSettingsUIBundle bundle];
  v9 = [v8 localizedStringForKey:@"CommunicationSafetyLearnMoreFooterLink" value:&stru_26D9391A8 table:0];

  id v10 = objc_msgSend(NSString, "stringWithFormat:", v7, v9);
  [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x263F600F8]];
  uint64_t v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x263F600C0]];

  v18.location = [v10 rangeOfString:v9];
  v13 = NSStringFromRange(v18);
  [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x263F600D0]];

  id v14 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v6 setObject:v14 forKeyedSubscript:*MEMORY[0x263F600E0]];

  objc_super v15 = NSStringFromSelector(sel__openChildSafetyWebsite);
  [v6 setObject:v15 forKeyedSubscript:*MEMORY[0x263F600C8]];

  return v6;
}

- (void)_openChildSafetyWebsite
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  v2 = [NSURL URLWithString:@"https://support.apple.com/kb/HT212850"];
  [v3 openURL:v2 withOptions:0];
}

- (id)_createCheckForUnsafePhotosSpecifier
{
  id v3 = +[STScreenTimeSettingsUIBundle bundle];
  id v4 = [v3 localizedStringForKey:@"CommunicationSafetyEnableFeatureSpecifierTitle" value:&stru_26D9391A8 table:0];

  id v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v4 target:self set:sel__setCheckForUnsafePhotos_specifier_ get:sel__checkForUnsafePhotos_ detail:0 cell:6 edit:objc_opt_class()];
  [(STPINListViewController *)self setUpPasscodeAndLineWrapBehaviorForSpecifier:v5];
  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940328];

  return v5;
}

- (id)_createEnableAnalyticsSpecifier
{
  id v3 = +[STScreenTimeSettingsUIBundle bundle];
  id v4 = [v3 localizedStringForKey:@"CommunicationSafetyEnableAnalyticsSpecifierTitle" value:&stru_26D9391A8 table:0];

  id v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v4 target:self set:sel__setEnableAnalytics_specifier_ get:sel__getEnableAnalytics_ detail:0 cell:6 edit:objc_opt_class()];
  [(STPINListViewController *)self setUpPasscodeAndLineWrapBehaviorForSpecifier:v5];
  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940328];

  return v5;
}

- (id)_createEnableAnalyticsGroupSpecifier
{
  id v3 = +[STScreenTimeSettingsUIBundle bundle];
  id v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = [v3 localizedStringForKey:@"CommunicationSafetyAnalyticsGroupSpecifierTitle" value:&stru_26D9391A8 table:0];
  objc_super v6 = [v4 groupSpecifierWithName:v5];

  v7 = [v3 localizedStringForKey:@"CommunicationSafetyAnalyticsGroupSpecifierFooter" value:&stru_26D9391A8 table:0];
  v8 = [MEMORY[0x263F5B8F0] linkWithBundleIdentifier:@"com.apple.onboarding.improveCommSafety"];
  v9 = v8;
  if (v8)
  {
    id v10 = [v8 flow];
    uint64_t v11 = [v10 localizedButtonTitle];

    id v12 = objc_msgSend(NSString, "stringWithFormat:", v7, v11);
    [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x263F600F8]];
    v20.location = [v12 rangeOfString:v11];
    v13 = NSStringFromRange(v20);
    [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x263F600D0]];

    id v14 = (objc_class *)objc_opt_class();
    objc_super v15 = NSStringFromClass(v14);
    [v6 setObject:v15 forKeyedSubscript:*MEMORY[0x263F600C0]];

    objc_super v16 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
    [v6 setObject:v16 forKeyedSubscript:*MEMORY[0x263F600E0]];

    v17 = NSStringFromSelector(sel__openAboutAnalytics);
    [v6 setObject:v17 forKeyedSubscript:*MEMORY[0x263F600C8]];
  }
  else
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", v7, &stru_26D9391A8);
    [v6 setObject:v11 forKeyedSubscript:*MEMORY[0x263F600F8]];
  }

  return v6;
}

- (void)_openAboutAnalytics
{
  id v3 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.improveCommSafety"];
  if (v3)
  {
    id v4 = v3;
    [v3 setPresentingViewController:self];
    [v4 present];
    id v3 = v4;
  }
}

- (id)_createViewChildSafetyResourcesGroupSpecifier
{
  v2 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  id v3 = +[STScreenTimeSettingsUIBundle bundle];
  id v4 = [v3 localizedStringForKey:@"CommunicationSafetyViewResourcesGroupSpecifierFooter" value:&stru_26D9391A8 table:0];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x263F600F8]];

  return v2;
}

- (void)_disableAnalyticsIfNeeded
{
  id v3 = [(STPINListViewController *)self coordinator];
  id v4 = [v3 communicationSafetyCoordinator];
  id v7 = [v4 viewModel];

  if ([v7 isCommunicationSafetySendingRestricted]
    && ([v7 isCommunicationSafetyReceivingRestricted] & 1) != 0)
  {
    id v5 = [(STCommunicationSafetyListController *)self enableAnalyticsSpecifier];
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
  }
  else
  {
    objc_super v6 = [(STCommunicationSafetyListController *)self enableAnalyticsSpecifier];
    [v6 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];

    [v7 setIsCommunicationSafetyAnalyticsEnabled:0];
  }
}

- (id)_createViewChildSafetyResourcesSpecifier
{
  id v3 = +[STScreenTimeSettingsUIBundle bundle];
  id v4 = [v3 localizedStringForKey:@"CommunicationSafetyViewResourcesSpecifierTitle" value:&stru_26D9391A8 table:0];

  id v5 = [(STPINListViewController *)self coordinator];
  objc_super v6 = [v5 viewModel];
  id v7 = [v6 me];
  if ([v7 isRemoteUser])
  {
    v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
  }
  else
  {
    v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:13 edit:objc_opt_class()];
    [(STPINListViewController *)self setUpPasscodeAndLineWrapBehaviorForSpecifier:v8];
  }
  [v8 setButtonAction:sel__showChildSafetyResources];

  return v8;
}

- (void)_showChildSafetyResources
{
  v39[4] = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  id v4 = [MEMORY[0x263F1FA68] nonPersistentDataStore];
  v38 = v3;
  [v3 setWebsiteDataStore:v4];

  id v5 = [[STActivityIndicatingWebView alloc] initWithConfiguration:v3];
  id v6 = objc_alloc(MEMORY[0x263F08BD8]);
  id v7 = [(id)objc_opt_class() resourcesURL];
  v37 = (void *)[v6 initWithURL:v7];

  id v8 = (id)[(STActivityIndicatingWebView *)v5 loadRequest:v37];
  v9 = objc_opt_new();
  id v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel__dismissChildSafetyResourcesView_];
  uint64_t v11 = [v9 navigationItem];
  [v11 setRightBarButtonItem:v10];

  [v9 setEdgesForExtendedLayout:0];
  [(STActivityIndicatingWebView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = [v9 view];
  [v12 addSubview:v5];

  v27 = (void *)MEMORY[0x263F08938];
  v34 = [(STActivityIndicatingWebView *)v5 leadingAnchor];
  v35 = [v9 view];
  v33 = [v35 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v39[0] = v32;
  v30 = [(STActivityIndicatingWebView *)v5 topAnchor];
  v31 = [v9 view];
  v28 = [v31 topAnchor];
  v26 = [v30 constraintEqualToAnchor:v28];
  v39[1] = v26;
  v29 = v5;
  v13 = [(STActivityIndicatingWebView *)v5 trailingAnchor];
  id v14 = [v9 view];
  objc_super v15 = [v14 trailingAnchor];
  objc_super v16 = [v13 constraintEqualToAnchor:v15];
  v39[2] = v16;
  v17 = [(STActivityIndicatingWebView *)v5 bottomAnchor];
  NSRange v18 = [v9 view];
  v19 = [v18 bottomAnchor];
  NSRange v20 = [v17 constraintEqualToAnchor:v19];
  v39[3] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];
  [v27 activateConstraints:v21];

  v22 = [v9 view];
  [(STActivityIndicatingWebView *)v29 hostActivityIndicatorInView:v22];

  v23 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v9];
  [v23 setModalPresentationStyle:2];
  v24 = objc_opt_new();
  [v24 configureWithOpaqueBackground];
  v25 = [v23 navigationBar];
  [v25 setScrollEdgeAppearance:v24];

  [(STCommunicationSafetyListController *)self presentViewController:v23 animated:1 completion:0];
}

- (void)_dismissChildSafetyResourcesView:(id)a3
{
}

- (void)_setCheckForUnsafePhotos:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 BOOLValue];
  id v8 = [(STPINListViewController *)self coordinator];
  v9 = [v8 viewModel];
  id v10 = [v9 me];
  if (![v10 hasPasscode])
  {

    goto LABEL_5;
  }
  char v11 = [v8 hasAlreadyEnteredPINForSession];

  if (v11)
  {
LABEL_5:
    [(STCommunicationSafetyListController *)self _setCheckForUnsafePhotos:v7];
    goto LABEL_6;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__STCommunicationSafetyListController__setCheckForUnsafePhotos_specifier___block_invoke;
  v12[3] = &unk_2647674C0;
  v12[4] = self;
  char v14 = v7;
  id v13 = v6;
  [(STPINListViewController *)self showPINSheet:v13 completion:v12];

LABEL_6:
}

uint64_t __74__STCommunicationSafetyListController__setCheckForUnsafePhotos_specifier___block_invoke(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 _setCheckForUnsafePhotos:*(unsigned __int8 *)(a1 + 48)];
  }
  else {
    return [v3 reloadSpecifier:*(void *)(a1 + 40) animated:1];
  }
}

- (void)_setCheckForUnsafePhotos:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[STUILog communicationSafety];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[STCommunicationSafetyListController _setCheckForUnsafePhotos:](v3, v5);
  }

  id v6 = [(STPINListViewController *)self coordinator];
  uint64_t v7 = [v6 communicationSafetyCoordinator];
  id v8 = [v7 viewModel];

  [v8 setIsCommunicationSafetySendingRestricted:v3];
  [v8 setIsCommunicationSafetyReceivingRestricted:v3];
  if (v3)
  {
    [(STCommunicationSafetyListController *)self _disableAnalyticsIfNeeded];
    [(STCommunicationSafetyListController *)self _persistSettings];
    [(STCommunicationSafetyListController *)self _showCommunicationSafetyCompatibilityAlertIfNeeded];
  }
  else
  {
    [v8 setIsCommunicationSafetyNotificationEnabled:0];
    [(STCommunicationSafetyListController *)self _disableAnalyticsIfNeeded];
    [(STCommunicationSafetyListController *)self _persistSettings];
  }
  v9 = [(STCommunicationSafetyListController *)self enableAnalyticsSpecifier];
  [(STCommunicationSafetyListController *)self reloadSpecifier:v9 animated:1];
}

- (id)_checkForUnsafePhotos:(id)a3
{
  BOOL v3 = NSNumber;
  id v4 = [(STPINListViewController *)self coordinator];
  id v5 = [v4 communicationSafetyCoordinator];
  id v6 = [v5 viewModel];
  uint64_t v7 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v6, "isCommunicationSafetySendingRestricted"));

  id v8 = +[STUILog communicationSafety];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[STCommunicationSafetyListController _checkForUnsafePhotos:]();
  }

  return v7;
}

- (void)_setEnableAnalytics:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 BOOLValue];
  id v8 = [(STPINListViewController *)self coordinator];
  v9 = [v8 viewModel];
  id v10 = [v9 me];
  if (![v10 hasPasscode])
  {

    goto LABEL_5;
  }
  char v11 = [v8 hasAlreadyEnteredPINForSession];

  if (v11)
  {
LABEL_5:
    [(STCommunicationSafetyListController *)self _setEnableAnalytics:v7];
    goto LABEL_6;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__STCommunicationSafetyListController__setEnableAnalytics_specifier___block_invoke;
  v12[3] = &unk_2647674C0;
  v12[4] = self;
  char v14 = v7;
  id v13 = v6;
  [(STPINListViewController *)self showPINSheet:v13 completion:v12];

LABEL_6:
}

uint64_t __69__STCommunicationSafetyListController__setEnableAnalytics_specifier___block_invoke(uint64_t a1, int a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 _setEnableAnalytics:*(unsigned __int8 *)(a1 + 48)];
  }
  else {
    return [v3 reloadSpecifier:*(void *)(a1 + 40) animated:1];
  }
}

- (void)_setEnableAnalytics:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[STUILog communicationSafety];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[STCommunicationSafetyListController _setEnableAnalytics:](v3, v5);
  }

  id v6 = [(STPINListViewController *)self coordinator];
  uint64_t v7 = [v6 communicationSafetyCoordinator];
  id v8 = [v7 viewModel];

  [v8 setIsCommunicationSafetyAnalyticsEnabled:v3];
  [(STCommunicationSafetyListController *)self _persistSettings];
  if (v3) {
    [(STCommunicationSafetyListController *)self _acknowledgeAnalyticsTip];
  }
}

- (id)_getEnableAnalytics:(id)a3
{
  BOOL v3 = NSNumber;
  id v4 = [(STPINListViewController *)self coordinator];
  id v5 = [v4 communicationSafetyCoordinator];
  id v6 = [v5 viewModel];
  uint64_t v7 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v6, "isCommunicationSafetyAnalyticsEnabled"));

  id v8 = +[STUILog communicationSafety];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[STCommunicationSafetyListController _getEnableAnalytics:]();
  }

  return v7;
}

- (void)_persistSettings
{
  id v3 = [(STPINListViewController *)self coordinator];
  v2 = [v3 communicationSafetyCoordinator];
  [v2 persistCommunicationSafetySettingsWithCompletionHandler:&__block_literal_global_5];
}

void __55__STCommunicationSafetyListController__persistSettings__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = +[STUILog communicationSafety];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__STCommunicationSafetyListController__persistSettings__block_invoke_cold_2();
    }
  }
  else
  {
    if (!_os_feature_enabled_impl()) {
      goto LABEL_5;
    }
    id v4 = [MEMORY[0x263F67088] sharedController];
    id v5 = [MEMORY[0x263F67088] sharedController];
    id v6 = [v5 viewContext];
    id v9 = 0;
    char v7 = [v4 saveContext:v6 error:&v9];
    id v3 = v9;

    if ((v7 & 1) == 0)
    {
      id v8 = +[STUILog communicationSafety];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __55__STCommunicationSafetyListController__persistSettings__block_invoke_cold_1();
      }
    }
  }

LABEL_5:
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)STCommunicationSafetyListController;
  [(STCommunicationSafetyListController *)&v15 viewWillAppear:a3];
  if ([(STCommunicationSafetyListController *)self _isAnyCommunicationSafetySettingEnabled])
  {
    [(STCommunicationSafetyListController *)self _acknowledgeIntroScreens];
  }
  if (![(STCommunicationSafetyListController *)self _hasAcknowledgedIntroScreens])
  {
    id v4 = [STCommunicationSafetyOnboardingController alloc];
    id v5 = [(STPINListViewController *)self coordinator];
    id v6 = [(STCommunicationSafetyOnboardingController *)v4 initWithCoordinator:v5];
    [(STCommunicationSafetyListController *)self setOnboardingController:v6];

    objc_initWeak(location, self);
    char v7 = [(STCommunicationSafetyListController *)self onboardingController];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __54__STCommunicationSafetyListController_viewWillAppear___block_invoke;
    char v11 = &unk_2647676F0;
    objc_copyWeak(&v13, location);
    id v12 = self;
    [v7 presentOverViewController:self skipFeatureEnablement:0 completionBlock:&v8];

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
  if ([(STCommunicationSafetyListController *)self _isCommunicationSafetyAnalyticsEnabled])
  {
    [(STCommunicationSafetyListController *)self _acknowledgeAnalyticsTip];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STCommunicationSafetyListController.viewWillAppear", (uint8_t *)location, 2u);
  }
}

void __54__STCommunicationSafetyListController_viewWillAppear___block_invoke(uint64_t a1, int a2, int a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v13 = WeakRetained;
    if (a2 || ([WeakRetained _acknowledgeIntroScreens], !a3))
    {
      char v11 = [*(id *)(a1 + 32) navigationController];
      id v12 = (id)[v11 popViewControllerAnimated:1];
    }
    else
    {
      [v13 _acknowledgeAnalyticsTip];
      uint64_t v9 = [v13 coordinator];
      id v10 = [v9 communicationSafetyCoordinator];
      char v11 = [v10 viewModel];

      [v11 setIsCommunicationSafetySendingRestricted:1];
      [v11 setIsCommunicationSafetyReceivingRestricted:1];
      [v11 setIsCommunicationSafetyAnalyticsEnabled:a4];
      [v13 _persistSettings];
    }

    id WeakRetained = v13;
  }
}

- (BOOL)_isAnyCommunicationSafetySettingEnabled
{
  id v2 = [(STPINListViewController *)self coordinator];
  id v3 = [v2 communicationSafetyCoordinator];
  id v4 = [v3 viewModel];

  if (([v4 isCommunicationSafetySendingRestricted] & 1) != 0
    || ([v4 isCommunicationSafetyReceivingRestricted] & 1) != 0
    || ([v4 isCommunicationSafetyNotificationEnabled] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isCommunicationSafetyAnalyticsEnabled];
  }

  return v5;
}

- (BOOL)_hasAcknowledgedIntroScreens
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"ScreenTimeCommunicationSafetyIntroAcknowledged"];

  return v3;
}

- (void)_acknowledgeIntroScreens
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 setBool:1 forKey:@"ScreenTimeCommunicationSafetyIntroAcknowledged"];
}

- (BOOL)_isCommunicationSafetyAnalyticsEnabled
{
  id v2 = [(STPINListViewController *)self coordinator];
  char v3 = [v2 communicationSafetyCoordinator];
  id v4 = [v3 viewModel];

  LOBYTE(v2) = [v4 isCommunicationSafetyAnalyticsEnabled];
  return (char)v2;
}

- (void)_showCommunicationSafetyCompatibilityAlertIfNeeded
{
  char v3 = [(STPINListViewController *)self coordinator];
  id v4 = [v3 viewModel];
  char v5 = [v4 me];
  if ([v4 shouldShowCompatibilityAlerts])
  {
    id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v7 = [v6 objectForKey:@"HasShownCommunicationSafetyCompatibilityAlertByDSID"];

    uint64_t v8 = [v5 dsid];
    uint64_t v9 = [v8 stringValue];
    id v10 = [v7 objectForKeyedSubscript:v9];
    char v11 = [v10 BOOLValue];

    if ((v11 & 1) == 0)
    {
      id v12 = +[STScreenTimeSettingsUIBundle bundle];
      if ([v5 isRemoteUser])
      {
        id v13 = [v5 givenName];
        if (v13)
        {
          v23 = [v12 localizedStringForKey:@"UpdateChildDevicesAlertTitleFormat" value:&stru_26D9391A8 table:0];
          char v14 = [MEMORY[0x263EFF960] currentLocale];
          objc_super v15 = objc_msgSend([NSString alloc], "initWithFormat:locale:", v23, v14, v13);
          objc_super v16 = [v12 localizedStringForKey:@"CommunicationSafetyChildCompatibilityAlertMessageFormat" value:&stru_26D9391A8 table:0];
          v17 = objc_msgSend([NSString alloc], "initWithFormat:locale:", v16, v14, v13);

LABEL_9:
          NSRange v20 = [MEMORY[0x263F82418] alertControllerWithTitle:v15 message:v17 preferredStyle:1];
          v21 = [v12 localizedStringForKey:@"ConfirmationButtonOK" value:&stru_26D9391A8 table:0];
          v22 = [MEMORY[0x263F82400] actionWithTitle:v21 style:0 handler:0];
          [v20 addAction:v22];
          [v20 setPreferredAction:v22];
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __89__STCommunicationSafetyListController__showCommunicationSafetyCompatibilityAlertIfNeeded__block_invoke;
          v24[3] = &unk_264766F30;
          id v25 = v5;
          [(STCommunicationSafetyListController *)self presentViewController:v20 animated:1 completion:v24];

          goto LABEL_10;
        }
        objc_super v15 = [v12 localizedStringForKey:@"UpdateChildDevicesAlertTitle" value:&stru_26D9391A8 table:0];
        v19 = @"CommunicationSafetyChildCompatibilityAlertMessage";
        NSRange v18 = v12;
      }
      else
      {
        objc_super v15 = [v12 localizedStringForKey:@"UpdateOtherDevicesAlertTitle" value:&stru_26D9391A8 table:0];
        id v13 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"CommunicationSafetyCompatibilityAlertMessage"];
        NSRange v18 = v12;
        v19 = v13;
      }
      v17 = [v18 localizedStringForKey:v19 value:&stru_26D9391A8 table:0];
      goto LABEL_9;
    }
  }
LABEL_10:
}

void __89__STCommunicationSafetyListController__showCommunicationSafetyCompatibilityAlertIfNeeded__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 objectForKey:@"HasShownCommunicationSafetyCompatibilityAlertByDSID"];
  id v4 = [*(id *)(a1 + 32) dsid];
  char v5 = [v4 stringValue];

  if (v3)
  {
    id v6 = (void *)[v3 mutableCopy];
    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v5];
  }
  else
  {
    char v7 = v5;
    v8[0] = MEMORY[0x263EFFA88];
    id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  [v2 setObject:v6 forKey:@"HasShownCommunicationSafetyCompatibilityAlertByDSID"];
}

- (void)_acknowledgeAnalyticsTip
{
  id v2 = [(STPINListViewController *)self coordinator];
  id v6 = [v2 viewModel];

  char v3 = [v6 me];
  id v4 = [v3 dsid];
  char v5 = [v4 stringValue];

  +[STCommunicationSafetyAnalyticsTipCell acknowledgeTipViewForDSID:v5];
}

- (PSSpecifier)checkSpecifier
{
  return self->_checkSpecifier;
}

- (void)setCheckSpecifier:(id)a3
{
}

- (PSSpecifier)enableAnalyticsSpecifier
{
  return self->_enableAnalyticsSpecifier;
}

- (void)setEnableAnalyticsSpecifier:(id)a3
{
}

- (STCommunicationSafetyOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)setOnboardingController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_enableAnalyticsSpecifier, 0);

  objc_storeStrong((id *)&self->_checkSpecifier, 0);
}

- (void)_setCheckForUnsafePhotos:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  char v3 = [NSNumber numberWithBool:a1 & 1];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_225B06000, a2, v4, "Setting 'communication safety sending restricted' and 'communication safety receiving restricted' flags on viewmodel: %@", v5);
}

- (void)_checkForUnsafePhotos:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_225B06000, v0, v1, "Fetching 'communication safety sending restricted' flag from viewmodel: %@", v2);
}

- (void)_setEnableAnalytics:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSNumber numberWithBool:a1 & 1];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_225B06000, a2, v4, "Setting Improve Communication Safety on viewmodel: %@", v5);
}

- (void)_getEnableAnalytics:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_225B06000, v0, v1, "Fetching Improve Communication Safety Analytics state: %@", v2);
}

void __55__STCommunicationSafetyListController__persistSettings__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225B06000, v0, OS_LOG_TYPE_ERROR, "Error saving managed object contet: %@", v1, 0xCu);
}

void __55__STCommunicationSafetyListController__persistSettings__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225B06000, v0, OS_LOG_TYPE_ERROR, "Could not save Communication Safety settings: %{public}@", v1, 0xCu);
}

@end