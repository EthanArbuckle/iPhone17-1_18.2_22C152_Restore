@interface SUSUISoftwareUpdateController
+ (double)windowSafeAreasSize;
+ (id)visibleGroupSpecifiers;
+ (unint64_t)updateActionForString:(id)a3;
- (BOOL)_errorIsInsufficientSpace:(id)a3;
- (BOOL)_shouldHideTonightButton;
- (BOOL)clientIsSUSettings;
- (BOOL)hasAlternateUpdate;
- (BOOL)isBusy;
- (BOOL)isTopViewController;
- (BOOL)presentingStatefulDescriptorIsTargetedUpdate;
- (BOOL)presentingStatefulDescriptorPromotedAsAlternate;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)shouldShowAlternateUpdateCellForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowAlternateUpdateGroupForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowAutomaticUpdatesSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowBetaUpdatesCellSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowComingSoonSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowComingSoonTip;
- (BOOL)shouldShowDeferredUpdateGroupForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowEnforcedUpdateForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowNonPromotedCellForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowNonPromotedGroupForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowProactiveSuggestionsPrimaryButtonSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowProactiveSuggestionsSecondaryButtonSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowProactiveSuggestionsSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowScanGroupSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowScanStatusSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowTitleCellSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowTitleGroupSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowUpdateOptionsCellSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)specifier:(id)a3 isEqualToSpecifier:(id)a4;
- (BOOL)specifierArrayValue:(id)a3 IsEqualToSpecifierArrayValue:(id)a4;
- (BOOL)specifierClassValue:(Class)a3 IsEqualToSpecifierClassValue:(Class)a4;
- (BOOL)specifierDictionaryValue:(id)a3 IsEqualToSpecifierDictionaryValue:(id)a4;
- (BOOL)specifierIDValue:(id)a3 IsEqualToSpecifierIDValue:(id)a4;
- (BOOL)specifierIntValue:(int64_t)a3 IsEqualToSpecifierIntValue:(int64_t)a4;
- (BOOL)specifierSelectorValue:(SEL)a3 IsEqualToSpecifierSelectorValue:(SEL)a4;
- (BOOL)specifierStringValue:(id)a3 IsEqualToSpecifierStringValue:(id)a4;
- (BOOL)supportsPullToRefresh;
- (BOOL)waitingOnSUAssetDownload:(id)a3;
- (OS_dispatch_queue)handleURLQueue;
- (PSTableCell)alternateUpdateCell;
- (PSTableCell)automaticUpdatesCell;
- (PSTableCell)betaUpdatesCell;
- (PSTableCell)nonPromotedUpdateCell;
- (SUSSoftwareUpdateComingSoonTipCell)comingSoonCell;
- (SUSSoftwareUpdateProactiveSuggestionCell)proactiveSuggestionCell;
- (SUSSoftwareUpdateScanCell)scanCell;
- (SUSSoftwareUpdateTitleCell)titleCell;
- (SUSSoftwareUpdateUpdateOptionsCell)updateOptionsCell;
- (SUSUISoftwareUpdateController)init;
- (SUSettingsStatefulUIManager)manager;
- (UIRefreshControl)refreshControl;
- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_createGroupIndices:(id)a3;
- (id)_setInstallButtonButtonSpecifierState:(id)a3 forUIState:(unint64_t)a4 descriptorState:(unint64_t)a5;
- (id)alsoAvailableGroupHeaderString;
- (id)alternateUpdateButtonString;
- (id)alternateUpdateFooterString;
- (id)alternateUpdateSubTextString;
- (id)alternateUpdateVersionString;
- (id)analyticsAlternateUpdateCellTappedString;
- (id)analyticsAutomaticUpdatesCellTappedString;
- (id)analyticsBetaUpdatesCellTappedString;
- (id)analyticsDownloadAndInstallNowTappedString;
- (id)analyticsDownloadAndInstallTonightTappedString;
- (id)analyticsDownloadOnlyTappedString;
- (id)analyticsEnrolledToBetaUpdatesString;
- (id)analyticsNonPromotedUpdateCellTappedString;
- (id)analyticsOpenStorageTappedString;
- (id)analyticsUnenrolledToBetaUpdatesString;
- (id)autoUpdateScheduledString;
- (id)automaticDownloadStatus;
- (id)automaticInstallSystemDataFilesStatus;
- (id)automaticUpdateStatus;
- (id)automaticUpdatesCellTitle;
- (id)availableBetaPrograms;
- (id)betaUpdatesAppleID;
- (id)customCellsMapping;
- (id)enrolledBetaProgram;
- (id)installLaterTappedString;
- (id)installNowTappedString;
- (id)installedOSVersionString;
- (id)isBetaUpdatesEnabled;
- (id)learnMoreTappedString;
- (id)majorOSVersionString;
- (id)majorOSVersionStringForBuildVersion:(id)a3;
- (id)nonPromotedPreferredUpdateButtonString;
- (id)paneTitle;
- (id)preferredUpdateVersionString;
- (id)presentingAlternateDescriptor;
- (id)presentingAlternateStatefulDescriptor;
- (id)presentingDescriptor;
- (id)presentingDescriptorError;
- (id)presentingStatefulDescriptor;
- (id)previousUserSpecifiedAutomaticUpdateStatus;
- (id)previousUserSpecifiedSecurityResponseStatus;
- (id)securityResponseStatus;
- (id)selectSpecifier:(id)a3;
- (id)specifierForAlternateUpdateCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForAlternateUpdateGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForAutomaticUpdatesGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForAutomaticUpdatesWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForBetaUpdatesCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForComingSoonGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForComingSoonWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForNonPromotedPrimaryUpdateCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForNonPromotedPrimaryUpdateGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForProactiveSuggestionCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForProactiveSuggestionGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForProactiveSuggestionPrimaryButtonWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForProactiveSuggestionSecondaryButtonWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForScanFooterGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForScanHeaderGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForScanStatusCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForScanStatusWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForSection:(int64_t)a3;
- (id)specifierForTitleCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForTitleGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierForUpdateOptionsWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (id)specifierWithID:(id)a3;
- (id)statusString;
- (id)tableCellImageForImage:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)updateVersionString:(id)a3;
- (id)updatedSpecifiersArray;
- (int)updateProgressStyleForDescriptorState:(unint64_t)a3;
- (int64_t)betaUpdatesHasInstallationRestriction;
- (unint64_t)currentDescriptorState;
- (unint64_t)currentUIState;
- (unint64_t)presentingAlternateDescriptorUpgradeType;
- (unint64_t)presentingDescriptorUpgradeType;
- (unint64_t)proactiveSuggestionTypeForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (void)_setTitleCellSpecifierStatus:(id)a3 descriptorState:(unint64_t)a4;
- (void)autoInstallCancel:(id)a3;
- (void)autoInstallCancelPrompt:(id)a3;
- (void)beginInstallNowOperation;
- (void)beginInstallOperation;
- (void)beginInstallTonightOperation;
- (void)beginUpdateDownloadOnlyOperation;
- (void)beginUpdateNowOperation;
- (void)beginUpdateTonightOperation;
- (void)clearInstallButton:(id)a3;
- (void)clearNonPromotedPrimaryUpdateGroup:(id)a3;
- (void)clearNonPromotedPrimaryUpdateHeaderGroup:(id)a3;
- (void)configureScanCell:(id)a3 withUIState:(unint64_t)a4 descriptorState:(unint64_t)a5;
- (void)dealloc;
- (void)detailedReleaseNotesDonePressed:(id)a3;
- (void)devicePINControllerDidDismissPINPane:(id)a3;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)downloadAndInstall:(id)a3;
- (void)downloadAndInstallTonight:(id)a3;
- (void)downloadOnly:(id)a3;
- (void)downloadingButtonForSpecifier:(id)a3;
- (void)fixCustomCellSpecifiers;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)initStatefulUI;
- (void)initUI;
- (void)install:(id)a3;
- (void)installTonight:(id)a3;
- (void)loadView;
- (void)openStorage;
- (void)operation:(id)a3 requestAgreementToTermsAndConditionsForUpdate:(id)a4 replyHandler:(id)a5;
- (void)operation:(id)a3 requestApprovalForDownloadConstraints:(id)a4 downloadPolicy:(id)a5 replyHandler:(id)a6;
- (void)operation:(id)a3 requestDevicePasscodeForDescriptor:(id)a4 replyHandler:(id)a5;
- (void)operation:(id)a3 requestPurgeConfirmationForDownload:(id)a4 replyHandler:(id)a5;
- (void)performDeepLinkAction:(unint64_t)a3;
- (void)performUpdateRescan:(id)a3;
- (void)preferences:(id)a3 didChangePreference:(id)a4 toValue:(id)a5;
- (void)preferredContentSizeChanged:(id)a3;
- (void)presentConfimationSpecifier:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)promoteTargetedUpdateToUserInitiatedStatus;
- (void)recordAnalyticsEvent:(id)a3;
- (void)refreshBetaUpdatesButton;
- (void)refreshInstallButton;
- (void)refreshPane;
- (void)refreshupdateAutoUpdateButton;
- (void)registerForFontChanges;
- (void)registerForPreferencesChanges;
- (void)reloadCustomCells;
- (void)reloadScanSpacerCells:(id *)a3;
- (void)reloadSpecifiers:(id)a3 animated:(BOOL)a4;
- (void)reloadUsingNewSpecifiers:(id)a3;
- (void)reloadUsingNewSpecifiers:(id)a3 animated:(BOOL)a4;
- (void)requestToPromoteTargetedUpdateToUserInitiatedStatus:(id)a3;
- (void)setAlternateUpdateCell:(id)a3;
- (void)setAutomaticDownloadFromUI:(id)a3 forSpecifier:(id)a4;
- (void)setAutomaticInstallSystemDataFilesFromUI:(id)a3 forSpecifier:(id)a4;
- (void)setAutomaticUpdatesCell:(id)a3;
- (void)setAutomaticUpdatesFromUI:(id)a3 forSpecifier:(id)a4;
- (void)setAutomaticUpdatesFromUI:(id)a3 userSpecified:(BOOL)a4 forSpecifier:(id)a5;
- (void)setBetaProgramFromUI:(id)a3 forViewController:(id)a4 withCompletion:(id)a5;
- (void)setBetaUpdatesCell:(id)a3;
- (void)setBusyWithActivityStyle:(int64_t)a3;
- (void)setComingSoonCell:(id)a3;
- (void)setHandleURLQueue:(id)a3;
- (void)setInstallButtonDeleted:(id)a3;
- (void)setInstallButtonDownloadAndInstall:(id)a3;
- (void)setInstallButtonDownloadAndInstall:(id)a3 shouldRemove:(BOOL *)a4;
- (void)setInstallButtonDownloading:(id)a3 shouldRemove:(BOOL *)a4;
- (void)setInstallButtonInstallNow:(id)a3;
- (void)setInstallButtonInstalledForSpecifier:(id)a3;
- (void)setInstallButtonInstalling:(id)a3;
- (void)setInstallButtonInstallingForSpecifier:(id)a3;
- (void)setInstallButtonPaused:(id)a3;
- (void)setInstallButtonReadyToInstall:(id)a3;
- (void)setInstallButtonStalled:(id)a3 shouldRemove:(BOOL *)a4;
- (void)setManager:(id)a3;
- (void)setNonPromotedUpdateCell:(id)a3;
- (void)setProactiveSuggestionCell:(id)a3;
- (void)setRefreshControl:(id)a3;
- (void)setScanCell:(id)a3;
- (void)setSecurityResponseFromUI:(id)a3 forSpecifier:(id)a4;
- (void)setSecurityResponseFromUI:(id)a3 userSpecified:(BOOL)a4 forSpecifier:(id)a5;
- (void)setShouldShowComingSoonTip:(BOOL)a3;
- (void)setTitleCell:(id)a3;
- (void)setUpdateOptionsCell:(id)a3;
- (void)setupInstallButton:(id)a3 forUIState:(unint64_t)a4 descriptorState:(unint64_t)a5 shouldRemove:(BOOL *)a6;
- (void)setupTipsObserver;
- (void)showAlsoAvailaibleSUPane;
- (void)statefulUIManager:(id)a3 descriptor:(id)a4 didTransitionFromDescriptorState:(unint64_t)a5 toState:(unint64_t)a6;
- (void)statefulUIManager:(id)a3 didChangeProgressForDownloadOfDescriptor:(id)a4 withDownload:(id)a5;
- (void)statefulUIManager:(id)a3 didFailToScanForUpdatesWithError:(id)a4;
- (void)statefulUIManager:(id)a3 didFinishDownloadForDescriptor:(id)a4 withDownload:(id)a5;
- (void)statefulUIManager:(id)a3 didFinishScanningForUpdatesWithResults:(id)a4;
- (void)statefulUIManager:(id)a3 didStartInstallingUpdateWithDescriptor:(id)a4;
- (void)statefulUIManager:(id)a3 didTransitionFromUIState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)statefulUIManager:(id)a3 requestRollbackRestartApprovalWithReplyHandler:(id)a4;
- (void)statefulUIManagerDidRefreshState:(id)a3;
- (void)submitAnalyticsEvent:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)titleCell:(id)a3 learnMoreButtonTapped:(id)a4;
- (void)unenrollFromBetaProgramsWithCompletion:(id)a3;
- (void)unscheduleTargetedUpdateAutomaticInstallation;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)waitForScanCompletionWithTimeout:(unint64_t)a3 currentAttempt:(unint64_t)a4 completionHandler:(id)a5;
- (void)willEnterForeground;
@end

@implementation SUSUISoftwareUpdateController

- (id)availableBetaPrograms
{
  v3 = [(SUSUISoftwareUpdateController *)self manager];
  v4 = [(SUSettingsStatefulUIManager *)v3 betaPrograms];

  return v4;
}

- (void)setBetaProgramFromUI:(id)a3 forViewController:(id)a4 withCompletion:(id)a5
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  v8 = [(SUSUISoftwareUpdateController *)v24 manager];
  id v7 = location[0];
  uint64_t v15 = MEMORY[0x263EF8330];
  int v16 = -1073741824;
  int v17 = 0;
  v18 = __100__SUSUISoftwareUpdateController_BetaUpdates__setBetaProgramFromUI_forViewController_withCompletion___block_invoke;
  v19 = &unk_26483CCA0;
  id v20 = v22;
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = -1073741824;
  int v11 = 0;
  v12 = __100__SUSUISoftwareUpdateController_BetaUpdates__setBetaProgramFromUI_forViewController_withCompletion___block_invoke_4;
  v13 = &unk_26483CCC8;
  id v14 = v21;
  -[SUSettingsStatefulUIManager enrollInBetaUpdatesProgram:withPurgeConfirmation:completionHandler:](v8, "enrollInBetaUpdatesProgram:withPurgeConfirmation:completionHandler:", v7, &v15);

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __100__SUSUISoftwareUpdateController_BetaUpdates__setBetaProgramFromUI_forViewController_withCompletion___block_invoke(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v39 = 0;
  objc_storeStrong(&v39, a3);
  id v38 = 0;
  objc_storeStrong(&v38, a4);
  id v37 = 0;
  objc_storeStrong(&v37, a5);
  v36[1] = a1;
  v8 = NSString;
  id v13 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"DELETE_CONFIRMATION_TITLE"];
  id v11 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:");
  id v10 = (id)[v39 descriptor];
  id v9 = (id)[v10 productVersion];
  v36[0] = (id)objc_msgSend(v8, "stringWithFormat:", v11, v9);

  uint64_t v15 = (void *)MEMORY[0x263F82418];
  id v14 = v36[0];
  id v17 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v16 = (id)[v17 localizedStringForKey:@"DELETE_CONFIRMATION_BODY_BETA_UPDATE_ENROLLMENT" value:&stru_26DCD7690 table:@"Software Update"];
  id v35 = (id)objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v14);

  id v19 = v35;
  v18 = (void *)MEMORY[0x263F82400];
  id v22 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v21 = (id)[v22 localizedStringForKey:@"CANCEL" value:&stru_26DCD7690 table:@"Software Update"];
  v29[1] = (id)MEMORY[0x263EF8330];
  int v30 = -1073741824;
  int v31 = 0;
  v32 = __100__SUSUISoftwareUpdateController_BetaUpdates__setBetaProgramFromUI_forViewController_withCompletion___block_invoke_2;
  v33 = &unk_26483CC78;
  id v34 = v37;
  id v20 = (id)objc_msgSend(v18, "actionWithTitle:style:handler:", v21, 1);
  objc_msgSend(v19, "addAction:");

  id v24 = v35;
  v23 = (void *)MEMORY[0x263F82400];
  id v27 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v26 = (id)[v27 localizedStringForKey:@"OK" value:&stru_26DCD7690 table:@"Software Update"];
  v29[0] = v37;
  id v25 = (id)objc_msgSend(v23, "actionWithTitle:style:handler:", v26, 0);
  objc_msgSend(v24, "addAction:");

  [a1[4] presentViewController:v35 animated:1 completion:0];
  objc_storeStrong(v29, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
}

void __100__SUSUISoftwareUpdateController_BetaUpdates__setBetaProgramFromUI_forViewController_withCompletion___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void __100__SUSUISoftwareUpdateController_BetaUpdates__setBetaProgramFromUI_forViewController_withCompletion___block_invoke_3(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void __100__SUSUISoftwareUpdateController_BetaUpdates__setBetaProgramFromUI_forViewController_withCompletion___block_invoke_4(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  if (a1[4]) {
    (*(void (**)(void, BOOL))(a1[4] + 16))(a1[4], v5 == 0);
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)unenrollFromBetaProgramsWithCompletion:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v7;
  id v4 = [(SUSUISoftwareUpdateController *)v7 analyticsUnenrolledToBetaUpdatesString];
  -[SUSUISoftwareUpdateController recordAnalyticsEvent:](v3, "recordAnalyticsEvent:");

  id v5 = [(SUSUISoftwareUpdateController *)v7 manager];
  [(SUSettingsStatefulUIManager *)v5 unenrollFromBetaUpdatesWithCompletion:location[0]];

  objc_storeStrong(location, 0);
}

- (id)enrolledBetaProgram
{
  v3 = [(SUSUISoftwareUpdateController *)self manager];
  id v4 = [(SUSettingsStatefulUIManager *)v3 enrolledBetaProgram];

  return v4;
}

- (id)betaUpdatesAppleID
{
  id v3 = (id)[MEMORY[0x263F67CE8] sharedManager];
  id v4 = (id)[v3 seedingAppleIDUsernameForCurrentDevice];

  return v4;
}

- (int64_t)betaUpdatesHasInstallationRestriction
{
  if ([MEMORY[0x263F78250] isLockdownModeEnabled]) {
    return 1;
  }
  id v4 = [(SUSUISoftwareUpdateController *)self manager];
  id v3 = [(SUSettingsStatefulUIManager *)v4 currentSeedingDevice];
  char v5 = [(SDDevice *)v3 hasDeviceManagementRestriction];

  if (v5) {
    return 2;
  }
  else {
    return 0;
  }
}

- (void)setAutomaticUpdatesFromUI:(id)a3 forSpecifier:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(SUSUISoftwareUpdateController *)v7 setAutomaticUpdatesFromUI:location[0] userSpecified:1 forSpecifier:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)setAutomaticUpdatesFromUI:(id)a3 userSpecified:(BOOL)a4 forSpecifier:(id)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v12 = a4;
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  id v10 = [(SUSUISoftwareUpdateController *)v14 manager];
  id v9 = [(SUSettingsStatefulUIManager *)v10 preferences];
  -[SUSettingsSUPreferencesManager enableAutomaticUpdateV2:](v9, "enableAutomaticUpdateV2:", [location[0] BOOLValue] & 1);

  if (v12)
  {
    v6 = [(SUSUISoftwareUpdateController *)v14 manager];
    id v5 = [(SUSettingsStatefulUIManager *)v6 preferences];
    -[SUSettingsSUPreferencesManager enablePreviousUserSpecifiedAutomaticUpdateV2:](v5, "enablePreviousUserSpecifiedAutomaticUpdateV2:", [location[0] BOOLValue] & 1);
  }
  [(SUSUISoftwareUpdateController *)v14 refreshupdateAutoUpdateButton];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)setAutomaticDownloadFromUI:(id)a3 forSpecifier:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = [(SUSUISoftwareUpdateController *)v9 manager];
  id v5 = [(SUSettingsStatefulUIManager *)v6 preferences];
  -[SUSettingsSUPreferencesManager enableAutomaticDownload:](v5, "enableAutomaticDownload:", [location[0] BOOLValue] & 1);

  [(SUSUISoftwareUpdateController *)v9 refreshupdateAutoUpdateButton];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)setSecurityResponseFromUI:(id)a3 forSpecifier:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(SUSUISoftwareUpdateController *)v7 setSecurityResponseFromUI:location[0] userSpecified:1 forSpecifier:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)setSecurityResponseFromUI:(id)a3 userSpecified:(BOOL)a4 forSpecifier:(id)a5
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v12 = a4;
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  id v10 = [(SUSUISoftwareUpdateController *)v14 manager];
  id v9 = [(SUSettingsStatefulUIManager *)v10 preferences];
  -[SUSettingsSUPreferencesManager enableAutoInstallSecurityResponse:](v9, "enableAutoInstallSecurityResponse:", [location[0] BOOLValue] & 1);

  if (v12)
  {
    v6 = [(SUSUISoftwareUpdateController *)v14 manager];
    id v5 = [(SUSettingsStatefulUIManager *)v6 preferences];
    -[SUSettingsSUPreferencesManager enablePreviousUserSpecifiedAutoInstallSecurityResponse:](v5, "enablePreviousUserSpecifiedAutoInstallSecurityResponse:", [location[0] BOOLValue] & 1);
  }
  [(SUSUISoftwareUpdateController *)v14 refreshupdateAutoUpdateButton];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)setAutomaticInstallSystemDataFilesFromUI:(id)a3 forSpecifier:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = [(SUSUISoftwareUpdateController *)v9 manager];
  id v5 = [(SUSettingsStatefulUIManager *)v6 preferences];
  -[SUSettingsSUPreferencesManager enableAutoInstallSystemAndDataFiles:](v5, "enableAutoInstallSystemAndDataFiles:", [location[0] BOOLValue] & 1);

  [(SUSUISoftwareUpdateController *)v9 refreshupdateAutoUpdateButton];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)automaticUpdateStatus
{
  id v3 = NSNumber;
  id v5 = [(SUSUISoftwareUpdateController *)self manager];
  id v4 = [(SUSettingsStatefulUIManager *)v5 preferences];
  id v6 = (id)objc_msgSend(v3, "numberWithBool:", -[SUSettingsSUPreferencesManager isAutomaticUpdateV2Enabled](v4, "isAutomaticUpdateV2Enabled"));

  return v6;
}

- (id)previousUserSpecifiedAutomaticUpdateStatus
{
  id v3 = NSNumber;
  id v5 = [(SUSUISoftwareUpdateController *)self manager];
  id v4 = [(SUSettingsStatefulUIManager *)v5 preferences];
  id v6 = (id)objc_msgSend(v3, "numberWithBool:", -[SUSettingsSUPreferencesManager previousUserSpecifiedAutomaticUpdateV2Enabled](v4, "previousUserSpecifiedAutomaticUpdateV2Enabled"));

  return v6;
}

- (id)automaticDownloadStatus
{
  id v3 = NSNumber;
  id v5 = [(SUSUISoftwareUpdateController *)self manager];
  id v4 = [(SUSettingsStatefulUIManager *)v5 preferences];
  id v6 = (id)objc_msgSend(v3, "numberWithBool:", -[SUSettingsSUPreferencesManager isAutomaticDownloadEnabled](v4, "isAutomaticDownloadEnabled"));

  return v6;
}

- (id)securityResponseStatus
{
  id v3 = NSNumber;
  id v5 = [(SUSUISoftwareUpdateController *)self manager];
  id v4 = [(SUSettingsStatefulUIManager *)v5 preferences];
  id v6 = (id)objc_msgSend(v3, "numberWithBool:", -[SUSettingsSUPreferencesManager autoInstallSecurityResponse](v4, "autoInstallSecurityResponse"));

  return v6;
}

- (id)previousUserSpecifiedSecurityResponseStatus
{
  id v3 = NSNumber;
  id v5 = [(SUSUISoftwareUpdateController *)self manager];
  id v4 = [(SUSettingsStatefulUIManager *)v5 preferences];
  id v6 = (id)objc_msgSend(v3, "numberWithBool:", -[SUSettingsSUPreferencesManager previousUserSpecifiedAutoInstallSecurityResponse](v4, "previousUserSpecifiedAutoInstallSecurityResponse"));

  return v6;
}

- (id)automaticInstallSystemDataFilesStatus
{
  id v3 = NSNumber;
  id v5 = [(SUSUISoftwareUpdateController *)self manager];
  id v4 = [(SUSettingsStatefulUIManager *)v5 preferences];
  id v6 = (id)objc_msgSend(v3, "numberWithBool:", -[SUSettingsSUPreferencesManager autoInstallSystemAndDataFiles](v4, "autoInstallSystemAndDataFiles"));

  return v6;
}

- (void)submitAnalyticsEvent:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc(MEMORY[0x263F781C8]);
  id v6 = (id)[v3 initWithEventName:*MEMORY[0x263F78398]];
  [v6 setEventPayloadEntry:*MEMORY[0x263F783A0] stringValue:location[0]];
  id v5 = [(SUSUISoftwareUpdateController *)v8 manager];
  id v4 = [(SUSettingsStatefulUIManager *)v5 suClient];
  [(SUManagerClient *)v4 submitSUAnalyticsEvent:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)recordAnalyticsEvent:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc(MEMORY[0x263F781C8]);
  id v6 = (id)[v3 initWithEventName:*MEMORY[0x263F78398]];
  [v6 setEventPayloadEntry:*MEMORY[0x263F783A0] stringValue:location[0]];
  id v5 = [(SUSUISoftwareUpdateController *)v8 manager];
  id v4 = [(SUSettingsStatefulUIManager *)v5 suClient];
  [(SUManagerClient *)v4 recordSUAnalyticsEvent:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (id)analyticsDownloadOnlyTappedString
{
  return (id)*MEMORY[0x263F78470];
}

- (id)analyticsDownloadAndInstallTonightTappedString
{
  return (id)*MEMORY[0x263F78468];
}

- (id)analyticsDownloadAndInstallNowTappedString
{
  return (id)*MEMORY[0x263F78460];
}

- (id)analyticsOpenStorageTappedString
{
  return (id)*MEMORY[0x263F78490];
}

- (id)learnMoreTappedString
{
  return (id)*MEMORY[0x263F78488];
}

- (id)installNowTappedString
{
  return (id)*MEMORY[0x263F78480];
}

- (id)installLaterTappedString
{
  return (id)*MEMORY[0x263F78478];
}

- (id)analyticsAutomaticUpdatesCellTappedString
{
  return (id)*MEMORY[0x263F78448];
}

- (id)analyticsAlternateUpdateCellTappedString
{
  return (id)*MEMORY[0x263F78440];
}

- (id)analyticsNonPromotedUpdateCellTappedString
{
  return (id)*MEMORY[0x263F78458];
}

- (id)analyticsBetaUpdatesCellTappedString
{
  return (id)*MEMORY[0x263F78450];
}

- (id)analyticsEnrolledToBetaUpdatesString
{
  return (id)*MEMORY[0x263F78438];
}

- (id)analyticsUnenrolledToBetaUpdatesString
{
  return (id)*MEMORY[0x263F784A8];
}

- (SUSUISoftwareUpdateController)init
{
  SEL v8 = a2;
  id v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)SUSUISoftwareUpdateController;
  id v9 = [(SUSUISoftwareUpdateController *)&v7 init];
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.softwareupdatesettings.handleURLQueue", 0);
    handleURLQueue = v9->_handleURLQueue;
    v9->_handleURLQueue = (OS_dispatch_queue *)v2;

    id v6 = +[SUSUIServiceManager sharedInstance];
    [(SUSUIServiceManager *)v6 initialize];

    [(SUSUISoftwareUpdateController *)v9 initStatefulUI];
  }
  id v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (id)presentingStatefulDescriptor
{
  id v3 = [(SUSUISoftwareUpdateController *)self manager];
  id v4 = [(SUSettingsStatefulUIManager *)v3 preferredStatefulDescriptor];

  return v4;
}

- (id)presentingDescriptor
{
  id v3 = [(SUSUISoftwareUpdateController *)self presentingStatefulDescriptor];
  id v4 = (id)[v3 descriptor];

  return v4;
}

- (id)presentingDescriptorError
{
  id v4 = [(SUSUISoftwareUpdateController *)self presentingStatefulDescriptor];
  id v5 = (id)[v4 updateDownloadError];
  char v8 = 0;
  char v6 = 0;
  if (v5)
  {
    dispatch_queue_t v2 = (NSError *)v5;
  }
  else
  {
    id v9 = [(SUSUISoftwareUpdateController *)self manager];
    char v8 = 1;
    objc_super v7 = [(SUSettingsStatefulUIManager *)v9 scanError];
    char v6 = 1;
    dispatch_queue_t v2 = v7;
  }
  id v11 = v2;
  if (v6) {

  }
  if (v8) {
  return v11;
  }
}

- (id)presentingAlternateStatefulDescriptor
{
  id v3 = [(SUSUISoftwareUpdateController *)self manager];
  id v4 = [(SUSettingsStatefulUIManager *)v3 alternateStatefulDescriptor];

  return v4;
}

- (id)presentingAlternateDescriptor
{
  id v3 = [(SUSUISoftwareUpdateController *)self presentingAlternateStatefulDescriptor];
  id v4 = (id)[v3 descriptor];

  return v4;
}

- (BOOL)presentingStatefulDescriptorPromotedAsAlternate
{
  id v3 = [(SUSUISoftwareUpdateController *)self manager];
  char v5 = 0;
  BOOL v4 = 0;
  if ([(SUSettingsStatefulUIManager *)v3 isPreferredUpdatePromotedAsAlternate])
  {
    id v6 = [(SUSUISoftwareUpdateController *)self presentingStatefulDescriptor];
    char v5 = 1;
    BOOL v4 = [v6 currentState] == 1;
  }
  if (v5) {

  }
  return v4;
}

- (BOOL)presentingStatefulDescriptorIsTargetedUpdate
{
  BOOL v4 = [(SUSUISoftwareUpdateController *)self manager];
  id v3 = [(SUSUISoftwareUpdateController *)self presentingStatefulDescriptor];
  BOOL v5 = -[SUSettingsStatefulUIManager doesTargetedUpdateMatchDescriptor:](v4, "doesTargetedUpdateMatchDescriptor:");

  return v5;
}

- (unint64_t)presentingDescriptorUpgradeType
{
  id v4 = [(SUSUISoftwareUpdateController *)self presentingDescriptor];
  char v5 = 0;
  if (v4)
  {
    id v6 = [(SUSUISoftwareUpdateController *)self presentingDescriptor];
    char v5 = 1;
    unint64_t v3 = [v6 upgradeType];
  }
  else
  {
    unint64_t v3 = 0;
  }
  if (v5) {

  }
  return v3;
}

- (unint64_t)presentingAlternateDescriptorUpgradeType
{
  id v4 = [(SUSUISoftwareUpdateController *)self presentingAlternateDescriptor];
  char v5 = 0;
  if (v4)
  {
    id v6 = [(SUSUISoftwareUpdateController *)self presentingAlternateDescriptor];
    char v5 = 1;
    unint64_t v3 = [v6 upgradeType];
  }
  else
  {
    unint64_t v3 = 0;
  }
  if (v5) {

  }
  return v3;
}

- (void)dealloc
{
  id v9 = self;
  SEL v8 = a2;
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:v9 name:*MEMORY[0x263F833B8] object:0];

  id v4 = [(SUSUISoftwareUpdateController *)v9 manager];
  unint64_t v3 = [(SUSettingsStatefulUIManager *)v4 preferences];
  [(SUSettingsSUPreferencesManager *)v3 removeObserver:v9];

  id v5 = (id)[(SUSUISoftwareUpdateController *)v9 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(SUSUISoftwareUpdateController *)v9 dismissViewControllerAnimated:0 completion:0];
  }
  v7.receiver = v9;
  v7.super_class = (Class)SUSUISoftwareUpdateController;
  [(SUSUISoftwareUpdateController *)&v7 dealloc];
}

- (BOOL)hasAlternateUpdate
{
  id v2 = [(SUSUISoftwareUpdateController *)self presentingAlternateStatefulDescriptor];
  BOOL v4 = v2 != 0;

  return v4;
}

- (id)paneTitle
{
  id v3 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = (id)[v3 localizedStringForKey:@"SOFTWARE_UPDATE" value:&stru_26DCD7690 table:@"Software Update"];

  return v4;
}

- (id)statusString
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  v99 = self;
  v98[1] = (os_log_t)a2;
  if ([(SUSUISoftwareUpdateController *)self currentUIState] == 4)
  {
    unint64_t v95 = [(SUSUISoftwareUpdateController *)v99 currentDescriptorState];
    int v30 = [(SUSUISoftwareUpdateController *)v99 manager];
    id v29 = [(SUSUISoftwareUpdateController *)v99 presentingStatefulDescriptor];
    BOOL v31 = -[SUSettingsStatefulUIManager doesTargetedUpdateMatchDescriptor:](v30, "doesTargetedUpdateMatchDescriptor:");

    BOOL v94 = v31;
    v33 = [(SUSUISoftwareUpdateController *)v99 manager];
    v32 = [(SUSettingsStatefulUIManager *)v33 currentDownload];
    id v93 = [(SUDownload *)v32 progress];

    id v92 = (id)[v93 phase];
    [v93 percentComplete];
    float v91 = v2;
    v36 = [(SUSUISoftwareUpdateController *)v99 manager];
    id v35 = [(SUSettingsStatefulUIManager *)v36 currentDownload];
    id v34 = [(SUDownload *)v35 descriptor];
    char v37 = [(SUDescriptor *)v34 isSplatOnly];

    id v38 = [(SUSUISoftwareUpdateController *)v99 manager];
    id v39 = [(SUSettingsStatefulUIManager *)v38 scanError];
    char v89 = 0;
    char v87 = 0;
    char v85 = 0;
    char v83 = 0;
    char v81 = 0;
    char v79 = 0;
    char v77 = 0;
    char v40 = 1;
    if (!v39)
    {
      id v90 = [(SUSUISoftwareUpdateController *)v99 presentingStatefulDescriptor];
      char v89 = 1;
      id v88 = (id)[v90 updateDownloadError];
      char v87 = 1;
      LOBYTE(v28) = 0;
      if (v88)
      {
        v86 = [(SUSUISoftwareUpdateController *)v99 manager];
        char v85 = 1;
        v84 = [(SUSettingsStatefulUIManager *)v86 errorContextProvider];
        char v83 = 1;
        id v82 = [(SUSUISoftwareUpdateController *)v99 presentingStatefulDescriptor];
        char v81 = 1;
        id v80 = (id)[v82 updateDownloadError];
        char v79 = 1;
        id v78 = [(SUSUISoftwareUpdateController *)v99 presentingStatefulDescriptor];
        char v77 = 1;
        int v28 = !-[SUSettingsStatefulErrorContextProvider shouldIgnoreUpdateError:withStatefulDescriptor:](v84, "shouldIgnoreUpdateError:withStatefulDescriptor:", v80);
      }
      char v40 = v28;
    }
    if (v77) {

    }
    if (v79) {
    if (v81)
    }

    if (v83) {
    if (v85)
    }

    if (v87) {
    if (v89)
    }

    if (v40)
    {
      char v75 = 0;
      char v73 = 0;
      char v71 = 0;
      char v69 = 0;
      if (v94 && v95 >= 4)
      {
        id v76 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v75 = 1;
        id v74 = (id)[v76 localizedStringForKey:@"UNABLE_TO_INSTALL" value:&stru_26DCD7690 table:@"Software Update"];
        char v73 = 1;
        id v3 = (__CFString *)v74;
      }
      else
      {
        id v72 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v71 = 1;
        id v70 = (id)[v72 localizedStringForKey:@"UNABLE_TO_DOWNLOAD" value:&stru_26DCD7690 table:@"Software Update"];
        char v69 = 1;
        id v3 = (__CFString *)v70;
      }
      v100 = v3;
      if (v69) {

      }
      if (v71) {
      if (v73)
      }

      if (v75) {
    }
      }
    else
    {
      if (v95 <= 1)
      {
        unint64_t v5 = v95 - 1;
        char v4 = 0;
      }
      else
      {
        unint64_t v5 = v95 - 1;
        char v4 = 1;
      }
      if (v4)
      {
        v100 = 0;
      }
      else
      {
        switch(v5)
        {
          case 0uLL:
            id v26 = [(SUSUISoftwareUpdateController *)v99 manager];
            BOOL v27 = [(SUSettingsStatefulUIManager *)v26 isClearingSpaceForDownload];

            if (v27)
            {
              char v67 = 0;
              char v65 = 0;
              char v63 = 0;
              char v61 = 0;
              if (v37)
              {
                id v68 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                char v67 = 1;
                id v6 = (id)[v68 localizedStringForKey:@"RSR_REQUESTED" value:&stru_26DCD7690 table:@"Software Update"];
                v66 = v6;
                char v65 = 1;
              }
              else
              {
                id v64 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                char v63 = 1;
                id v6 = (id)[v64 localizedStringForKey:@"UPDATE_REQUESTED" value:&stru_26DCD7690 table:@"Software Update"];
                v62 = v6;
                char v61 = 1;
              }
              v100 = (__CFString *)v6;
              if (v61) {

              }
              if (v63) {
              if (v65)
              }

              if (v67) {
            }
              }
            else
            {
              id v24 = (void *)MEMORY[0x263F086F0];
              id v25 = [(SUSUISoftwareUpdateController *)v99 presentingDescriptor];
              v100 = (__CFString *)(id)objc_msgSend(v24, "stringFromByteCount:countStyle:", objc_msgSend(v25, "downloadSize"), 2);
            }
            break;
          case 1uLL:
            if (v94 || (PSIsRunningInAssistant() & 1) != 0)
            {
              id v22 = getkSUDownloadPhasePreparingForInstallation();
              char v23 = objc_msgSend(v92, "isEqualToString:");

              if (v23)
              {
                char v59 = 0;
                char v57 = 0;
                char v55 = 0;
                char v53 = 0;
                if (v37)
                {
                  id v60 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v59 = 1;
                  id v58 = (id)[v60 localizedStringForKey:@"PREPARING_RSR" value:&stru_26DCD7690 table:@"Software Update"];
                  char v57 = 1;
                  objc_super v7 = (__CFString *)v58;
                }
                else
                {
                  id v56 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v55 = 1;
                  id v54 = (id)[v56 localizedStringForKey:@"PREPARING_UPDATE" value:&stru_26DCD7690 table:@"Software Update"];
                  char v53 = 1;
                  objc_super v7 = (__CFString *)v54;
                }
                v100 = v7;
                if (v53) {

                }
                if (v55) {
                if (v57)
                }

                if (v59) {
              }
                }
              else if (v91 >= 0.005)
              {
                id v21 = [(SUSUISoftwareUpdateController *)v99 manager];
                id v20 = [(SUSettingsStatefulUIManager *)v21 currentDownload];
                v100 = (__CFString *)+[SUSettingsStatefulUIAdditions stringWithTimeRemainingForDownload:](SUSettingsStatefulUIAdditions, "stringWithTimeRemainingForDownload:");
              }
              else
              {
                char v51 = 0;
                char v49 = 0;
                char v47 = 0;
                char v45 = 0;
                if (v37)
                {
                  id v52 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v51 = 1;
                  id v50 = (id)[v52 localizedStringForKey:@"RSR_REQUESTED" value:&stru_26DCD7690 table:@"Software Update"];
                  char v49 = 1;
                  SEL v8 = (__CFString *)v50;
                }
                else
                {
                  id v48 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v47 = 1;
                  id v46 = (id)[v48 localizedStringForKey:@"UPDATE_REQUESTED" value:&stru_26DCD7690 table:@"Software Update"];
                  char v45 = 1;
                  SEL v8 = (__CFString *)v46;
                }
                v100 = v8;
                if (v45) {

                }
                if (v47) {
                if (v49)
                }

                if (v51) {
              }
                }
            }
            else
            {
              v18 = (void *)MEMORY[0x263F086F0];
              id v19 = [(SUSUISoftwareUpdateController *)v99 presentingDescriptor];
              v100 = (__CFString *)(id)objc_msgSend(v18, "stringFromByteCount:countStyle:", objc_msgSend(v19, "downloadSize"), 2);
            }
            break;
          case 2uLL:
            if (v94 || (PSIsRunningInAssistant() & 1) != 0)
            {
              id v17 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v100 = (__CFString *)(id)[v17 localizedStringForKey:@"PAUSED" value:&stru_26DCD7690 table:@"Software Update"];
            }
            else
            {
              uint64_t v15 = (void *)MEMORY[0x263F086F0];
              id v16 = [(SUSUISoftwareUpdateController *)v99 presentingDescriptor];
              v100 = (__CFString *)(id)objc_msgSend(v15, "stringFromByteCount:countStyle:", objc_msgSend(v16, "downloadSize"), 2);
            }
            break;
          case 3uLL:
            if (v94 || (PSIsRunningInAssistant() & 1) != 0)
            {
              id v14 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v100 = (__CFString *)(id)[v14 localizedStringForKey:@"DOWNLOADED" value:&stru_26DCD7690 table:@"Software Update"];
            }
            else
            {
              BOOL v12 = (void *)MEMORY[0x263F086F0];
              id v13 = [(SUSUISoftwareUpdateController *)v99 presentingDescriptor];
              v100 = (__CFString *)(id)objc_msgSend(v12, "stringFromByteCount:countStyle:", objc_msgSend(v13, "downloadSize"), 2);
            }
            break;
          case 4uLL:
            if (v94 || (PSIsRunningInAssistant() & 1) != 0)
            {
              id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v100 = (__CFString *)(id)[v11 localizedStringForKey:@"INSTALLING" value:&stru_26DCD7690 table:@"Software Update"];
            }
            else
            {
              v100 = 0;
            }
            break;
          default:
            JUMPOUT(0);
        }
      }
    }
    objc_storeStrong(&v92, 0);
    objc_storeStrong(&v93, 0);
  }
  else
  {
    id v44 = SUSettingsSharedLogger();
    v98[0] = (os_log_t)(id)[v44 oslog];

    char v97 = 16;
    if (os_log_type_enabled(v98[0], OS_LOG_TYPE_ERROR))
    {
      log = v98[0];
      os_log_type_t type = v97;
      v43 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v99 currentUIState]);
      v96 = v43;
      __os_log_helper_16_2_2_8_64_8_0((uint64_t)v101, (uint64_t)v96, [(SUSUISoftwareUpdateController *)v99 currentUIState]);
      _os_log_error_impl(&dword_228401000, log, type, "Could not create a status string for the UI state: %@ (%ld). Must be UpdatesAvailable.", v101, 0x16u);

      objc_storeStrong((id *)&v96, 0);
    }
    objc_storeStrong((id *)v98, 0);
    v100 = &stru_26DCD7690;
  }
  id v9 = v100;
  return v9;
}

- (BOOL)supportsPullToRefresh
{
  return 1;
}

+ (unint64_t)updateActionForString:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"SUSUIUpdateNowAction"])
  {
    unint64_t v5 = 1;
  }
  else if ([location[0] isEqualToString:@"SUSUIUpdateTonightAction"])
  {
    unint64_t v5 = 2;
  }
  else
  {
    unint64_t v5 = 0;
  }
  objc_storeStrong(location, 0);
  return v5;
}

- (unint64_t)currentUIState
{
  id v3 = [(SUSUISoftwareUpdateController *)self manager];
  unint64_t v4 = [(SUSettingsStatefulUIManager *)v3 currentState];

  return v4;
}

- (unint64_t)currentDescriptorState
{
  id v4 = [(SUSUISoftwareUpdateController *)self presentingStatefulDescriptor];
  char v5 = 0;
  if (v4)
  {
    id v6 = [(SUSUISoftwareUpdateController *)self presentingStatefulDescriptor];
    char v5 = 1;
    unint64_t v3 = [v6 currentState];
  }
  else
  {
    unint64_t v3 = 0;
  }
  if (v5) {

  }
  return v3;
}

- (OS_dispatch_queue)handleURLQueue
{
  return self->_handleURLQueue;
}

- (void)setHandleURLQueue:(id)a3
{
}

- (PSTableCell)automaticUpdatesCell
{
  return self->_automaticUpdatesCell;
}

- (void)setAutomaticUpdatesCell:(id)a3
{
}

- (PSTableCell)betaUpdatesCell
{
  return self->_betaUpdatesCell;
}

- (void)setBetaUpdatesCell:(id)a3
{
}

- (PSTableCell)alternateUpdateCell
{
  return self->_alternateUpdateCell;
}

- (void)setAlternateUpdateCell:(id)a3
{
}

- (PSTableCell)nonPromotedUpdateCell
{
  return self->_nonPromotedUpdateCell;
}

- (void)setNonPromotedUpdateCell:(id)a3
{
}

- (SUSSoftwareUpdateTitleCell)titleCell
{
  return self->_titleCell;
}

- (void)setTitleCell:(id)a3
{
}

- (SUSSoftwareUpdateScanCell)scanCell
{
  return self->_scanCell;
}

- (void)setScanCell:(id)a3
{
}

- (SUSSoftwareUpdateComingSoonTipCell)comingSoonCell
{
  return self->_comingSoonCell;
}

- (void)setComingSoonCell:(id)a3
{
}

- (SUSSoftwareUpdateUpdateOptionsCell)updateOptionsCell
{
  return self->_updateOptionsCell;
}

- (void)setUpdateOptionsCell:(id)a3
{
}

- (SUSSoftwareUpdateProactiveSuggestionCell)proactiveSuggestionCell
{
  return self->_proactiveSuggestionCell;
}

- (void)setProactiveSuggestionCell:(id)a3
{
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (void)setRefreshControl:(id)a3
{
}

- (SUSettingsStatefulUIManager)manager
{
  return (SUSettingsStatefulUIManager *)objc_getProperty(self, a2, 1504, 1);
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initStatefulUI
{
  v18 = self;
  SEL v17 = a2;
  float v2 = +[SUSUIServiceManager sharedInstance];
  Class v16 = [(SUSUIServiceManager *)v2 classForService:objc_opt_class()];

  unint64_t v3 = +[SUSUIServiceManager sharedInstance];
  uint64_t v15 = [(SUSUIServiceManager *)v3 classForService:objc_opt_class()];

  uint64_t v14 = [[v16 alloc] initWithDelegate:0 queue:0 clientType:1];
  char v5 = [SUSettingsStatefulUIManager alloc];
  id v4 = (id)v14;
  objc_super v7 = [(objc_class *)v15 sharedInstance];
  id v6 = -[SUSettingsStatefulUIManager initWithManagerClient:betaManager:preferences:options:](v5, "initWithManagerClient:betaManager:preferences:options:", v4, 0);
  -[SUSUISoftwareUpdateController setManager:](v18, "setManager:");

  SEL v8 = v18;
  id v9 = [(SUSUISoftwareUpdateController *)v18 manager];
  [(SUSettingsStatefulUIManager *)v9 setDelegate:v8];

  id v11 = MEMORY[0x263EF83A0];
  id v10 = [(SUSUISoftwareUpdateController *)v18 manager];
  [(SUSettingsStatefulUIManager *)v10 setDelegateCallbackQueue:v11];

  id v13 = +[SUSUITestAutomationManager sharedManager];
  BOOL v12 = [(SUSUISoftwareUpdateController *)v18 manager];
  objc_msgSend(v13, "addResponderDelegate:forServiceType:");

  objc_storeStrong((id *)&v14, 0);
}

- (void)statefulUIManager:(id)a3 requestRollbackRestartApprovalWithReplyHandler:(id)a4
{
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = 0;
  objc_storeStrong(&v27, a4);
  id v5 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v26 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", @"ROLLBACK_APPLIED_ALERT_BODY");

  id v6 = (void *)MEMORY[0x263F82418];
  id v8 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = (id)[v8 localizedStringForKey:@"ROLLBACK_APPLIED_ALERT_TITLE" value:&stru_26DCD7690 table:@"Software Update"];
  id v25 = (id)objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:");

  id v10 = v25;
  id v9 = (void *)MEMORY[0x263F82400];
  id v13 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = (id)[v13 localizedStringForKey:@"CANCEL" value:&stru_26DCD7690 table:@"Software Update"];
  v19[1] = (id)MEMORY[0x263EF8330];
  int v20 = -1073741824;
  int v21 = 0;
  id v22 = __110__SUSUISoftwareUpdateController_StatefulUI__statefulUIManager_requestRollbackRestartApprovalWithReplyHandler___block_invoke;
  char v23 = &unk_26483CC78;
  id v24 = v27;
  id v11 = (id)objc_msgSend(v9, "actionWithTitle:style:handler:", v12, 1);
  objc_msgSend(v10, "addAction:");

  id v15 = v25;
  uint64_t v14 = (void *)MEMORY[0x263F82400];
  id v18 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v17 = (id)[v18 localizedStringForKey:@"ROLLBACK_APPLIED_ALERT_BUTTON_REBOOT_NOW" value:&stru_26DCD7690 table:@"Software Update"];
  v19[0] = v27;
  id v16 = (id)objc_msgSend(v14, "actionWithTitle:style:handler:", v17, 0);
  objc_msgSend(v15, "addAction:");

  [(SUSUISoftwareUpdateController *)v29 presentViewController:v25 animated:1 completion:0];
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

void __110__SUSUISoftwareUpdateController_StatefulUI__statefulUIManager_requestRollbackRestartApprovalWithReplyHandler___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void __110__SUSUISoftwareUpdateController_StatefulUI__statefulUIManager_requestRollbackRestartApprovalWithReplyHandler___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didTransitionFromUIState:(unint64_t)a4 toState:(unint64_t)a5
{
  unint64_t v53 = a4;
  unint64_t v54 = a5;
  id v52 = "-[SUSUISoftwareUpdateController(StatefulUI) statefulUIManager:didTransitionFromUIState:toState:]";
  uint64_t v68 = *MEMORY[0x263EF8340];
  v66 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v64 = v53;
  unint64_t v63 = v54;
  id v62 = _SUSUILoggingFacility();
  unsigned __int8 v61 = 0;
  if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v62;
    *(_DWORD *)os_log_type_t type = v61;
    id v5 = (objc_class *)objc_opt_class();
    id v45 = NSStringFromClass(v5);
    id v23 = v45;
    id v50 = &v60;
    id v60 = v23;
    id v24 = v66;
    id v44 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v66 currentUIState]);
    id v25 = v44;
    char v49 = &v59;
    id v59 = v25;
    unint64_t v26 = [(SUSUISoftwareUpdateController *)v66 currentUIState];
    id v43 = [(SUSUISoftwareUpdateController *)v66 presentingStatefulDescriptor];
    id v42 = [(SUSUISoftwareUpdateController *)v66 presentingStatefulDescriptor];
    id v41 = [(SUSUISoftwareUpdateController *)v66 presentingAlternateStatefulDescriptor];
    id v40 = [(SUSUISoftwareUpdateController *)v66 presentingAlternateStatefulDescriptor];
    id v39 = [(SUSUISoftwareUpdateController *)v66 manager];
    id v38 = (id)[v39 currentDownload];
    id v37 = (id)[v38 descriptor];
    id v36 = (id)[v37 humanReadableUpdateName];
    id v19 = v36;
    id v48 = &v58;
    id v58 = v19;
    id v35 = [(SUSUISoftwareUpdateController *)v66 manager];
    id v34 = (id)[v35 currentDownload];
    id v33 = [(SUSUISoftwareUpdateController *)v66 manager];
    char v6 = [v33 isTargetedUpdateScheduledForAutoInstall];
    id v7 = "YES";
    if ((v6 & 1) == 0) {
      id v7 = "NO";
    }
    int v20 = v7;
    id v32 = SUSettingsUIStateToString(v64);
    id v21 = v32;
    char v47 = &v57;
    id v57 = v21;
    unint64_t v22 = v64;
    id v31 = SUSettingsUIStateToString(v63);
    id v46 = &v56;
    id v56 = v31;
    id v27 = &v8;
    buf = v67;
    __os_log_helper_16_2_16_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64_8_0_8_64_8_0((uint64_t)v67, (uint64_t)v52, (uint64_t)v23, (uint64_t)v24, (uint64_t)v25, v26, (uint64_t)v43, (uint64_t)v42, (uint64_t)v41, (uint64_t)v40, (uint64_t)v19, (uint64_t)v34, (uint64_t)v20, (uint64_t)v21, v22, (uint64_t)v56, v63);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nUI State Transition: %@ (%ld) -> %@ (%ld)", buf, 0xA2u);

    id obj = 0;
    objc_storeStrong(v46, 0);
    objc_storeStrong(v47, obj);
    objc_storeStrong(v48, obj);
    objc_storeStrong(v49, obj);
    objc_storeStrong(v50, obj);
  }
  objc_storeStrong(&v62, 0);
  if ([(SUSUISoftwareUpdateController *)v66 supportsPullToRefresh])
  {
    id v16 = (id)[(SUSUISoftwareUpdateController *)v66 table];
    id v17 = (id)[v16 refreshControl];
    BOOL v18 = 0;
    if (!v17)
    {
      BOOL v15 = 1;
      if (v63 != 3) {
        BOOL v15 = v63 == 4;
      }
      BOOL v18 = v15;
    }
    BOOL v14 = v18;

    if (v14)
    {
      id v13 = (id)[(SUSUISoftwareUpdateController *)v66 table];
      id v12 = [(SUSUISoftwareUpdateController *)v66 refreshControl];
      objc_msgSend(v13, "setRefreshControl:");
    }
  }
  [(SUSUISoftwareUpdateController *)v66 _setNeedsUpdateContentUnavailableConfiguration];
  BOOL v55 = 0;
  if (v64 || (BOOL v11 = 1, v63 != 1))
  {
    if (v64 != 1 || (BOOL v11 = 1, v63 != 1))
    {
      if (v64 != 1 || (BOOL v11 = 1, v63 != 2))
      {
        BOOL v11 = 1;
        if (v64 != v63) {
          BOOL v11 = v64 == 2;
        }
      }
    }
  }
  BOOL v55 = v11;
  id v9 = v66;
  id v10 = [(SUSUISoftwareUpdateController *)v66 updatedSpecifiersArray];
  -[SUSUISoftwareUpdateController reloadUsingNewSpecifiers:animated:](v9, "reloadUsingNewSpecifiers:animated:");

  [(SUSUISoftwareUpdateController *)v66 reloadCustomCells];
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 descriptor:(id)a4 didTransitionFromDescriptorState:(unint64_t)a5 toState:(unint64_t)a6
{
  id obj = a4;
  unint64_t v51 = a5;
  unint64_t v52 = a6;
  char v49 = "-[SUSUISoftwareUpdateController(StatefulUI) statefulUIManager:descriptor:didTransitionFromDescriptorState:toState:]";
  uint64_t v67 = *MEMORY[0x263EF8340];
  char v65 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v63 = 0;
  objc_storeStrong(&v63, obj);
  unint64_t v62 = v51;
  unint64_t v61 = v52;
  osos_log_t log = (os_log_t)_SUSUILoggingFacility();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v23 = type;
    char v6 = (objc_class *)objc_opt_class();
    id v41 = NSStringFromClass(v6);
    id v17 = v41;
    char v47 = &v58;
    id v58 = v17;
    BOOL v18 = v65;
    id v40 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v65 currentUIState]);
    id v19 = v40;
    id v46 = &v57;
    id v57 = v19;
    unint64_t v20 = [(SUSUISoftwareUpdateController *)v65 currentUIState];
    id v39 = [(SUSUISoftwareUpdateController *)v65 presentingStatefulDescriptor];
    id v38 = [(SUSUISoftwareUpdateController *)v65 presentingStatefulDescriptor];
    id v7 = [(SUSUISoftwareUpdateController *)v65 presentingAlternateStatefulDescriptor];
    id v37 = v7;
    id v36 = [(SUSUISoftwareUpdateController *)v65 presentingAlternateStatefulDescriptor];
    id v35 = [(SUSUISoftwareUpdateController *)v65 manager];
    id v34 = (id)[v35 currentDownload];
    id v33 = (id)[v34 descriptor];
    id v32 = (id)[v33 humanReadableUpdateName];
    id v12 = v32;
    id v45 = &v56;
    id v56 = v12;
    id v31 = [(SUSUISoftwareUpdateController *)v65 manager];
    id v30 = (id)[v31 currentDownload];
    id v29 = [(SUSUISoftwareUpdateController *)v65 manager];
    char v8 = [v29 isTargetedUpdateScheduledForAutoInstall];
    id v9 = "YES";
    if ((v8 & 1) == 0) {
      id v9 = "NO";
    }
    id v13 = v9;
    id v28 = (id)[v63 humanReadableUpdateName];
    id v14 = v28;
    id v44 = &v55;
    id v55 = v14;
    id v27 = (id)[v63 descriptor];
    id v26 = SUSettingsDescriptorStateToString(v62);
    id v15 = v26;
    id v43 = &v54;
    id v54 = v15;
    unint64_t v16 = v62;
    id v25 = SUSettingsDescriptorStateToString(v61);
    id v42 = &v53;
    id v53 = v25;
    id v21 = &v10;
    buf = v66;
    __os_log_helper_16_2_18_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_0_8_64_8_0_8_64_8_0((uint64_t)v66, (uint64_t)v49, (uint64_t)v17, (uint64_t)v18, (uint64_t)v19, v20, (uint64_t)v39, (uint64_t)v38, (uint64_t)v7, (uint64_t)v36, (uint64_t)v12, (uint64_t)v30, (uint64_t)v13, (uint64_t)v14, (uint64_t)v27, (uint64_t)v15, v16, (uint64_t)v53, v61);
    _os_log_impl(&dword_228401000, log, v23[0], "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nDescriptor %{public}@ (%p) State Transition: %@ (%ld) -> %@ (%ld)", buf, 0xB6u);

    id v48 = 0;
    objc_storeStrong(v42, 0);
    objc_storeStrong(v43, v48);
    objc_storeStrong(v44, v48);
    objc_storeStrong(v45, v48);
    objc_storeStrong(v46, v48);
    objc_storeStrong(v47, v48);
  }
  id v11 = 0;
  objc_storeStrong((id *)&oslog, 0);
  [(SUSUISoftwareUpdateController *)v65 refreshPane];
  objc_storeStrong(&v63, v11);
  objc_storeStrong(location, v11);
}

- (void)statefulUIManager:(id)a3 didFinishScanningForUpdatesWithResults:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  char v7 = 0;
  BOOL v6 = 0;
  if ([(SUSUISoftwareUpdateController *)v11 supportsPullToRefresh])
  {
    char v8 = [(SUSUISoftwareUpdateController *)v11 refreshControl];
    char v7 = 1;
    BOOL v6 = v8 != 0;
  }
  if (v7) {

  }
  if (v6)
  {
    id v4 = [(SUSUISoftwareUpdateController *)v11 refreshControl];
    [(UIRefreshControl *)v4 endRefreshing];
  }
  [(SUSUISoftwareUpdateController *)v11 refreshPane];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didFailToScanForUpdatesWithError:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  char v7 = 0;
  BOOL v6 = 0;
  if ([(SUSUISoftwareUpdateController *)v11 supportsPullToRefresh])
  {
    char v8 = [(SUSUISoftwareUpdateController *)v11 refreshControl];
    char v7 = 1;
    BOOL v6 = v8 != 0;
  }
  if (v7) {

  }
  if (v6)
  {
    id v4 = [(SUSUISoftwareUpdateController *)v11 refreshControl];
    [(UIRefreshControl *)v4 endRefreshing];
  }
  [(SUSUISoftwareUpdateController *)v11 refreshPane];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didChangeProgressForDownloadOfDescriptor:(id)a4 withDownload:(id)a5
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  if ((unint64_t)[v8 currentState] >= 2) {
    [(SUSUISoftwareUpdateController *)v10 refreshPane];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didFinishDownloadForDescriptor:(id)a4 withDownload:(id)a5
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  [(SUSUISoftwareUpdateController *)v10 refreshPane];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didStartInstallingUpdateWithDescriptor:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(SUSUISoftwareUpdateController *)v7 refreshPane];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManagerDidRefreshState:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = _SUSUILoggingFacility();
  os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v30;
    os_log_type_t type = v29;
    unint64_t v3 = (objc_class *)objc_opt_class();
    id v25 = NSStringFromClass(v3);
    id v7 = v25;
    id v28 = v7;
    id v8 = v32;
    id v24 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v32 currentUIState]);
    id v9 = v24;
    id v27 = v9;
    uint64_t v10 = [(SUSUISoftwareUpdateController *)v32 currentUIState];
    id v23 = [(SUSUISoftwareUpdateController *)v32 presentingStatefulDescriptor];
    id v22 = [(SUSUISoftwareUpdateController *)v32 presentingStatefulDescriptor];
    id v21 = [(SUSUISoftwareUpdateController *)v32 presentingAlternateStatefulDescriptor];
    id v20 = [(SUSUISoftwareUpdateController *)v32 presentingAlternateStatefulDescriptor];
    id v19 = [(SUSUISoftwareUpdateController *)v32 manager];
    BOOL v18 = [(SUSettingsStatefulUIManager *)v19 currentDownload];
    id v17 = [(SUDownload *)v18 descriptor];
    id v16 = (id)[(SUDescriptor *)v17 humanReadableUpdateName];
    id v6 = v16;
    id v26 = v6;
    id v15 = [(SUSUISoftwareUpdateController *)v32 manager];
    id v14 = [(SUSettingsStatefulUIManager *)v15 currentDownload];
    id v13 = [(SUSUISoftwareUpdateController *)v32 manager];
    BOOL v4 = [(SUSettingsStatefulUIManager *)v13 isTargetedUpdateScheduledForAutoInstall];
    id v5 = "YES";
    if (!v4) {
      id v5 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v33, (uint64_t)"-[SUSUISoftwareUpdateController(StatefulUI) statefulUIManagerDidRefreshState:]", (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, v10, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v6, (uint64_t)v14, (uint64_t)v5);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nRefresh request", v33, 0x7Au);

    objc_storeStrong(&v26, 0);
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong((id *)&v28, 0);
  }
  objc_storeStrong(&v30, 0);
  [(SUSUISoftwareUpdateController *)v32 refreshPane];
  objc_storeStrong(location, 0);
}

- (void)operation:(id)a3 requestPurgeConfirmationForDownload:(id)a4 replyHandler:(id)a5
{
  unint64_t v51 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v49 = 0;
  objc_storeStrong(&v49, a4);
  id v48 = 0;
  objc_storeStrong(&v48, a5);
  id v47 = 0;
  id v21 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v46 = (id)objc_msgSend(v21, "localizedStringForKey:value:table:", @"CANCEL");

  id v22 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v45 = (id)[v22 localizedStringForKey:@"OK" value:&stru_26DCD7690 table:@"Software Update"];

  id v23 = NSString;
  id v28 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v27 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"DELETE_CONFIRMATION_TITLE"];
  id v26 = (id)objc_msgSend(v28, "localizedStringForKey:value:table:");
  id v25 = (id)[v49 descriptor];
  id v24 = (id)[v25 productVersion];
  id v44 = (id)objc_msgSend(v23, "stringWithFormat:", v26, v24);

  id v29 = (id)[v49 progress];
  char v30 = [v29 isDone];

  if (v30)
  {
    id v18 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = (id)[v18 localizedStringForKey:@"DELETE_CONFIRMATION_BODY_DOWNLOADED" value:&stru_26DCD7690 table:@"Software Update"];
    id v6 = v47;
    id v47 = v5;
  }
  else
  {
    id v17 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = (id)[v17 localizedStringForKey:@"DELETE_CONFIRMATION_BODY_DOWNLOADING" value:&stru_26DCD7690 table:@"Software Update"];
    id v8 = v47;
    id v47 = v7;
  }
  id v43 = (id)objc_msgSend(MEMORY[0x263F82418], "alertControllerWithTitle:message:preferredStyle:", v44, v47);
  id v11 = v43;
  uint64_t v10 = (void *)MEMORY[0x263F82400];
  id v9 = v46;
  uint64_t v37 = MEMORY[0x263EF8330];
  int v38 = -1073741824;
  int v39 = 0;
  id v40 = __104__SUSUISoftwareUpdateController_StatefulUI__operation_requestPurgeConfirmationForDownload_replyHandler___block_invoke;
  id v41 = &unk_26483CC78;
  id v42 = v48;
  id v12 = (id)[v10 actionWithTitle:v9 style:1 handler:&v37];
  objc_msgSend(v11, "addAction:");

  id v15 = v43;
  id v14 = (void *)MEMORY[0x263F82400];
  id v13 = v45;
  uint64_t v31 = MEMORY[0x263EF8330];
  int v32 = -1073741824;
  int v33 = 0;
  uint64_t v34 = __104__SUSUISoftwareUpdateController_StatefulUI__operation_requestPurgeConfirmationForDownload_replyHandler___block_invoke_2;
  id v35 = &unk_26483CC78;
  id v36 = v48;
  id v16 = (id)[v14 actionWithTitle:v13 style:0 handler:&v31];
  objc_msgSend(v15, "addAction:");

  -[SUSUISoftwareUpdateController presentViewController:animated:completion:](v51, "presentViewController:animated:completion:", v43, 1);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(location, 0);
}

void __104__SUSUISoftwareUpdateController_StatefulUI__operation_requestPurgeConfirmationForDownload_replyHandler___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void __104__SUSUISoftwareUpdateController_StatefulUI__operation_requestPurgeConfirmationForDownload_replyHandler___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)operation:(id)a3 requestDevicePasscodeForDescriptor:(id)a4 replyHandler:(id)a5
{
  v58[5] = *MEMORY[0x263EF8340];
  id v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v53 = 0;
  objc_storeStrong(&v53, a4);
  id v52 = 0;
  objc_storeStrong(&v52, a5);
  v58[0] = @"SUSpecifierUpdateOptionsCell";
  v58[1] = @"SUProactiveSuggestionCell";
  v58[2] = @"SUNonPromotedUpdateButton";
  v58[3] = @"SUAlternateUpdateButton";
  v58[4] = @"SUAutomaticUpdateButton";
  id v51 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:5];
  id v50 = 0;
  memset(__b, 0, sizeof(__b));
  id v40 = v51;
  uint64_t v41 = [v40 countByEnumeratingWithState:__b objects:v57 count:16];
  if (v41)
  {
    uint64_t v35 = *(void *)__b[2];
    uint64_t v36 = 0;
    unint64_t v37 = v41;
    while (1)
    {
      uint64_t v34 = v36;
      if (*(void *)__b[2] != v35) {
        objc_enumerationMutation(v40);
      }
      uint64_t v49 = *(void *)(__b[1] + 8 * v36);
      id v5 = [(SUSUISoftwareUpdateController *)v55 specifierWithID:v49];
      id v6 = v50;
      id v50 = v5;

      if (v50) {
        break;
      }
      ++v36;
      if (v34 + 1 >= v37)
      {
        uint64_t v36 = 0;
        unint64_t v37 = [v40 countByEnumeratingWithState:__b objects:v57 count:16];
        if (!v37) {
          goto LABEL_9;
        }
      }
    }
    int v47 = 2;
  }
  else
  {
LABEL_9:
    int v47 = 0;
  }

  osos_log_t log = (os_log_t)_SUSUILoggingFacility();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    os_log_type_t v20 = type;
    id v7 = (objc_class *)objc_opt_class();
    int v33 = NSStringFromClass(v7);
    id v15 = v33;
    id v44 = v15;
    id v16 = v55;
    int v32 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v55 currentUIState]);
    id v17 = v32;
    id v43 = v17;
    uint64_t v18 = [(SUSUISoftwareUpdateController *)v55 currentUIState];
    id v31 = [(SUSUISoftwareUpdateController *)v55 presentingStatefulDescriptor];
    id v30 = [(SUSUISoftwareUpdateController *)v55 presentingStatefulDescriptor];
    id v29 = [(SUSUISoftwareUpdateController *)v55 presentingAlternateStatefulDescriptor];
    id v28 = [(SUSUISoftwareUpdateController *)v55 presentingAlternateStatefulDescriptor];
    id v27 = [(SUSUISoftwareUpdateController *)v55 manager];
    id v26 = [(SUSettingsStatefulUIManager *)v27 currentDownload];
    id v25 = [(SUDownload *)v26 descriptor];
    id v24 = (id)[(SUDescriptor *)v25 humanReadableUpdateName];
    id v14 = v24;
    id v42 = v14;
    id v23 = [(SUSUISoftwareUpdateController *)v55 manager];
    id v22 = [(SUSettingsStatefulUIManager *)v23 currentDownload];
    id v21 = [(SUSUISoftwareUpdateController *)v55 manager];
    if ([(SUSettingsStatefulUIManager *)v21 isTargetedUpdateScheduledForAutoInstall])
    {
      id v8 = "YES";
    }
    else
    {
      id v8 = "NO";
    }
    __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_0((uint64_t)v56, (uint64_t)"-[SUSUISoftwareUpdateController(StatefulUI) operation:requestDevicePasscodeForDescriptor:replyHandler:]", (uint64_t)v15, (uint64_t)v16, (uint64_t)v17, v18, (uint64_t)v31, (uint64_t)v30, (uint64_t)v29, (uint64_t)v28, (uint64_t)v14, (uint64_t)v22, (uint64_t)v8, (uint64_t)v50, (uint64_t)v50);
    _os_log_impl(&dword_228401000, log, v20, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nShowing PIN sheet using specifier: %{public}@ (%p)", v56, 0x8Eu);

    objc_storeStrong(&v42, 0);
    objc_storeStrong((id *)&v43, 0);
    objc_storeStrong((id *)&v44, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v50)
  {
    id v12 = v50;
    id v9 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v9);
    objc_msgSend(v12, "setProperty:forKey:");

    [v50 setEditPaneClass:objc_opt_class()];
    [v50 setProperty:&unk_26DCE4B18 forKey:@"mode"];
    uint64_t v10 = MEMORY[0x22A697370](v52);
    id passcodeReplyHandler = v55->_passcodeReplyHandler;
    v55->_id passcodeReplyHandler = (id)v10;

    [(SUSUISoftwareUpdateController *)v55 showPINSheet:v50];
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
}

- (void)operation:(id)a3 requestAgreementToTermsAndConditionsForUpdate:(id)a4 replyHandler:(id)a5
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  uint64_t v5 = objc_opt_new();
  termsManager = v24->_termsManager;
  v24->_termsManager = (SUSSoftwareUpdateTermsManager *)v5;

  id v9 = v24->_termsManager;
  id v10 = (id)[MEMORY[0x263F637D0] defaultStyle];
  -[SUSSoftwareUpdateTermsManager setServerFlowStyle:](v9, "setServerFlowStyle:");

  id v13 = v24->_termsManager;
  id v11 = v22;
  id v12 = v24;
  uint64_t v14 = MEMORY[0x263EF8330];
  int v15 = -1073741824;
  int v16 = 0;
  id v17 = __114__SUSUISoftwareUpdateController_StatefulUI__operation_requestAgreementToTermsAndConditionsForUpdate_replyHandler___block_invoke;
  uint64_t v18 = &unk_26483DF58;
  id v19 = v24;
  id v20 = v21;
  -[SUSSoftwareUpdateTermsManager presentTermsIfNecessaryForUpdate:overController:showLoadSpinner:completion:](v13, "presentTermsIfNecessaryForUpdate:overController:showLoadSpinner:completion:", v11, v12, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

void __114__SUSUISoftwareUpdateController_StatefulUI__operation_requestAgreementToTermsAndConditionsForUpdate_replyHandler___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v33 = a1;
  char v32 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v30[1] = (id)a1;
  v30[0] = _SUSUILoggingFacility();
  os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v30[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v30[0];
    os_log_type_t type = v29;
    unint64_t v3 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v3);
    id v6 = v24;
    id v28 = v6;
    id v7 = *(void **)(a1 + 32);
    id v23 = SUSettingsUIStateToString([v7 currentUIState]);
    id v8 = v23;
    id v27 = v8;
    uint64_t v9 = [*(id *)(a1 + 32) currentUIState];
    id v22 = (id)[*(id *)(a1 + 32) presentingStatefulDescriptor];
    id v21 = (id)[*(id *)(a1 + 32) presentingStatefulDescriptor];
    id v20 = (id)[*(id *)(a1 + 32) presentingAlternateStatefulDescriptor];
    id v19 = (id)[*(id *)(a1 + 32) presentingAlternateStatefulDescriptor];
    id v18 = (id)[*(id *)(a1 + 32) manager];
    id v17 = (id)[v18 currentDownload];
    id v16 = (id)[v17 descriptor];
    id v15 = (id)[v16 humanReadableUpdateName];
    id v5 = v15;
    id v26 = v5;
    id v14 = (id)[*(id *)(a1 + 32) manager];
    id v13 = (id)[v14 currentDownload];
    id v12 = (id)[*(id *)(a1 + 32) manager];
    if ([v12 isTargetedUpdateScheduledForAutoInstall]) {
      BOOL v4 = "YES";
    }
    else {
      BOOL v4 = "NO";
    }
    __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_4_0_8_66((uint64_t)v34, (uint64_t)"-[SUSUISoftwareUpdateController(StatefulUI) operation:requestAgreementToTermsAndConditionsForUpdate:replyHandler:]_block_invoke", (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, v9, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v19, (uint64_t)v5, (uint64_t)v13, (uint64_t)v4, v32 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSUSSoftwareUpdateTermsManager returned accepted state: %d; error: %{public}@",
      v34,
      0x8Au);

    objc_storeStrong(&v26, 0);
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong((id *)&v28, 0);
  }
  objc_storeStrong(v30, 0);
  (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), (v32 & 1) == 0);
  objc_storeStrong(&location, 0);
}

- (void)operation:(id)a3 requestApprovalForDownloadConstraints:(id)a4 downloadPolicy:(id)a5 replyHandler:(id)a6
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v58 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v56 = 0;
  objc_storeStrong(&v56, a4);
  id v55 = 0;
  objc_storeStrong(&v55, a5);
  id v54 = 0;
  objc_storeStrong(&v54, a6);
  id v53 = 0;
  v52[8] = 0;
  *(void *)id v52 = [v55 isDownloadFreeForCellular] & 1;
  id v51 = 0;
  id v50 = 0;
  id v31 = SUSettingsSharedLogger();
  id v49 = (id)[v31 oslog];

  os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_4_0((uint64_t)v59, (uint64_t)"-[SUSUISoftwareUpdateController(StatefulUI) operation:requestApprovalForDownloadConstraints:downloadPolicy:replyHandler:]", v52[0] & 1);
    _os_log_impl(&dword_228401000, (os_log_t)v49, v48, "%s: Alerting user about cellular fees. zero rated = %d", v59, 0x12u);
  }
  objc_storeStrong(&v49, 0);
  id v30 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v52[0])
  {
    char v29 = 0;
    if (v56) {
      char v29 = [v56 isSplatOnly];
    }
    id v6 = @"RSR_CELLULAR_DOWNLOAD_ACCEPT_POSSIBLE_FEES";
    if ((v29 & 1) == 0) {
      id v6 = @"CELLULAR_DOWNLOAD_ACCEPT_POSSIBLE_FEES";
    }
    id v28 = v6;
  }
  else
  {
    char v27 = 0;
    if (v56) {
      char v27 = [v56 isSplatOnly];
    }
    id v7 = @"RSR_CELLULAR_DOWNLOAD_ACCEPT_DEFINITE_FEES";
    if ((v27 & 1) == 0) {
      id v7 = @"CELLULAR_DOWNLOAD_ACCEPT_DEFINITE_FEES";
    }
    id v28 = v7;
  }
  id v8 = (id)objc_msgSend(v30, "localizedStringForKey:value:table:", v28);
  uint64_t v9 = *(void **)&v52[1];
  *(void *)&v52[1] = v8;

  id v16 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = (id)[v16 localizedStringForKey:@"CONTINUE" value:&stru_26DCD7690 table:@"Software Update"];
  id v11 = v51;
  id v51 = v10;

  id v17 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v12 = (id)[v17 localizedStringForKey:@"CANCEL" value:&stru_26DCD7690 table:@"Software Update"];
  id v13 = v50;
  id v50 = v12;

  id v18 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = (id)[v18 localizedStringForKey:@"ALLOW_CELLULAR_DOWNLOAD" value:&stru_26DCD7690 table:@"Software Update"];
  id v15 = v53;
  id v53 = v14;

  id v47 = (id)objc_msgSend(MEMORY[0x263F82418], "alertControllerWithTitle:message:preferredStyle:", v53, *(void *)&v52[1]);
  id v21 = v47;
  id v20 = (void *)MEMORY[0x263F82400];
  id v19 = v51;
  uint64_t v41 = MEMORY[0x263EF8330];
  int v42 = -1073741824;
  int v43 = 0;
  id v44 = __121__SUSUISoftwareUpdateController_StatefulUI__operation_requestApprovalForDownloadConstraints_downloadPolicy_replyHandler___block_invoke;
  id v45 = &unk_26483CC78;
  id v46 = v54;
  id v22 = (id)[v20 actionWithTitle:v19 style:0 handler:&v41];
  objc_msgSend(v21, "addAction:");

  id v25 = v47;
  id v24 = (void *)MEMORY[0x263F82400];
  id v23 = v50;
  uint64_t v35 = MEMORY[0x263EF8330];
  int v36 = -1073741824;
  int v37 = 0;
  int v38 = __121__SUSUISoftwareUpdateController_StatefulUI__operation_requestApprovalForDownloadConstraints_downloadPolicy_replyHandler___block_invoke_2;
  int v39 = &unk_26483CC78;
  id v40 = v54;
  id v26 = (id)[v24 actionWithTitle:v23 style:1 handler:&v35];
  objc_msgSend(v25, "addAction:");

  -[SUSUISoftwareUpdateController presentViewController:animated:completion:](v58, "presentViewController:animated:completion:", v47, 1);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong((id *)&v52[1], 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(location, 0);
}

void __121__SUSUISoftwareUpdateController_StatefulUI__operation_requestApprovalForDownloadConstraints_downloadPolicy_replyHandler___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void __121__SUSUISoftwareUpdateController_StatefulUI__operation_requestApprovalForDownloadConstraints_downloadPolicy_replyHandler___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)didAcceptEnteredPIN:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  int v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = _SUSUILoggingFacility();
  os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v3);
    id v11 = v10;
    id v33 = v11;
    id v12 = v37;
    id v13 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v37 currentUIState]);
    id v14 = v13;
    id v32 = v14;
    uint64_t v15 = [(SUSUISoftwareUpdateController *)v37 currentUIState];
    id v16 = [(SUSUISoftwareUpdateController *)v37 presentingStatefulDescriptor];
    id v17 = [(SUSUISoftwareUpdateController *)v37 presentingStatefulDescriptor];
    id v18 = [(SUSUISoftwareUpdateController *)v37 presentingAlternateStatefulDescriptor];
    id v19 = [(SUSUISoftwareUpdateController *)v37 presentingAlternateStatefulDescriptor];
    id v20 = [(SUSUISoftwareUpdateController *)v37 manager];
    id v21 = [(SUSettingsStatefulUIManager *)v20 currentDownload];
    id v22 = [(SUDownload *)v21 descriptor];
    id v23 = (id)[(SUDescriptor *)v22 humanReadableUpdateName];
    id v24 = v23;
    id v31 = v24;
    id v25 = [(SUSUISoftwareUpdateController *)v37 manager];
    id v26 = [(SUSettingsStatefulUIManager *)v25 currentDownload];
    char v27 = [(SUSUISoftwareUpdateController *)v37 manager];
    BOOL v4 = [(SUSettingsStatefulUIManager *)v27 isTargetedUpdateScheduledForAutoInstall];
    id v5 = "YES";
    if (!v4) {
      id v5 = "NO";
    }
    uint64_t v28 = (uint64_t)v5;
    BOOL v29 = 0;
    if (location[0]) {
      BOOL v29 = [location[0] length] != 0;
    }
    id v6 = "YES";
    if (v29) {
      id v7 = "YES";
    }
    else {
      id v7 = "NO";
    }
    if (!v37->_passcodeReplyHandler) {
      id v6 = "NO";
    }
    __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_32_8_32((uint64_t)v39, (uint64_t)"-[SUSUISoftwareUpdateController(StatefulUI) didAcceptEnteredPIN:]", (uint64_t)v11, (uint64_t)v12, (uint64_t)v14, v15, (uint64_t)v16, (uint64_t)v17, (uint64_t)v18, (uint64_t)v19, (uint64_t)v24, (uint64_t)v26, v28, (uint64_t)v7, (uint64_t)v6);
    _os_log_impl(&dword_228401000, (os_log_t)v35, v34, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nRecieved the user entered passcode. Not Empty? %s; Reply handler exists? %s",
      v39,
      0x8Eu);

    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
  }
  objc_storeStrong(&v35, 0);
  if (v37->_passcodeReplyHandler)
  {
    (*((void (**)(void))v37->_passcodeReplyHandler + 2))();
    id passcodeReplyHandler = v37->_passcodeReplyHandler;
    v37->_id passcodeReplyHandler = 0;
  }
  else
  {
    id v9 = SUSettingsSharedLogger();
    osos_log_t log = (os_log_t)(id)[v9 oslog];

    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v38, (uint64_t)"-[SUSUISoftwareUpdateController(StatefulUI) didAcceptEnteredPIN:]");
      _os_log_error_impl(&dword_228401000, oslog, OS_LOG_TYPE_ERROR, "%s: Could not continue the installation as the passcode entry reply handler is nil. This is a bug.", v38, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)devicePINControllerDidDismissPINPane:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_passcodeReplyHandler) {
    (*((void (**)(void))v4->_passcodeReplyHandler + 2))();
  }
  objc_storeStrong(location, 0);
}

- (id)updatedSpecifiersArray
{
  v159[20] = *MEMORY[0x263EF8340];
  id v157 = self;
  v156[1] = (id)a2;
  v156[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v149 = MEMORY[0x263EF8330];
  int v150 = -1073741824;
  int v151 = 0;
  v152 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke;
  v153 = &unk_26483E338;
  id v154 = v157;
  id v27 = (id)MEMORY[0x22A697370](&v149);
  v159[0] = v27;
  uint64_t v143 = MEMORY[0x263EF8330];
  int v144 = -1073741824;
  int v145 = 0;
  v146 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_2;
  v147 = &unk_26483E338;
  id v148 = v157;
  id v26 = (id)MEMORY[0x22A697370](&v143);
  v159[1] = v26;
  uint64_t v137 = MEMORY[0x263EF8330];
  int v138 = -1073741824;
  int v139 = 0;
  v140 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_3;
  v141 = &unk_26483E338;
  id v142 = v157;
  id v25 = (id)MEMORY[0x22A697370](&v137);
  v159[2] = v25;
  uint64_t v131 = MEMORY[0x263EF8330];
  int v132 = -1073741824;
  int v133 = 0;
  v134 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_4;
  v135 = &unk_26483E338;
  id v136 = v157;
  id v24 = (id)MEMORY[0x22A697370](&v131);
  v159[3] = v24;
  uint64_t v125 = MEMORY[0x263EF8330];
  int v126 = -1073741824;
  int v127 = 0;
  v128 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_5;
  v129 = &unk_26483E338;
  id v130 = v157;
  id v23 = (id)MEMORY[0x22A697370](&v125);
  v159[4] = v23;
  uint64_t v119 = MEMORY[0x263EF8330];
  int v120 = -1073741824;
  int v121 = 0;
  v122 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_6;
  v123 = &unk_26483E338;
  id v124 = v157;
  id v22 = (id)MEMORY[0x22A697370](&v119);
  v159[5] = v22;
  uint64_t v113 = MEMORY[0x263EF8330];
  int v114 = -1073741824;
  int v115 = 0;
  v116 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_7;
  v117 = &unk_26483E338;
  id v118 = v157;
  id v21 = (id)MEMORY[0x22A697370](&v113);
  v159[6] = v21;
  uint64_t v107 = MEMORY[0x263EF8330];
  int v108 = -1073741824;
  int v109 = 0;
  v110 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_8;
  v111 = &unk_26483E338;
  id v112 = v157;
  id v20 = (id)MEMORY[0x22A697370](&v107);
  v159[7] = v20;
  uint64_t v101 = MEMORY[0x263EF8330];
  int v102 = -1073741824;
  int v103 = 0;
  v104 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_9;
  v105 = &unk_26483E338;
  id v106 = v157;
  id v19 = (id)MEMORY[0x22A697370](&v101);
  v159[8] = v19;
  uint64_t v95 = MEMORY[0x263EF8330];
  int v96 = -1073741824;
  int v97 = 0;
  v98 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_10;
  v99 = &unk_26483E338;
  id v100 = v157;
  id v18 = (id)MEMORY[0x22A697370](&v95);
  v159[9] = v18;
  uint64_t v89 = MEMORY[0x263EF8330];
  int v90 = -1073741824;
  int v91 = 0;
  id v92 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_11;
  id v93 = &unk_26483E338;
  id v94 = v157;
  id v17 = (id)MEMORY[0x22A697370](&v89);
  v159[10] = v17;
  uint64_t v83 = MEMORY[0x263EF8330];
  int v84 = -1073741824;
  int v85 = 0;
  v86 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_12;
  char v87 = &unk_26483E338;
  id v88 = v157;
  id v16 = (id)MEMORY[0x22A697370](&v83);
  v159[11] = v16;
  uint64_t v77 = MEMORY[0x263EF8330];
  int v78 = -1073741824;
  int v79 = 0;
  id v80 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_13;
  char v81 = &unk_26483E338;
  id v82 = v157;
  id v15 = (id)MEMORY[0x22A697370](&v77);
  v159[12] = v15;
  uint64_t v71 = MEMORY[0x263EF8330];
  int v72 = -1073741824;
  int v73 = 0;
  id v74 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_14;
  char v75 = &unk_26483E338;
  id v76 = v157;
  id v14 = (id)MEMORY[0x22A697370](&v71);
  v159[13] = v14;
  uint64_t v65 = MEMORY[0x263EF8330];
  int v66 = -1073741824;
  int v67 = 0;
  uint64_t v68 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_15;
  char v69 = &unk_26483E338;
  id v70 = v157;
  id v13 = (id)MEMORY[0x22A697370](&v65);
  v159[14] = v13;
  uint64_t v59 = MEMORY[0x263EF8330];
  int v60 = -1073741824;
  int v61 = 0;
  unint64_t v62 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_16;
  id v63 = &unk_26483E338;
  id v64 = v157;
  id v12 = (id)MEMORY[0x22A697370](&v59);
  v159[15] = v12;
  uint64_t v53 = MEMORY[0x263EF8330];
  int v54 = -1073741824;
  int v55 = 0;
  id v56 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_17;
  id v57 = &unk_26483E338;
  id v58 = v157;
  id v11 = (id)MEMORY[0x22A697370](&v53);
  v159[16] = v11;
  uint64_t v47 = MEMORY[0x263EF8330];
  int v48 = -1073741824;
  int v49 = 0;
  id v50 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_18;
  id v51 = &unk_26483E338;
  id v52 = v157;
  id v10 = (id)MEMORY[0x22A697370](&v47);
  v159[17] = v10;
  uint64_t v41 = MEMORY[0x263EF8330];
  int v42 = -1073741824;
  int v43 = 0;
  id v44 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_19;
  id v45 = &unk_26483E338;
  id v46 = v157;
  id v9 = (id)MEMORY[0x22A697370](&v41);
  v159[18] = v9;
  uint64_t v35 = MEMORY[0x263EF8330];
  int v36 = -1073741824;
  int v37 = 0;
  int v38 = __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_20;
  int v39 = &unk_26483E338;
  id v40 = v157;
  id v8 = (id)MEMORY[0x22A697370](&v35);
  v159[19] = v8;
  id v155 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v159 count:20];

  uint64_t v34 = [v157 currentUIState];
  uint64_t v33 = [v157 currentDescriptorState];
  memset(__b, 0, sizeof(__b));
  id obj = v155;
  uint64_t v29 = [obj countByEnumeratingWithState:__b objects:v158 count:16];
  if (v29)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v29;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v32 = *(void *)(__b[1] + 8 * v6);
      id location = (id)(*(uint64_t (**)(void))(v32 + 16))();
      if (location) {
        [v156[0] addObject:location];
      }
      objc_storeStrong(&location, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v158 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  id v3 = v156[0];
  objc_storeStrong(&v155, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(&v82, 0);
  objc_storeStrong(&v88, 0);
  objc_storeStrong(&v94, 0);
  objc_storeStrong(&v100, 0);
  objc_storeStrong(&v106, 0);
  objc_storeStrong(&v112, 0);
  objc_storeStrong(&v118, 0);
  objc_storeStrong(&v124, 0);
  objc_storeStrong(&v130, 0);
  objc_storeStrong(&v136, 0);
  objc_storeStrong(&v142, 0);
  objc_storeStrong(&v148, 0);
  objc_storeStrong(&v154, 0);
  objc_storeStrong(v156, 0);
  return v3;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowComingSoonSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForComingSoonGroupWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowComingSoonSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForComingSoonWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowAutomaticUpdatesSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForAutomaticUpdatesGroupWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowAutomaticUpdatesSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForAutomaticUpdatesWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowBetaUpdatesCellSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForBetaUpdatesCellWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowScanGroupSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForScanHeaderGroupWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowScanStatusSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForScanStatusWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowScanStatusSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForScanStatusCellWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowScanGroupSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForScanFooterGroupWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowTitleGroupSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForTitleGroupWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowTitleCellSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForTitleCellWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowUpdateOptionsCellSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForUpdateOptionsWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowProactiveSuggestionsSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForProactiveSuggestionGroupWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowProactiveSuggestionsSpecifierForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForProactiveSuggestionCellWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowProactiveSuggestionsPrimaryButtonSpecifierForUIState:a2 descriptorState:a3])id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "specifierForProactiveSuggestionPrimaryButtonWithUIState:descriptorState:", a2, a3); {
  else
  }
    id v7 = 0;
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowProactiveSuggestionsSecondaryButtonSpecifierForUIState:a2 descriptorState:a3])id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "specifierForProactiveSuggestionSecondaryButtonWithUIState:descriptorState:", a2, a3); {
  else
  }
    id v7 = 0;
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowAlternateUpdateGroupForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForAlternateUpdateGroupWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowAlternateUpdateCellForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForAlternateUpdateCellWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowNonPromotedGroupForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForNonPromotedPrimaryUpdateGroupWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

id __67__SUSUISoftwareUpdateController_Specifiers__updatedSpecifiersArray__block_invoke_20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) shouldShowNonPromotedCellForUIState:a2 descriptorState:a3]) {
    id v7 = (id)[*(id *)(a1 + 32) specifierForNonPromotedPrimaryUpdateCellWithUIState:a2 descriptorState:a3];
  }
  else {
    id v7 = 0;
  }
  return v7;
}

- (id)customCellsMapping
{
  id v23 = self;
  v22[1] = (id)a2;
  v22[0] = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v21 = [(SUSUISoftwareUpdateController *)v23 automaticUpdatesCell];

  if (v21)
  {
    id v20 = [(SUSUISoftwareUpdateController *)v23 automaticUpdatesCell];
    objc_msgSend(v22[0], "setObject:forKey:");
  }
  id v19 = [(SUSUISoftwareUpdateController *)v23 betaUpdatesCell];

  if (v19)
  {
    id v18 = [(SUSUISoftwareUpdateController *)v23 betaUpdatesCell];
    objc_msgSend(v22[0], "setObject:forKey:");
  }
  id v17 = [(SUSUISoftwareUpdateController *)v23 titleCell];

  if (v17)
  {
    id v16 = [(SUSUISoftwareUpdateController *)v23 titleCell];
    objc_msgSend(v22[0], "setObject:forKey:");
  }
  id v15 = [(SUSUISoftwareUpdateController *)v23 scanCell];

  if (v15)
  {
    id v14 = [(SUSUISoftwareUpdateController *)v23 scanCell];
    objc_msgSend(v22[0], "setObject:forKey:");
  }
  id v13 = [(SUSUISoftwareUpdateController *)v23 comingSoonCell];

  if (v13)
  {
    id v12 = [(SUSUISoftwareUpdateController *)v23 comingSoonCell];
    objc_msgSend(v22[0], "setObject:forKey:");
  }
  id v11 = [(SUSUISoftwareUpdateController *)v23 updateOptionsCell];

  if (v11)
  {
    id v10 = [(SUSUISoftwareUpdateController *)v23 updateOptionsCell];
    objc_msgSend(v22[0], "setObject:forKey:");
  }
  id v9 = [(SUSUISoftwareUpdateController *)v23 proactiveSuggestionCell];

  if (v9)
  {
    id v8 = [(SUSUISoftwareUpdateController *)v23 proactiveSuggestionCell];
    objc_msgSend(v22[0], "setObject:forKey:");
  }
  id v7 = [(SUSUISoftwareUpdateController *)v23 alternateUpdateCell];

  if (v7)
  {
    uint64_t v6 = [(SUSUISoftwareUpdateController *)v23 alternateUpdateCell];
    objc_msgSend(v22[0], "setObject:forKey:");
  }
  uint64_t v5 = [(SUSUISoftwareUpdateController *)v23 nonPromotedUpdateCell];

  if (v5)
  {
    uint64_t v4 = [(SUSUISoftwareUpdateController *)v23 nonPromotedUpdateCell];
    objc_msgSend(v22[0], "setObject:forKey:");
  }
  id v3 = v22[0];
  objc_storeStrong(v22, 0);
  return v3;
}

- (void)reloadSpecifiers:(id)a3 animated:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v13 = a4;
  [(SUSUISoftwareUpdateController *)v15 beginUpdates];
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v10)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v10;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(__b[1] + 8 * v6);
      [(SUSUISoftwareUpdateController *)v15 reloadSpecifier:v12 animated:v13];
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  [(SUSUISoftwareUpdateController *)v15 endUpdates];
  objc_storeStrong(location, 0);
}

- (void)reloadUsingNewSpecifiers:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateController *)v4 reloadUsingNewSpecifiers:location[0] animated:1];
  objc_storeStrong(location, 0);
}

- (void)reloadUsingNewSpecifiers:(id)a3 animated:(BOOL)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v31 = a4;
  if (a4)
  {
    id v29 = (id)[(SUSUISoftwareUpdateController *)v33 specifiers];
    id v28 = (id)[MEMORY[0x263F5FC50] updatesByDiffingSpecifiers:v29 withSpecifiers:location[0] changedBlock:&__block_literal_global_3];
    id v14 = objc_alloc(MEMORY[0x263EFF980]);
    id v15 = (id)[v28 updates];
    id v27 = (id)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

    id v16 = objc_alloc(MEMORY[0x263EFF980]);
    id v17 = (id)[v28 updates];
    id v26 = (id)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

    memset(__b, 0, sizeof(__b));
    id obj = (id)[v28 updates];
    uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
    if (v19)
    {
      uint64_t v11 = *(void *)__b[2];
      uint64_t v12 = 0;
      unint64_t v13 = v19;
      while (1)
      {
        uint64_t v10 = v12;
        if (*(void *)__b[2] != v11) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(id *)(__b[1] + 8 * v12);
        if ([v25 operation] == 3) {
          [v27 addObject:v25];
        }
        else {
          [v26 addObject:v25];
        }
        ++v12;
        if (v10 + 1 >= v13)
        {
          uint64_t v12 = 0;
          unint64_t v13 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
          if (!v13) {
            break;
          }
        }
      }
    }

    id v4 = objc_alloc(MEMORY[0x263F5FC50]);
    id v5 = (id)[(SUSUISoftwareUpdateController *)v33 specifiers];
    id v23 = (id)objc_msgSend(v4, "initWithSpecifiers:applyUpdates:");

    id v6 = (id)[v23 context];
    [v6 setAnimated:v31];

    [(SUSUISoftwareUpdateController *)v33 performSpecifierUpdates:v23];
    id v7 = objc_alloc(MEMORY[0x263F5FC50]);
    id v8 = (id)[(SUSUISoftwareUpdateController *)v33 specifiers];
    id v22 = (id)objc_msgSend(v7, "initWithSpecifiers:applyUpdates:");

    id v9 = (id)[v22 context];
    [v9 setAnimated:0];

    [(SUSUISoftwareUpdateController *)v33 performSpecifierUpdates:v22];
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
    int v30 = 0;
  }
  else
  {
    [(SUSUISoftwareUpdateController *)v33 setSpecifiers:location[0]];
    id v20 = (id)[(SUSUISoftwareUpdateController *)v33 table];
    [v20 reloadData];

    int v30 = 1;
  }
  objc_storeStrong(location, 0);
}

uint64_t __79__SUSUISoftwareUpdateController_Specifiers__reloadUsingNewSpecifiers_animated___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v15 = 0;
  objc_storeStrong(&v15, a3);
  id v14 = a1;
  id v7 = (id)[location[0] identifier];
  char v12 = 0;
  char v8 = 1;
  if (([v7 isEqualToString:@"SUScanHeaderGroup"] & 1) == 0)
  {
    id v13 = (id)[location[0] identifier];
    char v12 = 1;
    char v8 = [v13 isEqualToString:@"SUScanFooterGroup"];
  }
  if (v12) {

  }
  if (v8)
  {
    char v17 = 1;
    int v11 = 1;
  }
  else if ([location[0] cellType])
  {
    char v17 = 0;
    int v11 = 1;
  }
  else
  {
    id v4 = (void *)MEMORY[0x263F600F8];
    id v10 = (id)[location[0] propertyForKey:*MEMORY[0x263F600F8]];
    id v9 = (id)[v15 propertyForKey:*v4];
    char v17 = ([v10 isEqualToString:v9] ^ 1) & 1;
    int v11 = 1;
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v17 & 1;
}

- (BOOL)specifier:(id)a3 isEqualToSpecifier:(id)a4
{
  id v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v43 = 0;
  objc_storeStrong(&v43, a4);
  if ([location[0] isEqual:v43])
  {
    char v46 = 1;
  }
  else
  {
    uint64_t v12 = objc_opt_class();
    char v41 = 0;
    char v39 = 0;
    char v37 = 0;
    char v35 = 0;
    char v33 = 0;
    char v31 = 0;
    char v29 = 0;
    char v27 = 0;
    char v25 = 0;
    char v23 = 0;
    char v21 = 0;
    char v19 = 0;
    char v17 = 0;
    char v15 = 0;
    BOOL v13 = 0;
    if (v12 == objc_opt_class())
    {
      int v11 = v45;
      id v42 = (id)[location[0] name];
      char v41 = 1;
      id v40 = (id)[v43 name];
      char v39 = 1;
      BOOL v13 = 0;
      if (-[SUSUISoftwareUpdateController specifierStringValue:IsEqualToSpecifierStringValue:](v11, "specifierStringValue:IsEqualToSpecifierStringValue:", v42))
      {
        id v10 = v45;
        id v38 = (id)[location[0] identifier];
        char v37 = 1;
        id v36 = (id)[v43 identifier];
        char v35 = 1;
        BOOL v13 = 0;
        if (-[SUSUISoftwareUpdateController specifierStringValue:IsEqualToSpecifierStringValue:](v10, "specifierStringValue:IsEqualToSpecifierStringValue:", v38))
        {
          BOOL v13 = 0;
          if ([(SUSUISoftwareUpdateController *)v45 specifierSelectorValue:*(void *)((char *)location[0] + (int)*MEMORY[0x263F5FE28]) IsEqualToSpecifierSelectorValue:*(void *)((char *)v43 + (int)*MEMORY[0x263F5FE28])])
          {
            BOOL v13 = 0;
            if ([(SUSUISoftwareUpdateController *)v45 specifierSelectorValue:*(void *)((char *)location[0] + (int)*MEMORY[0x263F5FE38]) IsEqualToSpecifierSelectorValue:*(void *)((char *)v43 + (int)*MEMORY[0x263F5FE38])])
            {
              BOOL v13 = 0;
              if ([(SUSUISoftwareUpdateController *)v45 specifierClassValue:*(void *)((char *)location[0] + (int)*MEMORY[0x263F5FE18]) IsEqualToSpecifierClassValue:*(void *)((char *)v43 + (int)*MEMORY[0x263F5FE18])])
              {
                BOOL v13 = 0;
                if ([(SUSUISoftwareUpdateController *)v45 specifierIntValue:*(void *)((char *)location[0] + (int)*MEMORY[0x263F5FE10]) IsEqualToSpecifierIntValue:*(void *)((char *)v43 + (int)*MEMORY[0x263F5FE10])])
                {
                  BOOL v13 = 0;
                  if ([(SUSUISoftwareUpdateController *)v45 specifierClassValue:*(void *)((char *)location[0] + (int)*MEMORY[0x263F5FE20]) IsEqualToSpecifierClassValue:*(void *)((char *)v43 + (int)*MEMORY[0x263F5FE20])])
                  {
                    BOOL v13 = 0;
                    if (-[SUSUISoftwareUpdateController specifierSelectorValue:IsEqualToSpecifierSelectorValue:](v45, "specifierSelectorValue:IsEqualToSpecifierSelectorValue:", [location[0] confirmationAction], objc_msgSend(v43, "confirmationAction")))
                    {
                      BOOL v13 = 0;
                      if (-[SUSUISoftwareUpdateController specifierSelectorValue:IsEqualToSpecifierSelectorValue:](v45, "specifierSelectorValue:IsEqualToSpecifierSelectorValue:", [location[0] confirmationAlternateAction], objc_msgSend(v43, "confirmationAlternateAction")))
                      {
                        BOOL v13 = 0;
                        if (-[SUSUISoftwareUpdateController specifierSelectorValue:IsEqualToSpecifierSelectorValue:](v45, "specifierSelectorValue:IsEqualToSpecifierSelectorValue:", [location[0] confirmationCancelAction], objc_msgSend(v43, "confirmationCancelAction")))
                        {
                          BOOL v13 = 0;
                          if (-[SUSUISoftwareUpdateController specifierSelectorValue:IsEqualToSpecifierSelectorValue:](v45, "specifierSelectorValue:IsEqualToSpecifierSelectorValue:", [location[0] controllerLoadAction], objc_msgSend(v43, "controllerLoadAction")))
                          {
                            id v9 = v45;
                            id v34 = (id)[location[0] properties];
                            char v33 = 1;
                            id v32 = (id)[v43 properties];
                            char v31 = 1;
                            BOOL v13 = 0;
                            if (-[SUSUISoftwareUpdateController specifierDictionaryValue:IsEqualToSpecifierDictionaryValue:](v9, "specifierDictionaryValue:IsEqualToSpecifierDictionaryValue:", v34))
                            {
                              char v8 = v45;
                              id v30 = (id)[location[0] values];
                              char v29 = 1;
                              id v28 = (id)[v43 values];
                              char v27 = 1;
                              BOOL v13 = 0;
                              if (-[SUSUISoftwareUpdateController specifierArrayValue:IsEqualToSpecifierArrayValue:](v8, "specifierArrayValue:IsEqualToSpecifierArrayValue:", v30))
                              {
                                id v7 = v45;
                                id v26 = (id)[location[0] titleDictionary];
                                char v25 = 1;
                                id v24 = (id)[v43 titleDictionary];
                                char v23 = 1;
                                BOOL v13 = 0;
                                if (-[SUSUISoftwareUpdateController specifierDictionaryValue:IsEqualToSpecifierDictionaryValue:](v7, "specifierDictionaryValue:IsEqualToSpecifierDictionaryValue:", v26))
                                {
                                  id v6 = v45;
                                  id v22 = (id)[location[0] shortTitleDictionary];
                                  char v21 = 1;
                                  id v20 = (id)[v43 shortTitleDictionary];
                                  char v19 = 1;
                                  BOOL v13 = 0;
                                  if (-[SUSUISoftwareUpdateController specifierDictionaryValue:IsEqualToSpecifierDictionaryValue:](v6, "specifierDictionaryValue:IsEqualToSpecifierDictionaryValue:", v22))
                                  {
                                    id v5 = v45;
                                    id v18 = (id)[location[0] userInfo];
                                    char v17 = 1;
                                    id v16 = (id)[v43 userInfo];
                                    char v15 = 1;
                                    BOOL v13 = -[SUSUISoftwareUpdateController specifierIDValue:IsEqualToSpecifierIDValue:](v5, "specifierIDValue:IsEqualToSpecifierIDValue:", v18);
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    char v46 = v13;
    if (v15) {

    }
    if (v17) {
    if (v19)
    }

    if (v21) {
    if (v23)
    }

    if (v25) {
    if (v27)
    }

    if (v29) {
    if (v31)
    }

    if (v33) {
    if (v35)
    }

    if (v37) {
    if (v39)
    }

    if (v41) {
  }
    }
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  return v46 & 1;
}

- (BOOL)specifierIntValue:(int64_t)a3 IsEqualToSpecifierIntValue:(int64_t)a4
{
  return a3 == a4;
}

- (BOOL)specifierStringValue:(id)a3 IsEqualToSpecifierStringValue:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  if (location[0] || (char v5 = 1, v7)) {
    char v5 = [location[0] isEqualToString:v7];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)specifierDictionaryValue:(id)a3 IsEqualToSpecifierDictionaryValue:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  if (location[0] || (char v5 = 1, v7)) {
    char v5 = [location[0] isEqualToDictionary:v7];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)specifierArrayValue:(id)a3 IsEqualToSpecifierArrayValue:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  if (location[0] || (char v5 = 1, v7)) {
    char v5 = [location[0] isEqualToArray:v7];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)specifierSelectorValue:(SEL)a3 IsEqualToSpecifierSelectorValue:(SEL)a4
{
  if (a3) {
    return a3 == a4;
  }
  BOOL v5 = 1;
  if (a4) {
    return a3 == a4;
  }
  return v5;
}

- (BOOL)specifierClassValue:(Class)a3 IsEqualToSpecifierClassValue:(Class)a4
{
  if (a3) {
    return a3 == a4;
  }
  BOOL v5 = 1;
  if (a4) {
    return a3 == a4;
  }
  return v5;
}

- (BOOL)specifierIDValue:(id)a3 IsEqualToSpecifierIDValue:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  if (location[0] || (char v5 = 1, v7)) {
    char v5 = [location[0] isEqual:v7];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)fixCustomCellSpecifiers
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v15 = self;
  v14[1] = (id)a2;
  v14[0] = [(SUSUISoftwareUpdateController *)self customCellsMapping];
  memset(__b, 0, sizeof(__b));
  id obj = v14[0];
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(__b[1] + 8 * v6);
      id v11 = [(SUSUISoftwareUpdateController *)v15 specifierWithID:v13];
      id location = (id)[v14[0] objectForKeyedSubscript:v13];
      id v2 = (id)[v11 propertyForKey:*MEMORY[0x263F602B0]];
      BOOL v3 = v2 != 0;

      if (!v3) {
        [v11 setProperty:location forKey:*MEMORY[0x263F602B0]];
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v11, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  objc_storeStrong(v14, 0);
}

+ (id)visibleGroupSpecifiers
{
  uint64_t v5 = (dispatch_once_t *)&visibleGroupSpecifiers_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_359);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  id v2 = (void *)visibleGroupSpecifiers_visibleGroupSpecifiers;
  return v2;
}

void __67__SUSUISoftwareUpdateController_Specifiers__visibleGroupSpecifiers__block_invoke()
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = @"SUAutomaticUpdateGroup";
  v2[1] = @"SUTitleGroup";
  v2[2] = @"SUCancelAutomaticUpdateGroup";
  v2[3] = @"SUAlternateUpdateGroup";
  id v0 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  v1 = (void *)visibleGroupSpecifiers_visibleGroupSpecifiers;
  visibleGroupSpecifiers_visibleGroupSpecifiers = (uint64_t)v0;
}

- (id)specifierForComingSoonGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  v6[4] = self;
  v6[3] = (id)a2;
  v6[2] = (id)a3;
  v6[1] = (id)a4;
  v6[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUTipKitComingSoonGroup"];
  if (!v6[0])
  {
    v6[0] = (id)[MEMORY[0x263F5FC40] emptyGroupSpecifier];

    [v6[0] setProperty:@"SUTipKitComingSoonGroup" forKey:*MEMORY[0x263F60138]];
  }
  id v5 = v6[0];
  objc_storeStrong(v6, 0);
  return v5;
}

- (id)specifierForComingSoonWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  char v15 = self;
  v14[3] = (id)a2;
  id v14[2] = (id)a3;
  v14[1] = (id)a4;
  v14[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUTipKitComingSoonCell"];
  if (!v14[0])
  {
    v14[0] = (id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

    [v14[0] setProperty:@"SUTipKitComingSoonCell" forKey:*MEMORY[0x263F60138]];
    [v14[0] setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    [(SUSUISoftwareUpdateController *)v15 setComingSoonCell:0];
  }
  uint64_t v4 = [(SUSUISoftwareUpdateController *)v15 comingSoonCell];
  BOOL v13 = v4 != 0;

  if (!v13)
  {
    id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F784C0]), "initWithStyle:reuseIdentifier:specifier:", 3, 0);
    -[SUSUISoftwareUpdateController setComingSoonCell:](v15, "setComingSoonCell:");

    uint64_t v12 = [(SUSUISoftwareUpdateController *)v15 comingSoonCell];
    [(SUSSoftwareUpdateComingSoonTipCell *)v12 setSpecifier:v14[0]];
  }
  id v6 = v14[0];
  unint64_t v7 = [(SUSUISoftwareUpdateController *)v15 comingSoonCell];
  objc_msgSend(v6, "setProperty:forKey:");

  char v8 = [(SUSUISoftwareUpdateController *)v15 comingSoonCell];
  [(SUSSoftwareUpdateComingSoonTipCell *)v8 setAccessibilityIdentifier:@"SUTipKitComingSoonCell"];

  uint64_t v9 = [(SUSUISoftwareUpdateController *)v15 comingSoonCell];
  [(SUSSoftwareUpdateComingSoonTipCell *)v9 setUserInteractionEnabled:![(SUSUISoftwareUpdateController *)v15 isBusy]];

  id v10 = v14[0];
  objc_storeStrong(v14, 0);
  return v10;
}

- (id)specifierForAutomaticUpdatesGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v76 = self;
  SEL v75 = a2;
  unint64_t v74 = a3;
  unint64_t v73 = a4;
  id v72 = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUAutomaticUpdateGroup"];
  if (!v72)
  {
    id v72 = (id)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"SUAutomaticUpdateGroup"];
  }
  if ([(SUSUISoftwareUpdateController *)v76 shouldShowEnforcedUpdateForUIState:v74 descriptorState:v73])
  {
    int v55 = [(SUSUISoftwareUpdateController *)v76 manager];
    int v54 = [(SUSettingsStatefulUIManager *)v55 ddmDeclaration];
    id v71 = (id)[(SUCoreDDMDeclaration *)v54 versionString];

    id v57 = [(SUSUISoftwareUpdateController *)v76 manager];
    id v56 = [(SUSettingsStatefulUIManager *)v57 ddmDeclaration];
    id v70 = (id)[(SUCoreDDMDeclaration *)v56 buildVersionString];

    uint64_t v59 = [(SUSUISoftwareUpdateController *)v76 manager];
    id v58 = [(SUSettingsStatefulUIManager *)v59 ddmDeclaration];
    id v69 = (id)[(SUCoreDDMDeclaration *)v58 enforcedInstallDate];

    id location = 0;
    id v67 = (id)objc_msgSend(MEMORY[0x263F08790], "localizedStringFromDate:dateStyle:timeStyle:", v69, 1);
    id v52 = [(SUSUISoftwareUpdateController *)v76 manager];
    id v51 = [(SUSettingsStatefulUIManager *)v52 currentDownload];
    uint64_t v53 = [(SUDownload *)v51 descriptor];

    if (v53)
    {
      id v40 = NSString;
      id v50 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v49 = (id)[v50 localizedStringForKey:@"%@ (%@)" value:&stru_26DCD7690 table:@"Software Update"];
      int v48 = [(SUSUISoftwareUpdateController *)v76 manager];
      uint64_t v47 = [(SUSettingsStatefulUIManager *)v48 currentDownload];
      char v46 = [(SUDownload *)v47 descriptor];
      id v45 = (id)[(SUDescriptor *)v46 productVersion];
      id v44 = [(SUSUISoftwareUpdateController *)v76 manager];
      id v43 = [(SUSettingsStatefulUIManager *)v44 currentDownload];
      id v42 = [(SUDownload *)v43 descriptor];
      id v41 = (id)[(SUDescriptor *)v42 productBuildVersion];
      id v4 = (id)objc_msgSend(v40, "stringWithFormat:", v49, v45, v41);
      id v5 = location;
      id location = v4;
    }
    else if (v71 && v70)
    {
      char v37 = NSString;
      id v39 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v38 = (id)[v39 localizedStringForKey:@"%@ (%@)" value:&stru_26DCD7690 table:@"Software Update"];
      id v6 = (id)objc_msgSend(v37, "stringWithFormat:", v71, v70);
      id v7 = location;
      id location = v6;
    }
    else if (v71)
    {
      objc_storeStrong(&location, v71);
    }
    else
    {
      objc_storeStrong(&location, v70);
    }
    id v28 = NSString;
    id v31 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v30 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"MANAGED_DEVICE_ENFORCED_UPDATE_BODY"];
    id v29 = (id)objc_msgSend(v31, "localizedStringForKey:value:table:");
    id v66 = (id)[v28 stringWithFormat:location];

    id v32 = NSString;
    id v34 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v33 = (id)[v34 localizedStringForKey:@"MANAGED_DEVICE_ENFORCED_UPDATE_BODY_WITH_DATE" value:&stru_26DCD7690 table:@"Software Update"];
    id v8 = (id)objc_msgSend(v32, "stringWithFormat:", v66, v67);
    id v9 = v66;
    id v66 = v8;

    id v36 = [(SUSUISoftwareUpdateController *)v76 manager];
    char v35 = [(SUSettingsStatefulUIManager *)v36 ddmDeclaration];
    id v65 = (id)[(SUCoreDDMDeclaration *)v35 detailsURL];

    if (v65)
    {
      char v21 = NSString;
      id v23 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v22 = (id)[v23 localizedStringForKey:@"MANAGED_DEVICE_ENFORCED_UPDATE_BODY_WITH_URL" value:&stru_26DCD7690 table:@"Software Update"];
      id v10 = (id)objc_msgSend(v21, "stringWithFormat:", v66, v65);
      id v11 = v66;
      id v66 = v10;

      v64.id location = [v66 rangeOfString:v65];
      v64.length = v12;
      id v24 = v72;
      BOOL v13 = (objc_class *)objc_opt_class();
      char v25 = NSStringFromClass(v13);
      objc_msgSend(v24, "setProperty:forKey:");

      id v26 = v72;
      char v27 = NSStringFromRange(v64);
      objc_msgSend(v26, "setProperty:forKey:");

      [v72 setProperty:v65 forKey:*MEMORY[0x263F600F0]];
    }
    [v72 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    [v72 setProperty:v66 forKey:*MEMORY[0x263F600F8]];
    objc_storeStrong(&v65, 0);
    objc_storeStrong(&v66, 0);
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v69, 0);
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
  }
  else
  {
    char v62 = 0;
    char v60 = 0;
    char v20 = 0;
    if (v74 == 4)
    {
      char v20 = 0;
      if (![(SUSUISoftwareUpdateController *)v76 presentingStatefulDescriptorPromotedAsAlternate])
      {
        id v63 = [(SUSUISoftwareUpdateController *)v76 manager];
        char v62 = 1;
        char v19 = 1;
        if (![(SUSettingsStatefulUIManager *)v63 isDelayingUpdate])
        {
          int v61 = [(SUSUISoftwareUpdateController *)v76 manager];
          char v60 = 1;
          char v19 = [(SUSettingsStatefulUIManager *)v61 hasSUPathRestrictions];
        }
        char v20 = v19;
      }
    }
    if (v60) {

    }
    if (v62) {
    if (v20)
    }
    {
      [v72 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
      id v18 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v17 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"MANAGED_DEVICE_DELAY_EXPIRED_AVAILABLE"];
      id v16 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:");
      objc_msgSend(v72, "setProperty:forKey:");
    }
    else
    {
      [v72 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F5FEF8]];
      [v72 setProperty:&stru_26DCD7690 forKey:*MEMORY[0x263F600F8]];
    }
  }
  id v15 = v72;
  objc_storeStrong(&v72, 0);
  return v15;
}

- (id)specifierForAutomaticUpdatesWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  char v27 = self;
  v26[3] = (id)a2;
  v26[2] = (id)a3;
  v26[1] = (id)a4;
  char v25 = 0;
  v26[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUAutomaticUpdateButton"];

  if (!v26[0])
  {
    char v21 = (void *)MEMORY[0x263F5FC40];
    id v22 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v23 = (id)[v22 localizedStringForKey:@"AUTOMATIC_UPDATES" value:&stru_26DCD7690 table:@"Software Update"];
    objc_opt_class();
    id v4 = (id)objc_msgSend(v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, v27, 0);
    id v5 = v26[0];
    v26[0] = v4;

    [v26[0] setProperty:@"SUAutomaticUpdateButton" forKey:*MEMORY[0x263F60138]];
    [(SUSUISoftwareUpdateController *)v27 setAutomaticUpdatesCell:0];
  }
  id v6 = [(SUSUISoftwareUpdateController *)v27 automaticUpdatesCell];
  BOOL v20 = v6 != 0;

  if (!v20)
  {
    id v19 = (id)[objc_alloc(MEMORY[0x263F5FCA0]) initWithStyle:0 reuseIdentifier:@"SUAutomaticUpdateButton" specifier:v26[0]];
    -[SUSUISoftwareUpdateController setAutomaticUpdatesCell:](v27, "setAutomaticUpdatesCell:");
  }
  id location = (id)[MEMORY[0x263F82918] valueCellConfiguration];
  id v12 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = (id)[v12 localizedStringForKey:@"AUTOMATIC_UPDATES" value:&stru_26DCD7690 table:@"Software Update"];
  objc_msgSend(location, "setText:");

  id v13 = [(SUSUISoftwareUpdateController *)v27 automaticUpdatesCellTitle];
  objc_msgSend(location, "setSecondaryText:");

  id v14 = [(SUSUISoftwareUpdateController *)v27 automaticUpdatesCell];
  [(PSTableCell *)v14 setContentConfiguration:location];

  id v15 = [(SUSUISoftwareUpdateController *)v27 automaticUpdatesCell];
  [(PSTableCell *)v15 setAccessibilityIdentifier:@"SUAutomaticUpdateButton"];

  id v16 = [(SUSUISoftwareUpdateController *)v27 automaticUpdatesCell];
  [(PSTableCell *)v16 setAccessoryType:1];

  id v17 = [(SUSUISoftwareUpdateController *)v27 automaticUpdatesCell];
  [(PSTableCell *)v17 setUserInteractionEnabled:![(SUSUISoftwareUpdateController *)v27 isBusy]];

  [v26[0] setProperty:&unk_26DCE4B30 forKey:*MEMORY[0x263F5FEE8]];
  id v7 = (id)[v26[0] propertyForKey:*MEMORY[0x263F602B0]];
  BOOL v18 = v7 != 0;

  if (!v18)
  {
    id v10 = [(SUSUISoftwareUpdateController *)v27 automaticUpdatesCell];
    objc_msgSend(v26[0], "setProperty:forKey:");
  }
  id v9 = v26[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v26, 0);
  return v9;
}

- (id)specifierForBetaUpdatesCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v24 = self;
  v23[3] = (id)a2;
  v23[2] = (id)a3;
  v23[1] = (id)a4;
  v23[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUGetBetaUpdatesButton"];
  if (!v23[0])
  {
    id v19 = (void *)MEMORY[0x263F5FC40];
    id v21 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v20 = (id)[v21 localizedStringForKey:@"GET_BETA_UPDATES" value:&stru_26DCD7690 table:@"Software Update"];
    objc_opt_class();
    v23[0] = (id)objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, v24, 0);

    [v23[0] setProperty:@"SUGetBetaUpdatesButton" forKey:*MEMORY[0x263F60138]];
    [(SUSUISoftwareUpdateController *)v24 setBetaUpdatesCell:0];
  }
  id v4 = [(SUSUISoftwareUpdateController *)v24 betaUpdatesCell];
  BOOL v18 = v4 != 0;

  if (!v18)
  {
    id v17 = (id)[objc_alloc(MEMORY[0x263F5FCA0]) initWithStyle:0 reuseIdentifier:@"SUGetBetaUpdatesButton" specifier:v23[0]];
    -[SUSUISoftwareUpdateController setBetaUpdatesCell:](v24, "setBetaUpdatesCell:");
  }
  id location = (id)[MEMORY[0x263F82918] valueCellConfiguration];
  id v10 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = (id)[v10 localizedStringForKey:@"GET_BETA_UPDATES" value:&stru_26DCD7690 table:@"Software Update"];
  objc_msgSend(location, "setText:");

  id v11 = [(SUSUISoftwareUpdateController *)v24 isBetaUpdatesEnabled];
  objc_msgSend(location, "setSecondaryText:");

  id v12 = [(SUSUISoftwareUpdateController *)v24 betaUpdatesCell];
  [(PSTableCell *)v12 setContentConfiguration:location];

  id v13 = [(SUSUISoftwareUpdateController *)v24 betaUpdatesCell];
  [(PSTableCell *)v13 setAccessibilityIdentifier:@"SUGetBetaUpdatesButton"];

  id v14 = [(SUSUISoftwareUpdateController *)v24 betaUpdatesCell];
  [(PSTableCell *)v14 setAccessoryType:1];

  id v15 = [(SUSUISoftwareUpdateController *)v24 betaUpdatesCell];
  [(PSTableCell *)v15 setUserInteractionEnabled:![(SUSUISoftwareUpdateController *)v24 isBusy]];

  [v23[0] setProperty:&unk_26DCE4B30 forKey:*MEMORY[0x263F5FEE8]];
  id v5 = (id)[v23[0] propertyForKey:*MEMORY[0x263F602B0]];
  BOOL v16 = v5 != 0;

  if (!v16)
  {
    id v8 = [(SUSUISoftwareUpdateController *)v24 betaUpdatesCell];
    objc_msgSend(v23[0], "setProperty:forKey:");
  }
  id v7 = v23[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v23, 0);
  return v7;
}

- (id)specifierForScanHeaderGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  v8[4] = self;
  v8[3] = (id)a2;
  v8[2] = (id)a3;
  v8[1] = (id)a4;
  v8[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUScanHeaderGroup"];
  if (!v8[0])
  {
    v8[0] = (id)[MEMORY[0x263F5FC40] emptyGroupSpecifier];

    [v8[0] setProperty:@"SUScanHeaderGroup" forKey:*MEMORY[0x263F60138]];
    id v4 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v4);
    objc_msgSend(v8[0], "setProperty:forKey:");

    [v8[0] setProperty:&unk_26DCE4B48 forKey:@"SUHeight"];
  }
  id v6 = v8[0];
  objc_storeStrong(v8, 0);
  return v6;
}

- (id)specifierForScanFooterGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  v8[4] = self;
  v8[3] = (id)a2;
  v8[2] = (id)a3;
  v8[1] = (id)a4;
  v8[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUScanFooterGroup"];
  if (!v8[0])
  {
    v8[0] = (id)[MEMORY[0x263F5FC40] emptyGroupSpecifier];

    [v8[0] setProperty:@"SUScanFooterGroup" forKey:*MEMORY[0x263F60138]];
    id v4 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v4);
    objc_msgSend(v8[0], "setProperty:forKey:");

    [v8[0] setProperty:&unk_26DCE4B48 forKey:@"SUHeight"];
  }
  id v6 = v8[0];
  objc_storeStrong(v8, 0);
  return v6;
}

- (id)specifierForScanStatusWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  v8[4] = self;
  v8[3] = (id)a2;
  v8[2] = (id)a3;
  v8[1] = (id)a4;
  v8[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUScanStatusGroup"];
  if (!v8[0])
  {
    v8[0] = (id)[MEMORY[0x263F5FC40] emptyGroupSpecifier];

    [v8[0] setProperty:@"SUScanStatusGroup" forKey:*MEMORY[0x263F60138]];
    [v8[0] setProperty:&unk_26DCE4BA8 forKey:@"SUHeight"];
    id v4 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v4);
    objc_msgSend(v8[0], "setProperty:forKey:");
  }
  id v6 = v8[0];
  objc_storeStrong(v8, 0);
  return v6;
}

- (id)specifierForScanStatusCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v17 = self;
  v16[3] = (id)a2;
  v16[2] = (id)a3;
  v16[1] = (id)a4;
  v16[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUScanStatusCell"];
  if (!v16[0])
  {
    v16[0] = (id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

    [v16[0] setProperty:@"SUScanStatusCell" forKey:*MEMORY[0x263F60138]];
    [v16[0] setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  }
  id v4 = [(SUSUISoftwareUpdateController *)v17 scanCell];
  BOOL v15 = v4 != 0;

  if (!v15)
  {
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x263F784D8]), "initWithStyle:reuseIdentifier:specifier:", 3, 0);
    -[SUSUISoftwareUpdateController setScanCell:](v17, "setScanCell:");

    id v14 = [(SUSUISoftwareUpdateController *)v17 scanCell];
    [(SUSSoftwareUpdateScanCell *)v14 setSpecifier:v16[0]];
  }
  id v11 = [(SUSUISoftwareUpdateController *)v17 scanCell];
  -[SUSSoftwareUpdateScanCell setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:");

  [v16[0] setAccessibilityIdentifier:@"SUScanStatusCell"];
  id v5 = (id)[v16[0] propertyForKey:*MEMORY[0x263F602B0]];
  BOOL v12 = v5 != 0;

  if (!v12)
  {
    id v10 = [(SUSUISoftwareUpdateController *)v17 scanCell];
    objc_msgSend(v16[0], "setProperty:forKey:");
  }
  id v7 = v17;
  id v8 = [(SUSUISoftwareUpdateController *)v17 scanCell];
  -[SUSUISoftwareUpdateController configureScanCell:withUIState:descriptorState:](v7, "configureScanCell:withUIState:descriptorState:");

  id v9 = v16[0];
  objc_storeStrong(v16, 0);
  return v9;
}

- (id)specifierForTitleGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v28 = self;
  SEL v27 = a2;
  unint64_t v26 = a3;
  unint64_t v25 = a4;
  id v24 = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUTitleGroup"];
  if (!v24)
  {
    id v24 = (id)[MEMORY[0x263F5FC40] emptyGroupSpecifier];

    [v24 setProperty:@"SUTitleGroup" forKey:*MEMORY[0x263F60138]];
  }
  char v22 = 0;
  char v19 = 1;
  if (![(SUSUISoftwareUpdateController *)v28 shouldShowProactiveSuggestionsSpecifierForUIState:v26 descriptorState:v25])
  {
    id v23 = [(SUSUISoftwareUpdateController *)v28 manager];
    char v22 = 1;
    char v19 = [(SUSettingsStatefulUIManager *)v23 isClearingSpaceForDownload];
  }
  if (v22) {

  }
  if (v19) {
    goto LABEL_24;
  }
  if (v26 == 4 && v25 == 1)
  {
    id location = &stru_26DCD7690;
    if (![(SUSUISoftwareUpdateController *)v28 _shouldHideTonightButton])
    {
      [v24 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
      id v18 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v17 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"UPDATE_OPTIONS_EXPLANATION_FOOTER_TEXT"];
      id v4 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:");
      id v5 = location;
      id location = v4;
    }
    id v15 = (id)[MEMORY[0x263F82670] currentDevice];
    char v16 = objc_msgSend(v15, "sf_isInternalInstall");

    if (v16)
    {
      id v13 = (id)[MEMORY[0x263F78500] sharedDefaults];
      char v14 = [v13 shouldBypassSystemRootWarning];

      if ((v14 & 1) == 0)
      {
        char v20 = 0;
        system_root_status(0, &v20);
        if (v20)
        {
          if (location)
          {
            id v6 = (id)[NSString stringWithFormat:@"%@\n\n%@", location, @"INTERNAL ONLY: Roots may be installed. Try the update again to receive the full replacement."];
            id v7 = location;
            id location = v6;
          }
          else
          {
            objc_storeStrong(&location, @"INTERNAL ONLY: Roots may be installed. Try the update again to receive the full replacement.");
          }
        }
      }
    }
    [v24 setProperty:location forKey:*MEMORY[0x263F600F8]];
    objc_storeStrong(&location, 0);
    goto LABEL_25;
  }
  if (v26 != 4 || v25 != 4)
  {
LABEL_24:
    [v24 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F5FEF8]];
    [v24 setProperty:&stru_26DCD7690 forKey:*MEMORY[0x263F600F8]];
    goto LABEL_25;
  }
  if (![(SUSUISoftwareUpdateController *)v28 _shouldHideTonightButton])
  {
    [v24 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    id v12 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"INSTALL_OPTIONS_EXPLANATION_FOOTER_TEXT"];
    id v10 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:");
    objc_msgSend(v24, "setProperty:forKey:");
  }
LABEL_25:
  id v9 = v24;
  objc_storeStrong(&v24, 0);
  return v9;
}

- (id)specifierForTitleCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v40 = self;
  SEL v39 = a2;
  unint64_t v38 = a3;
  unint64_t v37 = a4;
  id v36 = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUTitleCell"];
  id v35 = [(SUSUISoftwareUpdateController *)v40 presentingDescriptor];
  if (!v36)
  {
    id v36 = (id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

    [v36 setProperty:@"SUTitleCell" forKey:*MEMORY[0x263F60138]];
    [(SUSUISoftwareUpdateController *)v40 setTitleCell:0];
  }
  id v4 = [(SUSUISoftwareUpdateController *)v40 titleCell];
  BOOL v27 = v4 != 0;

  if (!v27)
  {
    id v21 = objc_alloc(MEMORY[0x263F784E8]);
    id v26 = (id)[v35 documentation];
    id v25 = (id)[v26 iconImage];
    id v24 = (id)[v35 documentation];
    id v23 = (id)[v24 releaseNotes];
    char v22 = objc_msgSend(v21, "initWithStyle:reuseIdentifier:specifier:updateIcon:showLearnMore:showSplomboNotes:delegate:", 3, 0, 0, v25, v23 != 0, objc_msgSend(v35, "isSplombo") & 1, v40);
    -[SUSUISoftwareUpdateController setTitleCell:](v40, "setTitleCell:");
  }
  id v10 = [(SUSUISoftwareUpdateController *)v40 titleCell];
  [(SUSSoftwareUpdateTitleCell *)v10 setSpecifier:v36];

  id v13 = [(SUSUISoftwareUpdateController *)v40 titleCell];
  id v12 = (id)[v35 documentation];
  id v11 = (id)[v12 releaseNotesSummary];
  -[SUSSoftwareUpdateTitleCell setReleaseNotesSummary:](v13, "setReleaseNotesSummary:");

  id v15 = [(SUSUISoftwareUpdateController *)v40 titleCell];
  id v14 = (id)[v35 humanReadableUpdateName];
  -[SUSSoftwareUpdateTitleCell setUpdateName:](v15, "setUpdateName:");

  char v16 = [(SUSUISoftwareUpdateController *)v40 titleCell];
  [(SUSSoftwareUpdateTitleCell *)v16 setAccessibilityIdentifier:@"SUTitleCell"];

  char v19 = [(SUSUISoftwareUpdateController *)v40 titleCell];
  id v18 = (id)[v35 documentation];
  id v17 = (id)[v18 iconImage];
  -[SUSSoftwareUpdateTitleCell setUpdateIcon:](v19, "setUpdateIcon:");

  id v5 = (id)[v36 propertyForKey:*MEMORY[0x263F602B0]];
  BOOL v20 = v5 != 0;

  if (!v20)
  {
    id v9 = [(SUSUISoftwareUpdateController *)v40 titleCell];
    objc_msgSend(v36, "setProperty:forKey:");
  }
  [(SUSUISoftwareUpdateController *)v40 _setTitleCellSpecifierStatus:v36 descriptorState:v37];
  queue = MEMORY[0x263EF83A0];
  uint64_t v28 = MEMORY[0x263EF8330];
  int v29 = -1073741824;
  int v30 = 0;
  id v31 = __94__SUSUISoftwareUpdateController_Specifiers__specifierForTitleCellWithUIState_descriptorState___block_invoke;
  id v32 = &unk_26483BAB8;
  id v33 = v40;
  id v34 = v35;
  dispatch_async(queue, &v28);

  id v8 = v36;
  objc_storeStrong(&v34, 0);
  objc_storeStrong((id *)&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  return v8;
}

void __94__SUSUISoftwareUpdateController_Specifiers__specifierForTitleCellWithUIState_descriptorState___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) titleCell];
  id v1 = (id)[*(id *)(a1 + 40) humanReadableUpdateName];
  objc_msgSend(v2, "setUpdateName:");

  id v6 = (id)[*(id *)(a1 + 32) titleCell];
  id v5 = (id)[*(id *)(a1 + 40) documentation];
  id v4 = (id)[v5 iconImage];
  objc_msgSend(v6, "setUpdateIcon:");
}

- (id)specifierForUpdateOptionsWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  char v22 = self;
  SEL v21 = a2;
  unint64_t v20 = a3;
  unint64_t v19 = a4;
  id location = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUSpecifierUpdateOptionsCell"];
  if (!location)
  {
    id location = (id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

    [location setProperty:@"SUSpecifierUpdateOptionsCell" forKey:*MEMORY[0x263F60138]];
    [location setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    [(SUSUISoftwareUpdateController *)v22 setUpdateOptionsCell:0];
  }
  id v4 = [(SUSUISoftwareUpdateController *)v22 updateOptionsCell];
  BOOL v15 = v4 != 0;

  if (!v15)
  {
    id v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F784F0]), "initWithStyle:reuseIdentifier:specifier:", 0);
    -[SUSUISoftwareUpdateController setUpdateOptionsCell:](v22, "setUpdateOptionsCell:");

    id v13 = [(SUSUISoftwareUpdateController *)v22 updateOptionsCell];
    [(SUSSoftwareUpdateUpdateOptionsCell *)v13 setSpecifier:location];

    id v14 = [(SUSUISoftwareUpdateController *)v22 updateOptionsCell];
    [(SUSSoftwareUpdateUpdateOptionsCell *)v14 setAccessibilityIdentifier:@"SUSpecifierUpdateOptionsCell"];
  }
  id v11 = [(SUSUISoftwareUpdateController *)v22 updateOptionsCell];
  objc_msgSend(location, "setProperty:forKey:");

  id v5 = [(SUSUISoftwareUpdateController *)v22 _setInstallButtonButtonSpecifierState:location forUIState:v20 descriptorState:v19];
  id v6 = location;
  id location = v5;

  if (location)
  {
    id v9 = [(SUSUISoftwareUpdateController *)v22 updateOptionsCell];
    char v16 = 0;
    char v10 = 0;
    if ([(SUSSoftwareUpdateUpdateOptionsCell *)v9 isPrimaryButtonHidden])
    {
      id v17 = [(SUSUISoftwareUpdateController *)v22 updateOptionsCell];
      char v16 = 1;
      char v10 = [(SUSSoftwareUpdateUpdateOptionsCell *)v17 isSecondaryButtonHidden];
    }
    if (v16) {

    }
    if (v10)
    {
      id v23 = 0;
    }
    else
    {
      if (v22->_currentActivityStyle) {
        [(SUSUISoftwareUpdateController *)v22 setBusyWithActivityStyle:v22->_currentActivityStyle];
      }
      id v23 = location;
    }
  }
  else
  {
    id v23 = 0;
  }
  objc_storeStrong(&location, 0);
  id v7 = v23;
  return v7;
}

- (id)specifierForProactiveSuggestionCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v58 = self;
  SEL v57 = a2;
  unint64_t v56 = a3;
  unint64_t v55 = a4;
  id v54 = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUProactiveSuggestionCell"];
  if (!v54)
  {
    id v54 = (id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

    [v54 setProperty:@"SUProactiveSuggestionCell" forKey:*MEMORY[0x263F60138]];
    [v54 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    [(SUSUISoftwareUpdateController *)v58 setProactiveSuggestionCell:0];
  }
  id v4 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
  BOOL v51 = v4 != 0;

  if (!v51)
  {
    id v49 = (void *)[objc_alloc(MEMORY[0x263F784C8]) initWithStyle:0 reuseIdentifier:@"SUProactiveSuggestionCell" specifier:v54];
    -[SUSUISoftwareUpdateController setProactiveSuggestionCell:](v58, "setProactiveSuggestionCell:");

    id v50 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
    [(SUSSoftwareUpdateProactiveSuggestionCell *)v50 setSpecifier:v54];
  }
  id v5 = (id)[v54 propertyForKey:*MEMORY[0x263F602B0]];
  BOOL v48 = v5 != 0;

  if (!v48)
  {
    uint64_t v47 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
    objc_msgSend(v54, "setProperty:forKey:");
  }
  unint64_t v53 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionTypeForUIState:v56 descriptorState:v55];
  id v44 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
  -[SUSSoftwareUpdateProactiveSuggestionCell setTitle:](v44, "setTitle:");

  id v45 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
  [(SUSSoftwareUpdateProactiveSuggestionCell *)v45 setContent:&stru_26DCD7690];

  char v46 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
  [(SUSSoftwareUpdateProactiveSuggestionCell *)v46 setAccessibilityIdentifier:@"SUProactiveSuggestionCell"];

  switch(v53)
  {
    case 1uLL:
      id v31 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
      id v30 = (id)[MEMORY[0x263F825C8] systemYellowColor];
      -[SUSSoftwareUpdateProactiveSuggestionCell setSystemIconNamed:withTintColor:](v31, "setSystemIconNamed:withTintColor:", @"exclamationmark.triangle.fill");

      unint64_t v37 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
      id v36 = [(SUSUISoftwareUpdateController *)v58 manager];
      id v35 = [(SUSettingsStatefulUIManager *)v36 errorContextProvider];
      id v34 = [(SUSUISoftwareUpdateController *)v58 presentingDescriptorError];
      id v33 = [(SUSUISoftwareUpdateController *)v58 presentingStatefulDescriptor];
      id v32 = -[SUSettingsStatefulErrorContextProvider localizedTitleForError:statefulDescriptor:](v35, "localizedTitleForError:statefulDescriptor:", v34);
      -[SUSSoftwareUpdateProactiveSuggestionCell setTitle:](v37, "setTitle:");

      id v43 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
      id v42 = [(SUSUISoftwareUpdateController *)v58 manager];
      id v41 = [(SUSettingsStatefulUIManager *)v42 errorContextProvider];
      id v40 = [(SUSUISoftwareUpdateController *)v58 presentingDescriptorError];
      id v39 = [(SUSUISoftwareUpdateController *)v58 presentingStatefulDescriptor];
      id v38 = -[SUSettingsStatefulErrorContextProvider localizedDescriptionForError:statefulDescriptor:](v41, "localizedDescriptionForError:statefulDescriptor:", v40);
      -[SUSSoftwareUpdateProactiveSuggestionCell setContent:](v43, "setContent:");

      break;
    case 2uLL:
      char v22 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
      id v21 = (id)[MEMORY[0x263F825C8] tertiaryLabelColor];
      -[SUSSoftwareUpdateProactiveSuggestionCell setSystemIconNamed:withTintColor:](v22, "setSystemIconNamed:withTintColor:", @"arrow.down.circle.fill");

      id v25 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
      id v24 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v23 = (id)objc_msgSend(v24, "localizedStringForKey:value:table:", @"AUTOMATIC_UPDATE_PROACTIVE_SUGGESTION_CELL_TITLE");
      -[SUSSoftwareUpdateProactiveSuggestionCell setTitle:](v25, "setTitle:");

      int v29 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
      id v28 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v27 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"AUTOMATIC_UPDATE_PROACTIVE_SUGGESTION_CELL_CONTENT"];
      id v26 = (id)objc_msgSend(v28, "localizedStringForKey:value:table:");
      -[SUSSoftwareUpdateProactiveSuggestionCell setContent:](v29, "setContent:");

      break;
    case 3uLL:
      id v9 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
      id v8 = (id)[MEMORY[0x263F825C8] systemGreenColor];
      -[SUSSoftwareUpdateProactiveSuggestionCell setSystemIconNamed:withTintColor:](v9, "setSystemIconNamed:withTintColor:", @"checkmark.circle.fill");

      id v12 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
      id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v10 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", @"UPDATE_SCHEDULED_TITLE");
      -[SUSSoftwareUpdateProactiveSuggestionCell setTitle:](v12, "setTitle:");

      unint64_t v20 = [(SUSUISoftwareUpdateController *)v58 proactiveSuggestionCell];
      id v13 = NSString;
      id v19 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v18 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"UPDATE_SCHEDULED_CONTENT"];
      id v17 = (id)objc_msgSend(v19, "localizedStringForKey:value:table:");
      id v16 = [(SUSUISoftwareUpdateController *)v58 presentingDescriptor];
      id v15 = (id)[v16 humanReadableUpdateName];
      id v14 = (id)objc_msgSend(v13, "stringWithFormat:", v17, v15);
      -[SUSSoftwareUpdateProactiveSuggestionCell setContent:](v20, "setContent:");

      break;
    default:
      id location = _SUSUILoggingFacility();
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v59, v53);
        _os_log_error_impl(&dword_228401000, (os_log_t)location, OS_LOG_TYPE_ERROR, "SUSUIProactiveSuggestionType doesn't support proactive cell for: %lu", v59, 0xCu);
      }
      objc_storeStrong(&location, 0);
      break;
  }
  id v7 = v54;
  objc_storeStrong(&v54, 0);
  return v7;
}

- (id)specifierForProactiveSuggestionGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  v6[4] = self;
  v6[3] = (id)a2;
  v6[2] = (id)a3;
  v6[1] = (id)a4;
  v6[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUProactiveSuggestionGroup"];
  if (!v6[0])
  {
    v6[0] = (id)[MEMORY[0x263F5FC40] emptyGroupSpecifier];

    [v6[0] setProperty:@"SUProactiveSuggestionGroup" forKey:*MEMORY[0x263F60138]];
    [v6[0] setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  }
  id v5 = v6[0];
  objc_storeStrong(v6, 0);
  return v5;
}

- (id)specifierForProactiveSuggestionPrimaryButtonWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v26 = self;
  SEL v25 = a2;
  unint64_t v24 = a3;
  unint64_t v23 = a4;
  id v22 = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUProactiveSuggestionPrimaryButtonCell"];
  if (!v22)
  {
    id v22 = (id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:v26 set:0 get:0 detail:0 cell:13 edit:0];
  }
  id v16 = (id)objc_msgSend(NSNumber, "numberWithInt:", !-[SUSUISoftwareUpdateController isBusy](v26, "isBusy"));
  objc_msgSend(v22, "setProperty:forKey:");

  [v22 setIdentifier:@"SUProactiveSuggestionPrimaryButtonCell"];
  unint64_t v21 = [(SUSUISoftwareUpdateController *)v26 proactiveSuggestionTypeForUIState:v24 descriptorState:v23];
  if (v21 != 1)
  {
    if (v21 == 2)
    {
      id v9 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v8 = (id)[v9 localizedStringForKey:@"INSTALL_ONCE_DOWNLOADED" value:&stru_26DCD7690 table:@"Software Update"];
      objc_msgSend(v22, "setName:");

      [v22 setButtonAction:sel_requestToPromoteTargetedUpdateToUserInitiatedStatus_];
      [v22 setTarget:v26];
    }
    else if (v21 == 3)
    {
      id v7 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v6 = (id)[v7 localizedStringForKey:@"UPDATE_NOW_INSTEAD_BUTTON" value:&stru_26DCD7690 table:@"Software Update"];
      objc_msgSend(v22, "setName:");

      [v22 setButtonAction:sel_install_];
      [v22 setTarget:v26];
    }
    else
    {
      id v17 = _SUSUILoggingFacility();
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v28, v21);
        _os_log_error_impl(&dword_228401000, (os_log_t)v17, OS_LOG_TYPE_ERROR, "SUSUIProactiveSuggestionType doesn't support primary button for: %lu", v28, 0xCu);
      }
      objc_storeStrong(&v17, 0);
    }
    goto LABEL_17;
  }
  id v14 = [(SUSUISoftwareUpdateController *)v26 presentingDescriptorError];
  BOOL v15 = -[SUSUISoftwareUpdateController _errorIsInsufficientSpace:](v26, "_errorIsInsufficientSpace:");

  if (v15)
  {
    id v13 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"MANAGE_STORAGE_BUTTON"];
    id v11 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:");
    objc_msgSend(v22, "setName:");

    [v22 setButtonAction:sel_openStorage];
    [v22 setTarget:v26];
LABEL_17:
    id v27 = v22;
    int v18 = 1;
    goto LABEL_18;
  }
  id location = _SUSUILoggingFacility();
  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(SUSUISoftwareUpdateController *)v26 presentingDescriptorError];
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v29, (uint64_t)"-[SUSUISoftwareUpdateController(Specifiers) specifierForProactiveSuggestionPrimaryButtonWithUIState:descriptorState:]", (uint64_t)v10);
    _os_log_impl(&dword_228401000, (os_log_t)location, v19, "%s: Can't create a button for an unknown error case: %@", v29, 0x16u);
  }
  objc_storeStrong(&location, 0);
  id v27 = 0;
  int v18 = 1;
LABEL_18:
  objc_storeStrong(&v22, 0);
  id v4 = v27;
  return v4;
}

- (id)specifierForProactiveSuggestionSecondaryButtonWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v15 = self;
  SEL v14 = a2;
  unint64_t v13 = a3;
  unint64_t v12 = a4;
  id v11 = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUProactiveSuggestionSecondaryButtonCell"];
  unint64_t v10 = [(SUSUISoftwareUpdateController *)v15 proactiveSuggestionTypeForUIState:v13 descriptorState:v12];
  if (!v11)
  {
    id v11 = (id)objc_msgSend(MEMORY[0x263F5FC40], "deleteButtonSpecifierWithName:target:action:", 0, v15);

    [v11 setProperty:&unk_26DCE4B60 forKey:*MEMORY[0x263F5FEF0]];
  }
  id v8 = (id)objc_msgSend(NSNumber, "numberWithInt:", !-[SUSUISoftwareUpdateController isBusy](v15, "isBusy"));
  objc_msgSend(v11, "setProperty:forKey:");

  [v11 setIdentifier:@"SUProactiveSuggestionSecondaryButtonCell"];
  if (v10 == 3)
  {
    id v7 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = (id)[v7 localizedStringForKey:@"CANCEL_UPDATE_BUTTON" value:&stru_26DCD7690 table:@"Software Update"];
    objc_msgSend(v11, "setName:");

    [v11 setButtonAction:sel_autoInstallCancelPrompt_];
    [v11 setTarget:v15];
    [v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60000]];
  }
  else
  {
    id location = _SUSUILoggingFacility();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v16, v10);
      _os_log_error_impl(&dword_228401000, (os_log_t)location, OS_LOG_TYPE_ERROR, "SUSUIProactiveSuggestionType doesn't support primary button for: %lu", v16, 0xCu);
    }
    objc_storeStrong(&location, 0);
  }
  id v5 = v11;
  objc_storeStrong(&v11, 0);
  return v5;
}

- (id)specifierForAlternateUpdateGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v11 = self;
  v10[3] = (id)a2;
  v10[2] = (id)a3;
  v10[1] = (id)a4;
  v10[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUAlternateUpdateGroup"];
  if (!v10[0])
  {
    v10[0] = (id)[MEMORY[0x263F5FC40] emptyGroupSpecifier];
  }
  id v6 = [(SUSUISoftwareUpdateController *)v11 alsoAvailableGroupHeaderString];
  objc_msgSend(v5, "setName:");

  [v10[0] setProperty:@"SUAlternateUpdateGroup" forKey:*MEMORY[0x263F60138]];
  id v7 = v10[0];
  id v8 = [(SUSUISoftwareUpdateController *)v11 alternateUpdateFooterString];
  objc_msgSend(v7, "setProperty:forKey:");

  id v9 = v10[0];
  objc_storeStrong(v10, 0);
  return v9;
}

- (id)specifierForAlternateUpdateCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  SEL v25 = self;
  v24[3] = (id)a2;
  v24[2] = (id)a3;
  v24[1] = (id)a4;
  v24[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUAlternateUpdateButton"];
  id v23 = [(SUSUISoftwareUpdateController *)v25 alternateUpdateButtonString];
  if (!v24[0])
  {
    unint64_t v20 = (void *)MEMORY[0x263F5FC40];
    objc_opt_class();
    v24[0] = (id)objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, v25, 0);

    [v24[0] setProperty:@"SUAlternateUpdateButton" forKey:*MEMORY[0x263F60138]];
    [(SUSUISoftwareUpdateController *)v25 setAlternateUpdateCell:0];
  }
  id v4 = [(SUSUISoftwareUpdateController *)v25 alternateUpdateCell];
  BOOL v19 = v4 != 0;

  if (!v19)
  {
    id v18 = (id)[objc_alloc(MEMORY[0x263F5FCA0]) initWithStyle:0 reuseIdentifier:@"SUAlternateUpdateButton" specifier:v24[0]];
    -[SUSUISoftwareUpdateController setAlternateUpdateCell:](v25, "setAlternateUpdateCell:");
  }
  id v22 = (id)[MEMORY[0x263F82918] valueCellConfiguration];
  [v22 setText:v23];
  id v14 = [(SUSUISoftwareUpdateController *)v25 alternateUpdateSubTextString];
  objc_msgSend(v22, "setSecondaryText:");

  id v17 = [(SUSUISoftwareUpdateController *)v25 presentingAlternateDescriptor];
  id v16 = (id)[v17 documentation];
  id v15 = (id)[v16 iconImage];
  id location = -[SUSUISoftwareUpdateController tableCellImageForImage:](v25, "tableCellImageForImage:");

  if (location) {
    [v22 setImage:location];
  }
  id v9 = [(SUSUISoftwareUpdateController *)v25 alternateUpdateCell];
  [(PSTableCell *)v9 setContentConfiguration:v22];

  unint64_t v10 = [(SUSUISoftwareUpdateController *)v25 alternateUpdateCell];
  [(PSTableCell *)v10 setAccessoryType:1];

  id v11 = [(SUSUISoftwareUpdateController *)v25 alternateUpdateCell];
  [(PSTableCell *)v11 setUserInteractionEnabled:![(SUSUISoftwareUpdateController *)v25 isBusy]];

  [v24[0] setProperty:&unk_26DCE4B30 forKey:*MEMORY[0x263F5FEE8]];
  unint64_t v12 = [(SUSUISoftwareUpdateController *)v25 alternateUpdateCell];
  [(PSTableCell *)v12 setAccessibilityIdentifier:@"SUAlternateUpdateButton"];

  id v5 = (id)[v24[0] propertyForKey:*MEMORY[0x263F602B0]];
  BOOL v13 = v5 != 0;

  if (!v13)
  {
    id v8 = [(SUSUISoftwareUpdateController *)v25 alternateUpdateCell];
    objc_msgSend(v24[0], "setProperty:forKey:");
  }
  id v7 = v24[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(v24, 0);
  return v7;
}

- (id)specifierForNonPromotedPrimaryUpdateGroupWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v9 = self;
  v8[3] = (id)a2;
  v8[2] = (id)a3;
  v8[1] = (id)a4;
  v8[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUNonPromotedUpdateHeaderGroup"];
  if (!v8[0])
  {
    v8[0] = (id)[MEMORY[0x263F5FC40] emptyGroupSpecifier];

    [v8[0] setProperty:@"SUNonPromotedUpdateHeaderGroup" forKey:*MEMORY[0x263F60138]];
  }
  id v6 = [(SUSUISoftwareUpdateController *)v9 alsoAvailableGroupHeaderString];
  objc_msgSend(v5, "setName:");

  id v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (id)specifierForNonPromotedPrimaryUpdateCellWithUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  unint64_t v24 = self;
  v23[3] = (id)a2;
  v23[2] = (id)a3;
  v23[1] = (id)a4;
  v23[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUNonPromotedUpdateButton"];
  id v22 = [(SUSUISoftwareUpdateController *)v24 nonPromotedPreferredUpdateButtonString];
  if (!v23[0])
  {
    v23[0] = (id)[MEMORY[0x263F5FC40] preferenceSpecifierNamed:v22 target:v24 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    objc_msgSend(v23[0], "setIdentifier:");
    [v23[0] setProperty:@"SUNonPromotedUpdateButton" forKey:*MEMORY[0x263F60138]];
    [(SUSUISoftwareUpdateController *)v24 setNonPromotedUpdateCell:0];
  }
  id v4 = [(SUSUISoftwareUpdateController *)v24 nonPromotedUpdateCell];
  BOOL v19 = v4 != 0;

  if (!v19)
  {
    id v18 = (id)[objc_alloc(MEMORY[0x263F5FCA0]) initWithStyle:0 reuseIdentifier:@"SUNonPromotedUpdateButton" specifier:v23[0]];
    -[SUSUISoftwareUpdateController setNonPromotedUpdateCell:](v24, "setNonPromotedUpdateCell:");
  }
  id v21 = (id)[MEMORY[0x263F82918] valueCellConfiguration];
  [v21 setText:v22];
  id v14 = [(SUSUISoftwareUpdateController *)v24 alternateUpdateSubTextString];
  objc_msgSend(v21, "setSecondaryText:");

  id v17 = [(SUSUISoftwareUpdateController *)v24 presentingDescriptor];
  id v16 = (id)[v17 documentation];
  id v15 = (id)[v16 iconImage];
  id location = -[SUSUISoftwareUpdateController tableCellImageForImage:](v24, "tableCellImageForImage:");

  if (location) {
    [v21 setImage:location];
  }
  id v9 = [(SUSUISoftwareUpdateController *)v24 nonPromotedUpdateCell];
  [(PSTableCell *)v9 setContentConfiguration:v21];

  unint64_t v10 = [(SUSUISoftwareUpdateController *)v24 nonPromotedUpdateCell];
  [(PSTableCell *)v10 setAccessoryType:1];

  id v11 = [(SUSUISoftwareUpdateController *)v24 nonPromotedUpdateCell];
  [(PSTableCell *)v11 setUserInteractionEnabled:![(SUSUISoftwareUpdateController *)v24 isBusy]];

  [v23[0] setProperty:&unk_26DCE4B30 forKey:*MEMORY[0x263F5FEE8]];
  unint64_t v12 = [(SUSUISoftwareUpdateController *)v24 nonPromotedUpdateCell];
  [(PSTableCell *)v12 setAccessibilityIdentifier:@"SUNonPromotedUpdateButton"];

  id v5 = (id)[v23[0] propertyForKey:*MEMORY[0x263F602B0]];
  BOOL v13 = v5 != 0;

  if (!v13)
  {
    id v8 = [(SUSUISoftwareUpdateController *)v24 nonPromotedUpdateCell];
    objc_msgSend(v23[0], "setProperty:forKey:");
  }
  id v7 = v23[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v23, 0);
  return v7;
}

- (BOOL)shouldShowComingSoonSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  BOOL v5 = 0;
  if (a3 >= 3) {
    return [(SUSUISoftwareUpdateController *)self shouldShowComingSoonTip];
  }
  return v5;
}

- (BOOL)shouldShowAutomaticUpdatesSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return a3 != 0;
}

- (BOOL)shouldShowBetaUpdatesCellSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  if (a3 <= 1) {
    return 0;
  }
  if ((_os_feature_enabled_impl() & 1) == 0) {
    return 0;
  }
  id v5 = (id)[MEMORY[0x263F67CE8] sharedManager];
  BOOL v6 = [v5 canCurrentDeviceEnrollInBetaUpdates] & 1;

  return v6;
}

- (BOOL)shouldShowEnforcedUpdateForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  char v8 = 0;
  char v6 = 0;
  char v5 = 0;
  if (a3 == 4)
  {
    char v5 = 0;
    if (![(SUSUISoftwareUpdateController *)self presentingStatefulDescriptorPromotedAsAlternate])
    {
      id v9 = [(SUSUISoftwareUpdateController *)self manager];
      char v8 = 1;
      id v7 = [(SUSettingsStatefulUIManager *)v9 ddmDeclaration];
      char v6 = 1;
      char v5 = [(SUCoreDDMDeclaration *)v7 isValidDeclaration];
    }
  }
  if (v6) {

  }
  if (v8) {
  return v5 & 1;
  }
}

- (BOOL)shouldShowDeferredUpdateGroupForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  char v9 = 0;
  char v7 = 0;
  char v6 = 0;
  if (a3 == 4)
  {
    char v6 = 0;
    if (![(SUSUISoftwareUpdateController *)self presentingStatefulDescriptorPromotedAsAlternate])
    {
      unint64_t v10 = [(SUSUISoftwareUpdateController *)self manager];
      char v9 = 1;
      char v5 = 1;
      if (![(SUSettingsStatefulUIManager *)v10 isDelayingUpdate])
      {
        char v8 = [(SUSUISoftwareUpdateController *)self manager];
        char v7 = 1;
        char v5 = [(SUSettingsStatefulUIManager *)v8 hasSUPathRestrictions];
      }
      char v6 = v5;
    }
  }
  if (v7) {

  }
  if (v9) {
  return v6 & 1;
  }
}

- (BOOL)shouldShowScanGroupSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  BOOL v5 = 1;
  if (a3 > 3) {
    return [(SUSUISoftwareUpdateController *)self presentingStatefulDescriptorPromotedAsAlternate];
  }
  return v5;
}

- (BOOL)shouldShowScanStatusSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  BOOL v5 = 1;
  if (a3 > 3) {
    return [(SUSUISoftwareUpdateController *)self presentingStatefulDescriptorPromotedAsAlternate];
  }
  return v5;
}

- (BOOL)shouldShowTitleGroupSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  LOBYTE(v5) = 0;
  if (a3 == 4) {
    int v5 = ![(SUSUISoftwareUpdateController *)self presentingStatefulDescriptorPromotedAsAlternate];
  }
  return v5 & 1;
}

- (BOOL)shouldShowTitleCellSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  LOBYTE(v5) = 0;
  if (a3 == 4) {
    int v5 = ![(SUSUISoftwareUpdateController *)self presentingStatefulDescriptorPromotedAsAlternate];
  }
  return v5 & 1;
}

- (BOOL)shouldShowUpdateOptionsCellSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  if (a3 <= 3
    || [(SUSUISoftwareUpdateController *)self presentingStatefulDescriptorPromotedAsAlternate])
  {
    return 0;
  }
  else
  {
    id v6 = [(SUSUISoftwareUpdateController *)self presentingDescriptorError];
    char v16 = 0;
    char v14 = 0;
    char v12 = 0;
    char v10 = 0;
    LOBYTE(v7) = 0;
    if (v6)
    {
      id v17 = [(SUSUISoftwareUpdateController *)self manager];
      char v16 = 1;
      id v15 = [(SUSettingsStatefulUIManager *)v17 errorContextProvider];
      char v14 = 1;
      id v13 = [(SUSUISoftwareUpdateController *)self presentingDescriptorError];
      char v12 = 1;
      id v11 = [(SUSUISoftwareUpdateController *)self presentingStatefulDescriptor];
      char v10 = 1;
      int v7 = !-[SUSettingsStatefulErrorContextProvider shouldEnableUpdateButtonForError:statefulDescriptor:](v15, "shouldEnableUpdateButtonForError:statefulDescriptor:", v13);
    }
    if (v10) {

    }
    if (v12) {
    if (v14)
    }

    if (v16) {
    if (v7)
    }
    {
      return 0;
    }
    else
    {
      char v8 = 0;
      BOOL v5 = 0;
      if (a4 == 4)
      {
        BOOL v5 = 0;
        if ([(SUSUISoftwareUpdateController *)self presentingStatefulDescriptorIsTargetedUpdate])
        {
          char v9 = [(SUSUISoftwareUpdateController *)self manager];
          char v8 = 1;
          BOOL v5 = [(SUSettingsStatefulUIManager *)v9 isTargetedUpdateScheduledForAutoInstall];
        }
      }
      if (v8) {

      }
      return !v5;
    }
  }
}

- (BOOL)shouldShowProactiveSuggestionsSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return -[SUSUISoftwareUpdateController proactiveSuggestionTypeForUIState:descriptorState:](self, "proactiveSuggestionTypeForUIState:descriptorState:", a3, a4, a4, a3, a2, self) != 0;
}

- (BOOL)shouldShowProactiveSuggestionsPrimaryButtonSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  unint64_t v9 = [(SUSUISoftwareUpdateController *)self proactiveSuggestionTypeForUIState:a3 descriptorState:a4];
  if (v9 == 1)
  {
    id v5 = [(SUSUISoftwareUpdateController *)self presentingDescriptorError];
    char v7 = 0;
    BOOL v6 = 0;
    if (v5)
    {
      id v8 = [(SUSUISoftwareUpdateController *)self presentingDescriptorError];
      char v7 = 1;
      BOOL v6 = -[SUSUISoftwareUpdateController _errorIsInsufficientSpace:](self, "_errorIsInsufficientSpace:");
    }
    BOOL v11 = v6;
    if (v7) {
  }
    }
  else
  {
    return v9 != 0;
  }
  return v11;
}

- (BOOL)shouldShowProactiveSuggestionsSecondaryButtonSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return -[SUSUISoftwareUpdateController proactiveSuggestionTypeForUIState:descriptorState:](self, "proactiveSuggestionTypeForUIState:descriptorState:", a3, a4, a4, a3, a2, self) == 3;
}

- (BOOL)shouldShowAlternateUpdateGroupForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return -[SUSUISoftwareUpdateController shouldShowAlternateUpdateCellForUIState:descriptorState:](self, "shouldShowAlternateUpdateCellForUIState:descriptorState:", a3, a4, a4, a3, a2, self);
}

- (BOOL)shouldShowAlternateUpdateCellForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  id v6 = [(SUSUISoftwareUpdateController *)self presentingStatefulDescriptor];
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  LOBYTE(v7) = 0;
  if ((unint64_t)[v6 currentState] >= 4)
  {
    id v13 = [(SUSUISoftwareUpdateController *)self manager];
    char v12 = 1;
    BOOL v11 = [(SUSettingsStatefulUIManager *)v13 currentDownload];
    char v10 = 1;
    unint64_t v9 = [(SUDownload *)v11 downloadOptions];
    char v8 = 1;
    int v7 = [(SUDownloadOptions *)v9 isAutoDownload] ^ 1;
  }
  if (v8) {

  }
  if (v10) {
  if (v12)
  }

  if (v7)
  {
    char v16 = 0;
  }
  else
  {
    LOBYTE(v5) = 0;
    if ([(SUSUISoftwareUpdateController *)self hasAlternateUpdate])
    {
      LOBYTE(v5) = 0;
      if (a3 == 4) {
        int v5 = ![(SUSUISoftwareUpdateController *)self presentingStatefulDescriptorPromotedAsAlternate];
      }
    }
    char v16 = v5 & 1;
  }
  return v16 & 1;
}

- (BOOL)shouldShowNonPromotedGroupForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return -[SUSUISoftwareUpdateController shouldShowNonPromotedCellForUIState:descriptorState:](self, "shouldShowNonPromotedCellForUIState:descriptorState:", a3, a4, a4, a3, a2, self);
}

- (BOOL)shouldShowNonPromotedCellForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  BOOL v5 = 0;
  if (a3 == 4) {
    return [(SUSUISoftwareUpdateController *)self presentingStatefulDescriptorPromotedAsAlternate];
  }
  return v5;
}

- (id)_setInstallButtonButtonSpecifierState:(id)a3 forUIState:(unint64_t)a4 descriptorState:(unint64_t)a5
{
  unint64_t v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v18 = a4;
  unint64_t v17 = a5;
  if (location[0])
  {
    if ([(SUSUISoftwareUpdateController *)v20 shouldShowUpdateOptionsCellSpecifierForUIState:v18 descriptorState:v17])
    {
      char v12 = 0;
      [(SUSUISoftwareUpdateController *)v20 setupInstallButton:location[0] forUIState:v18 descriptorState:v17 shouldRemove:&v12];
      int v7 = [(SUSUISoftwareUpdateController *)v20 updateOptionsCell];
      [(SUSSoftwareUpdateUpdateOptionsCell *)v7 setEnabled:![(SUSUISoftwareUpdateController *)v20 isBusy]];

      if (v12) {
        objc_storeStrong(location, 0);
      }
    }
    id v21 = location[0];
    int v13 = 1;
  }
  else
  {
    id v16 = _SUSUILoggingFacility();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = v16;
      os_log_type_t type = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_impl(&dword_228401000, log, type, "Unable to set install button state on nil install button specifier", v14, 2u);
    }
    objc_storeStrong(&v16, 0);
    id v21 = 0;
    int v13 = 1;
  }
  objc_storeStrong(location, 0);
  BOOL v5 = v21;
  return v5;
}

- (void)clearInstallButton:(id)a3
{
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = [(SUSUISoftwareUpdateController *)v12 updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v3 setEnabled:0];

  id v4 = [(SUSUISoftwareUpdateController *)v12 updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v4 setHidden:1];

  BOOL v5 = [(SUSUISoftwareUpdateController *)v12 updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v5 setActivityIndicatorDisplayStyle:0];

  id v6 = [(SUSUISoftwareUpdateController *)v12 updateOptionsCell];
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v6, "setPrimaryButtonText:");

  int v7 = [(SUSUISoftwareUpdateController *)v12 updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v7 setSecondaryButtonText:&stru_26DCD7690];

  char v8 = [(SUSUISoftwareUpdateController *)v12 updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v8 setPrimaryButtonActionHandler:0];

  unint64_t v9 = [(SUSUISoftwareUpdateController *)v12 updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v9 setPrimaryButtonLongTapActionHandler:0];

  char v10 = [(SUSUISoftwareUpdateController *)v12 updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v10 setSecondaryButtonActionHandler:0];

  objc_storeStrong(location, 0);
}

- (void)setupInstallButton:(id)a3 forUIState:(unint64_t)a4 descriptorState:(unint64_t)a5 shouldRemove:(BOOL *)a6
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateController *)v23 clearInstallButton:location[0]];
  if (a4 == 4)
  {
    if (a5 <= 1)
    {
      unint64_t v7 = a5 - 1;
      char v6 = 0;
    }
    else
    {
      unint64_t v7 = a5 - 1;
      char v6 = 1;
    }
    if ((v6 & 1) == 0)
    {
      switch(v7)
      {
        case 0uLL:
          [(SUSUISoftwareUpdateController *)v23 setInstallButtonDownloadAndInstall:location[0] shouldRemove:a6];
          break;
        case 1uLL:
          [(SUSUISoftwareUpdateController *)v23 setInstallButtonDownloading:location[0] shouldRemove:a6];
          break;
        case 2uLL:
          [(SUSUISoftwareUpdateController *)v23 setInstallButtonStalled:location[0] shouldRemove:a6];
          break;
        case 3uLL:
          [(SUSUISoftwareUpdateController *)v23 setInstallButtonReadyToInstall:location[0]];
          break;
        case 4uLL:
          [(SUSUISoftwareUpdateController *)v23 setInstallButtonInstalling:location[0]];
          break;
        default:
          JUMPOUT(0);
      }
    }
    char v20 = 0;
    char v18 = 0;
    char v16 = 0;
    char v14 = 0;
    char v12 = 0;
    LOBYTE(v8) = 0;
    if (a6)
    {
      id v21 = [(SUSUISoftwareUpdateController *)v23 presentingDescriptorError];
      char v20 = 1;
      LOBYTE(v8) = 0;
      if (v21)
      {
        BOOL v19 = [(SUSUISoftwareUpdateController *)v23 manager];
        char v18 = 1;
        unint64_t v17 = [(SUSettingsStatefulUIManager *)v19 errorContextProvider];
        char v16 = 1;
        id v15 = [(SUSUISoftwareUpdateController *)v23 presentingDescriptorError];
        char v14 = 1;
        id v13 = [(SUSUISoftwareUpdateController *)v23 presentingStatefulDescriptor];
        char v12 = 1;
        int v8 = !-[SUSettingsStatefulErrorContextProvider shouldEnableUpdateButtonForError:statefulDescriptor:](v17, "shouldEnableUpdateButtonForError:statefulDescriptor:", v15);
      }
    }
    if (v12) {

    }
    if (v14) {
    if (v16)
    }

    if (v18) {
    if (v20)
    }

    if (v8) {
      *a6 = 1;
    }
  }
  else
  {
    *a6 = 1;
  }
  objc_storeStrong(location, 0);
}

- (BOOL)clientIsSUSettings
{
  v5[2] = self;
  v5[1] = (id)a2;
  id v3 = (id)[MEMORY[0x263F086E0] mainBundle];
  v5[0] = (id)[v3 bundleIdentifier];

  char v4 = [v5[0] isEqualToString:@"com.apple.Preferences"];
  objc_storeStrong(v5, 0);
  return v4 & 1;
}

- (void)setInstallButtonStalled:(id)a3 shouldRemove:(BOOL *)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (PSIsRunningInAssistant())
  {
LABEL_2:
    [(SUSUISoftwareUpdateController *)v13 setInstallButtonPaused:location[0]];
    goto LABEL_14;
  }
  if ([(SUSUISoftwareUpdateController *)v13 presentingStatefulDescriptorIsTargetedUpdate])
  {
    char v10 = 0;
    BOOL v8 = 1;
    if ([(SUSUISoftwareUpdateController *)v13 clientIsSUSettings])
    {
      id v11 = [(SUSUISoftwareUpdateController *)v13 presentingDescriptorError];
      char v10 = 1;
      BOOL v8 = v11 != 0;
    }
    if (v10) {

    }
    if (v8) {
      goto LABEL_2;
    }
    if (a4) {
      *a4 = 1;
    }
  }
  else
  {
    char v6 = [(SUSUISoftwareUpdateController *)v13 manager];
    BOOL v5 = [(SUSettingsStatefulUIManager *)v6 currentDownload];
    char v4 = [(SUDownload *)v5 downloadOptions];
    char v7 = [(SUDownloadOptions *)v4 isAutoDownload];

    if (v7) {
      [(SUSUISoftwareUpdateController *)v13 setInstallButtonDownloadAndInstall:location[0]];
    }
  }
LABEL_14:
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonDownloading:(id)a3 shouldRemove:(BOOL *)a4
{
  char v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v12 = a4;
  BOOL v8 = [(SUSUISoftwareUpdateController *)v14 manager];
  char v7 = [(SUSettingsStatefulUIManager *)v8 currentDownload];
  char v6 = [(SUDownload *)v7 progress];
  id v11 = (id)[(SUOperationProgress *)v6 phase];

  if (PSIsRunningInAssistant())
  {
    [(SUSUISoftwareUpdateController *)v14 downloadingButtonForSpecifier:location[0]];
  }
  else if ([(SUSUISoftwareUpdateController *)v14 presentingStatefulDescriptorIsTargetedUpdate])
  {
    char v9 = 0;
    char v4 = 1;
    if (([v11 isEqualToString:*MEMORY[0x263F78428]] & 1) == 0)
    {
      id v10 = getkSUDownloadPhasePreparingForInstallation_0();
      char v9 = 1;
      char v4 = 1;
      if ((objc_msgSend(v11, "isEqualToString:") & 1) == 0)
      {
        char v4 = 1;
        if (([v11 isEqualToString:*MEMORY[0x263F78430]] & 1) == 0) {
          char v4 = [(SUSUISoftwareUpdateController *)v14 waitingOnSUAssetDownload:v11];
        }
      }
    }
    if (v9) {

    }
    if ((v4 & 1) != 0 && v12) {
      *char v12 = 1;
    }
  }
  else
  {
    [(SUSUISoftwareUpdateController *)v14 setInstallButtonDownloadAndInstall:location[0]];
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonReadyToInstall:(id)a3
{
  char v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(SUSUISoftwareUpdateController *)v4 presentingStatefulDescriptorIsTargetedUpdate]|| (PSIsRunningInAssistant() & 1) != 0)
  {
    [(SUSUISoftwareUpdateController *)v4 setInstallButtonInstallNow:location[0]];
  }
  else
  {
    [(SUSUISoftwareUpdateController *)v4 setInstallButtonDownloadAndInstall:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonInstalling:(id)a3
{
  char v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(SUSUISoftwareUpdateController *)v4 presentingStatefulDescriptorIsTargetedUpdate]|| (PSIsRunningInAssistant() & 1) != 0)
  {
    [(SUSUISoftwareUpdateController *)v4 setInstallButtonInstallingForSpecifier:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonDownloadAndInstall:(id)a3
{
  char v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateController *)v4 setInstallButtonDownloadAndInstall:location[0] shouldRemove:0];
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonDownloadAndInstall:(id)a3 shouldRemove:(BOOL *)a4
{
  v69[2] = *MEMORY[0x263EF8340];
  uint64_t v68 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v66 = a4;
  char v65 = 0;
  objc_initWeak(&from, v68);
  id v33 = [(SUSUISoftwareUpdateController *)v68 manager];
  BOOL v34 = [(SUSettingsStatefulUIManager *)v33 isClearingSpaceForDownload];

  if (v34)
  {
    char v65 = 1;
  }
  else
  {
    id v32 = [(SUSUISoftwareUpdateController *)v68 updateOptionsCell];
    id v31 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v30 = (id)[v31 localizedStringForKey:@"UPDATE_NOW" value:&stru_26DCD7690 table:@"Software Update"];
    -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v32, "setPrimaryButtonText:");

    int v29 = [(SUSUISoftwareUpdateController *)v68 updateOptionsCell];
    uint64_t v58 = MEMORY[0x263EF8330];
    int v59 = -1073741824;
    int v60 = 0;
    int v61 = __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke;
    char v62 = &unk_26483E380;
    objc_copyWeak(v63, &from);
    [(SUSSoftwareUpdateUpdateOptionsCell *)v29 setPrimaryButtonActionHandler:&v58];

    char v57 = [(SUSUISoftwareUpdateController *)v68 _shouldHideTonightButton];
    if (!v57)
    {
      id v28 = [(SUSUISoftwareUpdateController *)v68 updateOptionsCell];
      id v27 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v26 = (id)[v27 localizedStringForKey:@"UPDATE_TONIGHT" value:&stru_26DCD7690 table:@"Software Update"];
      -[SUSSoftwareUpdateUpdateOptionsCell setSecondaryButtonText:](v28, "setSecondaryButtonText:");

      SEL v25 = [(SUSUISoftwareUpdateController *)v68 updateOptionsCell];
      uint64_t v51 = MEMORY[0x263EF8330];
      int v52 = -1073741824;
      int v53 = 0;
      id v54 = __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke_2;
      unint64_t v55 = &unk_26483E380;
      objc_copyWeak(&v56, &from);
      [(SUSSoftwareUpdateUpdateOptionsCell *)v25 setSecondaryButtonActionHandler:&v51];

      id v23 = (void *)MEMORY[0x263F82940];
      unint64_t v24 = (void *)MEMORY[0x263F823D0];
      id v22 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v21 = (id)[v22 localizedStringForKey:@"UPDATE_TONIGHT" value:&stru_26DCD7690 table:@"Software Update"];
      id v20 = (id)[MEMORY[0x263F827E8] systemImageNamed:@"clock"];
      uint64_t v44 = MEMORY[0x263EF8330];
      int v45 = -1073741824;
      int v46 = 0;
      uint64_t v47 = __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke_3;
      BOOL v48 = &unk_26483E3A8;
      objc_copyWeak(&v49, &from);
      id v18 = (id)[v24 actionWithTitle:v21 image:v20 identifier:@"SUUpdateTonight" handler:&v44];
      v69[0] = v18;
      BOOL v19 = (void *)MEMORY[0x263F823D0];
      id v17 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v16 = (id)[v17 localizedStringForKey:@"DOWNLOAD_ONLY" value:&stru_26DCD7690 table:@"Software Update"];
      id v15 = (id)[MEMORY[0x263F827E8] systemImageNamed:@"arrow.down.circle"];
      uint64_t v38 = MEMORY[0x263EF8330];
      int v39 = -1073741824;
      int v40 = 0;
      id v41 = __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke_4;
      id v42 = &unk_26483E3A8;
      objc_copyWeak(&v43, &from);
      id v14 = (id)[v19 actionWithTitle:v16 image:v15 identifier:@"SUDownloadOnly" handler:&v38];
      v69[1] = v14;
      id v13 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:2];
      id v50 = (id)objc_msgSend(v23, "menuWithTitle:image:identifier:options:children:", &stru_26DCD7690, 0, 0, 33);

      char v12 = [(SUSUISoftwareUpdateController *)v68 updateOptionsCell];
      [(SUSSoftwareUpdateUpdateOptionsCell *)v12 setSecondaryButtonMenu:v50];

      objc_storeStrong(&v50, 0);
      objc_destroyWeak(&v43);
      objc_destroyWeak(&v49);
      objc_destroyWeak(&v56);
    }
    id v11 = [(SUSUISoftwareUpdateController *)v68 updateOptionsCell];
    [(SUSSoftwareUpdateUpdateOptionsCell *)v11 setEnabled:1];

    id v10 = [(SUSUISoftwareUpdateController *)v68 updateOptionsCell];
    [(SUSSoftwareUpdateUpdateOptionsCell *)v10 setHidden:0];

    if (v57)
    {
      char v9 = [(SUSUISoftwareUpdateController *)v68 updateOptionsCell];
      [(SUSSoftwareUpdateUpdateOptionsCell *)v9 setSecondaryButtonEnabled:0];

      BOOL v8 = [(SUSUISoftwareUpdateController *)v68 updateOptionsCell];
      [(SUSSoftwareUpdateUpdateOptionsCell *)v8 setSecondaryButtonHidden:1];
    }
    id v7 = [(SUSUISoftwareUpdateController *)v68 presentingDescriptorError];

    if (v7)
    {
      char v6 = v68;
      char v36 = 0;
      id v5 = [(SUSUISoftwareUpdateController *)v68 presentingDescriptorError];
      LOBYTE(v4) = 1;
      if (!-[SUSUISoftwareUpdateController _errorIsInsufficientSpace:](v6, "_errorIsInsufficientSpace:"))
      {
        id v37 = [(SUSUISoftwareUpdateController *)v68 presentingStatefulDescriptor];
        char v36 = 1;
        int v4 = [v37 updateDownloadable] ^ 1;
      }
      char v65 = v4 & 1;
      if (v36) {
    }
      }
    objc_destroyWeak(v63);
  }
  if (v66) {
    BOOL *v66 = v65 & 1;
  }
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    id v1 = (id)[location[0] updateOptionsCell];
    objc_msgSend(location[0], "downloadAndInstall:");
  }
  objc_storeStrong(location, 0);
}

void __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke_2(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    id v1 = (id)[location[0] updateOptionsCell];
    objc_msgSend(location[0], "downloadAndInstallTonight:");
  }
  objc_storeStrong(location, 0);
}

void __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke_3(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  if (v4[0])
  {
    id v2 = (id)[v4[0] updateOptionsCell];
    objc_msgSend(v4[0], "downloadAndInstallTonight:");
  }
  objc_storeStrong(v4, 0);
  objc_storeStrong(location, 0);
}

void __93__SUSUISoftwareUpdateController_Specifiers__setInstallButtonDownloadAndInstall_shouldRemove___block_invoke_4(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  if (v4[0])
  {
    id v2 = (id)[v4[0] updateOptionsCell];
    objc_msgSend(v4[0], "downloadOnly:");
  }
  objc_storeStrong(v4, 0);
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonPaused:(id)a3
{
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SUSUISoftwareUpdateController *)v8 updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v3 setPrimaryButtonHidden:0];

  char v6 = [(SUSUISoftwareUpdateController *)v8 updateOptionsCell];
  id v5 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = (id)[v5 localizedStringForKey:@"PAUSED" value:&stru_26DCD7690 table:@"Software Update"];
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v6, "setPrimaryButtonText:");

  objc_storeStrong(location, 0);
}

- (void)downloadingButtonForSpecifier:(id)a3
{
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SUSUISoftwareUpdateController *)v8 updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v3 setPrimaryButtonHidden:0];

  char v6 = [(SUSUISoftwareUpdateController *)v8 updateOptionsCell];
  id v5 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = (id)[v5 localizedStringForKey:@"DOWNLOADING_IN_PROGRESS" value:&stru_26DCD7690 table:@"Software Update"];
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v6, "setPrimaryButtonText:");

  objc_storeStrong(location, 0);
}

- (void)setInstallButtonDeleted:(id)a3
{
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SUSUISoftwareUpdateController *)v8 updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v3 setPrimaryButtonHidden:0];

  char v6 = [(SUSUISoftwareUpdateController *)v8 updateOptionsCell];
  id v5 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = (id)[v5 localizedStringForKey:@"DELETED" value:&stru_26DCD7690 table:@"Software Update"];
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v6, "setPrimaryButtonText:");

  objc_storeStrong(location, 0);
}

- (void)setInstallButtonInstallNow:(id)a3
{
  int v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v40);
  id v16 = [(SUSUISoftwareUpdateController *)v40 updateOptionsCell];
  id v15 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = (id)[v15 localizedStringForKey:@"INSTALL_NOW" value:&stru_26DCD7690 table:@"Software Update"];
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v16, "setPrimaryButtonText:");

  id v13 = [(SUSUISoftwareUpdateController *)v40 updateOptionsCell];
  uint64_t v32 = MEMORY[0x263EF8330];
  int v33 = -1073741824;
  int v34 = 0;
  id v35 = __72__SUSUISoftwareUpdateController_Specifiers__setInstallButtonInstallNow___block_invoke;
  char v36 = &unk_26483E380;
  objc_copyWeak(v37, &from);
  [(SUSSoftwareUpdateUpdateOptionsCell *)v13 setPrimaryButtonActionHandler:&v32];

  char v31 = [(SUSUISoftwareUpdateController *)v40 _shouldHideTonightButton];
  if (!v31)
  {
    char v12 = [(SUSUISoftwareUpdateController *)v40 updateOptionsCell];
    id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = (id)[v11 localizedStringForKey:@"INSTALL_TONIGHT" value:&stru_26DCD7690 table:@"Software Update"];
    -[SUSSoftwareUpdateUpdateOptionsCell setSecondaryButtonText:](v12, "setSecondaryButtonText:");

    char v9 = [(SUSUISoftwareUpdateController *)v40 updateOptionsCell];
    uint64_t v25 = MEMORY[0x263EF8330];
    int v26 = -1073741824;
    int v27 = 0;
    id v28 = __72__SUSUISoftwareUpdateController_Specifiers__setInstallButtonInstallNow___block_invoke_2;
    int v29 = &unk_26483E380;
    objc_copyWeak(&v30, &from);
    [(SUSSoftwareUpdateUpdateOptionsCell *)v9 setSecondaryButtonActionHandler:&v25];

    objc_destroyWeak(&v30);
  }
  BOOL v8 = [(SUSUISoftwareUpdateController *)v40 updateOptionsCell];
  char v23 = 0;
  char v21 = 0;
  char v19 = 0;
  char v17 = 0;
  id v6 = [(SUSUISoftwareUpdateController *)v40 presentingDescriptorError];
  char v7 = 1;
  if (!v6)
  {
    unint64_t v24 = [(SUSUISoftwareUpdateController *)v40 manager];
    char v23 = 1;
    id v22 = [(SUSettingsStatefulUIManager *)v24 errorContextProvider];
    char v21 = 1;
    id v20 = [(SUSUISoftwareUpdateController *)v40 presentingDescriptorError];
    char v19 = 1;
    id v18 = [(SUSUISoftwareUpdateController *)v40 presentingStatefulDescriptor];
    char v17 = 1;
    char v7 = -[SUSettingsStatefulErrorContextProvider shouldIgnoreUpdateError:withStatefulDescriptor:](v22, "shouldIgnoreUpdateError:withStatefulDescriptor:", v20);
  }
  [(SUSSoftwareUpdateUpdateOptionsCell *)v8 setEnabled:v7 & 1];
  if (v17) {

  }
  if (v19) {
  if (v21)
  }

  if (v23) {
  id v5 = [(SUSUISoftwareUpdateController *)v40 updateOptionsCell];
  }
  [(SUSSoftwareUpdateUpdateOptionsCell *)v5 setHidden:0];

  if (v31)
  {
    id v4 = [(SUSUISoftwareUpdateController *)v40 updateOptionsCell];
    [(SUSSoftwareUpdateUpdateOptionsCell *)v4 setSecondaryButtonEnabled:0];

    id v3 = [(SUSUISoftwareUpdateController *)v40 updateOptionsCell];
    [(SUSSoftwareUpdateUpdateOptionsCell *)v3 setSecondaryButtonHidden:1];
  }
  objc_destroyWeak(v37);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __72__SUSUISoftwareUpdateController_Specifiers__setInstallButtonInstallNow___block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    id v1 = (id)[location[0] updateOptionsCell];
    objc_msgSend(location[0], "install:");
  }
  objc_storeStrong(location, 0);
}

void __72__SUSUISoftwareUpdateController_Specifiers__setInstallButtonInstallNow___block_invoke_2(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    id v1 = (id)[location[0] updateOptionsCell];
    objc_msgSend(location[0], "installTonight:");
  }
  objc_storeStrong(location, 0);
}

- (void)setInstallButtonInstallingForSpecifier:(id)a3
{
  char v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SUSUISoftwareUpdateController *)v9 updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v3 setPrimaryButtonHidden:0];

  id v6 = [(SUSUISoftwareUpdateController *)v9 updateOptionsCell];
  id v5 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = (id)[v5 localizedStringForKey:@"INSTALLING" value:&stru_26DCD7690 table:@"Software Update"];
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v6, "setPrimaryButtonText:");

  char v7 = [(SUSUISoftwareUpdateController *)v9 updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v7 setActivityIndicatorDisplayStyle:1];

  objc_storeStrong(location, 0);
}

- (void)setInstallButtonInstalledForSpecifier:(id)a3
{
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SUSUISoftwareUpdateController *)v8 updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v3 setPrimaryButtonHidden:0];

  id v6 = [(SUSUISoftwareUpdateController *)v8 updateOptionsCell];
  id v5 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = (id)[v5 localizedStringForKey:@"INSTALLING" value:&stru_26DCD7690 table:@"Software Update"];
  -[SUSSoftwareUpdateUpdateOptionsCell setPrimaryButtonText:](v6, "setPrimaryButtonText:");

  objc_storeStrong(location, 0);
}

- (id)alternateUpdateFooterString
{
  char v23 = self;
  v22[1] = (id)a2;
  v22[0] = 0;
  id v17 = [(SUSUISoftwareUpdateController *)self presentingDescriptor];
  id v21 = (id)[v17 productVersion];

  id v18 = [(SUSUISoftwareUpdateController *)v23 presentingAlternateDescriptor];
  id location = (id)[v18 productVersion];

  if (v21 && location)
  {
    uint64_t v16 = [location compare:v21 options:64];
    if (v16 == -1)
    {
      BOOL v19 = 0;
    }
    else if (v16)
    {
      BOOL v19 = v16 == 1;
    }
    else
    {
      id v15 = [(SUSUISoftwareUpdateController *)v23 presentingAlternateDescriptor];
      id v14 = (id)[v15 productBuildVersion];
      id v13 = [(SUSUISoftwareUpdateController *)v23 presentingDescriptor];
      id v12 = (id)[v13 productBuildVersion];
      BOOL v19 = objc_msgSend(v14, "compare:options:") == 1;
    }
    if (!v19)
    {
      id v6 = NSString;
      id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v10 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"ALTERNATE_UPDATE_FOOTER_NOT_LATEST"];
      id v9 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:");
      id v8 = (id)[MEMORY[0x263F82670] currentDevice];
      id v7 = (id)[v8 systemVersion];
      id v2 = (id)objc_msgSend(v6, "stringWithFormat:", v9, v7);
      id v3 = v22[0];
      v22[0] = v2;
    }
  }
  id v5 = v22[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);
  return v5;
}

- (id)majorOSVersionString
{
  id v5 = (id)[MEMORY[0x263F82670] currentDevice];
  id v4 = (id)[v5 systemVersion];
  id v6 = -[SUSUISoftwareUpdateController majorOSVersionStringForBuildVersion:](self, "majorOSVersionStringForBuildVersion:");

  return v6;
}

- (id)majorOSVersionStringForBuildVersion:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  if (location[0])
  {
    id v7 = (id)[location[0] componentsSeparatedByString:@"."];
    id v3 = (id)[v7 firstObject];
    id v4 = v8;
    id v8 = v3;
  }
  id v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)alternateUpdateButtonString
{
  if ([(SUSUISoftwareUpdateController *)self presentingAlternateDescriptorUpgradeType] == 2)
  {
    id v3 = NSString;
    id v9 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"UPGRADE_TO"];
    id v7 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:");
    id v6 = [(SUSUISoftwareUpdateController *)self presentingAlternateDescriptor];
    id v5 = (id)[v6 productVersion];
    id v4 = -[SUSUISoftwareUpdateController majorOSVersionStringForBuildVersion:](self, "majorOSVersionStringForBuildVersion:");
    id v11 = (id)objc_msgSend(v3, "stringWithFormat:", v7, v4);
  }
  else
  {
    id v11 = [(SUSUISoftwareUpdateController *)self alternateUpdateVersionString];
  }
  return v11;
}

- (id)alternateUpdateSubTextString
{
  id v9 = [(SUSUISoftwareUpdateController *)self manager];
  id v10 = [(SUSettingsStatefulUIManager *)v9 currentDownload];
  char v14 = 0;
  char v12 = 0;
  BOOL v11 = 0;
  if (v10)
  {
    id v15 = [(SUSUISoftwareUpdateController *)self manager];
    char v14 = 1;
    id v13 = [(SUSUISoftwareUpdateController *)self presentingAlternateStatefulDescriptor];
    char v12 = 1;
    BOOL v11 = -[SUSettingsStatefulUIManager doesTargetedUpdateMatchDescriptor:](v15, "doesTargetedUpdateMatchDescriptor:");
  }
  if (v12) {

  }
  if (v14) {
  if (v11)
  }
  {
    id v7 = [(SUSUISoftwareUpdateController *)self manager];
    id v6 = [(SUSettingsStatefulUIManager *)v7 currentDownload];
    id v5 = [(SUDownload *)v6 progress];
    char v8 = [(SUOperationProgress *)v5 isDone];

    if (v8)
    {
      id v4 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v17 = (__CFString *)(id)[v4 localizedStringForKey:@"DOWNLOADED" value:&stru_26DCD7690 table:@"Software Update"];
    }
    else
    {
      id v3 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v17 = (__CFString *)(id)[v3 localizedStringForKey:@"DOWNLOADING" value:&stru_26DCD7690 table:@"Software Update"];
    }
  }
  else
  {
    id v17 = &stru_26DCD7690;
  }
  return v17;
}

- (id)nonPromotedPreferredUpdateButtonString
{
  if ([(SUSUISoftwareUpdateController *)self presentingDescriptorUpgradeType] == 2)
  {
    id v3 = NSString;
    id v9 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"UPGRADE_TO"];
    id v7 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:");
    id v6 = [(SUSUISoftwareUpdateController *)self presentingDescriptor];
    id v5 = (id)[v6 productVersion];
    id v4 = -[SUSUISoftwareUpdateController majorOSVersionStringForBuildVersion:](self, "majorOSVersionStringForBuildVersion:");
    id v11 = (id)objc_msgSend(v3, "stringWithFormat:", v7, v4);
  }
  else
  {
    id v11 = [(SUSUISoftwareUpdateController *)self preferredUpdateVersionString];
  }
  return v11;
}

- (id)alsoAvailableGroupHeaderString
{
  id v3 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = (id)[v3 localizedStringForKey:@"ALSO_AVAILABLE" value:&stru_26DCD7690 table:@"Software Update"];

  return v4;
}

- (id)autoUpdateScheduledString
{
  id v11 = self;
  v10[1] = (id)a2;
  if ([(SUSUISoftwareUpdateController *)self presentingDescriptorUpgradeType] == 1) {
    id v2 = @"AUTOMATIC_UPDATES_INSTALL_TONIGHT_MINOR_";
  }
  else {
    id v2 = @"AUTOMATIC_UPDATES_INSTALL_TONIGHT_MAJOR_";
  }
  v10[0] = v2;
  id v4 = NSString;
  id v8 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:v10[0]];
  id v6 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:");
  id v5 = [(SUSUISoftwareUpdateController *)v11 installedOSVersionString];
  id v9 = (id)objc_msgSend(v4, "stringWithFormat:", v6, v5);

  objc_storeStrong(v10, 0);
  return v9;
}

- (id)alternateUpdateVersionString
{
  id v4 = [(SUSUISoftwareUpdateController *)self presentingAlternateDescriptor];
  id v5 = -[SUSUISoftwareUpdateController updateVersionString:](self, "updateVersionString:");

  return v5;
}

- (id)preferredUpdateVersionString
{
  id v4 = [(SUSUISoftwareUpdateController *)self presentingDescriptor];
  id v5 = -[SUSUISoftwareUpdateController updateVersionString:](self, "updateVersionString:");

  return v5;
}

- (id)updateVersionString:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[location[0] humanReadableUpdateName];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)installedOSVersionString
{
  id v17 = self;
  SEL v16 = a2;
  *(_DWORD *)&v15[8] = 0;
  id v14 = (id)[MEMORY[0x263F82670] currentDevice];
  *(void *)id v15 = objc_msgSend(v14, "sf_isiPad");

  if (v15[0])
  {
    id v13 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v2 = (id)[v13 localizedStringForKey:@"iPadOS_VERSION" value:&stru_26DCD7690 table:@"Software Update"];
    id v3 = *(void **)&v15[4];
    *(void *)&v15[4] = v2;
  }
  else
  {
    id v12 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = (id)[v12 localizedStringForKey:@"iOS_VERSION" value:&stru_26DCD7690 table:@"Software Update"];
    id v5 = *(void **)&v15[4];
    *(void *)&v15[4] = v4;
  }
  id v8 = NSString;
  uint64_t v7 = *(void *)&v15[4];
  id v10 = (id)[MEMORY[0x263F82670] currentDevice];
  id v9 = (id)[v10 systemVersion];
  id v11 = (id)[v8 stringWithValidatedFormat:v7 validFormatSpecifiers:@"%@" error:v9];

  objc_storeStrong((id *)&v15[4], 0);
  return v11;
}

- (id)tableCellImageForImage:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  if (location[0])
  {
    double v10 = 0.0;
    id v8 = (id)[MEMORY[0x263F82B60] mainScreen];
    [v8 scale];
    double v9 = v3;

    double v10 = v9;
    [MEMORY[0x263F827E8] _iconVariantForUIApplicationIconFormat:0 scale:&v10];
    [location[0] CGImage];
    id v4 = (id)[MEMORY[0x263F827E8] imageWithCGImage:LICreateIconForImage() scale:0 orientation:v10];
    id v5 = v11;
    id v11 = v4;
  }
  id v7 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (void)clearNonPromotedPrimaryUpdateGroup:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] removePropertyForKey:*MEMORY[0x263F60118]];
  objc_storeStrong(location, 0);
}

- (void)clearNonPromotedPrimaryUpdateHeaderGroup:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] removePropertyForKey:*MEMORY[0x263F60118]];
  objc_storeStrong(location, 0);
}

- (void)refreshBetaUpdatesButton
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUGetBetaUpdatesButton"];
  if (location[0])
  {
    id v2 = (id)[(SUSUISoftwareUpdateController *)v4 parentController];
    [v2 reloadSpecifier:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)refreshupdateAutoUpdateButton
{
  double v3 = self;
  location[1] = (id)a2;
  location[0] = [(SUSUISoftwareUpdateController *)self specifierForAutomaticUpdatesWithUIState:[(SUSUISoftwareUpdateController *)self currentUIState] descriptorState:[(SUSUISoftwareUpdateController *)self currentDescriptorState]];
  if (location[0]) {
    [(SUSUISoftwareUpdateController *)v3 reloadSpecifier:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)configureScanCell:(id)a3 withUIState:(unint64_t)a4 descriptorState:(unint64_t)a5
{
  int v60 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v58 = a4;
  unint64_t v57 = a5;
  id v44 = +[SUSettingsStatefulUIAdditions currentOSVersion];
  objc_msgSend(location[0], "setCurrentVersion:");

  int v45 = [(SUSUISoftwareUpdateController *)v60 manager];
  BOOL v5 = [(SUSettingsStatefulUIManager *)v45 isDelayingUpdate];
  [location[0] setUpdatesDeferred:v5];

  int v46 = [(SUSUISoftwareUpdateController *)v60 manager];
  BOOL v6 = [(SUSettingsStatefulUIManager *)v46 hasSUPathRestrictions];
  [location[0] setSuPathsRestricted:v6];

  unsigned int v56 = 0;
  if (a4 == 1)
  {
    unsigned int v56 = 1;
  }
  else if (v58 == 3)
  {
    unsigned int v56 = 0;
  }
  else
  {
    int v40 = [(SUSUISoftwareUpdateController *)v60 manager];
    BOOL v41 = [(SUSettingsStatefulUIManager *)v40 isDelayingUpdate];

    if (v41)
    {
      unsigned int v56 = 4;
    }
    else if (v58 == 4 {
           && [(SUSUISoftwareUpdateController *)v60 presentingStatefulDescriptorPromotedAsAlternate])
    }
    {
      unsigned int v56 = 5;
    }
    else if (v58 == 2)
    {
      unsigned int v56 = 2;
    }
    else
    {
      unsigned int v56 = 3;
    }
  }
  if (v58 == 2)
  {
    char v36 = [(SUSUISoftwareUpdateController *)v60 manager];
    id v55 = [(SUSettingsStatefulUIManager *)v36 scanError];

    id v37 = (id)[v55 domain];
    id v38 = getSUErrorDomain_1();
    BOOL v39 = 0;
    if (objc_msgSend(v37, "isEqualToString:")) {
      BOOL v39 = [v55 code] == 26;
    }

    if (v39)
    {
      id v30 = location[0];
      id v32 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v31 = (id)objc_msgSend(v32, "localizedStringForKey:value:table:", @"UNABLE_TO_CHECK_FOR_UPDATE");
      objc_msgSend(v30, "setErrorTitle:");

      id v33 = location[0];
      id v35 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v34 = (id)[v35 localizedStringForKey:@"NETWORK_SCAN_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
      objc_msgSend(v33, "setErrorMessage:");
    }
    else
    {
      id v54 = 0;
      id v28 = (id)[MEMORY[0x263F82670] currentDevice];
      char v29 = objc_msgSend(v28, "sf_isInternalInstall");

      if (v29)
      {
        id v27 = (id)[v55 userInfo];
        id v53 = (id)[v27 objectForKey:*MEMORY[0x263F08348]];

        if (!v53) {
          objc_storeStrong(&v53, @"Verify that you are connected to the Internal Network; trigger VPN manually if applicable.");
        }
        unint64_t v24 = NSString;
        id v26 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v25 = (id)[v26 localizedStringForKey:@"GENERIC_SCAN_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
        id v7 = (id)[v24 stringWithFormat:@"%@\n\n[Internal Only]\n%@", v25, v53];
        id v8 = v54;
        id v54 = v7;

        objc_storeStrong(&v53, 0);
      }
      else
      {
        id v23 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v9 = (id)[v23 localizedStringForKey:@"GENERIC_SCAN_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
        id v10 = v54;
        id v54 = v9;
      }
      id v17 = location[0];
      id v19 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v18 = (id)[v19 localizedStringForKey:@"UNABLE_TO_CHECK_FOR_UPDATE" value:&stru_26DCD7690 table:@"Software Update"];
      objc_msgSend(v17, "setErrorTitle:");

      [location[0] setErrorMessage:v54];
      id v21 = [(SUSUISoftwareUpdateController *)v60 manager];
      id v20 = [(SUSettingsStatefulUIManager *)v21 options];
      BOOL v22 = [(SUSettingsStatefulUIOptions *)v20 clientIsBuddy];

      if (!v22)
      {
        id v11 = location[0];
        id v13 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v12 = (id)[v13 localizedStringForKey:@"TRY_AGAIN" value:&stru_26DCD7690 table:@"Software Update"];
        objc_msgSend(v11, "setErrorPrimaryButton:");

        id v15 = location[0];
        id v14 = (void *)MEMORY[0x263F823D0];
        uint64_t v47 = MEMORY[0x263EF8330];
        int v48 = -1073741824;
        int v49 = 0;
        id v50 = __91__SUSUISoftwareUpdateController_Specifiers__configureScanCell_withUIState_descriptorState___block_invoke;
        uint64_t v51 = &unk_26483E3D0;
        int v52 = v60;
        id v16 = (id)[v14 actionWithHandler:&v47];
        objc_msgSend(v15, "setErrorPrimaryButtonAction:");

        objc_storeStrong((id *)&v52, 0);
      }
      objc_storeStrong(&v54, 0);
    }
    objc_storeStrong(&v55, 0);
  }
  else
  {
    objc_msgSend(location[0], "setErrorTitle:");
    [location[0] setErrorMessage:0];
    [location[0] setErrorPrimaryButton:0];
    [location[0] setErrorPrimaryButtonAction:0];
  }
  [location[0] setState:v56];
  objc_storeStrong(location, 0);
}

void __91__SUSUISoftwareUpdateController_Specifiers__configureScanCell_withUIState_descriptorState___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[a1[4] manager];
  [v3 checkForAvailableUpdates];

  objc_storeStrong(location, 0);
}

- (unint64_t)proactiveSuggestionTypeForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  char v24 = 0;
  char v22 = 0;
  char v20 = 0;
  char v18 = 0;
  char v16 = 0;
  LOBYTE(v7) = 0;
  if (a3 == 4)
  {
    LOBYTE(v7) = 0;
    if (![(SUSUISoftwareUpdateController *)self presentingStatefulDescriptorPromotedAsAlternate])
    {
      id v25 = [(SUSUISoftwareUpdateController *)self presentingDescriptorError];
      char v24 = 1;
      LOBYTE(v7) = 0;
      if (v25)
      {
        id v23 = [(SUSUISoftwareUpdateController *)self manager];
        char v22 = 1;
        id v21 = [(SUSettingsStatefulUIManager *)v23 errorContextProvider];
        char v20 = 1;
        id v19 = [(SUSUISoftwareUpdateController *)self presentingDescriptorError];
        char v18 = 1;
        id v17 = [(SUSUISoftwareUpdateController *)self presentingStatefulDescriptor];
        char v16 = 1;
        int v7 = !-[SUSettingsStatefulErrorContextProvider shouldIgnoreUpdateError:withStatefulDescriptor:](v21, "shouldIgnoreUpdateError:withStatefulDescriptor:", v19);
      }
    }
  }
  if (v16) {

  }
  if (v18) {
  if (v20)
  }

  if (v22) {
  if (v24)
  }

  if (v7) {
    return 1;
  }
  if (a3 != 4
    || ![(SUSUISoftwareUpdateController *)self presentingStatefulDescriptorIsTargetedUpdate])
  {
    return 0;
  }
  char v14 = 0;
  char v12 = 0;
  char v10 = 0;
  if (a4 == 2 || (char v6 = 0, a4 <= 3))
  {
    id v15 = [(SUSUISoftwareUpdateController *)self manager];
    char v14 = 1;
    id v13 = [(SUSettingsStatefulUIManager *)v15 currentDownload];
    char v12 = 1;
    id v11 = [(SUDownload *)v13 downloadOptions];
    char v10 = 1;
    char v6 = [(SUDownloadOptions *)v11 isAutoDownload];
  }
  if (v10) {

  }
  if (v12) {
  if (v14)
  }

  if (v6) {
    return 2;
  }
  char v8 = 0;
  BOOL v5 = 0;
  if (a4 == 4)
  {
    id v9 = [(SUSUISoftwareUpdateController *)self manager];
    char v8 = 1;
    BOOL v5 = [(SUSettingsStatefulUIManager *)v9 isTargetedUpdateScheduledForAutoInstall];
  }
  if (v8) {

  }
  if (v5) {
    return 3;
  }
  else {
    return 0;
  }
}

- (void)refreshInstallButton
{
  id v2 = [(SUSUISoftwareUpdateController *)self specifierForUpdateOptionsWithUIState:[(SUSUISoftwareUpdateController *)self currentUIState] descriptorState:[(SUSUISoftwareUpdateController *)self currentDescriptorState]];
  id v3 = v2;
}

- (void)_setTitleCellSpecifierStatus:(id)a3 descriptorState:(unint64_t)a4
{
  char v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v22 = a4;
  id v21 = [(SUSUISoftwareUpdateController *)v24 statusString];
  id v13 = [(SUSUISoftwareUpdateController *)v24 titleCell];
  BOOL v14 = 0;
  if (a4 == 2) {
    BOOL v14 = [(SUSUISoftwareUpdateController *)v24 presentingStatefulDescriptorIsTargetedUpdate];
  }
  [(SUSSoftwareUpdateTitleCell *)v13 setAnimatingGearView:v14];

  char v6 = [(SUSUISoftwareUpdateController *)v24 titleCell];
  id v5 = [(SUSUISoftwareUpdateController *)v24 presentingDescriptorError];
  [(SUSSoftwareUpdateTitleCell *)v6 setStatusMessage:v21 symbolizingError:v5 != 0];

  int v7 = [(SUSUISoftwareUpdateController *)v24 titleCell];
  [(SUSSoftwareUpdateTitleCell *)v7 setProgressDisplayStyle:[(SUSUISoftwareUpdateController *)v24 updateProgressStyleForDescriptorState:v22]];

  id v11 = [(SUSUISoftwareUpdateController *)v24 titleCell];
  char v10 = [(SUSUISoftwareUpdateController *)v24 manager];
  id v9 = [(SUSettingsStatefulUIManager *)v10 currentDownload];
  char v8 = [(SUDownload *)v9 progress];
  [(SUOperationProgress *)v8 normalizedPercentComplete];
  -[SUSSoftwareUpdateTitleCell setProgress:](v11, "setProgress:");

  if (v22 == 1)
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v15 = MEMORY[0x263EF8330];
    int v16 = -1073741824;
    int v17 = 0;
    char v18 = __90__SUSUISoftwareUpdateController_Specifiers___setTitleCellSpecifierStatus_descriptorState___block_invoke;
    id v19 = &unk_26483BA90;
    char v20 = v24;
    dispatch_async(queue, &v15);

    objc_storeStrong((id *)&v20, 0);
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __90__SUSUISoftwareUpdateController_Specifiers___setTitleCellSpecifierStatus_descriptorState___block_invoke(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 32) titleCell];
  id v3 = (id)[v4 releaseNotesSummaryView];
  id v2 = (id)[v3 webView];
  id v1 = (id)[v2 scrollView];
  [v1 flashScrollIndicators];
}

- (id)isBetaUpdatesEnabled
{
  id v4 = [(SUSUISoftwareUpdateController *)self manager];
  id v5 = [(SUSettingsStatefulUIManager *)v4 enrolledBetaProgram];
  id v6 = (id)[(SDBetaProgram *)v5 title];
  char v9 = 0;
  char v7 = 0;
  if (v6)
  {
    id v2 = v6;
  }
  else
  {
    id v10 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v9 = 1;
    id v8 = (id)[v10 localizedStringForKey:@"OFF" value:&stru_26DCD7690 table:@"Software Update"];
    char v7 = 1;
    id v2 = v8;
  }
  id v11 = v2;
  if (v7) {

  }
  if (v9) {
  return v11;
  }
}

- (BOOL)_errorIsInsufficientSpace:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = (id)[location[0] domain];
  id v9 = getSUErrorDomain_1();
  char v11 = objc_msgSend(v10, "isEqualToString:");

  if ((v11 & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v8 = [location[0] code];
  if (v8 != 6)
  {
    if (v8 == 20)
    {
      id v6 = (id)[location[0] userInfo];
      id v5 = getkSUInstallationConstraintsUnmetKey_0();
      id v4 = (id)objc_msgSend(v6, "objectForKey:");
      char v7 = [v4 unsignedIntegerValue];

      if ((v7 & 4) != 0)
      {
        char v13 = 1;
        goto LABEL_9;
      }
    }
LABEL_8:
    char v13 = 0;
    goto LABEL_9;
  }
  char v13 = 1;
LABEL_9:
  objc_storeStrong(location, 0);
  return v13 & 1;
}

- (int)updateProgressStyleForDescriptorState:(unint64_t)a3
{
  id v37 = self;
  SEL v36 = a2;
  unint64_t v35 = a3;
  char v11 = [(SUSUISoftwareUpdateController *)self manager];
  id v10 = [(SUSettingsStatefulUIManager *)v11 currentDownload];
  id v34 = [(SUDownload *)v10 progress];

  id location = (id)[v34 phase];
  [v34 percentComplete];
  float v32 = v3;
  char v31 = 0;
  char v12 = [(SUSUISoftwareUpdateController *)v37 manager];
  char v13 = [(SUSettingsStatefulUIManager *)v12 scanError];
  char v29 = 0;
  char v27 = 0;
  char v25 = 0;
  char v23 = 0;
  char v21 = 0;
  char v19 = 0;
  char v17 = 0;
  char v14 = 1;
  if (!v13)
  {
    id v30 = [(SUSUISoftwareUpdateController *)v37 presentingStatefulDescriptor];
    char v29 = 1;
    id v28 = (id)[v30 updateDownloadError];
    char v27 = 1;
    LOBYTE(v9) = 0;
    if (v28)
    {
      id v26 = [(SUSUISoftwareUpdateController *)v37 manager];
      char v25 = 1;
      char v24 = [(SUSettingsStatefulUIManager *)v26 errorContextProvider];
      char v23 = 1;
      id v22 = [(SUSUISoftwareUpdateController *)v37 presentingStatefulDescriptor];
      char v21 = 1;
      id v20 = (id)[v22 updateDownloadError];
      char v19 = 1;
      id v18 = [(SUSUISoftwareUpdateController *)v37 presentingStatefulDescriptor];
      char v17 = 1;
      int v9 = !-[SUSettingsStatefulErrorContextProvider shouldIgnoreUpdateError:withStatefulDescriptor:](v24, "shouldIgnoreUpdateError:withStatefulDescriptor:", v20);
    }
    char v14 = v9;
  }
  if (v17) {

  }
  if (v19) {
  if (v21)
  }

  if (v23) {
  if (v25)
  }

  if (v27) {
  if (v29)
  }

  char v31 = v14 & 1;
  if (v35 == 2)
  {
    id v7 = getkSUDownloadPhasePreparingForInstallation_0();
    char v8 = objc_msgSend(location, "isEqualToString:");

    if (v8)
    {
      if (v31) {
        int v4 = 2;
      }
      else {
        int v4 = 1;
      }
      int v38 = v4;
      int v16 = 1;
    }
    else if ([(SUSUISoftwareUpdateController *)v37 presentingStatefulDescriptorIsTargetedUpdate]&& (char v15 = 0, +[SUSettingsStatefulUIAdditions estimatedTimeRemainingForProgress:v34 valid:&v15], v32 >= 0.005)&& (v15 & 1) != 0)
    {
      if (v31) {
        int v5 = 2;
      }
      else {
        int v5 = 1;
      }
      int v38 = v5;
      int v16 = 1;
    }
    else
    {
      int v38 = 0;
      int v16 = 1;
    }
  }
  else if (v35 == 3)
  {
    if ([(SUSUISoftwareUpdateController *)v37 presentingStatefulDescriptorIsTargetedUpdate])
    {
      int v38 = 2;
    }
    else
    {
      int v38 = 0;
    }
    int v16 = 1;
  }
  else
  {
    int v38 = 0;
    int v16 = 1;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v34, 0);
  return v38;
}

- (BOOL)waitingOnSUAssetDownload:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v4 = 1;
  if (([location[0] isEqualToString:*MEMORY[0x263F78420]] & 1) == 0)
  {
    char v4 = 1;
    if (([location[0] isEqualToString:*MEMORY[0x263F783F8]] & 1) == 0)
    {
      char v4 = 1;
      if (([location[0] isEqualToString:*MEMORY[0x263F78400]] & 1) == 0)
      {
        char v4 = 1;
        if (([location[0] isEqualToString:*MEMORY[0x263F78408]] & 1) == 0)
        {
          char v4 = 1;
          if (([location[0] isEqualToString:*MEMORY[0x263F78410]] & 1) == 0)
          {
            char v4 = 1;
            if (([location[0] isEqualToString:*MEMORY[0x263F78418]] & 1) == 0) {
              char v4 = [location[0] isEqualToString:*MEMORY[0x263F783F0]];
            }
          }
        }
      }
    }
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)_shouldHideTonightButton
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v14[2] = self;
  v14[1] = (id)a2;
  id v7 = [(SUSUISoftwareUpdateController *)self manager];
  v14[0] = [(SUSettingsStatefulUIManager *)v7 ddmDeclaration];

  if (v14[0] && ([v14[0] isValidDeclaration] & 1) != 0)
  {
    id v5 = (id)[v14[0] enforcedInstallDate];
    [v5 timeIntervalSinceNow];
    double v6 = v2;

    double v10 = v6;
    BOOL v9 = v6 < 86400.0;
    osos_log_t log = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      if (v9) {
        float v3 = &stru_26DCD7690;
      }
      else {
        float v3 = @"don't ";
      }
      __os_log_helper_16_2_3_8_0_8_64_8_64((uint64_t)v16, COERCE__INT64(v10 / 3600.0), (uint64_t)v14[0], (uint64_t)v3);
      _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%lf hour(s) left for %@, %@hide the update/install tonight button", v16, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    BOOL v15 = v9;
    int v11 = 1;
  }
  else
  {
    id location = _SUSUILoggingFacility();
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)v14[0]);
      _os_log_impl(&dword_228401000, (os_log_t)location, v12, "No valid declaration available %@, don't hide the update/install tonight button", v17, 0xCu);
    }
    objc_storeStrong(&location, 0);
    BOOL v15 = 0;
    int v11 = 1;
  }
  objc_storeStrong(v14, 0);
  return v15;
}

- (id)automaticUpdatesCellTitle
{
  id v7 = [(SUSUISoftwareUpdateController *)self manager];
  double v6 = [(SUSettingsStatefulUIManager *)v7 preferences];
  BOOL v8 = [(SUSettingsSUPreferencesManager *)v6 isAutomaticDownloadEnabled];

  double v10 = [(SUSUISoftwareUpdateController *)self manager];
  BOOL v9 = [(SUSettingsStatefulUIManager *)v10 preferences];
  BOOL v11 = [(SUSettingsSUPreferencesManager *)v9 isAutomaticUpdateV2Enabled];

  if (v8 && v11)
  {
    id v5 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v13 = (id)[v5 localizedStringForKey:@"ON" value:&stru_26DCD7690 table:@"Software Update"];
  }
  else if (v8)
  {
    id v4 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v13 = (id)[v4 localizedStringForKey:@"DOWNLOAD_ONLY" value:&stru_26DCD7690 table:@"Software Update"];
  }
  else
  {
    id v3 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v13 = (id)[v3 localizedStringForKey:@"OFF" value:&stru_26DCD7690 table:@"Software Update"];
  }
  return v13;
}

- (void)initUI
{
  self->_currentActivityStyle = 0;
}

- (id)specifierWithID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = (id)[(SUSUISoftwareUpdateController *)v18 specifiers];
  memset(__b, 0, sizeof(__b));
  id obj = v16;
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(id *)(__b[1] + 8 * v9);
      id v5 = (id)[v15 propertyForKey:*MEMORY[0x263F60138]];
      char v6 = [v5 isEqualToString:location[0]];

      if (v6) {
        break;
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
        if (!v10) {
          goto LABEL_9;
        }
      }
    }
    id v19 = v15;
    int v13 = 1;
  }
  else
  {
LABEL_9:
    int v13 = 0;
  }

  if (!v13) {
    id v19 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  id v3 = v19;
  return v3;
}

- (void)refreshPane
{
  int v13 = self;
  SEL v12 = a2;
  unint64_t v11 = [(SUSUISoftwareUpdateController *)self currentUIState];
  id v10 = [(SUSUISoftwareUpdateController *)v13 updatedSpecifiersArray];
  BOOL v9 = v11 <= 1;
  [(SUSUISoftwareUpdateController *)v13 reloadUsingNewSpecifiers:v10 animated:v11 > 1];
  [(SUSUISoftwareUpdateController *)v13 fixCustomCellSpecifiers];
  [(SUSUISoftwareUpdateController *)v13 reloadCustomCells];
  if (v11 == 3
    || v11 == 4
    && [(SUSUISoftwareUpdateController *)v13 presentingStatefulDescriptorPromotedAsAlternate])
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    char v6 = __48__SUSUISoftwareUpdateController_UI__refreshPane__block_invoke;
    uint64_t v7 = &unk_26483BA90;
    uint64_t v8 = v13;
    dispatch_async(queue, &v3);

    objc_storeStrong((id *)&v8, 0);
  }
  objc_storeStrong(&v10, 0);
}

uint64_t __48__SUSUISoftwareUpdateController_UI__refreshPane__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadCustomCells", a1, a1);
}

- (void)reloadCustomCells
{
  unint64_t v11 = self;
  v10[1] = (id)a2;
  v10[0] = 0;
  id v9 = 0;
  [(SUSUISoftwareUpdateController *)self reloadScanSpacerCells:&v9];
  objc_storeStrong(v10, v9);
  [(SUSUISoftwareUpdateController *)v11 reloadSpecifiers:v10[0] animated:0];
  [(SUSUISoftwareUpdateController *)v11 fixCustomCellSpecifiers];
  queue = MEMORY[0x263EF83A0];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  char v6 = __54__SUSUISoftwareUpdateController_UI__reloadCustomCells__block_invoke;
  uint64_t v7 = &unk_26483BA90;
  uint64_t v8 = v11;
  dispatch_async(queue, &v3);

  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(v10, 0);
}

uint64_t __54__SUSUISoftwareUpdateController_UI__reloadCustomCells__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fixCustomCellSpecifiers", a1, a1);
}

- (void)reloadScanSpacerCells:(id *)a3
{
  int v46 = self;
  SEL v45 = a2;
  id v44 = a3;
  double v43 = 0.0;
  double v42 = 0.0;
  id v41 = [(SUSUISoftwareUpdateController *)self specifierWithID:@"SUScanHeaderGroup"];
  id v40 = (id)[v41 propertyForKey:@"SUHeight"];
  if (v40)
  {
    [v40 floatValue];
    double v43 = v43 + v3;
  }
  id v39 = [(SUSUISoftwareUpdateController *)v46 specifierWithID:@"SUScanFooterGroup"];
  id v38 = (id)[v39 propertyForKey:@"SUHeight"];
  if (v38)
  {
    [v38 floatValue];
    double v43 = v43 + v4;
  }
  id v17 = (id)[(SUSUISoftwareUpdateController *)v46 table];
  [v17 layoutSubviews];

  id v18 = (id)[(SUSUISoftwareUpdateController *)v46 table];
  [v18 contentSize];
  uint64_t v35 = v5;
  double v36 = v6;
  double v19 = v6;

  double v37 = v19;
  +[SUSUISoftwareUpdateController windowSafeAreasSize];
  double v34 = v19 - v43 + v7;
  id v23 = (id)[(SUSUISoftwareUpdateController *)v46 table];
  [v23 visibleSize];
  uint64_t v31 = v8;
  double v32 = v9;
  double v21 = v9;
  id v22 = (id)[(SUSUISoftwareUpdateController *)v46 navigationController];
  id v20 = (id)[v22 navigationBar];
  [v20 bounds];
  uint64_t v27 = v10;
  uint64_t v28 = v11;
  uint64_t v29 = v12;
  double v30 = v13;
  double v24 = v21 - v13;

  double v33 = v24;
  if (v24 > v34) {
    double v42 = v33 - v34;
  }
  float v14 = v42 / 2.0;
  double v26 = floorf(v14);
  id location = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v41)
  {
    id v16 = (id)[NSNumber numberWithDouble:v26];
    objc_msgSend(v41, "setProperty:forKey:");

    [location addObject:v41];
  }
  if (v39)
  {
    id v15 = (id)[NSNumber numberWithDouble:v26];
    objc_msgSend(v39, "setProperty:forKey:");

    [location addObject:v39];
  }
  if (v44) {
    *id v44 = location;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
}

- (void)setBusyWithActivityStyle:(int64_t)a3
{
  float v3 = [(SUSUISoftwareUpdateController *)self updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v3 setEnabled:a3 == 0];

  float v4 = [(SUSUISoftwareUpdateController *)self updateOptionsCell];
  [(SUSSoftwareUpdateUpdateOptionsCell *)v4 setActivityIndicatorDisplayStyle:a3];

  char v9 = ![(SUSUISoftwareUpdateController *)self isBusy];
  uint64_t v5 = [(SUSUISoftwareUpdateController *)self automaticUpdatesCell];
  [(PSTableCell *)v5 setUserInteractionEnabled:v9 & 1];

  double v6 = [(SUSUISoftwareUpdateController *)self betaUpdatesCell];
  [(PSTableCell *)v6 setUserInteractionEnabled:v9 & 1];

  double v7 = [(SUSUISoftwareUpdateController *)self alternateUpdateCell];
  [(PSTableCell *)v7 setUserInteractionEnabled:v9 & 1];

  uint64_t v8 = [(SUSUISoftwareUpdateController *)self nonPromotedUpdateCell];
  [(PSTableCell *)v8 setUserInteractionEnabled:v9 & 1];
}

+ (double)windowSafeAreasSize
{
  v16[2] = a1;
  v16[1] = (id)a2;
  if (*(double *)&windowSafeAreasSize_safeArea != 2.22507386e-308) {
    return *(double *)&windowSafeAreasSize_safeArea;
  }
  id v13 = (id)objc_msgSend(MEMORY[0x263F82438], "sharedApplication", *(double *)&windowSafeAreasSize_safeArea);
  v16[0] = (id)[v13 connectedScenes];

  if ([v16[0] count])
  {
    id v10 = (id)[v16[0] allObjects];
    id location = (id)[v10 objectAtIndex:0];

    id v11 = (id)[location windows];
    BOOL v12 = [v11 count] != 0;

    if (v12)
    {
      id v9 = (id)[location windows];
      id v8 = (id)objc_msgSend(v9, "objectAtIndex:");
      [v8 safeAreaInsets];
      double v6 = v2;
      id v7 = (id)[location windows];
      id v5 = (id)[v7 objectAtIndex:0];
      [v5 safeAreaInsets];
      double v17 = v6 + v3;
    }
    else
    {
      double v17 = 0.0;
    }
    int v15 = 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    double v17 = 0.0;
    int v15 = 1;
  }
  objc_storeStrong(v16, 0);
  return v17;
}

- (void)viewDidLoad
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  double v42 = self;
  SEL v41 = a2;
  v40.receiver = self;
  v40.super_class = (Class)SUSUISoftwareUpdateController;
  [(SUSUISoftwareUpdateController *)&v40 viewDidLoad];
  uint64_t v31 = v42;
  id v32 = [(SUSUISoftwareUpdateController *)v42 paneTitle];
  -[SUSUISoftwareUpdateController setTitle:](v31, "setTitle:");

  id v33 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v33 addObserver:v42 selector:sel_willEnterForeground name:*MEMORY[0x263F833B8] object:0];

  if ([(SUSUISoftwareUpdateController *)v42 supportsPullToRefresh])
  {
    id v29 = objc_alloc_init(MEMORY[0x263F82B00]);
    -[SUSUISoftwareUpdateController setRefreshControl:](v42, "setRefreshControl:");

    double v30 = [(SUSUISoftwareUpdateController *)v42 refreshControl];
    [(UIRefreshControl *)v30 addTarget:v42 action:sel_performUpdateRescan_ forControlEvents:4096];
  }
  char v25 = +[SUSUIServiceManager sharedInstance];
  id v39 = [(SUSUIServiceManager *)v25 classForService:objc_opt_class()];

  id v26 = (id)[(objc_class *)v39 sharedManager];
  [v26 setup];

  id v28 = +[SUSUITestAutomationManager sharedManager];
  id v27 = (id)[(objc_class *)v39 sharedManager];
  objc_msgSend(v28, "addResponderDelegate:forServiceType:");

  id v38 = _SUSUILoggingFacility();
  os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v38;
    os_log_type_t type = v37;
    double v2 = (objc_class *)objc_opt_class();
    double v24 = NSStringFromClass(v2);
    double v6 = v24;
    double v36 = v6;
    id v7 = v42;
    id v23 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v42 currentUIState]);
    id v8 = v23;
    uint64_t v35 = v8;
    uint64_t v9 = [(SUSUISoftwareUpdateController *)v42 currentUIState];
    id v22 = [(SUSUISoftwareUpdateController *)v42 presentingStatefulDescriptor];
    id v21 = [(SUSUISoftwareUpdateController *)v42 presentingStatefulDescriptor];
    id v20 = [(SUSUISoftwareUpdateController *)v42 presentingAlternateStatefulDescriptor];
    id v19 = [(SUSUISoftwareUpdateController *)v42 presentingAlternateStatefulDescriptor];
    id v18 = [(SUSUISoftwareUpdateController *)v42 manager];
    double v17 = [(SUSettingsStatefulUIManager *)v18 currentDownload];
    id v16 = [(SUDownload *)v17 descriptor];
    id v15 = (id)[(SUDescriptor *)v16 humanReadableUpdateName];
    id v5 = v15;
    id v34 = v5;
    float v14 = [(SUSUISoftwareUpdateController *)v42 manager];
    id v13 = [(SUSettingsStatefulUIManager *)v14 currentDownload];
    BOOL v12 = [(SUSUISoftwareUpdateController *)v42 manager];
    BOOL v3 = [(SUSettingsStatefulUIManager *)v12 isTargetedUpdateScheduledForAutoInstall];
    float v4 = "YES";
    if (!v3) {
      float v4 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v43, (uint64_t)"-[SUSUISoftwareUpdateController(UI) viewDidLoad]", (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, v9, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v19, (uint64_t)v5, (uint64_t)v13, (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v43, 0x7Au);

    objc_storeStrong(&v34, 0);
    objc_storeStrong((id *)&v35, 0);
    objc_storeStrong((id *)&v36, 0);
  }
  objc_storeStrong(&v38, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  int v46 = self;
  SEL v45 = a2;
  BOOL v44 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SUSUISoftwareUpdateController;
  [(SUSUISoftwareUpdateController *)&v43 viewWillAppear:a3];
  id v30 = (id)[(SUSUISoftwareUpdateController *)v46 navigationController];
  id v42 = (id)[v30 topViewController];

  id v41 = _SUSUILoggingFacility();
  os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v3);
    BOOL v12 = v11;
    id v39 = v12;
    id v13 = v46;
    float v14 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v46 currentUIState]);
    id v15 = v14;
    id v38 = v15;
    uint64_t v16 = [(SUSUISoftwareUpdateController *)v46 currentUIState];
    id v17 = [(SUSUISoftwareUpdateController *)v46 presentingStatefulDescriptor];
    id v18 = [(SUSUISoftwareUpdateController *)v46 presentingStatefulDescriptor];
    id v19 = [(SUSUISoftwareUpdateController *)v46 presentingAlternateStatefulDescriptor];
    id v20 = [(SUSUISoftwareUpdateController *)v46 presentingAlternateStatefulDescriptor];
    id v21 = [(SUSUISoftwareUpdateController *)v46 manager];
    id v22 = [(SUSettingsStatefulUIManager *)v21 currentDownload];
    id v23 = [(SUDownload *)v22 descriptor];
    id v24 = (id)[(SUDescriptor *)v23 humanReadableUpdateName];
    id v25 = v24;
    id location = v25;
    id v26 = [(SUSUISoftwareUpdateController *)v46 manager];
    id v27 = [(SUSettingsStatefulUIManager *)v26 currentDownload];
    id v28 = [(SUSUISoftwareUpdateController *)v46 manager];
    BOOL v4 = [(SUSettingsStatefulUIManager *)v28 isTargetedUpdateScheduledForAutoInstall];
    id v5 = "YES";
    if (!v4) {
      id v5 = "NO";
    }
    uint64_t v29 = (uint64_t)v5;
    char v35 = 0;
    if (v42)
    {
      double v6 = (objc_class *)objc_opt_class();
      double v36 = NSStringFromClass(v6);
      char v35 = 1;
      id v10 = (__CFString *)v36;
    }
    else
    {
      id v10 = @"N/A";
    }
    __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64((uint64_t)v47, (uint64_t)"-[SUSUISoftwareUpdateController(UI) viewWillAppear:]", (uint64_t)v12, (uint64_t)v13, (uint64_t)v15, v16, (uint64_t)v17, (uint64_t)v18, (uint64_t)v19, (uint64_t)v20, (uint64_t)v25, (uint64_t)v27, v29, (uint64_t)v10);
    _os_log_impl(&dword_228401000, (os_log_t)v41, v40, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nCurrent top view controller: %@", v47, 0x84u);
    if (v35) {

    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  objc_storeStrong(&v41, 0);
  if ([(SUSUISoftwareUpdateController *)v46 currentUIState])
  {
    char v33 = 0;
    char v31 = 0;
    char v8 = 0;
    if (![(SUSUISoftwareUpdateController *)v46 isBusy])
    {
      id v34 = [(SUSUISoftwareUpdateController *)v46 manager];
      char v33 = 1;
      id v32 = [(SUSettingsStatefulUIManager *)v34 delegate];
      char v31 = 1;
      char v8 = [(SUSettingsStatefulUIManagerDelegate *)v32 isEqual:v46];
    }
    if (v31) {

    }
    if (v33) {
    if (v8)
    }
    {
      id v7 = [(SUSUISoftwareUpdateController *)v46 manager];
      [(SUSettingsStatefulUIManager *)v7 refreshState];
    }
  }
  else
  {
    uint64_t v9 = [(SUSUISoftwareUpdateController *)v46 manager];
    [(SUSettingsStatefulUIManager *)v9 checkForAvailableUpdates];
  }
  objc_storeStrong(&v42, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  int v90 = (id *)&v112;
  int v85 = "-[SUSUISoftwareUpdateController(UI) viewDidAppear:]";
  uint64_t v120 = *MEMORY[0x263EF8340];
  v117 = self;
  SEL v116 = a2;
  int v92 = 1;
  BOOL v115 = a3;
  v114.receiver = self;
  v114.super_class = (Class)SUSUISoftwareUpdateController;
  [(SUSUISoftwareUpdateController *)&v114 viewDidAppear:a3];
  char v87 = v117;
  uint64_t v86 = MEMORY[0x263F086E0];
  id v89 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v88 = (id)[v89 localizedStringForKey:@"SOFTWARE_UPDATE" value:&stru_26DCD7690 table:@"Software Update"];
  -[PSListController addNavigationEventForSystemSettings:](v87, "addNavigationEventForSystemSettings:");

  int v91 = v117;
  char v3 = [(SUSUISoftwareUpdateController *)v117 isMemberOfClass:objc_opt_class()];
  char v113 = 0;
  char v111 = 0;
  BOOL v93 = 0;
  if (v3)
  {
    id v4 = (id)[v90[7] manager];
    v90[2] = v4;
    int v84 = 1;
    char v113 = 1;
    id v5 = (id)[v4 delegate];
    double v6 = v90;
    *int v90 = v5;
    char v111 = 1;
    BOOL v93 = v5 != v6[7];
  }
  BOOL v83 = v93;
  if (v111) {

  }
  if (v113) {
  if (v83)
  }
  {
    osos_log_t log = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog;
      *(_DWORD *)unsigned int v56 = type;
      id v7 = (objc_class *)objc_opt_class();
      id v74 = NSStringFromClass(v7);
      id v50 = v74;
      char v81 = &v108;
      id v108 = v50;
      id v51 = v90[7];
      id v73 = SUSettingsUIStateToString([v90[7] currentUIState]);
      id v52 = v73;
      id v80 = &v107;
      id v107 = v52;
      uint64_t v53 = [v90[7] currentUIState];
      id v72 = (id)[v90[7] presentingStatefulDescriptor];
      id v71 = (id)[v90[7] presentingStatefulDescriptor];
      id v8 = (id)[v90[7] presentingAlternateStatefulDescriptor];
      id v70 = v8;
      id v69 = (id)[v90[7] presentingAlternateStatefulDescriptor];
      id v68 = (id)[v90[7] manager];
      id v67 = (id)[v68 currentDownload];
      id v66 = (id)[v67 descriptor];
      id v65 = (id)[v66 humanReadableUpdateName];
      id v44 = v65;
      int v79 = &v106;
      id v106 = v44;
      id v64 = (id)[v90[7] manager];
      id v63 = (id)[v64 currentDownload];
      id v62 = (id)[v90[7] manager];
      char v9 = [v62 isTargetedUpdateScheduledForAutoInstall];
      id v10 = "YES";
      if ((v9 & 1) == 0) {
        id v10 = "NO";
      }
      SEL v45 = v10;
      id v46 = (id)objc_opt_class();
      int v78 = &v105;
      id v105 = v46;
      id v47 = (id)objc_opt_class();
      uint64_t v77 = &v104;
      id v104 = v47;
      id v61 = (id)[v90[7] manager];
      id v60 = (id)[v61 delegate];
      id v59 = (id)[v90[7] manager];
      id v58 = (id)[v59 delegate];
      id v48 = (id)objc_opt_class();
      id v76 = &v103;
      id v103 = v48;
      id v49 = v90[7];
      id location = &v102;
      id v102 = (id)objc_opt_class();
      id v54 = &v15;
      buf = v119;
      __os_log_helper_16_2_18_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_66_8_0_8_66_8_0_8_66((uint64_t)v119, (uint64_t)v85, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, v53, (uint64_t)v72, (uint64_t)v71, (uint64_t)v8, (uint64_t)v69, (uint64_t)v44, (uint64_t)v63, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, (uint64_t)v60, (uint64_t)v48, (uint64_t)v49, (uint64_t)v102);
      _os_log_impl(&dword_228401000, log, v56[0], "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nThe Stateful UI manager's delegate is pointing to another, non %{public}@ controller. Grabbing the pointer back to %{public}@. \tCurrent Pointer: %p (%{public}@)\n\tAssigned Pointer: %p (%{public}@)", buf, 0xB6u);

      id obj = 0;
      objc_storeStrong(location, 0);
      objc_storeStrong(v76, obj);
      objc_storeStrong(v77, obj);
      objc_storeStrong(v78, obj);
      objc_storeStrong(v79, obj);
      objc_storeStrong(v80, obj);
      objc_storeStrong(v81, obj);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v42 = v90[7];
    id v43 = (id)[v90[7] manager];
    [v43 setDelegate:v42];

    [v90[7] refreshPane];
  }
  id v41 = (id)[v90[7] navigationController];
  id v101 = (id)[v41 topViewController];

  os_log_t v100 = (os_log_t)_SUSUILoggingFacility();
  os_log_type_t v99 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v20 = v100;
    *(_DWORD *)id v21 = v99;
    id v11 = (objc_class *)objc_opt_class();
    id v22 = NSStringFromClass(v11);
    id v23 = v22;
    id v98 = v23;
    id v24 = v90[7];
    id v25 = SUSettingsUIStateToString([v90[7] currentUIState]);
    id v26 = v25;
    id v97 = v26;
    uint64_t v27 = [v90[7] currentUIState];
    id v28 = (id)[v90[7] presentingStatefulDescriptor];
    id v29 = (id)[v90[7] presentingStatefulDescriptor];
    id v30 = (id)[v90[7] presentingAlternateStatefulDescriptor];
    id v31 = (id)[v90[7] presentingAlternateStatefulDescriptor];
    id v32 = (id)[v90[7] manager];
    id v33 = (id)[v32 currentDownload];
    id v34 = (id)[v33 descriptor];
    id v35 = (id)[v34 humanReadableUpdateName];
    id v36 = v35;
    id v96 = v36;
    id v37 = (id)[v90[7] manager];
    id v38 = (id)[v37 currentDownload];
    id v39 = (id)[v90[7] manager];
    char v12 = [v39 isTargetedUpdateScheduledForAutoInstall];
    id v13 = "YES";
    if ((v12 & 1) == 0) {
      id v13 = "NO";
    }
    os_log_type_t v40 = v13;
    char v94 = 0;
    if (v101)
    {
      float v14 = (objc_class *)objc_opt_class();
      id v95 = NSStringFromClass(v14);
      char v94 = 1;
      id v19 = (__CFString *)v95;
    }
    else
    {
      id v19 = @"N/A";
    }
    id v18 = v118;
    __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64((uint64_t)v118, (uint64_t)v85, (uint64_t)v23, (uint64_t)v24, (uint64_t)v26, v27, (uint64_t)v28, (uint64_t)v29, (uint64_t)v30, (uint64_t)v31, (uint64_t)v36, (uint64_t)v38, (uint64_t)v40, (uint64_t)v19);
    _os_log_impl(&dword_228401000, v20, v21[0], "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nCurrent top view controller: %@", v18, 0x84u);
    if (v94) {

    }
    id v17 = 0;
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, v17);
    objc_storeStrong(&v98, v17);
  }
  id v16 = 0;
  objc_storeStrong((id *)&v100, 0);
  objc_storeStrong(&v101, v16);
}

- (void)loadView
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v32 = self;
  SEL v31 = a2;
  v30.receiver = self;
  v30.super_class = (Class)SUSUISoftwareUpdateController;
  [(SUSUISoftwareUpdateController *)&v30 loadView];
  id v29 = _SUSUILoggingFacility();
  os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v29;
    os_log_type_t type = v28;
    double v2 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v2);
    double v6 = v24;
    uint64_t v27 = v6;
    id v7 = v32;
    id v23 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v32 currentUIState]);
    id v8 = v23;
    id v26 = v8;
    uint64_t v9 = [(SUSUISoftwareUpdateController *)v32 currentUIState];
    id v22 = [(SUSUISoftwareUpdateController *)v32 presentingStatefulDescriptor];
    id v21 = [(SUSUISoftwareUpdateController *)v32 presentingStatefulDescriptor];
    id v20 = [(SUSUISoftwareUpdateController *)v32 presentingAlternateStatefulDescriptor];
    id v19 = [(SUSUISoftwareUpdateController *)v32 presentingAlternateStatefulDescriptor];
    id v18 = [(SUSUISoftwareUpdateController *)v32 manager];
    id v17 = [(SUSettingsStatefulUIManager *)v18 currentDownload];
    id v16 = [(SUDownload *)v17 descriptor];
    id v15 = (id)[(SUDescriptor *)v16 humanReadableUpdateName];
    id v5 = v15;
    id v25 = v5;
    float v14 = [(SUSUISoftwareUpdateController *)v32 manager];
    id v13 = [(SUSettingsStatefulUIManager *)v14 currentDownload];
    char v12 = [(SUSUISoftwareUpdateController *)v32 manager];
    BOOL v3 = [(SUSettingsStatefulUIManager *)v12 isTargetedUpdateScheduledForAutoInstall];
    id v4 = "YES";
    if (!v3) {
      id v4 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v33, (uint64_t)"-[SUSUISoftwareUpdateController(UI) loadView]", (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, v9, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v19, (uint64_t)v5, (uint64_t)v13, (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v33, 0x7Au);

    objc_storeStrong(&v25, 0);
    objc_storeStrong((id *)&v26, 0);
    objc_storeStrong((id *)&v27, 0);
  }
  objc_storeStrong(&v29, 0);
  [(SUSUISoftwareUpdateController *)v32 initUI];
  [*(id *)((char *)&v32->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]) _setMarginWidth:15.0];
}

- (void)willEnterForeground
{
  uint64_t v9 = self;
  v8[1] = (id)a2;
  queue = MEMORY[0x263EF83A0];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  double v6 = __56__SUSUISoftwareUpdateController_UI__willEnterForeground__block_invoke;
  id v7 = &unk_26483BA90;
  v8[0] = v9;
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

uint64_t __56__SUSUISoftwareUpdateController_UI__willEnterForeground__block_invoke(id *a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v34[2] = a1;
  v34[1] = a1;
  v34[0] = _SUSUILoggingFacility();
  os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v34[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v34[0];
    os_log_type_t type = v33;
    id v1 = (objc_class *)objc_opt_class();
    os_log_type_t v28 = NSStringFromClass(v1);
    id v10 = v28;
    id v32 = v10;
    id v11 = a1[4];
    uint64_t v27 = SUSettingsUIStateToString([v11 currentUIState]);
    char v12 = v27;
    SEL v31 = v12;
    uint64_t v13 = [a1[4] currentUIState];
    id v26 = (id)[a1[4] presentingStatefulDescriptor];
    id v25 = (id)[a1[4] presentingStatefulDescriptor];
    id v24 = (id)[a1[4] presentingAlternateStatefulDescriptor];
    id v23 = (id)[a1[4] presentingAlternateStatefulDescriptor];
    id v22 = (id)[a1[4] manager];
    id v21 = (id)[v22 currentDownload];
    id v20 = (id)[v21 descriptor];
    id v19 = (id)[v20 humanReadableUpdateName];
    id v9 = v19;
    id v30 = v9;
    id v18 = (id)[a1[4] manager];
    id v17 = (id)[v18 currentDownload];
    id v16 = (id)[a1[4] manager];
    char v2 = [v16 isTargetedUpdateScheduledForAutoInstall];
    uint64_t v3 = "YES";
    if ((v2 & 1) == 0) {
      uint64_t v3 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v35, (uint64_t)"-[SUSUISoftwareUpdateController(UI) willEnterForeground]_block_invoke", (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v13, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v23, (uint64_t)v9, (uint64_t)v17, (uint64_t)v3);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v35, 0x7Au);

    objc_storeStrong(&v30, 0);
    objc_storeStrong((id *)&v31, 0);
    objc_storeStrong((id *)&v32, 0);
  }
  objc_storeStrong(v34, 0);
  id v5 = a1[4];
  id v6 = (id)[v5 updatedSpecifiersArray];
  objc_msgSend(v5, "setSpecifiers:");

  id v7 = a1[4];
  id v8 = (id)[v7 paneTitle];
  objc_msgSend(v7, "setTitle:");

  return [a1[4] refreshPane];
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v39 = self;
  SEL v38 = a2;
  BOOL v37 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SUSUISoftwareUpdateController;
  [(SUSUISoftwareUpdateController *)&v36 viewWillDisappear:a3];
  id v27 = (id)[(SUSUISoftwareUpdateController *)v39 navigationController];
  id v35 = (id)[v27 topViewController];

  id v34 = _SUSUILoggingFacility();
  os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v3);
    id v9 = v8;
    id v32 = v9;
    id v10 = v39;
    id v11 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v39 currentUIState]);
    char v12 = v11;
    id v31 = v12;
    uint64_t v13 = [(SUSUISoftwareUpdateController *)v39 currentUIState];
    id v14 = [(SUSUISoftwareUpdateController *)v39 presentingStatefulDescriptor];
    id v15 = [(SUSUISoftwareUpdateController *)v39 presentingStatefulDescriptor];
    id v16 = [(SUSUISoftwareUpdateController *)v39 presentingAlternateStatefulDescriptor];
    id v17 = [(SUSUISoftwareUpdateController *)v39 presentingAlternateStatefulDescriptor];
    id v18 = [(SUSUISoftwareUpdateController *)v39 manager];
    id v19 = [(SUSettingsStatefulUIManager *)v18 currentDownload];
    id v20 = [(SUDownload *)v19 descriptor];
    id v21 = (id)[(SUDescriptor *)v20 humanReadableUpdateName];
    id v22 = v21;
    id location = v22;
    id v23 = [(SUSUISoftwareUpdateController *)v39 manager];
    id v24 = [(SUSettingsStatefulUIManager *)v23 currentDownload];
    id v25 = [(SUSUISoftwareUpdateController *)v39 manager];
    BOOL v4 = [(SUSettingsStatefulUIManager *)v25 isTargetedUpdateScheduledForAutoInstall];
    id v5 = "YES";
    if (!v4) {
      id v5 = "NO";
    }
    uint64_t v26 = (uint64_t)v5;
    char v28 = 0;
    if (v35)
    {
      id v6 = (objc_class *)objc_opt_class();
      id v29 = NSStringFromClass(v6);
      char v28 = 1;
      id v7 = (__CFString *)v29;
    }
    else
    {
      id v7 = @"N/A";
    }
    __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64((uint64_t)v40, (uint64_t)"-[SUSUISoftwareUpdateController(UI) viewWillDisappear:]", (uint64_t)v9, (uint64_t)v10, (uint64_t)v12, v13, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16, (uint64_t)v17, (uint64_t)v22, (uint64_t)v24, v26, (uint64_t)v7);
    _os_log_impl(&dword_228401000, (os_log_t)v34, v33, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nCurrent top view controller: %@", v40, 0x84u);
    if (v28) {

    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v39 = self;
  SEL v38 = a2;
  BOOL v37 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SUSUISoftwareUpdateController;
  [(SUSUISoftwareUpdateController *)&v36 viewDidDisappear:a3];
  id v27 = (id)[(SUSUISoftwareUpdateController *)v39 navigationController];
  id v35 = (id)[v27 topViewController];

  id v34 = _SUSUILoggingFacility();
  os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v3);
    id v9 = v8;
    id v32 = v9;
    id v10 = v39;
    id v11 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v39 currentUIState]);
    char v12 = v11;
    id v31 = v12;
    uint64_t v13 = [(SUSUISoftwareUpdateController *)v39 currentUIState];
    id v14 = [(SUSUISoftwareUpdateController *)v39 presentingStatefulDescriptor];
    id v15 = [(SUSUISoftwareUpdateController *)v39 presentingStatefulDescriptor];
    id v16 = [(SUSUISoftwareUpdateController *)v39 presentingAlternateStatefulDescriptor];
    id v17 = [(SUSUISoftwareUpdateController *)v39 presentingAlternateStatefulDescriptor];
    id v18 = [(SUSUISoftwareUpdateController *)v39 manager];
    id v19 = [(SUSettingsStatefulUIManager *)v18 currentDownload];
    id v20 = [(SUDownload *)v19 descriptor];
    id v21 = (id)[(SUDescriptor *)v20 humanReadableUpdateName];
    id v22 = v21;
    id location = v22;
    id v23 = [(SUSUISoftwareUpdateController *)v39 manager];
    id v24 = [(SUSettingsStatefulUIManager *)v23 currentDownload];
    id v25 = [(SUSUISoftwareUpdateController *)v39 manager];
    BOOL v4 = [(SUSettingsStatefulUIManager *)v25 isTargetedUpdateScheduledForAutoInstall];
    id v5 = "YES";
    if (!v4) {
      id v5 = "NO";
    }
    uint64_t v26 = (uint64_t)v5;
    char v28 = 0;
    if (v35)
    {
      id v6 = (objc_class *)objc_opt_class();
      id v29 = NSStringFromClass(v6);
      char v28 = 1;
      id v7 = (__CFString *)v29;
    }
    else
    {
      id v7 = @"N/A";
    }
    __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64((uint64_t)v40, (uint64_t)"-[SUSUISoftwareUpdateController(UI) viewDidDisappear:]", (uint64_t)v9, (uint64_t)v10, (uint64_t)v12, v13, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16, (uint64_t)v17, (uint64_t)v22, (uint64_t)v24, v26, (uint64_t)v7);
    _os_log_impl(&dword_228401000, (os_log_t)v34, v33, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nCurrent top view controller: %@", v40, 0x84u);
    if (v28) {

    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
}

- (BOOL)isTopViewController
{
  id v8 = self;
  location[1] = (id)a2;
  id v3 = (id)[(SUSUISoftwareUpdateController *)self navigationController];
  location[0] = (id)[v3 topViewController];

  char v5 = 0;
  BOOL v4 = 1;
  if (location[0] != v8)
  {
    id v6 = (id)[(SUSUISoftwareUpdateController *)v8 parentViewController];
    char v5 = 1;
    BOOL v4 = location[0] == v6;
  }
  BOOL v9 = v4;
  if (v5) {

  }
  objc_storeStrong(location, 0);
  return v9;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v9 = a4;
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  if ([(SUSUISoftwareUpdateController *)v11 isTopViewController])
  {
    v7.receiver = v11;
    v7.super_class = (Class)SUSUISoftwareUpdateController;
    [(SUSUISoftwareUpdateController *)&v7 presentViewController:location[0] animated:v9 completion:v8];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v92 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v90 = 0;
  objc_storeStrong(&v90, a4);
  char v88 = 0;
  char v86 = 0;
  char v84 = 0;
  char v54 = 1;
  if (location[0])
  {
    id v89 = (id)[location[0] objectForKeyedSubscript:@"ShowDefaultAudiencePane"];
    char v88 = 1;
    BOOL v52 = 0;
    if (!v89)
    {
      id v87 = (id)[location[0] objectForKeyedSubscript:@"PerformAction"];
      char v86 = 1;
      BOOL v52 = 0;
      if (!v87)
      {
        id v85 = (id)[location[0] objectForKeyedSubscript:@"path"];
        char v84 = 1;
        BOOL v52 = v85 == 0;
      }
    }
    char v54 = v52;
  }
  if (v84) {

  }
  if (v86) {
  if (v88)
  }

  if (v54)
  {
    osos_log_t log = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog;
      os_log_type_t v38 = type;
      BOOL v4 = (objc_class *)objc_opt_class();
      id v51 = NSStringFromClass(v4);
      os_log_type_t v33 = v51;
      char v81 = v33;
      id v34 = v92;
      id v50 = SUSettingsUIStateToString([v92 currentUIState]);
      id v35 = v50;
      id v80 = v35;
      uint64_t v36 = [v92 currentUIState];
      id v49 = (id)[v92 presentingStatefulDescriptor];
      id v48 = (id)[v92 presentingStatefulDescriptor];
      id v47 = (id)[v92 presentingAlternateStatefulDescriptor];
      id v46 = (id)[v92 presentingAlternateStatefulDescriptor];
      id v45 = (id)[v92 manager];
      id v44 = (id)[v45 currentDownload];
      id v43 = (id)[v44 descriptor];
      id v42 = (id)[v43 humanReadableUpdateName];
      id v32 = v42;
      id v79 = v32;
      id v41 = (id)[v92 manager];
      id v40 = (id)[v41 currentDownload];
      id v39 = (id)[v92 manager];
      char v5 = [v39 isTargetedUpdateScheduledForAutoInstall];
      id v6 = "YES";
      if ((v5 & 1) == 0) {
        id v6 = "NO";
      }
      __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v95, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]", (uint64_t)v33, (uint64_t)v34, (uint64_t)v35, v36, (uint64_t)v49, (uint64_t)v48, (uint64_t)v47, (uint64_t)v46, (uint64_t)v32, (uint64_t)v40, (uint64_t)v6);
      _os_log_impl(&dword_228401000, log, v38, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSoftwareUpdatePane invoked via URL but no supported option passed in. Nothing to do here. Available options: ShowDefaultAudiencePane, PerformAction", v95, 0x7Au);

      objc_storeStrong(&v79, 0);
      objc_storeStrong((id *)&v80, 0);
      objc_storeStrong((id *)&v81, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(void))v90 + 2))();
    int v78 = 1;
  }
  else
  {
    os_log_t v77 = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v76 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v77;
      os_log_type_t v18 = v76;
      objc_super v7 = (objc_class *)objc_opt_class();
      id v31 = NSStringFromClass(v7);
      uint64_t v13 = v31;
      SEL v75 = v13;
      id v14 = v92;
      id v30 = SUSettingsUIStateToString([v92 currentUIState]);
      id v15 = v30;
      id v74 = v15;
      uint64_t v16 = [v92 currentUIState];
      id v29 = (id)[v92 presentingStatefulDescriptor];
      id v28 = (id)[v92 presentingStatefulDescriptor];
      id v27 = (id)[v92 presentingAlternateStatefulDescriptor];
      id v26 = (id)[v92 presentingAlternateStatefulDescriptor];
      id v25 = (id)[v92 manager];
      id v24 = (id)[v25 currentDownload];
      id v23 = (id)[v24 descriptor];
      id v22 = (id)[v23 humanReadableUpdateName];
      id v12 = v22;
      id v73 = v12;
      id v21 = (id)[v92 manager];
      id v20 = (id)[v21 currentDownload];
      id v19 = (id)[v92 manager];
      if ([v19 isTargetedUpdateScheduledForAutoInstall]) {
        id v8 = "YES";
      }
      else {
        id v8 = "NO";
      }
      __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66((uint64_t)v94, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]", (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, v16, (uint64_t)v29, (uint64_t)v28, (uint64_t)v27, (uint64_t)v26, (uint64_t)v12, (uint64_t)v20, (uint64_t)v8, (uint64_t)location[0]);
      _os_log_impl(&dword_228401000, v17, v18, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSoftwareUpdatePane invoked via URL. Will attempt URL specific loading. Dictionary is %{public}@", v94, 0x84u);

      objc_storeStrong(&v73, 0);
      objc_storeStrong((id *)&v74, 0);
      objc_storeStrong((id *)&v75, 0);
    }
    objc_storeStrong((id *)&v77, 0);
    id v72 = (id)[location[0] objectForKey:@"path"];
    if (v72 && ([v72 isEqualToString:@"SUAutomaticUpdateButton"] & 1) != 0)
    {
      char v71 = 0;
      dispatch_time_t when = dispatch_time(0, 100000000);
      queue = MEMORY[0x263EF83A0];
      uint64_t v65 = MEMORY[0x263EF8330];
      int v66 = -1073741824;
      int v67 = 0;
      id v68 = __62__SUSUISoftwareUpdateController_UI__handleURL_withCompletion___block_invoke;
      id v69 = &unk_26483BA90;
      id v70 = v92;
      dispatch_after(when, queue, &v65);

      (*((void (**)(void))v90 + 2))();
      int v78 = 1;
      objc_storeStrong(&v70, 0);
    }
    else
    {
      os_log_t v64 = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t v63 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v93, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]");
        _os_log_impl(&dword_228401000, v64, v63, "%s: Starting to wait for the scan to be finished", v93, 0xCu);
      }
      objc_storeStrong((id *)&v64, 0);
      id v9 = v92;
      uint64_t v55 = MEMORY[0x263EF8330];
      int v56 = -1073741824;
      int v57 = 0;
      id v58 = __62__SUSUISoftwareUpdateController_UI__handleURL_withCompletion___block_invoke_370;
      id v59 = &unk_26483FD00;
      id v60 = v92;
      id v61 = location[0];
      id v62 = v72;
      [v9 waitForScanCompletionWithTimeout:240 currentAttempt:0 completionHandler:&v55];
      (*((void (**)(void))v90 + 2))();
      objc_storeStrong(&v62, 0);
      objc_storeStrong(&v61, 0);
      objc_storeStrong(&v60, 0);
      int v78 = 0;
    }
    objc_storeStrong(&v72, 0);
  }
  objc_storeStrong(&v90, 0);
  objc_storeStrong(location, 0);
}

void __62__SUSUISoftwareUpdateController_UI__handleURL_withCompletion___block_invoke(id *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  v2[0] = objc_alloc_init(SUSUISoftwareUpdateAutomaticUpdateController);
  [v2[0] setParentController:a1[4]];
  [a1[4] showController:v2[0] animate:1];
  objc_storeStrong(v2, 0);
}

void __62__SUSUISoftwareUpdateController_UI__handleURL_withCompletion___block_invoke_370(uint64_t a1, void *a2)
{
  uint64_t v146 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog[0];
    os_log_type_t v58 = type;
    char v2 = (objc_class *)objc_opt_class();
    id v72 = NSStringFromClass(v2);
    uint64_t v53 = v72;
    int v126 = v53;
    char v54 = *(void **)(a1 + 32);
    char v71 = SUSettingsUIStateToString([v54 currentUIState]);
    uint64_t v55 = v71;
    uint64_t v125 = v55;
    uint64_t v56 = [*(id *)(a1 + 32) currentUIState];
    id v70 = (id)[*(id *)(a1 + 32) presentingStatefulDescriptor];
    id v69 = (id)[*(id *)(a1 + 32) presentingStatefulDescriptor];
    id v68 = (id)[*(id *)(a1 + 32) presentingAlternateStatefulDescriptor];
    id v67 = (id)[*(id *)(a1 + 32) presentingAlternateStatefulDescriptor];
    id v66 = (id)[*(id *)(a1 + 32) manager];
    id v65 = (id)[v66 currentDownload];
    id v64 = (id)[v65 descriptor];
    id v63 = (id)[v64 humanReadableUpdateName];
    id v51 = v63;
    id v124 = v51;
    id v62 = (id)[*(id *)(a1 + 32) manager];
    id v61 = (id)[v62 currentDownload];
    id v60 = (id)[*(id *)(a1 + 32) manager];
    char v3 = [v60 isTargetedUpdateScheduledForAutoInstall];
    BOOL v4 = "YES";
    if ((v3 & 1) == 0) {
      BOOL v4 = "NO";
    }
    uint64_t v52 = (uint64_t)v4;
    id v59 = (id)[*(id *)(a1 + 40) objectForKeyedSubscript:@"PerformAction"];
    __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66((uint64_t)v145, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, v56, (uint64_t)v70, (uint64_t)v69, (uint64_t)v68, (uint64_t)v67, (uint64_t)v51, (uint64_t)v61, v52, (uint64_t)v59);
    _os_log_impl(&dword_228401000, log, v58, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nFinished to wait for an update scan to finish. Performing: %{public}@", v145, 0x84u);

    objc_storeStrong(&v124, 0);
    objc_storeStrong((id *)&v125, 0);
    objc_storeStrong((id *)&v126, 0);
  }
  objc_storeStrong((id *)oslog, 0);
  if (location[0] && [location[0] code])
  {
    if ([location[0] code] == 8)
    {
      os_log_t v123 = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t v122 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_66((uint64_t)v144, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", *(void *)(a1 + 48));
        _os_log_impl(&dword_228401000, v123, v122, "%s: Timeout while performing scan for requested URL: %{public}@", v144, 0x16u);
      }
      objc_storeStrong((id *)&v123, 0);
    }
    else
    {
      os_log_t v121 = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t v120 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_3_8_32_8_0_8_66((uint64_t)v143, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", [location[0] code], *(void *)(a1 + 48));
        _os_log_impl(&dword_228401000, v121, v120, "%s: Error (code: %ld) while performing scan for requested URL: %{public}@", v143, 0x20u);
      }
      objc_storeStrong((id *)&v121, 0);
    }
    int v119 = 1;
  }
  else if (*(void *)(a1 + 48) {
         && ([*(id *)(a1 + 48) isEqualToString:@"SUBetaUpdatesButton"] & 1) != 0)
  }
  {
    id v49 = (id)[*(id *)(a1 + 32) manager];
    id v48 = (id)[v49 seedingBetaManager];
    char v50 = [v48 canCurrentDeviceEnrollInBetaUpdates];

    if ((v50 & 1) == 0)
    {
      os_log_t v118 = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t v117 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v33 = v118;
        os_log_type_t v34 = v117;
        char v5 = (objc_class *)objc_opt_class();
        id v47 = NSStringFromClass(v5);
        id v29 = v47;
        SEL v116 = v29;
        id v30 = *(void **)(a1 + 32);
        id v46 = SUSettingsUIStateToString([v30 currentUIState]);
        id v31 = v46;
        BOOL v115 = v31;
        uint64_t v32 = [*(id *)(a1 + 32) currentUIState];
        id v45 = (id)[*(id *)(a1 + 32) presentingStatefulDescriptor];
        id v44 = (id)[*(id *)(a1 + 32) presentingStatefulDescriptor];
        id v43 = (id)[*(id *)(a1 + 32) presentingAlternateStatefulDescriptor];
        id v42 = (id)[*(id *)(a1 + 32) presentingAlternateStatefulDescriptor];
        id v41 = (id)[*(id *)(a1 + 32) manager];
        id v40 = (id)[v41 currentDownload];
        id v39 = (id)[v40 descriptor];
        id v38 = (id)[v39 humanReadableUpdateName];
        id v28 = v38;
        id v114 = v28;
        id v37 = (id)[*(id *)(a1 + 32) manager];
        id v36 = (id)[v37 currentDownload];
        id v35 = (id)[*(id *)(a1 + 32) manager];
        char v6 = [v35 isTargetedUpdateScheduledForAutoInstall];
        objc_super v7 = "YES";
        if ((v6 & 1) == 0) {
          objc_super v7 = "NO";
        }
        __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v142, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", (uint64_t)v29, (uint64_t)v30, (uint64_t)v31, v32, (uint64_t)v45, (uint64_t)v44, (uint64_t)v43, (uint64_t)v42, (uint64_t)v28, (uint64_t)v36, (uint64_t)v7);
        _os_log_impl(&dword_228401000, v33, v34, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSeeding reports that the device is not enrolled to beta updates. Continue with the request anyway.", v142, 0x7Au);

        objc_storeStrong(&v114, 0);
        objc_storeStrong((id *)&v115, 0);
        objc_storeStrong((id *)&v116, 0);
      }
      objc_storeStrong((id *)&v118, 0);
    }
    dispatch_time_t when = dispatch_time(0, 100000000);
    queue = MEMORY[0x263EF83A0];
    uint64_t v108 = MEMORY[0x263EF8330];
    int v109 = -1073741824;
    int v110 = 0;
    char v111 = __62__SUSUISoftwareUpdateController_UI__handleURL_withCompletion___block_invoke_371;
    char v112 = &unk_26483BA90;
    id v113 = *(id *)(a1 + 32);
    dispatch_after(when, queue, &v108);

    int v119 = 1;
    objc_storeStrong(&v113, 0);
  }
  else if (!*(void *)(a1 + 48) || ([*(id *)(a1 + 48) isEqualToString:&stru_26DCD7690] & 1) != 0)
  {
    id v8 = (id)[*(id *)(a1 + 40) objectForKeyedSubscript:@"PerformAction"];
    BOOL v25 = v8 == 0;

    if (v25)
    {
      os_log_t v100 = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t v99 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v138, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
        _os_log_impl(&dword_228401000, v100, v99, "%s: Attempting to show the update pane with the Default Audience asset", v138, 0xCu);
      }
      objc_storeStrong((id *)&v100, 0);
      uint64_t v98 = 0;
      uint64_t v98 = [*(id *)(a1 + 32) currentUIState];
      unint64_t v97 = 0;
      unint64_t v97 = [*(id *)(a1 + 32) currentDescriptorState];
      if (v98 == 3)
      {
        os_log_t v96 = (os_log_t)_SUSUILoggingFacility();
        os_log_type_t v95 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v137, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
          _os_log_impl(&dword_228401000, v96, v95, "%s: Manager reported no update was found. Nothing more to do.", v137, 0xCu);
        }
        objc_storeStrong((id *)&v96, 0);
        int v119 = 1;
      }
      else if (v98 == 2)
      {
        os_log_t v94 = (os_log_t)_SUSUILoggingFacility();
        os_log_type_t v93 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v136, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
          _os_log_impl(&dword_228401000, v94, v93, "%s: Manager couldn't find an update - scan failed. Nothing more to do.", v136, 0xCu);
        }
        objc_storeStrong((id *)&v94, 0);
        int v119 = 1;
      }
      else if (v97 < 4)
      {
        if (v98 == 4)
        {
          if (([*(id *)(a1 + 32) presentingStatefulDescriptorPromotedAsAlternate] & 1) == 0) {
            goto LABEL_61;
          }
          os_log_t v90 = (os_log_t)_SUSUILoggingFacility();
          os_log_type_t v89 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_1_8_32((uint64_t)v134, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
            _os_log_impl(&dword_228401000, v90, v89, "%s: presentingStatefulDescriptorPromotedAsAlternate reported true", v134, 0xCu);
          }
          objc_storeStrong((id *)&v90, 0);
          id v18 = (id)[*(id *)(a1 + 32) presentingDescriptor];
          char v87 = 0;
          BOOL v19 = 0;
          if (v18)
          {
            id v88 = (id)[*(id *)(a1 + 32) presentingDescriptor];
            char v87 = 1;
            BOOL v19 = [v88 audienceType] == 1;
          }
          if (v87) {

          }
          if (v19)
          {
            [*(id *)(a1 + 32) showAlsoAvailaibleSUPane];
            int v119 = 1;
          }
          else
          {
LABEL_61:
            id v16 = (id)[*(id *)(a1 + 32) presentingDescriptor];
            char v85 = 0;
            BOOL v17 = 0;
            if (v16)
            {
              id v86 = (id)[*(id *)(a1 + 32) presentingDescriptor];
              char v85 = 1;
              BOOL v17 = [v86 audienceType] == 1;
            }
            if (v85) {

            }
            if (v17)
            {
              os_log_t v84 = (os_log_t)_SUSUILoggingFacility();
              os_log_type_t v83 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
              {
                id v15 = (id)[*(id *)(a1 + 32) presentingDescriptor];
                __os_log_helper_16_2_2_8_32_8_66((uint64_t)v133, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", (uint64_t)v15);
                _os_log_impl(&dword_228401000, v84, v83, "%s: DefaultAudience descriptor: %{public}@\nattached to primary pane. Nothing to do.", v133, 0x16u);
              }
              objc_storeStrong((id *)&v84, 0);
              int v119 = 1;
            }
            else
            {
              id v13 = (id)[*(id *)(a1 + 32) presentingAlternateDescriptor];
              char v81 = 0;
              BOOL v14 = 0;
              if (v13)
              {
                id v82 = (id)[*(id *)(a1 + 32) presentingAlternateDescriptor];
                char v81 = 1;
                BOOL v14 = [v82 audienceType] == 1;
              }
              if (v81) {

              }
              if (v14)
              {
                os_log_t v80 = (os_log_t)_SUSUILoggingFacility();
                os_log_type_t v79 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                {
                  id v12 = (id)[*(id *)(a1 + 32) presentingAlternateDescriptor];
                  __os_log_helper_16_2_2_8_32_8_66((uint64_t)v132, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", (uint64_t)v12);
                  _os_log_impl(&dword_228401000, v80, v79, "%s: DefaultAudience descriptor: %{public}@\nattached to 'Also Availaible' pane.", v132, 0x16u);
                }
                objc_storeStrong((id *)&v80, 0);
                [*(id *)(a1 + 32) showAlsoAvailaibleSUPane];
                int v119 = 1;
              }
              else
              {
                os_log_t v78 = (os_log_t)_SUSUILoggingFacility();
                os_log_type_t v77 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                {
                  __os_log_helper_16_2_1_8_32((uint64_t)v131, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
                  _os_log_impl(&dword_228401000, v78, v77, "%s: No DefaultAudience updates found. Nothing to do.", v131, 0xCu);
                }
                objc_storeStrong((id *)&v78, 0);
                int v119 = 1;
              }
            }
          }
        }
        else
        {
          os_log_t v76 = (os_log_t)_SUSUILoggingFacility();
          os_log_type_t v75 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            id v9 = v76;
            os_log_type_t v10 = v75;
            id v11 = SUSettingsUIStateToString(v98);
            id v74 = v11;
            __os_log_helper_16_2_3_8_32_8_0_8_64((uint64_t)v130, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", v98, (uint64_t)v74);
            _os_log_impl(&dword_228401000, v9, v10, "%s: The state %ld (%@) isn't associated with any special handler. Nothing more to do.", v130, 0x20u);

            objc_storeStrong((id *)&v74, 0);
          }
          objc_storeStrong((id *)&v76, 0);
          int v119 = 0;
        }
      }
      else
      {
        os_log_t v92 = (os_log_t)_SUSUILoggingFacility();
        os_log_type_t v91 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v135, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
          _os_log_impl(&dword_228401000, v92, v91, "%s: The manager update state is past the \"ready to download\" phase (update already downloading/preparing/ready to install/installing). Nothing more to do.", v135, 0xCu);
        }
        objc_storeStrong((id *)&v92, 0);
        int v119 = 1;
      }
    }
    else
    {
      id v23 = (id)[*(id *)(a1 + 40) objectForKeyedSubscript:@"PerformAction"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        os_log_t v105 = (os_log_t)_SUSUILoggingFacility();
        os_log_type_t v104 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_32((uint64_t)v140, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke");
          _os_log_impl(&dword_228401000, v105, v104, "%s: Can't resolve \"PerformAction\" because it's not an NSString.", v140, 0xCu);
        }
        objc_storeStrong((id *)&v105, 0);
      }
      unint64_t v103 = 0;
      id v21 = (id)[*(id *)(a1 + 40) objectForKeyedSubscript:@"PerformAction"];
      unint64_t v22 = +[SUSUISoftwareUpdateController updateActionForString:](SUSUISoftwareUpdateController, "updateActionForString:");

      unint64_t v103 = v22;
      os_log_t v102 = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t v101 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = (id)[*(id *)(a1 + 40) objectForKeyedSubscript:@"PerformAction"];
        __os_log_helper_16_2_3_8_32_8_66_8_0((uint64_t)v139, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke", (uint64_t)v20, v103);
        _os_log_impl(&dword_228401000, v102, v101, "%s: Resolving the \"PerformAction\" string '%{public}@' - %ld", v139, 0x20u);
      }
      objc_storeStrong((id *)&v102, 0);
      [*(id *)(a1 + 32) performDeepLinkAction:v103];
      int v119 = 1;
    }
  }
  else
  {
    os_log_t v107 = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v106 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v141, (uint64_t)"-[SUSUISoftwareUpdateController(UI) handleURL:withCompletion:]_block_invoke_2", *(void *)(a1 + 48));
      _os_log_impl(&dword_228401000, v107, v106, "%s: Can't resolve URL: %{public}@", v141, 0x16u);
    }
    objc_storeStrong((id *)&v107, 0);
    int v119 = 1;
  }
  objc_storeStrong(location, 0);
}

void __62__SUSUISoftwareUpdateController_UI__handleURL_withCompletion___block_invoke_371(id *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  v2[0] = objc_alloc_init(SUSUISoftwareUpdateBetaUpdatesController);
  [v2[0] setParentController:a1[4]];
  [a1[4] showController:v2[0] animate:1];
  objc_storeStrong(v2, 0);
}

- (BOOL)isBusy
{
  BOOL v4 = [(SUSUISoftwareUpdateController *)self refreshControl];
  char v11 = 0;
  char v9 = 0;
  char v7 = 0;
  char v5 = 0;
  if (!v4
    || (id v12 = [(SUSUISoftwareUpdateController *)self refreshControl],
        char v11 = 1,
        char v3 = 1,
        ![(UIRefreshControl *)v12 isRefreshing]))
  {
    os_log_type_t v10 = [(SUSUISoftwareUpdateController *)self updateOptionsCell];
    char v9 = 1;
    if (!v10
      || (id v8 = [(SUSUISoftwareUpdateController *)self updateOptionsCell],
          char v7 = 1,
          char v3 = 1,
          ![(SUSSoftwareUpdateUpdateOptionsCell *)v8 activityIndicatorDisplayStyle]))
    {
      char v6 = [(SUSUISoftwareUpdateController *)self manager];
      char v5 = 1;
      char v3 = [(SUSettingsStatefulUIManager *)v6 isPerformingUpdate];
    }
  }
  if (v5) {

  }
  if (v7) {
  if (v9)
  }

  if (v11) {
  return v3 & 1;
  }
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)_createGroupIndices:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v9 = [location[0] count];
  id v8 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:v9];
  for (unint64_t i = 0; i < v9; ++i)
  {
    id v7 = (id)[location[0] objectAtIndex:i];
    if (!*(void *)((char *)v7 + (int)*MEMORY[0x263F5FE10]))
    {
      id v5 = v8;
      id v6 = (id)[NSNumber numberWithUnsignedInteger:i];
      objc_msgSend(v5, "addObject:");
    }
    objc_storeStrong(&v7, 0);
  }
  id v4 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)specifierForSection:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v18 = self;
  SEL v17 = a2;
  unint64_t v16 = a3;
  id v15 = (id)[(SUSUISoftwareUpdateController *)self specifiers];
  id location = [(SUSUISoftwareUpdateController *)v18 _createGroupIndices:v15];
  if (location)
  {
    if ([location count] > v16)
    {
      id v5 = (id)[location objectAtIndex:v16];
      unint64_t v6 = [v5 integerValue];

      unint64_t v8 = v6;
      if (v6 < [*(id *)((char *)&v18->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) count])
      {
        id v19 = (id)[v15 objectAtIndex:v8];
        int v11 = 1;
      }
      else
      {
        os_log_t v7 = (os_log_t)_SUSUILoggingFacility();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_5_8_0_8_0_8_0_8_66_8_66((uint64_t)v20, v16, v8, [v15 count], (uint64_t)location, (uint64_t)v15);
          _os_log_error_impl(&dword_228401000, v7, OS_LOG_TYPE_ERROR, "Failed to resolve the specifier for section %ld. The resolved index (%ld) >= the number of total specifiers (%ld) and will cause an overflow. Groups: %{public}@; Specifiers: %{public}@",
            v20,
            0x34u);
        }
        objc_storeStrong((id *)&v7, 0);
        id v19 = 0;
        int v11 = 1;
      }
    }
    else
    {
      os_log_t v10 = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_5_8_0_8_0_8_0_8_66_8_66((uint64_t)v21, v16, [location count], v16, (uint64_t)location, (uint64_t)v15);
        _os_log_error_impl(&dword_228401000, v10, v9, "Failed to resolve the specifier for section %ld. The number of groups (%ld) <= the requested section (%ld) and will cause an overflow. Groups: %{public}@; Specifiers: %{public}@",
          v21,
          0x34u);
      }
      objc_storeStrong((id *)&v10, 0);
      id v19 = 0;
      int v11 = 1;
    }
  }
  else
  {
    osos_log_t log = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_0_8_66((uint64_t)v22, v16, (uint64_t)v15);
      _os_log_error_impl(&dword_228401000, oslog, type, "Failed to resolve the specifier for section %ld. The returned groups array is nil. Specifiers: %{public}@", v22, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v19 = 0;
    int v11 = 1;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v15, 0);
  char v3 = v19;
  return v3;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v18 = a4;
  id v17 = [(SUSUISoftwareUpdateController *)v20 specifierForSection:a4];
  id v11 = (id)[v17 propertyForKey:*MEMORY[0x263F60138]];
  char v15 = 0;
  char v12 = 0;
  if (v11)
  {
    id v16 = (id)[v17 propertyForKey:*MEMORY[0x263F60138]];
    char v15 = 1;
    char v12 = [v16 isEqualToString:@"SUScanStatusCell"];
  }
  if (v15) {

  }
  if (v12)
  {
    double v21 = 2.22507386e-308;
    int v14 = 1;
  }
  else
  {
    id v4 = (id)[v17 propertyForKey:@"SUHeight"];
    BOOL v9 = v4 == 0;

    if (v9
      || (id v7 = (id)[v17 propertyForKey:@"SUHeight"],
          BOOL v8 = [v7 integerValue] != 0,
          v7,
          v8))
    {
      v13.receiver = v20;
      v13.super_class = (Class)SUSUISoftwareUpdateController;
      [(SUSUISoftwareUpdateController *)&v13 tableView:location[0] heightForHeaderInSection:v18];
      double v21 = v5;
      int v14 = 1;
    }
    else
    {
      double v21 = 2.22507386e-308;
      int v14 = 1;
    }
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v21;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  BOOL v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23[1] = (id)a4;
  v23[0] = [(SUSUISoftwareUpdateController *)v25 specifierForSection:a4];
  id v7 = (id)[v23[0] propertyForKey:*MEMORY[0x263F60138]];
  char v21 = 0;
  char v19 = 0;
  char v17 = 0;
  char v15 = 0;
  char v13 = 0;
  char v11 = 0;
  char v9 = 0;
  BOOL v8 = 0;
  if (v7)
  {
    id v22 = +[SUSUISoftwareUpdateController visibleGroupSpecifiers];
    char v21 = 1;
    id v20 = (id)[v23[0] propertyForKey:*MEMORY[0x263F60138]];
    char v19 = 1;
    BOOL v8 = 0;
    if (objc_msgSend(v22, "containsObject:"))
    {
      id v18 = (id)[v23[0] name];
      char v17 = 1;
      if (!v18
        || (id v16 = (id)[v23[0] name],
            char v15 = 1,
            BOOL v5 = 1,
            ([v16 isEqualToString:&stru_26DCD7690] & 1) != 0))
      {
        id v14 = (id)[v23[0] propertyForKey:*MEMORY[0x263F600F8]];
        char v13 = 1;
        if (!v14
          || (id v12 = (id)[v23[0] propertyForKey:*MEMORY[0x263F600F8]],
              char v11 = 1,
              BOOL v5 = 1,
              ([v12 isEqualToString:&stru_26DCD7690] & 1) != 0))
        {
          id v10 = (id)[v23[0] propertyForKey:*MEMORY[0x263F60108]];
          char v9 = 1;
          BOOL v5 = v10 != 0;
        }
      }
      BOOL v8 = v5;
    }
  }
  if (v9) {

  }
  if (v11) {
  if (v13)
  }

  if (v15) {
  if (v17)
  }

  if (v19) {
  if (v21)
  }

  if (v8) {
    double v26 = *MEMORY[0x263F839B8];
  }
  else {
    double v26 = 2.22507386e-308;
  }
  objc_storeStrong(v23, 0);
  objc_storeStrong(location, 0);
  return v26;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12[1] = (id)a4;
  v12[0] = [(SUSUISoftwareUpdateController *)v14 specifierForSection:a4];
  id v6 = (id)[v12[0] propertyForKey:*MEMORY[0x263F60138]];
  char v10 = 0;
  char v8 = 0;
  char v7 = 0;
  if (v6)
  {
    id v11 = +[SUSUISoftwareUpdateController visibleGroupSpecifiers];
    char v10 = 1;
    id v9 = (id)[v12[0] propertyForKey:*MEMORY[0x263F60138]];
    char v8 = 1;
    char v7 = objc_msgSend(v11, "containsObject:");
  }
  if (v8) {

  }
  if (v10) {
  if (v7)
  }
    double v15 = *MEMORY[0x263F839B8];
  else {
    double v15 = 2.22507386e-308;
  }
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
  return v15;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  [(SUSUISoftwareUpdateController *)v20 fixCustomCellSpecifiers];
  uint64_t v17 = [(SUSUISoftwareUpdateController *)v20 indexForIndexPath:v18];
  id v16 = (id)[(SUSUISoftwareUpdateController *)v20 specifierAtIndex:v17];
  id v15 = (id)[v16 propertyForKey:*MEMORY[0x263F602B0]];
  id v7 = (id)[(SUSUISoftwareUpdateController *)v20 specifierForID:@"SUTitleCell"];
  char v13 = 0;
  char v11 = 0;
  BOOL v8 = 1;
  if (v16 != v7)
  {
    id v14 = (id)[(SUSUISoftwareUpdateController *)v20 specifierForID:@"SUScanStatusCell"];
    char v13 = 1;
    BOOL v8 = 1;
    if (v16 != v14)
    {
      id v12 = (id)[(SUSUISoftwareUpdateController *)v20 specifierForID:@"SUTipKitComingSoonCell"];
      char v11 = 1;
      BOOL v8 = v16 == v12;
    }
  }
  if (v11) {

  }
  if (v13) {
  if (v8)
  }
  {
    [v15 preferredHeightWithTable:location[0]];
  }
  else
  {
    v9.receiver = v20;
    v9.super_class = (Class)SUSUISoftwareUpdateController;
    [(SUSUISoftwareUpdateController *)&v9 tableView:location[0] heightForRowAtIndexPath:v18];
  }
  double v21 = v4;
  int v10 = 1;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v21;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = 0;
  objc_storeStrong(&v27, a4);
  [(SUSUISoftwareUpdateController *)v29 fixCustomCellSpecifiers];
  id v26 = 0;
  id v25 = (id)[(SUSUISoftwareUpdateController *)v29 specifierAtIndex:[(SUSUISoftwareUpdateController *)v29 indexForIndexPath:v27]];
  id v24 = [(SUSUISoftwareUpdateController *)v29 customCellsMapping];
  memset(__b, 0, sizeof(__b));
  id v18 = v24;
  uint64_t v19 = [v18 countByEnumeratingWithState:__b objects:v30 count:16];
  if (v19)
  {
    uint64_t v14 = *(void *)__b[2];
    uint64_t v15 = 0;
    unint64_t v16 = v19;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)__b[2] != v14) {
        objc_enumerationMutation(v18);
      }
      uint64_t v23 = *(void *)(__b[1] + 8 * v15);
      id v11 = v25;
      id v4 = (id)[(SUSUISoftwareUpdateController *)v29 specifierForID:v23];
      BOOL v12 = v11 != v4;

      if (!v12) {
        break;
      }
      ++v15;
      if (v13 + 1 >= v16)
      {
        uint64_t v15 = 0;
        unint64_t v16 = [v18 countByEnumeratingWithState:__b objects:v30 count:16];
        if (!v16) {
          goto LABEL_9;
        }
      }
    }
    id v5 = (id)[v25 propertyForKey:*MEMORY[0x263F602B0]];
    id v6 = v26;
    id v26 = v5;

    int v21 = 2;
  }
  else
  {
LABEL_9:
    int v21 = 0;
  }

  if (!v26)
  {
    v20.receiver = v29;
    v20.super_class = (Class)SUSUISoftwareUpdateController;
    id v7 = [(SUSUISoftwareUpdateController *)&v20 tableView:location[0] cellForRowAtIndexPath:v27];
    id v8 = v26;
    id v26 = v7;
  }
  objc_msgSend(v26, "setSeparatorInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  id v10 = v26;
  int v21 = 1;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v8 = a4;
  if (*(Class *)((char *)&v10->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8])
    && [*(id *)((char *)&v10->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) count])
  {
    v7.receiver = v10;
    v7.super_class = (Class)SUSUISoftwareUpdateController;
    id v11 = [(SUSUISoftwareUpdateController *)&v7 tableView:location[0] titleForFooterInSection:v8];
  }
  else
  {
    id v11 = 0;
  }
  objc_storeStrong(location, 0);
  id v4 = v11;
  return v4;
}

- (void)titleCell:(id)a3 learnMoreButtonTapped:(id)a4
{
  int v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  objc_super v7 = v21;
  id v8 = [(SUSUISoftwareUpdateController *)v21 learnMoreTappedString];
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v7, "submitAnalyticsEvent:");

  id v18 = objc_alloc_init(MEMORY[0x263F784D0]);
  id v10 = v18;
  id v9 = [NSString alloc];
  id v14 = [(SUSUISoftwareUpdateController *)v21 presentingDescriptor];
  id v13 = (id)[v14 documentation];
  id v12 = (id)[v13 releaseNotes];
  id v11 = (id)objc_msgSend(v9, "initWithData:encoding:");
  objc_msgSend(v10, "setReleaseNotes:");

  id v4 = objc_alloc(MEMORY[0x263F829B8]);
  id v17 = (id)[v4 initWithRootViewController:v18];
  [v17 setModalPresentationStyle:2];
  id v5 = objc_alloc(MEMORY[0x263F824A8]);
  id v16 = (id)[v5 initWithBarButtonSystemItem:0 target:v21 action:sel_detailedReleaseNotesDonePressed_];
  id v15 = (id)[v18 navigationItem];
  [v15 setRightBarButtonItem:v16];

  [(SUSUISoftwareUpdateController *)v21 presentViewController:v17 animated:1 completion:0];
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  *((unsigned char *)&v8->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB0]) = 0;
  v5.receiver = v8;
  v5.super_class = (Class)SUSUISoftwareUpdateController;
  [(SUSUISoftwareUpdateController *)&v5 tableView:location[0] didSelectRowAtIndexPath:v6];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (id)selectSpecifier:(id)a3
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  id v124 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v115.receiver = v124;
    v115.super_class = (Class)SUSUISoftwareUpdateController;
    id v116 = [(SUSUISoftwareUpdateController *)&v115 selectSpecifier:location[0]];
    if (v116)
    {
      os_log_t v108 = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t v107 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = v108;
        os_log_type_t v41 = v107;
        id v9 = (objc_class *)objc_opt_class();
        uint64_t v56 = NSStringFromClass(v9);
        id v36 = v56;
        os_log_type_t v106 = v36;
        id v37 = v124;
        uint64_t v55 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v124 currentUIState]);
        id v38 = v55;
        os_log_t v105 = v38;
        uint64_t v39 = [(SUSUISoftwareUpdateController *)v124 currentUIState];
        id v54 = [(SUSUISoftwareUpdateController *)v124 presentingStatefulDescriptor];
        id v53 = [(SUSUISoftwareUpdateController *)v124 presentingStatefulDescriptor];
        id v52 = [(SUSUISoftwareUpdateController *)v124 presentingAlternateStatefulDescriptor];
        id v51 = [(SUSUISoftwareUpdateController *)v124 presentingAlternateStatefulDescriptor];
        char v50 = [(SUSUISoftwareUpdateController *)v124 manager];
        id v49 = [(SUSettingsStatefulUIManager *)v50 currentDownload];
        id v48 = [(SUDownload *)v49 descriptor];
        id v47 = (id)[(SUDescriptor *)v48 humanReadableUpdateName];
        id v33 = v47;
        id v104 = v33;
        id v46 = [(SUSUISoftwareUpdateController *)v124 manager];
        id v45 = [(SUSettingsStatefulUIManager *)v46 currentDownload];
        id v44 = [(SUSUISoftwareUpdateController *)v124 manager];
        BOOL v10 = [(SUSettingsStatefulUIManager *)v44 isTargetedUpdateScheduledForAutoInstall];
        id v11 = "YES";
        if (!v10) {
          id v11 = "NO";
        }
        uint64_t v34 = (uint64_t)v11;
        id v43 = (id)[location[0] propertyForKey:*MEMORY[0x263F60138]];
        id v35 = v43;
        id v103 = v35;
        id v12 = (objc_class *)objc_opt_class();
        id v42 = NSStringFromClass(v12);
        os_log_t v102 = v42;
        __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_66((uint64_t)v126, (uint64_t)"-[SUSUISoftwareUpdateController(UI) selectSpecifier:]", (uint64_t)v36, (uint64_t)v37, (uint64_t)v38, v39, (uint64_t)v54, (uint64_t)v53, (uint64_t)v52, (uint64_t)v51, (uint64_t)v33, (uint64_t)v45, v34, (uint64_t)v35, (uint64_t)v102);
        _os_log_impl(&dword_228401000, v40, v41, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSelected specifier ID: %{public}@ -> %{public}@", v126, 0x8Eu);

        objc_storeStrong((id *)&v102, 0);
        objc_storeStrong(&v103, 0);
        objc_storeStrong(&v104, 0);
        objc_storeStrong((id *)&v105, 0);
        objc_storeStrong((id *)&v106, 0);
      }
      objc_storeStrong((id *)&v108, 0);
      id v31 = (id)[location[0] propertyForKey:*MEMORY[0x263F60138]];
      char v100 = 0;
      char v32 = 1;
      if (([v31 isEqualToString:@"SUAlternateUpdateButton"] & 1) == 0)
      {
        id v101 = (id)[location[0] propertyForKey:*MEMORY[0x263F60138]];
        char v100 = 1;
        char v32 = [v101 isEqualToString:@"SUNonPromotedUpdateButton"];
      }
      if (v100) {

      }
      if (v32)
      {
        id v99 = v116;
        id v27 = [(SUSUISoftwareUpdateController *)v124 manager];
        objc_msgSend(v99, "setManager:");

        id v28 = (id)[v99 manager];
        [v28 setDelegate:v99];

        [v99 setParentController:v124];
        [v99 setDelegate:v124];
        id v29 = (id)[location[0] propertyForKey:*MEMORY[0x263F60138]];
        char v30 = [v29 isEqualToString:@"SUAlternateUpdateButton"];

        if (v30)
        {
          [v99 setSlowRollUpdateType:0];
          id v25 = v124;
          id v26 = [(SUSUISoftwareUpdateController *)v124 analyticsAlternateUpdateCellTappedString];
          -[SUSUISoftwareUpdateController recordAnalyticsEvent:](v25, "recordAnalyticsEvent:");
        }
        else
        {
          [v99 setSlowRollUpdateType:1];
          uint64_t v23 = v124;
          id v24 = [(SUSUISoftwareUpdateController *)v124 analyticsNonPromotedUpdateCellTappedString];
          -[SUSUISoftwareUpdateController recordAnalyticsEvent:](v23, "recordAnalyticsEvent:");
        }
        objc_storeStrong(&v99, 0);
      }
      else
      {
        id v21 = (id)[location[0] propertyForKey:*MEMORY[0x263F60138]];
        char v22 = [v21 isEqualToString:@"SUAutomaticUpdateButton"];

        if (v22)
        {
          id v19 = v124;
          id v20 = [(SUSUISoftwareUpdateController *)v124 analyticsAutomaticUpdatesCellTappedString];
          -[SUSUISoftwareUpdateController recordAnalyticsEvent:](v19, "recordAnalyticsEvent:");
        }
        else
        {
          id v17 = (id)[location[0] propertyForKey:*MEMORY[0x263F60138]];
          char v18 = [v17 isEqualToString:@"SUGetBetaUpdatesButton"];

          if (v18)
          {
            id v15 = v124;
            id v16 = [(SUSUISoftwareUpdateController *)v124 analyticsBetaUpdatesCellTappedString];
            -[SUSUISoftwareUpdateController recordAnalyticsEvent:](v15, "recordAnalyticsEvent:");
          }
        }
      }
      [(SUSUISoftwareUpdateController *)v124 showController:v116 animate:1];
      uint64_t v125 = 0;
      int v117 = 1;
    }
    else
    {
      os_log_t v114 = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t v113 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        id v63 = v114;
        os_log_type_t v64 = v113;
        id v6 = (objc_class *)objc_opt_class();
        os_log_t v78 = NSStringFromClass(v6);
        id v59 = v78;
        char v112 = v59;
        id v60 = v124;
        os_log_type_t v77 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v124 currentUIState]);
        id v61 = v77;
        char v111 = v61;
        uint64_t v62 = [(SUSUISoftwareUpdateController *)v124 currentUIState];
        id v76 = [(SUSUISoftwareUpdateController *)v124 presentingStatefulDescriptor];
        id v75 = [(SUSUISoftwareUpdateController *)v124 presentingStatefulDescriptor];
        id v74 = [(SUSUISoftwareUpdateController *)v124 presentingAlternateStatefulDescriptor];
        id v73 = [(SUSUISoftwareUpdateController *)v124 presentingAlternateStatefulDescriptor];
        id v72 = [(SUSUISoftwareUpdateController *)v124 manager];
        char v71 = [(SUSettingsStatefulUIManager *)v72 currentDownload];
        id v70 = [(SUDownload *)v71 descriptor];
        id v69 = (id)[(SUDescriptor *)v70 humanReadableUpdateName];
        id v57 = v69;
        id v110 = v57;
        id v68 = [(SUSUISoftwareUpdateController *)v124 manager];
        id v67 = [(SUSettingsStatefulUIManager *)v68 currentDownload];
        id v66 = [(SUSUISoftwareUpdateController *)v124 manager];
        BOOL v7 = [(SUSettingsStatefulUIManager *)v66 isTargetedUpdateScheduledForAutoInstall];
        id v8 = "YES";
        if (!v7) {
          id v8 = "NO";
        }
        uint64_t v58 = (uint64_t)v8;
        id v65 = (id)[location[0] propertyForKey:*MEMORY[0x263F60138]];
        id v109 = v65;
        __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66((uint64_t)v127, (uint64_t)"-[SUSUISoftwareUpdateController(UI) selectSpecifier:]", (uint64_t)v59, (uint64_t)v60, (uint64_t)v61, v62, (uint64_t)v76, (uint64_t)v75, (uint64_t)v74, (uint64_t)v73, (uint64_t)v57, (uint64_t)v67, v58, (uint64_t)v109);
        _os_log_impl(&dword_228401000, v63, v64, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSelected specifier ID: %{public}@ -> No controller found. Skipping on pushing.", v127, 0x84u);

        objc_storeStrong(&v109, 0);
        objc_storeStrong(&v110, 0);
        objc_storeStrong((id *)&v111, 0);
        objc_storeStrong((id *)&v112, 0);
      }
      objc_storeStrong((id *)&v114, 0);
      uint64_t v125 = 0;
      int v117 = 1;
    }
    objc_storeStrong(&v116, 0);
  }
  else
  {
    osos_log_t log = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog;
      os_log_type_t v85 = type;
      char v3 = (objc_class *)objc_opt_class();
      uint64_t v98 = NSStringFromClass(v3);
      os_log_t v80 = v98;
      os_log_type_t v120 = v80;
      char v81 = v124;
      unint64_t v97 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v124 currentUIState]);
      id v82 = v97;
      int v119 = v82;
      uint64_t v83 = [(SUSUISoftwareUpdateController *)v124 currentUIState];
      id v96 = [(SUSUISoftwareUpdateController *)v124 presentingStatefulDescriptor];
      id v95 = [(SUSUISoftwareUpdateController *)v124 presentingStatefulDescriptor];
      id v94 = [(SUSUISoftwareUpdateController *)v124 presentingAlternateStatefulDescriptor];
      id v93 = [(SUSUISoftwareUpdateController *)v124 presentingAlternateStatefulDescriptor];
      os_log_t v92 = [(SUSUISoftwareUpdateController *)v124 manager];
      os_log_type_t v91 = [(SUSettingsStatefulUIManager *)v92 currentDownload];
      os_log_t v90 = [(SUDownload *)v91 descriptor];
      id v89 = (id)[(SUDescriptor *)v90 humanReadableUpdateName];
      id v79 = v89;
      id v118 = v79;
      id v88 = [(SUSUISoftwareUpdateController *)v124 manager];
      char v87 = [(SUSettingsStatefulUIManager *)v88 currentDownload];
      id v86 = [(SUSUISoftwareUpdateController *)v124 manager];
      BOOL v4 = [(SUSettingsStatefulUIManager *)v86 isTargetedUpdateScheduledForAutoInstall];
      objc_super v5 = "YES";
      if (!v4) {
        objc_super v5 = "NO";
      }
      __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v128, (uint64_t)"-[SUSUISoftwareUpdateController(UI) selectSpecifier:]", (uint64_t)v80, (uint64_t)v81, (uint64_t)v82, v83, (uint64_t)v96, (uint64_t)v95, (uint64_t)v94, (uint64_t)v93, (uint64_t)v79, (uint64_t)v87, (uint64_t)v5);
      _os_log_impl(&dword_228401000, log, v85, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nSelected specifier is nil, return", v128, 0x7Au);

      objc_storeStrong(&v118, 0);
      objc_storeStrong((id *)&v119, 0);
      objc_storeStrong((id *)&v120, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    uint64_t v125 = 0;
    int v117 = 1;
  }
  objc_storeStrong(location, 0);
  id v13 = v125;
  return v13;
}

- (void)openStorage
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v33 = self;
  v32[1] = (id)a2;
  v32[0] = _SUSUILoggingFacility();
  os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v32[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v32[0];
    os_log_type_t type = v31;
    char v2 = (objc_class *)objc_opt_class();
    id v26 = NSStringFromClass(v2);
    id v9 = v26;
    char v30 = v9;
    id v25 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v33 currentUIState]);
    BOOL v10 = v25;
    id v29 = v10;
    uint64_t v11 = [(SUSUISoftwareUpdateController *)v33 currentUIState];
    id v24 = [(SUSUISoftwareUpdateController *)v33 presentingStatefulDescriptor];
    id v23 = [(SUSUISoftwareUpdateController *)v33 presentingStatefulDescriptor];
    id v22 = [(SUSUISoftwareUpdateController *)v33 presentingAlternateStatefulDescriptor];
    id v21 = [(SUSUISoftwareUpdateController *)v33 presentingAlternateStatefulDescriptor];
    id v20 = [(SUSUISoftwareUpdateController *)v33 manager];
    id v19 = [(SUSettingsStatefulUIManager *)v20 currentDownload];
    char v18 = [(SUDownload *)v19 descriptor];
    id v17 = (id)[(SUDescriptor *)v18 humanReadableUpdateName];
    id v8 = v17;
    id v28 = v8;
    id v16 = [(SUSUISoftwareUpdateController *)v33 manager];
    id v15 = [(SUSettingsStatefulUIManager *)v16 currentDownload];
    id v14 = [(SUSUISoftwareUpdateController *)v33 manager];
    BOOL v3 = [(SUSettingsStatefulUIManager *)v14 isTargetedUpdateScheduledForAutoInstall];
    BOOL v4 = "YES";
    if (!v3) {
      BOOL v4 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v34, (uint64_t)"-[SUSUISoftwareUpdateController(UI) openStorage]", (uint64_t)v9, (uint64_t)v33, (uint64_t)v10, v11, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v8, (uint64_t)v15, (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v34, 0x7Au);

    objc_storeStrong(&v28, 0);
    objc_storeStrong((id *)&v29, 0);
    objc_storeStrong((id *)&v30, 0);
  }
  objc_storeStrong(v32, 0);
  objc_super v5 = v33;
  id v6 = [(SUSUISoftwareUpdateController *)v33 analyticsOpenStorageTappedString];
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  id v27 = (id)[NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/STORAGE_MGMT"];
  id v7 = (id)[MEMORY[0x263F01880] defaultWorkspace];
  [v7 openSensitiveURL:v27 withOptions:0];

  objc_storeStrong(&v27, 0);
}

- (void)downloadOnly:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateController *)v4 beginUpdateDownloadOnlyOperation];
  objc_storeStrong(location, 0);
}

- (void)downloadAndInstall:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateController *)v4 beginUpdateNowOperation];
  objc_storeStrong(location, 0);
}

- (void)downloadAndInstallTonight:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateController *)v4 beginUpdateTonightOperation];
  objc_storeStrong(location, 0);
}

- (void)installTonight:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateController *)v4 beginInstallTonightOperation];
  objc_storeStrong(location, 0);
}

- (void)install:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = v6;
  id v4 = [(SUSUISoftwareUpdateController *)v6 installNowTappedString];
  -[SUSUISoftwareUpdateController recordAnalyticsEvent:](v3, "recordAnalyticsEvent:");

  [(SUSUISoftwareUpdateController *)v6 beginInstallOperation];
  objc_storeStrong(location, 0);
}

- (void)requestToPromoteTargetedUpdateToUserInitiatedStatus:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateController *)v4 promoteTargetedUpdateToUserInitiatedStatus];
  objc_storeStrong(location, 0);
}

- (void)autoInstallCancel:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateController *)v4 unscheduleTargetedUpdateAutomaticInstallation];
  objc_storeStrong(location, 0);
}

- (void)detailedReleaseNotesDonePressed:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  char v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = _SUSUILoggingFacility();
  os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v30;
    os_log_type_t type = v29;
    BOOL v3 = (objc_class *)objc_opt_class();
    id v25 = NSStringFromClass(v3);
    id v7 = v25;
    id v28 = v7;
    id v8 = v32;
    id v24 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v32 currentUIState]);
    id v9 = v24;
    id v27 = v9;
    uint64_t v10 = [(SUSUISoftwareUpdateController *)v32 currentUIState];
    id v23 = [(SUSUISoftwareUpdateController *)v32 presentingStatefulDescriptor];
    id v22 = [(SUSUISoftwareUpdateController *)v32 presentingStatefulDescriptor];
    id v21 = [(SUSUISoftwareUpdateController *)v32 presentingAlternateStatefulDescriptor];
    id v20 = [(SUSUISoftwareUpdateController *)v32 presentingAlternateStatefulDescriptor];
    id v19 = [(SUSUISoftwareUpdateController *)v32 manager];
    char v18 = [(SUSettingsStatefulUIManager *)v19 currentDownload];
    id v17 = [(SUDownload *)v18 descriptor];
    id v16 = (id)[(SUDescriptor *)v17 humanReadableUpdateName];
    id v6 = v16;
    id v26 = v6;
    id v15 = [(SUSUISoftwareUpdateController *)v32 manager];
    id v14 = [(SUSettingsStatefulUIManager *)v15 currentDownload];
    id v13 = [(SUSUISoftwareUpdateController *)v32 manager];
    BOOL v4 = [(SUSettingsStatefulUIManager *)v13 isTargetedUpdateScheduledForAutoInstall];
    objc_super v5 = "YES";
    if (!v4) {
      objc_super v5 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v33, (uint64_t)"-[SUSUISoftwareUpdateController(UI) detailedReleaseNotesDonePressed:]", (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, v10, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v6, (uint64_t)v14, (uint64_t)v5);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v33, 0x7Au);

    objc_storeStrong(&v26, 0);
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong((id *)&v28, 0);
  }
  objc_storeStrong(&v30, 0);
  [(SUSUISoftwareUpdateController *)v32 dismissViewControllerAnimated:1 completion:0];
  objc_storeStrong(location, 0);
}

- (void)performUpdateRescan:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v41 = _SUSUILoggingFacility();
  os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v41;
    os_log_type_t type = v40;
    BOOL v3 = (objc_class *)objc_opt_class();
    id v33 = NSStringFromClass(v3);
    id v15 = v33;
    uint64_t v39 = v15;
    id v16 = v43;
    char v32 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v43 currentUIState]);
    id v17 = v32;
    id v38 = v17;
    uint64_t v18 = [(SUSUISoftwareUpdateController *)v43 currentUIState];
    id v31 = [(SUSUISoftwareUpdateController *)v43 presentingStatefulDescriptor];
    id v30 = [(SUSUISoftwareUpdateController *)v43 presentingStatefulDescriptor];
    id v29 = [(SUSUISoftwareUpdateController *)v43 presentingAlternateStatefulDescriptor];
    id v28 = [(SUSUISoftwareUpdateController *)v43 presentingAlternateStatefulDescriptor];
    id v27 = [(SUSUISoftwareUpdateController *)v43 manager];
    id v26 = [(SUSettingsStatefulUIManager *)v27 currentDownload];
    id v25 = [(SUDownload *)v26 descriptor];
    id v24 = (id)[(SUDescriptor *)v25 humanReadableUpdateName];
    id v14 = v24;
    id v37 = v14;
    id v23 = [(SUSUISoftwareUpdateController *)v43 manager];
    id v22 = [(SUSettingsStatefulUIManager *)v23 currentDownload];
    id v21 = [(SUSUISoftwareUpdateController *)v43 manager];
    BOOL v4 = [(SUSettingsStatefulUIManager *)v21 isTargetedUpdateScheduledForAutoInstall];
    objc_super v5 = "YES";
    if (!v4) {
      objc_super v5 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v44, (uint64_t)"-[SUSUISoftwareUpdateController(UI) performUpdateRescan:]", (uint64_t)v15, (uint64_t)v16, (uint64_t)v17, v18, (uint64_t)v31, (uint64_t)v30, (uint64_t)v29, (uint64_t)v28, (uint64_t)v14, (uint64_t)v22, (uint64_t)v5);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v44, 0x7Au);

    objc_storeStrong(&v37, 0);
    objc_storeStrong((id *)&v38, 0);
    objc_storeStrong((id *)&v39, 0);
  }
  objc_storeStrong(&v41, 0);
  if ([(SUSUISoftwareUpdateController *)v43 supportsPullToRefresh])
  {
    [location[0] beginRefreshing];
    id v7 = location[0];
    id v6 = objc_alloc(MEMORY[0x263F086A0]);
    id v10 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = (id)[v10 localizedStringForKey:@"CHECKING_FOR_UPDATES" value:&stru_26DCD7690 table:@"Software Update"];
    id v8 = (id)objc_msgSend(v6, "initWithString:");
    objc_msgSend(v7, "setAttributedTitle:");

    [(SUSUISoftwareUpdateController *)v43 refreshPane];
    uint64_t v11 = [(SUSUISoftwareUpdateController *)v43 manager];
    [(SUSettingsStatefulUIManager *)v11 checkForUpdatesInBackground];
  }
  else
  {
    id v36 = _SUSUILoggingFacility();
    char v35 = 16;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
    {
      id v12 = v36;
      os_log_type_t v13 = v35;
      __os_log_helper_16_0_0(v34);
      _os_log_error_impl(&dword_228401000, v12, v13, "Could not perform a pull to refresh as it was disabled by the class instance.", v34, 2u);
    }
    objc_storeStrong(&v36, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)autoInstallCancelPrompt:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v44 = _SUSUILoggingFacility();
  os_log_type_t v43 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v44;
    os_log_type_t type = v43;
    BOOL v3 = (objc_class *)objc_opt_class();
    id v37 = NSStringFromClass(v3);
    id v19 = v37;
    id v42 = v19;
    id v20 = v46;
    id v36 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v46 currentUIState]);
    id v21 = v36;
    id v41 = v21;
    uint64_t v22 = [(SUSUISoftwareUpdateController *)v46 currentUIState];
    id v35 = [(SUSUISoftwareUpdateController *)v46 presentingStatefulDescriptor];
    id v34 = [(SUSUISoftwareUpdateController *)v46 presentingStatefulDescriptor];
    id v33 = [(SUSUISoftwareUpdateController *)v46 presentingAlternateStatefulDescriptor];
    id v32 = [(SUSUISoftwareUpdateController *)v46 presentingAlternateStatefulDescriptor];
    id v31 = [(SUSUISoftwareUpdateController *)v46 manager];
    id v30 = [(SUSettingsStatefulUIManager *)v31 currentDownload];
    id v29 = [(SUDownload *)v30 descriptor];
    id v28 = (id)[(SUDescriptor *)v29 humanReadableUpdateName];
    id v18 = v28;
    id v40 = v18;
    id v27 = [(SUSUISoftwareUpdateController *)v46 manager];
    id v26 = [(SUSettingsStatefulUIManager *)v27 currentDownload];
    id v25 = [(SUSUISoftwareUpdateController *)v46 manager];
    BOOL v4 = [(SUSettingsStatefulUIManager *)v25 isTargetedUpdateScheduledForAutoInstall];
    objc_super v5 = "YES";
    if (!v4) {
      objc_super v5 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v47, (uint64_t)"-[SUSUISoftwareUpdateController(UI) autoInstallCancelPrompt:]", (uint64_t)v19, (uint64_t)v20, (uint64_t)v21, v22, (uint64_t)v35, (uint64_t)v34, (uint64_t)v33, (uint64_t)v32, (uint64_t)v18, (uint64_t)v26, (uint64_t)v5);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v47, 0x7Au);

    objc_storeStrong(&v40, 0);
    objc_storeStrong((id *)&v41, 0);
    objc_storeStrong((id *)&v42, 0);
  }
  objc_storeStrong(&v44, 0);
  id v39 = (id)objc_msgSend(MEMORY[0x263F5FB40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
  id v38 = (id)[MEMORY[0x263EFF9A0] dictionary];
  id v6 = v38;
  id v8 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", @"AUTO_INSTALL_CONFIRM_CANCEL", &stru_26DCD7690);
  objc_msgSend(v6, "setObject:forKey:");

  id v9 = v38;
  id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = (id)[v11 localizedStringForKey:@"AUTO_INSTALL_CONFIRM_OK" value:&stru_26DCD7690 table:@"Software Update"];
  objc_msgSend(v9, "setObject:forKey:");

  id v12 = v38;
  id v14 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = (id)[v14 localizedStringForKey:@"AUTO_INSTALL_CONFIRM_PROMPT" value:&stru_26DCD7690 table:@"Software Update"];
  objc_msgSend(v12, "setObject:forKey:");

  id v15 = v38;
  id v17 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v16 = (id)[v17 localizedStringForKey:@"AUTO_INSTALL_CONFIRM_TITLE" value:&stru_26DCD7690 table:@"Software Update"];
  objc_msgSend(v15, "setObject:forKey:");

  [v39 setupWithDictionary:v38];
  [v39 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60000]];
  [v39 setConfirmationAction:sel_autoInstallCancel_];
  [v39 setTarget:v46];
  [(SUSUISoftwareUpdateController *)v46 presentConfimationSpecifier:v39];
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
}

- (void)presentConfimationSpecifier:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateController *)v4 showConfirmationViewForSpecifier:location[0]];
  objc_storeStrong(location, 0);
}

- (void)preferredContentSizeChanged:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = _SUSUILoggingFacility();
  os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v32;
    os_log_type_t type = v31;
    BOOL v3 = (objc_class *)objc_opt_class();
    id v27 = NSStringFromClass(v3);
    id v9 = v27;
    id v30 = v9;
    id v10 = v34;
    id v26 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v34 currentUIState]);
    id v11 = v26;
    id v29 = v11;
    uint64_t v12 = [(SUSUISoftwareUpdateController *)v34 currentUIState];
    id v25 = [(SUSUISoftwareUpdateController *)v34 presentingStatefulDescriptor];
    id v24 = [(SUSUISoftwareUpdateController *)v34 presentingStatefulDescriptor];
    id v23 = [(SUSUISoftwareUpdateController *)v34 presentingAlternateStatefulDescriptor];
    id v22 = [(SUSUISoftwareUpdateController *)v34 presentingAlternateStatefulDescriptor];
    id v21 = [(SUSUISoftwareUpdateController *)v34 manager];
    id v20 = [(SUSettingsStatefulUIManager *)v21 currentDownload];
    id v19 = [(SUDownload *)v20 descriptor];
    id v18 = (id)[(SUDescriptor *)v19 humanReadableUpdateName];
    id v8 = v18;
    id v28 = v8;
    id v17 = [(SUSUISoftwareUpdateController *)v34 manager];
    id v16 = [(SUSettingsStatefulUIManager *)v17 currentDownload];
    id v15 = [(SUSUISoftwareUpdateController *)v34 manager];
    BOOL v4 = [(SUSettingsStatefulUIManager *)v15 isTargetedUpdateScheduledForAutoInstall];
    objc_super v5 = "YES";
    if (!v4) {
      objc_super v5 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v35, (uint64_t)"-[SUSUISoftwareUpdateController(UI) preferredContentSizeChanged:]", (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, v12, (uint64_t)v25, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v8, (uint64_t)v16, (uint64_t)v5);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v35, 0x7Au);

    objc_storeStrong(&v28, 0);
    objc_storeStrong((id *)&v29, 0);
    objc_storeStrong((id *)&v30, 0);
  }
  objc_storeStrong(&v32, 0);
  [(SUSUISoftwareUpdateController *)v34 setTitleCell:0];
  [(SUSUISoftwareUpdateController *)v34 setUpdateOptionsCell:0];
  [(SUSUISoftwareUpdateController *)v34 setProactiveSuggestionCell:0];
  [(SUSUISoftwareUpdateController *)v34 reloadSpecifiers];
  id v6 = v34;
  id v7 = [(SUSUISoftwareUpdateController *)v34 paneTitle];
  -[SUSUISoftwareUpdateController setTitle:](v6, "setTitle:");

  [(SUSUISoftwareUpdateController *)v34 refreshPane];
  objc_storeStrong(location, 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  CGSize v36 = a3;
  id v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v33 = _SUSUILoggingFacility();
  os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v33;
    os_log_type_t type = v32;
    BOOL v4 = (objc_class *)objc_opt_class();
    id v28 = NSStringFromClass(v4);
    id v10 = v28;
    os_log_type_t v31 = v10;
    id v11 = v35;
    id v27 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v35 currentUIState]);
    uint64_t v12 = v27;
    id v30 = v12;
    uint64_t v13 = [(SUSUISoftwareUpdateController *)v35 currentUIState];
    id v26 = [(SUSUISoftwareUpdateController *)v35 presentingStatefulDescriptor];
    id v25 = [(SUSUISoftwareUpdateController *)v35 presentingStatefulDescriptor];
    id v24 = [(SUSUISoftwareUpdateController *)v35 presentingAlternateStatefulDescriptor];
    id v23 = [(SUSUISoftwareUpdateController *)v35 presentingAlternateStatefulDescriptor];
    id v22 = [(SUSUISoftwareUpdateController *)v35 manager];
    id v21 = [(SUSettingsStatefulUIManager *)v22 currentDownload];
    id v20 = [(SUDownload *)v21 descriptor];
    id v19 = (id)[(SUDescriptor *)v20 humanReadableUpdateName];
    id v9 = v19;
    id v29 = v9;
    id v18 = [(SUSUISoftwareUpdateController *)v35 manager];
    id v17 = [(SUSettingsStatefulUIManager *)v18 currentDownload];
    id v16 = [(SUSUISoftwareUpdateController *)v35 manager];
    BOOL v5 = [(SUSettingsStatefulUIManager *)v16 isTargetedUpdateScheduledForAutoInstall];
    id v6 = "NO";
    if (v5) {
      id v6 = "YES";
    }
    __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_0_8_0((uint64_t)v37, (uint64_t)"-[SUSUISoftwareUpdateController(UI) viewWillTransitionToSize:withTransitionCoordinator:]", (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v13, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v23, (uint64_t)v9, (uint64_t)v17, (uint64_t)v6, *(uint64_t *)&v36.width, *(uint64_t *)&v36.height);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nNew size: [%f, %f]", v37, 0x8Eu);

    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong((id *)&v31, 0);
  }
  objc_storeStrong(&v33, 0);
  [(SUSUISoftwareUpdateController *)v35 reloadSpecifiers];
  id v7 = v35;
  id v8 = [(SUSUISoftwareUpdateController *)v35 paneTitle];
  -[SUSUISoftwareUpdateController setTitle:](v7, "setTitle:");

  [(SUSUISoftwareUpdateController *)v35 refreshPane];
  objc_storeStrong(location, 0);
}

- (void)preferences:(id)a3 didChangePreference:(id)a4 toValue:(id)a5
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  [(SUSUISoftwareUpdateController *)v10 refreshPane];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)showAlsoAvailaibleSUPane
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v38 = self;
  v37[1] = (id)a2;
  v37[0] = _SUSUILoggingFacility();
  os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v37[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v37[0];
    os_log_type_t type = v36;
    char v2 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v2);
    id v7 = v24;
    id v35 = v7;
    id v23 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v38 currentUIState]);
    id v8 = v23;
    id v34 = v8;
    uint64_t v9 = [(SUSUISoftwareUpdateController *)v38 currentUIState];
    id v22 = [(SUSUISoftwareUpdateController *)v38 presentingStatefulDescriptor];
    id v21 = [(SUSUISoftwareUpdateController *)v38 presentingStatefulDescriptor];
    id v20 = [(SUSUISoftwareUpdateController *)v38 presentingAlternateStatefulDescriptor];
    id v19 = [(SUSUISoftwareUpdateController *)v38 presentingAlternateStatefulDescriptor];
    id v18 = [(SUSUISoftwareUpdateController *)v38 manager];
    id v17 = [(SUSettingsStatefulUIManager *)v18 currentDownload];
    id v16 = [(SUDownload *)v17 descriptor];
    id v15 = (id)[(SUDescriptor *)v16 humanReadableUpdateName];
    id v6 = v15;
    id v33 = v6;
    id v14 = [(SUSUISoftwareUpdateController *)v38 manager];
    uint64_t v13 = [(SUSettingsStatefulUIManager *)v14 currentDownload];
    uint64_t v12 = [(SUSUISoftwareUpdateController *)v38 manager];
    BOOL v3 = [(SUSettingsStatefulUIManager *)v12 isTargetedUpdateScheduledForAutoInstall];
    BOOL v4 = "YES";
    if (!v3) {
      BOOL v4 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v39, (uint64_t)"-[SUSUISoftwareUpdateController(UI) showAlsoAvailaibleSUPane]", (uint64_t)v7, (uint64_t)v38, (uint64_t)v8, v9, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v19, (uint64_t)v6, (uint64_t)v13, (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v39, 0x7Au);

    objc_storeStrong(&v33, 0);
    objc_storeStrong((id *)&v34, 0);
    objc_storeStrong((id *)&v35, 0);
  }
  objc_storeStrong(v37, 0);
  objc_initWeak(&v32, v38);
  queue = MEMORY[0x263EF83A0];
  uint64_t v25 = MEMORY[0x263EF8330];
  int v26 = -1073741824;
  int v27 = 0;
  id v28 = __61__SUSUISoftwareUpdateController_UI__showAlsoAvailaibleSUPane__block_invoke;
  id v29 = &unk_26483FD28;
  objc_copyWeak(&v31, &v32);
  id v30 = v38;
  dispatch_async(queue, &v25);

  objc_storeStrong((id *)&v30, 0);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v32);
}

void __61__SUSUISoftwareUpdateController_UI__showAlsoAvailaibleSUPane__block_invoke(id *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v24[2] = a1;
  v24[1] = a1;
  v24[0] = objc_loadWeakRetained(a1 + 5);
  if (!v24[0]) {
    goto LABEL_24;
  }
  id v23 = (id)[v24[0] specifiers];
  memset(__b, 0, sizeof(__b));
  id obj = v23;
  uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    unint64_t v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v22 = *(id *)(__b[1] + 8 * v8);
      id v4 = (id)[v22 propertyForKey:*MEMORY[0x263F60138]];
      char v19 = 0;
      char v5 = 1;
      if (([v4 isEqualToString:@"SUNonPromotedUpdateButton"] & 1) == 0)
      {
        id v20 = (id)[v22 propertyForKey:*MEMORY[0x263F60138]];
        char v19 = 1;
        char v5 = [v20 isEqualToString:@"SUAlternateUpdateButton"];
      }
      if (v19) {

      }
      if (v5) {
        break;
      }
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
        if (!v9) {
          goto LABEL_18;
        }
      }
    }
    osos_log_t log = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog;
      os_log_type_t v2 = type;
      id v3 = (id)[v22 propertyForKey:*MEMORY[0x263F60138]];
      id v16 = v3;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v26, (uint64_t)"-[SUSUISoftwareUpdateController(UI) showAlsoAvailaibleSUPane]_block_invoke", (uint64_t)v16);
      _os_log_impl(&dword_228401000, log, v2, "%s: Located specifier %@ for alternate update button", v26, 0x16u);

      objc_storeStrong(&v16, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v15 = (id)[v24[0] selectSpecifier:v22];
    if (v15) {
      [a1[4] showController:v15 animate:1];
    }
    int v14 = 1;
    objc_storeStrong(&v15, 0);
  }
  else
  {
LABEL_18:
    int v14 = 0;
  }

  if (!v14)
  {
    os_log_t v13 = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v25, (uint64_t)"-[SUSUISoftwareUpdateController(UI) showAlsoAvailaibleSUPane]_block_invoke");
      _os_log_impl(&dword_228401000, v13, OS_LOG_TYPE_DEFAULT, "%s: Unable to locate 'Also Availaible' button specifier", v25, 0xCu);
    }
    objc_storeStrong((id *)&v13, 0);
    int v14 = 0;
  }
  objc_storeStrong(&v23, 0);
  if (!v14) {
LABEL_24:
  }
    int v14 = 0;
  objc_storeStrong(v24, 0);
}

- (void)registerForFontChanges
{
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:self selector:sel_preferredContentSizeChanged_ name:*MEMORY[0x263F83428] object:0];
}

- (void)registerForPreferencesChanges
{
  id v3 = [(SUSUISoftwareUpdateController *)self manager];
  id v2 = [(SUSettingsStatefulUIManager *)v3 preferences];
  [(SUSettingsSUPreferencesManager *)v2 addObserver:self];
}

- (void)performDeepLinkAction:(unint64_t)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v31 = self;
  SEL v30 = a2;
  unint64_t v29 = a3;
  if (a3 == 1)
  {
    [(SUSUISoftwareUpdateController *)v31 beginUpdateNowOperation];
  }
  else if (a3 == 2)
  {
    [(SUSUISoftwareUpdateController *)v31 beginUpdateTonightOperation];
  }
  else
  {
    id v28 = _SUSUILoggingFacility();
    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = v28;
      os_log_type_t type = v27;
      id v3 = (objc_class *)objc_opt_class();
      id v23 = NSStringFromClass(v3);
      uint64_t v6 = v23;
      int v26 = v6;
      id v22 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v31 currentUIState]);
      uint64_t v7 = v22;
      uint64_t v25 = v7;
      uint64_t v8 = [(SUSUISoftwareUpdateController *)v31 currentUIState];
      id v21 = [(SUSUISoftwareUpdateController *)v31 presentingStatefulDescriptor];
      id v20 = [(SUSUISoftwareUpdateController *)v31 presentingStatefulDescriptor];
      id v19 = [(SUSUISoftwareUpdateController *)v31 presentingAlternateStatefulDescriptor];
      id v18 = [(SUSUISoftwareUpdateController *)v31 presentingAlternateStatefulDescriptor];
      id v17 = [(SUSUISoftwareUpdateController *)v31 manager];
      id v16 = [(SUSettingsStatefulUIManager *)v17 currentDownload];
      id v15 = [(SUDownload *)v16 descriptor];
      id v14 = (id)[(SUDescriptor *)v15 humanReadableUpdateName];
      id v5 = v14;
      id v24 = v5;
      os_log_t v13 = [(SUSUISoftwareUpdateController *)v31 manager];
      uint64_t v12 = [(SUSettingsStatefulUIManager *)v13 currentDownload];
      uint64_t v11 = [(SUSUISoftwareUpdateController *)v31 manager];
      if ([(SUSettingsStatefulUIManager *)v11 isTargetedUpdateScheduledForAutoInstall])
      {
        id v4 = "YES";
      }
      else
      {
        id v4 = "NO";
      }
      __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_0((uint64_t)v32, (uint64_t)"-[SUSUISoftwareUpdateController(UI) performDeepLinkAction:]", (uint64_t)v6, (uint64_t)v31, (uint64_t)v7, v8, (uint64_t)v21, (uint64_t)v20, (uint64_t)v19, (uint64_t)v18, (uint64_t)v5, (uint64_t)v12, (uint64_t)v4, v29);
      _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nUnknown deep link update action %ld", v32, 0x84u);

      objc_storeStrong(&v24, 0);
      objc_storeStrong((id *)&v25, 0);
      objc_storeStrong((id *)&v26, 0);
    }
    objc_storeStrong(&v28, 0);
  }
}

- (void)waitForScanCompletionWithTimeout:(unint64_t)a3 currentAttempt:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v104 = self;
  SEL v103 = a2;
  os_log_t v102 = (void *)a3;
  id v101 = (void *)a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  if ((unint64_t)v101 >= 0xF0)
  {
    os_log_t v64 = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v63 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v64;
      os_log_type_t v15 = v63;
      uint64_t v6 = (objc_class *)objc_opt_class();
      id v28 = NSStringFromClass(v6);
      id v10 = v28;
      uint64_t v62 = v10;
      id v11 = v104;
      os_log_type_t v27 = SUSettingsUIStateToString([v104 currentUIState]);
      uint64_t v12 = v27;
      id v61 = v12;
      uint64_t v13 = [v104 currentUIState];
      id v26 = (id)[v104 presentingStatefulDescriptor];
      id v25 = (id)[v104 presentingStatefulDescriptor];
      id v24 = (id)[v104 presentingAlternateStatefulDescriptor];
      id v23 = (id)[v104 presentingAlternateStatefulDescriptor];
      id v22 = (id)[v104 manager];
      id v21 = (id)[v22 currentDownload];
      id v20 = (id)[v21 descriptor];
      id v19 = (id)[v20 humanReadableUpdateName];
      id v9 = v19;
      id v60 = v9;
      id v18 = (id)[v104 manager];
      id v17 = (id)[v18 currentDownload];
      id v16 = (id)[v104 manager];
      if ([v16 isTargetedUpdateScheduledForAutoInstall]) {
        uint64_t v7 = "YES";
      }
      else {
        uint64_t v7 = "NO";
      }
      __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_0((uint64_t)v105, (uint64_t)"-[SUSUISoftwareUpdateController(UI) waitForScanCompletionWithTimeout:currentAttempt:completionHandler:]", (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v13, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v23, (uint64_t)v9, (uint64_t)v17, (uint64_t)v7, (uint64_t)v102);
      _os_log_impl(&dword_228401000, v14, v15, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nReached the handleURL scan timeout %lu. Stopping.", v105, 0x84u);

      objc_storeStrong(&v60, 0);
      objc_storeStrong((id *)&v61, 0);
      objc_storeStrong((id *)&v62, 0);
    }
    objc_storeStrong((id *)&v64, 0);
    uint64_t v8 = MEMORY[0x263EF83A0];
    uint64_t v54 = MEMORY[0x263EF8330];
    int v55 = -1073741824;
    int v56 = 0;
    id v57 = __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke_423;
    uint64_t v58 = &unk_26483BAE0;
    id v59 = location;
    dispatch_async(v8, &v54);

    objc_storeStrong(&v59, 0);
    goto LABEL_30;
  }
  unint64_t v99 = [v104 currentUIState];
  if (v99 > 1 && v99 <= 3)
  {
    osos_log_t log = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog;
      os_log_type_t v52 = type;
      id v53 = SUSettingsUIStateToString(v99);
      id v96 = v53;
      __os_log_helper_16_2_3_8_32_8_66_8_0((uint64_t)v109, (uint64_t)"-[SUSUISoftwareUpdateController(UI) waitForScanCompletionWithTimeout:currentAttempt:completionHandler:]", (uint64_t)v96, v99);
      _os_log_impl(&dword_228401000, log, v52, "%s: Scan finished with no update found - state %{public}@ (%lu)", v109, 0x20u);

      objc_storeStrong((id *)&v96, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    queue = MEMORY[0x263EF83A0];
    uint64_t v90 = MEMORY[0x263EF8330];
    int v91 = -1073741824;
    int v92 = 0;
    id v93 = __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke;
    id v94 = &unk_26483BAE0;
    id v95 = location;
    dispatch_async(queue, &v90);

    int v89 = 1;
    objc_storeStrong(&v95, 0);
    goto LABEL_31;
  }
  if (v99 != 4)
  {
LABEL_19:
    os_log_t v74 = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v73 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v36 = v74;
      os_log_type_t v37 = v73;
      id v5 = "complete";
      if (v99 != 1) {
        id v5 = "begin";
      }
      uint64_t v31 = (uint64_t)v5;
      uint64_t v32 = (uint64_t)v101;
      uint64_t v33 = (uint64_t)v102;
      uint64_t v34 = v99;
      uint64_t v40 = SUSettingsUIStateToString(v99);
      id v35 = v40;
      id v72 = v35;
      id v39 = (id)[v104 presentingDescriptor];
      id v38 = (id)[v104 presentingAlternateDescriptor];
      __os_log_helper_16_2_8_8_32_8_34_8_0_8_0_8_0_8_66_8_0_8_0((uint64_t)v106, (uint64_t)"-[SUSUISoftwareUpdateController(UI) waitForScanCompletionWithTimeout:currentAttempt:completionHandler:]", v31, v32, v33, v34, (uint64_t)v35, (uint64_t)v39, (uint64_t)v38);
      _os_log_impl(&dword_228401000, v36, v37, "%s: waiting for scan to %{public}s (waited %ld seconds out of %ld) (current state: %ld (%{public}@), preferred update: %p, alternate update: %p)", v106, 0x52u);

      objc_storeStrong((id *)&v72, 0);
    }
    objc_storeStrong((id *)&v74, 0);
    dispatch_time_t when = dispatch_time(0, 1000000000);
    unint64_t v29 = *((void *)v104 + 176);
    uint64_t v65 = MEMORY[0x263EF8330];
    int v66 = -1073741824;
    int v67 = 0;
    id v68 = __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke_422;
    id v69 = &unk_26483FD50;
    id v70 = v104;
    v71[1] = v102;
    v71[2] = v101;
    v71[0] = location;
    dispatch_after(when, v29, &v65);
    objc_storeStrong(v71, 0);
    objc_storeStrong(&v70, 0);
LABEL_30:
    int v89 = 0;
    goto LABEL_31;
  }
  id v48 = (id)[v104 presentingDescriptor];
  char v87 = 0;
  BOOL v49 = 1;
  if (!v48)
  {
    id v88 = (id)[v104 presentingAlternateDescriptor];
    char v87 = 1;
    BOOL v49 = v88 != 0;
  }
  if (v87) {

  }
  if (!v49)
  {
    os_log_t v77 = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v76 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = v77;
      os_log_type_t v42 = v76;
      os_log_type_t v43 = SUSettingsUIStateToString(v99);
      id v75 = v43;
      __os_log_helper_16_2_3_8_32_8_66_8_0((uint64_t)v107, (uint64_t)"-[SUSUISoftwareUpdateController(UI) waitForScanCompletionWithTimeout:currentAttempt:completionHandler:]", (uint64_t)v75, v99);
      _os_log_impl(&dword_228401000, v41, v42, "%s: state is %{public}@ (%ld) and yet both the update descriptor and the alternate update descriptors are nil. Continues to wait.", v107, 0x20u);

      objc_storeStrong((id *)&v75, 0);
    }
    objc_storeStrong((id *)&v77, 0);
    goto LABEL_19;
  }
  os_log_t v86 = (os_log_t)_SUSUILoggingFacility();
  os_log_type_t v85 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v45 = v86;
    os_log_type_t v46 = v85;
    id v47 = SUSettingsUIStateToString(v99);
    os_log_t v84 = v47;
    __os_log_helper_16_2_3_8_32_8_66_8_0((uint64_t)v108, (uint64_t)"-[SUSUISoftwareUpdateController(UI) waitForScanCompletionWithTimeout:currentAttempt:completionHandler:]", (uint64_t)v84, v99);
    _os_log_impl(&dword_228401000, v45, v46, "%s: Scan finished with updates available - state %{public}@ (%lu)", v108, 0x20u);

    objc_storeStrong((id *)&v84, 0);
  }
  objc_storeStrong((id *)&v86, 0);
  id v44 = MEMORY[0x263EF83A0];
  uint64_t v78 = MEMORY[0x263EF8330];
  int v79 = -1073741824;
  int v80 = 0;
  char v81 = __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke_419;
  id v82 = &unk_26483BAE0;
  id v83 = location;
  dispatch_async(v44, &v78);

  int v89 = 1;
  objc_storeStrong(&v83, 0);
LABEL_31:
  objc_storeStrong(&location, 0);
}

uint64_t __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke_419(uint64_t result)
{
  if (*(void *)(result + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke_422(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "waitForScanCompletionWithTimeout:currentAttempt:completionHandler:", *(void *)(a1 + 48), *(void *)(a1 + 56) + 1, *(void *)(a1 + 40), a1, a1);
}

void __103__SUSUISoftwareUpdateController_UI__waitForScanCompletionWithTimeout_currentAttempt_completionHandler___block_invoke_423(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v1 = (void (**)(void))(*(void *)(a1 + 32) + 16);
    id v2 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78508] code:8 userInfo:0];
    (*v1)();
  }
}

- (void)beginUpdateNowOperation
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v41 = self;
  v40[1] = (id)a2;
  v40[0] = _SUSUILoggingFacility();
  os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v40[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v40[0];
    os_log_type_t type = v39;
    id v2 = (objc_class *)objc_opt_class();
    unint64_t v29 = NSStringFromClass(v2);
    uint64_t v12 = v29;
    id v38 = v12;
    id v28 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v41 currentUIState]);
    uint64_t v13 = v28;
    os_log_type_t v37 = v13;
    uint64_t v14 = [(SUSUISoftwareUpdateController *)v41 currentUIState];
    id v27 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
    id v26 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
    id v25 = [(SUSUISoftwareUpdateController *)v41 presentingAlternateStatefulDescriptor];
    id v24 = [(SUSUISoftwareUpdateController *)v41 presentingAlternateStatefulDescriptor];
    id v23 = [(SUSUISoftwareUpdateController *)v41 manager];
    id v22 = [(SUSettingsStatefulUIManager *)v23 currentDownload];
    id v21 = [(SUDownload *)v22 descriptor];
    id v20 = (id)[(SUDescriptor *)v21 humanReadableUpdateName];
    id v11 = v20;
    id v36 = v11;
    id v19 = [(SUSUISoftwareUpdateController *)v41 manager];
    id v18 = [(SUSettingsStatefulUIManager *)v19 currentDownload];
    id v17 = [(SUSUISoftwareUpdateController *)v41 manager];
    BOOL v3 = [(SUSettingsStatefulUIManager *)v17 isTargetedUpdateScheduledForAutoInstall];
    id v4 = "YES";
    if (!v3) {
      id v4 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v42, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginUpdateNowOperation]", (uint64_t)v12, (uint64_t)v41, (uint64_t)v13, v14, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v11, (uint64_t)v18, (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v42, 0x7Au);

    objc_storeStrong(&v36, 0);
    objc_storeStrong((id *)&v37, 0);
    objc_storeStrong((id *)&v38, 0);
  }
  objc_storeStrong(v40, 0);
  v41->_currentActivityStyle = 1;
  id v5 = v41;
  id v6 = [(SUSUISoftwareUpdateController *)v41 analyticsDownloadAndInstallNowTappedString];
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  [(SUSUISoftwareUpdateController *)v41 setBusyWithActivityStyle:v41->_currentActivityStyle];
  id v10 = [(SUSUISoftwareUpdateController *)v41 manager];
  id v9 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
  uint64_t v30 = MEMORY[0x263EF8330];
  int v31 = -1073741824;
  int v32 = 0;
  uint64_t v33 = __72__SUSUISoftwareUpdateController_SoftwareUpdate__beginUpdateNowOperation__block_invoke;
  uint64_t v34 = &unk_264842AC0;
  id v35 = v41;
  uint64_t v7 = v41;
  id v8 = MEMORY[0x263EF83A0];
  -[SUSettingsStatefulUIManager downloadAndInstall:completionHandler:operationDelegate:delegateCallbackQueue:](v10, "downloadAndInstall:completionHandler:operationDelegate:delegateCallbackQueue:", v9, &v30, v7);

  objc_storeStrong((id *)&v35, 0);
}

void __72__SUSUISoftwareUpdateController_SoftwareUpdate__beginUpdateNowOperation__block_invoke(id *a1, char a2, id obj, void *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  os_log_type_t v37 = a1;
  char v36 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  v33[1] = a1;
  *((void *)a1[4] + 177) = 0;
  [a1[4] setBusyWithActivityStyle:*((void *)a1[4] + 177)];
  v33[0] = _SUSUILoggingFacility();
  os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v33[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v33[0];
    os_log_type_t type = v32;
    id v4 = (objc_class *)objc_opt_class();
    id v26 = NSStringFromClass(v4);
    id v8 = v26;
    int v31 = v8;
    id v9 = a1[4];
    id v25 = SUSettingsUIStateToString([v9 currentUIState]);
    id v10 = v25;
    uint64_t v30 = v10;
    uint64_t v11 = [a1[4] currentUIState];
    id v24 = (id)[a1[4] presentingStatefulDescriptor];
    id v23 = (id)[a1[4] presentingStatefulDescriptor];
    id v22 = (id)[a1[4] presentingAlternateStatefulDescriptor];
    id v21 = (id)[a1[4] presentingAlternateStatefulDescriptor];
    id v20 = (id)[a1[4] manager];
    id v19 = (id)[v20 currentDownload];
    id v18 = (id)[v19 descriptor];
    id v17 = (id)[v18 humanReadableUpdateName];
    id v7 = v17;
    id v29 = v7;
    id v16 = (id)[a1[4] manager];
    id v15 = (id)[v16 currentDownload];
    id v14 = (id)[a1[4] manager];
    char v5 = [v14 isTargetedUpdateScheduledForAutoInstall];
    id v6 = "YES";
    if ((v5 & 1) == 0) {
      id v6 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v38, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginUpdateNowOperation]_block_invoke", (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, v11, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v7, (uint64_t)v15, (uint64_t)v6);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v38, 0x7Au);

    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong((id *)&v31, 0);
  }
  objc_storeStrong(v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&location, 0);
}

- (void)beginUpdateDownloadOnlyOperation
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v41 = self;
  v40[1] = (id)a2;
  v40[0] = _SUSUILoggingFacility();
  os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v40[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v40[0];
    os_log_type_t type = v39;
    id v2 = (objc_class *)objc_opt_class();
    id v29 = NSStringFromClass(v2);
    uint64_t v12 = v29;
    id v38 = v12;
    id v28 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v41 currentUIState]);
    uint64_t v13 = v28;
    os_log_type_t v37 = v13;
    uint64_t v14 = [(SUSUISoftwareUpdateController *)v41 currentUIState];
    id v27 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
    id v26 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
    id v25 = [(SUSUISoftwareUpdateController *)v41 presentingAlternateStatefulDescriptor];
    id v24 = [(SUSUISoftwareUpdateController *)v41 presentingAlternateStatefulDescriptor];
    id v23 = [(SUSUISoftwareUpdateController *)v41 manager];
    id v22 = [(SUSettingsStatefulUIManager *)v23 currentDownload];
    id v21 = [(SUDownload *)v22 descriptor];
    id v20 = (id)[(SUDescriptor *)v21 humanReadableUpdateName];
    id v11 = v20;
    id v36 = v11;
    id v19 = [(SUSUISoftwareUpdateController *)v41 manager];
    id v18 = [(SUSettingsStatefulUIManager *)v19 currentDownload];
    id v17 = [(SUSUISoftwareUpdateController *)v41 manager];
    BOOL v3 = [(SUSettingsStatefulUIManager *)v17 isTargetedUpdateScheduledForAutoInstall];
    id v4 = "YES";
    if (!v3) {
      id v4 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v42, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginUpdateDownloadOnlyOperation]", (uint64_t)v12, (uint64_t)v41, (uint64_t)v13, v14, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v11, (uint64_t)v18, (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v42, 0x7Au);

    objc_storeStrong(&v36, 0);
    objc_storeStrong((id *)&v37, 0);
    objc_storeStrong((id *)&v38, 0);
  }
  objc_storeStrong(v40, 0);
  v41->_currentActivityStyle = 2;
  char v5 = v41;
  id v6 = [(SUSUISoftwareUpdateController *)v41 analyticsDownloadOnlyTappedString];
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  [(SUSUISoftwareUpdateController *)v41 setBusyWithActivityStyle:v41->_currentActivityStyle];
  id v10 = [(SUSUISoftwareUpdateController *)v41 manager];
  id v9 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
  uint64_t v30 = MEMORY[0x263EF8330];
  int v31 = -1073741824;
  int v32 = 0;
  uint64_t v33 = __81__SUSUISoftwareUpdateController_SoftwareUpdate__beginUpdateDownloadOnlyOperation__block_invoke;
  id v34 = &unk_264842AC0;
  id v35 = v41;
  id v7 = v41;
  id v8 = MEMORY[0x263EF83A0];
  -[SUSettingsStatefulUIManager downloadUpdate:completionHandler:operationDelegate:delegateCallbackQueue:](v10, "downloadUpdate:completionHandler:operationDelegate:delegateCallbackQueue:", v9, &v30, v7);

  objc_storeStrong((id *)&v35, 0);
}

void __81__SUSUISoftwareUpdateController_SoftwareUpdate__beginUpdateDownloadOnlyOperation__block_invoke(id *a1, char a2, id obj, void *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  os_log_type_t v37 = a1;
  char v36 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  v33[1] = a1;
  *((void *)a1[4] + 177) = 0;
  [a1[4] setBusyWithActivityStyle:*((void *)a1[4] + 177)];
  v33[0] = _SUSUILoggingFacility();
  os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v33[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v33[0];
    os_log_type_t type = v32;
    id v4 = (objc_class *)objc_opt_class();
    id v26 = NSStringFromClass(v4);
    id v8 = v26;
    int v31 = v8;
    id v9 = a1[4];
    id v25 = SUSettingsUIStateToString([v9 currentUIState]);
    id v10 = v25;
    uint64_t v30 = v10;
    uint64_t v11 = [a1[4] currentUIState];
    id v24 = (id)[a1[4] presentingStatefulDescriptor];
    id v23 = (id)[a1[4] presentingStatefulDescriptor];
    id v22 = (id)[a1[4] presentingAlternateStatefulDescriptor];
    id v21 = (id)[a1[4] presentingAlternateStatefulDescriptor];
    id v20 = (id)[a1[4] manager];
    id v19 = (id)[v20 currentDownload];
    id v18 = (id)[v19 descriptor];
    id v17 = (id)[v18 humanReadableUpdateName];
    id v7 = v17;
    id v29 = v7;
    id v16 = (id)[a1[4] manager];
    id v15 = (id)[v16 currentDownload];
    id v14 = (id)[a1[4] manager];
    char v5 = [v14 isTargetedUpdateScheduledForAutoInstall];
    id v6 = "YES";
    if ((v5 & 1) == 0) {
      id v6 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v38, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginUpdateDownloadOnlyOperation]_block_invoke", (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, v11, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v7, (uint64_t)v15, (uint64_t)v6);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v38, 0x7Au);

    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong((id *)&v31, 0);
  }
  objc_storeStrong(v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&location, 0);
}

- (void)beginUpdateTonightOperation
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v41 = self;
  v40[1] = (id)a2;
  v40[0] = _SUSUILoggingFacility();
  os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v40[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v40[0];
    os_log_type_t type = v39;
    id v2 = (objc_class *)objc_opt_class();
    id v29 = NSStringFromClass(v2);
    uint64_t v12 = v29;
    id v38 = v12;
    id v28 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v41 currentUIState]);
    uint64_t v13 = v28;
    os_log_type_t v37 = v13;
    uint64_t v14 = [(SUSUISoftwareUpdateController *)v41 currentUIState];
    id v27 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
    id v26 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
    id v25 = [(SUSUISoftwareUpdateController *)v41 presentingAlternateStatefulDescriptor];
    id v24 = [(SUSUISoftwareUpdateController *)v41 presentingAlternateStatefulDescriptor];
    id v23 = [(SUSUISoftwareUpdateController *)v41 manager];
    id v22 = [(SUSettingsStatefulUIManager *)v23 currentDownload];
    id v21 = [(SUDownload *)v22 descriptor];
    id v20 = (id)[(SUDescriptor *)v21 humanReadableUpdateName];
    id v11 = v20;
    id v36 = v11;
    id v19 = [(SUSUISoftwareUpdateController *)v41 manager];
    id v18 = [(SUSettingsStatefulUIManager *)v19 currentDownload];
    id v17 = [(SUSUISoftwareUpdateController *)v41 manager];
    BOOL v3 = [(SUSettingsStatefulUIManager *)v17 isTargetedUpdateScheduledForAutoInstall];
    id v4 = "YES";
    if (!v3) {
      id v4 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v42, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginUpdateTonightOperation]", (uint64_t)v12, (uint64_t)v41, (uint64_t)v13, v14, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v11, (uint64_t)v18, (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v42, 0x7Au);

    objc_storeStrong(&v36, 0);
    objc_storeStrong((id *)&v37, 0);
    objc_storeStrong((id *)&v38, 0);
  }
  objc_storeStrong(v40, 0);
  v41->_currentActivityStyle = 2;
  char v5 = v41;
  id v6 = [(SUSUISoftwareUpdateController *)v41 analyticsDownloadAndInstallTonightTappedString];
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  [(SUSUISoftwareUpdateController *)v41 setBusyWithActivityStyle:v41->_currentActivityStyle];
  id v10 = [(SUSUISoftwareUpdateController *)v41 manager];
  id v9 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
  uint64_t v30 = MEMORY[0x263EF8330];
  int v31 = -1073741824;
  int v32 = 0;
  uint64_t v33 = __76__SUSUISoftwareUpdateController_SoftwareUpdate__beginUpdateTonightOperation__block_invoke;
  id v34 = &unk_264842AE8;
  id v35 = v41;
  id v7 = v41;
  id v8 = MEMORY[0x263EF83A0];
  -[SUSettingsStatefulUIManager downloadAndScheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:](v10, "downloadAndScheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:", v9, &v30, v7);

  objc_storeStrong((id *)&v35, 0);
}

void __76__SUSUISoftwareUpdateController_SoftwareUpdate__beginUpdateTonightOperation__block_invoke(id *a1, char a2, id obj, char a4, void *a5, void *a6)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v43 = a1;
  char v42 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  char v40 = a4 & 1;
  id v39 = 0;
  objc_storeStrong(&v39, a5);
  id v38 = 0;
  objc_storeStrong(&v38, a6);
  v37[1] = a1;
  *((void *)a1[4] + 177) = 0;
  [a1[4] setBusyWithActivityStyle:*((void *)a1[4] + 177)];
  v37[0] = _SUSUILoggingFacility();
  os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v37[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v37[0];
    os_log_type_t type = v36;
    id v6 = (objc_class *)objc_opt_class();
    id v28 = NSStringFromClass(v6);
    id v10 = v28;
    id v35 = v10;
    id v11 = a1[4];
    id v27 = SUSettingsUIStateToString([v11 currentUIState]);
    uint64_t v12 = v27;
    id v34 = v12;
    uint64_t v13 = [a1[4] currentUIState];
    id v26 = (id)[a1[4] presentingStatefulDescriptor];
    id v25 = (id)[a1[4] presentingStatefulDescriptor];
    id v24 = (id)[a1[4] presentingAlternateStatefulDescriptor];
    id v23 = (id)[a1[4] presentingAlternateStatefulDescriptor];
    id v22 = (id)[a1[4] manager];
    id v21 = (id)[v22 currentDownload];
    id v20 = (id)[v21 descriptor];
    id v19 = (id)[v20 humanReadableUpdateName];
    id v9 = v19;
    id v33 = v9;
    id v18 = (id)[a1[4] manager];
    id v17 = (id)[v18 currentDownload];
    id v16 = (id)[a1[4] manager];
    char v7 = [v16 isTargetedUpdateScheduledForAutoInstall];
    id v8 = "YES";
    if ((v7 & 1) == 0) {
      id v8 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v44, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginUpdateTonightOperation]_block_invoke", (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v13, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v23, (uint64_t)v9, (uint64_t)v17, (uint64_t)v8);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v44, 0x7Au);

    objc_storeStrong(&v33, 0);
    objc_storeStrong((id *)&v34, 0);
    objc_storeStrong((id *)&v35, 0);
  }
  objc_storeStrong(v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&location, 0);
}

- (void)beginInstallOperation
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v41 = self;
  v40[1] = (id)a2;
  v40[0] = _SUSUILoggingFacility();
  os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v40[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v40[0];
    os_log_type_t type = v39;
    id v2 = (objc_class *)objc_opt_class();
    id v29 = NSStringFromClass(v2);
    uint64_t v12 = v29;
    id v38 = v12;
    id v28 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v41 currentUIState]);
    uint64_t v13 = v28;
    os_log_type_t v37 = v13;
    uint64_t v14 = [(SUSUISoftwareUpdateController *)v41 currentUIState];
    id v27 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
    id v26 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
    id v25 = [(SUSUISoftwareUpdateController *)v41 presentingAlternateStatefulDescriptor];
    id v24 = [(SUSUISoftwareUpdateController *)v41 presentingAlternateStatefulDescriptor];
    id v23 = [(SUSUISoftwareUpdateController *)v41 manager];
    id v22 = [(SUSettingsStatefulUIManager *)v23 currentDownload];
    id v21 = [(SUDownload *)v22 descriptor];
    id v20 = (id)[(SUDescriptor *)v21 humanReadableUpdateName];
    id v11 = v20;
    id v36 = v11;
    id v19 = [(SUSUISoftwareUpdateController *)v41 manager];
    id v18 = [(SUSettingsStatefulUIManager *)v19 currentDownload];
    id v17 = [(SUSUISoftwareUpdateController *)v41 manager];
    BOOL v3 = [(SUSettingsStatefulUIManager *)v17 isTargetedUpdateScheduledForAutoInstall];
    id v4 = "YES";
    if (!v3) {
      id v4 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v42, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginInstallOperation]", (uint64_t)v12, (uint64_t)v41, (uint64_t)v13, v14, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v11, (uint64_t)v18, (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v42, 0x7Au);

    objc_storeStrong(&v36, 0);
    objc_storeStrong((id *)&v37, 0);
    objc_storeStrong((id *)&v38, 0);
  }
  objc_storeStrong(v40, 0);
  v41->_currentActivityStyle = 2;
  char v5 = v41;
  id v6 = [(SUSUISoftwareUpdateController *)v41 analyticsDownloadAndInstallTonightTappedString];
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  [(SUSUISoftwareUpdateController *)v41 setBusyWithActivityStyle:v41->_currentActivityStyle];
  id v10 = [(SUSUISoftwareUpdateController *)v41 manager];
  id v9 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
  uint64_t v30 = MEMORY[0x263EF8330];
  int v31 = -1073741824;
  int v32 = 0;
  id v33 = __70__SUSUISoftwareUpdateController_SoftwareUpdate__beginInstallOperation__block_invoke;
  id v34 = &unk_264840358;
  id v35 = v41;
  char v7 = v41;
  id v8 = MEMORY[0x263EF83A0];
  -[SUSettingsStatefulUIManager installUpdate:completionHandler:operationDelegate:delegateCallbackQueue:](v10, "installUpdate:completionHandler:operationDelegate:delegateCallbackQueue:", v9, &v30, v7);

  objc_storeStrong((id *)&v35, 0);
}

void __70__SUSUISoftwareUpdateController_SoftwareUpdate__beginInstallOperation__block_invoke(id *a1, char a2, id obj)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v34 = a1;
  char v33 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v31[1] = a1;
  *((void *)a1[4] + 177) = 0;
  [a1[4] setBusyWithActivityStyle:*((void *)a1[4] + 177)];
  v31[0] = _SUSUILoggingFacility();
  os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v31[0];
    os_log_type_t type = v30;
    BOOL v3 = (objc_class *)objc_opt_class();
    id v25 = NSStringFromClass(v3);
    char v7 = v25;
    id v29 = v7;
    id v8 = a1[4];
    id v24 = SUSettingsUIStateToString([v8 currentUIState]);
    id v9 = v24;
    id v28 = v9;
    uint64_t v10 = [a1[4] currentUIState];
    id v23 = (id)[a1[4] presentingStatefulDescriptor];
    id v22 = (id)[a1[4] presentingStatefulDescriptor];
    id v21 = (id)[a1[4] presentingAlternateStatefulDescriptor];
    id v20 = (id)[a1[4] presentingAlternateStatefulDescriptor];
    id v19 = (id)[a1[4] manager];
    id v18 = (id)[v19 currentDownload];
    id v17 = (id)[v18 descriptor];
    id v16 = (id)[v17 humanReadableUpdateName];
    id v6 = v16;
    id v27 = v6;
    id v15 = (id)[a1[4] manager];
    id v14 = (id)[v15 currentDownload];
    id v13 = (id)[a1[4] manager];
    char v4 = [v13 isTargetedUpdateScheduledForAutoInstall];
    char v5 = "YES";
    if ((v4 & 1) == 0) {
      char v5 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v35, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginInstallOperation]_block_invoke", (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, v10, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v6, (uint64_t)v14, (uint64_t)v5);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v35, 0x7Au);

    objc_storeStrong(&v27, 0);
    objc_storeStrong((id *)&v28, 0);
    objc_storeStrong((id *)&v29, 0);
  }
  objc_storeStrong(v31, 0);
  objc_storeStrong(&location, 0);
}

- (void)beginInstallTonightOperation
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v41 = self;
  v40[1] = (id)a2;
  v40[0] = _SUSUILoggingFacility();
  os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v40[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v40[0];
    os_log_type_t type = v39;
    id v2 = (objc_class *)objc_opt_class();
    id v29 = NSStringFromClass(v2);
    uint64_t v12 = v29;
    id v38 = v12;
    id v28 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v41 currentUIState]);
    id v13 = v28;
    os_log_type_t v37 = v13;
    uint64_t v14 = [(SUSUISoftwareUpdateController *)v41 currentUIState];
    id v27 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
    id v26 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
    id v25 = [(SUSUISoftwareUpdateController *)v41 presentingAlternateStatefulDescriptor];
    id v24 = [(SUSUISoftwareUpdateController *)v41 presentingAlternateStatefulDescriptor];
    id v23 = [(SUSUISoftwareUpdateController *)v41 manager];
    id v22 = [(SUSettingsStatefulUIManager *)v23 currentDownload];
    id v21 = [(SUDownload *)v22 descriptor];
    id v20 = (id)[(SUDescriptor *)v21 humanReadableUpdateName];
    id v11 = v20;
    id v36 = v11;
    id v19 = [(SUSUISoftwareUpdateController *)v41 manager];
    id v18 = [(SUSettingsStatefulUIManager *)v19 currentDownload];
    id v17 = [(SUSUISoftwareUpdateController *)v41 manager];
    BOOL v3 = [(SUSettingsStatefulUIManager *)v17 isTargetedUpdateScheduledForAutoInstall];
    char v4 = "YES";
    if (!v3) {
      char v4 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v42, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginInstallTonightOperation]", (uint64_t)v12, (uint64_t)v41, (uint64_t)v13, v14, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v11, (uint64_t)v18, (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v42, 0x7Au);

    objc_storeStrong(&v36, 0);
    objc_storeStrong((id *)&v37, 0);
    objc_storeStrong((id *)&v38, 0);
  }
  objc_storeStrong(v40, 0);
  v41->_currentActivityStyle = 2;
  char v5 = v41;
  id v6 = [(SUSUISoftwareUpdateController *)v41 analyticsDownloadAndInstallTonightTappedString];
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  [(SUSUISoftwareUpdateController *)v41 setBusyWithActivityStyle:v41->_currentActivityStyle];
  uint64_t v10 = [(SUSUISoftwareUpdateController *)v41 manager];
  id v9 = [(SUSUISoftwareUpdateController *)v41 presentingStatefulDescriptor];
  uint64_t v30 = MEMORY[0x263EF8330];
  int v31 = -1073741824;
  int v32 = 0;
  char v33 = __77__SUSUISoftwareUpdateController_SoftwareUpdate__beginInstallTonightOperation__block_invoke;
  id v34 = &unk_264842B10;
  id v35 = v41;
  char v7 = v41;
  id v8 = MEMORY[0x263EF83A0];
  -[SUSettingsStatefulUIManager scheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:](v10, "scheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:", v9, &v30, v7);

  objc_storeStrong((id *)&v35, 0);
}

void __77__SUSUISoftwareUpdateController_SoftwareUpdate__beginInstallTonightOperation__block_invoke(id *a1, char a2, id obj, void *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  os_log_type_t v37 = a1;
  char v36 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  v33[1] = a1;
  *((void *)a1[4] + 177) = 0;
  [a1[4] setBusyWithActivityStyle:*((void *)a1[4] + 177)];
  v33[0] = _SUSUILoggingFacility();
  os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v33[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v33[0];
    os_log_type_t type = v32;
    char v4 = (objc_class *)objc_opt_class();
    id v26 = NSStringFromClass(v4);
    id v8 = v26;
    int v31 = v8;
    id v9 = a1[4];
    id v25 = SUSettingsUIStateToString([v9 currentUIState]);
    uint64_t v10 = v25;
    uint64_t v30 = v10;
    uint64_t v11 = [a1[4] currentUIState];
    id v24 = (id)[a1[4] presentingStatefulDescriptor];
    id v23 = (id)[a1[4] presentingStatefulDescriptor];
    id v22 = (id)[a1[4] presentingAlternateStatefulDescriptor];
    id v21 = (id)[a1[4] presentingAlternateStatefulDescriptor];
    id v20 = (id)[a1[4] manager];
    id v19 = (id)[v20 currentDownload];
    id v18 = (id)[v19 descriptor];
    id v17 = (id)[v18 humanReadableUpdateName];
    id v7 = v17;
    id v29 = v7;
    id v16 = (id)[a1[4] manager];
    id v15 = (id)[v16 currentDownload];
    id v14 = (id)[a1[4] manager];
    char v5 = [v14 isTargetedUpdateScheduledForAutoInstall];
    id v6 = "YES";
    if ((v5 & 1) == 0) {
      id v6 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v38, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) beginInstallTonightOperation]_block_invoke", (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, v11, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v7, (uint64_t)v15, (uint64_t)v6);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v38, 0x7Au);

    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong((id *)&v31, 0);
  }
  objc_storeStrong(v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&location, 0);
}

- (void)beginInstallNowOperation
{
  id v3 = [(SUSUISoftwareUpdateController *)self installNowTappedString];
  -[SUSUISoftwareUpdateController recordAnalyticsEvent:](self, "recordAnalyticsEvent:");
}

- (void)promoteTargetedUpdateToUserInitiatedStatus
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  os_log_type_t v32 = self;
  v31[1] = (id)a2;
  v31[0] = _SUSUILoggingFacility();
  os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v31[0];
    os_log_type_t type = v30;
    id v2 = (objc_class *)objc_opt_class();
    id v26 = NSStringFromClass(v2);
    id v9 = v26;
    id v29 = v9;
    id v25 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v32 currentUIState]);
    uint64_t v10 = v25;
    id v28 = v10;
    uint64_t v11 = [(SUSUISoftwareUpdateController *)v32 currentUIState];
    id v24 = [(SUSUISoftwareUpdateController *)v32 presentingStatefulDescriptor];
    id v23 = [(SUSUISoftwareUpdateController *)v32 presentingStatefulDescriptor];
    id v22 = [(SUSUISoftwareUpdateController *)v32 presentingAlternateStatefulDescriptor];
    id v21 = [(SUSUISoftwareUpdateController *)v32 presentingAlternateStatefulDescriptor];
    id v20 = [(SUSUISoftwareUpdateController *)v32 manager];
    id v19 = [(SUSettingsStatefulUIManager *)v20 currentDownload];
    id v18 = [(SUDownload *)v19 descriptor];
    id v17 = (id)[(SUDescriptor *)v18 humanReadableUpdateName];
    id v8 = v17;
    id v27 = v8;
    id v16 = [(SUSUISoftwareUpdateController *)v32 manager];
    id v15 = [(SUSettingsStatefulUIManager *)v16 currentDownload];
    id v14 = [(SUSUISoftwareUpdateController *)v32 manager];
    BOOL v3 = [(SUSettingsStatefulUIManager *)v14 isTargetedUpdateScheduledForAutoInstall];
    char v4 = "YES";
    if (!v3) {
      char v4 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v33, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) promoteTargetedUpdateToUserInitiatedStatus]", (uint64_t)v9, (uint64_t)v32, (uint64_t)v10, v11, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v8, (uint64_t)v15, (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v33, 0x7Au);

    objc_storeStrong(&v27, 0);
    objc_storeStrong((id *)&v28, 0);
    objc_storeStrong((id *)&v29, 0);
  }
  objc_storeStrong(v31, 0);
  char v5 = v32;
  id v6 = [(SUSUISoftwareUpdateController *)v32 installLaterTappedString];
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  id v7 = [(SUSUISoftwareUpdateController *)v32 manager];
  [(SUSettingsStatefulUIManager *)v7 promoteTargetedUpdateToUserInitiatedStatus];
}

- (void)unscheduleTargetedUpdateAutomaticInstallation
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  os_log_type_t v32 = self;
  v31[1] = (id)a2;
  v31[0] = _SUSUILoggingFacility();
  os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = v31[0];
    os_log_type_t type = v30;
    id v2 = (objc_class *)objc_opt_class();
    id v26 = NSStringFromClass(v2);
    id v9 = v26;
    id v29 = v9;
    id v25 = SUSettingsUIStateToString([(SUSUISoftwareUpdateController *)v32 currentUIState]);
    uint64_t v10 = v25;
    id v28 = v10;
    uint64_t v11 = [(SUSUISoftwareUpdateController *)v32 currentUIState];
    id v24 = [(SUSUISoftwareUpdateController *)v32 presentingStatefulDescriptor];
    id v23 = [(SUSUISoftwareUpdateController *)v32 presentingStatefulDescriptor];
    id v22 = [(SUSUISoftwareUpdateController *)v32 presentingAlternateStatefulDescriptor];
    id v21 = [(SUSUISoftwareUpdateController *)v32 presentingAlternateStatefulDescriptor];
    id v20 = [(SUSUISoftwareUpdateController *)v32 manager];
    id v19 = [(SUSettingsStatefulUIManager *)v20 currentDownload];
    id v18 = [(SUDownload *)v19 descriptor];
    id v17 = (id)[(SUDescriptor *)v18 humanReadableUpdateName];
    id v8 = v17;
    id v27 = v8;
    id v16 = [(SUSUISoftwareUpdateController *)v32 manager];
    id v15 = [(SUSettingsStatefulUIManager *)v16 currentDownload];
    id v14 = [(SUSUISoftwareUpdateController *)v32 manager];
    BOOL v3 = [(SUSettingsStatefulUIManager *)v14 isTargetedUpdateScheduledForAutoInstall];
    char v4 = "YES";
    if (!v3) {
      char v4 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v33, (uint64_t)"-[SUSUISoftwareUpdateController(SoftwareUpdate) unscheduleTargetedUpdateAutomaticInstallation]", (uint64_t)v9, (uint64_t)v32, (uint64_t)v10, v11, (uint64_t)v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v8, (uint64_t)v15, (uint64_t)v4);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v33, 0x7Au);

    objc_storeStrong(&v27, 0);
    objc_storeStrong((id *)&v28, 0);
    objc_storeStrong((id *)&v29, 0);
  }
  objc_storeStrong(v31, 0);
  char v5 = v32;
  id v6 = [(SUSUISoftwareUpdateController *)v32 installLaterTappedString];
  -[SUSUISoftwareUpdateController submitAnalyticsEvent:](v5, "submitAnalyticsEvent:");

  id v7 = [(SUSUISoftwareUpdateController *)v32 manager];
  [(SUSettingsStatefulUIManager *)v7 unscheduleTargetedUpdateAutomaticInstallation];
}

- (BOOL)shouldShowComingSoonTip
{
  swift_getObjectType();
  BOOL v3 = self;
  SUSUISoftwareUpdateController.shouldShowComingSoonTip.getter();

  return sub_2284F7580() & 1;
}

- (void)setShouldShowComingSoonTip:(BOOL)a3
{
  swift_getObjectType();
  char v4 = self;
  sub_2284F7590();
  SUSUISoftwareUpdateController.shouldShowComingSoonTip.setter();
}

- (void)setupTipsObserver
{
  swift_getObjectType();
  BOOL v3 = self;
  SUSUISoftwareUpdateController.setupTipsObserver()();
}

@end