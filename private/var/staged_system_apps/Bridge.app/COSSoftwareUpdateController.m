@interface COSSoftwareUpdateController
- (BOOL)betaUpdatesChanged;
- (BOOL)didEnterDevicePasscode;
- (BOOL)downloadTermsAcceptedForInstallTonight;
- (BOOL)hasReceivedValidFirstScanResult;
- (BOOL)hasScannedSinceBeingForegrounded;
- (BOOL)hasUpdatedSuccessfully;
- (BOOL)isDisplayingRevLockBootProgressIndicator;
- (BOOL)isExpectingScanResult;
- (BOOL)isInSetupFlow;
- (BOOL)launchedForTerms;
- (BOOL)noUpdateFoundOrIsComplete;
- (BOOL)presentedModally;
- (BOOL)presentiPhoneMirrorErrorIfNecessary;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)shouldShowExtraRows:(int64_t)a3;
- (BOOL)shouldShowTableViewForState:(int64_t)a3;
- (BOOL)showingTermsRequestedByWatch;
- (BOOL)termsFromCloudDevice;
- (BOOL)unpairOnExit;
- (BOOL)userIsTryingToForceUpdate;
- (COSSoftwareUpdateController)init;
- (COSSoftwareUpdateTitleCell)titleCell;
- (Class)tableViewClass;
- (NRDevice)activeDevice;
- (NRTermsEvent)terms;
- (NSArray)betaPrograms;
- (NSDateComponentsFormatter)durationFormatter;
- (NSMutableArray)cloudDescriptors;
- (NSSManager)nssManager;
- (NSString)betaUpdatesAppleID;
- (NSUUID)termsDeviceID;
- (OS_dispatch_queue)seedingQueryQueue;
- (OS_dispatch_source)hidingProgressBarSource;
- (PSSpecifier)installButtonGroup;
- (PSSpecifier)installButtonSpecifier;
- (PSSpecifier)titleGroup;
- (SDBetaProgram)selectedBetaProgram;
- (SEL)termsAcceptanceAction;
- (SUBDescriptor)update;
- (SUBDescriptor)updateAgreedTo;
- (SUBDownload)download;
- (SUBManager)subManager;
- (UINavigationController)modalController;
- (UIViewController)termsDisplayController;
- (double)revLockBootProgressIndicatorElapsedDuration;
- (double)revLockBootProgressIndicatorTotalDuration;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_customViewForSpecifier:(id)a3 class:(Class)a4 isHeader:(BOOL)a5;
- (id)automaticUpdateStatusString;
- (id)availableBetaPrograms;
- (id)devicePasscodeCompletion;
- (id)enrolledBetaProgramString;
- (id)extractValueFromDict:(id)a3 key:(id)a4 expectedClass:(Class)a5;
- (id)internalMessageFromDenialInfo:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (id)specifiersForState:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)updateCompletionBlock;
- (int)scanRetries;
- (int64_t)alreadyPresentedTermsForRequestType;
- (int64_t)subState;
- (void)_manager:(id)a3 didChangeProgressOnDownload:(id)a4;
- (void)_manager:(id)a3 didFailDownload:(id)a4 withError:(id)a5;
- (void)_manager:(id)a3 didFailInstallation:(id)a4 withError:(id)a5;
- (void)_manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6;
- (void)_manager:(id)a3 didFinishInstallation:(id)a4;
- (void)_manager:(id)a3 installationOfUpdate:(id)a4 canProceed:(BOOL)a5;
- (void)_manager:(id)a3 scanRequestDidLocateUpdate:(id)a4 error:(id)a5;
- (void)_manager:(id)a3 willProceedWithInstallation:(id)a4;
- (void)_reallyInstall;
- (void)_setupTitleCell;
- (void)_termsAgree;
- (void)_termsDisagree;
- (void)cancelHidingProgressBarAfterDelay;
- (void)cancelUpdatePressed;
- (void)checkForUpdatedBuildVersionWithDevice:(id)a3;
- (void)dealloc;
- (void)detailedReleaseNotesDonePressed:(id)a3;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)devicePINControllerDidDismissPINPane:(id)a3;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didBecomeActive;
- (void)displayInstallButtonSpinner:(BOOL)a3 reloadSpecifier:(BOOL)a4;
- (void)displayRevLockBootProgressIndicatorIfNeeded;
- (void)displayRevLockBootProgressIndicatorWithElapsedDuration:(double)a3 totalDuration:(double)a4;
- (void)downloadAndInstall:(id)a3;
- (void)downloadTermsAccepted;
- (void)downloadTermsAcceptedForLegacyFlow;
- (void)enableNotifications;
- (void)enrollInBetaProgram:(id)a3 completion:(id)a4;
- (void)handleDownloadError:(id)a3;
- (void)handleInstallationError:(id)a3;
- (void)handleManagerState:(int64_t)a3 update:(id)a4 error:(id)a5;
- (void)handleManagerStateError:(id)a3;
- (void)handleScanError:(id)a3;
- (void)hideProgressBarAfterDelay;
- (void)install:(id)a3;
- (void)loadBetaUpdates;
- (void)loadBetaUpdatesWithCompletion:(id)a3;
- (void)loadView;
- (void)manager:(id)a3 didChangeProgressOnDownload:(id)a4;
- (void)manager:(id)a3 didFailDownload:(id)a4 withError:(id)a5;
- (void)manager:(id)a3 didFailInstallation:(id)a4 withError:(id)a5;
- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6;
- (void)manager:(id)a3 didFinishInstallation:(id)a4;
- (void)manager:(id)a3 installationOfUpdate:(id)a4 canProceed:(BOOL)a5;
- (void)manager:(id)a3 scanRequestDidLocateUpdate:(id)a4 error:(id)a5;
- (void)manager:(id)a3 userInstallRequestTypeDidChange:(int64_t)a4;
- (void)manager:(id)a3 willProceedWithInstallation:(id)a4;
- (void)managerUserDidAcceptTermsAndConditionsForUpdate:(id)a3;
- (void)presentAlertForDuetDenialCondition:(unint64_t)a3 denialReasons:(id)a4;
- (void)presentAlertForUpdatingCompanion;
- (void)presentAlertForiPhoneMirroring;
- (void)presentDuetAlertIfNecessary;
- (void)presentInSetupFlowForDevice:(id)a3 userForcedUpdate:(BOOL)a4 withController:(id)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)presentModalForDevice:(id)a3 userForcedUpdate:(BOOL)a4 withController:(id)a5 unpairOnExit:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)presentModalForDevice:(id)a3 userForcedUpdate:(BOOL)a4 withController:(id)a5 unpairOnExit:(BOOL)a6 launchedForTerms:(BOOL)a7 animated:(BOOL)a8 completion:(id)a9;
- (void)presentPasscodePromptIfNecessaryWithHandler:(id)a3;
- (void)presentPasscodePromptWithCompletionHandler:(id)a3;
- (void)presentTermsForInstallTonightIfNeeded;
- (void)presentTermsRequiringPasscode:(BOOL)a3 ifNecessaryWithAcceptanceAction:(SEL)a4;
- (void)presentTermsRequiringPasscode:(BOOL)a3 ifNecessaryWithAcceptanceAction:(SEL)a4 withDescriptor:(id)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)queryManagerState;
- (void)reportRequiredUpdateAbort;
- (void)resetInstallButtonEnabledStateAndReloadSpecifier:(BOOL)a3;
- (void)scanForUpdatesInBackgound:(BOOL)a3;
- (void)setActiveDevice:(id)a3;
- (void)setAlreadyPresentedTermsForRequestType:(int64_t)a3;
- (void)setBetaPrograms:(id)a3;
- (void)setBetaUpdatesChanged:(BOOL)a3;
- (void)setCloudDescriptors:(id)a3;
- (void)setDevicePasscodeCompletion:(id)a3;
- (void)setDidEnterDevicePasscode:(BOOL)a3;
- (void)setDownload:(id)a3;
- (void)setDurationFormatter:(id)a3;
- (void)setHasReceivedValidFirstScanResult:(BOOL)a3;
- (void)setHasScannedSinceBeingForegrounded:(BOOL)a3;
- (void)setHasUpdatedSuccessfully:(BOOL)a3;
- (void)setHidingProgressBarSource:(id)a3;
- (void)setInSetupFlow:(BOOL)a3;
- (void)setInstallButtonGroup:(id)a3;
- (void)setInstallButtonSpecifier:(id)a3;
- (void)setIsDisplayingRevLockBootProgressIndicator:(BOOL)a3;
- (void)setIsExpectingScanResult:(BOOL)a3;
- (void)setLaunchedForTerms:(BOOL)a3;
- (void)setModalController:(id)a3;
- (void)setNoUpdateFoundOrIsComplete:(BOOL)a3;
- (void)setNssManager:(id)a3;
- (void)setPresentedModally:(BOOL)a3;
- (void)setRevLockBootProgressIndicatorElapsedDuration:(double)a3;
- (void)setRevLockBootProgressIndicatorTotalDuration:(double)a3;
- (void)setScanRetries:(int)a3;
- (void)setSeedingQueryQueue:(id)a3;
- (void)setSelectedBetaProgram:(id)a3;
- (void)setShowingTermsRequestedByWatch:(BOOL)a3;
- (void)setSubManager:(id)a3;
- (void)setSubState:(int64_t)a3;
- (void)setTerms:(id)a3;
- (void)setTermsAcceptanceAction:(SEL)a3;
- (void)setTermsDeviceID:(id)a3;
- (void)setTermsDisplayController:(id)a3;
- (void)setTermsFromCloudDevice:(BOOL)a3;
- (void)setTitleCell:(id)a3;
- (void)setTitleGroup:(id)a3;
- (void)setUnpairOnExit:(BOOL)a3;
- (void)setUpdate:(id)a3;
- (void)setUpdateAgreedTo:(id)a3;
- (void)setUpdateCompletionBlock:(id)a3;
- (void)setUserIsTryingToForceUpdate:(BOOL)a3;
- (void)startSUBUpdates;
- (void)stopSUBUpdates;
- (void)transitionToState:(int64_t)a3;
- (void)unenrollFromBetaUpdatesWithCompletion:(id)a3;
- (void)unpairDevice;
- (void)updateTableViewWithTask:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willEnterForeground;
- (void)willResignActive;
@end

@implementation COSSoftwareUpdateController

- (COSSoftwareUpdateController)init
{
  v26.receiver = self;
  v26.super_class = (Class)COSSoftwareUpdateController;
  v2 = [(COSSoftwareUpdateController *)&v26 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Bridge.SeedingQueryQueue", v3);
    seedingQueryQueue = v2->_seedingQueryQueue;
    v2->_seedingQueryQueue = (OS_dispatch_queue *)v4;

    v6 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
    durationFormatter = v2->_durationFormatter;
    v2->_durationFormatter = v6;

    [(NSDateComponentsFormatter *)v2->_durationFormatter setUnitsStyle:3];
    [(NSDateComponentsFormatter *)v2->_durationFormatter setAllowedUnits:240];
    [(NSDateComponentsFormatter *)v2->_durationFormatter setMaximumUnitCount:1];
    [(NSDateComponentsFormatter *)v2->_durationFormatter setIncludesApproximationPhrase:1];
    [(NSDateComponentsFormatter *)v2->_durationFormatter setIncludesTimeRemainingPhrase:1];
    [(NSDateComponentsFormatter *)v2->_durationFormatter setFormattingContext:2];
    uint64_t v8 = +[PSSpecifier emptyGroupSpecifier];
    titleGroup = v2->_titleGroup;
    v2->_titleGroup = (PSSpecifier *)v8;

    uint64_t v10 = PSIDKey;
    [(PSSpecifier *)v2->_titleGroup setProperty:@"TITLE_GROUP" forKey:PSIDKey];
    uint64_t v11 = +[PSSpecifier emptyGroupSpecifier];
    installButtonGroup = v2->_installButtonGroup;
    v2->_installButtonGroup = (PSSpecifier *)v11;

    [(PSSpecifier *)v2->_installButtonGroup setProperty:@"INSTALL_BUTTON_GROUP" forKey:v10];
    v13 = v2->_installButtonGroup;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [(PSSpecifier *)v13 setProperty:v15 forKey:PSFooterCellClassGroupKey];

    v2->_subState = 0;
    v16 = +[NRPairedDeviceRegistry sharedInstance];
    v17 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
    v18 = [v16 getAllDevicesWithArchivedAltAccountDevicesMatching:v17];
    uint64_t v19 = [v18 firstObject];
    activeDevice = v2->_activeDevice;
    v2->_activeDevice = (NRDevice *)v19;

    v2->_termsAcceptanceAction = 0;
    uint64_t v21 = +[PSSpecifier preferenceSpecifierNamed:0 target:v2 set:0 get:0 detail:0 cell:13 edit:0];
    installButtonSpecifier = v2->_installButtonSpecifier;
    v2->_installButtonSpecifier = (PSSpecifier *)v21;

    v2->_scanRetries = 0;
    id v23 = [objc_alloc((Class)NSSManager) initWithQueue:&_dispatch_main_q];
    [(COSSoftwareUpdateController *)v2 setNssManager:v23];

    v24 = pbb_bridge_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v28 = v2;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "SoftwareUpdateController initialized (%p)", buf, 0xCu);
    }
  }
  return v2;
}

- (void)enableNotifications
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"willEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];

  dispatch_queue_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"didBecomeActive" name:UIApplicationDidBecomeActiveNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"willResignActive" name:UIApplicationWillResignActiveNotification object:0];
}

- (void)dealloc
{
  v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SoftwareUpdateController deallocating (%p)", buf, 0xCu);
  }

  hidingProgressBarSource = self->_hidingProgressBarSource;
  if (hidingProgressBarSource)
  {
    dispatch_source_cancel(hidingProgressBarSource);
    id v5 = self->_hidingProgressBarSource;
    self->_hidingProgressBarSource = 0;
  }
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  [(COSSoftwareUpdateController *)self stopSUBUpdates];
  v7.receiver = self;
  v7.super_class = (Class)COSSoftwareUpdateController;
  [(COSSoftwareUpdateController *)&v7 dealloc];
}

- (void)presentInSetupFlowForDevice:(id)a3 userForcedUpdate:(BOOL)a4 withController:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  BOOL v9 = a4;
  self->_inSetupFlow = 1;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  v15 = pbb_bridge_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Presenting Update pane in Setup flow", v16, 2u);
  }

  [(COSSoftwareUpdateController *)self presentModalForDevice:v14 userForcedUpdate:v9 withController:v13 unpairOnExit:v9 ^ 1 animated:v7 completion:v12];
}

- (void)presentModalForDevice:(id)a3 userForcedUpdate:(BOOL)a4 withController:(id)a5 unpairOnExit:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8
{
}

- (void)presentModalForDevice:(id)a3 userForcedUpdate:(BOOL)a4 withController:(id)a5 unpairOnExit:(BOOL)a6 launchedForTerms:(BOOL)a7 animated:(BOOL)a8 completion:(id)a9
{
  BOOL v11 = a6;
  id v16 = a3;
  id v17 = a5;
  id v18 = a9;
  uint64_t v19 = pbb_bridge_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Presenting Update pane modally.  Unpair on exit: %{BOOL}d", (uint8_t *)&buf, 8u);
  }

  self->_unpairOnExit = v11;
  self->_userIsTryingToForceUpdate = a4;
  self->_noUpdateFoundOrIsComplete = 0;
  objc_storeStrong((id *)&self->_activeDevice, a3);
  self->_presentedModally = 1;
  self->_launchedForTerms = a7;
  id v20 = objc_retainBlock(v18);
  id updateCompletionBlock = self->_updateCompletionBlock;
  self->_id updateCompletionBlock = v20;

  v22 = (SUBManager *)[objc_alloc((Class)SUBManager) initWithDelegate:self];
  subManager = self->_subManager;
  self->_subManager = v22;

  objc_initWeak(&buf, self);
  v24 = self->_subManager;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10011A260;
  v26[3] = &unk_100247990;
  objc_copyWeak(&v29, &buf);
  id v25 = v17;
  id v27 = v25;
  v28 = self;
  BOOL v30 = a4;
  BOOL v31 = a8;
  [(SUBManager *)v24 getCloudDescriptors:v26];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&buf);
}

- (void)displayRevLockBootProgressIndicatorWithElapsedDuration:(double)a3 totalDuration:(double)a4
{
  BOOL v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    double v9 = a3;
    __int16 v10 = 2048;
    double v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Displaying RevLock Boot progress indicator; Elapsed duration: (%f); Total duration: (%f)",
      (uint8_t *)&v8,
      0x16u);
  }

  self->_isDisplayingRevLockBootProgressIndicator = !self->_userIsTryingToForceUpdate;
  self->_revLockBootProgressIndicatorElapsedDuration = a3;
  self->_revLockBootProgressIndicatorTotalDuration = a4;
  [(COSSoftwareUpdateController *)self displayRevLockBootProgressIndicatorIfNeeded];
}

- (void)displayRevLockBootProgressIndicatorIfNeeded
{
  if (self->_isDisplayingRevLockBootProgressIndicator)
  {
    id v3 = *(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__table];
    dispatch_queue_t v4 = v3;
    if (v3)
    {
      v6 = v3;
      unsigned __int8 v5 = [v3 isDisplayingRevLockBootProgressIndicator];
      dispatch_queue_t v4 = v6;
      if ((v5 & 1) == 0)
      {
        [v6 displayRevLockBootProgressIndicatorWithElapsedDuration:self->_revLockBootProgressIndicatorElapsedDuration totalDuration:self->_revLockBootProgressIndicatorTotalDuration];
        dispatch_queue_t v4 = v6;
      }
    }
  }
}

- (void)unpairDevice
{
  id v3 = [(NRDevice *)self->_activeDevice valueForProperty:NRDevicePropertyIsPaired];
  unsigned int v4 = [v3 BOOLValue];

  unsigned int v5 = [UIApp isActivated];
  activeDevice = self->_activeDevice;
  int v7 = v4 | v5;
  int v8 = pbb_bridge_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (activeDevice) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (v9)
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User Reset Buddy!", v13, 2u);
    }

    [UIApp resetSetupFlowAnimated:0 forEvent:41];
    [UIApp dismissSetupFlowComplete:0 animated:1];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User Reset Buddy! - Unpairing", v13, 2u);
    }

    v14[0] = @"obliterate";
    v14[1] = @"BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2";
    v15[0] = &__kCFBooleanTrue;
    v15[1] = &__kCFBooleanTrue;
    double v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    id v12 = +[NRPairedDeviceRegistry sharedInstance];
    [v12 unpairWithDevice:self->_activeDevice withOptions:v11 operationHasBegun:&stru_1002479B0];
  }
}

- (void)cancelUpdatePressed
{
  BOOL v3 = !self->_unpairOnExit;
  unsigned int v4 = pbb_bridge_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v20 = objc_retainBlock(self->_updateCompletionBlock);
      *(_DWORD *)id buf = 138412290;
      id v26 = v20;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Done pushed, not killing pairing: %@", buf, 0xCu);
    }
    [(COSSoftwareUpdateController *)self stopSUBUpdates];
    [(COSSoftwareUpdateController *)self dismissViewControllerAnimated:1 completion:0];
    id updateCompletionBlock = (void (**)(id, uint64_t, SUBDescriptor *, void))self->_updateCompletionBlock;
    if (updateCompletionBlock) {
      updateCompletionBlock[2](updateCompletionBlock, 1, self->_update, 0);
    }
    modalController = self->_modalController;
    self->_modalController = 0;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User Backed Out during Update UI: Present Option to Reset Buddy", buf, 2u);
    }

    v6 = +[NSBundle mainBundle];
    int v7 = [v6 localizedStringForKey:@"EXIT_UPDATE_TITLE" value:&stru_100249230 table:@"Software Update"];
    int v8 = +[NSBundle mainBundle];
    BOOL v9 = [v8 localizedStringForKey:@"EXIT_UPDATE_BODY_%@" value:&stru_100249230 table:@"Software Update"];
    BOOL v10 = +[NSBundle mainBundle];
    double v11 = [v10 localizedStringForKey:@"APPLE_WATCH_ALL_STRING" value:&stru_100249230 table:@"Localizable"];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v11);
    modalController = +[UIAlertController alertControllerWithTitle:v7 message:v12 preferredStyle:1];

    id v14 = +[NSBundle mainBundle];
    v15 = [v14 localizedStringForKey:@"EXIT_UPDATE_EXIT_BUTTON" value:&stru_100249230 table:@"Software Update"];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10011AF14;
    v24[3] = &unk_100243AE0;
    v24[4] = self;
    id v16 = +[UIAlertAction actionWithTitle:v15 style:2 handler:v24];

    [modalController addAction:v16];
    objc_initWeak((id *)buf, self);
    id v17 = +[NSBundle mainBundle];
    id v18 = [v17 localizedStringForKey:@"EXIT_UPDATE_PBAutomationStringContinueButton" value:&stru_100249230 table:@"Software Update"];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10011AF50;
    v22[3] = &unk_1002479D8;
    objc_copyWeak(&v23, (id *)buf);
    v22[4] = self;
    uint64_t v19 = +[UIAlertAction actionWithTitle:v18 style:1 handler:v22];

    [modalController addAction:v19];
    [(COSSoftwareUpdateController *)self presentViewController:modalController animated:1 completion:0];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (void)startSUBUpdates
{
  if (!self->_subManager)
  {
    BOOL v3 = (SUBManager *)[objc_alloc((Class)SUBManager) initWithDelegate:self];
    subManager = self->_subManager;
    self->_subManager = v3;
  }
  uint64_t v5 = OBJC_IVAR___PSListController__table;
  v6 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__table];
  int v7 = sub_10011B210(self->_activeDevice, 0);
  [v6 setCurrentVersion:v7];

  int v8 = [*(id *)&self->BPSListController_opaque[v5] checkingStatusLabel];
  BOOL v9 = BPSDetailTextColor();
  [v8 setTextColor:v9];

  BOOL v10 = [*(id *)&self->BPSListController_opaque[v5] subtitleLabel];
  double v11 = BPSDetailTextColor();
  [v10 setTextColor:v11];

  id v12 = [*(id *)&self->BPSListController_opaque[v5] checkingForUpdateSpinner];
  [v12 setActivityIndicatorViewStyle:100];

  [(COSSoftwareUpdateController *)self transitionToState:0];
  id v13 = +[UIApplication sharedApplication];
  id v14 = [v13 applicationState];

  if (!v14)
  {
    objc_initWeak(&location, self);
    v15 = self->_subManager;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10011B4A4;
    v16[3] = &unk_100247A00;
    objc_copyWeak(&v17, &location);
    v16[4] = self;
    [(SUBManager *)v15 getCloudDescriptors:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)stopSUBUpdates
{
  BOOL v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    subManager = self->_subManager;
    *(_DWORD *)id buf = 136315394;
    BOOL v10 = "-[COSSoftwareUpdateController stopSUBUpdates]";
    __int16 v11 = 2112;
    id v12 = subManager;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s - %@", buf, 0x16u);
  }

  if (self->_subManager)
  {
    activeDevice = self->_activeDevice;
    uint64_t v8 = NRDevicePropertySystemBuildVersion;
    v6 = +[NSArray arrayWithObjects:&v8 count:1];
    [(NRDevice *)activeDevice removePropertyObserver:self forPropertyChanges:v6];

    [(SUBManager *)self->_subManager setDelegate:0];
    int v7 = self->_subManager;
    self->_subManager = 0;
  }
}

- (void)didBecomeActive
{
  BOOL v3 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  unsigned int v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 pairingID];
    v6 = [(NRDevice *)self->_activeDevice pairingID];
    int v13 = 136315650;
    id v14 = "-[COSSoftwareUpdateController didBecomeActive]";
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - CurrentActiveWatchID: %@ CachedActiveWatchID: %@", (uint8_t *)&v13, 0x20u);
  }
  if (v3
    && ([v3 pairingID],
        int v7 = objc_claimAutoreleasedReturnValue(),
        [(NRDevice *)self->_activeDevice pairingID],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v7 isEqual:v8],
        v8,
        v7,
        v9))
  {
    self->_alreadyPresentedTermsForRequestType = 0;
    [(COSSoftwareUpdateController *)self startSUBUpdates];
    [(COSSoftwareUpdateController *)self presentTermsForInstallTonightIfNeeded];
  }
  else
  {
    BOOL v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Devices changed, cleaning up COSSoftwareUpdateController", (uint8_t *)&v13, 2u);
    }

    [(COSSoftwareUpdateController *)self dismissViewControllerAnimated:1 completion:0];
    id updateCompletionBlock = (void (**)(id, uint64_t, SUBDescriptor *, void))self->_updateCompletionBlock;
    if (updateCompletionBlock) {
      updateCompletionBlock[2](updateCompletionBlock, 1, self->_update, 0);
    }
    modalController = self->_modalController;
    self->_modalController = 0;
  }
}

- (void)willResignActive
{
  self->_hasScannedSinceBeingForegrounded = 0;
}

- (void)checkForUpdatedBuildVersionWithDevice:(id)a3
{
  unsigned int v4 = [a3 valueForProperty:NRDevicePropertySystemBuildVersion];
  uint64_t v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(SUBDescriptor *)self->_update productBuildVersion];
    BOOL userIsTryingToForceUpdate = self->_userIsTryingToForceUpdate;
    BOOL noUpdateFoundOrIsComplete = self->_noUpdateFoundOrIsComplete;
    int v17 = 136316162;
    id v18 = "-[COSSoftwareUpdateController checkForUpdatedBuildVersionWithDevice:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    v22 = v4;
    __int16 v23 = 1024;
    BOOL v24 = userIsTryingToForceUpdate;
    __int16 v25 = 1024;
    BOOL v26 = noUpdateFoundOrIsComplete;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - Descripter build version: %@ Updated BuildVersion: %@ Forced Update: %{BOOL}d NoUpdateFoundOfIsComplete: %{BOOL}d", (uint8_t *)&v17, 0x2Cu);
  }
  unsigned int v9 = [(SUBDescriptor *)self->_update productBuildVersion];
  if ([v9 isEqualToString:v4])
  {

    goto LABEL_7;
  }
  if (!self->_userIsTryingToForceUpdate)
  {
LABEL_12:

    goto LABEL_13;
  }
  BOOL v10 = self->_noUpdateFoundOrIsComplete;

  if (v10)
  {
LABEL_7:
    update = self->_update;
    self->_update = 0;

    download = self->_download;
    self->_download = 0;

    self->_hasUpdatedSuccessfully = 1;
    self->_BOOL noUpdateFoundOrIsComplete = 1;
    int v13 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__table];
    id v14 = sub_10011B210(self->_activeDevice, 0);
    [v13 setCurrentVersion:v14];

    [(COSSoftwareUpdateController *)self transitionToState:1];
    id updateCompletionBlock = self->_updateCompletionBlock;
    if (updateCompletionBlock) {
      (*((void (**)(id, void, SUBDescriptor *, void))updateCompletionBlock + 2))(updateCompletionBlock, 0, self->_update, 0);
    }
    if (self->_modalController)
    {
      [(COSSoftwareUpdateController *)self stopSUBUpdates];
      modalController = self->_modalController;
      self->_modalController = 0;
    }
    unsigned int v9 = +[NSNotificationCenter defaultCenter];
    [v9 removeObserver:self];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)reportRequiredUpdateAbort
{
  v2 = [UIApp setupController];
  id v3 = [v2 pairingReportManager];

  [v3 addPairingTimeEventToPairingReportPlist:55 withValue:&__kCFBooleanTrue withError:0];
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = pbb_bridge_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218754;
    int v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "self: (%p); device: (%@); property: (%@); fromValue: (%@)",
      (uint8_t *)&v12,
      0x2Au);
  }

  if ([v9 isEqualToString:NRDevicePropertySystemBuildVersion]) {
    [(COSSoftwareUpdateController *)self checkForUpdatedBuildVersionWithDevice:v8];
  }
}

- (void)queryManagerState
{
  id v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Querying for current state", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  subManager = self->_subManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011C05C;
  v5[3] = &unk_100243C00;
  objc_copyWeak(&v6, buf);
  [(SUBManager *)subManager managerState:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)handleManagerState:(int64_t)a3 update:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = pbb_bridge_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = SUBStringForManagerState();
    int v23 = 134218754;
    BOOL v24 = self;
    __int16 v25 = 2112;
    BOOL v26 = v12;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "handleManagerState: self: (%p); subState: (%@); update: (%@); error: (%@)",
      (uint8_t *)&v23,
      0x2Au);
  }
  if ([v9 userInstallRequestType] != (id)2 && !self->_hasScannedSinceBeingForegrounded) {
    [(COSSoftwareUpdateController *)self scanForUpdatesInBackgound:1];
  }
  if (self->_hasUpdatedSuccessfully)
  {
    int v13 = pbb_bridge_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Ignoring callback as the update has succeeded", (uint8_t *)&v23, 2u);
    }

    goto LABEL_10;
  }
  if (v10)
  {
    if (self->_subManager) {
      [(COSSoftwareUpdateController *)self handleManagerStateError:v10];
    }
    goto LABEL_10;
  }
  if ((unint64_t)a3 > 7) {
    goto LABEL_26;
  }
  if (((1 << a3) & 0xCA) == 0)
  {
    if (a3 != 2) {
      goto LABEL_26;
    }
LABEL_23:
    if ([(SUBDescriptor *)self->_update isEqual:v9]) {
      goto LABEL_10;
    }
    update = self->_update;
    self->_update = 0;

    download = self->_download;
    self->_download = 0;

    __int16 v16 = self;
    uint64_t v17 = 2;
LABEL_25:
    [(COSSoftwareUpdateController *)v16 transitionToState:v17];
    goto LABEL_10;
  }
  sub_1000338A8(self->_activeDevice);
  if (a3 == 2) {
    goto LABEL_23;
  }
  if (a3 == 1)
  {
    __int16 v14 = self->_update;
    self->_update = 0;

    id v15 = self->_download;
    self->_download = 0;

    if (!self->_hasReceivedValidFirstScanResult)
    {
      [(COSSoftwareUpdateController *)self scanForUpdatesInBackgound:0];
      goto LABEL_10;
    }
    if (self->_userIsTryingToForceUpdate) {
      self->_BOOL noUpdateFoundOrIsComplete = 1;
    }
    __int16 v16 = self;
    uint64_t v17 = 1;
    goto LABEL_25;
  }
LABEL_26:
  p_update = &self->_update;
  if (self->_update && (objc_msgSend(v9, "isEqual:") & 1) == 0)
  {
    __int16 v21 = *p_update;
    *p_update = 0;

    v22 = self->_download;
    self->_download = 0;

    [(COSSoftwareUpdateController *)self transitionToState:0];
  }
  objc_storeStrong((id *)&self->_update, a4);
  [(COSSoftwareUpdateController *)self _setupTitleCell];
  [(COSSoftwareUpdateController *)self transitionToState:a3];
  [(COSSoftwareUpdateController *)self presentTermsForInstallTonightIfNeeded];
LABEL_10:
}

- (void)_setupTitleCell
{
  if (!self->_titleCell)
  {
    id v3 = pbb_bridge_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[OSVersionIcon]: Attempting to set up titleCell with OSVersion icon", v32, 2u);
    }

    update = self->_update;
    uint64_t v5 = pbb_bridge_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (update)
    {
      if (v6)
      {
        *(_WORD *)v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[OSVersionIcon]: Attempting to determine OSVersion icon from descriptor", v32, 2u);
      }

      int v7 = [(SUBDescriptor *)self->_update documentation];

      if (!v7)
      {
        uint64_t v5 = pbb_bridge_log();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) || !os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        *(_WORD *)v32 = 0;
        __int16 v16 = "[OSVersionIcon]: Could not extract icon from descriptor since no documentation asset found. Falling back t"
              "o legacy icon selection";
        goto LABEL_20;
      }
      id v8 = [(SUBDescriptor *)self->_update documentation];
      id v9 = [v8 preferencesIcon];

      uint64_t v5 = pbb_bridge_log();
      BOOL v10 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v10)
        {
          *(_WORD *)v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[OSVersionIcon]: Found OSVersion icon in descriptor", v32, 2u);
        }

        id v11 = objc_alloc((Class)UIImage);
        int v12 = [(SUBDescriptor *)self->_update documentation];
        int v13 = [v12 preferencesIcon];
        __int16 v14 = +[UIScreen mainScreen];
        [v14 scale];
        id v15 = [v11 initWithData:v13];

        if (v15) {
          goto LABEL_36;
        }
LABEL_22:
        uint64_t v17 = [(SUBDescriptor *)self->_update productVersion];
        NRRawVersionFromString();

        NRRawVersionFromString();
        NRRawVersionFromString();
        NRRawVersionFromString();
        NRRawVersionFromString();
        NRRawVersionFromString();
        NRRawVersionFromString();
        int IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();
        int v19 = NRVersionIsGreaterThanOrEqual();
        int v20 = NRVersionIsGreaterThanOrEqual();
        int v21 = NRVersionIsGreaterThanOrEqual();
        int v22 = NRVersionIsGreaterThanOrEqual();
        int v23 = NRVersionIsGreaterThanOrEqual();
        if (IsGreaterThanOrEqual && v19)
        {
          BOOL v24 = pbb_bridge_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[OSVersionIcon]: Legacy icon detection: Update is in range to show 9 version icon", v32, 2u);
          }
          CFStringRef v25 = @"WatchOS_GC_9";
        }
        else if ((v20 & v21) == 1)
        {
          BOOL v24 = pbb_bridge_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[OSVersionIcon]: Legacy icon detection: Update is in range to show 10 version icon", v32, 2u);
          }
          CFStringRef v25 = @"WatchOS_GC_10";
        }
        else
        {
          int v26 = v22 & v23;
          BOOL v24 = pbb_bridge_log();
          BOOL v27 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          if (v26 != 1)
          {
            if (v27)
            {
              *(_WORD *)v32 = 0;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[OSVersionIcon]: Legacy icon detection: Update is not in range to display any known version icons", v32, 2u);
            }

            goto LABEL_40;
          }
          if (v27)
          {
            *(_WORD *)v32 = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[OSVersionIcon]: Legacy icon detection: Update is in range to show 11 version icon", v32, 2u);
          }
          CFStringRef v25 = @"WatchOS_GC_11";
        }

        id v15 = +[UIImage imageNamed:v25];
        if (v15)
        {
LABEL_36:
          id v28 = [[COSSoftwareUpdateTitleCell alloc] initWithStyle:3 reuseIdentifier:0 specifier:0 device:self->_activeDevice image:v15];
          titleCell = self->_titleCell;
          self->_titleCell = v28;

LABEL_43:
          return;
        }
LABEL_40:
        id v30 = pbb_bridge_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[OSVersionIcon]: Legacy icon detection: No icon file found. Using default image for title cell", v32, 2u);
        }

        BOOL v31 = [[COSSoftwareUpdateTitleCell alloc] initWithStyle:3 reuseIdentifier:0 specifier:0 device:self->_activeDevice];
        id v15 = self->_titleCell;
        self->_titleCell = v31;
        goto LABEL_43;
      }
      if (v10)
      {
        *(_WORD *)v32 = 0;
        __int16 v16 = "[OSVersionIcon]: OSVersion icon not set in documentation. Falling back to legacy icon selection";
        goto LABEL_20;
      }
    }
    else if (v6)
    {
      *(_WORD *)v32 = 0;
      __int16 v16 = "[OSVersionIcon]: Could not extract icon from descriptor since no descriptor is present. Falling back to lega"
            "cy icon selection";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v16, v32, 2u);
    }
LABEL_21:

    goto LABEL_22;
  }
}

- (void)presentTermsForInstallTonightIfNeeded
{
  update = self->_update;
  if (update)
  {
    id alreadyPresentedTermsForRequestType = self->_alreadyPresentedTermsForRequestType;
    if (alreadyPresentedTermsForRequestType)
    {
      if (alreadyPresentedTermsForRequestType == [(SUBDescriptor *)update userInstallRequestType])return; {
      update = self->_update;
      }
    }
    if ((([(SUBDescriptor *)update displayTermsRequested] & 1) != 0
       || self->_launchedForTerms)
      && ([(SUBDescriptor *)self->_update userDidAcceptTermsAndConditions] & 1) == 0)
    {
      self->_id alreadyPresentedTermsForRequestType = (int64_t)[(SUBDescriptor *)self->_update userInstallRequestType];
      self->_showingTermsRequestedByWatch = 1;
      uint64_t v5 = pbb_bridge_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing terms as requested by Watch", v6, 2u);
      }

      objc_storeStrong((id *)&self->_updateAgreedTo, self->_update);
      [(COSSoftwareUpdateController *)self presentTermsRequiringPasscode:0 ifNecessaryWithAcceptanceAction:"downloadTermsAccepted"];
    }
  }
  else
  {
    self->_id alreadyPresentedTermsForRequestType = 0;
    if (self->_termsAcceptanceAction && self->_showingTermsRequestedByWatch)
    {
      self->_showingTermsRequestedByWatch = 0;
      self->_termsAcceptanceAction = 0;
      [(COSSoftwareUpdateController *)self resetInstallButtonEnabledStateAndReloadSpecifier:1];
      [(COSSoftwareUpdateController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (BOOL)shouldShowTableViewForState:(int64_t)a3
{
  return (unint64_t)a3 < 3;
}

- (id)specifiersForState:(int64_t)a3
{
  uint64_t v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 134217984;
    int64_t v43 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "State is: %ld", buf, 0xCu);
  }

  id v6 = objc_alloc_init((Class)NSMutableArray);
  if ([(COSSoftwareUpdateController *)self shouldShowExtraRows:a3])
  {
    int v7 = +[PSSpecifier emptyGroupSpecifier];
    [v7 setProperty:@"AUTOMATIC_WATCH_UPDATES_BUTTON_GROUP" forKey:PSIDKey];
    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"AUTOMATIC_UPDATES" value:&stru_100249230 table:@"Software Update"];
    BOOL v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:"automaticUpdateStatusString" detail:objc_opt_class() cell:2 edit:0];

    [v10 setIdentifier:@"AUTOMATIC_WATCH_UPDATES_BUTTON_SPECIFIER"];
    [v6 addObject:v10];
    id v11 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
    id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F364B0F1-4FC0-461A-8B5B-93CF7E2BC79F"];
    unsigned int v13 = [v11 supportsCapability:v12];

    if (v13)
    {
      betaPrograms = self->_betaPrograms;
      if (!betaPrograms || ![(NSArray *)betaPrograms count]) {
        goto LABEL_13;
      }
      id v15 = pbb_setup_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Beta programs exist for this device, dispalying beta update row", buf, 2u);
      }

      __int16 v16 = +[NSBundle mainBundle];
      uint64_t v17 = [v16 localizedStringForKey:@"BETA_UPDATES" value:&stru_100249230 table:@"Software Update"];
      __int16 v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:"enrolledBetaProgramString" detail:objc_opt_class() cell:2 edit:0];

      [v18 setIdentifier:@"BETA_WATCH_UPDATES_BUTTON_SPECIFIER"];
      [v6 addObject:v18];
    }
    else
    {
      __int16 v18 = pbb_setup_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Beta updates not supported on this watch, skipping", buf, 2u);
      }
    }

LABEL_13:
  }
  if (![(COSSoftwareUpdateController *)self shouldShowTableViewForState:a3])
  {
    [v6 addObject:self->_titleGroup];
    int v19 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
    uint64_t v41 = PSIDKey;
    [v19 setProperty:@"title" forKey:@"title"];
    [v19 setProperty:self->_titleCell forKey:PSTableCellKey];
    [(COSSoftwareUpdateTitleCell *)self->_titleCell setSpecifier:v19];
    [v6 addObject:v19];
    int v20 = [(SUBDescriptor *)self->_update documentation];
    int v21 = [v20 releaseNotesSummary];
    id v22 = [v21 length];

    if (v22)
    {
      int v23 = [(SUBDescriptor *)self->_update documentation];
      BOOL v24 = [v23 releaseNotesSummary];
    }
    else
    {
      BOOL v24 = 0;
    }
    CFStringRef v25 = [(SUBDescriptor *)self->_update documentation];
    int v26 = [v25 releaseNotes];
    id v27 = [v26 length];

    if (v27)
    {
      id v28 = [(SUBDescriptor *)self->_update documentation];
      __int16 v29 = [v28 releaseNotes];
    }
    else
    {
      __int16 v29 = 0;
    }
    [(COSSoftwareUpdateTitleCell *)self->_titleCell setReleaseNotesSummary:v24];
    if (v24)
    {
      id v30 = [(COSSoftwareUpdateTitleCell *)self->_titleCell releaseNotesSummaryView];
      BOOL v31 = [v30 webView];

      v32 = [v31 _browserView];
      v33 = BPSBridgeTintColor();
      v34 = [v33 styleString];
      v35 = +[NSString stringWithFormat:@"a:link {color: %@;}\n", v34];

      [v32 setUserStyleSheet:v35];
      id v36 = [v31 stringByEvaluatingJavaScriptFromString:@"document.body.style.color='#FFFFFF';"];
    }
    if (v29)
    {
      v37 = +[NSBundle bundleForClass:objc_opt_class()];
      v38 = [v37 localizedStringForKey:@"LEARN_MORE" value:&stru_100249230 table:@"Software Update"];
      v39 = +[PSSpecifier preferenceSpecifierNamed:v38 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

      [v39 setProperty:@"DETAILED_RELEASE_NOTES_LINK" forKey:v41];
      [v6 addObject:v39];
    }
    [v6 addObject:self->_installButtonGroup];
    [v6 addObject:self->_installButtonSpecifier];
  }

  return v6;
}

- (BOOL)shouldShowExtraRows:(int64_t)a3
{
  if (self->_inSetupFlow || self->_userIsTryingToForceUpdate) {
    return 0;
  }
  id v6 = [UIApp activeWatch];
  char HasCapabilityForString = BPSDeviceHasCapabilityForString();
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    BOOL v3 = HasCapabilityForString;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)automaticUpdateStatusString
{
  id v3 = objc_alloc((Class)NPSDomainAccessor);
  id v4 = [v3 initWithDomain:kBridgeDomain pairedDevice:self->_activeDevice];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 synchronize];
    unsigned __int8 v7 = sub_100033280();
    id v8 = +[NSBundle mainBundle];
    id v9 = v8;
    if (v7) {
      CFStringRef v10 = @"AUTOMATIC_UPDATES_ENABLED";
    }
    else {
      CFStringRef v10 = @"AUTOMATIC_UPDATES_DISABLED";
    }
  }
  else
  {
    id v8 = +[NSBundle mainBundle];
    id v9 = v8;
    CFStringRef v10 = @"AUTOMATIC_UPDATES_DISABLED";
  }
  id v11 = [v8 localizedStringForKey:v10 value:&stru_100249230 table:@"Software Update"];

  return v11;
}

- (void)transitionToState:(int64_t)a3
{
  if (self->_inSetupFlow && self->_userIsTryingToForceUpdate && self->_noUpdateFoundOrIsComplete)
  {
    uint64_t v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = +[NSNumber numberWithInteger:self->_subState];
      unsigned __int8 v7 = SUBStringForManagerState();
      id v8 = +[NSNumber numberWithInteger:a3];
      id v9 = SUBStringForManagerState();
      *(_DWORD *)id buf = 138413058;
      v93 = v6;
      __int16 v94 = 2112;
      v95 = v7;
      __int16 v96 = 2112;
      v97 = v8;
      __int16 v98 = 2112;
      v99 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_subState (%@/%@) -> subState (%@/%@)", buf, 0x2Au);
    }
    CFStringRef v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"COSSoftwareUpdateDidCompleteNotification" object:self userInfo:0];
  }
  if (!a3 || self->_subState != a3)
  {
    id v11 = pbb_bridge_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = SUBStringForManagerState();
      unsigned int v13 = SUBStringForManagerState();
      *(_DWORD *)id buf = 134218498;
      v93 = self;
      __int16 v94 = 2112;
      v95 = v12;
      __int16 v96 = 2112;
      v97 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "self: (%p); Transitioning from (%@) to (%@)",
        buf,
        0x20u);
    }
    int64_t subState = self->_subState;
    self->_int64_t subState = a3;
    betaPrograms = self->_betaPrograms;
    if (betaPrograms)
    {
      BOOL v15 = [(NSArray *)betaPrograms count] != 0;
      int64_t v16 = self->_subState;
    }
    else
    {
      BOOL v15 = 0;
      int64_t v16 = a3;
    }
    if (subState != v16 && -[COSSoftwareUpdateController shouldShowExtraRows:](self, "shouldShowExtraRows:") && !v15)
    {
      uint64_t v17 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
      id v18 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F364B0F1-4FC0-461A-8B5B-93CF7E2BC79F"];
      unsigned int v19 = [v17 supportsCapability:v18];

      if (v19)
      {
        int v20 = pbb_bridge_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "loading beta programs info on state update", buf, 2u);
        }

        [(COSSoftwareUpdateController *)self loadBetaUpdates];
      }
    }
    if (self->_update)
    {
      int v21 = [(COSSoftwareUpdateTitleCell *)self->_titleCell detailTextLabel];
      id v22 = [(SUBDescriptor *)self->_update publisher];
      [v21 setText:v22];

      int v23 = sub_10011B210(self->_activeDevice, self->_update);
      [(COSSoftwareUpdateTitleCell *)self->_titleCell setUpdateName:v23];
    }
    [(COSSoftwareUpdateTitleCell *)self->_titleCell setAnimatingGearView:self->_subState == 4];
    [(COSSoftwareUpdateTitleCell *)self->_titleCell setStatusMessage:0];
    if ([(SUBDescriptor *)self->_update userInstallRequestType] == (id)3
      || [(SUBDescriptor *)self->_update userInstallRequestType] == (id)2)
    {
      installButtonGroup = self->_installButtonGroup;
      CFStringRef v25 = +[NSBundle mainBundle];
      int v26 = [v25 localizedStringForKey:@"INSTALL_BUTTON_FOOTER_AUTO_UPDATE" value:&stru_100249230 table:@"Software Update"];
      uint64_t v27 = PSFooterTextGroupKey;
      [(PSSpecifier *)installButtonGroup setProperty:v26 forKey:PSFooterTextGroupKey];
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        id v28 = [(SUBDescriptor *)self->_update updatePowerPolicy];
        if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          __int16 v29 = [(COSSoftwareUpdateController *)self extractValueFromDict:v28 key:SUBErrorUserInfoChargerRequiredForApply expectedClass:objc_opt_class()];
          id v30 = v29;
          if (v29 && [v29 BOOLValue])
          {
            BOOL v31 = pbb_bridge_log();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)id buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Descriptor supports power policy and charger is required for apply. Using legacy string for install button footer", buf, 2u);
            }

            v32 = +[NSBundle mainBundle];
            v33 = SFLocalizableWAPIStringKeyForKey();
            v84 = [v32 localizedStringForKey:v33 value:&stru_100249230 table:@"Software Update"];
            CFStringRef v25 = +[NSString stringWithFormat:@"%@", v84];
          }
          else
          {
            id v36 = pbb_bridge_log();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)id buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Descriptor supports power policy and charger is *not* required for apply. Using new string for install button footer", buf, 2u);
            }

            v32 = [(COSSoftwareUpdateController *)self extractValueFromDict:v28 key:SUBErrorUserInfoMinNeededBatteryLevelWithoutChargerForApply expectedClass:objc_opt_class()];
            v33 = [(COSSoftwareUpdateController *)self extractValueFromDict:v28 key:SUBErrorUserInfoMinNeededBatteryLevelWithChargerForApply expectedClass:objc_opt_class()];
            v85 = +[NSBundle mainBundle];
            v83 = SFLocalizableWAPIStringKeyForKey();
            v82 = [v85 localizedStringForKey:v83 value:&stru_100249230 table:@"Software Update"];
            if (v32) {
              uint64_t v37 = (int)[v32 intValue];
            }
            else {
              uint64_t v37 = kMinBatteryLevelForApplyPhaseWithoutCharger;
            }
            if (v33) {
              uint64_t v38 = (int)[v33 intValue];
            }
            else {
              uint64_t v38 = kMinBatteryLevelForApplyPhase;
            }
            v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v82, v37, v38);
            CFStringRef v25 = +[NSString stringWithFormat:@"%@", v39];
          }
        }
        else
        {
          v35 = pbb_bridge_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Descriptor supports power policy but power policy is not set. Using legacy string for install button footer", buf, 2u);
          }

          id v30 = +[NSBundle mainBundle];
          v32 = SFLocalizableWAPIStringKeyForKey();
          v33 = [v30 localizedStringForKey:v32 value:&stru_100249230 table:@"Software Update"];
          CFStringRef v25 = +[NSString stringWithFormat:@"%@", v33];
        }
      }
      else
      {
        v34 = pbb_bridge_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Descriptor does not support power policy. Using legacy string for install button footer", buf, 2u);
        }

        id v28 = +[NSBundle mainBundle];
        id v30 = SFLocalizableWAPIStringKeyForKey();
        v32 = [v28 localizedStringForKey:v30 value:&stru_100249230 table:@"Software Update"];
        CFStringRef v25 = +[NSString stringWithFormat:@"%@", v32];
      }

      uint64_t v27 = PSFooterTextGroupKey;
      [(PSSpecifier *)self->_installButtonGroup setProperty:v25 forKey:PSFooterTextGroupKey];
    }

    if (a3 == 4)
    {
      [(COSSoftwareUpdateController *)self cancelHidingProgressBarAfterDelay];
      if (!self->_download)
      {
        v40 = [(COSSoftwareUpdateController *)self titleCell];
        [v40 setProgressDisplayStyle:1];
      }
LABEL_56:
      titleCell = self->_titleCell;
      [(SUBDescriptor *)self->_update downloadSize];
      v48 = CPFSSizeStrings();
      [(COSSoftwareUpdateTitleCell *)titleCell setStatusMessage:v48];

      installButtonSpecifier = self->_installButtonSpecifier;
      v50 = +[NSBundle mainBundle];
      v51 = [v50 localizedStringForKey:@"DOWNLOADING" value:&stru_100249230 table:@"Software Update"];
      [(PSSpecifier *)installButtonSpecifier setName:v51];
    }
    else
    {
      [(COSSoftwareUpdateController *)self hideProgressBarAfterDelay];
      switch(a3)
      {
        case 3:
          v56 = self->_titleCell;
          [(SUBDescriptor *)self->_update downloadSize];
          v57 = CPFSSizeStrings();
          [(COSSoftwareUpdateTitleCell *)v56 setStatusMessage:v57];

          v58 = self->_installButtonSpecifier;
          v59 = +[NSBundle mainBundle];
          v60 = [v59 localizedStringForKey:@"DOWNLOAD_AND_INSTALL" value:&stru_100249230 table:@"Software Update"];
          [(PSSpecifier *)v58 setName:v60];

          [(PSSpecifier *)self->_installButtonSpecifier setButtonAction:"downloadAndInstall:"];
          break;
        case 5:
          goto LABEL_56;
        case 6:
          v61 = self->_titleCell;
          [(SUBDescriptor *)self->_update downloadSize];
          v62 = CPFSSizeStrings();
          [(COSSoftwareUpdateTitleCell *)v61 setStatusMessage:v62];

          if ([(SUBDescriptor *)self->_update userInstallRequestType] == (id)2
            || [(SUBDescriptor *)self->_update userInstallRequestType] == (id)3)
          {
            v63 = self->_installButtonSpecifier;
            v64 = +[NSBundle mainBundle];
            v65 = [v64 localizedStringForKey:@"INSTALL_NOW" value:&stru_100249230 table:@"Software Update"];
            [(PSSpecifier *)v63 setName:v65];
          }
          else
          {
            v81 = self->_installButtonSpecifier;
            v64 = +[NSBundle mainBundle];
            v65 = [v64 localizedStringForKey:@"INSTALL" value:&stru_100249230 table:@"Software Update"];
            [(PSSpecifier *)v81 setName:v65];
          }

          [(PSSpecifier *)self->_installButtonSpecifier setButtonAction:"install:"];
          break;
        case 7:
        case 8:
          uint64_t v41 = self->_titleCell;
          v42 = +[NSBundle mainBundle];
          int64_t v43 = [v42 localizedStringForKey:@"WAITING_TO_INSTALL" value:&stru_100249230 table:@"Software Update"];
          [(COSSoftwareUpdateTitleCell *)v41 setStatusMessage:v43];

          v44 = self->_installButtonSpecifier;
          v45 = +[NSBundle mainBundle];
          v46 = [v45 localizedStringForKey:@"INSTALL" value:&stru_100249230 table:@"Software Update"];
          [(PSSpecifier *)v44 setName:v46];

          [(PSSpecifier *)self->_installButtonSpecifier setButtonAction:"install:"];
          [(COSSoftwareUpdateController *)self presentDuetAlertIfNecessary];
          break;
        case 9:
          v66 = self->_titleCell;
          v67 = +[NSBundle mainBundle];
          v68 = [v67 localizedStringForKey:@"VERIFYING" value:&stru_100249230 table:@"Software Update"];
          [(COSSoftwareUpdateTitleCell *)v66 setStatusMessage:v68];

          v69 = self->_installButtonSpecifier;
          v70 = +[NSBundle mainBundle];
          v71 = [v70 localizedStringForKey:@"VERIFYING" value:&stru_100249230 table:@"Software Update"];
          [(PSSpecifier *)v69 setName:v71];

          [(PSSpecifier *)self->_installButtonGroup removePropertyForKey:v27];
          break;
        case 10:
          v72 = self->_titleCell;
          v73 = +[NSBundle mainBundle];
          v74 = [v73 localizedStringForKey:@"INSTALLING" value:&stru_100249230 table:@"Software Update"];
          [(COSSoftwareUpdateTitleCell *)v72 setStatusMessage:v74];

          v75 = self->_installButtonSpecifier;
          v76 = +[NSBundle mainBundle];
          v77 = [v76 localizedStringForKey:@"INSTALLING" value:&stru_100249230 table:@"Software Update"];
          [(PSSpecifier *)v75 setName:v77];

          v78 = self->_installButtonGroup;
          v79 = +[NSBundle mainBundle];
          v80 = [v79 localizedStringForKey:@"INSTALLING_FOOTER" value:&stru_100249230 table:@"Software Update"];
          [(PSSpecifier *)v78 setProperty:v80 forKey:v27];

          break;
        default:
          break;
      }
    }
    [(COSSoftwareUpdateController *)self resetInstallButtonEnabledStateAndReloadSpecifier:0];
    unsigned int v52 = [(COSSoftwareUpdateController *)self shouldShowTableViewForState:subState];
    unsigned int v53 = [(COSSoftwareUpdateController *)self shouldShowTableViewForState:self->_subState];
    char v54 = v53;
    BOOL v55 = v52 != v53 || self->_subState == 1 && (subState & 0xFFFFFFFFFFFFFFFDLL) == 0;
    objc_initWeak((id *)buf, self);
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_10011E304;
    v87[3] = &unk_100247A50;
    char v89 = v52;
    char v90 = v54;
    v88[1] = (id)a3;
    objc_copyWeak(v88, (id *)buf);
    BOOL v91 = v55;
    [(COSSoftwareUpdateController *)self updateTableViewWithTask:v87];
    objc_destroyWeak(v88);
    objc_destroyWeak((id *)buf);
  }
}

- (void)updateTableViewWithTask:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  uint64_t v4 = OBJC_IVAR___PSListController__table;
  [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__table] beginUpdates];
  v5[2]();
  [*(id *)&self->BPSListController_opaque[v4] endUpdates];
}

- (void)hideProgressBarAfterDelay
{
  if (!self->_hidingProgressBarSource)
  {
    objc_initWeak(&location, self);
    id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    hidingProgressBarSource = self->_hidingProgressBarSource;
    self->_hidingProgressBarSource = v3;

    uint64_t v5 = self->_hidingProgressBarSource;
    if (v5)
    {
      dispatch_time_t v6 = dispatch_time(0, 500000000);
      dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
      unsigned __int8 v7 = self->_hidingProgressBarSource;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10011E71C;
      v8[3] = &unk_1002439E0;
      objc_copyWeak(&v9, &location);
      dispatch_source_set_event_handler(v7, v8);
      dispatch_resume((dispatch_object_t)self->_hidingProgressBarSource);
      objc_destroyWeak(&v9);
    }
    objc_destroyWeak(&location);
  }
}

- (void)cancelHidingProgressBarAfterDelay
{
  hidingProgressBarSource = self->_hidingProgressBarSource;
  if (hidingProgressBarSource)
  {
    dispatch_source_cancel(hidingProgressBarSource);
    uint64_t v4 = self->_hidingProgressBarSource;
    self->_hidingProgressBarSource = 0;
  }
}

- (void)resetInstallButtonEnabledStateAndReloadSpecifier:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (self->_subState < 9uLL) & (0x1C8u >> self->_subState);
  installButtonSpecifier = self->_installButtonSpecifier;
  unsigned __int8 v7 = +[NSNumber numberWithBool:v5];
  [(PSSpecifier *)installButtonSpecifier setProperty:v7 forKey:PSEnabledKey];

  if (v5 == 1) {
    [(COSSoftwareUpdateController *)self displayInstallButtonSpinner:0 reloadSpecifier:0];
  }
  if (v3)
  {
    id v8 = self->_installButtonSpecifier;
    [(COSSoftwareUpdateController *)self reloadSpecifier:v8];
  }
}

- (void)displayInstallButtonSpinner:(BOOL)a3 reloadSpecifier:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v8 = [(PSSpecifier *)self->_installButtonSpecifier propertyForKey:PSTableCellKey];
  if (v5)
  {
    id v7 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v7 startAnimating];
  }
  else
  {
    id v7 = 0;
  }
  [v8 setAccessoryView:v7];
  if (v4) {
    [(COSSoftwareUpdateController *)self reloadSpecifier:self->_installButtonSpecifier];
  }
}

- (void)downloadAndInstall:(id)a3
{
  BOOL v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User pressed Download and Install", v5, 2u);
  }

  objc_storeStrong((id *)&self->_updateAgreedTo, self->_update);
  [(COSSoftwareUpdateController *)self presentTermsRequiringPasscode:1 ifNecessaryWithAcceptanceAction:"downloadTermsAccepted"];
}

- (void)presentTermsRequiringPasscode:(BOOL)a3 ifNecessaryWithAcceptanceAction:(SEL)a4
{
}

- (void)presentTermsRequiringPasscode:(BOOL)a3 ifNecessaryWithAcceptanceAction:(SEL)a4 withDescriptor:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = pbb_setup_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "present Terms", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10011ECD0;
  v27[3] = &unk_100247A78;
  objc_copyWeak(&v28, buf);
  v27[4] = self;
  CFStringRef v10 = objc_retainBlock(v27);
  ((void (*)(void *, void, uint64_t))v10[2])(v10, 0, 1);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10011ED78;
  v24[3] = &unk_100247AA0;
  id v11 = v10;
  v24[4] = self;
  id v25 = v11;
  SEL v26 = a4;
  id v12 = objc_retainBlock(v24);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10011EDC8;
  v18[3] = &unk_100247AC8;
  id v13 = v8;
  id v19 = v13;
  objc_copyWeak(v23, buf);
  __int16 v14 = v11;
  id v21 = v14;
  BOOL v15 = v12;
  v23[1] = (id)a4;
  id v22 = v15;
  int v20 = self;
  int64_t v16 = objc_retainBlock(v18);
  uint64_t v17 = v16;
  if (v6) {
    [(COSSoftwareUpdateController *)self presentPasscodePromptIfNecessaryWithHandler:v16];
  }
  else {
    ((void (*)(void *, uint64_t))v16[2])(v16, 1);
  }

  objc_destroyWeak(v23);
  objc_destroyWeak(&v28);
  objc_destroyWeak(buf);
}

- (void)presentPasscodePromptIfNecessaryWithHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MCProfileConnection sharedConnection];
  unsigned __int8 v6 = [v5 isPasscodeSet];

  if ((v6 & 1) != 0
    && ([(NRDevice *)self->_activeDevice valueForProperty:NRDevicePropertyIsAltAccount],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 BOOLValue],
        v7,
        !v8))
  {
    id v9 = pbb_bridge_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Checking auto-unlock", buf, 2u);
    }

    CFStringRef v10 = +[SFUnlockManager sharedUnlockManager];
    uint64_t v11 = IDSDefaultPairedDevice;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10011F900;
    v12[3] = &unk_100247B18;
    v12[4] = self;
    id v13 = v4;
    [v10 unlockStateForDevice:v11 completionHandler:v12];
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

- (void)presentPasscodePromptWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(COSSoftwareUpdateController *)self presentiPhoneMirrorErrorIfNecessary])
  {
    v4[2](v4, 0);
  }
  else
  {
    self->_didEnterDevicePasscode = 0;
    objc_initWeak(&location, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10011FE24;
    v17[3] = &unk_100244378;
    objc_copyWeak(&v19, &location);
    id v18 = v4;
    BOOL v5 = objc_retainBlock(v17);
    id devicePasscodeCompletion = self->_devicePasscodeCompletion;
    self->_id devicePasscodeCompletion = v5;

    installButtonSpecifier = self->_installButtonSpecifier;
    unsigned int v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [(PSSpecifier *)installButtonSpecifier setProperty:v9 forKey:PSSetupCustomClassKey];

    [(PSSpecifier *)self->_installButtonSpecifier setEditPaneClass:objc_opt_class()];
    [(PSSpecifier *)self->_installButtonSpecifier setProperty:&off_10025C310 forKey:@"mode"];
    [(COSSoftwareUpdateController *)self showPINSheet:self->_installButtonSpecifier];
    CFStringRef v10 = +[UIApplication sharedApplication];
    uint64_t v11 = [v10 windows];
    id v12 = [v11 firstObject];
    id v13 = [v12 rootViewController];

    __int16 v14 = [v13 presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v14;
      int64_t v16 = [v15 navigationBar];
      BPSApplyStyleToNavBar();
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)_termsAgree
{
  id v3 = objc_alloc_init((Class)NRTermsAcknowledgementRegistry);
  [(NRTermsEvent *)self->_terms setEventType:4];
  [(NRTermsEvent *)self->_terms updateEventDate];
  [v3 add:self->_terms forDeviceID:self->_termsDeviceID withCompletion:&stru_100247B38];
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100120040;
  block[3] = &unk_100243D28;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_termsDisagree
{
  id v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User chose: Disagree", v8, 2u);
  }

  self->_termsAcceptanceAction = 0;
  [(COSSoftwareUpdateController *)self resetInstallButtonEnabledStateAndReloadSpecifier:1];
  termsDisplayController = self->_termsDisplayController;
  if (termsDisplayController)
  {
    [(UIViewController *)termsDisplayController dismissViewControllerAnimated:1 completion:0];
    [(COSSoftwareUpdateController *)self dismissViewControllerAnimated:1 completion:0];
    subManager = self->_subManager;
    self->_subManager = 0;
  }
  else if (self->_presentedModally && self->_showingTermsRequestedByWatch)
  {
    [(COSSoftwareUpdateController *)self dismissViewControllerAnimated:0 completion:0];
    [(UINavigationController *)self->_modalController dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    [(COSSoftwareUpdateController *)self dismissViewControllerAnimated:1 completion:0];
    unsigned __int8 v6 = [(COSSoftwareUpdateController *)self navigationController];
    id v7 = [v6 popViewControllerAnimated:1];
  }
  self->_showingTermsRequestedByWatch = 0;
}

- (void)downloadTermsAccepted
{
  if (self->_inSetupFlow)
  {
    id v3 = [UIApp setupController];
    id v4 = [v3 pairingReportManager];

    [v4 addPairingTimeEventToPairingReportPlist:58 withValue:&__kCFBooleanTrue withError:0];
  }
  if (self->_showingTermsRequestedByWatch)
  {
    [(COSSoftwareUpdateController *)self downloadTermsAcceptedForInstallTonight];
  }
  else
  {
    [(COSSoftwareUpdateController *)self downloadTermsAcceptedForLegacyFlow];
  }
}

- (BOOL)downloadTermsAcceptedForInstallTonight
{
  id v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = SUBStringForManagerState();
    int v16 = 134218242;
    uint64_t v17 = self;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "self: (%p); subState: (%@)",
      (uint8_t *)&v16,
      0x16u);
  }
  id v5 = self->_updateAgreedTo;
  updateAgreedTo = self->_updateAgreedTo;
  self->_updateAgreedTo = 0;

  id v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    uint64_t v17 = (COSSoftwareUpdateController *)v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Remove cloud descriptor: %@", (uint8_t *)&v16, 0xCu);
  }

  [(SUBManager *)self->_subManager removeCloudDescriptor:v5];
  if (self->_termsFromCloudDevice)
  {
    if ([(NSMutableArray *)self->_cloudDescriptors count]
      && (!self->_presentedModally || self->_launchedForTerms))
    {
      subManager = [(NSMutableArray *)self->_cloudDescriptors lastObject];
      [(NSMutableArray *)self->_cloudDescriptors removeLastObject];
      [(COSSoftwareUpdateController *)self presentTermsRequiringPasscode:0 ifNecessaryWithAcceptanceAction:"downloadTermsAccepted" withDescriptor:subManager];
    }
    else
    {
      termsDisplayController = self->_termsDisplayController;
      if (termsDisplayController)
      {
        [(UIViewController *)termsDisplayController dismissViewControllerAnimated:1 completion:0];
        subManager = self->_subManager;
        self->_subManager = 0;
      }
      else
      {
        subManager = [(COSSoftwareUpdateController *)self navigationController];
        id v10 = [subManager popViewControllerAnimated:1];
      }
    }
  }
  update = self->_update;
  if (!update)
  {
    id v13 = pbb_bridge_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      __int16 v14 = "Update was nil after user agreed to terms and conditions";
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 2u);
    }
LABEL_24:

    BOOL v12 = 0;
    goto LABEL_25;
  }
  if (([(SUBDescriptor *)update isEqual:v5] & 1) == 0)
  {
    id v13 = pbb_bridge_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      __int16 v14 = "Update was different from the update the user agreed to";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  [(SUBManager *)self->_subManager userDidAcceptTermsAndConditionsForUpdate:self->_update];
  [(PSSpecifier *)self->_installButtonSpecifier setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  BOOL v12 = 1;
  [(COSSoftwareUpdateController *)self displayInstallButtonSpinner:0 reloadSpecifier:1];
  if (self->_presentedModally && self->_showingTermsRequestedByWatch)
  {
    [(COSSoftwareUpdateController *)self dismissViewControllerAnimated:0 completion:0];
    [(UINavigationController *)self->_modalController dismissViewControllerAnimated:1 completion:0];
    self->_showingTermsRequestedByWatch = 0;
  }
LABEL_25:

  return v12;
}

- (void)downloadTermsAcceptedForLegacyFlow
{
  if ([(COSSoftwareUpdateController *)self downloadTermsAcceptedForInstallTonight])
  {
    [(SUBManager *)self->_subManager startDownload:self->_update];
    [(COSSoftwareUpdateTitleCell *)self->_titleCell setProgress:0.0];
    [(COSSoftwareUpdateController *)self transitionToState:4];
  }
}

- (void)scanForUpdatesInBackgound:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = SUBStringForManagerState();
    int v11 = 134218498;
    BOOL v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "self: (%p); subState: (%@); backgroundScan: (%d)",
      (uint8_t *)&v11,
      0x1Cu);
  }
  if (!v3)
  {
    update = self->_update;
    self->_update = 0;

    download = self->_download;
    self->_download = 0;

    [(COSSoftwareUpdateController *)self transitionToState:2];
  }
  if (self->_isExpectingScanResult)
  {
    id v9 = pbb_bridge_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not Scanning because already waiting for result", (uint8_t *)&v11, 2u);
    }
  }
  else
  {
    id v10 = +[NRPairedDeviceRegistry sharedInstance];
    [v10 userIsCheckingForUpdate];

    self->_isExpectingScanResult = 1;
    [(SUBManager *)self->_subManager scanForUpdates];
  }
}

- (void)presentDuetAlertIfNecessary
{
  BOOL v3 = [(SUBDescriptor *)self->_update denialReasons];
  if (v3)
  {
    id v13 = v3;
    id v4 = [v3 domain];
    if ([v4 isEqualToString:SUBErrorDomain])
    {
      id v5 = [v13 code];

      if (v5 == (id)18)
      {
        unsigned __int8 v6 = [v13 userInfo];
        id v7 = [v6 objectForKeyedSubscript:SUBErrorUserInfoDenialReasons];

        id v8 = [v7 unsignedLongLongValue];
        id v9 = [v13 userInfo];
        [(COSSoftwareUpdateController *)self presentAlertForDuetDenialCondition:v8 denialReasons:v9];

LABEL_8:
        BOOL v3 = v13;
        goto LABEL_9;
      }
    }
    else
    {
    }
    id v10 = [v13 domain];
    unsigned int v11 = [v10 isEqualToString:SUBDuetDenialDomain];

    BOOL v3 = v13;
    if (!v11) {
      goto LABEL_9;
    }
    id v12 = [v13 code];
    id v7 = [v13 userInfo];
    [(COSSoftwareUpdateController *)self presentAlertForDuetDenialCondition:v12 denialReasons:v7];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)install:(id)a3
{
  id v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User pressed Install", v6, 2u);
  }

  [(COSSoftwareUpdateController *)self presentDuetAlertIfNecessary];
  id v5 = [(SUBDescriptor *)self->_update denialReasons];

  if (!v5) {
    [(COSSoftwareUpdateController *)self presentTermsRequiringPasscode:1 ifNecessaryWithAcceptanceAction:"_reallyInstall"];
  }
}

- (void)_reallyInstall
{
  BOOL v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = SUBStringForManagerState();
    int v5 = 134218242;
    unsigned __int8 v6 = self;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "self: (%p); subState: %@",
      (uint8_t *)&v5,
      0x16u);
  }
  [(SUBManager *)self->_subManager userDidAcceptTermsAndConditionsForUpdate:self->_update];
  [(SUBManager *)self->_subManager installUpdate:self->_update];
  [(COSSoftwareUpdateController *)self transitionToState:9];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(COSSoftwareUpdateController *)self navigationController];
  unsigned int v11 = [v10 topViewController];

  if (v11 == self)
  {
    [v8 setModalPresentationStyle:0];
    v12.receiver = self;
    v12.super_class = (Class)COSSoftwareUpdateController;
    [(COSSoftwareUpdateController *)&v12 presentViewController:v8 animated:v6 completion:v9];
  }
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)COSSoftwareUpdateController;
  [(COSSoftwareUpdateController *)&v11 loadView];
  [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__table] _setMarginWidth:15.0];
  BOOL v3 = [(COSSoftwareUpdateTitleCell *)self->_titleCell textLabel];
  id v4 = BPSTextColor();
  [v3 setTextColor:v4];

  int v5 = [(COSSoftwareUpdateTitleCell *)self->_titleCell detailTextLabel];
  BOOL v6 = BPSTextColor();
  [v5 setTextColor:v6];

  __int16 v7 = [(COSSoftwareUpdateTitleCell *)self->_titleCell updateStatusLabel];
  id v8 = BPSTextColor();
  [v7 setTextColor:v8];

  id v9 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:13 edit:0];
  installButtonSpecifier = self->_installButtonSpecifier;
  self->_installButtonSpecifier = v9;

  [(COSSoftwareUpdateController *)self displayRevLockBootProgressIndicatorIfNeeded];
}

- (void)viewDidLoad
{
  if (!self->_termsDisplayController)
  {
    BOOL v3 = pbb_bridge_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "No terms controller, enabling notifications", buf, 2u);
    }

    [(COSSoftwareUpdateController *)self enableNotifications];
  }
  v7.receiver = self;
  v7.super_class = (Class)COSSoftwareUpdateController;
  [(COSSoftwareUpdateController *)&v7 viewDidLoad];
  [(COSSoftwareUpdateController *)self startCallingIntoSUB];
  if ([(COSSoftwareUpdateController *)self shouldShowExtraRows:self->_subState])
  {
    id v4 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F364B0F1-4FC0-461A-8B5B-93CF7E2BC79F"];
    unsigned int v6 = [v4 supportsCapability:v5];

    if (v6) {
      [(COSSoftwareUpdateController *)self loadBetaUpdates];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COSSoftwareUpdateController;
  [(COSSoftwareUpdateController *)&v6 viewWillAppear:a3];
  [(COSSoftwareUpdateTitleCell *)self->_titleCell setAnimatingGearView:self->_subState == 4];
  id v4 = [(COSSoftwareUpdateController *)self specifierForID:@"AUTOMATIC_WATCH_UPDATES_BUTTON_SPECIFIER"];
  if (v4) {
    [(COSSoftwareUpdateController *)self reloadSpecifier:v4];
  }
  id v5 = [(COSSoftwareUpdateController *)self specifierForID:@"BETA_WATCH_UPDATES_BUTTON_SPECIFIER"];
  if (v5)
  {
    [(COSSoftwareUpdateController *)self reloadSpecifier:v5];
    if ([(COSSoftwareUpdateController *)self betaUpdatesChanged])
    {
      [(COSSoftwareUpdateController *)self scanForUpdatesInBackgound:0];
      [(COSSoftwareUpdateController *)self setBetaUpdatesChanged:0];
    }
  }
}

- (void)willEnterForeground
{
  BOOL v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[COSSoftwareUpdateController willEnterForeground]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  if ([(COSSoftwareUpdateController *)self shouldShowExtraRows:self->_subState])
  {
    id v4 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F364B0F1-4FC0-461A-8B5B-93CF7E2BC79F"];
    unsigned int v6 = [v4 supportsCapability:v5];

    if (v6) {
      [(COSSoftwareUpdateController *)self loadBetaUpdates];
    }
  }
  self->_isExpectingScanResult = 0;
  if (!self->_isDisplayingRevLockBootProgressIndicator && self->_subState == 1 && !self->_hasUpdatedSuccessfully) {
    [(COSSoftwareUpdateController *)self scanForUpdatesInBackgound:0];
  }
}

- (Class)tableViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    uint64_t v4 = [(COSSoftwareUpdateController *)self specifiersForState:self->_subState];
    id v5 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v4;
  }
  unsigned int v6 = [(COSSoftwareUpdateController *)self navigationItem];
  int v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"SOFTWARE_UPDATE" value:&stru_100249230 table:@"Software Update"];
  [v6 setTitle:v8];

  if (self->_presentedModally)
  {
    id v9 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:self->_unpairOnExit target:self action:"cancelUpdatePressed"];
    id v10 = [(COSSoftwareUpdateController *)self navigationItem];
    [v10 setLeftBarButtonItem:v9];
  }
  objc_super v11 = *(void **)&self->BPSListController_opaque[v3];

  return v11;
}

- (id)_customViewForSpecifier:(id)a3 class:(Class)a4 isHeader:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = [[a4 alloc] initWithSpecifier:v7];
  id v9 = &PSHeaderViewKey;
  if (!v5) {
    id v9 = &PSFooterViewKey;
  }
  [v7 setProperty:v8 forKey:*v9];

  [v8 setAlpha:1.0];

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COSSoftwareUpdateController *)self specifierAtIndex:[(COSSoftwareUpdateController *)self indexForIndexPath:v7]];
  id v9 = [(COSSoftwareUpdateController *)self specifierForID:@"title"];
  if (v8 == v9)
  {
    titleCell = self->_titleCell;

    if (titleCell)
    {
      [(COSSoftwareUpdateTitleCell *)self->_titleCell preferredHeightWithTable:v6];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v14.receiver = self;
  v14.super_class = (Class)COSSoftwareUpdateController;
  [(COSSoftwareUpdateController *)&v14 tableView:v6 heightForRowAtIndexPath:v7];
LABEL_6:
  double v12 = v10;

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COSSoftwareUpdateController *)self specifierAtIndex:[(COSSoftwareUpdateController *)self indexForIndexPath:v7]];
  id v9 = [(COSSoftwareUpdateController *)self specifierForID:@"title"];

  if (v8 == v9)
  {
    double v10 = self->_titleCell;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)COSSoftwareUpdateController;
    double v10 = [(COSSoftwareUpdateController *)&v13 tableView:v6 cellForRowAtIndexPath:v7];
  }
  objc_super v11 = v10;

  return v11;
}

- (void)detailedReleaseNotesDonePressed:(id)a3
{
}

- (id)selectSpecifier:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)COSSoftwareUpdateController;
  id v4 = a3;
  BOOL v5 = [(COSSoftwareUpdateController *)&v13 selectSpecifier:v4];
  id v6 = [v4 propertyForKey:PSIDKey];

  LODWORD(v4) = [v6 isEqualToString:@"DETAILED_RELEASE_NOTES_LINK"];
  if (v4)
  {
    id v7 = v5;
    id v8 = objc_alloc((Class)NSString);
    id v9 = [(SUBDescriptor *)self->_update documentation];
    double v10 = [v9 releaseNotes];
    id v11 = [v8 initWithData:v10 encoding:4];
    [v7 setReleaseNotes:v11];
  }

  return v5;
}

- (void)didAcceptEnteredPIN:(id)a3
{
  self->_didEnterDevicePasscode = 1;
}

- (void)devicePINControllerDidDismissPINPane:(id)a3
{
  id devicePasscodeCompletion = (void (**)(id, BOOL, id))self->_devicePasscodeCompletion;
  if (devicePasscodeCompletion)
  {
    devicePasscodeCompletion[2](devicePasscodeCompletion, self->_didEnterDevicePasscode, a3);
    id v5 = self->_devicePasscodeCompletion;
    self->_id devicePasscodeCompletion = 0;

    self->_didEnterDevicePasscode = 0;
  }
}

- (void)manager:(id)a3 userInstallRequestTypeDidChange:(int64_t)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100121764;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)managerUserDidAcceptTermsAndConditionsForUpdate:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001217E0;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)manager:(id)a3 scanRequestDidLocateUpdate:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001218FC;
  block[3] = &unk_100246DE0;
  objc_copyWeak(&v18, &location);
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_manager:(id)a3 scanRequestDidLocateUpdate:(id)a4 error:(id)a5
{
  unint64_t v7 = (unint64_t)a4;
  unint64_t v8 = (unint64_t)a5;
  id v9 = pbb_bridge_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = SUBStringForManagerState();
    int v29 = 134218754;
    *(void *)id v30 = self;
    *(_WORD *)&v30[8] = 2112;
    BOOL v31 = v10;
    __int16 v32 = 2112;
    unint64_t v33 = v7;
    __int16 v34 = 2112;
    unint64_t v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "scanRequestDidLocateUpdate: self: (%p); subState: (%@); update: (%@); error: (%@)",
      (uint8_t *)&v29,
      0x2Au);
  }
  if (self->_isDisplayingRevLockBootProgressIndicator)
  {
    id v11 = pbb_bridge_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      id v12 = "isDisplayingRevLockBootProgressIndicator, returning early";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v29, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (self->_hasUpdatedSuccessfully)
  {
    id v11 = pbb_bridge_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      id v12 = "Ignoring callback as the update has succeeded";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  self->_isExpectingScanResult = 0;
  if (!(v7 | v8)) {
    goto LABEL_15;
  }
  id v13 = [(id)v8 domain];
  uint64_t v14 = SUBErrorDomain;
  if ([v13 isEqualToString:SUBErrorDomain])
  {
    id v15 = [(id)v8 code];

    if (v15 == (id)4)
    {
LABEL_15:
      id v16 = pbb_bridge_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No update found.", (uint8_t *)&v29, 2u);
      }

      if (self->_inSetupFlow)
      {
        id v17 = [UIApp setupController];
        id v18 = [v17 pairingReportManager];

        [v18 addPairingTimeEventToPairingReportPlist:59 withValue:&__kCFBooleanTrue withError:0];
        int scanRetries = self->_scanRetries;
        if (scanRetries > 2)
        {
          sub_1000338A8(self->_activeDevice);
          [(COSSoftwareUpdateController *)self transitionToState:1];
        }
        else
        {
          self->_int scanRetries = scanRetries + 1;
          int v20 = pbb_bridge_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = self->_scanRetries;
            int v29 = 67109376;
            *(_DWORD *)id v30 = v21;
            *(_WORD *)&v30[4] = 1024;
            *(_DWORD *)&v30[6] = 3;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No update found in setup flow, starting retry %d/%d", (uint8_t *)&v29, 0xEu);
          }

          [(COSSoftwareUpdateController *)self scanForUpdatesInBackgound:0];
        }
      }
      else
      {
        sub_1000338A8(self->_activeDevice);
        [(COSSoftwareUpdateController *)self transitionToState:1];
      }
      self->_hasReceivedValidFirstScanResult = 1;
      self->_hasScannedSinceBeingForegrounded = 1;
      update = self->_update;
      self->_update = 0;

      download = self->_download;
      self->_download = 0;

      goto LABEL_11;
    }
  }
  else
  {
  }
  id v22 = [(id)v8 domain];
  if ([v22 isEqualToString:v14])
  {
    id v23 = [(id)v8 code];

    if (v23 == (id)34)
    {
      BOOL v24 = pbb_bridge_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Need to update phone.", (uint8_t *)&v29, 2u);
      }

      [(COSSoftwareUpdateController *)self presentAlertForUpdatingCompanion];
      goto LABEL_11;
    }
  }
  else
  {
  }
  if (v8 && [(id)v8 code] != (id)21)
  {
    id v28 = pbb_bridge_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Failed to find update.", (uint8_t *)&v29, 2u);
    }

    [(COSSoftwareUpdateController *)self handleScanError:v8];
  }
  else
  {
    if (self->_subState | 2) != 2 && ([(id)v7 isEqual:self->_update])
    {
      id v11 = pbb_bridge_log();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      LOWORD(v29) = 0;
      id v12 = "SU fallthrough case.";
      goto LABEL_9;
    }
    uint64_t v27 = pbb_bridge_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Received first scan result.", (uint8_t *)&v29, 2u);
    }

    self->_hasReceivedValidFirstScanResult = 1;
    self->_hasScannedSinceBeingForegrounded = 1;
    [(COSSoftwareUpdateController *)self queryManagerState];
  }
LABEL_11:
}

- (void)manager:(id)a3 didChangeProgressOnDownload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100121F9C;
  v10[3] = &unk_100243A30;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_manager:(id)a3 didChangeProgressOnDownload:(id)a4
{
  id v6 = a4;
  id v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = SUBStringForManagerState();
    *(_DWORD *)id buf = 136315906;
    v60 = "-[COSSoftwareUpdateController _manager:didChangeProgressOnDownload:]";
    __int16 v61 = 2048;
    v62 = self;
    __int16 v63 = 2112;
    v64 = v8;
    __int16 v65 = 2112;
    id v66 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: self: (%p); subState: (%@); download: (%@)",
      buf,
      0x2Au);
  }
  id v9 = [v6 descriptor];
  id v10 = [v6 progress];
  p_update = &self->_update;
  if (!self->_update || (objc_msgSend(v9, "isEqual:") & 1) != 0)
  {
    if (self->_hasUpdatedSuccessfully)
    {
      id v12 = pbb_bridge_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        id v13 = "Ignoring callback as the update has succeeded";
        uint64_t v14 = v12;
        uint32_t v15 = 2;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
        goto LABEL_60;
      }
      goto LABEL_60;
    }
    objc_storeStrong((id *)&self->_update, v9);
    [(COSSoftwareUpdateController *)self _setupTitleCell];
    objc_storeStrong((id *)&self->_download, a4);
    [v10 portionComplete];
    -[COSSoftwareUpdateTitleCell setProgress:](self->_titleCell, "setProgress:");
    id v12 = [v10 phase];
    v58 = v10;
    if ([v12 isEqualToString:SUBPhaseDownloading])
    {
      [(COSSoftwareUpdateController *)self transitionToState:4];
      id v17 = [(COSSoftwareUpdateController *)self titleCell];
      [v17 setProgressDisplayStyle:1];

      [v10 estimatedTimeRemaining];
      double v19 = v18;
      if (v18 < 0.0)
      {
        int v20 = +[NSDate distantFuture];
        [v20 timeIntervalSinceNow];
        double v19 = v21;
      }
      if (v19 > 604800.0 || v19 <= 0.0)
      {
        BOOL v31 = +[NSBundle bundleForClass:objc_opt_class()];
        id v22 = [v31 localizedStringForKey:@"ESTIMATING_TIME_REMAINING" value:&stru_100249230 table:@"Software Update"];
      }
      else
      {
        id v22 = [(NSDateComponentsFormatter *)self->_durationFormatter stringFromTimeInterval:v19];
      }
      [(COSSoftwareUpdateTitleCell *)self->_titleCell setStatusMessage:v22];
      installButtonSpecifier = self->_installButtonSpecifier;
      id v30 = +[NSBundle mainBundle];
      unint64_t v33 = [v30 localizedStringForKey:@"DOWNLOADING" value:&stru_100249230 table:@"Software Update"];
      [(PSSpecifier *)installButtonSpecifier setName:v33];
    }
    else
    {
      if (([v12 isEqualToString:SUBPhasePreparingUpdate] & 1) != 0
        || [v12 isEqualToString:SUBPhaseWaitingForAdmissionControl])
      {
        [(COSSoftwareUpdateController *)self transitionToState:4];
        id v23 = [(COSSoftwareUpdateController *)self titleCell];
        [v23 setProgressDisplayStyle:1];

        titleCell = self->_titleCell;
        id v25 = +[NSBundle mainBundle];
        SEL v26 = [v25 localizedStringForKey:@"PREPARING" value:&stru_100249230 table:@"Software Update"];
        [(COSSoftwareUpdateTitleCell *)titleCell setStatusMessage:v26];

        uint64_t v27 = self->_installButtonSpecifier;
        id v28 = +[NSBundle mainBundle];
        id v22 = v28;
        CFStringRef v29 = @"PREPARING";
      }
      else
      {
        if (![v12 isEqualToString:SUBPhaseStalled])
        {
LABEL_24:
          if ([v12 isEqualToString:SUBPhaseStalled])
          {
            __int16 v34 = +[NSBundle mainBundle];
            unint64_t v35 = SFLocalizableWAPIStringKeyForKey();
            id v36 = [v34 localizedStringForKey:v35 value:&stru_100249230 table:@"Software Update"];

            if (!MGGetBoolAnswer())
            {
LABEL_59:
              [(PSSpecifier *)self->_installButtonGroup setProperty:v36 forKey:PSFooterTextGroupKey];
              [(COSSoftwareUpdateController *)self reloadSpecifier:self->_installButtonGroup];

              goto LABEL_60;
            }
            if (objc_opt_respondsToSelector())
            {
              uint64_t v37 = [v10 taskID];
            }
            else
            {
              uint64_t v37 = @"Unknown";
            }
            uint64_t v42 = +[NSString stringWithFormat:@"%@ \n[Internal Only]: Download task(%@) is stalled and will automatically resume once underlying conditions are resolved. Please confirm phone is on WiFi and VPN.", v36, v37];
          }
          else
          {
            if (objc_opt_respondsToSelector())
            {
              uint64_t v37 = [(SUBDescriptor *)*p_update updatePowerPolicy];
              if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                uint64_t v38 = [(COSSoftwareUpdateController *)self extractValueFromDict:v37 key:SUBErrorUserInfoChargerRequiredForApply expectedClass:objc_opt_class()];
                id v36 = v38;
                if (v38 && [v38 BOOLValue])
                {
                  v39 = pbb_bridge_log();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)id buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Descriptor supports power policy and charger is required for apply. Using legacy string for install button footer", buf, 2u);
                  }

                  v40 = +[NSBundle mainBundle];
                  uint64_t v41 = SFLocalizableWAPIStringKeyForKey();
                  v56 = [v40 localizedStringForKey:v41 value:&stru_100249230 table:@"Software Update"];
                  uint64_t v42 = +[NSString stringWithFormat:@"%@", v56];
                }
                else
                {
                  v49 = pbb_bridge_log();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)id buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Descriptor supports power policy and charger is *not* required for apply. Using new string for install button footer", buf, 2u);
                  }

                  v40 = [(COSSoftwareUpdateController *)self extractValueFromDict:v37 key:SUBErrorUserInfoMinNeededBatteryLevelWithoutChargerForApply expectedClass:objc_opt_class()];
                  uint64_t v41 = [(COSSoftwareUpdateController *)self extractValueFromDict:v37 key:SUBErrorUserInfoMinNeededBatteryLevelWithChargerForApply expectedClass:objc_opt_class()];
                  v50 = +[NSBundle mainBundle];
                  BOOL v55 = SFLocalizableWAPIStringKeyForKey();
                  v57 = v50;
                  char v54 = [v50 localizedStringForKey:value:table:];
                  if (v40) {
                    uint64_t v51 = (int)[v40 intValue];
                  }
                  else {
                    uint64_t v51 = kMinBatteryLevelForApplyPhaseWithoutCharger;
                  }
                  if (v41) {
                    uint64_t v52 = (int)[v41 intValue];
                  }
                  else {
                    uint64_t v52 = kMinBatteryLevelForApplyPhase;
                  }
                  unsigned int v53 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v54, v51, v52);
                  uint64_t v42 = +[NSString stringWithFormat:@"%@", v53];
                }
              }
              else
              {
                v44 = pbb_bridge_log();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)id buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Descriptor supports power policy but charger policy is not set. Using legacy string for install button footer", buf, 2u);
                }

                id v36 = +[NSBundle mainBundle];
                v40 = SFLocalizableWAPIStringKeyForKey();
                uint64_t v41 = [v36 localizedStringForKey:v40 value:&stru_100249230 table:@"Software Update"];
                uint64_t v42 = +[NSString stringWithFormat:@"%@", v41];
              }
            }
            else
            {
              int64_t v43 = pbb_bridge_log();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)id buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Descriptor does *not* support power policy. Using legacy string for install button footer", buf, 2u);
              }

              uint64_t v37 = +[NSBundle mainBundle];
              id v36 = SFLocalizableWAPIStringKeyForKey();
              v40 = [(__CFString *)v37 localizedStringForKey:v36 value:&stru_100249230 table:@"Software Update"];
              uint64_t v42 = +[NSString stringWithFormat:@"%@", v40];
            }

            id v10 = v58;
          }

          id v36 = (void *)v42;
          goto LABEL_59;
        }
        [(COSSoftwareUpdateController *)self transitionToState:4];
        v45 = [(COSSoftwareUpdateController *)self titleCell];
        [v45 setProgressDisplayStyle:2];

        v46 = self->_titleCell;
        v47 = +[NSBundle mainBundle];
        v48 = [v47 localizedStringForKey:@"PAUSED" value:&stru_100249230 table:@"Software Update"];
        [(COSSoftwareUpdateTitleCell *)v46 setStatusMessage:v48];

        uint64_t v27 = self->_installButtonSpecifier;
        id v28 = +[NSBundle mainBundle];
        id v22 = v28;
        CFStringRef v29 = @"RESUME_DOWNLOADING";
      }
      id v30 = [v28 localizedStringForKey:v29 value:&stru_100249230 table:@"Software Update"];
      [(PSSpecifier *)v27 setName:v30];
    }

    id v10 = v58;
    goto LABEL_24;
  }
  id v12 = pbb_bridge_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = *p_update;
    *(_DWORD *)id buf = 138412290;
    v60 = (const char *)v16;
    id v13 = "Ignoring callback as we are tracking a different update: (%@)";
    uint64_t v14 = v12;
    uint32_t v15 = 12;
    goto LABEL_10;
  }
LABEL_60:
}

- (void)manager:(id)a3 didFailDownload:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122BE0;
  block[3] = &unk_100246DE0;
  objc_copyWeak(&v18, &location);
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_manager:(id)a3 didFailDownload:(id)a4 withError:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = pbb_bridge_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = SUBStringForManagerState();
    int v20 = 136316162;
    double v21 = "-[COSSoftwareUpdateController _manager:didFailDownload:withError:]";
    __int16 v22 = 2048;
    id v23 = self;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: self: (%p); subState: (%@); didFailDownload: (%@); error: (%@)",
      (uint8_t *)&v20,
      0x34u);
  }
  id v12 = [v8 descriptor];
  id v13 = v12;
  if (!self->_titleCell)
  {
    uint64_t v14 = pbb_bridge_log();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      goto LABEL_18;
    }
    int v20 = 136315138;
    double v21 = "-[COSSoftwareUpdateController _manager:didFailDownload:withError:]";
    id v15 = "%s: Ignoring didFailDownload, view isn't setup yet";
    id v16 = v14;
    uint32_t v17 = 12;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, v17);
    goto LABEL_13;
  }
  if (!v12 || !self->_update || (objc_msgSend(v12, "isEqual:") & 1) != 0)
  {
    if (!self->_hasUpdatedSuccessfully)
    {
      objc_storeStrong((id *)&self->_update, v13);
      [(COSSoftwareUpdateController *)self _setupTitleCell];
      objc_storeStrong((id *)&self->_download, a4);
      sub_1000338A8(self->_activeDevice);
      [(COSSoftwareUpdateController *)self handleDownloadError:v9];
      goto LABEL_18;
    }
    uint64_t v14 = pbb_bridge_log();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    LOWORD(v20) = 0;
    id v15 = "Ignoring callback as the update has succeeded";
    id v16 = v14;
    uint32_t v17 = 2;
    goto LABEL_12;
  }
  id v18 = pbb_bridge_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    update = self->_update;
    int v20 = 138412290;
    double v21 = (const char *)update;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Ignoring callback as we are tracking a different update: (%@)", (uint8_t *)&v20, 0xCu);
  }

LABEL_18:
}

- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122FF0;
  block[3] = &unk_100247B60;
  objc_copyWeak(&v17, &location);
  id v15 = v10;
  id v16 = v11;
  BOOL v18 = a5;
  BOOL v19 = a6;
  id v12 = v11;
  id v13 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = pbb_bridge_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = SUBStringForManagerState();
    int v24 = 136316418;
    id v25 = "-[COSSoftwareUpdateController _manager:didFinishDownload:willProceedWithInstallation:waitingForAdmissionControl:]";
    __int16 v26 = 2048;
    id v27 = self;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2112;
    id v31 = v9;
    __int16 v32 = 1024;
    BOOL v33 = v7;
    __int16 v34 = 1024;
    BOOL v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: self: (%p); subState: (%@); download: (%@); willProceed: (%d); waiting: (%d)",
      (uint8_t *)&v24,
      0x36u);
  }
  id v12 = [v9 descriptor];
  id v13 = v12;
  if (!self->_titleCell)
  {
    id v15 = pbb_bridge_log();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v24 = 136315138;
    id v25 = "-[COSSoftwareUpdateController _manager:didFinishDownload:willProceedWithInstallation:waitingForAdmissionControl:]";
    id v16 = "%s: Ignoring didFinishDownload, view isn't setup yet";
LABEL_13:
    id v17 = v15;
    uint32_t v18 = 12;
    goto LABEL_14;
  }
  p_update = &self->_update;
  if (self->_update && (objc_msgSend(v12, "isEqual:") & 1) == 0)
  {
    id v15 = pbb_bridge_log();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    BOOL v19 = *p_update;
    int v24 = 138412290;
    id v25 = (const char *)v19;
    id v16 = "Ignoring callback as we are tracking a different update: (%@)";
    goto LABEL_13;
  }
  if (self->_hasUpdatedSuccessfully)
  {
    id v15 = pbb_bridge_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      id v16 = "Ignoring callback as the update has succeeded";
      id v17 = v15;
      uint32_t v18 = 2;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, v18);
    }
LABEL_15:

    goto LABEL_16;
  }
  objc_storeStrong((id *)&self->_update, v13);
  [(COSSoftwareUpdateController *)self _setupTitleCell];
  download = self->_download;
  self->_download = 0;

  uint64_t v21 = 8;
  if (!v6) {
    uint64_t v21 = 9;
  }
  uint64_t v22 = 6;
  if (v6) {
    uint64_t v22 = 7;
  }
  if (v7) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = v22;
  }
  [(COSSoftwareUpdateController *)self transitionToState:v23];
LABEL_16:
}

- (void)manager:(id)a3 willProceedWithInstallation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001233D4;
  v10[3] = &unk_100243A30;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_manager:(id)a3 willProceedWithInstallation:(id)a4
{
  id v6 = a4;
  id v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = SUBStringForManagerState();
    int v16 = 136315906;
    id v17 = "-[COSSoftwareUpdateController _manager:willProceedWithInstallation:]";
    __int16 v18 = 2048;
    BOOL v19 = self;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: self: (%p); subState: (%@); update: (%@)",
      (uint8_t *)&v16,
      0x2Au);
  }
  p_update = &self->_update;
  if (self->_update && (objc_msgSend(v6, "isEqual:") & 1) == 0)
  {
    id v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *p_update;
      int v16 = 138412290;
      id v17 = (const char *)v14;
      id v11 = "Ignoring callback as we are tracking a different update: (%@)";
      id v12 = v10;
      uint32_t v13 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    if (!self->_hasUpdatedSuccessfully)
    {
      objc_storeStrong((id *)&self->_update, a4);
      [(COSSoftwareUpdateController *)self _setupTitleCell];
      download = self->_download;
      self->_download = 0;

      [(COSSoftwareUpdateController *)self transitionToState:9];
      goto LABEL_13;
    }
    id v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      id v11 = "Ignoring callback as the update has succeeded";
      id v12 = v10;
      uint32_t v13 = 2;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    }
  }

LABEL_13:
}

- (void)manager:(id)a3 installationOfUpdate:(id)a4 canProceed:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100123720;
  block[3] = &unk_100245440;
  objc_copyWeak(&v15, &location);
  id v13 = v8;
  id v14 = v9;
  BOOL v16 = a5;
  id v10 = v9;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_manager:(id)a3 installationOfUpdate:(id)a4 canProceed:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = pbb_bridge_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = SUBStringForManagerState();
    int v19 = 136316162;
    __int16 v20 = "-[COSSoftwareUpdateController _manager:installationOfUpdate:canProceed:]";
    __int16 v21 = 2048;
    __int16 v22 = self;
    __int16 v23 = 2112;
    int v24 = v10;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 1024;
    BOOL v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: self: (%p); subState: (%@); update: (%@); canProceed: (%d)",
      (uint8_t *)&v19,
      0x30u);
  }
  p_update = &self->_update;
  if (self->_update && (objc_msgSend(v8, "isEqual:") & 1) == 0)
  {
    id v12 = pbb_bridge_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = *p_update;
      int v19 = 138412290;
      __int16 v20 = (const char *)v16;
      id v13 = "Ignoring callback as we are tracking a different update: (%@)";
      id v14 = v12;
      uint32_t v15 = 12;
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_16;
  }
  if (self->_hasUpdatedSuccessfully)
  {
    id v12 = pbb_bridge_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      id v13 = "Ignoring callback as the update has succeeded";
      id v14 = v12;
      uint32_t v15 = 2;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_update, a4);
  [(COSSoftwareUpdateController *)self _setupTitleCell];
  download = self->_download;
  self->_download = 0;

  if (v5) {
    uint64_t v18 = 6;
  }
  else {
    uint64_t v18 = 7;
  }
  [(COSSoftwareUpdateController *)self transitionToState:v18];
LABEL_16:
}

- (void)manager:(id)a3 didFailInstallation:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100123AA8;
  block[3] = &unk_100246DE0;
  objc_copyWeak(&v18, &location);
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_manager:(id)a3 didFailInstallation:(id)a4 withError:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = pbb_bridge_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = SUBStringForManagerState();
    int v19 = 134218754;
    __int16 v20 = self;
    __int16 v21 = 2112;
    __int16 v22 = v11;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "didFailInstallation: self: (%p); subState: (%@); update: (%@); error: (%@)",
      (uint8_t *)&v19,
      0x2Au);
  }
  p_update = &self->_update;
  if (self->_update && (objc_msgSend(v8, "isEqual:") & 1) == 0)
  {
    id v13 = pbb_bridge_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (COSSoftwareUpdateController *)*p_update;
      int v19 = 138412290;
      __int16 v20 = v17;
      id v14 = "Ignoring callback as we are tracking a different update: (%@)";
      id v15 = v13;
      uint32_t v16 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    if (!self->_hasUpdatedSuccessfully)
    {
      objc_storeStrong((id *)&self->_update, a4);
      [(COSSoftwareUpdateController *)self _setupTitleCell];
      download = self->_download;
      self->_download = 0;

      sub_1000338A8(self->_activeDevice);
      [(COSSoftwareUpdateController *)self handleInstallationError:v9];
      goto LABEL_13;
    }
    id v13 = pbb_bridge_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      id v14 = "Ignoring callback as the update has succeeded";
      id v15 = v13;
      uint32_t v16 = 2;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
    }
  }

LABEL_13:
}

- (void)manager:(id)a3 didFinishInstallation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100123E04;
  v10[3] = &unk_100243A30;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_manager:(id)a3 didFinishInstallation:(id)a4
{
  id v6 = a4;
  id v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = SUBStringForManagerState();
    int v16 = 136315906;
    id v17 = "-[COSSoftwareUpdateController _manager:didFinishInstallation:]";
    __int16 v18 = 2048;
    int v19 = self;
    __int16 v20 = 2112;
    __int16 v21 = v8;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: self: (%p); subState: (%@); update: (%@)",
      (uint8_t *)&v16,
      0x2Au);
  }
  p_update = &self->_update;
  if (self->_update && (objc_msgSend(v6, "isEqual:") & 1) == 0)
  {
    id v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = *p_update;
      int v16 = 138412290;
      id v17 = (const char *)v14;
      id v11 = "Ignoring callback as we are tracking a different update: (%@)";
      id v12 = v10;
      uint32_t v13 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    if (!self->_hasUpdatedSuccessfully)
    {
      objc_storeStrong((id *)&self->_update, a4);
      [(COSSoftwareUpdateController *)self _setupTitleCell];
      download = self->_download;
      self->_download = 0;

      [(COSSoftwareUpdateController *)self transitionToState:10];
      goto LABEL_13;
    }
    id v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      id v11 = "Ignoring callback as the update has succeeded";
      id v12 = v10;
      uint32_t v13 = 2;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    }
  }

LABEL_13:
}

- (id)extractValueFromDict:(id)a3 key:(id)a4 expectedClass:(Class)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7 || !v8 || !a5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v10 = pbb_bridge_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      id v15 = "-[COSSoftwareUpdateController extractValueFromDict:key:expectedClass:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Invalid options passed. Unable to extract value from dictionary", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_12;
  }
  id v10 = [v7 objectForKeyedSubscript:v9];
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = pbb_bridge_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(objc_class *)a5 description];
      int v14 = 136315650;
      id v15 = "-[COSSoftwareUpdateController extractValueFromDict:key:expectedClass:]";
      __int16 v16 = 2114;
      id v17 = v9;
      __int16 v18 = 2114;
      int v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s : Value for key %{public}@ exist in dictionary but is not of the expected class(%{public}@)", (uint8_t *)&v14, 0x20u);
    }
LABEL_12:

    id v10 = 0;
  }

  return v10;
}

- (id)internalMessageFromDenialInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(COSSoftwareUpdateController *)self extractValueFromDict:v4 key:SUBErrorUserInfoChargerRequiredForApply expectedClass:objc_opt_class()];
    if (!v5)
    {
      id v6 = pbb_bridge_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unexpected value for chargerRequiredForUpdate. Assuming required", buf, 2u);
      }

      BOOL v5 = &__kCFBooleanTrue;
    }
    id v7 = [(COSSoftwareUpdateController *)self extractValueFromDict:v4 key:SUBErrorUserInfoChargerConnected expectedClass:objc_opt_class()];
    id v23 = v7;
    if (v7)
    {
      if ([v7 BOOLValue]) {
        id v8 = @"YES";
      }
      else {
        id v8 = @"NO";
      }
      id v24 = v8;
    }
    else
    {
      id v10 = pbb_bridge_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Invalid value passed for chargerConnected", buf, 2u);
      }

      id v24 = @"Unknown";
    }
    id v11 = [(COSSoftwareUpdateController *)self extractValueFromDict:v4 key:SUBErrorUserInfoBatteryLevel expectedClass:objc_opt_class()];
    if (v11)
    {
      id v12 = +[NSString stringWithFormat:@"%@", v11];
    }
    else
    {
      uint32_t v13 = pbb_bridge_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Invalid value passed for battery level", buf, 2u);
      }

      id v12 = @"Unknown";
    }
    int v14 = [(COSSoftwareUpdateController *)self extractValueFromDict:v4 key:SUBErrorUserInfoMinNeededBatteryLevelWithChargerForApply expectedClass:objc_opt_class()];
    if (v14)
    {
      id v15 = +[NSString stringWithFormat:@"%@", v14];
    }
    else
    {
      __int16 v16 = pbb_bridge_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Invalid value passed for batteryLevelWithCharger for apply", buf, 2u);
      }

      id v15 = @"Unknown";
    }
    id v17 = [(COSSoftwareUpdateController *)self extractValueFromDict:v4 key:SUBErrorUserInfoMinNeededBatteryLevelWithoutChargerForApply expectedClass:objc_opt_class()];
    if (v17)
    {
      __int16 v18 = +[NSString stringWithFormat:@"%@", v17];
    }
    else
    {
      int v19 = pbb_bridge_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Invalid value passed for batteryLevelWithoutCharger for apply", buf, 2u);
      }

      __int16 v18 = @"Unknown";
    }
    unsigned int v20 = [v5 BOOLValue];
    CFStringRef v21 = @"NO";
    if (v20) {
      CFStringRef v21 = @"YES";
    }
    id v9 = +[NSString stringWithFormat:@"ChargerRequired: %@ ChargerConnected: %@ BatteryLevel: %@ ApplyBatteryLevelWithCharger: %@ ApplyBatteryLevelWithoutCharger: %@", v21, v24, v12, v15, v18];
  }
  else
  {
    BOOL v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 136315138;
      id v26 = "-[COSSoftwareUpdateController internalMessageFromDenialInfo:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalid denialInfo passed to %s", buf, 0xCu);
    }
    id v9 = @"Unable to parse error info";
  }

  return v9;
}

- (void)presentAlertForDuetDenialCondition:(unint64_t)a3 denialReasons:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if ((unint64_t)(self->_subState - 7) >= 2 && (kDenialReasonLowBattery & a3) != kDenialReasonLowBattery) {
    goto LABEL_27;
  }
  id v9 = ASDPurchase_ptr;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = [v7 objectForKeyedSubscript:SUBErrorUserInfoRichDenialReasonsSupported];

    id v11 = pbb_bridge_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)id buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Rich denial reasons supported", buf, 2u);
      }

      uint32_t v13 = pbb_bridge_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138543362;
        v44 = v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: DenialReasons passed in using rich format : %{public}@", buf, 0xCu);
      }

      int v14 = [(COSSoftwareUpdateController *)self extractValueFromDict:v7 key:SUBErrorUserInfoMinNeededBatteryLevelWithoutChargerForApply expectedClass:objc_opt_class()];
      if (!v14)
      {
        int v14 = +[NSNumber numberWithInteger:kMinBatteryLevelForApplyPhaseWithoutCharger];
        id v15 = pbb_bridge_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id buf = 138543362;
          v44 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Unexpected value passed for requiredBatteryLevelWithoutCharger. Assuming default(%{public}@)", buf, 0xCu);
        }
      }
      __int16 v16 = [(COSSoftwareUpdateController *)self extractValueFromDict:v7 key:SUBErrorUserInfoMinNeededBatteryLevelWithChargerForApply expectedClass:objc_opt_class()];
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v17 = v16;
      }
      else
      {
        id v17 = +[NSNumber numberWithInteger:kMinBatteryLevelForApplyPhase];

        __int16 v27 = pbb_bridge_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id buf = 138543362;
          v44 = v17;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Unexpected value passed for requiredBatteryLevelWithCharger. Assuming default(%{public}@)", buf, 0xCu);
        }
      }
      BOOL v28 = [(COSSoftwareUpdateController *)self extractValueFromDict:v7 key:SUBErrorUserInfoChargerRequiredForApply expectedClass:objc_opt_class()];
      if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v29 = pbb_bridge_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Unexpected value passed for chargerRequiredForUpdate. Assuming required", buf, 2u);
        }

        BOOL v28 = &__kCFBooleanTrue;
      }
      __int16 v30 = [(COSSoftwareUpdateController *)self extractValueFromDict:v7 key:SUBErrorUserInfoChargerConnected expectedClass:objc_opt_class()];
      if (!v30)
      {
        id v31 = pbb_bridge_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Unable to determine if charger is connected. Assuming not connected", buf, 2u);
        }

        __int16 v30 = &__kCFBooleanFalse;
      }
      if ([v28 BOOLValue])
      {
        unsigned __int8 v32 = [v30 BOOLValue];
        BOOL v33 = pbb_bridge_log();
        BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        if (v32)
        {
          if (v34)
          {
            *(_WORD *)id buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Charger is required for update and is connected. Showing low battery message in notification", buf, 2u);
          }

          BOOL v35 = +[NSBundle mainBundle];
          id v36 = v35;
          CFStringRef v37 = @"INSTALLATION_PAUSED_BATTERY";
        }
        else
        {
          if (v34)
          {
            *(_WORD *)id buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Charger is required for update and not connected. Showing charger required message in notification", buf, 2u);
          }

          BOOL v35 = +[NSBundle mainBundle];
          id v36 = v35;
          CFStringRef v37 = @"INSTALLATION_PAUSED_CHARGER";
        }
        v39 = [v35 localizedStringForKey:v37 value:&stru_100249230 table:@"Software Update"];
        int v19 = +[NSString stringWithFormat:@"%@", v39];
      }
      else
      {
        uint64_t v38 = pbb_bridge_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Charger is not required for update. Showing new combined battery/charger message in notification", buf, 2u);
        }

        id v36 = +[NSBundle mainBundle];
        v39 = [v36 localizedStringForKey:@"INSTALLATION_PAUSED_CHARGER_OPTIONAL" value:&stru_100249230 table:@"Software Update"];
        v40 = [NSString stringWithFormat:v39, [v17 intValue], [v14 intValue]];
        int v19 = +[NSString stringWithFormat:@"%@", v40];

        id v9 = ASDPurchase_ptr;
      }

      if (MGGetBoolAnswer())
      {
        uint64_t v41 = [(COSSoftwareUpdateController *)self internalMessageFromDenialInfo:v7];
        uint64_t v42 = [v19 stringByAppendingFormat:@"\n[Internal Only]: %@", v41];

        int v19 = (void *)v42;
      }

      goto LABEL_24;
    }
    if (v12)
    {
      *(_WORD *)id buf = 0;
      __int16 v18 = "[DenialReasons]: denialInfo present but rich denial reasons not supported";
      goto LABEL_22;
    }
  }
  else
  {
    id v11 = pbb_bridge_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      __int16 v18 = "[DenialReasons]: Rich denial reasons not supported/present";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
    }
  }

  int v14 = +[NSBundle mainBundle];
  id v17 = [v14 localizedStringForKey:@"INSTALLATION_PAUSED_BATTERY" value:&stru_100249230 table:@"Software Update"];
  int v19 = +[NSString stringWithFormat:@"%@", v17];
LABEL_24:

  unsigned int v20 = [v9[116] mainBundle];
  CFStringRef v21 = [v20 localizedStringForKey:@"INSTALLATION_PAUSED" value:&stru_100249230 table:@"Software Update"];
  __int16 v22 = +[UIAlertController alertControllerWithTitle:v21 message:v19 preferredStyle:1];

  id v23 = [v9[116] bundleForClass:objc_opt_class()];
  id v24 = [v23 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Software Update"];
  __int16 v25 = +[UIAlertAction actionWithTitle:v24 style:0 handler:0];
  [v22 addAction:v25];

  id v26 = pbb_bridge_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Presenting 'installation paused' alert", buf, 2u);
  }

  [(COSSoftwareUpdateController *)self presentViewController:v22 animated:1 completion:0];
LABEL_27:
}

- (void)presentAlertForUpdatingCompanion
{
  uint64_t v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"COMPANION_UPDATE_ALLOWS_WATCH_UPDATE_FORMAT_TITLE" value:&stru_100249230 table:@"Software Update"];
  BOOL v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"COMPANION_UPDATE_ALLOWS_WATCH_UPDATE_FORMAT" value:&stru_100249230 table:@"Software Update"];
  id v7 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"COMPANION_UPDATE_ALLOWS_WATCH_UPDATE_LINK" value:&stru_100249230 table:@"Software Update"];
  id v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:&stru_100247B80];
  [v7 addAction:v10];

  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_100249230 table:@"Software Update"];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001251B8;
  v16[3] = &unk_100243AE0;
  v16[4] = self;
  uint32_t v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v16];
  [v7 addAction:v13];

  int v14 = pbb_bridge_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Presenting 'Companion Needs Update' alert", v15, 2u);
  }

  [(COSSoftwareUpdateController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)presentAlertForiPhoneMirroring
{
  uint64_t v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"IPHONE_MIRROR_BLOCK_PASSCODE_TITLE" value:&stru_100249230 table:@"Software Update"];
  BOOL v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"IPHONE_MIRROR_BLOCK_PASSCODE_MESSAGE" value:&stru_100249230 table:@"Software Update"];
  id v7 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Software Update"];
  id v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:&stru_100247BC0];
  [v7 addAction:v10];

  id v11 = pbb_bridge_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Presenting 'iPhone Mirroring Blocks Watch Updates' alert", v12, 2u);
  }

  [(COSSoftwareUpdateController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)handleManagerStateError:(id)a3
{
  id v4 = a3;
  BOOL v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315650;
    id v7 = "-[COSSoftwareUpdateController handleManagerStateError:]";
    __int16 v8 = 2048;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: self: (%p); State error: (%@)", buf, 0x20u);
  }

  BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler();
}

- (void)handleScanError:(id)a3
{
  id v4 = a3;
  BOOL v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 136315650;
    BOOL v33 = "-[COSSoftwareUpdateController handleScanError:]";
    __int16 v34 = 2048;
    BOOL v35 = self;
    __int16 v36 = 2112;
    id v37 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: self: (%p); Scan error: (%@)", buf, 0x20u);
  }

  if ((self->_subState | 2) == 2)
  {
    id v6 = [UIApp setupController];
    id v7 = [v6 pairingReportManager];

    __int16 v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
    [v7 addPairingTimeEventToPairingReportPlist:60 withValue:v8 withError:0];

    uint64_t v9 = (uint64_t)[v4 code];
    if (v9 <= 6)
    {
      if (v9 != 3 && v9 != 5)
      {
LABEL_15:
        id v11 = +[NSBundle bundleForClass:objc_opt_class()];
        BOOL v12 = v11;
        CFStringRef v13 = @"GENERIC_SCAN_ERROR";
        goto LABEL_16;
      }
    }
    else
    {
      if (v9 == 45)
      {
        int v14 = 0;
LABEL_17:
        if ([v4 code] == (id)45)
        {
          __int16 v16 = +[NSBundle mainBundle];
          id v17 = v16;
          CFStringRef v18 = @"UNABLE_TO_CHECK_FOR_UPDATE_BEFORE_FIRST_UNLOCK";
        }
        else
        {
          __int16 v16 = +[NSBundle bundleForClass:objc_opt_class()];
          id v17 = v16;
          CFStringRef v18 = @"UNABLE_TO_CHECK_FOR_UPDATE";
        }
        int v19 = [v16 localizedStringForKey:v18 value:&stru_100249230 table:@"Software Update"];

        unsigned int v20 = +[UIAlertController alertControllerWithTitle:v19 message:v14 preferredStyle:1];
        if (self->_inSetupFlow)
        {
          CFStringRef v21 = +[NSBundle mainBundle];
          __int16 v22 = [v21 localizedStringForKey:@"START_OVER" value:&stru_100249230 table:@"Software Update"];
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_100125D8C;
          v31[3] = &unk_100243AE0;
          v31[4] = self;
          id v23 = v31;
        }
        else
        {
          CFStringRef v21 = +[NSBundle bundleForClass:objc_opt_class()];
          __int16 v22 = [v21 localizedStringForKey:@"CANCEL" value:&stru_100249230 table:@"Software Update"];
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_100125DC8;
          v30[3] = &unk_100243AE0;
          v30[4] = self;
          id v23 = v30;
        }
        id v24 = +[UIAlertAction actionWithTitle:v22 style:1 handler:v23];
        [v20 addAction:v24];

        __int16 v25 = +[NSBundle bundleForClass:objc_opt_class()];
        id v26 = [v25 localizedStringForKey:@"TRY_AGAIN" value:&stru_100249230 table:@"Software Update"];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_100125E18;
        v29[3] = &unk_100243AE0;
        v29[4] = self;
        __int16 v27 = +[UIAlertAction actionWithTitle:v26 style:0 handler:v29];
        [v20 addAction:v27];

        BOOL v28 = pbb_bridge_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Presenting 'unable to check for update' alert", buf, 2u);
        }

        [(COSSoftwareUpdateController *)self presentViewController:v20 animated:1 completion:0];
        goto LABEL_26;
      }
      if (v9 == 21) {
        goto LABEL_26;
      }
      if (v9 != 7) {
        goto LABEL_15;
      }
    }
    id v11 = +[NSBundle bundleForClass:objc_opt_class()];
    BOOL v12 = v11;
    CFStringRef v13 = @"NETWORK_SCAN_ERROR";
LABEL_16:
    id v15 = [v11 localizedStringForKey:v13 value:&stru_100249230 table:@"Software Update"];
    int v14 = sub_100125C78(v15, v4);

    goto LABEL_17;
  }
  id v7 = pbb_bridge_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    SUBStringForManagerState();
    __int16 v10 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)id buf = 138412290;
    BOOL v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Ignoring scan error as this is a background scan. State: (%@)", buf, 0xCu);
  }
LABEL_26:
}

- (void)handleDownloadError:(id)a3
{
  if ([a3 code] == (id)25)
  {
    nssManager = self->_nssManager;
    if (!nssManager)
    {
      BOOL v5 = (NSSManager *)[objc_alloc((Class)NSSManager) initWithQueue:&_dispatch_main_q];
      id v6 = self->_nssManager;
      self->_nssManager = v5;

      nssManager = self->_nssManager;
    }
    id v7 = +[NSNumber numberWithLongLong:[(SUBDescriptor *)self->_update totalRequiredFreeSpace]];
    __int16 v8 = [(SUBDescriptor *)self->_update productBuildVersion];
    [(NSSManager *)nssManager recordSoftwareUpdateSpaceFailure:v7 osBeingUpdatedTo:v8 completion:&stru_100247BE0];
  }
  update = self->_update;
  self->_update = 0;

  download = self->_download;
  self->_download = 0;

  [(COSSoftwareUpdateController *)self transitionToState:0];

  [(COSSoftwareUpdateController *)self queryManagerState];
}

- (void)handleInstallationError:(id)a3
{
  if ([a3 code] == (id)18)
  {
    [(COSSoftwareUpdateController *)self transitionToState:7];
  }
  else
  {
    update = self->_update;
    self->_update = 0;

    download = self->_download;
    self->_download = 0;

    [(COSSoftwareUpdateController *)self transitionToState:0];
    [(COSSoftwareUpdateController *)self queryManagerState];
  }
}

- (void)loadBetaUpdates
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001260B4;
  v2[3] = &unk_100244CE0;
  v2[4] = self;
  [(COSSoftwareUpdateController *)self loadBetaUpdatesWithCompletion:v2];
}

- (void)loadBetaUpdatesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  seedingQueryQueue = self->_seedingQueryQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012619C;
  block[3] = &unk_100245690;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(seedingQueryQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)enrolledBetaProgramString
{
  uint64_t v3 = [(COSSoftwareUpdateController *)self selectedBetaProgram];
  if (v3)
  {
    id v4 = [(COSSoftwareUpdateController *)self selectedBetaProgram];
    [v4 title];
  }
  else
  {
    id v4 = +[NSBundle mainBundle];
    [v4 localizedStringForKey:@"AUTOMATIC_UPDATES_DISABLED" value:&stru_100249230 table:@"Software Update"];
  BOOL v5 = };

  return v5;
}

- (id)availableBetaPrograms
{
  return [(COSSoftwareUpdateController *)self betaPrograms];
}

- (void)enrollInBetaProgram:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(COSSoftwareUpdateController *)self setSelectedBetaProgram:v6];
  [(COSSoftwareUpdateController *)self setBetaUpdatesChanged:1];
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_8;
  }
  id v15 = 0;
  id v8 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v15];
  id v9 = v15;
  if (!v9)
  {
LABEL_8:
    nssManager = self->_nssManager;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100126AD0;
    v13[3] = &unk_100247C80;
    v13[4] = self;
    id v14 = v7;
    [(NSSManager *)nssManager updateBetaEnrollmentStatus:v8 withCompletion:v13];
    __int16 v10 = v14;
    goto LABEL_9;
  }
  __int16 v10 = v9;
  id v11 = pbb_bridge_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to archive beta program: %@", buf, 0xCu);
  }

  (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
LABEL_9:
}

- (void)unenrollFromBetaUpdatesWithCompletion:(id)a3
{
  id v4 = a3;
  [(COSSoftwareUpdateController *)self setSelectedBetaProgram:0];
  [(COSSoftwareUpdateController *)self setBetaUpdatesChanged:1];
  nssManager = self->_nssManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100126BEC;
  v7[3] = &unk_100247C80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSSManager *)nssManager unenrollFromBetaUpdatesWithCompletion:v7];
}

- (BOOL)presentiPhoneMirrorErrorIfNecessary
{
  uint64_t v3 = +[UIApplication sharedApplication];
  unsigned int v4 = [v3 iPhoneMirroringEnabled];

  if (v4) {
    [(COSSoftwareUpdateController *)self presentAlertForiPhoneMirroring];
  }
  return v4;
}

- (SUBDownload)download
{
  return self->_download;
}

- (void)setDownload:(id)a3
{
}

- (SUBDescriptor)update
{
  return self->_update;
}

- (void)setUpdate:(id)a3
{
}

- (SUBDescriptor)updateAgreedTo
{
  return self->_updateAgreedTo;
}

- (void)setUpdateAgreedTo:(id)a3
{
}

- (PSSpecifier)titleGroup
{
  return self->_titleGroup;
}

- (void)setTitleGroup:(id)a3
{
}

- (COSSoftwareUpdateTitleCell)titleCell
{
  return self->_titleCell;
}

- (void)setTitleCell:(id)a3
{
}

- (PSSpecifier)installButtonGroup
{
  return self->_installButtonGroup;
}

- (void)setInstallButtonGroup:(id)a3
{
}

- (PSSpecifier)installButtonSpecifier
{
  return self->_installButtonSpecifier;
}

- (void)setInstallButtonSpecifier:(id)a3
{
}

- (SEL)termsAcceptanceAction
{
  if (self->_termsAcceptanceAction) {
    return self->_termsAcceptanceAction;
  }
  else {
    return 0;
  }
}

- (void)setTermsAcceptanceAction:(SEL)a3
{
  if (a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = 0;
  }
  self->_termsAcceptanceAction = v3;
}

- (NRTermsEvent)terms
{
  return self->_terms;
}

- (void)setTerms:(id)a3
{
}

- (NSUUID)termsDeviceID
{
  return self->_termsDeviceID;
}

- (void)setTermsDeviceID:(id)a3
{
}

- (NSDateComponentsFormatter)durationFormatter
{
  return self->_durationFormatter;
}

- (void)setDurationFormatter:(id)a3
{
}

- (int64_t)subState
{
  return self->_subState;
}

- (void)setSubState:(int64_t)a3
{
  self->_int64_t subState = a3;
}

- (OS_dispatch_source)hidingProgressBarSource
{
  return self->_hidingProgressBarSource;
}

- (void)setHidingProgressBarSource:(id)a3
{
}

- (BOOL)isExpectingScanResult
{
  return self->_isExpectingScanResult;
}

- (void)setIsExpectingScanResult:(BOOL)a3
{
  self->_isExpectingScanResult = a3;
}

- (BOOL)hasScannedSinceBeingForegrounded
{
  return self->_hasScannedSinceBeingForegrounded;
}

- (void)setHasScannedSinceBeingForegrounded:(BOOL)a3
{
  self->_hasScannedSinceBeingForegrounded = a3;
}

- (BOOL)didEnterDevicePasscode
{
  return self->_didEnterDevicePasscode;
}

- (void)setDidEnterDevicePasscode:(BOOL)a3
{
  self->_didEnterDevicePasscode = a3;
}

- (id)devicePasscodeCompletion
{
  return self->_devicePasscodeCompletion;
}

- (void)setDevicePasscodeCompletion:(id)a3
{
}

- (BOOL)isInSetupFlow
{
  return self->_inSetupFlow;
}

- (void)setInSetupFlow:(BOOL)a3
{
  self->_inSetupFlow = a3;
}

- (BOOL)unpairOnExit
{
  return self->_unpairOnExit;
}

- (void)setUnpairOnExit:(BOOL)a3
{
  self->_unpairOnExit = a3;
}

- (BOOL)presentedModally
{
  return self->_presentedModally;
}

- (void)setPresentedModally:(BOOL)a3
{
  self->_presentedModally = a3;
}

- (BOOL)launchedForTerms
{
  return self->_launchedForTerms;
}

- (void)setLaunchedForTerms:(BOOL)a3
{
  self->_launchedForTerms = a3;
}

- (BOOL)betaUpdatesChanged
{
  return self->_betaUpdatesChanged;
}

- (void)setBetaUpdatesChanged:(BOOL)a3
{
  self->_betaUpdatesChanged = a3;
}

- (UINavigationController)modalController
{
  return self->_modalController;
}

- (void)setModalController:(id)a3
{
}

- (NRDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
}

- (BOOL)hasUpdatedSuccessfully
{
  return self->_hasUpdatedSuccessfully;
}

- (void)setHasUpdatedSuccessfully:(BOOL)a3
{
  self->_hasUpdatedSuccessfully = a3;
}

- (BOOL)termsFromCloudDevice
{
  return self->_termsFromCloudDevice;
}

- (void)setTermsFromCloudDevice:(BOOL)a3
{
  self->_termsFromCloudDevice = a3;
}

- (NSMutableArray)cloudDescriptors
{
  return self->_cloudDescriptors;
}

- (void)setCloudDescriptors:(id)a3
{
}

- (BOOL)isDisplayingRevLockBootProgressIndicator
{
  return self->_isDisplayingRevLockBootProgressIndicator;
}

- (void)setIsDisplayingRevLockBootProgressIndicator:(BOOL)a3
{
  self->_isDisplayingRevLockBootProgressIndicator = a3;
}

- (double)revLockBootProgressIndicatorElapsedDuration
{
  return self->_revLockBootProgressIndicatorElapsedDuration;
}

- (void)setRevLockBootProgressIndicatorElapsedDuration:(double)a3
{
  self->_revLockBootProgressIndicatorElapsedDuration = a3;
}

- (double)revLockBootProgressIndicatorTotalDuration
{
  return self->_revLockBootProgressIndicatorTotalDuration;
}

- (void)setRevLockBootProgressIndicatorTotalDuration:(double)a3
{
  self->_revLockBootProgressIndicatorTotalDuration = a3;
}

- (int64_t)alreadyPresentedTermsForRequestType
{
  return self->_alreadyPresentedTermsForRequestType;
}

- (void)setAlreadyPresentedTermsForRequestType:(int64_t)a3
{
  self->_id alreadyPresentedTermsForRequestType = a3;
}

- (BOOL)showingTermsRequestedByWatch
{
  return self->_showingTermsRequestedByWatch;
}

- (void)setShowingTermsRequestedByWatch:(BOOL)a3
{
  self->_showingTermsRequestedByWatch = a3;
}

- (BOOL)userIsTryingToForceUpdate
{
  return self->_userIsTryingToForceUpdate;
}

- (void)setUserIsTryingToForceUpdate:(BOOL)a3
{
  self->_BOOL userIsTryingToForceUpdate = a3;
}

- (BOOL)noUpdateFoundOrIsComplete
{
  return self->_noUpdateFoundOrIsComplete;
}

- (void)setNoUpdateFoundOrIsComplete:(BOOL)a3
{
  self->_BOOL noUpdateFoundOrIsComplete = a3;
}

- (int)scanRetries
{
  return self->_scanRetries;
}

- (void)setScanRetries:(int)a3
{
  self->_int scanRetries = a3;
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (UIViewController)termsDisplayController
{
  return self->_termsDisplayController;
}

- (void)setTermsDisplayController:(id)a3
{
}

- (id)updateCompletionBlock
{
  return self->_updateCompletionBlock;
}

- (void)setUpdateCompletionBlock:(id)a3
{
}

- (NSArray)betaPrograms
{
  return self->_betaPrograms;
}

- (void)setBetaPrograms:(id)a3
{
}

- (SDBetaProgram)selectedBetaProgram
{
  return self->_selectedBetaProgram;
}

- (void)setSelectedBetaProgram:(id)a3
{
}

- (OS_dispatch_queue)seedingQueryQueue
{
  return self->_seedingQueryQueue;
}

- (void)setSeedingQueryQueue:(id)a3
{
}

- (SUBManager)subManager
{
  return self->_subManager;
}

- (void)setSubManager:(id)a3
{
}

- (BOOL)hasReceivedValidFirstScanResult
{
  return self->_hasReceivedValidFirstScanResult;
}

- (void)setHasReceivedValidFirstScanResult:(BOOL)a3
{
  self->_hasReceivedValidFirstScanResult = a3;
}

- (NSString)betaUpdatesAppleID
{
  return self->_betaUpdatesAppleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_betaUpdatesAppleID, 0);
  objc_storeStrong((id *)&self->_subManager, 0);
  objc_storeStrong((id *)&self->_seedingQueryQueue, 0);
  objc_storeStrong((id *)&self->_selectedBetaProgram, 0);
  objc_storeStrong((id *)&self->_betaPrograms, 0);
  objc_storeStrong(&self->_updateCompletionBlock, 0);
  objc_storeStrong((id *)&self->_termsDisplayController, 0);
  objc_storeStrong((id *)&self->_nssManager, 0);
  objc_storeStrong((id *)&self->_cloudDescriptors, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_modalController, 0);
  objc_storeStrong(&self->_devicePasscodeCompletion, 0);
  objc_storeStrong((id *)&self->_hidingProgressBarSource, 0);
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_termsDeviceID, 0);
  objc_storeStrong((id *)&self->_terms, 0);
  objc_storeStrong((id *)&self->_installButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_installButtonGroup, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);
  objc_storeStrong((id *)&self->_titleGroup, 0);
  objc_storeStrong((id *)&self->_updateAgreedTo, 0);
  objc_storeStrong((id *)&self->_update, 0);

  objc_storeStrong((id *)&self->_download, 0);
}

@end