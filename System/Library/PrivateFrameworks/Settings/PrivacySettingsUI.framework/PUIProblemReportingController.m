@interface PUIProblemReportingController
+ (BOOL)isProblemReportingEnabled;
- (AFSettingsConnection)assistantSettingsConnection;
- (BOOL)isAppAndAccessoryAnalyticsAllowedFeatureEnabled;
- (BOOL)shouldShareHealthRecordsData;
- (BOOL)shouldShowFitnessPlusSpecifiers;
- (BOOL)shouldShowIdentityVerificationSpecifiers;
- (BOOL)shouldShowiCloudSpecifiersForAccount:(id)a3;
- (CIDVUIIdentityProofingDataSharingFlowManager)identityProofingDataSharingManager;
- (HKHealthStore)healthStore;
- (NSArray)appActivitySpecifiers;
- (NSArray)automatedFeedbackSpecifiers;
- (NSArray)bankConnectDataSpecifiers;
- (NSArray)baseSpecifiers;
- (NSArray)fitnessPlusDataSpecifiers;
- (NSArray)handwashingDataSpecifiers;
- (NSArray)healthDataSpecifiers;
- (NSArray)healthRecordsDataSpecifiers;
- (NSArray)identityVerificationDataSpecifiers;
- (NSArray)improveARLocationAccuracySpecifiers;
- (NSArray)improveAssistiveVoiceSpecifiers;
- (NSArray)improveSiriSpecifiers;
- (NSArray)safetyDataSpecifiers;
- (NSArray)wheelchairDataSpecifiers;
- (PSSpecifier)filesystemMetadataSnapshotSpecifier;
- (PSSpecifier)spinnerSpecifier;
- (PUIBankConnectAnalyticsConsentCoordinator)bankConnectAnalyticsConsentCoordinator;
- (PUIFitnessPlusAnalyticsConsentCoordinator)fitnessPlusAnalyticsConsentCoordinator;
- (id)analyticsSpecifiersIncludingIndependentSpecifiers:(BOOL)a3 includeDependentSpecifiers:(BOOL)a4;
- (id)automatedFeedbackEnabled:(id)a3;
- (id)getCurrentImproveSiriAndDictationValueForSpecifier:(id)a3;
- (id)getImproveAssistiveVoiceValueForSpecifier:(id)a3;
- (id)iCloudSpecifiers;
- (id)improveARLocationAccuracyForSpecifier:(id)a3;
- (id)loadPrivacySettingsBundle;
- (id)problemReportingEnabled:(id)a3;
- (id)shouldShareAppActivityWithAppDevelopers;
- (id)shouldShareBankConnectDataForSpecifier:(id)a3;
- (id)shouldShareFitnessPlusDataForSpecifier:(id)a3;
- (id)shouldShareHandwashingDataForSpecifier:(id)a3;
- (id)shouldShareHealthDataForSpecifier:(id)a3;
- (id)shouldShareHealthRecordsDataForSpecifier:(id)a3;
- (id)shouldShareIdentityVerificationData:(id)a3;
- (id)shouldShareSafetyDataForSpecifier:(id)a3;
- (id)shouldShareWheelchairDataForSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (void)automatedFeedbackLinkTapped;
- (void)checkDiagnosticsSessionAvailability;
- (void)dismissAboutSheet:(id)a3;
- (void)launchDiagnosticsSession:(id)a3;
- (void)provideNavigationDonations;
- (void)setAssistantSettingsConnection:(id)a3;
- (void)setAutomatedFeedbackEnabled:(id)a3 specifier:(id)a4;
- (void)setAutomatedFeedbackSpecifiers:(id)a3;
- (void)setBankConnectAnalyticsConsentCoordinator:(id)a3;
- (void)setBoolValue:(BOOL)a3 forIdMSConfigKey:(id)a4 completion:(id)a5;
- (void)setFitnessPlusAnalyticsConsentCoordinator:(id)a3;
- (void)setIdentityProofingDataSharingManager:(id)a3;
- (void)setImproveARLocationAccuracy:(id)a3 specifier:(id)a4;
- (void)setImproveAssistiveVoiceSpecifiers:(id)a3;
- (void)setImproveAssistiveVoiceValue:(id)a3 specifier:(id)a4;
- (void)setImproveSiriAndDictationValue:(id)a3 specifier:(id)a4;
- (void)setImproveSiriSpecifiers:(id)a3;
- (void)setProblemReportingEnabled:(BOOL)a3;
- (void)setProblemReportingEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setShouldShareAppActivityWithAppDevelopers:(id)a3 specifier:(id)a4;
- (void)setShouldShareBankConnectData:(id)a3 specifier:(id)a4;
- (void)setShouldShareFitnessPlusData:(id)a3 specifier:(id)a4;
- (void)setShouldShareHandwashingData:(id)a3 specifier:(id)a4;
- (void)setShouldShareHealthData:(id)a3 specifier:(id)a4;
- (void)setShouldShareHealthRecordsData:(BOOL)a3;
- (void)setShouldShareHealthRecordsData:(id)a3 specifier:(id)a4;
- (void)setShouldShareIdentityVerificationData:(id)a3 specifier:(id)a4;
- (void)setShouldShareSafetyData:(id)a3 specifier:(id)a4;
- (void)setShouldShareWheelchairData:(id)a3 specifier:(id)a4;
- (void)setShouldShareiCloudAnalytics:(id)a3 specifier:(id)a4;
- (void)showAboutAnalyticsSheet;
- (void)showAboutAppAnalyticsSheet;
- (void)showAboutBankConnectDataSheet;
- (void)showAboutFitnessPlusDataSheet;
- (void)showAboutHandwashingDataSheet;
- (void)showAboutHealthDataSheet;
- (void)showAboutHealthRecordsDataSheet;
- (void)showAboutIdentityVerificationDataSheet;
- (void)showAboutImproveAssistiveVoiceFeatures;
- (void)showAboutImproveSiriAnalyticsSheet;
- (void)showAboutSafetyDataSheet;
- (void)showAboutSheetWithTitle:(id)a3 content:(id)a4;
- (void)showAboutWheelchairDataSheet;
- (void)showAboutiCloudAnalyticsSheet;
- (void)showImproveARLocationAccuracyDataSheet;
- (void)snapshot:(id)a3;
- (void)updateHealthRecordsPreferenceForSpecifierID:(id)a3;
- (void)updateiCloudAnalyticsForSpecifierID:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PUIProblemReportingController

- (id)loadPrivacySettingsBundle
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  v3 = SFRuntimeAbsoluteFilePathForPath();
  v4 = [v2 bundleWithPath:v3];

  [v4 load];
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIProblemReportingController;
  [(PUIProblemReportingController *)&v4 viewDidAppear:a3];
  [(PUIProblemReportingController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = PUI_BundleForPrivacySettingsFramework();
  objc_super v4 = [v3 bundleURL];

  id v5 = objc_alloc(MEMORY[0x1E4F292B8]);
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  v7 = (void *)[v5 initWithKey:@"PROBLEM_REPORTING" table:@"Privacy" locale:v6 bundleURL:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F292B8]);
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  v10 = (void *)[v8 initWithKey:@"PRIVACY" table:@"Privacy" locale:v9 bundleURL:v4];

  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/PROBLEM_REPORTING"];
  [(PUIProblemReportingController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.analytics-and-improvements" title:v7 localizedNavigationComponents:v11 deepLink:v12];
}

- (void)checkDiagnosticsSessionAvailability
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11[0] = 0;
  if (!iOSDiagnosticsLibraryCore_frameworkLibrary)
  {
    v11[1] = MEMORY[0x1E4F143A8];
    v11[2] = 3221225472;
    v11[3] = __iOSDiagnosticsLibraryCore_block_invoke;
    v11[4] = &__block_descriptor_40_e5_v8__0l;
    v11[5] = v11;
    long long v12 = xmmword_1E6E9D120;
    uint64_t v13 = 0;
    iOSDiagnosticsLibraryCore_frameworkLibrary = _sl_dlopen();
    v3 = (void *)v11[0];
    if (iOSDiagnosticsLibraryCore_frameworkLibrary)
    {
      if (!v11[0]) {
        goto LABEL_4;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
  }
LABEL_4:
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.DiagnosticsSessionAvailibility"];
  id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F40AAD08];
  [v4 setRemoteObjectInterface:v5];

  [v4 resume];
  v6 = [v4 remoteObjectProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PUIProblemReportingController_checkDiagnosticsSessionAvailability__block_invoke;
  v8[3] = &unk_1E6E9CBC8;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  [v6 checkAvailabilityWithReply:v8];
}

void __68__PUIProblemReportingController_checkDiagnosticsSessionAvailability__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__PUIProblemReportingController_checkDiagnosticsSessionAvailability__block_invoke_2;
    v6[3] = &unk_1E6E9CBA0;
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __68__PUIProblemReportingController_checkDiagnosticsSessionAvailability__block_invoke_2(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  if ([*(id *)(a1 + 32) isEqualToString:@"ENHANCED_LOGGING_STATE"]) {
    id v3 = @"ENHANCED_LOGGING_SESSION_EXPLANATION";
  }
  else {
    id v3 = @"START_DIAGNOSTICS_WITH_APPLE_SUPPORT_EXPLANATION";
  }
  id v4 = PUI_LocalizedStringForProblemReporting(v3);
  [v2 setProperty:v4 forKey:*MEMORY[0x1E4F93170]];

  uint64_t v5 = (void *)MEMORY[0x1E4F92E20];
  v6 = PUI_LocalizedStringForProblemReporting(@"START_DIAGNOSTICS_WITH_APPLE_SUPPORT");
  id v7 = [v5 preferenceSpecifierNamed:v6 target:*(void *)(a1 + 40) set:0 get:0 detail:0 cell:13 edit:0];

  [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93068]];
  if ([*(id *)(a1 + 32) isEqualToString:@"ENHANCED_LOGGING_STATE"])
  {
    uint64_t v8 = @"VIEW_ENHANCED_LOGGING_SESSION";
  }
  else
  {
    if (![*(id *)(a1 + 32) isEqualToString:@"IN_CURRENT_SESSION"]) {
      goto LABEL_9;
    }
    uint64_t v8 = @"RESUME_DIAGNOSTICS_WITH_APPLE_SUPPORT";
  }
  id v9 = PUI_LocalizedStringForProblemReporting(v8);
  [v7 setName:v9];

LABEL_9:
  [v7 setIdentifier:@"START_DIAGNOSTICS_WITH_APPLE_SUPPORT"];
  if ([*(id *)(a1 + 40) indexOfSpecifierID:@"START_DIAGNOSTICS_WITH_APPLE_SUPPORT"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = *(void **)(a1 + 40);
    v12[0] = v2;
    v12[1] = v7;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    [v10 insertContiguousSpecifiers:v11 atEndOfGroup:0 animated:1];
  }
}

- (void)launchDiagnosticsSession:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [NSString stringWithFormat:@"diagnostics://"];
  id v6 = [v3 URLWithString:v4];

  uint64_t v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v5 openURL:v6 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

+ (BOOL)isProblemReportingEnabled
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FB8]] == 1;

  return v3;
}

- (void)showAboutSheetWithTitle:(id)a3 content:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v11 = [[ProblemReportingAboutController alloc] initWithTitle:v7 content:v6];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v11];
  [v8 setModalPresentationStyle:2];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_dismissAboutSheet_];
  v10 = [(ProblemReportingAboutController *)v11 navigationItem];
  [v10 setRightBarButtonItem:v9];

  [(PUIProblemReportingController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)dismissAboutSheet:(id)a3
{
}

- (void)showAboutAnalyticsSheet
{
  id v3 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.analyticsdevice"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)showAboutIdentityVerificationDataSheet
{
  id v3 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.identity"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)showAboutImproveSiriAnalyticsSheet
{
  id OBPrivacyPresenterClass = getOBPrivacyPresenterClass();
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  id v4 = (void *)getOBPrivacyImproveSiriIdentifierSymbolLoc_ptr;
  uint64_t v12 = getOBPrivacyImproveSiriIdentifierSymbolLoc_ptr;
  if (!getOBPrivacyImproveSiriIdentifierSymbolLoc_ptr)
  {
    uint64_t v5 = (void *)OnBoardingKitLibrary();
    v10[3] = (uint64_t)dlsym(v5, "OBPrivacyImproveSiriIdentifier");
    getOBPrivacyImproveSiriIdentifierSymbolLoc_ptr = v10[3];
    id v4 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    uint64_t v8 = v7;
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  id v6 = [OBPrivacyPresenterClass presenterForPrivacySplashWithIdentifier:*v4];
  [v6 setPresentingViewController:self];
  [v6 present];
}

- (void)showAboutImproveAssistiveVoiceFeatures
{
  id v3 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.improveastvoice"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)showAboutiCloudAnalyticsSheet
{
  id v3 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.analyticsicloud"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)showAboutAppAnalyticsSheet
{
  id v3 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.analyticsapp"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)showAboutFitnessPlusDataSheet
{
  id OBPrivacyPresenterClass = getOBPrivacyPresenterClass();
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  id v4 = (void *)getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr_0;
  uint64_t v12 = getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr_0;
  if (!getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr_0)
  {
    uint64_t v5 = (void *)OnBoardingKitLibrary();
    v10[3] = (uint64_t)dlsym(v5, "OBPrivacyImproveFitnessPlusIdentifier");
    getOBPrivacyImproveFitnessPlusIdentifierSymbolLoc_ptr_0 = v10[3];
    id v4 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    uint64_t v8 = v7;
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  id v6 = [OBPrivacyPresenterClass presenterForPrivacySplashWithIdentifier:*v4];
  [v6 setPresentingViewController:self];
  [v6 present];
}

- (void)showAboutHealthDataSheet
{
  id v3 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.improvehealth"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)showAboutHealthRecordsDataSheet
{
  id v3 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.improvehealthrecords"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)showAboutWheelchairDataSheet
{
  id v3 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.wheelchairmode"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)showAboutHandwashingDataSheet
{
  id v3 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.improveHandwashing"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)showAboutSafetyDataSheet
{
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 1)
  {
    id v5 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.improveSafetyFeatures"];
    [v5 setPresentingViewController:self];
    [v5 present];
  }
}

- (void)showImproveARLocationAccuracyDataSheet
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v3 = (void *)getSFSafariViewControllerClass_softClass_0;
  v21 = (void *)getSFSafariViewControllerClass_softClass_0;
  if (!getSFSafariViewControllerClass_softClass_0)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __getSFSafariViewControllerClass_block_invoke_0;
    v16 = &unk_1E6E9C7F8;
    v17 = &v18;
    __getSFSafariViewControllerClass_block_invoke_0((uint64_t)&v13);
    id v3 = (void *)v19[3];
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v18, 8);
  id v5 = [v4 alloc];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  id v6 = (void (*)(void))getGEOVisualLocalizationCrowdsourcingLearnMoreURLSymbolLoc_ptr;
  v21 = getGEOVisualLocalizationCrowdsourcingLearnMoreURLSymbolLoc_ptr;
  if (!getGEOVisualLocalizationCrowdsourcingLearnMoreURLSymbolLoc_ptr)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __getGEOVisualLocalizationCrowdsourcingLearnMoreURLSymbolLoc_block_invoke;
    v16 = &unk_1E6E9C7F8;
    v17 = &v18;
    id v7 = (void *)GeoServicesLibrary();
    uint64_t v8 = dlsym(v7, "GEOVisualLocalizationCrowdsourcingLearnMoreURL");
    *(void *)(v17[1] + 24) = v8;
    getGEOVisualLocalizationCrowdsourcingLearnMoreURLSymbolLoc_ptr = *(_UNKNOWN **)(v17[1] + 24);
    id v6 = (void (*)(void))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v6)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    uint64_t v12 = v11;
    _Block_object_dispose(&v18, 8);
    _Unwind_Resume(v12);
  }
  uint64_t v9 = v6();
  v10 = (void *)[v5 initWithURL:v9];

  [v10 setModalPresentationStyle:2];
  [(PUIProblemReportingController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)setBoolValue:(BOOL)a3 forIdMSConfigKey:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F179C8] defaultStore];
  v10 = objc_msgSend(v9, "aa_primaryAppleAccount");
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = objc_msgSend(v10, "aa_altDSID");
    uint64_t v13 = @"0";
    if (v6) {
      uint64_t v13 = @"1";
    }
    uint64_t v14 = v13;
    id v15 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__PUIProblemReportingController_setBoolValue_forIdMSConfigKey_completion___block_invoke;
    v16[3] = &unk_1E6E9CBF0;
    id v17 = v7;
    id v18 = v8;
    [v15 setConfigurationInfo:v14 forIdentifier:v17 forAltDSID:v12 completion:v16];
  }
}

void __74__PUIProblemReportingController_setBoolValue_forIdMSConfigKey_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    BOOL v6 = [MEMORY[0x1E4FB16C8] currentDevice];
    int v7 = objc_msgSend(v6, "sf_isInternalInstall");

    id v8 = _PUILoggingFacility();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v9) {
        goto LABEL_11;
      }
      LOWORD(v15) = 0;
      v10 = "Successfully wrote analytics choice to IdMS";
      uint64_t v11 = v8;
      uint32_t v12 = 2;
      goto LABEL_10;
    }
    if (!v9) {
      goto LABEL_11;
    }
    uint64_t v13 = *(void **)(a1 + 32);
    int v15 = 138412290;
    id v16 = v13;
    v10 = "Successfully wrote analytics choice to IdMS for key %@";
  }
  else
  {
    id v8 = _PUILoggingFacility();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v15 = 138412290;
    id v16 = v5;
    v10 = "Failed to write analytics choice to IdMS, error: %@";
  }
  uint64_t v11 = v8;
  uint32_t v12 = 12;
LABEL_10:
  _os_log_impl(&dword_1E4AD5000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
LABEL_11:

  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v5);
  }
}

- (void)updateiCloudAnalyticsForSpecifierID:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F179C8] defaultStore];
  BOOL v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
  int v7 = v6;
  if (v6)
  {
    id v8 = objc_msgSend(v6, "aa_altDSID");
    id v9 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
    objc_initWeak(&location, self);
    v15[0] = @"com.apple.idms.config.privacy.icloud.data";
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__PUIProblemReportingController_updateiCloudAnalyticsForSpecifierID___block_invoke;
    v11[3] = &unk_1E6E9CC40;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    [v9 configurationInfoWithIdentifiers:v10 forAltDSID:v8 completion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __69__PUIProblemReportingController_updateiCloudAnalyticsForSpecifierID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__PUIProblemReportingController_updateiCloudAnalyticsForSpecifierID___block_invoke_2;
  v9[3] = &unk_1E6E9CC18;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = *(id *)(a1 + 32);
  id v11 = v6;
  id v12 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __69__PUIProblemReportingController_updateiCloudAnalyticsForSpecifierID___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained specifierForID:*(void *)(a1 + 32)];

  if (*(void *)(a1 + 40) || (id v6 = *(void **)(a1 + 48)) == 0)
  {
    id v5 = _PUILoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __69__PUIProblemReportingController_updateiCloudAnalyticsForSpecifierID___block_invoke_2_cold_1(v5);
    }
  }
  else
  {
    id v5 = [v6 objectForKeyedSubscript:@"com.apple.idms.config.privacy.icloud.data"];
    id v7 = _PUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "From idms: iCloud Analytics = %@", (uint8_t *)&v10, 0xCu);
    }

    id v8 = objc_loadWeakRetained(v2);
    [v8 setPreferenceValue:v5 specifier:v4];
  }
  id v9 = objc_loadWeakRetained(v2);
  [v9 reloadSpecifier:v4 animated:1];
}

- (id)problemReportingEnabled:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v4 = +[PUIProblemReportingController isProblemReportingEnabled];
  return (id)[v3 numberWithBool:v4];
}

- (void)setProblemReportingEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 BOOLValue];
  id v9 = [MEMORY[0x1E4F74230] sharedConnection];
  int v10 = [v9 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FB8]];

  id v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  int v12 = objc_msgSend(v11, "sf_isInternalInstall");

  if (v12) {
    BOOL v13 = v10 == 1;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13
    || (Boolean keyExistsAndHasValidFormat = 0,
        int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MCInternalOverrideDiagnosticEnforcement", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat), (v8 & 1) != 0)|| AppBooleanValue)
  {
    uint64_t v14 = [getNRPairedDeviceRegistryClass() sharedInstance];
    int v15 = [v14 isPaired];

    if (v15)
    {
      if (v8) {
        id v16 = @"DIAGNOSTICS_MIRRORED_ALERT_TITLE_ON";
      }
      else {
        id v16 = @"DIAGNOSTICS_MIRRORED_ALERT_TITLE_OFF";
      }
      uint64_t v17 = PUI_LocalizedStringForProblemReporting(v16);
      id v18 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v17 message:0 preferredStyle:1];
      v19 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v20 = PUI_LocalizedStringForProblemReporting(@"DIAGNOSTICS_MIRRORED_ALERT_CANCEL");
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __73__PUIProblemReportingController_setProblemReportingEnabled_forSpecifier___block_invoke_2;
      v34[3] = &unk_1E6E9CC68;
      v34[4] = self;
      id v35 = v7;
      v21 = [v19 actionWithTitle:v20 style:1 handler:v34];
      [v18 addAction:v21];

      v22 = (void *)MEMORY[0x1E4FB1410];
      v23 = PUI_LocalizedStringForProblemReporting(@"DIAGNOSTICS_MIRRORED_ALERT_OK");
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __73__PUIProblemReportingController_setProblemReportingEnabled_forSpecifier___block_invoke_3;
      v32[3] = &unk_1E6E9C730;
      v32[4] = self;
      char v33 = v8;
      v24 = [v22 actionWithTitle:v23 style:0 handler:v32];
      [v18 addAction:v24];

      [(PUIProblemReportingController *)self presentViewController:v18 animated:1 completion:0];
    }
    else
    {
      [(PUIProblemReportingController *)self setProblemReportingEnabled:v8];
      if (PUIIsUserParcElisabethEligible() && v8) {
        [(PUIProblemReportingController *)self setShouldShareAppActivityWithAppDevelopers:v6 specifier:v7];
      }
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1E4FB1418];
    v27 = PUI_LocalizedStringForProblemReporting(@"INTERNAL_DIAGNOSTICS_REQUIRED");
    v28 = [v26 alertControllerWithTitle:v27 message:0 preferredStyle:1];

    v29 = (void *)MEMORY[0x1E4FB1410];
    v30 = PUI_LocalizedStringForProblemReporting(@"INTERNAL_DIAGNOSTICS_REQUIRED_CONFIRMATION");
    v31 = [v29 actionWithTitle:v30 style:0 handler:0];
    [v28 addAction:v31];

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __73__PUIProblemReportingController_setProblemReportingEnabled_forSpecifier___block_invoke;
    v36[3] = &unk_1E6E9CBA0;
    v36[4] = self;
    id v37 = v7;
    [(PUIProblemReportingController *)self presentViewController:v28 animated:1 completion:v36];
  }
}

uint64_t __73__PUIProblemReportingController_setProblemReportingEnabled_forSpecifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

uint64_t __73__PUIProblemReportingController_setProblemReportingEnabled_forSpecifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

uint64_t __73__PUIProblemReportingController_setProblemReportingEnabled_forSpecifier___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setProblemReportingEnabled:*(unsigned __int8 *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 reloadSpecifiers];
}

- (void)setProblemReportingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F74230] sharedConnection];
  [v5 setBoolValue:v3 forSetting:*MEMORY[0x1E4F73FB8]];

  id v6 = [(PUIProblemReportingController *)self analyticsSpecifiersIncludingIndependentSpecifiers:v3 includeDependentSpecifiers:1];
  if (v3)
  {
    id v7 = [(PUIProblemReportingController *)self baseSpecifiers];
    uint64_t v8 = [v7 count];

    [(PUIProblemReportingController *)self beginUpdates];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__PUIProblemReportingController_setProblemReportingEnabled___block_invoke;
    v18[3] = &unk_1E6E9CC90;
    v18[4] = self;
    v18[5] = v8;
    [v6 enumerateObjectsUsingBlock:v18];
  }
  else
  {
    [(PUIProblemReportingController *)self beginUpdates];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = objc_msgSend(v6, "reverseObjectEnumerator", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [(PUIProblemReportingController *)self removeSpecifier:*(void *)(*((void *)&v14 + 1) + 8 * i) animated:1];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v11);
    }
  }
  [(PUIProblemReportingController *)self endUpdates];
}

void __60__PUIProblemReportingController_setProblemReportingEnabled___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x1E4F92F08]), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) insertSpecifier:v5 atIndex:*(void *)(a1 + 40) + a3 animated:1];
  }
}

- (void)snapshot:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v17 = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  id v6 = [(PUIProblemReportingController *)self spinnerSpecifier];
  long long v16 = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [(PUIProblemReportingController *)self replaceContiguousSpecifiers:v5 withSpecifiers:v7 animated:1];

  v15[0] = 0;
  if (!DiskSpaceDiagnosticsLibraryCore_frameworkLibrary)
  {
    v15[1] = MEMORY[0x1E4F143A8];
    void v15[2] = 3221225472;
    v15[3] = __DiskSpaceDiagnosticsLibraryCore_block_invoke;
    v15[4] = &__block_descriptor_40_e5_v8__0l;
    v15[5] = v15;
    long long v18 = xmmword_1E6E9D1B0;
    uint64_t v19 = 0;
    DiskSpaceDiagnosticsLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v8 = (void *)v15[0];
    if (DiskSpaceDiagnosticsLibraryCore_frameworkLibrary)
    {
      if (!v15[0]) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v13 = v15[0];
      uint64_t v8 = (void *)abort_report_np();
    }
    free(v8);
  }
LABEL_4:
  id v9 = objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1F40AAD68, v13);
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.FilesystemMetadataSnapshotService"];
  [v10 setRemoteObjectInterface:v9];
  [v10 resume];
  uint64_t v11 = [v10 remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__PUIProblemReportingController_snapshot___block_invoke;
  v14[3] = &unk_1E6E9CCE0;
  v14[4] = self;
  id v12 = (id)[v11 generateFilesystemMetadataSnapshotWithOptions:0 reply:v14];
}

void __42__PUIProblemReportingController_snapshot___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    NSLog(&cfstr_FailedToSnapsh.isa, a3);
    id v4 = @"FILESYSTEM_METADATA_SNAPSHOT_FAIL_MESSAGE";
    id v5 = @"FILESYSTEM_METADATA_SNAPSHOT_FAIL_TITLE";
  }
  else
  {
    id v4 = @"FILESYSTEM_METADATA_SNAPSHOT_SUCCESS_MESSAGE";
    id v5 = @"FILESYSTEM_METADATA_SNAPSHOT_SUCCESS_TITLE";
  }
  id v6 = PUI_LocalizedStringForProblemReporting(v5);
  id v7 = PUI_LocalizedStringForProblemReporting(v4);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PUIProblemReportingController_snapshot___block_invoke_2;
  block[3] = &unk_1E6E9CCB8;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = *(void *)(a1 + 32);
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __42__PUIProblemReportingController_snapshot___block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) preferredStyle:1];
  BOOL v3 = (void *)MEMORY[0x1E4FB1410];
  id v4 = PUI_LocalizedStringForProblemReporting(@"OK");
  id v5 = [v3 actionWithTitle:v4 style:0 handler:0];
  [v2 addAction:v5];

  [*(id *)(a1 + 48) presentViewController:v2 animated:1 completion:0];
  id v6 = *(void **)(a1 + 48);
  id v7 = [v6 spinnerSpecifier];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v9 = [*(id *)(a1 + 48) filesystemMetadataSnapshotSpecifier];
  id v11 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [v6 replaceContiguousSpecifiers:v8 withSpecifiers:v10 animated:1];
}

- (NSArray)baseSpecifiers
{
  baseSpecifiers = self->_baseSpecifiers;
  if (baseSpecifiers) {
    goto LABEL_21;
  }
  id v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  if (PUIIsUserParcElisabethEligible()) {
    id v6 = @"PROBLEM_REPORTING_EXPLANATION_ALT";
  }
  else {
    id v6 = @"PROBLEM_REPORTING_EXPLANATION";
  }
  id v7 = PUI_LocalizedStringForProblemReporting(v6);
  uint64_t v8 = PUI_LocalizedStringForProblemReporting(@"ABOUT_DIAGNOSTICS_LINK");
  id v9 = objc_msgSend(NSString, "stringWithFormat:", v7, v8);
  [v5 setIdentifier:@"PROBLEM_REPORTING_GROUP"];
  uint64_t v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  [v5 setProperty:v11 forKey:*MEMORY[0x1E4F93140]];

  [v5 setProperty:v9 forKey:*MEMORY[0x1E4F93160]];
  id v35 = v9;
  v36 = (void *)v8;
  v38.id location = [v9 rangeOfString:v8];
  id v12 = NSStringFromRange(v38);
  [v5 setProperty:v12 forKey:*MEMORY[0x1E4F93150]];

  uint64_t v13 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
  [v5 setProperty:v13 forKey:*MEMORY[0x1E4F93158]];

  [v5 setProperty:@"showAboutAnalyticsSheet" forKey:*MEMORY[0x1E4F93148]];
  [(NSArray *)v4 addObject:v5];
  long long v14 = [getNRPairedDeviceRegistryClass() sharedInstance];
  LODWORD(v9) = [v14 isPaired];

  if (v9) {
    long long v15 = @"SHARE_ANALYTICS_WATCH_IPHONE";
  }
  else {
    long long v15 = @"SHARE_ANALYTICS";
  }
  uint64_t v16 = PUI_LocalizedStringForProblemReporting(v15);
  id v17 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v16 target:self set:sel_setProblemReportingEnabled_forSpecifier_ get:sel_problemReportingEnabled_ detail:0 cell:6 edit:0];
  [(NSArray *)v4 addObject:v17];
  long long v18 = [MEMORY[0x1E4F74230] sharedConnection];
  if ([v18 isBoolSettingLockedDownByRestrictions:*MEMORY[0x1E4F73FB8]])
  {
    int v19 = 0;
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F74230] sharedConnection];
    int v19 = [v20 isDiagnosticSubmissionModificationAllowed];
  }
  v21 = [MEMORY[0x1E4FB16C8] currentDevice];
  v34 = (void *)v16;
  if ((objc_msgSend(v21, "sf_isInternalInstall") & 1) == 0 && !v19)
  {

    unint64_t v22 = 0x1E4F92000;
LABEL_15:
    v24 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
    [v17 setProperty:v24 forKey:*MEMORY[0x1E4F93130]];

    goto LABEL_16;
  }
  char v23 = PSIsInEDUMode();

  unint64_t v22 = 0x1E4F92000uLL;
  if (v23) {
    goto LABEL_15;
  }
LABEL_16:
  if ((PSIsRunningInAssistant() & 1) == 0)
  {
    char v33 = v7;
    v25 = PUI_LocalizedStringForProblemReporting(@"DIAGNOSTIC_USAGE_DATA");
    v26 = [*(id *)(v22 + 3696) preferenceSpecifierNamed:v25 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    [v26 setIdentifier:@"DIAGNOSTIC_USAGE_DATA"];
    [v26 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F931F8]];
    [(NSArray *)v4 addObject:v26];
    v27 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v28 = [v27 BOOLForKey:@"FilesystemMetadataSnapshotEnabled"];

    if (v28)
    {
      v29 = [*(id *)(v22 + 3696) emptyGroupSpecifier];
      [(NSArray *)v4 addObject:v29];
      v30 = [(PUIProblemReportingController *)self filesystemMetadataSnapshotSpecifier];
      [(NSArray *)v4 addObject:v30];
    }
    id v7 = v33;
  }
  v31 = self->_baseSpecifiers;
  self->_baseSpecifiers = v4;

  baseSpecifiers = self->_baseSpecifiers;
LABEL_21:
  return baseSpecifiers;
}

- (PSSpecifier)spinnerSpecifier
{
  spinnerSpecifier = self->_spinnerSpecifier;
  if (!spinnerSpecifier)
  {
    id v4 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:&stru_1F4072988 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    id v5 = self->_spinnerSpecifier;
    self->_spinnerSpecifier = v4;

    [(PSSpecifier *)self->_spinnerSpecifier setProperty:@"SPINNER_CELL" forKey:*MEMORY[0x1E4F93188]];
    spinnerSpecifier = self->_spinnerSpecifier;
  }
  return spinnerSpecifier;
}

- (PSSpecifier)filesystemMetadataSnapshotSpecifier
{
  filesystemMetadataSnapshotSpecifier = self->_filesystemMetadataSnapshotSpecifier;
  if (!filesystemMetadataSnapshotSpecifier)
  {
    id v4 = (void *)MEMORY[0x1E4F92E70];
    id v5 = PUI_LocalizedStringForProblemReporting(@"FILESYSTEM_METADATA_SNAPSHOT");
    id v6 = [v4 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:13 edit:0];
    id v7 = self->_filesystemMetadataSnapshotSpecifier;
    self->_filesystemMetadataSnapshotSpecifier = v6;

    [(PSSpecifier *)self->_filesystemMetadataSnapshotSpecifier setButtonAction:sel_snapshot_];
    filesystemMetadataSnapshotSpecifier = self->_filesystemMetadataSnapshotSpecifier;
  }
  return filesystemMetadataSnapshotSpecifier;
}

- (BOOL)isAppAndAccessoryAnalyticsAllowedFeatureEnabled
{
  return 0;
}

- (NSArray)appActivitySpecifiers
{
  v25[2] = *MEMORY[0x1E4F143B8];
  if (self->_appActivitySpecifiers || (PUIIsUserParcElisabethEligible() & 1) != 0) {
    goto LABEL_12;
  }
  if ([(PUIProblemReportingController *)self isAppAndAccessoryAnalyticsAllowedFeatureEnabled])
  {
    BOOL v3 = [MEMORY[0x1E4F74230] sharedConnection];
    if ([v3 hasAppAndAccessoryAnalyticsAllowedBeenSet])
    {

LABEL_8:
      id v6 = @"ABOUT_APP_AND_ACCESSORY_ANALYTICS_LINK";
      id v7 = @"APP_AND_ACCESSORY_ANALYTICS_EXPLANATION";
      uint64_t v8 = @"SHARE_WITH_DEVELOPERS";
      goto LABEL_9;
    }
    id v4 = [MEMORY[0x1E4F74230] sharedConnection];
    char v5 = [v4 isAppAnalyticsAllowed];

    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
  }
  id v6 = @"ABOUT_APP_ANALYTICS_LINK";
  id v7 = @"APP_ANALYTICS_EXPLANATION";
  uint64_t v8 = @"SHARE_WITH_APP_DEVELOPERS";
LABEL_9:
  id v9 = PUI_LocalizedStringForProblemReporting(v8);
  uint64_t v10 = PUI_LocalizedStringForProblemReporting(v7);
  id v11 = PUI_LocalizedStringForProblemReporting(v6);
  id v12 = objc_msgSend(NSString, "stringWithFormat:", v10, v11);
  uint64_t v13 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"APP_ACTIVITY_GROUP"];
  long long v14 = (objc_class *)objc_opt_class();
  long long v15 = NSStringFromClass(v14);
  [v13 setProperty:v15 forKey:*MEMORY[0x1E4F93140]];

  [v13 setProperty:v12 forKey:*MEMORY[0x1E4F93160]];
  v27.id location = [v12 rangeOfString:v11];
  uint64_t v16 = NSStringFromRange(v27);
  [v13 setProperty:v16 forKey:*MEMORY[0x1E4F93150]];

  id v17 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
  [v13 setProperty:v17 forKey:*MEMORY[0x1E4F93158]];

  [v13 setProperty:@"showAboutAppAnalyticsSheet" forKey:*MEMORY[0x1E4F93148]];
  long long v18 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v9 target:self set:sel_setShouldShareAppActivityWithAppDevelopers_specifier_ get:sel_shouldShareAppActivityWithAppDevelopers detail:0 cell:6 edit:0];
  [v18 setProperty:@"SHARE_WITH_APP_DEVELOPERS" forKey:*MEMORY[0x1E4F93188]];
  int v19 = [MEMORY[0x1E4F74230] sharedConnection];
  char v20 = [v19 isDiagnosticSubmissionModificationAllowed];

  if ((v20 & 1) == 0) {
    [v18 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
  }
  v25[0] = v13;
  v25[1] = v18;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  appActivitySpecifiers = self->_appActivitySpecifiers;
  self->_appActivitySpecifiers = v21;

LABEL_12:
  char v23 = self->_appActivitySpecifiers;
  return v23;
}

- (AFSettingsConnection)assistantSettingsConnection
{
  assistantSettingsConnection = self->_assistantSettingsConnection;
  if (!assistantSettingsConnection)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getAFSettingsConnectionClass_softClass;
    uint64_t v13 = getAFSettingsConnectionClass_softClass;
    if (!getAFSettingsConnectionClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getAFSettingsConnectionClass_block_invoke;
      v9[3] = &unk_1E6E9C7F8;
      void v9[4] = &v10;
      __getAFSettingsConnectionClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    char v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = (AFSettingsConnection *)objc_alloc_init(v5);
    id v7 = self->_assistantSettingsConnection;
    self->_assistantSettingsConnection = v6;

    assistantSettingsConnection = self->_assistantSettingsConnection;
  }
  return assistantSettingsConnection;
}

- (id)getCurrentImproveSiriAndDictationValueForSpecifier:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F74230] sharedConnection];
  char v6 = [v5 isOnDeviceOnlyDictationForced];

  id v7 = (void *)MEMORY[0x1E4F1CC28];
  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    id v9 = [(PUIProblemReportingController *)self assistantSettingsConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __84__PUIProblemReportingController_getCurrentImproveSiriAndDictationValueForSpecifier___block_invoke;
    void v12[3] = &unk_1E6E9CD08;
    objc_copyWeak(&v15, &location);
    long long v14 = &v16;
    uint64_t v10 = v8;
    uint64_t v13 = v10;
    [v9 getSiriDataSharingOptInStatusWithCompletion:v12];

    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (v17[3] == 1) {
      id v7 = (void *)MEMORY[0x1E4F1CC38];
    }

    objc_destroyWeak(&v15);
    _Block_object_dispose(&v16, 8);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __84__PUIProblemReportingController_getCurrentImproveSiriAndDictationValueForSpecifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    char v6 = _PUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __84__PUIProblemReportingController_getCurrentImproveSiriAndDictationValueForSpecifier___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setImproveSiriAndDictationValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  int v8 = [v6 BOOLValue];
  id v9 = [(PUIProblemReportingController *)self assistantSettingsConnection];
  if (v8) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __75__PUIProblemReportingController_setImproveSiriAndDictationValue_specifier___block_invoke;
  void v12[3] = &unk_1E6E9CD58;
  objc_copyWeak(&v14, &location);
  id v11 = v6;
  id v13 = v11;
  [v9 setSiriDataSharingOptInStatus:v10 propagateToHomeAccessories:0 source:7 reason:@"Privacy" completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __75__PUIProblemReportingController_setImproveSiriAndDictationValue_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PUIProblemReportingController_setImproveSiriAndDictationValue_specifier___block_invoke_2;
  block[3] = &unk_1E6E9CD30;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __75__PUIProblemReportingController_setImproveSiriAndDictationValue_specifier___block_invoke_2(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = _PUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __75__PUIProblemReportingController_setImproveSiriAndDictationValue_specifier___block_invoke_2_cold_1(a1, v2, v3);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained reloadSpecifierID:@"IMPROVE_SIRI"];
}

- (void)setImproveAssistiveVoiceValue:(id)a3 specifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue];
  MEMORY[0x1F4178EF8](v4);
}

- (id)getImproveAssistiveVoiceValueForSpecifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = _AXSAudioDonationSiriImprovementEnabled();
  return (id)[v3 numberWithUnsignedChar:v4];
}

- (id)analyticsSpecifiersIncludingIndependentSpecifiers:(BOOL)a3 includeDependentSpecifiers:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if (MGGetBoolAnswer()) {
    int v8 = MGGetBoolAnswer() ^ 1;
  }
  else {
    LOBYTE(v8) = 1;
  }
  int v9 = MGGetBoolAnswer();
  if (v5)
  {
    v26 = [(PUIProblemReportingController *)self iCloudSpecifiers];
    [v7 addObjectsFromArray:v26];

    if (!v4)
    {
LABEL_6:
      if (!v5) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if (!v4)
  {
    goto LABEL_6;
  }
  NSRange v27 = [MEMORY[0x1E4F74230] sharedConnection];
  char v28 = [v27 isBoolSettingLockedDownByRestrictions:*MEMORY[0x1E4F73EE8]];

  if ((v28 & 1) == 0 && (PUIIsUserParcElisabethEligible() & 1) == 0)
  {
    v29 = [(PUIProblemReportingController *)self appActivitySpecifiers];
    [v7 addObjectsFromArray:v29];
  }
  v30 = [(PUIProblemReportingController *)self automatedFeedbackSpecifiers];
  [v7 addObjectsFromArray:v30];

  if (v5)
  {
LABEL_7:
    uint64_t v10 = [(PUIProblemReportingController *)self bankConnectDataSpecifiers];
    [v7 addObjectsFromArray:v10];

    id v11 = [(PUIProblemReportingController *)self fitnessPlusDataSpecifiers];
    [v7 addObjectsFromArray:v11];
  }
LABEL_8:
  char v12 = !v4 | v8;
  if ((v12 & 1) == 0)
  {
    id v13 = [(PUIProblemReportingController *)self handwashingDataSpecifiers];
    [v7 addObjectsFromArray:v13];
  }
  if ((v4 & v9) == 1)
  {
    id v14 = [(PUIProblemReportingController *)self healthDataSpecifiers];
    [v7 addObjectsFromArray:v14];
  }
  if (v4)
  {
    id v15 = [(PUIProblemReportingController *)self identityVerificationDataSpecifiers];
    [v7 addObjectsFromArray:v15];

    uint64_t v16 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v17 = [v16 userInterfaceIdiom];

    if (v17 != 1)
    {
      uint64_t v18 = [(PUIProblemReportingController *)self safetyDataSpecifiers];
      [v7 addObjectsFromArray:v18];
    }
  }
  if (v5)
  {
    uint64_t v19 = [(PUIProblemReportingController *)self improveSiriSpecifiers];
    [v7 addObjectsFromArray:v19];

    char v20 = [(PUIProblemReportingController *)self improveAssistiveVoiceSpecifiers];
    [v7 addObjectsFromArray:v20];
  }
  if ((v12 & 1) == 0)
  {
    v21 = [(PUIProblemReportingController *)self wheelchairDataSpecifiers];
    [v7 addObjectsFromArray:v21];
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  unint64_t v22 = (unsigned int (*)(void))getGEOVisualLocalizationCrowdsourcingIsSupportedSymbolLoc_ptr;
  v36 = getGEOVisualLocalizationCrowdsourcingIsSupportedSymbolLoc_ptr;
  if (!getGEOVisualLocalizationCrowdsourcingIsSupportedSymbolLoc_ptr)
  {
    char v23 = (void *)GeoServicesLibrary();
    v34[3] = (uint64_t)dlsym(v23, "GEOVisualLocalizationCrowdsourcingIsSupported");
    getGEOVisualLocalizationCrowdsourcingIsSupportedSymbolLoc_ptr = (_UNKNOWN *)v34[3];
    unint64_t v22 = (unsigned int (*)(void))v34[3];
  }
  _Block_object_dispose(&v33, 8);
  if (!v22)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    v32 = v31;
    _Block_object_dispose(&v33, 8);
    _Unwind_Resume(v32);
  }
  if (v22())
  {
    v24 = [(PUIProblemReportingController *)self improveARLocationAccuracySpecifiers];
    [v7 addObjectsFromArray:v24];
  }
  return v7;
}

- (void)setShouldShareiCloudAnalytics:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [v6 BOOLValue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PUIProblemReportingController_setShouldShareiCloudAnalytics_specifier___block_invoke;
  v11[3] = &unk_1E6E9CD80;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(PUIProblemReportingController *)self setBoolValue:v8 forIdMSConfigKey:@"com.apple.idms.config.privacy.icloud.data" completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __73__PUIProblemReportingController_setShouldShareiCloudAnalytics_specifier___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (a2) {
    [WeakRetained setPreferenceValue:*(void *)(a1 + 32) specifier:*(void *)(a1 + 40)];
  }
  else {
    [WeakRetained reloadSpecifier:*(void *)(a1 + 40) animated:1];
  }
}

- (BOOL)shouldShowiCloudSpecifiersForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = [v5 objectForKey:@"shouldShowiCloudSpecifiers"];

  if (v6) {
    char v7 = [v6 BOOLValue];
  }
  else {
    char v7 = 1;
  }
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  if (v4)
  {
    uint64_t v8 = objc_msgSend(v4, "aa_altDSID");
    getAKAppleIDAuthenticationControllerClass();
    id v9 = objc_opt_new();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__PUIProblemReportingController_shouldShowiCloudSpecifiersForAccount___block_invoke;
    v11[3] = &unk_1E6E9CDA8;
    id v13 = self;
    id v14 = v16;
    char v15 = v7;
    id v12 = @"shouldShowiCloudSpecifiers";
    [v9 fetchUserInformationForAltDSID:v8 completion:v11];
  }
  _Block_object_dispose(v16, 8);

  return v7;
}

void __70__PUIProblemReportingController_shouldShowiCloudSpecifiersForAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v7 = (void *)getAKAuthenticationSecurityLevelKeySymbolLoc_ptr;
  uint64_t v34 = getAKAuthenticationSecurityLevelKeySymbolLoc_ptr;
  if (!getAKAuthenticationSecurityLevelKeySymbolLoc_ptr)
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    char v28 = __getAKAuthenticationSecurityLevelKeySymbolLoc_block_invoke;
    v29 = &unk_1E6E9C7F8;
    v30 = &v31;
    uint64_t v8 = (void *)AuthKitLibrary_0();
    v32[3] = (uint64_t)dlsym(v8, "AKAuthenticationSecurityLevelKey");
    getAKAuthenticationSecurityLevelKeySymbolLoc_ptr = *(void *)(v30[1] + 24);
    char v7 = (void *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v7)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
LABEL_25:
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    goto LABEL_26;
  }
  id v9 = [v5 objectForKey:*v7];
  uint64_t v10 = [v9 integerValue];

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  id v11 = (void *)getAKAuthenticationIsUnderageKeySymbolLoc_ptr;
  uint64_t v34 = getAKAuthenticationIsUnderageKeySymbolLoc_ptr;
  if (!getAKAuthenticationIsUnderageKeySymbolLoc_ptr)
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    char v28 = __getAKAuthenticationIsUnderageKeySymbolLoc_block_invoke;
    v29 = &unk_1E6E9C7F8;
    v30 = &v31;
    id v12 = (void *)AuthKitLibrary_0();
    v32[3] = (uint64_t)dlsym(v12, "AKAuthenticationIsUnderageKey");
    getAKAuthenticationIsUnderageKeySymbolLoc_ptr = *(void *)(v30[1] + 24);
    id v11 = (void *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v11) {
    goto LABEL_25;
  }
  id v13 = [v5 objectForKey:*v11];
  char v14 = [v13 BOOLValue];

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v15 = (void *)getAKAuthenticationIsLegacyStudentKeySymbolLoc_ptr;
  uint64_t v34 = getAKAuthenticationIsLegacyStudentKeySymbolLoc_ptr;
  if (!getAKAuthenticationIsLegacyStudentKeySymbolLoc_ptr)
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    char v28 = __getAKAuthenticationIsLegacyStudentKeySymbolLoc_block_invoke;
    v29 = &unk_1E6E9C7F8;
    v30 = &v31;
    uint64_t v16 = (void *)AuthKitLibrary_0();
    v32[3] = (uint64_t)dlsym(v16, "AKAuthenticationIsLegacyStudentKey");
    getAKAuthenticationIsLegacyStudentKeySymbolLoc_ptr = *(void *)(v30[1] + 24);
    char v15 = (void *)v32[3];
  }
  _Block_object_dispose(&v31, 8);
  if (!v15)
  {
LABEL_26:
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    v24 = v23;
    _Block_object_dispose(&v31, 8);
    _Unwind_Resume(v24);
  }
  char v17 = [v5 objectForKey:*v15];
  char v18 = [v17 BOOLValue];

  char v19 = 0;
  if (v10 == 5) {
    char v20 = 1;
  }
  else {
    char v20 = v14;
  }
  if ((v20 & 1) == 0 && (v18 & 1) == 0)
  {
    if (v5) {
      BOOL v21 = v6 == 0;
    }
    else {
      BOOL v21 = 0;
    }
    char v19 = v21;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v19;
  unint64_t v22 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v22 setBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) forKey:*(void *)(a1 + 32)];

  if (*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != *(unsigned __int8 *)(a1 + 56))
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__PUIProblemReportingController_shouldShowiCloudSpecifiersForAccount___block_invoke_2;
    void v25[3] = &unk_1E6E9C758;
    v25[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v25);
  }
}

uint64_t __70__PUIProblemReportingController_shouldShowiCloudSpecifiersForAccount___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (NSArray)improveSiriSpecifiers
{
  v20[2] = *MEMORY[0x1E4F143B8];
  improveSiriSpecifiers = self->_improveSiriSpecifiers;
  if (!improveSiriSpecifiers)
  {
    id v4 = PUI_LocalizedStringForProblemReporting(@"IMPROVE_SIRI_EXPLANATION");
    id v5 = PUI_LocalizedStringForProblemReporting(@"ABOUT_IMPROVE_SIRI");
    id v6 = objc_msgSend(NSString, "stringWithFormat:", v4, v5);
    char v7 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"IMPROVE_SIRI_GROUP"];
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 setProperty:v9 forKey:*MEMORY[0x1E4F93140]];

    [v7 setProperty:v6 forKey:*MEMORY[0x1E4F93160]];
    v22.id location = [v6 rangeOfString:v5];
    uint64_t v10 = NSStringFromRange(v22);
    [v7 setProperty:v10 forKey:*MEMORY[0x1E4F93150]];

    id v11 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v7 setProperty:v11 forKey:*MEMORY[0x1E4F93158]];

    id v12 = NSStringFromSelector(sel_showAboutImproveSiriAnalyticsSheet);
    [v7 setProperty:v12 forKey:*MEMORY[0x1E4F93148]];

    id v13 = (void *)MEMORY[0x1E4F92E70];
    char v14 = PUI_LocalizedStringForProblemReporting(@"IMPROVE_SIRI");
    char v15 = [v13 preferenceSpecifierNamed:v14 target:self set:sel_setImproveSiriAndDictationValue_specifier_ get:sel_getCurrentImproveSiriAndDictationValueForSpecifier_ detail:0 cell:6 edit:0];

    [v15 setIdentifier:@"IMPROVE_SIRI"];
    uint64_t v16 = [MEMORY[0x1E4F74230] sharedConnection];
    LODWORD(v14) = [v16 isOnDeviceOnlyDictationForced];

    if (v14) {
      [v15 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F93130]];
    }
    v20[0] = v7;
    v20[1] = v15;
    char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    char v18 = self->_improveSiriSpecifiers;
    self->_improveSiriSpecifiers = v17;

    improveSiriSpecifiers = self->_improveSiriSpecifiers;
  }
  return improveSiriSpecifiers;
}

- (NSArray)improveAssistiveVoiceSpecifiers
{
  v19[2] = *MEMORY[0x1E4F143B8];
  improveAssistiveVoiceSpecifiers = self->_improveAssistiveVoiceSpecifiers;
  if (!improveAssistiveVoiceSpecifiers)
  {
    id v4 = PUI_LocalizedStringForProblemReporting(@"IMPROVE_ASSISTIVE_VOICE_EXPLANATION");
    id v5 = PUI_LocalizedStringForProblemReporting(@"ABOUT_IMPROVE_ASSISTIVE_VOICE");
    id v6 = objc_msgSend(NSString, "stringWithFormat:", v4, v5);
    char v7 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"IMPROVE_SIRI_GROUP"];
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 setProperty:v9 forKey:*MEMORY[0x1E4F93140]];

    [v7 setProperty:v6 forKey:*MEMORY[0x1E4F93160]];
    v21.id location = [v6 rangeOfString:v5];
    uint64_t v10 = NSStringFromRange(v21);
    [v7 setProperty:v10 forKey:*MEMORY[0x1E4F93150]];

    id v11 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v7 setProperty:v11 forKey:*MEMORY[0x1E4F93158]];

    id v12 = NSStringFromSelector(sel_showAboutImproveAssistiveVoiceFeatures);
    [v7 setProperty:v12 forKey:*MEMORY[0x1E4F93148]];

    id v13 = (void *)MEMORY[0x1E4F92E70];
    char v14 = PUI_LocalizedStringForProblemReporting(@"IMPROVE_ASSISTIVE_VOICE");
    char v15 = [v13 preferenceSpecifierNamed:v14 target:self set:sel_setImproveAssistiveVoiceValue_specifier_ get:sel_getImproveAssistiveVoiceValueForSpecifier_ detail:0 cell:6 edit:0];

    [v15 setIdentifier:@"IMPROVE_ASSISTIVE_VOICE"];
    v19[0] = v7;
    v19[1] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    char v17 = self->_improveAssistiveVoiceSpecifiers;
    self->_improveAssistiveVoiceSpecifiers = v16;

    improveAssistiveVoiceSpecifiers = self->_improveAssistiveVoiceSpecifiers;
  }
  return improveAssistiveVoiceSpecifiers;
}

- (id)iCloudSpecifiers
{
  v23[2] = *MEMORY[0x1E4F143B8];
  iCloudSpecifiers = self->_iCloudSpecifiers;
  if (iCloudSpecifiers)
  {
LABEL_2:
    id v3 = iCloudSpecifiers;
    goto LABEL_10;
  }
  id v5 = [MEMORY[0x1E4F179C8] defaultStore];
  id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
  if (v6
    && (PSUsedByManagedAccount() & 1) == 0
    && [(PUIProblemReportingController *)self shouldShowiCloudSpecifiersForAccount:v6])
  {
    uint64_t v7 = PUI_LocalizedStringForProblemReporting(@"ICLOUD_ANALYTICS_EXPLANATION");
    uint64_t v8 = PUI_LocalizedStringForProblemReporting(@"ABOUT_ICLOUD_ANALYTICS_LINK");
    NSRange v22 = (void *)v7;
    id v9 = objc_msgSend(NSString, "stringWithFormat:", v7, v8);
    uint64_t v10 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"ICLOUD_GROUP"];
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [v10 setProperty:v12 forKey:*MEMORY[0x1E4F93140]];

    [v10 setProperty:v9 forKey:*MEMORY[0x1E4F93160]];
    v25.id location = [v9 rangeOfString:v8];
    id v13 = NSStringFromRange(v25);
    [v10 setProperty:v13 forKey:*MEMORY[0x1E4F93150]];

    char v14 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v10 setProperty:v14 forKey:*MEMORY[0x1E4F93158]];

    [v10 setProperty:@"showAboutiCloudAnalyticsSheet" forKey:*MEMORY[0x1E4F93148]];
    char v15 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v16 = PUI_LocalizedStringForProblemReporting(@"SHARE_ICLOUD_ANALYTICS");
    char v17 = [v15 preferenceSpecifierNamed:v16 target:self set:sel_setShouldShareiCloudAnalytics_specifier_ get:sel_shouldShareiCloudAnalytics_ detail:0 cell:6 edit:0];

    [v17 setProperty:@"SHARE_ICLOUD_ANALYTICS" forKey:*MEMORY[0x1E4F93188]];
    [v17 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93110]];
    [v17 setProperty:@"com.apple.Preferences" forKey:*MEMORY[0x1E4F93118]];
    [v17 setProperty:@"AllowiCloudAnalytics" forKey:*MEMORY[0x1E4F931B0]];
    char v18 = [MEMORY[0x1E4F74230] sharedConnection];
    LOBYTE(v16) = [v18 isDiagnosticSubmissionModificationAllowed];

    if ((v16 & 1) == 0) {
      [v17 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
    }
    v23[0] = v10;
    v23[1] = v17;
    char v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    char v20 = self->_iCloudSpecifiers;
    self->_iCloudSpecifiers = v19;

    iCloudSpecifiers = self->_iCloudSpecifiers;
    goto LABEL_2;
  }

  id v3 = 0;
LABEL_10:
  return v3;
}

- (NSArray)automatedFeedbackSpecifiers
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)automatedFeedbackLinkTapped
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://www.apple.com/legal/privacy"];
  [v3 openURL:v2 configuration:0 completionHandler:0];
}

- (id)automatedFeedbackEnabled:(id)a3
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.symptomsd-diag"];
  id v4 = [v3 valueForKey:@"autoFeedbackAssistantEnable"];

  return v4;
}

- (void)setAutomatedFeedbackEnabled:(id)a3 specifier:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithSuiteName:@"com.apple.symptomsd-diag"];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setBool:v6 forKey:@"autoFeedbackAssistantEnable"];
}

- (NSArray)fitnessPlusDataSpecifiers
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if ([(PUIProblemReportingController *)self shouldShowFitnessPlusSpecifiers])
  {
    fitnessPlusDataSpecifiers = self->_fitnessPlusDataSpecifiers;
    if (!fitnessPlusDataSpecifiers)
    {
      id v4 = PUI_LocalizedStringForProblemReporting(@"FITNESS_PLUS_DATA_EXPLANATION");
      id v5 = PUI_LocalizedStringForProblemReporting(@"FITNESS_PLUS_DATA_LINK");
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", v4, v5);
      id v7 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"FITNESS_PLUS_DATA_GROUP"];
      uint64_t v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      [v7 setProperty:v9 forKey:*MEMORY[0x1E4F93140]];

      [v7 setProperty:v6 forKey:*MEMORY[0x1E4F93160]];
      v21.id location = [v6 rangeOfString:v5];
      uint64_t v10 = NSStringFromRange(v21);
      [v7 setProperty:v10 forKey:*MEMORY[0x1E4F93150]];

      id v11 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
      [v7 setProperty:v11 forKey:*MEMORY[0x1E4F93158]];

      [v7 setProperty:@"showAboutFitnessPlusDataSheet" forKey:*MEMORY[0x1E4F93148]];
      id v12 = (void *)MEMORY[0x1E4F92E70];
      id v13 = PUI_LocalizedStringForProblemReporting(@"SHARE_FITNESS_PLUS_DATA");
      char v14 = [v12 preferenceSpecifierNamed:v13 target:self set:sel_setShouldShareFitnessPlusData_specifier_ get:sel_shouldShareFitnessPlusDataForSpecifier_ detail:0 cell:6 edit:0];

      [v14 setProperty:@"SHARE_FITNESS_PLUS_DATA" forKey:*MEMORY[0x1E4F93188]];
      v19[0] = v7;
      v19[1] = v14;
      char v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      uint64_t v16 = self->_fitnessPlusDataSpecifiers;
      self->_fitnessPlusDataSpecifiers = v15;

      fitnessPlusDataSpecifiers = self->_fitnessPlusDataSpecifiers;
    }
    char v17 = fitnessPlusDataSpecifiers;
  }
  else
  {
    char v17 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v17;
}

- (CIDVUIIdentityProofingDataSharingFlowManager)identityProofingDataSharingManager
{
  identityProofingDataSharingManager = self->_identityProofingDataSharingManager;
  if (!identityProofingDataSharingManager)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getCIDVUIIdentityProofingDataSharingFlowManagerClass_softClass;
    uint64_t v13 = getCIDVUIIdentityProofingDataSharingFlowManagerClass_softClass;
    if (!getCIDVUIIdentityProofingDataSharingFlowManagerClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getCIDVUIIdentityProofingDataSharingFlowManagerClass_block_invoke;
      v9[3] = &unk_1E6E9C7F8;
      void v9[4] = &v10;
      __getCIDVUIIdentityProofingDataSharingFlowManagerClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    uint64_t v6 = (CIDVUIIdentityProofingDataSharingFlowManager *)objc_alloc_init(v5);
    id v7 = self->_identityProofingDataSharingManager;
    self->_identityProofingDataSharingManager = v6;

    identityProofingDataSharingManager = self->_identityProofingDataSharingManager;
  }
  return identityProofingDataSharingManager;
}

- (id)shouldShareIdentityVerificationData:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", a3);
  uint64_t v5 = [v4 BOOLForKey:@"shouldShareIdentityVerificationData"];

  uint64_t v6 = [(PUIProblemReportingController *)self identityProofingDataSharingManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__PUIProblemReportingController_shouldShareIdentityVerificationData___block_invoke;
  v9[3] = &unk_1E6E9CDD0;
  char v12 = v5;
  uint64_t v10 = @"shouldShareIdentityVerificationData";
  id v11 = self;
  [v6 fetchUserConsent:v9];

  id v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];

  return v7;
}

void __69__PUIProblemReportingController_shouldShareIdentityVerificationData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 setBool:0 forKey:*(void *)(a1 + 32)];
  }
  else if (*(unsigned char *)(a1 + 48) != (a2 == 0))
  {
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v7 setBool:a2 == 0 forKey:*(void *)(a1 + 32)];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PUIProblemReportingController_shouldShareIdentityVerificationData___block_invoke_2;
    block[3] = &unk_1E6E9C758;
    void block[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __69__PUIProblemReportingController_shouldShareIdentityVerificationData___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (BOOL)shouldShowIdentityVerificationSpecifiers
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"shouldShowIdentityVerificationSpecifiers"];

  id v5 = [(PUIProblemReportingController *)self identityProofingDataSharingManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PUIProblemReportingController_shouldShowIdentityVerificationSpecifiers__block_invoke;
  v7[3] = &unk_1E6E9CDF8;
  char v10 = v4;
  uint64_t v8 = @"shouldShowIdentityVerificationSpecifiers";
  id v9 = self;
  [v5 checkUserConsent:v7];

  return v4;
}

void __73__PUIProblemReportingController_shouldShowIdentityVerificationSpecifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 setBool:0 forKey:*(void *)(a1 + 32)];

    id v7 = _PUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "Received an error while requesting identity proofing data sharing user consent %@", buf, 0xCu);
    }
  }
  else if (*(unsigned __int8 *)(a1 + 48) != a2)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v8 setBool:a2 forKey:*(void *)(a1 + 32)];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__PUIProblemReportingController_shouldShowIdentityVerificationSpecifiers__block_invoke_847;
    block[3] = &unk_1E6E9C758;
    void block[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __73__PUIProblemReportingController_shouldShowIdentityVerificationSpecifiers__block_invoke_847(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)setShouldShareIdentityVerificationData:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(PUIProblemReportingController *)self identityProofingDataSharingManager];
  uint64_t v9 = [v6 BOOLValue] ^ 1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __82__PUIProblemReportingController_setShouldShareIdentityVerificationData_specifier___block_invoke;
  void v12[3] = &unk_1E6E9CE48;
  objc_copyWeak(&v15, &location);
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v8 didChangeUserConsent:v9 completion:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __82__PUIProblemReportingController_setShouldShareIdentityVerificationData_specifier___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__PUIProblemReportingController_setShouldShareIdentityVerificationData_specifier___block_invoke_2;
  v5[3] = &unk_1E6E9CE20;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v9, a1 + 6);
  id v7 = a1[4];
  id v8 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __82__PUIProblemReportingController_setShouldShareIdentityVerificationData_specifier___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v1 = _PUILoggingFacility();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4AD5000, v1, OS_LOG_TYPE_DEFAULT, "Error when updating the user's consent for ID Verification data", buf, 2u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
    [WeakRetained setPreferenceValue:v3 specifier:*(void *)(a1 + 48)];
  }
}

- (NSArray)identityVerificationDataSpecifiers
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if ([(PUIProblemReportingController *)self shouldShowIdentityVerificationSpecifiers])
  {
    identityVerificationDataSpecifiers = self->_identityVerificationDataSpecifiers;
    if (!identityVerificationDataSpecifiers)
    {
      id v4 = PUI_LocalizedStringForProblemReporting(@"ID_VERIFICATION_DATA_EXPLANATION");
      id v5 = PUI_LocalizedStringForProblemReporting(@"ID_VERIFICATION_DATA_LINK");
      id v6 = objc_msgSend(NSString, "stringWithFormat:", v4, v5);
      id v7 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"ID_VERIFICATION_DATA_GROUP"];
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      [v7 setProperty:v9 forKey:*MEMORY[0x1E4F93140]];

      [v7 setProperty:v6 forKey:*MEMORY[0x1E4F93160]];
      v21.id location = [v6 rangeOfString:v5];
      id v10 = NSStringFromRange(v21);
      [v7 setProperty:v10 forKey:*MEMORY[0x1E4F93150]];

      id v11 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
      [v7 setProperty:v11 forKey:*MEMORY[0x1E4F93158]];

      [v7 setProperty:@"showAboutIdentityVerificationDataSheet" forKey:*MEMORY[0x1E4F93148]];
      uint64_t v12 = (void *)MEMORY[0x1E4F92E70];
      id v13 = PUI_LocalizedStringForProblemReporting(@"ID_VERIFICATION_DATA");
      id v14 = [v12 preferenceSpecifierNamed:v13 target:self set:sel_setShouldShareIdentityVerificationData_specifier_ get:sel_shouldShareIdentityVerificationData_ detail:0 cell:6 edit:0];

      [v14 setProperty:@"ID_VERIFICATION_DATA" forKey:*MEMORY[0x1E4F93188]];
      v19[0] = v7;
      v19[1] = v14;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      uint64_t v16 = self->_identityVerificationDataSpecifiers;
      self->_identityVerificationDataSpecifiers = v15;

      identityVerificationDataSpecifiers = self->_identityVerificationDataSpecifiers;
    }
    char v17 = identityVerificationDataSpecifiers;
  }
  else
  {
    char v17 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v17;
}

- (NSArray)healthDataSpecifiers
{
  v19[2] = *MEMORY[0x1E4F143B8];
  healthDataSpecifiers = self->_healthDataSpecifiers;
  if (!healthDataSpecifiers)
  {
    id v4 = PUI_LocalizedStringForProblemReportingCinnamon(@"HEALTH_DATA_EXPLANATION_CINNAMON");
    id v5 = PUI_LocalizedStringForProblemReporting(@"HEALTH_DATA_LINK");
    id v6 = objc_msgSend(NSString, "stringWithFormat:", v4, v5);
    id v7 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"HEALTH_DATA_GROUP"];
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 setProperty:v9 forKey:*MEMORY[0x1E4F93140]];

    [v7 setProperty:v6 forKey:*MEMORY[0x1E4F93160]];
    v21.id location = [v6 rangeOfString:v5];
    id v10 = NSStringFromRange(v21);
    [v7 setProperty:v10 forKey:*MEMORY[0x1E4F93150]];

    id v11 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v7 setProperty:v11 forKey:*MEMORY[0x1E4F93158]];

    [v7 setProperty:@"showAboutHealthDataSheet" forKey:*MEMORY[0x1E4F93148]];
    uint64_t v12 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v13 = PUI_LocalizedStringForProblemReporting(@"SHARE_HEALTH_DATA");
    id v14 = [v12 preferenceSpecifierNamed:v13 target:self set:sel_setShouldShareHealthData_specifier_ get:sel_shouldShareHealthDataForSpecifier_ detail:0 cell:6 edit:0];

    [v14 setProperty:@"SHARE_HEALTH_DATA" forKey:*MEMORY[0x1E4F93188]];
    id v15 = [MEMORY[0x1E4F74230] sharedConnection];
    LOBYTE(v13) = [v15 isDiagnosticSubmissionModificationAllowed];

    if ((v13 & 1) == 0) {
      [v14 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
    }
    v19[0] = v7;
    v19[1] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    char v17 = self->_healthDataSpecifiers;
    self->_healthDataSpecifiers = v16;

    healthDataSpecifiers = self->_healthDataSpecifiers;
  }
  return healthDataSpecifiers;
}

- (void)showAboutBankConnectDataSheet
{
  id v3 = [(PUIProblemReportingController *)self bankConnectAnalyticsConsentCoordinator];
  id v5 = [v3 privacyBundleIdentifier];

  id v4 = [getOBPrivacyPresenterClass() presenterForPrivacySplashWithIdentifier:v5];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (PUIBankConnectAnalyticsConsentCoordinator)bankConnectAnalyticsConsentCoordinator
{
  bankConnectAnalyticsConsentCoordinator = self->_bankConnectAnalyticsConsentCoordinator;
  if (!bankConnectAnalyticsConsentCoordinator)
  {
    id v4 = objc_alloc_init(PUIBankConnectAnalyticsConsentCoordinator);
    id v5 = self->_bankConnectAnalyticsConsentCoordinator;
    self->_bankConnectAnalyticsConsentCoordinator = v4;

    bankConnectAnalyticsConsentCoordinator = self->_bankConnectAnalyticsConsentCoordinator;
  }
  return bankConnectAnalyticsConsentCoordinator;
}

- (NSArray)bankConnectDataSpecifiers
{
  v25[2] = *MEMORY[0x1E4F143B8];
  if (!self->_bankConnectDataSpecifiers)
  {
    id v3 = PUI_LocalizedStringForProblemReportingBankConnect(@"PRIVACY_OFFLINE_LAB_DATA_EXPLANATION");
    id v4 = PUI_LocalizedStringForProblemReportingBankConnect(@"PRIVACY_OFFLINE_LAB_DATA_LINK");
    id v5 = objc_msgSend(NSString, "stringWithFormat:", v3, v4);
    id v6 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"BANK_CONNECT_DATA_GROUP"];
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    [v6 setProperty:v8 forKey:*MEMORY[0x1E4F93140]];

    [v6 setProperty:v5 forKey:*MEMORY[0x1E4F93160]];
    v26.id location = [v5 rangeOfString:v4];
    id v9 = NSStringFromRange(v26);
    [v6 setProperty:v9 forKey:*MEMORY[0x1E4F93150]];

    id v10 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v6 setProperty:v10 forKey:*MEMORY[0x1E4F93158]];

    [v6 setProperty:@"showAboutBankConnectDataSheet" forKey:*MEMORY[0x1E4F93148]];
    id v11 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v12 = PUI_LocalizedStringForProblemReportingBankConnect(@"PRIVACY_OFFLINE_LAB_DATA_SHARE");
    uint64_t v13 = [v11 preferenceSpecifierNamed:v12 target:self set:sel_setShouldShareBankConnectData_specifier_ get:sel_shouldShareBankConnectDataForSpecifier_ detail:0 cell:6 edit:0];

    [v13 setProperty:@"SHARE_BANKCONNECT_OFFLINELAB_DATA" forKey:*MEMORY[0x1E4F93188]];
    v25[0] = v6;
    v25[1] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    bankConnectDataSpecifiers = self->_bankConnectDataSpecifiers;
    self->_bankConnectDataSpecifiers = v14;

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PUIProblemReportingController_bankConnectDataSpecifiers__block_invoke;
    aBlock[3] = &unk_1E6E9CE70;
    objc_copyWeak(&v23, &location);
    uint64_t v16 = _Block_copy(aBlock);
    char v17 = [(PUIProblemReportingController *)self bankConnectAnalyticsConsentCoordinator];
    [v17 registerForUpdatesWithHandler:v16];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  char v18 = [(PUIProblemReportingController *)self bankConnectAnalyticsConsentCoordinator];
  if ([v18 showPreference]) {
    char v19 = self->_bankConnectDataSpecifiers;
  }
  else {
    char v19 = 0;
  }
  char v20 = v19;

  return v20;
}

void __58__PUIProblemReportingController_bankConnectDataSpecifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained reloadSpecifiers];
  }
  else
  {
    if (a2) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained reloadSpecifierID:@"SHARE_BANKCONNECT_OFFLINELAB_DATA" animated:1];
  }
}

- (id)shouldShareBankConnectDataForSpecifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  id v4 = [(PUIProblemReportingController *)self bankConnectAnalyticsConsentCoordinator];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "shouldShare"));

  return v5;
}

- (void)setShouldShareBankConnectData:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 BOOLValue];
  objc_initWeak(&location, self);
  id v9 = [(PUIProblemReportingController *)self bankConnectAnalyticsConsentCoordinator];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PUIProblemReportingController_setShouldShareBankConnectData_specifier___block_invoke;
  v11[3] = &unk_1E6E9CEC0;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  [v9 setAnalyticsConsent:v8 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __73__PUIProblemReportingController_setShouldShareBankConnectData_specifier___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PUIProblemReportingController_setShouldShareBankConnectData_specifier___block_invoke_2;
  block[3] = &unk_1E6E9CE98;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

void __73__PUIProblemReportingController_setShouldShareBankConnectData_specifier___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v4 = *(unsigned __int8 *)(a1 + 48);

    if (!v4)
    {
      id v5 = (void *)MEMORY[0x1E4FB1418];
      id v6 = PUI_LocalizedStringForProblemReportingBankConnect(@"PRIVACY_OFFLINE_LAB_SYNC_ALERT_TITLE");
      char v7 = PUI_LocalizedStringForProblemReportingBankConnect(@"PRIVACY_OFFLINE_LAB_SYNC_ALERT_MESSAGE");
      uint64_t v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

      id v9 = (void *)MEMORY[0x1E4FB1410];
      id v10 = PUI_LocalizedStringForProblemReportingBankConnect(@"PRIVACY_OFFLINE_LAB_SYNC_ALERT_DEFAULT_BUTTON");
      id v11 = [v9 actionWithTitle:v10 style:0 handler:0];
      [v8 addAction:v11];

      id v12 = objc_loadWeakRetained(v2);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __73__PUIProblemReportingController_setShouldShareBankConnectData_specifier___block_invoke_3;
      v13[3] = &unk_1E6E9CB50;
      objc_copyWeak(&v15, v2);
      id v14 = *(id *)(a1 + 32);
      [v12 presentViewController:v8 animated:1 completion:v13];

      objc_destroyWeak(&v15);
    }
  }
}

void __73__PUIProblemReportingController_setShouldShareBankConnectData_specifier___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32) animated:1];
}

- (PUIFitnessPlusAnalyticsConsentCoordinator)fitnessPlusAnalyticsConsentCoordinator
{
  fitnessPlusAnalyticsConsentCoordinator = self->_fitnessPlusAnalyticsConsentCoordinator;
  if (!fitnessPlusAnalyticsConsentCoordinator)
  {
    int v4 = objc_alloc_init(PUIFitnessPlusAnalyticsConsentCoordinator);
    id v5 = self->_fitnessPlusAnalyticsConsentCoordinator;
    self->_fitnessPlusAnalyticsConsentCoordinator = v4;

    fitnessPlusAnalyticsConsentCoordinator = self->_fitnessPlusAnalyticsConsentCoordinator;
  }
  return fitnessPlusAnalyticsConsentCoordinator;
}

- (id)shouldShareFitnessPlusDataForSpecifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  int v4 = [(PUIProblemReportingController *)self fitnessPlusAnalyticsConsentCoordinator];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "fetchAnalyticsConsent"));

  return v5;
}

- (void)setShouldShareFitnessPlusData:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 BOOLValue];
  objc_initWeak(&location, self);
  id v9 = [(PUIProblemReportingController *)self fitnessPlusAnalyticsConsentCoordinator];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PUIProblemReportingController_setShouldShareFitnessPlusData_specifier___block_invoke;
  v11[3] = &unk_1E6E9CF10;
  objc_copyWeak(&v13, &location);
  char v14 = v8;
  id v10 = v7;
  id v12 = v10;
  [v9 setAnalyticsConsent:v8 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __73__PUIProblemReportingController_setShouldShareFitnessPlusData_specifier___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PUIProblemReportingController_setShouldShareFitnessPlusData_specifier___block_invoke_2;
  block[3] = &unk_1E6E9CEE8;
  char v6 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  char v7 = *(unsigned char *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v5);
}

void __73__PUIProblemReportingController_setShouldShareFitnessPlusData_specifier___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 49)];
    [WeakRetained setPreferenceValue:v3 specifier:*(void *)(a1 + 32)];
  }
  else
  {
    [WeakRetained reloadSpecifiers];
  }
}

- (BOOL)shouldShowFitnessPlusSpecifiers
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"shouldShowFitnessPlusSpecifiers"];

  id v5 = [(PUIProblemReportingController *)self fitnessPlusAnalyticsConsentCoordinator];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PUIProblemReportingController_shouldShowFitnessPlusSpecifiers__block_invoke;
  v7[3] = &unk_1E6E9CF38;
  char v10 = v4;
  uint64_t v8 = @"shouldShowFitnessPlusSpecifiers";
  id v9 = self;
  [v5 fetchSubscriptionStatusWithCompletion:v7];

  return v4;
}

void __64__PUIProblemReportingController_shouldShowFitnessPlusSpecifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a1 + 48) != a2)
  {
    char v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setBool:a2 forKey:*(void *)(a1 + 32)];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PUIProblemReportingController_shouldShowFitnessPlusSpecifiers__block_invoke_2;
    block[3] = &unk_1E6E9C758;
    void block[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __64__PUIProblemReportingController_shouldShowFitnessPlusSpecifiers__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)shouldShareHealthDataForSpecifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  char v4 = objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection", a3);
  id v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "effectiveBoolValueForSetting:", *MEMORY[0x1E4F74068]) == 1);

  return v5;
}

- (void)setShouldShareHealthData:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id HealthAppAnalyticsStoreClass = getHealthAppAnalyticsStoreClass();
  uint64_t v8 = [v5 BOOLValue];
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  id v9 = (void *)getHealthAppAnalyticsAgreementImproveHealthAndAnalyticsSymbolLoc_ptr;
  uint64_t v16 = getHealthAppAnalyticsAgreementImproveHealthAndAnalyticsSymbolLoc_ptr;
  if (!getHealthAppAnalyticsAgreementImproveHealthAndAnalyticsSymbolLoc_ptr)
  {
    char v10 = (void *)HealthAppServicesLibrary();
    v14[3] = (uint64_t)dlsym(v10, "HealthAppAnalyticsAgreementImproveHealthAndAnalytics");
    getHealthAppAnalyticsAgreementImproveHealthAndAnalyticsSymbolLoc_ptr = v14[3];
    id v9 = (void *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v9)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    id v12 = v11;
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v12);
  }
  [HealthAppAnalyticsStoreClass setUserDidAccept:v8 currentAgreement:*v9 completion:&__block_literal_global_916];
}

void __68__PUIProblemReportingController_setShouldShareHealthData_specifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = _PUILoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1E4AD5000, v5, OS_LOG_TYPE_DEFAULT, "Failed to update user agreement state: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (NSArray)healthRecordsDataSpecifiers
{
  v19[2] = *MEMORY[0x1E4F143B8];
  healthRecordsDataSpecifiers = self->_healthRecordsDataSpecifiers;
  if (!healthRecordsDataSpecifiers)
  {
    id v4 = PUI_LocalizedStringForProblemReporting(@"HEALTH_RECORDS_DATA_EXPLANATION");
    id v5 = PUI_LocalizedStringForProblemReporting(@"HEALTH_RECORDS_DATA_LINK");
    int v6 = objc_msgSend(NSString, "stringWithFormat:", v4, v5);
    id v7 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"HEALTH_RECORDS_DATA_GROUP"];
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 setProperty:v9 forKey:*MEMORY[0x1E4F93140]];

    [v7 setProperty:v6 forKey:*MEMORY[0x1E4F93160]];
    v21.id location = [v6 rangeOfString:v5];
    char v10 = NSStringFromRange(v21);
    [v7 setProperty:v10 forKey:*MEMORY[0x1E4F93150]];

    id v11 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v7 setProperty:v11 forKey:*MEMORY[0x1E4F93158]];

    [v7 setProperty:@"showAboutHealthRecordsDataSheet" forKey:*MEMORY[0x1E4F93148]];
    id v12 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v13 = PUI_LocalizedStringForProblemReporting(@"SHARE_HEALTH_RECORDS_DATA");
    char v14 = [v12 preferenceSpecifierNamed:v13 target:self set:sel_setShouldShareHealthRecordsData_specifier_ get:sel_shouldShareHealthRecordsDataForSpecifier_ detail:0 cell:6 edit:0];

    [v14 setProperty:@"SHARE_HEALTH_RECORDS_DATA" forKey:*MEMORY[0x1E4F93188]];
    uint64_t v15 = [MEMORY[0x1E4F74230] sharedConnection];
    LOBYTE(v13) = [v15 isDiagnosticSubmissionModificationAllowed];

    if ((v13 & 1) == 0) {
      [v14 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
    }
    v19[0] = v7;
    v19[1] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    char v17 = self->_healthRecordsDataSpecifiers;
    self->_healthRecordsDataSpecifiers = v16;

    healthRecordsDataSpecifiers = self->_healthRecordsDataSpecifiers;
  }
  return healthRecordsDataSpecifiers;
}

- (HKHealthStore)healthStore
{
  healthStore = self->_healthStore;
  if (!healthStore)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getHKHealthStoreClass_softClass;
    uint64_t v13 = getHKHealthStoreClass_softClass;
    if (!getHKHealthStoreClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getHKHealthStoreClass_block_invoke;
      v9[3] = &unk_1E6E9C7F8;
      void v9[4] = &v10;
      __getHKHealthStoreClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    int v6 = (HKHealthStore *)objc_alloc_init(v5);
    id v7 = self->_healthStore;
    self->_healthStore = v6;

    healthStore = self->_healthStore;
  }
  return healthStore;
}

- (void)updateHealthRecordsPreferenceForSpecifierID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x2050000000;
  id v5 = (void *)getHKHealthRecordsStoreClass_softClass;
  uint64_t v21 = getHKHealthRecordsStoreClass_softClass;
  if (!getHKHealthRecordsStoreClass_softClass)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getHKHealthRecordsStoreClass_block_invoke;
    v17[3] = &unk_1E6E9C7F8;
    v17[4] = &v18;
    __getHKHealthRecordsStoreClass_block_invoke((uint64_t)v17);
    id v5 = (void *)v19[3];
  }
  int v6 = v5;
  _Block_object_dispose(&v18, 8);
  id v7 = [v6 alloc];
  uint64_t v8 = [(PUIProblemReportingController *)self healthStore];
  id v9 = (void *)[v7 initWithHealthStore:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke;
  void v12[3] = &unk_1E6E9CFA8;
  objc_copyWeak(&v15, &location);
  void v12[4] = self;
  id v10 = v9;
  id v13 = v10;
  id v11 = v4;
  id v14 = v11;
  [v10 fetchCurrentDeviceSupportsImproveHealthRecordsDataSubmissionOptionWithCompletion:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = _PUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching health records visibility status: %@", buf, 0xCu);
    }
  }
  uint64_t v8 = _PUILoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_1E4AD5000, v8, OS_LOG_TYPE_DEFAULT, "Health records visibility status: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v10 = [WeakRetained specifierForID:@"SHARE_HEALTH_RECORDS_DATA"];
  if (v10)
  {
  }
  else
  {
    int v11 = [v5 BOOLValue];

    if (v11)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke_933;
      v13[3] = &unk_1E6E9CC18;
      objc_copyWeak(&v16, (id *)(a1 + 56));
      uint64_t v12 = *(void **)(a1 + 40);
      void v13[4] = *(void *)(a1 + 32);
      id v14 = v12;
      id v15 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E4F14428], v13);

      objc_destroyWeak(&v16);
    }
  }
}

void __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke_933(uint64_t a1)
{
  int v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [*(id *)(a1 + 32) healthRecordsDataSpecifiers];
  [WeakRetained insertContiguousSpecifiers:v4 afterSpecifierID:@"SHARE_HEALTH_DATA"];

  id v5 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke_2;
  v6[3] = &unk_1E6E9CF80;
  objc_copyWeak(&v8, v2);
  id v7 = *(id *)(a1 + 48);
  [v5 fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion:v6];

  objc_destroyWeak(&v8);
}

void __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = _PUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching health records opt in status: %@", buf, 0xCu);
    }
  }
  id v8 = _PUILoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v5;
    _os_log_impl(&dword_1E4AD5000, v8, OS_LOG_TYPE_DEFAULT, "Health records opt in status: %@", buf, 0xCu);
  }

  char v9 = [v5 BOOLValue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke_934;
  block[3] = &unk_1E6E9CE98;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  char v13 = v9;
  id v11 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __77__PUIProblemReportingController_updateHealthRecordsPreferenceForSpecifierID___block_invoke_934(uint64_t a1)
{
  int v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setShouldShareHealthRecordsData:*(unsigned __int8 *)(a1 + 48)];

  id v4 = objc_loadWeakRetained(v2);
  [v4 reloadSpecifierID:*(void *)(a1 + 32) animated:1];
}

- (id)shouldShareHealthRecordsDataForSpecifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v4 = [(PUIProblemReportingController *)self shouldShareHealthRecordsData];
  return (id)[v3 numberWithBool:v4];
}

- (void)setShouldShareHealthRecordsData:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(location, self);
  id HealthAppAnalyticsStoreClass = getHealthAppAnalyticsStoreClass();
  uint64_t v9 = [v6 BOOLValue];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  id v10 = (id *)getHealthAppAnalyticsAgreementImproveHealthRecordsSymbolLoc_ptr;
  uint64_t v25 = getHealthAppAnalyticsAgreementImproveHealthRecordsSymbolLoc_ptr;
  if (!getHealthAppAnalyticsAgreementImproveHealthRecordsSymbolLoc_ptr)
  {
    location[1] = (id)MEMORY[0x1E4F143A8];
    location[2] = (id)3221225472;
    location[3] = __getHealthAppAnalyticsAgreementImproveHealthRecordsSymbolLoc_block_invoke;
    location[4] = &unk_1E6E9C7F8;
    uint64_t v21 = &v22;
    id v11 = (void *)HealthAppServicesLibrary();
    id v12 = dlsym(v11, "HealthAppAnalyticsAgreementImproveHealthRecords");
    *(void *)(v21[1] + 24) = v12;
    getHealthAppAnalyticsAgreementImproveHealthRecordsSymbolLoc_ptr = *(void *)(v21[1] + 24);
    id v10 = (id *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (v10)
  {
    id v13 = *v10;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__PUIProblemReportingController_setShouldShareHealthRecordsData_specifier___block_invoke;
    void v16[3] = &unk_1E6E9CFF8;
    id v14 = v6;
    id v17 = v14;
    objc_copyWeak(&v19, location);
    id v15 = v7;
    id v18 = v15;
    [HealthAppAnalyticsStoreClass setUserDidAccept:v9 currentAgreement:v13 completion:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
}

void __75__PUIProblemReportingController_setShouldShareHealthRecordsData_specifier___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PUIProblemReportingController_setShouldShareHealthRecordsData_specifier___block_invoke_2;
  block[3] = &unk_1E6E9CFD0;
  char v12 = a2;
  id v8 = a1[4];
  objc_copyWeak(&v11, a1 + 6);
  id v9 = v5;
  id v10 = a1[5];
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v11);
}

void __75__PUIProblemReportingController_setShouldShareHealthRecordsData_specifier___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 64);
  id v3 = _PUILoggingFacility();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1E4AD5000, v3, OS_LOG_TYPE_DEFAULT, "Successfully saved opt in status %@", (uint8_t *)&v9, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "setShouldShareHealthRecordsData:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue"));
  }
  else
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1E4AD5000, v3, OS_LOG_TYPE_DEFAULT, "Error saving opt in status %@: %@", (uint8_t *)&v9, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained reloadSpecifier:*(void *)(a1 + 48) animated:1];
  }
}

- (NSArray)wheelchairDataSpecifiers
{
  v19[2] = *MEMORY[0x1E4F143B8];
  wheelchairDataSpecifiers = self->_wheelchairDataSpecifiers;
  if (!wheelchairDataSpecifiers)
  {
    BOOL v4 = PUI_LocalizedStringForProblemReporting(@"WHEELCHAIR_DATA_EXPLANATION");
    uint64_t v5 = PUI_LocalizedStringForProblemReporting(@"WHEELCHAIR_DATA_LINK");
    id v6 = objc_msgSend(NSString, "stringWithFormat:", v4, v5);
    uint64_t v7 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"WHEELCHAIR_DATA_GROUP"];
    uint64_t v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    [v7 setProperty:v9 forKey:*MEMORY[0x1E4F93140]];

    [v7 setProperty:v6 forKey:*MEMORY[0x1E4F93160]];
    v21.id location = [v6 rangeOfString:v5];
    uint64_t v10 = NSStringFromRange(v21);
    [v7 setProperty:v10 forKey:*MEMORY[0x1E4F93150]];

    __int16 v11 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v7 setProperty:v11 forKey:*MEMORY[0x1E4F93158]];

    [v7 setProperty:@"showAboutWheelchairDataSheet" forKey:*MEMORY[0x1E4F93148]];
    uint64_t v12 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v13 = PUI_LocalizedStringForProblemReporting(@"SHARE_WHEELCHAIR_DATA");
    id v14 = [v12 preferenceSpecifierNamed:v13 target:self set:sel_setShouldShareWheelchairData_specifier_ get:sel_shouldShareWheelchairDataForSpecifier_ detail:0 cell:6 edit:0];

    [v14 setProperty:@"SHARE_WHEELCHAIR_DATA" forKey:*MEMORY[0x1E4F93188]];
    id v15 = [MEMORY[0x1E4F74230] sharedConnection];
    LOBYTE(v13) = [v15 isDiagnosticSubmissionModificationAllowed];

    if ((v13 & 1) == 0) {
      [v14 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
    }
    v19[0] = v7;
    v19[1] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    id v17 = self->_wheelchairDataSpecifiers;
    self->_wheelchairDataSpecifiers = v16;

    wheelchairDataSpecifiers = self->_wheelchairDataSpecifiers;
  }
  return wheelchairDataSpecifiers;
}

- (id)shouldShareWheelchairDataForSpecifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection", a3);
  uint64_t v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "effectiveBoolValueForSetting:", *MEMORY[0x1E4F741B0]) == 1);

  return v5;
}

- (void)setShouldShareWheelchairData:(id)a3 specifier:(id)a4
{
  BOOL v4 = (void *)MEMORY[0x1E4F74230];
  id v5 = a3;
  id v7 = [v4 sharedConnection];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setBoolValue:v6 forSetting:*MEMORY[0x1E4F741B0]];
}

- (NSArray)handwashingDataSpecifiers
{
  v20[2] = *MEMORY[0x1E4F143B8];
  handwashingDataSpecifiers = self->_handwashingDataSpecifiers;
  if (!handwashingDataSpecifiers)
  {
    BOOL v4 = PUI_LocalizedStringForProblemReporting(@"HANDWASHING_DATA_EXPLANATION");
    id v5 = PUI_LocalizedStringForProblemReporting(@"HANDWASHING_DATA_LINK");
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", v4, v5);
    id v7 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"HANDWASHING_DATA_GROUP"];
    uint64_t v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    [v7 setProperty:v9 forKey:*MEMORY[0x1E4F93140]];

    [v7 setProperty:v6 forKey:*MEMORY[0x1E4F93160]];
    v22.id location = [v6 rangeOfString:v5];
    uint64_t v10 = NSStringFromRange(v22);
    [v7 setProperty:v10 forKey:*MEMORY[0x1E4F93150]];

    __int16 v11 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v7 setProperty:v11 forKey:*MEMORY[0x1E4F93158]];

    [v7 setProperty:@"showAboutHandwashingDataSheet" forKey:*MEMORY[0x1E4F93148]];
    uint64_t v12 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v13 = PUI_LocalizedStringForProblemReporting(@"SHARE_HANDWASHING_DATA");
    id v14 = [v12 preferenceSpecifierNamed:v13 target:self set:sel_setShouldShareHandwashingData_specifier_ get:sel_shouldShareHandwashingDataForSpecifier_ detail:0 cell:6 edit:0];

    [v14 setProperty:@"SHARE_WHEELCHAIR_DATA" forKey:*MEMORY[0x1E4F93188]];
    id v15 = [MEMORY[0x1E4F74230] sharedConnection];
    char v16 = [v15 isDiagnosticSubmissionModificationAllowed];

    if ((v16 & 1) == 0) {
      [v14 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
    }
    v20[0] = v7;
    v20[1] = v14;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    id v18 = self->_handwashingDataSpecifiers;
    self->_handwashingDataSpecifiers = v17;

    handwashingDataSpecifiers = self->_handwashingDataSpecifiers;
  }
  return handwashingDataSpecifiers;
}

- (id)shouldShareHandwashingDataForSpecifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection", a3);
  id v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "effectiveBoolValueForSetting:", @"allowHandWashingDataSubmission") == 1);

  return v5;
}

- (void)setShouldShareHandwashingData:(id)a3 specifier:(id)a4
{
  BOOL v4 = (void *)MEMORY[0x1E4F74230];
  id v5 = a3;
  id v7 = [v4 sharedConnection];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setBoolValue:v6 forSetting:@"allowHandWashingDataSubmission"];
}

- (NSArray)safetyDataSpecifiers
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (!self->_safetyDataSpecifiers)
  {
    id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 != 1)
    {
      id v5 = PUI_LocalizedStringForProblemReporting(@"SAFETY_DATA_EXPLANATION");
      uint64_t v6 = PUI_LocalizedStringForProblemReporting(@"SAFETY_DATA_LINK");
      id v7 = objc_msgSend(NSString, "stringWithFormat:", v5, v6);
      uint64_t v8 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"SAFETY_DATA_GROUP"];
      int v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      [v8 setProperty:v10 forKey:*MEMORY[0x1E4F93140]];

      [v8 setProperty:v7 forKey:*MEMORY[0x1E4F93160]];
      v23.id location = [v7 rangeOfString:v6];
      __int16 v11 = NSStringFromRange(v23);
      [v8 setProperty:v11 forKey:*MEMORY[0x1E4F93150]];

      uint64_t v12 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
      [v8 setProperty:v12 forKey:*MEMORY[0x1E4F93158]];

      [v8 setProperty:@"showAboutSafetyDataSheet" forKey:*MEMORY[0x1E4F93148]];
      uint64_t v13 = (void *)MEMORY[0x1E4F92E70];
      uint64_t v14 = PUI_LocalizedStringForProblemReporting(@"SHARE_SAFETY_DATA");
      id v15 = [v13 preferenceSpecifierNamed:v14 target:self set:sel_setShouldShareSafetyData_specifier_ get:sel_shouldShareSafetyDataForSpecifier_ detail:0 cell:6 edit:0];

      [v15 setProperty:@"SHARE_SAFETY_DATA" forKey:*MEMORY[0x1E4F93188]];
      char v16 = [MEMORY[0x1E4F74230] sharedConnection];
      LOBYTE(v14) = [v16 isDiagnosticSubmissionModificationAllowed];

      if ((v14 & 1) == 0) {
        [v15 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
      }
      v21[0] = v8;
      v21[1] = v15;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
      safetyDataSpecifiers = self->_safetyDataSpecifiers;
      self->_safetyDataSpecifiers = v17;
    }
  }
  id v19 = self->_safetyDataSpecifiers;
  return v19;
}

- (id)shouldShareSafetyDataForSpecifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection", a3);
  id v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "effectiveBoolValueForSetting:", @"allowSafetyDataSubmission") == 1);

  return v5;
}

- (void)setShouldShareSafetyData:(id)a3 specifier:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F74230];
  id v5 = a3;
  id v7 = [v4 sharedConnection];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setBoolValue:v6 forSetting:@"allowSafetyDataSubmission"];
}

- (NSArray)improveARLocationAccuracySpecifiers
{
  v22[2] = *MEMORY[0x1E4F143B8];
  improveARLocationAccuracySpecifiers = self->_improveARLocationAccuracySpecifiers;
  if (!improveARLocationAccuracySpecifiers)
  {
    uint64_t v4 = PUI_RebrandedKeyForAppleID(@"IMPROVE_AR_LOCATION_ACCURACY_FOOTER");
    id v5 = PUI_LocalizedStringForProblemReporting(v4);

    uint64_t v6 = PUI_LocalizedStringForProblemReporting(@"IMPROVE_AR_LOCATION_ACCURACY_LINK");
    id v7 = objc_msgSend(NSString, "stringWithFormat:", v5, v6);
    uint64_t v8 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"IMPROVE_AR_LOCATION_ACCURACY_GROUP"];
    int v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    [v8 setProperty:v10 forKey:*MEMORY[0x1E4F93140]];

    [v8 setProperty:v7 forKey:*MEMORY[0x1E4F93160]];
    v24.id location = [v7 rangeOfString:v6];
    __int16 v11 = NSStringFromRange(v24);
    [v8 setProperty:v11 forKey:*MEMORY[0x1E4F93150]];

    uint64_t v12 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v8 setProperty:v12 forKey:*MEMORY[0x1E4F93158]];

    [v8 setProperty:@"showImproveARLocationAccuracyDataSheet" forKey:*MEMORY[0x1E4F93148]];
    uint64_t v13 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v14 = PUI_LocalizedStringForProblemReporting(@"IMPROVE_AR_LOCATION_ACCURACY");
    id v15 = [v13 preferenceSpecifierNamed:v14 target:self set:sel_setImproveARLocationAccuracy_specifier_ get:sel_improveARLocationAccuracyForSpecifier_ detail:0 cell:6 edit:0];

    [v15 setProperty:@"IMPROVE_AR_LOCATION_ACCURACY_DATA" forKey:*MEMORY[0x1E4F93188]];
    if (PSGEOVisualLocalizationCrowdsourcingIsAllowed())
    {
      uint64_t v16 = 1;
    }
    else
    {
      id v17 = [(PUIProblemReportingController *)self improveARLocationAccuracyForSpecifier:v15];
      uint64_t v16 = [v17 BOOLValue];
    }
    id v18 = [MEMORY[0x1E4F28ED0] numberWithBool:v16];
    [v15 setProperty:v18 forKey:*MEMORY[0x1E4F93130]];

    v22[0] = v8;
    v22[1] = v15;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    uint64_t v20 = self->_improveARLocationAccuracySpecifiers;
    self->_improveARLocationAccuracySpecifiers = v19;

    improveARLocationAccuracySpecifiers = self->_improveARLocationAccuracySpecifiers;
  }
  return improveARLocationAccuracySpecifiers;
}

- (void)setImproveARLocationAccuracy:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 BOOLValue] && (PSGEOVisualLocalizationCrowdsourcingIsAllowed() & 1) == 0)
  {
    [v7 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
    __int16 v11 = [v7 identifier];
    [(PUIProblemReportingController *)self reloadSpecifierID:v11];
  }
  else
  {
    uint64_t v8 = [v6 BOOLValue];
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000;
    int v9 = (void (*)(uint64_t))getGEOVisualLocalizationCrowdsourcingSetEnabledSymbolLoc_ptr;
    id v17 = getGEOVisualLocalizationCrowdsourcingSetEnabledSymbolLoc_ptr;
    if (!getGEOVisualLocalizationCrowdsourcingSetEnabledSymbolLoc_ptr)
    {
      uint64_t v10 = (void *)GeoServicesLibrary();
      v15[3] = (uint64_t)dlsym(v10, "GEOVisualLocalizationCrowdsourcingSetEnabled");
      getGEOVisualLocalizationCrowdsourcingSetEnabledSymbolLoc_ptr = (_UNKNOWN *)v15[3];
      int v9 = (void (*)(uint64_t))v15[3];
    }
    _Block_object_dispose(&v14, 8);
    if (!v9)
    {
      -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
      uint64_t v13 = v12;
      _Block_object_dispose(&v14, 8);
      _Unwind_Resume(v13);
    }
    v9(v8);
  }
}

- (id)improveARLocationAccuracyForSpecifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v5 = (uint64_t (*)(void))getGEOVisualLocalizationCrowdsourcingIsEnabledSymbolLoc_ptr;
  uint64_t v14 = getGEOVisualLocalizationCrowdsourcingIsEnabledSymbolLoc_ptr;
  if (!getGEOVisualLocalizationCrowdsourcingIsEnabledSymbolLoc_ptr)
  {
    id v6 = (void *)GeoServicesLibrary();
    void v12[3] = (uint64_t)dlsym(v6, "GEOVisualLocalizationCrowdsourcingIsEnabled");
    getGEOVisualLocalizationCrowdsourcingIsEnabledSymbolLoc_ptr = (_UNKNOWN *)v12[3];
    id v5 = (uint64_t (*)(void))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v5)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    uint64_t v10 = v9;
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v10);
  }
  id v7 = [v4 numberWithBool:v5()];

  return v7;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    BOOL v5 = +[PUIProblemReportingController isProblemReportingEnabled];
    id v6 = [(PUIProblemReportingController *)self baseSpecifiers];
    id v7 = [(PUIProblemReportingController *)self analyticsSpecifiersIncludingIndependentSpecifiers:1 includeDependentSpecifiers:v5];
    uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v7];

    int v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v8;

    [(PUIProblemReportingController *)self checkDiagnosticsSessionAvailability];
    [(PUIProblemReportingController *)self updateiCloudAnalyticsForSpecifierID:@"SHARE_ICLOUD_ANALYTICS"];
    [(PUIProblemReportingController *)self updateHealthRecordsPreferenceForSpecifierID:@"SHARE_HEALTH_RECORDS_DATA"];
    uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)shouldShareAppActivityWithAppDevelopers
{
  int v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 hasAppAndAccessoryAnalyticsAllowedBeenSet];

  uint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v5 = [MEMORY[0x1E4F74230] sharedConnection];
  id v6 = v5;
  if (v3) {
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isAppAndAccessoryAnalyticsAllowed"));
  }
  else {
  id v7 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x1E4F73EE8]) == 1);
  }

  return v7;
}

- (void)setShouldShareAppActivityWithAppDevelopers:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  id v6 = [MEMORY[0x1E4F74230] sharedConnection];
  [v6 setBoolValue:v5 forSetting:*MEMORY[0x1E4F73EE8]];

  if ([(PUIProblemReportingController *)self isAppAndAccessoryAnalyticsAllowedFeatureEnabled])
  {
    id v7 = [MEMORY[0x1E4F74230] sharedConnection];
    char v8 = [v7 hasAppAndAccessoryAnalyticsAllowedBeenSet];

    int v9 = [MEMORY[0x1E4F74230] sharedConnection];
    [v9 setBoolValue:v5 forSetting:*MEMORY[0x1E4F73EF0]];

    if ((v8 & 1) == 0)
    {
      appActivitySpecifiers = self->_appActivitySpecifiers;
      self->_appActivitySpecifiers = 0;

      [(PUIProblemReportingController *)self reloadSpecifiers];
    }
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PUIProblemReportingController *)self specifierAtIndex:[(PUIProblemReportingController *)self indexForIndexPath:v5]];
  id v7 = [v6 identifier];

  if ([v7 isEqualToString:@"START_DIAGNOSTICS_WITH_APPLE_SUPPORT"])
  {
    char v8 = [(PUIProblemReportingController *)self specifierAtIndex:[(PUIProblemReportingController *)self indexForIndexPath:v5]];
    [(PUIProblemReportingController *)self launchDiagnosticsSession:v8];

    id v9 = 0;
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (BOOL)shouldShareHealthRecordsData
{
  return self->_shouldShareHealthRecordsData;
}

- (void)setShouldShareHealthRecordsData:(BOOL)a3
{
  self->_shouldShareHealthRecordsData = a3;
}

- (void)setAutomatedFeedbackSpecifiers:(id)a3
{
}

- (void)setFitnessPlusAnalyticsConsentCoordinator:(id)a3
{
}

- (void)setBankConnectAnalyticsConsentCoordinator:(id)a3
{
}

- (void)setAssistantSettingsConnection:(id)a3
{
}

- (void)setIdentityProofingDataSharingManager:(id)a3
{
}

- (void)setImproveSiriSpecifiers:(id)a3
{
}

- (void)setImproveAssistiveVoiceSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_improveAssistiveVoiceSpecifiers, 0);
  objc_storeStrong((id *)&self->_improveSiriSpecifiers, 0);
  objc_storeStrong((id *)&self->_identityProofingDataSharingManager, 0);
  objc_storeStrong((id *)&self->_assistantSettingsConnection, 0);
  objc_storeStrong((id *)&self->_bankConnectAnalyticsConsentCoordinator, 0);
  objc_storeStrong((id *)&self->_fitnessPlusAnalyticsConsentCoordinator, 0);
  objc_storeStrong((id *)&self->_improveARLocationAccuracySpecifiers, 0);
  objc_storeStrong((id *)&self->_bankConnectDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_safetyDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_automatedFeedbackSpecifiers, 0);
  objc_storeStrong((id *)&self->_handwashingDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_wheelchairDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_healthRecordsDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_healthDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_fitnessPlusDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_baseSpecifiers, 0);
  objc_storeStrong((id *)&self->_identityVerificationDataSpecifiers, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_spinnerSpecifier, 0);
  objc_storeStrong((id *)&self->_iCloudSpecifiers, 0);
  objc_storeStrong((id *)&self->_appActivitySpecifiers, 0);
  objc_storeStrong((id *)&self->_filesystemMetadataSnapshotSpecifier, 0);
  objc_storeStrong((id *)&self->_aboutDiagnosticsLinkLabel, 0);
}

void __69__PUIProblemReportingController_updateiCloudAnalyticsForSpecifierID___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4AD5000, log, OS_LOG_TYPE_ERROR, "Unable to fetch iCloud Analytics value from idms.", v1, 2u);
}

void __84__PUIProblemReportingController_getCurrentImproveSiriAndDictationValueForSpecifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138412546;
  id v9 = v7;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_1E4AD5000, a3, OS_LOG_TYPE_ERROR, "%@: Encountered error while getting current Siri Analytics Status: %@", (uint8_t *)&v8, 0x16u);
}

void __75__PUIProblemReportingController_setImproveSiriAndDictationValue_specifier___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = (objc_class *)objc_opt_class();
  int v8 = NSStringFromClass(v7);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *a2;
  int v11 = 138412802;
  uint64_t v12 = v8;
  __int16 v13 = 2112;
  uint64_t v14 = v9;
  __int16 v15 = 2112;
  uint64_t v16 = v10;
  _os_log_error_impl(&dword_1E4AD5000, a3, OS_LOG_TYPE_ERROR, "%@: Encountered error while setting Siri Analytics Status to '%@': %@", (uint8_t *)&v11, 0x20u);
}

@end