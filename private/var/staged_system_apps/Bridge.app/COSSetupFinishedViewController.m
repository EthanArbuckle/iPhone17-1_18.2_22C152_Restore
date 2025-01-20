@interface COSSetupFinishedViewController
- (BOOL)_isSyncComplete;
- (BOOL)alertDismissed;
- (BOOL)controllerAllowsNavigatingBackFrom;
- (BOOL)holdBeforeDisplaying;
- (BOOL)isDeviceActivated;
- (BOOL)isRemotePreparedForInitialSync;
- (BOOL)isSyncComplete;
- (BOOL)isTinkerWatch;
- (BOOL)syncCompletedBeforeActivation;
- (BOOL)userDidAbortSync;
- (BPSIllustratedWatchView)illustratedSyncView;
- (COSDiscoverListViewController)discoverIntro;
- (COSSetupFinishedViewController)init;
- (NSArray)architectureIncompatibleApps;
- (PBBridgeProgressView)progressView;
- (PSYInitialSyncStateObserver)initialSyncStateObserver;
- (UILabel)progress;
- (double)totalProgress;
- (id)detailString;
- (id)okayButtonTitle;
- (id)titleString;
- (void)_pushToSetupFinished;
- (void)_updateProgressUI;
- (void)checkHoldReleaseConditions;
- (void)continuePairedSync;
- (void)dealloc;
- (void)determineArchitectureCompatibilityIfNeeded;
- (void)deviceBecameActive:(id)a3;
- (void)deviceIsSetup:(id)a3;
- (void)didEstablishHold;
- (void)dismissDiscoverIntro:(id)a3;
- (void)finishedActivating;
- (void)finishedInitialSyncPrep;
- (void)globalAlertPresentationCoordinator:(id)a3 dismissAlert:(unint64_t)a4 withCompletion:(id)a5;
- (void)globalAlertPresentationCoordinator:(id)a3 presentAlert:(unint64_t)a4 withCompletion:(id)a5;
- (void)globalAlertPresentationCoordinator:(id)a3 syncProgressDidUpdate:(double)a4;
- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4;
- (void)okayButtonPressed:(id)a3;
- (void)removeAllObservers;
- (void)setAlertDismissed:(BOOL)a3;
- (void)setArchitectureIncompatibleApps:(id)a3;
- (void)setDiscoverIntro:(id)a3;
- (void)setIllustratedSyncView:(id)a3;
- (void)setInitialSyncStateObserver:(id)a3;
- (void)setIsDeviceActivated:(BOOL)a3;
- (void)setIsRemotePreparedForInitialSync:(BOOL)a3;
- (void)setIsSyncComplete:(BOOL)a3;
- (void)setProgress:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setSyncCompletedBeforeActivation:(BOOL)a3;
- (void)setTotalProgress:(double)a3;
- (void)setUserDidAbortSync:(BOOL)a3;
- (void)setupSyncMonitorIfNeeded;
- (void)updateAppsIfNeededWithArchitectureIncompatibleApps:(id)a3;
- (void)updateLiveActivityProgress;
- (void)userAbortedPairing;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation COSSetupFinishedViewController

- (COSSetupFinishedViewController)init
{
  v41.receiver = self;
  v41.super_class = (Class)COSSetupFinishedViewController;
  v2 = [(COSSetupFinishedViewController *)&v41 init];
  v3 = v2;
  if (!v2) {
    return v3;
  }
  [(COSSetupFinishedViewController *)v2 setStyle:32];
  v4 = pbb_setupflow_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Add Observer For NRPairedDeviceRegistryDeviceIsSetupNotification", buf, 2u);
  }

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:v3 selector:"deviceIsSetup:" name:NRPairedDeviceRegistryDeviceIsSetupNotification object:0];
  [v5 addObserver:v3 selector:"continuePairedSync" name:@"com.apple.PreferencesApp.willBecomeActive" object:0];
  [v5 addObserver:v3 selector:"deviceBecameActive:" name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];
  id v6 = objc_alloc((Class)BPSIllustratedWatchView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
  illustratedSyncView = v3->_illustratedSyncView;
  v3->_illustratedSyncView = v10;

  v12 = +[PBBridgeWatchAttributeController sharedDeviceController];
  id v13 = [v12 size];

  if (v13 == (id)19)
  {
    v14 = sub_1000328FC(@"Screen-Blank");
    [(BPSIllustratedWatchView *)v3->_illustratedSyncView setScreenImageName:v14];
  }
  if (sub_100008380() && sub_1000323D0())
  {
    v15 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    progress = v3->_progress;
    v3->_progress = v15;

    v17 = v3->_progress;
    v18 = +[UIColor clearColor];
    [(UILabel *)v17 setBackgroundColor:v18];

    v19 = v3->_progress;
    v20 = +[UIColor whiteColor];
    [(UILabel *)v19 setTextColor:v20];

    v21 = v3->_progress;
    v22 = BPSFontWithSize();
    [(UILabel *)v21 setFont:v22];

    [(UILabel *)v3->_progress setTextAlignment:1];
    [(UILabel *)v3->_progress setNumberOfLines:0];
    [(BPSIllustratedWatchView *)v3->_illustratedSyncView addSubview:v3->_progress];
  }
  v23 = [UIApp activeWatch];
  unsigned int v24 = BPSIsDeviceCompatibleWithVersions();

  v25 = +[PBBridgeWatchAttributeController sharedDeviceController];
  id v26 = [v25 size];

  id v27 = objc_alloc((Class)PBBridgeProgressView);
  if (v26 == (id)19) {
    v28 = (PBBridgeProgressView *)[v27 initWithStyle:0 andVersion:v24];
  }
  else {
    v28 = (PBBridgeProgressView *)[v27 initWithStyle:0 andVersion:v24 overrideSize:7];
  }
  progressView = v3->_progressView;
  v3->_progressView = v28;

  [(BPSIllustratedWatchView *)v3->_illustratedSyncView addSyncTrapProgressView:v3->_progressView];
  [(PBBridgeProgressView *)v3->_progressView setHidden:1];
  if ((sub_100033EA4() & 1) == 0 && ![(COSSetupFinishedViewController *)v3 isTinkerWatch])
  {
    v31 = +[UIApplication sharedApplication];
    [v31 setSyncTrapUIEnabled:1];
    uint64_t v30 = 0;
LABEL_20:

    goto LABEL_21;
  }
  if ((PBHasSetupDevice() & 1) == 0)
  {
    v31 = pbb_setupflow_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "There are still no setup completed devices so we will block the UI for a moment while NR wraps up pairing.", buf, 2u);
    }
    uint64_t v30 = 1;
    goto LABEL_20;
  }
  uint64_t v30 = 1;
LABEL_21:
  [(COSSetupFinishedViewController *)v3 setIsSyncComplete:v30];
  v32 = +[COSGlobalAlertPresentationCoordinator sharedInstance];
  [v32 addAlertPresenterObserver:v3];

  v33 = [UIApp activeWatch];
  v34 = [v33 valueForProperty:NRDevicePropertyIsSetup];
  if ([v34 BOOLValue])
  {
    [(COSSetupFinishedViewController *)v3 deviceIsSetup:0];
  }
  else
  {
    v35 = +[NRPairedDeviceRegistry sharedInstance];
    [v35 setWatchBuddyCompletedSetupSteps:0];
  }
  if (PBIsEarlyPairedSyncSupportedForDevice())
  {
    v36 = pbb_setupflow_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Initiating sync progress fetch", buf, 2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100081C78;
    block[3] = &unk_1002438A0;
    v39 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v3;
}

- (void)removeAllObservers
{
  v3 = +[COSGlobalAlertPresentationCoordinator sharedInstance];
  [v3 removeAlertPresenterObserver:self];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)dealloc
{
  [(COSSetupFinishedViewController *)self removeAllObservers];
  v3.receiver = self;
  v3.super_class = (Class)COSSetupFinishedViewController;
  [(COSSetupFinishedViewController *)&v3 dealloc];
}

- (BOOL)holdBeforeDisplaying
{
  objc_super v3 = +[UIApplication sharedApplication];
  unsigned int v4 = [v3 isActivated];

  if (v4)
  {
    self->_isDeviceActivated = 1;
  }
  else
  {
    v5 = pbb_setupflow_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Holding (%@) because gizmo is not activated", buf, 0xCu);
    }
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"finishedActivating" name:PBBridgeGizmoDidFinishActivatingNotification object:0];
  }
  v9 = pbb_setupflow_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Holding controller to ensure Watch is ready for InitialSync.", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v10 = +[UIApplication sharedApplication];
  v11 = [v10 bridgeController];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100081F88;
  v13[3] = &unk_1002439E0;
  objc_copyWeak(&v14, (id *)buf);
  [v11 tellGizmoToPrepareForInitialSyncWithCompletion:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
  return 1;
}

- (void)didEstablishHold
{
  v2 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v2 isActivated];

  if ((v3 & 1) == 0)
  {
    id v6 = +[UIApplication sharedApplication];
    unsigned int v4 = [v6 setupController];
    v5 = [v4 activationManager];
    [v5 setAwaitingActivation:1];
  }
}

- (void)finishedActivating
{
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:PBBridgeGizmoDidFinishActivatingNotification object:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082168;
  block[3] = &unk_1002438A0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)finishedInitialSyncPrep
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082254;
  block[3] = &unk_1002438A0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)checkHoldReleaseConditions
{
  if (self->_isDeviceActivated && self->_isRemotePreparedForInitialSync)
  {
    unsigned __int8 v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Conditions met, showing sync trap", v5, 2u);
    }

    unsigned int v4 = [(COSSetupFinishedViewController *)self delegate];
    [v4 buddyControllerReleaseHold:self];
  }
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)COSSetupFinishedViewController;
  [(COSSetupFinishedViewController *)&v17 viewDidLoad];
  unsigned __int8 v3 = [(COSSetupFinishedViewController *)self contentView];
  [v3 addSubview:self->_illustratedSyncView];

  [(BPSIllustratedWatchView *)self->_illustratedSyncView setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = [(BPSIllustratedWatchView *)self->_illustratedSyncView topAnchor];
  v16 = [(COSSetupFinishedViewController *)self contentView];
  id v14 = [v16 topAnchor];
  unsigned int v4 = [v15 constraintEqualToAnchor:v14];
  v18[0] = v4;
  v5 = [(BPSIllustratedWatchView *)self->_illustratedSyncView bottomAnchor];
  id v6 = [(COSSetupFinishedViewController *)self contentView];
  v7 = [v6 bottomAnchor];
  v8 = [v5 constraintEqualToAnchor:v7];
  v18[1] = v8;
  v9 = [(BPSIllustratedWatchView *)self->_illustratedSyncView centerXAnchor];
  v10 = [(COSSetupFinishedViewController *)self contentView];
  v11 = [v10 centerXAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v18[2] = v12;
  id v13 = +[NSArray arrayWithObjects:v18 count:3];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)COSSetupFinishedViewController;
  [(COSSetupFinishedViewController *)&v17 viewDidAppear:a3];
  unsigned int v4 = [UIApp activeWatch];
  v5 = pbb_setupflow_log();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Telling NR to end Setup with %@.", buf, 0xCu);
    }

    v7 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    [v7 beginMacroActivity:@"InitialPairingPhase" beginTime:CFAbsoluteTimeGetCurrent()];

    v8 = +[PBBridgeWatchAttributeController sharedDeviceController];
    id v9 = [v8 hardwareBehavior];

    uint64_t v10 = 16;
    if (v9 == (id)2) {
      uint64_t v10 = 14;
    }
    if (v9 == (id)1) {
      uint64_t v11 = 15;
    }
    else {
      uint64_t v11 = v10;
    }
    +[PBBridgeCAReporter incrementSuccessType:v11];
    if ((PBIsEarlyPairedSyncSupportedForDevice() & 1) == 0)
    {
      v12 = pbb_setupflow_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating NR to end pairing", buf, 2u);
      }

      id v13 = [UIApp setupController];
      [v13 tellAppConduitToInstallAllApps];

      id v14 = +[NRPairedDeviceRegistry sharedInstance];
      [v14 notifyActivationCompleted:v4 withSuccess:1];
    }
    +[PBBridgeCAReporter incrementSuccessType:8];
    if ([(COSSetupFinishedViewController *)self isTinkerWatch]) {
      +[PBBridgeCAReporter incrementSuccessType:24];
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100172AF4();
    }

    [UIApp resetSetupFlowAnimated:1 forEvent:47];
  }
  v15 = [UIApp setupController];
  v16 = [v15 resumePairingController];
  [v16 clearPairingState];
}

- (void)setIsSyncComplete:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = pbb_setup_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithBool:self->_isSyncComplete];
    double v7 = +[NSNumber numberWithBool:v3];
    v8 = +[NSNumber numberWithBool:self->_userDidAbortSync];
    int v41 = 138412802;
    double v42 = *(double *)&v6;
    __int16 v43 = 2112;
    double v44 = v7;
    __int16 v45 = 2112;
    v46 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SyncComplete State Changed from %@ to %@ (userDidAbortSync: %@)", (uint8_t *)&v41, 0x20u);
  }
  if (v3)
  {
    id v9 = +[UIApplication sharedApplication];
    unsigned __int8 v10 = [v9 isActivated];

    if (v10)
    {
      if (self->_isSyncComplete)
      {
        uint64_t v11 = pbb_setupflow_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v41) = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "We already think that sync has completed!", (uint8_t *)&v41, 2u);
        }
LABEL_27:

        v37 = [UIApp setupController];
        v38 = [v37 linkUpgradeMonitor];
        [v38 resetCompanionLinkPreference];

        v39 = [UIApp setupController];
        v40 = [v39 resumePairingController];
        [v40 clearPairingState];

        [(COSSetupFinishedViewController *)self _pushToSetupFinished];
        self->_BOOL isSyncComplete = 1;
        return;
      }
      v21 = +[UIApplication sharedApplication];
      v22 = [v21 bridgeController];
      [v22 setShouldSuppressTransportReachabilityTimeout:1];

      uint64_t v11 = [UIApp activeWatch];
      v23 = [v11 valueForProperty:NRDevicePropertySerialNumber];
      if (v23)
      {
        +[AMSDevice registerCompanionWithSerialNumber:v23];
        unsigned int v24 = pbb_setupflow_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v41) = 0;
          v25 = "Notified Morocco";
          id v26 = v24;
          uint32_t v27 = 2;
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v41, v27);
        }
      }
      else
      {
        unsigned int v24 = pbb_setupflow_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          int v41 = 138412290;
          double v42 = *(double *)&v11;
          v25 = "Skipped Morocco %@";
          id v26 = v24;
          uint32_t v27 = 12;
          goto LABEL_23;
        }
      }

      v28 = +[COSGlobalAlertPresentationCoordinator sharedInstance];
      [v28 removeAlertPresenterObserver:self];

      v29 = +[UIApplication sharedApplication];
      [v29 setSyncTrapUIEnabled:0];

      uint64_t v30 = +[UIApplication sharedApplication];
      [v30 setSyncTrapUICompleted:1];

      v31 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
      [v31 endMacroActivity:@"InitialPairingPhase" beginTime:CFAbsoluteTimeGetCurrent()];
      double v33 = v32;

      v34 = pbb_setupflow_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        int v41 = 134218240;
        double v42 = v33;
        __int16 v43 = 2048;
        double v44 = v33 / 60.0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "SyncTrapped For: %f seconds (%f minutes)", (uint8_t *)&v41, 0x16u);
      }

      v35 = +[UIApplication sharedApplication];
      v36 = [v35 bridgeController];
      [v36 stopListeningForIDSSentMessages];

      goto LABEL_27;
    }
    v18 = pbb_setup_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v41) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Tried to set sync complete before activation is completed, waiting for activation.", (uint8_t *)&v41, 2u);
    }

    self->_syncCompletedBeforeActivation = 1;
    v19 = [UIApp setupController];
    v20 = [v19 linkUpgradeMonitor];
    [v20 resetCompanionLinkPreference];
  }
  else
  {
    BOOL isSyncComplete = self->_isSyncComplete;
    id v13 = pbb_setupflow_log();
    id v14 = v13;
    if (isSyncComplete)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100172B28();
      }

      v15 = +[COSGlobalAlertPresentationCoordinator sharedInstance];
      [v15 addAlertPresenterObserver:self];

      v16 = +[UIApplication sharedApplication];
      [v16 setSyncTrapUIEnabled:1];

      objc_super v17 = +[UIApplication sharedApplication];
      [v17 setSyncTrapUICompleted:0];

      self->_BOOL isSyncComplete = 0;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v41) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Setting isSyncComplete to NO", (uint8_t *)&v41, 2u);
      }

      [(PBBridgeProgressView *)self->_progressView setHidden:0];
    }
  }
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"WATCH_IS_SYNCING" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"SYNC_DETAIL" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)okayButtonTitle
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"DISCOVER_IN_SETUP" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)okayButtonPressed:(id)a3
{
  unsigned int v4 = objc_alloc_init(COSDiscoverListViewController);
  discoverIntro = self->_discoverIntro;
  self->_discoverIntro = v4;

  id v6 = self->_discoverIntro;
  double v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"DISCOVER" value:&stru_100249230 table:@"Localizable"];
  [(COSDiscoverListViewController *)v6 setTitle:v8];

  id v12 = [objc_alloc((Class)UINavigationController) initWithRootViewController:self->_discoverIntro];
  id v9 = [v12 navigationBar];
  [v9 setPrefersLargeTitles:1];

  id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"dismissDiscoverIntro:"];
  uint64_t v11 = [(COSDiscoverListViewController *)self->_discoverIntro navigationItem];
  [v11 setRightBarButtonItem:v10];

  +[BCCAReporter incrementDiscoverSuccessType:12];
  [(COSSetupFinishedViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)dismissDiscoverIntro:(id)a3
{
  discoverIntro = self->_discoverIntro;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100083048;
  v4[3] = &unk_1002438A0;
  v4[4] = self;
  [(COSDiscoverListViewController *)discoverIntro dismissViewControllerAnimated:1 completion:v4];
}

- (void)continuePairedSync
{
  [(COSSetupFinishedViewController *)self setupSyncMonitorIfNeeded];
  self->_totalProgress = (float)((float)PBPairingGlobalProgress() / 100.0);
  uint64_t v3 = PBPairedSyncCompleteState();
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  unsigned int v4 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  v5 = [v4 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v3 == 2) {
    char v7 = v6;
  }
  else {
    char v7 = 1;
  }
  if (v7)
  {
    *((unsigned char *)v20 + 24) = v3 == 1;
  }
  else
  {
    v8 = [UIApp activeWatch];
    id v9 = [v8 valueForProperty:NRDevicePropertyPairingID];

    if (v9)
    {
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      initialSyncStateObserver = self->_initialSyncStateObserver;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10008331C;
      v16[3] = &unk_1002453F8;
      v18 = &v19;
      id v12 = v10;
      objc_super v17 = v12;
      [(PSYInitialSyncStateObserver *)initialSyncStateObserver requestInitialSyncStateForPairingIdentifier:v9 completion:v16];
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  id v13 = pbb_setupflow_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = +[NSNumber numberWithDouble:self->_totalProgress];
    v15 = +[NSNumber numberWithBool:*((unsigned __int8 *)v20 + 24)];
    *(_DWORD *)buf = 138412546;
    unsigned int v24 = v14;
    __int16 v25 = 2112;
    id v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "continuePairedSync (_totalProgress %@ isSyncComplete %@)", buf, 0x16u);
  }
  [(COSSetupFinishedViewController *)self _updateProgressUI];
  [(COSSetupFinishedViewController *)self setIsSyncComplete:*((unsigned __int8 *)v20 + 24)];

  _Block_object_dispose(&v19, 8);
}

- (void)_pushToSetupFinished
{
  uint64_t v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Trying to push setup finished controller.", buf, 2u);
  }

  [(COSSetupFinishedViewController *)self removeAllObservers];
  unsigned int v4 = [(COSSetupFinishedViewController *)self delegate];
  v5 = [v4 topBuddyController];

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned __int8 v6 = pbb_setupflow_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "We are already displaying setup finished controller. Don't push it again.", v8, 2u);
    }
  }
  else
  {
    char v7 = pbb_setupflow_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Pushing setup finished controller.", v9, 2u);
    }

    unsigned __int8 v6 = [(COSSetupFinishedViewController *)self delegate];
    [v6 buddyControllerDone:self nextControllerClass:objc_opt_class()];
  }
}

- (void)setupSyncMonitorIfNeeded
{
  if (!self->_initialSyncStateObserver)
  {
    uint64_t v3 = (PSYInitialSyncStateObserver *)objc_alloc_init((Class)PSYInitialSyncStateObserver);
    initialSyncStateObserver = self->_initialSyncStateObserver;
    self->_initialSyncStateObserver = v3;

    [(PSYInitialSyncStateObserver *)self->_initialSyncStateObserver setDelegate:self];
  }
  v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = +[NSNumber numberWithDouble:self->_totalProgress];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Created: Sync State was %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "initialSyncStateObserver:syncDidCompleteForPairingIdentifier:", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000836F4;
  v8[3] = &unk_100243908;
  id v9 = v5;
  dispatch_semaphore_t v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (BOOL)isTinkerWatch
{
  v2 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  uint64_t v3 = [v2 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)deviceIsSetup:(id)a3
{
  id v4 = a3;
  id v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device Is Setup(Sender %@)", buf, 0xCu);
  }

  unsigned __int8 v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remove Observer For NRPairedDeviceRegistryDeviceIsSetupNotification", buf, 2u);
  }

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:NRPairedDeviceRegistryDeviceIsSetupNotification object:0];

  v8 = [UIApp bridgeController];
  unsigned int v9 = [v8 isTinkerPairing];

  if (v9)
  {
    dispatch_semaphore_t v10 = pbb_setupflow_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "Tinker pairing, skipping sync.";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    }
  }
  else
  {
    if (!sub_100033EA4())
    {
      [(COSSetupFinishedViewController *)self setupSyncMonitorIfNeeded];
      goto LABEL_14;
    }
    dispatch_semaphore_t v10 = pbb_setupflow_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "NR has notified us that we did Pair! Unblocking UI and Skipping Sync Monitor Creation.";
      goto LABEL_11;
    }
  }

  [(COSSetupFinishedViewController *)self _pushToSetupFinished];
LABEL_14:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100083A9C;
  block[3] = &unk_1002438A0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_isSyncComplete
{
  uint64_t v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[NSNumber numberWithBool:self->_userDidAbortSync];
    id v5 = +[NSNumber numberWithDouble:self->_totalProgress];
    unsigned __int8 v6 = +[NSNumber numberWithBool:self->_alertDismissed];
    int v8 = 138412802;
    unsigned int v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_isSyncComplete? userDidAbortSync (%@) _totalProgress (%@) || _alertDismissed (%@)", (uint8_t *)&v8, 0x20u);
  }
  return !self->_userDidAbortSync && (self->_totalProgress >= 1.0 || self->_alertDismissed);
}

- (void)_updateProgressUI
{
  [(PBBridgeProgressView *)self->_progressView setCurrentProgress:self->_totalProgress];
  if (!self->_isSyncComplete) {
    [(COSSetupFinishedViewController *)self updateLiveActivityProgress];
  }
  if (PBIsInternalInstall())
  {
    illustratedSyncView = self->_illustratedSyncView;
    progress = self->_progress;
    [(BPSIllustratedWatchView *)illustratedSyncView bringSubviewToFront:progress];
  }
}

- (BOOL)controllerAllowsNavigatingBackFrom
{
  return 0;
}

- (void)userAbortedPairing
{
  uint64_t v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100172BFC();
  }

  [(COSSetupFinishedViewController *)self removeAllObservers];
  id v4 = [UIApp activeWatch];
  id v5 = [v4 valueForProperty:NRDevicePropertyIsPaired];
  unsigned int v6 = [v5 BOOLValue];

  unsigned int v7 = [UIApp isActivated];
  self->_userDidAbortSync = 1;
  int v8 = v6 | v7;
  unsigned int v9 = pbb_setupflow_log();
  __int16 v10 = v9;
  if (v4) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100172BC8();
    }

    __int16 v12 = +[NRPairedDeviceRegistry sharedInstance];
    [v12 abortPairingWithReason:NRPairedDeviceRegistryAbortPairingUserRequested];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User Reset Buddy! - Unpairing", v17, 2u);
    }

    v18[0] = @"obliterate";
    v18[1] = @"BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2";
    v19[0] = &__kCFBooleanTrue;
    v19[1] = &__kCFBooleanTrue;
    __int16 v12 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    id v14 = [UIApp setupController];
    v15 = [v14 pairingReportManager];

    [v15 addPairingTimeEventToPairingReportPlist:1 withValue:&__kCFBooleanTrue withError:0];
    [v15 completePairingMetricWithSuccess:0];
    v16 = +[NRPairedDeviceRegistry sharedInstance];
    [v16 unpairWithDevice:v4 withOptions:v12 operationHasBegun:&stru_100245418];
  }
  +[PBBridgeCAReporter incrementSuccessType:42];
}

- (void)deviceBecameActive:(id)a3
{
  uint64_t v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(COSSetupFinishedViewController) Active Watch Changed during SyncTrap.", v4, 2u);
  }
}

- (void)globalAlertPresentationCoordinator:(id)a3 syncProgressDidUpdate:(double)a4
{
  unsigned int v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = +[NSThread currentThread];
    *(_DWORD *)buf = 138412290;
    __int16 v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(COSInitialSyncMonitor) %@", buf, 0xCu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000840D8;
  v8[3] = &unk_1002437D0;
  *(double *)&v8[5] = a4;
  void v8[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)globalAlertPresentationCoordinator:(id)a3 presentAlert:(unint64_t)a4 withCompletion:(id)a5
{
  unsigned int v6 = (void (**)(void))a5;
  unsigned int v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = +[NSNumber numberWithUnsignedInteger:a4];
    int v9 = 138412290;
    __int16 v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(COSSetupFinishedViewController) presentAlert: %@", (uint8_t *)&v9, 0xCu);
  }
  v6[2](v6);
}

- (void)globalAlertPresentationCoordinator:(id)a3 dismissAlert:(unint64_t)a4 withCompletion:(id)a5
{
  id v7 = a5;
  int v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = +[NSNumber numberWithUnsignedInteger:a4];
    __int16 v10 = +[NSNumber numberWithInt:!self->_userDidAbortSync];
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(COSSetupFinishedViewController) dismissAlert: %@ (%@)", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000844D0;
  block[3] = &unk_100243730;
  id v13 = v7;
  unint64_t v14 = a4;
  void block[4] = self;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)determineArchitectureCompatibilityIfNeeded
{
  uint64_t v3 = +[ACXDeviceConnection sharedDeviceConnection];
  id v4 = [UIApp activeWatch];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100084684;
  v5[3] = &unk_100244CE0;
  v5[4] = self;
  [v3 getAlwaysInstallForPairedDevice:v4 completion:v5];
}

- (void)updateAppsIfNeededWithArchitectureIncompatibleApps:(id)a3
{
  id v3 = a3;
  id v4 = [UIApp activeWatch];
  int HasCapabilityForString = BPSDeviceHasCapabilityForString();

  unsigned int v6 = pbb_setup_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!HasCapabilityForString)
  {
    if (!v7) {
      goto LABEL_38;
    }
    *(_WORD *)buf = 0;
    char v22 = "Skip 32->64 flow";
    goto LABEL_30;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "32->64 flow matters", buf, 2u);
  }

  if (![v3 count])
  {
    v23 = pbb_setup_log();
    unsigned int v6 = v23;
    if (v3)
    {
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      char v22 = "No apps to update";
    }
    else
    {
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR) || !os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      char v22 = "nil architectureIncompatibleApps!";
    }
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
    goto LABEL_38;
  }
  unsigned int v6 = objc_alloc_init((Class)NSMutableArray);
  int v8 = pbb_setup_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Has incompatible apps...", buf, 2u);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v24 = v3;
  id v9 = v3;
  id v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    uint64_t v13 = ACXContainerAppBundleIdKey;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v16 = [v15 objectForKeyedSubscript:v13];
        if (v16)
        {
          [v6 addObject:v16];
        }
        else
        {
          __int16 v17 = pbb_setup_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No container bundleID for %@", buf, 0xCu);
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v11);
  }

  if ([v6 count])
  {
    id v25 = 0;
    unsigned int v18 = +[ASDUpdateWatchApps updateBundleIDs:v6 userInitiated:0 error:&v25];
    id v19 = v25;
    v20 = v19;
    id v3 = v24;
    if (!v18 || v19)
    {
      uint64_t v21 = pbb_setup_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Error forcing updates: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v3 = v24;
  }
LABEL_38:
}

- (double)totalProgress
{
  return self->_totalProgress;
}

- (void)setTotalProgress:(double)a3
{
  self->_totalProgress = a3;
}

- (BOOL)isDeviceActivated
{
  return self->_isDeviceActivated;
}

- (void)setIsDeviceActivated:(BOOL)a3
{
  self->_isDeviceActivated = a3;
}

- (BOOL)isRemotePreparedForInitialSync
{
  return self->_isRemotePreparedForInitialSync;
}

- (void)setIsRemotePreparedForInitialSync:(BOOL)a3
{
  self->_isRemotePreparedForInitialSync = a3;
}

- (BOOL)syncCompletedBeforeActivation
{
  return self->_syncCompletedBeforeActivation;
}

- (void)setSyncCompletedBeforeActivation:(BOOL)a3
{
  self->_syncCompletedBeforeActivation = a3;
}

- (BOOL)isSyncComplete
{
  return self->_isSyncComplete;
}

- (PBBridgeProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (BPSIllustratedWatchView)illustratedSyncView
{
  return self->_illustratedSyncView;
}

- (void)setIllustratedSyncView:(id)a3
{
}

- (UILabel)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (BOOL)alertDismissed
{
  return self->_alertDismissed;
}

- (void)setAlertDismissed:(BOOL)a3
{
  self->_alertDismissed = a3;
}

- (BOOL)userDidAbortSync
{
  return self->_userDidAbortSync;
}

- (void)setUserDidAbortSync:(BOOL)a3
{
  self->_userDidAbortSync = a3;
}

- (PSYInitialSyncStateObserver)initialSyncStateObserver
{
  return self->_initialSyncStateObserver;
}

- (void)setInitialSyncStateObserver:(id)a3
{
}

- (NSArray)architectureIncompatibleApps
{
  return self->_architectureIncompatibleApps;
}

- (void)setArchitectureIncompatibleApps:(id)a3
{
}

- (COSDiscoverListViewController)discoverIntro
{
  return self->_discoverIntro;
}

- (void)setDiscoverIntro:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoverIntro, 0);
  objc_storeStrong((id *)&self->_architectureIncompatibleApps, 0);
  objc_storeStrong((id *)&self->_initialSyncStateObserver, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_illustratedSyncView, 0);

  objc_storeStrong((id *)&self->_progressView, 0);
}

- (void)updateLiveActivityProgress
{
  v2 = self;
  sub_100134184();
}

@end