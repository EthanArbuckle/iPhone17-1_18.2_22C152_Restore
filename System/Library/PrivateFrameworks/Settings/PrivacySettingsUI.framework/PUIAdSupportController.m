@interface PUIAdSupportController
- (ADTrackingTransparency)adTrackingTransparency;
- (BOOL)personalizedAdsAvailable;
- (BOOL)personalizedAdsConsented;
- (UserTransparencyViewController)userTransparencyController;
- (id)personalizedAdsEnabled:(id)a3;
- (id)personalizedAdsSwitchEnabled;
- (id)specifiers;
- (void)provideNavigationDonations;
- (void)setAdTrackingTransparency:(id)a3;
- (void)setPersonalizedAdsEnabled:(id)a3 specifier:(id)a4;
- (void)setUserTransparencyController:(id)a3;
- (void)userDidTapAdPreferences:(id)a3;
- (void)userDidTapDoneButton:(id)a3;
- (void)userDidTapLearnMoreLink:(id)a3;
- (void)userTransparencyViewController:(id)a3 didFailWithError:(id)a4;
- (void)userTransparencyViewControllerDidDismiss:(id)a3;
- (void)userTransparencyViewControllerDidLoad:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PUIAdSupportController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(PUIAdSupportController *)self adTrackingTransparency];

    if (!v5)
    {
      v6 = objc_opt_new();
      [(PUIAdSupportController *)self setAdTrackingTransparency:v6];
    }
    v7 = objc_opt_new();
    if ([(PUIAdSupportController *)self personalizedAdsAvailable])
    {
      v8 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"AD_PRIVACY_HEADER"];
      v9 = PUI_LocalizedStringForAdSupport(@"AD_PRIVACY_FOOTER_LINK");
      v10 = NSString;
      v11 = PUI_LocalizedStringForAdSupport(@"AD_PRIVACY_FOOTER");
      v44 = objc_msgSend(v10, "stringWithFormat:", v11, v9);

      v12 = NSString;
      v13 = PUI_LocalizedStringForAdSupport(@"APPLE_DELIVERED_ADVERTISING");
      [v13 localizedUppercaseString];
      v14 = uint64_t v45 = v3;
      v15 = [v12 stringWithFormat:@"%@\n\n%@", v14, v44];

      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      [v8 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F93140]];

      [v8 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F93160]];
      v47.location = [v15 rangeOfString:v9];
      v18 = NSStringFromRange(v47);
      [v8 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F93150]];

      v19 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
      [v8 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F93158]];

      [v8 setObject:@"userDidTapLearnMoreLink:" forKeyedSubscript:*MEMORY[0x1E4F93148]];
      [v7 addObject:v8];
      v20 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"VIEW_AD_TARGETING_INFORMATION_GROUP"];
      v21 = PUI_LocalizedStringForAdSupport(@"VIEW_AD_TARGETING_INFORMATION_FOOTER");
      [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F93170]];

      [v7 addObject:v20];
      v22 = (void *)MEMORY[0x1E4F92E70];
      v23 = PUI_LocalizedStringForAdSupport(@"VIEW_AD_TARGETING_INFORMATION");
      v24 = [v22 preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v24 setIdentifier:@"VIEW_AD_TARGETING_INFORMATION"];
      [v24 setButtonAction:sel_userDidTapAdPreferences_];
      [v24 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93068]];
      [v7 addObject:v24];

      uint64_t v3 = v45;
    }
    v25 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"PERSONALIZED_ADS_GROUP"];
    v26 = [(PUIAdSupportController *)self adTrackingTransparency];
    int v27 = [v26 shouldShowPersonalizedAdsToggle];

    if ([(PUIAdSupportController *)self personalizedAdsAvailable])
    {
      if (!v27)
      {
        v41 = PUI_LocalizedStringForAdSupport(@"PERSONALIZED_ADS_NO_CONSENT");
        [v25 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F93170]];

        [v7 addObject:v25];
        goto LABEL_12;
      }
      v28 = PUI_LocalizedStringForAdSupport(@"PERSONALIZED_ADS_FOOTER");
      [v25 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F93170]];

      [v7 addObject:v25];
    }
    else
    {
      v29 = PUI_LocalizedStringForAdSupport(@"PERSONALIZED_ADS_UNAVAILABLE_LINK");
      v30 = NSString;
      v31 = PUI_LocalizedStringForAdSupport(@"PERSONALIZED_ADS_UNAVAILABLE_FOOTER");
      v32 = objc_msgSend(v30, "stringWithFormat:", v31, v29);

      v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      [v25 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F93140]];

      [v25 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F93160]];
      v48.location = [v32 rangeOfString:v29];
      v35 = NSStringFromRange(v48);
      [v25 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F93150]];

      v36 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
      [v25 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F93158]];

      [v25 setObject:@"userDidTapLearnMoreLink:" forKeyedSubscript:*MEMORY[0x1E4F93148]];
      [v7 addObject:v25];
      if (!v27)
      {
LABEL_12:
        v42 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
        *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v7;

        v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
        goto LABEL_13;
      }
    }
    v37 = (void *)MEMORY[0x1E4F92E70];
    v38 = PUI_LocalizedStringForAdSupport(@"PERSONALIZED_ADS");
    v39 = [v37 preferenceSpecifierNamed:v38 target:self set:sel_setPersonalizedAdsEnabled_specifier_ get:sel_personalizedAdsEnabled_ detail:0 cell:6 edit:0];

    [v39 setIdentifier:@"PERSONALIZED_ADS"];
    v40 = [(PUIAdSupportController *)self personalizedAdsSwitchEnabled];
    [v39 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F93130]];

    [v7 addObject:v39];
    goto LABEL_12;
  }
LABEL_13:
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = _PUILoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[PUIAdSupportController viewDidAppear:]";
    _os_log_impl(&dword_1E4AD5000, v4, OS_LOG_TYPE_DEFAULT, "%s: started querying ad support state.", buf, 0xCu);
  }

  v5 = [(PUIAdSupportController *)self adTrackingTransparency];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__PUIAdSupportController_viewDidAppear___block_invoke;
  v11[3] = &unk_1E6E9D358;
  v11[4] = self;
  [v5 personalizedAdsAvailable:v11];

  v6 = _PUILoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[PUIAdSupportController viewDidAppear:]";
    _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "%s: checking if we have a PA consent related change.", buf, 0xCu);
  }

  v7 = [(PUIAdSupportController *)self adTrackingTransparency];
  int v8 = [v7 shouldShowPersonalizedAdsToggle];

  if (v8 != [(PUIAdSupportController *)self personalizedAdsConsented])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PUIAdSupportController_viewDidAppear___block_invoke_63;
    block[3] = &unk_1E6E9D330;
    char v10 = v8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  [(PUIAdSupportController *)self provideNavigationDonations];
}

void __40__PUIAdSupportController_viewDidAppear___block_invoke(uint64_t a1, int a2)
{
  char v2 = a2;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) personalizedAdsAvailable] != a2)
  {
    v4 = _PUILoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
      *(_DWORD *)buf = 136315394;
      v9 = "-[PUIAdSupportController viewDidAppear:]_block_invoke";
      __int16 v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1E4AD5000, v4, OS_LOG_TYPE_DEFAULT, "%s: reloading: ad support state changed to: %@", buf, 0x16u);
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__PUIAdSupportController_viewDidAppear___block_invoke_59;
    v6[3] = &unk_1E6E9D330;
    char v7 = v2;
    v6[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __40__PUIAdSupportController_viewDidAppear___block_invoke_59(uint64_t a1)
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setBool:*(unsigned __int8 *)(a1 + 40) forKey:@"PUIPersonalizedAdsSupported"];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 reloadSpecifiers];
}

uint64_t __40__PUIAdSupportController_viewDidAppear___block_invoke_63(uint64_t a1)
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setBool:*(unsigned __int8 *)(a1 + 40) forKey:@"PUIPersonalizedAdsConsented"];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 reloadSpecifiers];
}

- (void)provideNavigationDonations
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  char v7 = (void *)[v5 initWithKey:@"ADVERTISING" table:@"Privacy" locale:v6 bundleURL:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F292B8]);
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  __int16 v10 = (void *)[v8 initWithKey:@"PRIVACY" table:@"Privacy" locale:v9 bundleURL:v4];

  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/ADVERTISING"];
  [(PUIAdSupportController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.apple-advertising" title:v7 localizedNavigationComponents:v11 deepLink:v12];
}

- (BOOL)personalizedAdsAvailable
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PUIPersonalizedAdsSupported"];

  return v3;
}

- (BOOL)personalizedAdsConsented
{
  char v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PUIPersonalizedAdsConsented"];

  return v3;
}

- (id)personalizedAdsSwitchEnabled
{
  char v3 = (void *)MEMORY[0x1E4F28ED0];
  v4 = [(PUIAdSupportController *)self adTrackingTransparency];
  if ([v4 personalizedAdsSwitchEnabled]) {
    BOOL v5 = [(PUIAdSupportController *)self personalizedAdsAvailable];
  }
  else {
    BOOL v5 = 0;
  }
  v6 = [v3 numberWithInt:v5];

  return v6;
}

- (id)personalizedAdsEnabled:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v5 = [(PUIAdSupportController *)self adTrackingTransparency];
  if ([v5 personalizedAds]) {
    BOOL v6 = [(PUIAdSupportController *)self personalizedAdsAvailable];
  }
  else {
    BOOL v6 = 0;
  }
  char v7 = [v4 numberWithInt:v6];

  return v7;
}

- (void)setPersonalizedAdsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [v5 BOOLValue];
  ADClientSetValueForScalarKey();
  uint64_t v6 = [v5 BOOLValue];

  id v7 = [(PUIAdSupportController *)self adTrackingTransparency];
  [v7 setPersonalizedAds:v6];
}

- (void)userDidTapDoneButton:(id)a3
{
}

- (void)userDidTapLearnMoreLink:(id)a3
{
  id v4 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.advertising"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (void)userDidTapAdPreferences:(id)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB0050]) initWithUserTransparencyDetails:0];
  [(PUIAdSupportController *)self setUserTransparencyController:v4];

  id v5 = [(PUIAdSupportController *)self userTransparencyController];
  [v5 setDelegate:self];
}

- (void)userTransparencyViewControllerDidLoad:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PUIAdSupportController_userTransparencyViewControllerDidLoad___block_invoke;
  v6[3] = &unk_1E6E9CBA0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __64__PUIAdSupportController_userTransparencyViewControllerDidLoad___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)userTransparencyViewControllerDidDismiss:(id)a3
{
}

- (void)userTransparencyViewController:(id)a3 didFailWithError:(id)a4
{
}

- (UserTransparencyViewController)userTransparencyController
{
  return self->_userTransparencyController;
}

- (void)setUserTransparencyController:(id)a3
{
}

- (ADTrackingTransparency)adTrackingTransparency
{
  return self->_adTrackingTransparency;
}

- (void)setAdTrackingTransparency:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adTrackingTransparency, 0);
  objc_storeStrong((id *)&self->_userTransparencyController, 0);
}

@end