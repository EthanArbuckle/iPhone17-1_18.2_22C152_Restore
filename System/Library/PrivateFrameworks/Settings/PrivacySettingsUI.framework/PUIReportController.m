@interface PUIReportController
+ (BOOL)isRecordActivityEnabled;
- (BOOL)appAccessHasData;
- (BOOL)eitherSourceHasData;
- (BOOL)hasData;
- (BOOL)isRecordActivityEnabled;
- (BOOL)reportEnabled;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSArray)appNetworkActivityHeader;
- (NSArray)appNetworkActivityRows;
- (NSArray)appNetworkActivityRowsAwaitingDisplay;
- (NSArray)domainNetworkActivityHeader;
- (NSArray)domainNetworkActivityRows;
- (NSArray)domainNetworkActivityRowsAwaitingDisplay;
- (NSArray)learnMoreHeader;
- (NSArray)sensorActivityHeader;
- (NSArray)sensorActivityRows;
- (NSArray)websiteNetworkActivityHeader;
- (NSArray)websiteNetworkActivityRows;
- (NSArray)websiteNetworkActivityRowsAwaitingDisplay;
- (PSSpecifier)saveAppActivitySpecifier;
- (PUIReportController)init;
- (PUIReportSensorManager)sensorManager;
- (PUITrackingReportManager)reportManager;
- (id)appNetworkActivityGroupSpecifiers;
- (id)dataAccessGroupSpecifiers;
- (id)dataAccessSpecifiers;
- (id)headerSpecifiers;
- (id)isRecordActivityEnabled:(id)a3;
- (id)mostContactedDomainsGroupSpecifiers;
- (id)saveAppActivityFooterText;
- (id)specifiers;
- (id)specifiersForAppPrivacyReport;
- (id)specifiersForRecordAppActivity;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)websiteNetworkActivityGroupSpecifiers;
- (unint64_t)controllerMode;
- (unint64_t)currentControllerMode;
- (void)dataDidChange;
- (void)dealloc;
- (void)didTapSave;
- (void)didTapTurnOffAppPrivacyReport;
- (void)didTapTurnOnAppPrivacyReport;
- (void)presentAboutController;
- (void)provideNavigationDonations;
- (void)reloadAppAccessHasDataWithCompletion:(id)a3;
- (void)reloadAppAndTrackingData;
- (void)reloadAppNetworkActivitySpecifiersWithCompletion:(id)a3;
- (void)reloadMostContactedDomainsSpecifiersWithCompletion:(id)a3;
- (void)reloadSensorAndNetworkSpecifiersAnimated:(BOOL)a3;
- (void)reloadWebsiteNetworkActivitySpecifiersWithCompletion:(id)a3;
- (void)setAppNetworkActivityHeader:(id)a3;
- (void)setAppNetworkActivityRows:(id)a3;
- (void)setAppNetworkActivityRowsAwaitingDisplay:(id)a3;
- (void)setCurrentControllerMode:(unint64_t)a3;
- (void)setDomainNetworkActivityHeader:(id)a3;
- (void)setDomainNetworkActivityRows:(id)a3;
- (void)setDomainNetworkActivityRowsAwaitingDisplay:(id)a3;
- (void)setHasData:(BOOL)a3;
- (void)setLearnMoreHeader:(id)a3;
- (void)setRecordActivityEnabled:(id)a3 specifier:(id)a4;
- (void)setReportEnabled:(BOOL)a3;
- (void)setReportManager:(id)a3;
- (void)setSaveAppActivitySpecifier:(id)a3;
- (void)setSensorActivityHeader:(id)a3;
- (void)setSensorActivityRows:(id)a3;
- (void)setSensorManager:(id)a3;
- (void)setWebsiteNetworkActivityHeader:(id)a3;
- (void)setWebsiteNetworkActivityRows:(id)a3;
- (void)setWebsiteNetworkActivityRowsAwaitingDisplay:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUIReportController

- (PUIReportController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PUIReportController;
  v2 = [(PUIReportController *)&v11 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(PUIReportController *)v2 setReportManager:v3];

    v4 = objc_opt_new();
    [(PUIReportController *)v2 setSensorManager:v4];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_didBecomeActive name:*MEMORY[0x1E4FB2628] object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel_dataDidChange name:@"PSUITrackingReportDataHasChanged" object:0];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel_dataDidChange name:@"PUIReportSensorManagerDataHasChangedNotification" object:0];

    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    PUIAnalyticsLogView(v9, 0, 0);
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUIReportController;
  [(PUIReportController *)&v4 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIReportController;
  [(PUIReportController *)&v4 viewDidAppear:a3];
  [(PUIReportController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = (void *)[v5 initWithKey:@"APP_PRIVACY_REPORT" table:@"Privacy" locale:v6 bundleURL:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F292B8]);
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  v10 = (void *)[v8 initWithKey:@"PRIVACY" table:@"Privacy" locale:v9 bundleURL:v4];

  v13[0] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/PRIVACY_REPORT"];
  [(PUIReportController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.app-privacy-report" title:v7 localizedNavigationComponents:v11 deepLink:v12];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    [(PUIReportController *)self setReportEnabled:[(PUIReportController *)self isRecordActivityEnabled]];
    [(PUIReportController *)self setHasData:[(PUIReportController *)self eitherSourceHasData]];
    if (_os_feature_enabled_impl()) {
      [(PUIReportController *)self specifiersForAppPrivacyReport];
    }
    else {
    id v5 = [(PUIReportController *)self specifiersForRecordAppActivity];
    }
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    [(PUIReportController *)self reloadAppAndTrackingData];
    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)specifiersForRecordAppActivity
{
  uint64_t v3 = objc_opt_new();
  objc_super v4 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"RECORD_APP_ACTIVITY_GROUP"];
  id v5 = PUI_LocalizedStringForTrackers(@"RECORD_APP_ACTIVITY_FOOTER");
  uint64_t v6 = *MEMORY[0x1E4F93170];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F93170]];

  [v3 addObject:v4];
  v7 = (void *)MEMORY[0x1E4F92E70];
  id v8 = PUI_LocalizedStringForTrackers(@"RECORD_APP_ACTIVITY");
  v9 = [v7 preferenceSpecifierNamed:v8 target:self set:sel_setRecordActivityEnabled_specifier_ get:sel_isRecordActivityEnabled_ detail:0 cell:6 edit:0];

  [v9 setIdentifier:@"RECORD_APP_ACTIVITY"];
  [v3 addObject:v9];
  if ([(PUIReportController *)self reportEnabled])
  {
    v10 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"SAVE_APP_ACTIVITY_GROUP"];
    objc_super v11 = [(PUIReportController *)self saveAppActivityFooterText];
    [v10 setObject:v11 forKeyedSubscript:v6];

    [v3 addObject:v10];
    v12 = (void *)MEMORY[0x1E4F92E70];
    v13 = PUI_LocalizedStringForTrackers(@"SAVE_APP_ACTIVITY");
    v14 = [v12 preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v14 setIdentifier:@"SAVE_APP_ACTIVITY"];
    [v14 setButtonAction:sel_didTapSave];
    v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[PUIReportController hasData](self, "hasData"));
    [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F93130]];

    [v14 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
    [(PUIReportController *)self setSaveAppActivitySpecifier:v14];
    [v3 addObject:v14];
  }
  return v3;
}

- (void)dataDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PUIReportController_dataDidChange__block_invoke;
  block[3] = &unk_1E6E9C758;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __36__PUIReportController_dataDidChange__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) reportEnabled];
  if (v2 == [*(id *)(a1 + 32) isRecordActivityEnabled]
    && (int v3 = [*(id *)(a1 + 32) hasData],
        v3 == [*(id *)(a1 + 32) eitherSourceHasData]))
  {
    if (_os_feature_enabled_impl())
    {
      id v5 = *(void **)(a1 + 32);
      [v5 reloadSensorAndNetworkSpecifiersAnimated:0];
    }
    else
    {
      uint64_t v6 = _PUILoggingFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        v10 = "-[PUIReportController dataDidChange]_block_invoke";
        _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "%s: only reloading time interval footer: state hasn't changed", (uint8_t *)&v9, 0xCu);
      }

      v7 = [*(id *)(a1 + 32) specifierForID:@"SAVE_APP_ACTIVITY_GROUP"];
      id v8 = [*(id *)(a1 + 32) saveAppActivityFooterText];
      [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F93170]];

      [*(id *)(a1 + 32) reloadSpecifier:v7];
    }
  }
  else
  {
    objc_super v4 = _PUILoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      v10 = "-[PUIReportController dataDidChange]_block_invoke";
      _os_log_impl(&dword_1E4AD5000, v4, OS_LOG_TYPE_DEFAULT, "%s: reloading: state changed", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 32) reloadSpecifiers];
  }
}

- (void)reloadSensorAndNetworkSpecifiersAnimated:(BOOL)a3
{
  if ([(PUIReportController *)self controllerMode] == 2)
  {
    objc_super v4 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PUIReportController_reloadSensorAndNetworkSpecifiersAnimated___block_invoke;
    block[3] = &unk_1E6E9C758;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

void __64__PUIReportController_reloadSensorAndNetworkSpecifiersAnimated___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) dataAccessSpecifiers];
  int v3 = [*(id *)(a1 + 32) appNetworkActivityRowsAwaitingDisplay];
  objc_super v4 = [*(id *)(a1 + 32) websiteNetworkActivityRowsAwaitingDisplay];
  id v5 = [*(id *)(a1 + 32) domainNetworkActivityRowsAwaitingDisplay];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PUIReportController_reloadSensorAndNetworkSpecifiersAnimated___block_invoke_2;
  block[3] = &unk_1E6E9DB88;
  block[4] = *(void *)(a1 + 32);
  id v11 = v2;
  id v12 = v3;
  id v13 = v4;
  id v14 = v5;
  id v6 = v5;
  id v7 = v4;
  id v8 = v3;
  id v9 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __64__PUIReportController_reloadSensorAndNetworkSpecifiersAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) learnMoreHeader];
  int v3 = [v2 lastObject];

  objc_super v4 = *(void **)(a1 + 32);
  id v5 = [v4 sensorActivityRows];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) sensorActivityHeader];
  id v8 = objc_msgSend(v4, "pui_replaceRows:withRows:header:insertPoint:", v5, v6, v7, v3);

  [*(id *)(a1 + 32) setSensorActivityRows:*(void *)(a1 + 40)];
  id v9 = *(void **)(a1 + 32);
  v10 = [v9 appNetworkActivityRows];
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = [*(id *)(a1 + 32) appNetworkActivityHeader];
  id v13 = objc_msgSend(v9, "pui_replaceRows:withRows:header:insertPoint:", v10, v11, v12, v8);

  [*(id *)(a1 + 32) setAppNetworkActivityRows:*(void *)(a1 + 48)];
  id v14 = *(void **)(a1 + 32);
  v15 = [v14 websiteNetworkActivityRows];
  uint64_t v16 = *(void *)(a1 + 56);
  v17 = [*(id *)(a1 + 32) websiteNetworkActivityHeader];
  v18 = objc_msgSend(v14, "pui_replaceRows:withRows:header:insertPoint:", v15, v16, v17, v13);

  [*(id *)(a1 + 32) setWebsiteNetworkActivityRows:*(void *)(a1 + 56)];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v19 = [*(id *)(a1 + 32) websiteNetworkActivityRows];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v53;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v53 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = [*(id *)(*((void *)&v52 + 1) + 8 * i) objectForKeyedSubscript:@"PUITrackerBarShowAppAttributedBadgeKey"];
        char v25 = [v24 BOOLValue];

        if (v25)
        {
          int v26 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
  int v26 = 0;
LABEL_11:

  v27 = [*(id *)(a1 + 32) websiteNetworkActivityHeader];
  v28 = [v27 firstObject];

  v29 = PUI_LocalizedStringForAppReport(@"WEBSITE_NETWORK_ACTIVITY_FOOTER");
  if (v26)
  {
    v30 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:*(void *)(a1 + 32)];
    [v28 setObject:v30 forKeyedSubscript:@"PUIAttributedStringTextViewDelegateKey"];

    v31 = NSString;
    v32 = PUI_LocalizedStringForAppReport(@"WEBSITE_UNVERIFIED_CONTEXT_FOOTER");
    v51 = v18;
    v33 = objc_msgSend(v31, "stringWithFormat:", v32, @"SF_SYMBOL_APPSTORE");

    v34 = [NSString stringWithFormat:@"%@\n\n%@", v29, v33];
    v35 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v34];
    v36 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"appstore"];
    v37 = [v36 imageWithRenderingMode:2];

    id v38 = +[PUIAttributedStringFooter string:v35 replacingSubstring:@"SF_SYMBOL_APPSTORE" withImage:v37];
    id v39 = objc_alloc(MEMORY[0x1E4F28E48]);
    v40 = PUI_LocalizedStringForAppReport(@"WEBSITE_UNVERIFIED_CONTEXT_FOOTER_LINK");
    v41 = (void *)[v39 initWithString:v40];

    uint64_t v42 = *MEMORY[0x1E4FB0720];
    v43 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1F4072988];
    objc_msgSend(v41, "addAttribute:value:range:", v42, v43, 0, objc_msgSend(v41, "length"));

    v44 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v35 appendAttributedString:v44];

    [v35 appendAttributedString:v41];
    [v28 setObject:v35 forKeyedSubscript:@"PUIAttributedStringFooterStringKey"];
    [*(id *)(a1 + 32) reloadSpecifier:v28];

    v18 = v51;
  }
  else
  {
    v45 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v29];
    [v28 setObject:v45 forKeyedSubscript:@"PUIAttributedStringFooterStringKey"];

    [*(id *)(a1 + 32) reloadSpecifier:v28];
  }
  v46 = *(void **)(a1 + 32);
  v47 = [v46 domainNetworkActivityRows];
  uint64_t v48 = *(void *)(a1 + 64);
  v49 = [*(id *)(a1 + 32) domainNetworkActivityHeader];
  v50 = objc_msgSend(v46, "pui_replaceRows:withRows:header:insertPoint:", v47, v48, v49, v18);

  [*(id *)(a1 + 32) setDomainNetworkActivityRows:*(void *)(a1 + 64)];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 0;
}

- (void)presentAboutController
{
  id v3 = objc_alloc(MEMORY[0x1E4F83AE8]);
  objc_super v4 = PUI_LocalizedStringForAppReport(@"LEARN_MORE_TITLE");
  id v5 = (void *)[v3 initWithTitle:v4 detailText:0 symbolName:0 contentLayout:2];

  uint64_t v6 = PUI_LocalizedStringForAppReport(@"LEARN_MORE_TEXT");
  [v5 addSectionWithHeader:0 content:v6];

  id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v8 = (void *)MEMORY[0x1E4FB13F0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__PUIReportController_presentAboutController__block_invoke;
  v14[3] = &unk_1E6E9C708;
  id v15 = v5;
  id v9 = v5;
  v10 = [v8 actionWithHandler:v14];
  uint64_t v11 = (void *)[v7 initWithBarButtonSystemItem:0 primaryAction:v10];

  id v12 = [v9 navigationItem];
  [v12 setRightBarButtonItem:v11];

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];
  [(PUIReportController *)self presentModalViewController:v13 withTransition:3];
}

void __45__PUIReportController_presentAboutController__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (id)specifiersForAppPrivacyReport
{
  id v3 = objc_opt_new();
  [(PUIReportController *)self setCurrentControllerMode:[(PUIReportController *)self controllerMode]];
  unint64_t v4 = [(PUIReportController *)self controllerMode];
  id v5 = (void *)MEMORY[0x1E4F93060];
  uint64_t v6 = (void *)MEMORY[0x1E4F93068];
  if (!v4)
  {
    id v12 = [(PUIReportController *)self navigationItem];
    [v12 setRightBarButtonItem:0];

    uint64_t v11 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [v11 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
    id v13 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v11 setObject:v13 forKeyedSubscript:@"PUIOnboardingCellDelegateKey"];

    [v11 setIdentifier:@"ONBOARDING"];
    [v3 addObject:v11];
    id v14 = (void *)MEMORY[0x1E4F92E70];
    id v15 = PUI_LocalizedStringForAppReport(@"ENABLE_REPORT");
    uint64_t v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v16 setIdentifier:@"ENABLE_REPORT"];
    [v16 setButtonAction:sel_didTapTurnOnAppPrivacyReport];
    [v16 setObject:&unk_1F4080530 forKeyedSubscript:*v5];
    [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v6];
    [v3 addObject:v16];
LABEL_7:

    goto LABEL_8;
  }
  if ([(PUIReportController *)self controllerMode] != 1)
  {
    if ([(PUIReportController *)self controllerMode] != 2) {
      goto LABEL_9;
    }
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel_didTapSave];
    v17 = [(PUIReportController *)self navigationItem];
    [v17 setRightBarButtonItem:v11];

    v18 = [(PUIReportController *)self headerSpecifiers];
    [(PUIReportController *)self setLearnMoreHeader:v18];

    v19 = [(PUIReportController *)self learnMoreHeader];
    [v3 addObjectsFromArray:v19];

    uint64_t v20 = [(PUIReportController *)self dataAccessGroupSpecifiers];
    [(PUIReportController *)self setSensorActivityHeader:v20];

    uint64_t v21 = [(PUIReportController *)self appNetworkActivityGroupSpecifiers];
    [(PUIReportController *)self setAppNetworkActivityHeader:v21];

    uint64_t v22 = [(PUIReportController *)self websiteNetworkActivityGroupSpecifiers];
    [(PUIReportController *)self setWebsiteNetworkActivityHeader:v22];

    uint64_t v16 = [(PUIReportController *)self mostContactedDomainsGroupSpecifiers];
    [(PUIReportController *)self setDomainNetworkActivityHeader:v16];
    goto LABEL_7;
  }
  id v7 = [(PUIReportController *)self navigationItem];
  [v7 setRightBarButtonItem:0];

  id v8 = [(PUIReportController *)self headerSpecifiers];
  [(PUIReportController *)self setLearnMoreHeader:v8];

  id v9 = [(PUIReportController *)self learnMoreHeader];
  [v3 addObjectsFromArray:v9];

  v10 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"NO_DATA_HEADER"];
  [v3 addObject:v10];

  uint64_t v11 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  [v11 setIdentifier:@"NO_DATA"];
  [v11 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
  [v3 addObject:v11];
LABEL_8:

LABEL_9:
  if ([(PUIReportController *)self controllerMode])
  {
    v23 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"DISABLE_REPORT_GROUP"];
    [v3 addObject:v23];
    v24 = (void *)MEMORY[0x1E4F92E70];
    char v25 = PUI_LocalizedStringForAppReport(@"DISABLE_REPORT");
    int v26 = [v24 preferenceSpecifierNamed:v25 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v26 setIdentifier:@"DISABLE_REPORT"];
    [v26 setObject:&unk_1F4080530 forKeyedSubscript:*v5];
    [v26 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v6];
    [v26 setButtonAction:sel_didTapTurnOffAppPrivacyReport];
    [v3 addObject:v26];
  }
  return v3;
}

- (id)headerSpecifiers
{
  id v3 = objc_opt_new();
  unint64_t v4 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"HEADER_GROUP"];
  id v5 = PUI_LocalizedStringForAppReport(@"APP_REPORT_HEADER_TEXT");
  uint64_t v6 = PUI_LocalizedStringForAppReport(@"APP_REPORT_LINK_TEXT");
  id v7 = [NSString stringWithFormat:@"%@ %@", v5, v6];
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v4 setProperty:v9 forKey:*MEMORY[0x1E4F93140]];

  [v4 setProperty:v7 forKey:*MEMORY[0x1E4F93160]];
  v14.location = [v7 rangeOfString:v6];
  v10 = NSStringFromRange(v14);
  [v4 setProperty:v10 forKey:*MEMORY[0x1E4F93150]];

  uint64_t v11 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
  [v4 setProperty:v11 forKey:*MEMORY[0x1E4F93158]];

  [v4 setProperty:@"presentAboutController" forKey:*MEMORY[0x1E4F93148]];
  [v3 addObject:v4];

  return v3;
}

- (id)dataAccessGroupSpecifiers
{
  int v2 = objc_opt_new();
  id v3 = (void *)MEMORY[0x1E4F92E70];
  unint64_t v4 = PUI_LocalizedStringForAppReport(@"DATA_SENSOR_ACCESS");
  id v5 = [v3 groupSpecifierWithID:@"DATA_GROUP" name:v4];

  uint64_t v6 = PUI_LocalizedStringForAppReport(@"DATA_SENSOR_ACCESS_FOOTER");
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F93170]];

  [v2 addObject:v5];
  return v2;
}

- (id)dataAccessSpecifiers
{
  id v3 = [(PUIReportController *)self sensorManager];
  unint64_t v4 = +[PUIReportSensorListController appSpecifiersFromManager:v3];
  id v5 = (void *)[v4 mutableCopy];

  unint64_t v6 = [v5 count];
  unint64_t v7 = [v5 count];
  if (v7 >= 5) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = v7;
  }
  id v9 = objc_msgSend(v5, "subarrayWithRange:", 0, v8);
  v10 = (void *)[v9 mutableCopy];

  if (v6 >= 6)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F92E70];
    id v12 = PUI_LocalizedStringForAppReport(@"SHOW_ALL");
    id v13 = [v11 preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v13 setIdentifier:@"SHOW_ALL_SENSOR"];
    NSRange v14 = [(PUIReportController *)self sensorManager];
    [v13 setObject:v14 forKeyedSubscript:@"PUIReportSensorManagerKey"];

    [v10 addObject:v13];
  }
  return v10;
}

- (id)appNetworkActivityGroupSpecifiers
{
  int v2 = objc_opt_new();
  id v3 = (void *)MEMORY[0x1E4F92E70];
  unint64_t v4 = PUI_LocalizedStringForAppReport(@"APP_NETWORK_ACTIVITY");
  id v5 = [v3 groupSpecifierWithID:@"APP_NETWORK_ACTIVITY_GROUP" name:v4];

  unint64_t v6 = PUI_LocalizedStringForAppReport(@"APP_NETWORK_ACTIVITY_FOOTER");
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F93170]];

  [v2 addObject:v5];
  return v2;
}

- (void)reloadAppNetworkActivitySpecifiersWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PUIReportController_reloadAppNetworkActivitySpecifiersWithCompletion___block_invoke;
  v6[3] = &unk_1E6E9DBB0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[PUIReportAppListController appSpecifiersWithLimit:6 completion:v6];
}

void __72__PUIReportController_reloadAppNetworkActivitySpecifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 mutableCopy];
  unint64_t v5 = [v4 count];
  unint64_t v6 = [v4 count];
  if (v6 >= 5) {
    uint64_t v7 = 5;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = objc_msgSend(v3, "subarrayWithRange:", 0, v7);

  id v14 = (id)[v8 mutableCopy];
  if (v5 >= 6)
  {
    id v9 = (void *)MEMORY[0x1E4F92E70];
    v10 = PUI_LocalizedStringForAppReport(@"SHOW_ALL");
    uint64_t v11 = [v9 preferenceSpecifierNamed:v10 target:*(void *)(a1 + 32) set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v11 setIdentifier:@"SHOW_ALL_APP_NETWORK"];
    [v14 addObject:v11];
  }
  id v12 = (void *)[v14 copy];
  [*(id *)(a1 + 32) setAppNetworkActivityRowsAwaitingDisplay:v12];

  [*(id *)(a1 + 32) dataDidChange];
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }
}

- (id)websiteNetworkActivityGroupSpecifiers
{
  int v2 = objc_opt_new();
  id v3 = (void *)MEMORY[0x1E4F92E70];
  id v4 = PUI_LocalizedStringForAppReport(@"WEBSITE_NETWORK_ACTIVITY");
  unint64_t v5 = [v3 groupSpecifierWithID:@"WEBSITE_NETWORK_ACTIVITY_GROUP" name:v4];

  unint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F93140]];

  [v2 addObject:v5];
  return v2;
}

- (void)reloadWebsiteNetworkActivitySpecifiersWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__PUIReportController_reloadWebsiteNetworkActivitySpecifiersWithCompletion___block_invoke;
  v6[3] = &unk_1E6E9DBB0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[PUIReportWebsiteListController websiteSpecifiersWithLimit:6 showDetail:0 completion:v6];
}

void __76__PUIReportController_reloadWebsiteNetworkActivitySpecifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 mutableCopy];
  unint64_t v5 = [v4 count];
  unint64_t v6 = [v4 count];
  if (v6 >= 5) {
    uint64_t v7 = 5;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = objc_msgSend(v3, "subarrayWithRange:", 0, v7);

  id v14 = (id)[v8 mutableCopy];
  if (v5 >= 6)
  {
    id v9 = (void *)MEMORY[0x1E4F92E70];
    v10 = PUI_LocalizedStringForAppReport(@"SHOW_ALL");
    uint64_t v11 = [v9 preferenceSpecifierNamed:v10 target:*(void *)(a1 + 32) set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v11 setIdentifier:@"SHOW_ALL_WEBSITES"];
    [v14 addObject:v11];
  }
  id v12 = (void *)[v14 copy];
  [*(id *)(a1 + 32) setWebsiteNetworkActivityRowsAwaitingDisplay:v12];

  [*(id *)(a1 + 32) dataDidChange];
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }
}

- (id)mostContactedDomainsGroupSpecifiers
{
  int v2 = objc_opt_new();
  id v3 = (void *)MEMORY[0x1E4F92E70];
  id v4 = PUI_LocalizedStringForAppReport(@"MOST_CONTACTED_DOMAINS");
  unint64_t v5 = [v3 groupSpecifierWithID:@"DOMAINS_GROUP" name:v4];

  unint64_t v6 = PUI_LocalizedStringForAppReport(@"MOST_CONTACTED_DOMAINS_FOOTER");
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F93170]];

  [v2 addObject:v5];
  return v2;
}

- (void)reloadMostContactedDomainsSpecifiersWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__PUIReportController_reloadMostContactedDomainsSpecifiersWithCompletion___block_invoke;
  v6[3] = &unk_1E6E9DBB0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[PUIReportDomainListController domainSpecifiersWithLimit:6 showDates:0 showAppAndWebsiteCounts:1 showIPAddresses:0 completion:v6];
}

void __74__PUIReportController_reloadMostContactedDomainsSpecifiersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  unint64_t v4 = [v3 count];
  unint64_t v5 = [v3 count];
  if (v5 >= 5) {
    uint64_t v6 = 5;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = objc_msgSend(v3, "subarrayWithRange:", 0, v6);
  id v13 = (id)[v7 mutableCopy];

  if (v4 >= 6)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F92E70];
    id v9 = PUI_LocalizedStringForAppReport(@"SHOW_ALL");
    v10 = [v8 preferenceSpecifierNamed:v9 target:*(void *)(a1 + 32) set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v10 setIdentifier:@"SHOW_ALL_DOMAIN"];
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PUIReportDomainListShowWebsiteAndAppCounts"];
    [v13 addObject:v10];
  }
  uint64_t v11 = (void *)[v13 copy];
  [*(id *)(a1 + 32) setDomainNetworkActivityRowsAwaitingDisplay:v11];

  [*(id *)(a1 + 32) dataDidChange];
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(void))(v12 + 16))();
  }
}

- (void)didTapTurnOnAppPrivacyReport
{
}

- (void)didTapTurnOffAppPrivacyReport
{
}

- (unint64_t)controllerMode
{
  id v3 = [(PUIReportController *)self reportManager];
  int v4 = [v3 trackingReportEnabled];

  if (!v4) {
    return 0;
  }
  if ([(PUIReportController *)self eitherSourceHasData]) {
    return 2;
  }
  return 1;
}

- (void)reloadAppAndTrackingData
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = _PUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[PUIReportController reloadAppAndTrackingData]";
    _os_log_impl(&dword_1E4AD5000, v3, OS_LOG_TYPE_DEFAULT, "%s: Starting page load", buf, 0xCu);
  }

  int v4 = PUILogForCategory(1uLL);
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, "PUIReportController.load");

  uint64_t v6 = PUILogForCategory(1uLL);
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PUIReportController.load", "", buf, 2u);
  }

  dispatch_group_t v8 = dispatch_group_create();
  id v9 = [(PUIReportController *)self reportManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke;
  v11[3] = &unk_1E6E9DBD8;
  v11[4] = self;
  dispatch_group_t v12 = v8;
  os_signpost_id_t v13 = v5;
  v10 = v8;
  [v9 reloadEnabledWithCompletion:v11];
}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke_2;
  v5[3] = &unk_1E6E9DBD8;
  int v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  uint64_t v8 = *(void *)(a1 + 48);
  [v2 reloadAppAccessHasDataWithCompletion:v5];
}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke_2(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke_3;
  v14[3] = &unk_1E6E9C758;
  int v2 = *(void **)(a1 + 40);
  id v15 = *(id *)(a1 + 32);
  [v2 reloadAppNetworkActivitySpecifiersWithCompletion:v14];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke_4;
  v12[3] = &unk_1E6E9C758;
  id v3 = *(void **)(a1 + 40);
  id v13 = *(id *)(a1 + 32);
  [v3 reloadWebsiteNetworkActivitySpecifiersWithCompletion:v12];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke_5;
  v10[3] = &unk_1E6E9C758;
  uint64_t v4 = *(void **)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  [v4 reloadMostContactedDomainsSpecifiersWithCompletion:v10];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  os_signpost_id_t v5 = [*(id *)(a1 + 40) sensorManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke_6;
  v8[3] = &unk_1E6E9C758;
  id v9 = *(id *)(a1 + 32);
  [v5 reloadDataWithCompletion:v8];

  id v6 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PUIReportController_reloadAppAndTrackingData__block_invoke_7;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 48);
  dispatch_group_notify(v6, MEMORY[0x1E4F14428], block);
}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke_3(uint64_t a1)
{
}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke_4(uint64_t a1)
{
}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke_5(uint64_t a1)
{
}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke_6(uint64_t a1)
{
}

void __47__PUIReportController_reloadAppAndTrackingData__block_invoke_7(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = PUILogForCategory(1uLL);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E4AD5000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PUIReportController.load", "", (uint8_t *)&v6, 2u);
  }

  os_signpost_id_t v5 = _PUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[PUIReportController reloadAppAndTrackingData]_block_invoke";
    _os_log_impl(&dword_1E4AD5000, v5, OS_LOG_TYPE_DEFAULT, "%s: Finished page load", (uint8_t *)&v6, 0xCu);
  }
}

- (id)saveAppActivityFooterText
{
  if (![(PUIReportController *)self hasData])
  {
    id v9 = @"SAVE_APP_ACTIVITY_NO_DATA_FOOTER";
    goto LABEL_6;
  }
  id v3 = [(PUIReportController *)self reportManager];
  os_signpost_id_t v4 = [v3 enabledDate];

  if (v4)
  {
    os_signpost_id_t v5 = [(PUIReportController *)self reportManager];
    int v6 = [v5 enabledDate];
    [v6 timeIntervalSinceNow];
    double v8 = fabs(v7);

    if (v8 > 604800.0)
    {
      id v9 = @"SAVE_APP_ACTIVITY_FOOTER_7_DAYS";
LABEL_6:
      PUI_LocalizedStringForTrackers(v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    id v11 = NSString;
    dispatch_group_t v12 = PUI_LocalizedStringForTrackers(@"SAVE_APP_ACTIVITY_FOOTER");
    objc_msgSend(v11, "localizedStringWithFormat:", v12, (unint64_t)(v8 / 86400.0));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_1F4072988;
  }
LABEL_9:
  return v10;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUIReportController;
  [(PUIReportController *)&v4 viewDidLoad];
  id v3 = PUI_LocalizedStringForPrivacy(@"APP_PRIVACY_REPORT");
  [(PUIReportController *)self setTitle:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUIReportController;
  [(PUIReportController *)&v7 viewWillAppear:a3];
  [MEMORY[0x1E4F9AA08] trackingRecordAppActivityVisited];
  objc_super v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
  {
    int v6 = (void *)[objc_alloc(MEMORY[0x1E4F29230]) initWithActivityType:@"AppTrackingTTRActivity"];
    [v6 setEligibleForHandoff:0];
    [v6 setUserInfo:&unk_1F40807C8];
    [(PUIReportController *)self setUserActivity:v6];
  }
}

- (BOOL)eitherSourceHasData
{
  id v3 = [(PUIReportController *)self reportManager];
  BOOL v4 = ([v3 hadDataInLastQuery] & 1) != 0
    || [(PUIReportController *)self appAccessHasData];

  return v4;
}

- (BOOL)appAccessHasData
{
  int v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PUIReportAppAccessHasData"];

  return v3;
}

- (void)reloadAppAccessHasDataWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PUIReportController_reloadAppAccessHasDataWithCompletion___block_invoke;
  block[3] = &unk_1E6E9CB28;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __60__PUIReportController_reloadAppAccessHasDataWithCompletion___block_invoke(uint64_t a1)
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  int v2 = [getPAAccessReaderClass() sharedInstance];
  id v3 = [v2 publisherForAll];

  BOOL v4 = [MEMORY[0x1E4F934D8] accessPublisherWithoutHiddenOrMissingApps:v3];
  id v5 = [MEMORY[0x1E4F934D8] accessPublisherWithoutUnknownCategoryAccesses:v4];

  int v6 = [MEMORY[0x1E4F934D8] accessPublisherWithoutOutOfProcessPickerAccesses:v5];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__PUIReportController_reloadAppAccessHasDataWithCompletion___block_invoke_3;
  v11[3] = &unk_1E6E9DC20;
  v11[4] = v12;
  id v7 = (id)[v6 sinkWithCompletion:&__block_literal_global_15 shouldContinue:v11];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PUIReportController_reloadAppAccessHasDataWithCompletion___block_invoke_4;
  block[3] = &unk_1E6E9DC48;
  v10 = v12;
  id v9 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v12, 8);
}

uint64_t __60__PUIReportController_reloadAppAccessHasDataWithCompletion___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

uint64_t __60__PUIReportController_reloadAppAccessHasDataWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v3 = _PUILoggingFacility();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v4) {
      goto LABEL_7;
    }
    int v9 = 136315138;
    v10 = "-[PUIReportController reloadAppAccessHasDataWithCompletion:]_block_invoke_4";
    id v5 = "%s: PAAccessReader has data";
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    int v9 = 136315138;
    v10 = "-[PUIReportController reloadAppAccessHasDataWithCompletion:]_block_invoke";
    id v5 = "%s: PAAccessReader has no data";
  }
  _os_log_impl(&dword_1E4AD5000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v9, 0xCu);
LABEL_7:

  int v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 setBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) forKey:@"PUIReportAppAccessHasData"];

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  }
  return result;
}

+ (BOOL)isRecordActivityEnabled
{
  int v2 = objc_opt_new();
  if ([v2 trackingReportEnabled])
  {
    id v3 = [getPAAccessReaderClass() sharedInstance];
    char v4 = [v3 loggingEnabled];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isRecordActivityEnabled
{
  int v2 = [(PUIReportController *)self reportManager];
  if ([v2 trackingReportEnabled])
  {
    id v3 = [getPAAccessReaderClass() sharedInstance];
    char v4 = [v3 loggingEnabled];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)isRecordActivityEnabled:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v4 = [(PUIReportController *)self isRecordActivityEnabled];
  return (id)[v3 numberWithBool:v4];
}

- (void)setRecordActivityEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PUIReportController_setRecordActivityEnabled_specifier___block_invoke;
  aBlock[3] = &unk_1E6E9D358;
  aBlock[4] = self;
  double v8 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if ([v6 BOOLValue])
  {
    v8[2](v8, [v6 BOOLValue]);
  }
  else
  {
    int v9 = (void *)MEMORY[0x1E4FB1418];
    v10 = PUI_LocalizedStringForTrackers(@"STOP_RECORDING_ALERT_TITLE");
    uint64_t v11 = PUI_LocalizedStringForTrackers(@"STOP_RECORDING_ALERT_MESSAGE");
    dispatch_group_t v12 = [v9 alertControllerWithTitle:v10 message:v11 preferredStyle:1];

    char v13 = (void *)MEMORY[0x1E4FB1410];
    id v14 = PUI_LocalizedStringForTrackers(@"STOP_RECORDING_ALERT_CANCEL");
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __58__PUIReportController_setRecordActivityEnabled_specifier___block_invoke_2;
    v22[3] = &unk_1E6E9CC68;
    v22[4] = self;
    id v23 = v7;
    id v15 = [v13 actionWithTitle:v14 style:1 handler:v22];
    [v12 addAction:v15];

    uint64_t v16 = (void *)MEMORY[0x1E4FB1410];
    v17 = PUI_LocalizedStringForTrackers(@"STOP_RECORDING_ALERT_OK");
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58__PUIReportController_setRecordActivityEnabled_specifier___block_invoke_3;
    v19[3] = &unk_1E6E9DC70;
    uint64_t v21 = v8;
    id v20 = v6;
    v18 = [v16 actionWithTitle:v17 style:0 handler:v19];
    [v12 addAction:v18];

    [(PUIReportController *)self presentViewController:v12 animated:1 completion:0];
  }
}

void __58__PUIReportController_setRecordActivityEnabled_specifier___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = [*(id *)(a1 + 32) reportManager];
  [v4 setTrackingReportEnabled:a2];

  id v5 = [getPAAccessReaderClass() sharedInstance];
  [v5 setLoggingEnabled:a2];

  if ((a2 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 removeObjectForKey:@"PUIReportAppAccessHasData"];
  }
  [*(id *)(a1 + 32) reloadAppAndTrackingData];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"PUIReportActivityEnabledChanged" object:0];
}

uint64_t __58__PUIReportController_setRecordActivityEnabled_specifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
}

uint64_t __58__PUIReportController_setRecordActivityEnabled_specifier___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) BOOLValue];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (void)didTapSave
{
  [MEMORY[0x1E4F9AA08] trackingAppActivitySaved];
  id v3 = [(PUIReportController *)self saveAppActivitySpecifier];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PUIActivityButtonCellIsActive"];

  BOOL v4 = PUI_LocalizedStringForTrackers(@"SAVING");
  id v5 = [(PUIReportController *)self saveAppActivitySpecifier];
  [v5 setName:v4];

  id v6 = [(PUIReportController *)self saveAppActivitySpecifier];
  [(PUIReportController *)self reloadSpecifier:v6];

  id v7 = [(PUIReportController *)self reportManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__PUIReportController_didTapSave__block_invoke;
  v8[3] = &unk_1E6E9C758;
  void v8[4] = self;
  [v7 reloadDataWithCompletion:v8];
}

void __33__PUIReportController_didTapSave__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _PUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[PUIReportController didTapSave]_block_invoke";
    _os_log_impl(&dword_1E4AD5000, v2, OS_LOG_TYPE_DEFAULT, "%s: trackingReportManager export started", buf, 0xCu);
  }

  id v3 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PUIReportController_didTapSave__block_invoke_294;
  block[3] = &unk_1E6E9C758;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v3, block);
}

void __33__PUIReportController_didTapSave__block_invoke_294(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [getPAAccessReaderClass() fileNameForExport];
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v4 = NSString;
  id v5 = NSTemporaryDirectory();
  id v6 = [v4 stringWithFormat:@"%@/%@", v5, v2];
  uint64_t v7 = [v3 fileURLWithPath:v6];

  double v8 = [MEMORY[0x1E4F1CAA8] outputStreamWithURL:v7 append:0];
  [v8 open];
  int v9 = [getPAAccessReaderClass() sharedInstance];
  v10 = [v9 publisherForAll];

  uint64_t v11 = [MEMORY[0x1E4F934D8] accessPublisherWithoutHiddenOrMissingApps:v10];
  dispatch_group_t v12 = [MEMORY[0x1E4F934D8] accessPublisherWithoutUnknownCategoryAccesses:v11];

  id v25 = 0;
  [getPAAccessReaderClass() exportFromPublisher:v12 toStream:v8 error:&v25];
  id v13 = v25;
  if (v13)
  {
    id v14 = _PUILoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __33__PUIReportController_didTapSave__block_invoke_294_cold_2();
    }
  }
  id v15 = [*(id *)(a1 + 32) reportManager];
  id v24 = 0;
  [v15 exportToStream:v8 error:&v24];
  id v16 = v24;

  v17 = _PUILoggingFacility();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __33__PUIReportController_didTapSave__block_invoke_294_cold_1();
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[PUIReportController didTapSave]_block_invoke";
    _os_log_impl(&dword_1E4AD5000, v18, OS_LOG_TYPE_DEFAULT, "%s: trackingReportManager export completed", buf, 0xCu);
  }

  [v8 close];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PUIReportController_didTapSave__block_invoke_299;
  block[3] = &unk_1E6E9CBA0;
  uint64_t v19 = *(void *)(a1 + 32);
  id v22 = v7;
  uint64_t v23 = v19;
  id v20 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __33__PUIReportController_didTapSave__block_invoke_299(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F9F2E8]);
  v21[0] = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  BOOL v4 = (void *)[v2 initWithActivityItems:v3 applicationActivities:0];

  id v5 = [*(id *)(a1 + 40) navigationItem];
  id v6 = [v5 rightBarButtonItem];

  uint64_t v7 = *(void **)(a1 + 40);
  if (v6)
  {
    double v8 = [v7 navigationItem];
    int v9 = [v8 rightBarButtonItem];
    v10 = [v4 popoverPresentationController];
    [v10 setBarButtonItem:v9];
  }
  else
  {
    uint64_t v11 = [v7 specifierForID:@"SAVE_APP_ACTIVITY"];
    dispatch_group_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F93220]];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [*(id *)(a1 + 40) view];
    }
    double v8 = v14;

    int v9 = [v4 popoverPresentationController];
    [v9 setSourceView:v8];
  }

  uint64_t v15 = *MEMORY[0x1E4F9F388];
  v20[0] = *MEMORY[0x1E4F9F350];
  v20[1] = v15;
  uint64_t v16 = *MEMORY[0x1E4F9F3C8];
  v20[2] = *MEMORY[0x1E4F9F340];
  v20[3] = v16;
  v20[4] = *MEMORY[0x1E4F9F3C0];
  v20[5] = @"com.apple.reminders.RemindersEditorExtension";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:6];
  [v4 setExcludedActivityTypes:v17];

  v18 = *(void **)(a1 + 40);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __33__PUIReportController_didTapSave__block_invoke_2;
  v19[3] = &unk_1E6E9C758;
  void v19[4] = v18;
  [v18 presentViewController:v4 animated:1 completion:v19];
}

void __33__PUIReportController_didTapSave__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) saveAppActivitySpecifier];
  [v2 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"PUIActivityButtonCellIsActive"];

  id v3 = PUI_LocalizedStringForTrackers(@"SAVE_APP_ACTIVITY");
  BOOL v4 = [*(id *)(a1 + 32) saveAppActivitySpecifier];
  [v4 setName:v3];

  id v5 = *(void **)(a1 + 32);
  id v6 = [v5 saveAppActivitySpecifier];
  [v5 reloadSpecifier:v6];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)PUIReportController;
  id v6 = a4;
  uint64_t v7 = [(PUIReportController *)&v20 tableView:a3 cellForRowAtIndexPath:v6];
  double v8 = -[PUIReportController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v20.receiver, v20.super_class);

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v10 = *MEMORY[0x1E4F93188];
  if (isKindOfClass)
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F93188]];
    int v12 = [v11 isEqualToString:@"DISABLE_REPORT"];

    if (v12)
    {
      id v13 = v7;
      if ([v13 type] == 13)
      {
        id v14 = [MEMORY[0x1E4FB1618] systemRedColor];
        uint64_t v15 = [v13 textLabel];
        [v15 setTextColor:v14];

        goto LABEL_9;
      }
    }
  }
  uint64_t v16 = [v8 objectForKeyedSubscript:v10];
  int v17 = [v16 isEqualToString:@"ONBOARDING"];

  if (v17) {
    objc_msgSend(v7, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
  }
  id v18 = v7;
LABEL_9:

  return v7;
}

- (PUITrackingReportManager)reportManager
{
  return self->_reportManager;
}

- (void)setReportManager:(id)a3
{
}

- (PUIReportSensorManager)sensorManager
{
  return self->_sensorManager;
}

- (void)setSensorManager:(id)a3
{
}

- (BOOL)reportEnabled
{
  return self->_reportEnabled;
}

- (void)setReportEnabled:(BOOL)a3
{
  self->_reportEnabled = a3;
}

- (BOOL)hasData
{
  return self->_hasData;
}

- (void)setHasData:(BOOL)a3
{
  self->_hasData = a3;
}

- (PSSpecifier)saveAppActivitySpecifier
{
  return self->_saveAppActivitySpecifier;
}

- (void)setSaveAppActivitySpecifier:(id)a3
{
}

- (unint64_t)currentControllerMode
{
  return self->_currentControllerMode;
}

- (void)setCurrentControllerMode:(unint64_t)a3
{
  self->_currentControllerMode = a3;
}

- (NSArray)learnMoreHeader
{
  return self->_learnMoreHeader;
}

- (void)setLearnMoreHeader:(id)a3
{
}

- (NSArray)sensorActivityHeader
{
  return self->_sensorActivityHeader;
}

- (void)setSensorActivityHeader:(id)a3
{
}

- (NSArray)sensorActivityRows
{
  return self->_sensorActivityRows;
}

- (void)setSensorActivityRows:(id)a3
{
}

- (NSArray)appNetworkActivityHeader
{
  return self->_appNetworkActivityHeader;
}

- (void)setAppNetworkActivityHeader:(id)a3
{
}

- (NSArray)appNetworkActivityRows
{
  return self->_appNetworkActivityRows;
}

- (void)setAppNetworkActivityRows:(id)a3
{
}

- (NSArray)appNetworkActivityRowsAwaitingDisplay
{
  return self->_appNetworkActivityRowsAwaitingDisplay;
}

- (void)setAppNetworkActivityRowsAwaitingDisplay:(id)a3
{
}

- (NSArray)websiteNetworkActivityHeader
{
  return self->_websiteNetworkActivityHeader;
}

- (void)setWebsiteNetworkActivityHeader:(id)a3
{
}

- (NSArray)websiteNetworkActivityRows
{
  return self->_websiteNetworkActivityRows;
}

- (void)setWebsiteNetworkActivityRows:(id)a3
{
}

- (NSArray)websiteNetworkActivityRowsAwaitingDisplay
{
  return self->_websiteNetworkActivityRowsAwaitingDisplay;
}

- (void)setWebsiteNetworkActivityRowsAwaitingDisplay:(id)a3
{
}

- (NSArray)domainNetworkActivityHeader
{
  return self->_domainNetworkActivityHeader;
}

- (void)setDomainNetworkActivityHeader:(id)a3
{
}

- (NSArray)domainNetworkActivityRows
{
  return self->_domainNetworkActivityRows;
}

- (void)setDomainNetworkActivityRows:(id)a3
{
}

- (NSArray)domainNetworkActivityRowsAwaitingDisplay
{
  return self->_domainNetworkActivityRowsAwaitingDisplay;
}

- (void)setDomainNetworkActivityRowsAwaitingDisplay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainNetworkActivityRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_domainNetworkActivityRows, 0);
  objc_storeStrong((id *)&self->_domainNetworkActivityHeader, 0);
  objc_storeStrong((id *)&self->_websiteNetworkActivityRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_websiteNetworkActivityRows, 0);
  objc_storeStrong((id *)&self->_websiteNetworkActivityHeader, 0);
  objc_storeStrong((id *)&self->_appNetworkActivityRowsAwaitingDisplay, 0);
  objc_storeStrong((id *)&self->_appNetworkActivityRows, 0);
  objc_storeStrong((id *)&self->_appNetworkActivityHeader, 0);
  objc_storeStrong((id *)&self->_sensorActivityRows, 0);
  objc_storeStrong((id *)&self->_sensorActivityHeader, 0);
  objc_storeStrong((id *)&self->_learnMoreHeader, 0);
  objc_storeStrong((id *)&self->_saveAppActivitySpecifier, 0);
  objc_storeStrong((id *)&self->_sensorManager, 0);
  objc_storeStrong((id *)&self->_reportManager, 0);
}

void __33__PUIReportController_didTapSave__block_invoke_294_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_1E4AD5000, v0, OS_LOG_TYPE_ERROR, "%s: trackingReportManager export error: %@", (uint8_t *)v1, 0x16u);
}

void __33__PUIReportController_didTapSave__block_invoke_294_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_1E4AD5000, v0, OS_LOG_TYPE_ERROR, "%s: PAAccessReader error: %@", (uint8_t *)v1, 0x16u);
}

@end