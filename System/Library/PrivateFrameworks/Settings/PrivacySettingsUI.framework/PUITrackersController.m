@interface PUITrackersController
- (ADTrackingTransparency)adTrackingTransparency;
- (BOOL)canChangeAllowAsk;
- (BOOL)shouldReloadSpecifiersOnResume;
- (NSArray)appSpecifiers;
- (PUITrackersController)init;
- (id)allowAsk:(id)a3;
- (id)specifiers;
- (void)disableTCCForAllApps;
- (void)headerLinkWasTapped;
- (void)provideNavigationDonations;
- (void)setAdTrackingTransparency:(id)a3;
- (void)setAllowAsk:(id)a3 specifier:(id)a4;
- (void)setAppSpecifiers:(id)a3;
- (void)specifiers;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUITrackersController

- (PUITrackersController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PUITrackersController;
  v2 = [(PUITCCAccessController *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(PUITrackersController *)v2 setAdTrackingTransparency:v3];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUITrackersController;
  [(PUITCCAccessController *)&v4 viewDidAppear:a3];
  [(PUITrackersController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = (void *)[v5 initWithKey:@"TRACKERS" table:@"Privacy" locale:v6 bundleURL:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F292B8]);
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  v10 = (void *)[v8 initWithKey:@"PRIVACY" table:@"Privacy" locale:v9 bundleURL:v4];

  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/USER_TRACKING"];
  [(PUITrackersController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.app-tracking-transparency" title:v7 localizedNavigationComponents:v11 deepLink:v12];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  v3 = objc_opt_new();
  objc_super v4 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  id v5 = *v4;
  if (!*v4)
  {
    BOOL v6 = [(PUITrackersController *)self canChangeAllowAsk];
    v7 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"HEADER_GROUP"];
    uint64_t v8 = PUI_LocalizedStringForPrivacy(@"APP_TRACKING_HEADER_TEXT");
    v9 = PUI_LocalizedStringForPrivacy(@"APP_TRACKING_LINK_TEXT");
    v29 = (void *)v8;
    v10 = [NSString stringWithFormat:@"%@ %@", v8, v9];
    if (!v6)
    {
      v11 = [(PUITrackersController *)self adTrackingTransparency];
      uint64_t v12 = [v11 crossAppTrackingAllowedSwitchDisabledReason];

      switch(v12)
      {
        case 1:
        case 2:
          v13 = @"APP_TRACKING_DISABLED_REASON_AGE";
          goto LABEL_12;
        case 3:
          v13 = @"APP_TRACKING_DISABLED_REASON_EDU_MODE";
          goto LABEL_12;
        case 4:
          v13 = @"APP_TRACKING_DISABLED_REASON_EDU_ACCOUNT";
          goto LABEL_12;
        case 5:
          v13 = @"APP_TRACKING_DISABLED_REASON_MISSING_AGE";
          goto LABEL_12;
        case 6:
          v13 = @"APP_TRACKING_DISABLED_REASON_PROFILE";
LABEL_12:
          v14 = PUI_LocalizedStringForPrivacy(v13);
          break;
        default:
          v14 = PUI_LocalizedStringForPrivacy(@"APP_TRACKING_DISABLED");
          v28 = _PUILoggingFacility();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            [(PUITrackersController *)v12 specifiers];
          }

          break;
      }
      uint64_t v15 = [NSString stringWithFormat:@"%@\n\n%@", v10, v14];

      v10 = (void *)v15;
    }
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    [v7 setProperty:v17 forKey:*MEMORY[0x1E4F93140]];

    [v7 setProperty:v10 forKey:*MEMORY[0x1E4F93160]];
    v31.location = [v10 rangeOfString:v9];
    v18 = NSStringFromRange(v31);
    [v7 setProperty:v18 forKey:*MEMORY[0x1E4F93150]];

    v19 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v7 setProperty:v19 forKey:*MEMORY[0x1E4F93158]];

    [v7 setProperty:@"headerLinkWasTapped" forKey:*MEMORY[0x1E4F93148]];
    [v3 addObject:v7];
    v20 = (void *)MEMORY[0x1E4F92E70];
    v21 = PUI_LocalizedStringForPrivacy(@"ALLOW_ASK");
    v22 = [v20 preferenceSpecifierNamed:v21 target:self set:sel_setAllowAsk_specifier_ get:sel_allowAsk_ detail:0 cell:6 edit:0];

    [v22 setIdentifier:@"ALLOW_ASK"];
    [v22 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93068]];
    v23 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
    [v22 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F93130]];

    [v3 addObject:v22];
    v30.receiver = self;
    v30.super_class = (Class)PUITrackersController;
    v24 = [(PUITCCAccessController *)&v30 specifiers];
    [(PUITrackersController *)self setAppSpecifiers:v24];

    v25 = [(PUITrackersController *)self appSpecifiers];
    [v3 addObjectsFromArray:v25];

    objc_storeStrong(v4, v3);
    id v5 = *v4;
  }
  id v26 = v5;

  return v26;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUITrackersController;
  [(PUITCCAccessController *)&v3 viewWillAppear:a3];
  [MEMORY[0x1E4F9AA08] trackingViewVisited];
}

- (void)headerLinkWasTapped
{
  id v3 = (id)objc_opt_new();
  [(PUITrackersController *)self presentViewController:v3 animated:1 completion:0];
}

- (BOOL)canChangeAllowAsk
{
  v2 = [(PUITrackersController *)self adTrackingTransparency];
  char v3 = [v2 crossAppTrackingAllowedSwitchEnabled];

  return v3;
}

- (void)setAllowAsk:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue])
  {
    [MEMORY[0x1E4F9AA08] trackingStateOfRequest:1 askAppsToStopTracking:0];
    id v5 = [(PUITrackersController *)self adTrackingTransparency];
    [v5 setCrossAppTrackingAllowed:1];
  }
  else
  {
    BOOL v6 = (void *)TCCAccessCopyBundleIdentifiersForService();
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4FB1418];
      v9 = PUI_LocalizedStringForPrivacy(@"DISABLE_ALLOW_ASK_MESSAGE");
      v10 = [MEMORY[0x1E4FB16C8] currentDevice];
      v11 = objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", 0, v9, objc_msgSend(v10, "sf_isiPad"));

      uint64_t v12 = (void *)MEMORY[0x1E4FB1410];
      v13 = PUI_LocalizedStringForPrivacy(@"DISABLE_ALLOW_ASK_CANCEL");
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __47__PUITrackersController_setAllowAsk_specifier___block_invoke;
      v25[3] = &unk_1E6E9D610;
      v25[4] = self;
      v14 = [v12 actionWithTitle:v13 style:1 handler:v25];
      [v11 addAction:v14];

      uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
      v16 = PUI_LocalizedStringForPrivacy(@"DISABLE_ALLOW_ASK_LEAVE_APPS_ON");
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __47__PUITrackersController_setAllowAsk_specifier___block_invoke_2;
      v24[3] = &unk_1E6E9D610;
      v24[4] = self;
      v17 = [v15 actionWithTitle:v16 style:0 handler:v24];
      [v11 addAction:v17];

      v18 = (void *)MEMORY[0x1E4FB1410];
      v19 = PUI_LocalizedStringForPrivacy(@"DISABLE_ALLOW_ASK_TURN_OFF_APPS");
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __47__PUITrackersController_setAllowAsk_specifier___block_invoke_3;
      v23[3] = &unk_1E6E9D610;
      v23[4] = self;
      v20 = [v18 actionWithTitle:v19 style:0 handler:v23];
      [v11 addAction:v20];

      [(PUITrackersController *)self presentViewController:v11 animated:1 completion:0];
      return;
    }
    [MEMORY[0x1E4F9AA08] trackingStateOfRequest:0 askAppsToStopTracking:0];
    v21 = [(PUITrackersController *)self adTrackingTransparency];
    [v21 setCrossAppTrackingAllowed:0];

    PUIResetIDFAIfNeeded();
  }
  id v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v22 postNotificationName:@"com.apple.PrivacySettingsUI.TrackingStateChanged" object:0];
}

uint64_t __47__PUITrackersController_setAllowAsk_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"ALLOW_ASK"];
}

void __47__PUITrackersController_setAllowAsk_specifier___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) adTrackingTransparency];
  [v1 setCrossAppTrackingAllowed:0];

  [MEMORY[0x1E4F9AA08] trackingStateOfRequest:0 askAppsToStopTracking:0];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"com.apple.PrivacySettingsUI.TrackingStateChanged" object:0];
}

void __47__PUITrackersController_setAllowAsk_specifier___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) disableTCCForAllApps];
  id v2 = [*(id *)(a1 + 32) adTrackingTransparency];
  [v2 setCrossAppTrackingAllowed:0];

  [MEMORY[0x1E4F9AA08] trackingStateOfRequest:0 askAppsToStopTracking:1];
  [*(id *)(a1 + 32) reloadSpecifiers];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"com.apple.PrivacySettingsUI.TrackingStateChanged" object:0];
}

- (void)disableTCCForAllApps
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = (void *)TCCAccessCopyBundleIdentifiersForService();
  objc_super v4 = [v2 setWithArray:v3];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        TCCAccessSetForBundleId();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  PUIResetIDFAIfNeeded();
}

- (id)allowAsk:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  objc_super v4 = [(PUITrackersController *)self adTrackingTransparency];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "crossAppTrackingAllowed"));

  return v5;
}

- (ADTrackingTransparency)adTrackingTransparency
{
  return self->_adTrackingTransparency;
}

- (void)setAdTrackingTransparency:(id)a3
{
}

- (NSArray)appSpecifiers
{
  return self->_appSpecifiers;
}

- (void)setAppSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_adTrackingTransparency, 0);
}

- (void)specifiers
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[PUITrackersController specifiers]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1E4AD5000, a2, OS_LOG_TYPE_ERROR, "%s: Unexpected crossAppTrackingAllowedSwitchDisabledReason code: %ld", (uint8_t *)&v2, 0x16u);
}

@end