@interface PUIDataAndSensorsController
+ (BOOL)shouldShowDataAndSensors;
- (id)specifiers;
- (void)appSpecifierWasTapped:(id)a3;
- (void)provideNavigationDonations;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PUIDataAndSensorsController

+ (BOOL)shouldShowDataAndSensors
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  if (objc_msgSend(v2, "sf_isChinaRegionCellularDevice"))
  {
    v3 = PUIAllApplicationsSupportingDisclosureReview();
    BOOL v4 = [v3 count] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIDataAndSensorsController;
  [(PUIDataAndSensorsController *)&v4 viewDidAppear:a3];
  [(PUIDataAndSensorsController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = (void *)[v5 initWithKey:@"DATA_AND_SENSORS" table:@"Privacy" locale:v6 bundleURL:v4];

  v10[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/DATA_AND_SENSORS"];
  [(PUIDataAndSensorsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.privacy" title:v7 localizedNavigationComponents:v8 deepLink:v9];
}

- (id)specifiers
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (!v3)
  {
    uint64_t v20 = (int)*MEMORY[0x1E4F92F08];
    v26 = self;
    v25 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    objc_super v4 = PUIAllApplicationsSupportingDisclosureReview();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v29;
      uint64_t v24 = *MEMORY[0x1E4F93130];
      uint64_t v22 = *MEMORY[0x1E4F931C0];
      uint64_t v23 = *MEMORY[0x1E4F931D0];
      uint64_t v21 = *MEMORY[0x1E4F93250];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v27 = 0;
          v10 = [v9 findApplicationRecordWithError:&v27];
          id v11 = v27;
          if (v11)
          {
            v12 = _PUILoggingFacility();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v33 = "-[PUIDataAndSensorsController specifiers]";
              __int16 v34 = 2112;
              v35 = v9;
              _os_log_error_impl(&dword_1E4AD5000, v12, OS_LOG_TYPE_ERROR, "%s: error fetching app record for app identity: %@", buf, 0x16u);
            }
          }
          else
          {
            v13 = (void *)MEMORY[0x1E4F92E70];
            v14 = [v10 localizedName];
            v12 = [v13 preferenceSpecifierNamed:v14 target:v26 set:0 get:0 detail:0 cell:2 edit:0];

            [v12 setButtonAction:sel_appSpecifierWasTapped_];
            uint64_t v15 = MEMORY[0x1E4F1CC38];
            [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v24];
            [v12 setObject:v15 forKeyedSubscript:v23];
            v16 = [v10 bundleIdentifier];
            [v12 setObject:v16 forKeyedSubscript:v22];

            [v12 setObject:v9 forKeyedSubscript:v21];
            [v25 addObject:v12];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v6);
    }

    [v25 sortUsingComparator:&__block_literal_global_7];
    uint64_t v17 = [v25 copy];
    v18 = *(Class *)((char *)&v26->super.super.super.super.super.isa + v20);
    *(Class *)((char *)&v26->super.super.super.super.super.isa + v20) = (Class)v17;

    v3 = *(Class *)((char *)&v26->super.super.super.super.super.isa + v20);
  }
  return v3;
}

uint64_t __41__PUIDataAndSensorsController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)appSpecifierWasTapped:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F93250]];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v6 = (void (*)(id))getPDUDisclosureReviewViewControllerForApplicationSymbolLoc_ptr;
  v14 = getPDUDisclosureReviewViewControllerForApplicationSymbolLoc_ptr;
  if (!getPDUDisclosureReviewViewControllerForApplicationSymbolLoc_ptr)
  {
    uint64_t v7 = (void *)PrivacyDisclosureUILibrary();
    v12[3] = (uint64_t)dlsym(v7, "PDUDisclosureReviewViewControllerForApplication");
    getPDUDisclosureReviewViewControllerForApplicationSymbolLoc_ptr = (_UNKNOWN *)v12[3];
    uint64_t v6 = (void (*)(id))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v6)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    v10 = v9;
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v10);
  }
  v8 = v6(v5);

  [(PUIDataAndSensorsController *)self showController:v8];
}

@end