@interface COSHelloAppleWatchViewController
- (BOOL)isTinkerWatch;
- (BOOL)requiresActivationCheck;
- (COSHelloAppleWatchViewController)init;
- (_TtC6Bridge34COSIllustratedWatchCursiveTextView)customWatchView;
- (id)okayButtonTitle;
- (id)titleString;
- (void)_tinkerSetupComplete;
- (void)autoDismissIfNeeded;
- (void)configureWatchView;
- (void)dealloc;
- (void)deviceIsSetup:(id)a3;
- (void)dismissSetupFlow;
- (void)setCustomWatchView:(id)a3;
- (void)setOkayButtonEnabled:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation COSHelloAppleWatchViewController

- (COSHelloAppleWatchViewController)init
{
  v28.receiver = self;
  v28.super_class = (Class)COSHelloAppleWatchViewController;
  v2 = [(COSOptinViewController *)&v28 init];
  if (v2)
  {
    v3 = pbb_setupflow_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(COSHelloAppleWatchViewController) Add Observer For NRPairedDeviceRegistryDeviceIsSetupNotification", buf, 2u);
    }

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"deviceIsSetup:" name:NRPairedDeviceRegistryDeviceIsSetupNotification object:0];
    if (PBIsInternalInstall())
    {
      v5 = +[PSListController appearance];
      unsigned __int8 v6 = [v5 usesDarkTheme];

      if ((v6 & 1) == 0)
      {
        v7 = [UIApp setupController];
        v8 = [v7 internalDashboardController];
        v9 = [v8 dashboardData];

        id v10 = objc_alloc_init((Class)NSMutableString);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v22 = v9;
        v11 = [v9 pairingEvents];
        id v12 = [v11 countByEnumeratingWithState:&v23 objects:v29 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v24;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              v17 = [v16 dashboardKey];
              v18 = [v16 eventValue];
              [v10 appendFormat:@"%@:%@,", v17, v18];
            }
            id v13 = [v11 countByEnumeratingWithState:&v23 objects:v29 count:16];
          }
          while (v13);
        }

        v19 = pbb_setupflow_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100173F50((uint64_t)v10, v19);
        }
      }
    }
    v20 = +[PSListController appearance];
    [v20 setUsesDarkTheme:1];

    [(COSHelloAppleWatchViewController *)v2 setStyle:32];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.nanosystemsettings.WatchReportedUsedOnAfterSetup", 0);
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)COSHelloAppleWatchViewController;
  [(COSHelloAppleWatchViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)COSHelloAppleWatchViewController;
  [(COSHelloAppleWatchViewController *)&v18 viewDidLoad];
  v3 = [UIApp setupController];
  v4 = [v3 pairingReportManager];

  [v4 completePairingMetricWithSuccess:1];
  id v5 = objc_alloc_init((Class)UIView);
  unsigned __int8 v6 = [(COSHelloAppleWatchViewController *)self navigationItem];
  id v7 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v5];
  [v6 setLeftBarButtonItem:v7 animated:1];

  LODWORD(v7) = [(COSHelloAppleWatchViewController *)self isTinkerWatch];
  v8 = pbb_setupflow_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setup finished for Tinker flow.", v17, 2u);
    }

    if ((PBHasSetupDevice() & 1) == 0)
    {
      id v10 = pbb_setupflow_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There are still no setup completed devices so we will block the UI for a moment while NR wraps up pairing.", v17, 2u);
      }

      [(COSHelloAppleWatchViewController *)self setOkayButtonEnabled:0];
    }
    [(COSHelloAppleWatchViewController *)self _tinkerSetupComplete];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setup finished.", v17, 2u);
    }
  }
  v11 = +[UIApplication sharedApplication];
  id v12 = [v11 bridgeController];
  [v12 stopListeningForIDSSentMessages];

  id v13 = [UIApp setupController];
  uint64_t v14 = [v13 linkUpgradeMonitor];
  [v14 resetCompanionLinkPreference];

  [(COSHelloAppleWatchViewController *)self configureWatchView];
  v15 = +[NSNotificationCenter defaultCenter];
  [v15 addObserver:self selector:"autoDismissIfNeeded" name:UIApplicationDidBecomeActiveNotification object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000C5100, @"com.apple.nanosystemsettings.WatchReportedUsedOnAfterSetup", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COSHelloAppleWatchViewController;
  [(COSHelloAppleWatchViewController *)&v6 viewDidAppear:a3];
  v4 = [UIApp setupController];
  id v5 = [v4 resumePairingController];
  [v5 clearPairingState];

  [(COSHelloAppleWatchViewController *)self autoDismissIfNeeded];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COSHelloAppleWatchViewController;
  [(COSHelloAppleWatchViewController *)&v5 viewDidDisappear:a3];
  v4 = [(COSHelloAppleWatchViewController *)self customWatchView];
  [v4 stopAnimation];
}

- (void)configureWatchView
{
  id v3 = objc_alloc((Class)UIView);
  v4 = [(COSHelloAppleWatchViewController *)self view];
  [v4 bounds];
  double v6 = v5 * 0.5;
  id v7 = [(COSHelloAppleWatchViewController *)self view];
  [v7 bounds];
  id v9 = [v3 initWithFrame:0.0, 0.0, v6, v8 * 0.5];

  id v10 = [_TtC6Bridge34COSIllustratedWatchCursiveTextView alloc];
  v11 = [UIApp setupController];
  id v12 = [v11 activePairingDevice];
  id v13 = sub_10003293C();
  uint64_t v14 = [(COSIllustratedWatchCursiveTextView *)v10 initWithBackgroundImageName:v13];
  [(COSHelloAppleWatchViewController *)self setCustomWatchView:v14];

  v15 = [(COSHelloAppleWatchViewController *)self customWatchView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(COSHelloAppleWatchViewController *)self customWatchView];
  [v16 setAllowUpScaling:1];

  [v9 frame];
  v19 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v17, v18);
  v20 = [(COSHelloAppleWatchViewController *)self customWatchView];
  [v20 setPreferredCGSizeValue:v19];

  v21 = [(COSHelloAppleWatchViewController *)self customWatchView];
  [v9 addSubview:v21];

  v22 = [(COSHelloAppleWatchViewController *)self contentView];
  [v22 addSubview:v9];

  v45 = [(COSHelloAppleWatchViewController *)self customWatchView];
  v44 = [v45 centerYAnchor];
  v43 = [v9 centerYAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v47[0] = v42;
  v41 = [(COSHelloAppleWatchViewController *)self customWatchView];
  v39 = [v41 centerXAnchor];
  v38 = [v9 centerXAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v47[1] = v37;
  v35 = [v9 topAnchor];
  v36 = [(COSHelloAppleWatchViewController *)self contentView];
  v34 = [v36 topAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v47[2] = v33;
  v40 = v9;
  long long v23 = [v9 bottomAnchor];
  long long v24 = [(COSHelloAppleWatchViewController *)self contentView];
  long long v25 = [v24 bottomAnchor];
  long long v26 = [v23 constraintEqualToAnchor:v25];
  v47[3] = v26;
  v27 = [v9 centerXAnchor];
  objc_super v28 = [(COSHelloAppleWatchViewController *)self view];
  v29 = [v28 centerXAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  v47[4] = v30;
  v31 = +[NSArray arrayWithObjects:v47 count:5];
  +[NSLayoutConstraint activateConstraints:v31];

  dispatch_time_t v32 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C567C;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_after(v32, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)isTinkerWatch
{
  v2 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
  id v3 = [v2 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)_tinkerSetupComplete
{
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v4 = (objc_class *)objc_opt_class();
    double v5 = NSStringFromClass(v4);
    int v23 = 138412546;
    long long v24 = v5;
    __int16 v25 = 2080;
    long long v26 = "-[COSHelloAppleWatchViewController _tinkerSetupComplete]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ -- %s", (uint8_t *)&v23, 0x16u);
  }
  double v6 = +[PBBridgeWatchAttributeController sharedDeviceController];
  id v7 = [v6 hardwareBehavior];

  uint64_t v8 = 16;
  if (v7 == (id)2) {
    uint64_t v8 = 14;
  }
  if (v7 == (id)1) {
    uint64_t v9 = 15;
  }
  else {
    uint64_t v9 = v8;
  }
  +[PBBridgeCAReporter incrementSuccessType:v9];
  id v10 = [UIApp activeWatch];
  v11 = pbb_setupflow_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    long long v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Telling NR to end Setup with %@.", (uint8_t *)&v23, 0xCu);
  }

  if (![(COSHelloAppleWatchViewController *)self isTinkerWatch])
  {
    id v12 = [UIApp setupController];
    [v12 tellAppConduitToInstallAllApps];
  }
  id v13 = +[NRPairedDeviceRegistry sharedInstance];
  [v13 notifyActivationCompleted:v10 withSuccess:1];

  uint64_t v14 = +[NRPairedDeviceRegistry sharedInstance];
  [v14 setWatchBuddyCompletedSetupSteps:0];

  v15 = [(COSHelloAppleWatchViewController *)self delegate];
  [v15 buddyControllerDone:self nextControllerClass:0];

  +[PBBridgeCAReporter incrementSuccessType:8];
  if ([(COSHelloAppleWatchViewController *)self isTinkerWatch]) {
    +[PBBridgeCAReporter incrementSuccessType:24];
  }
  v16 = +[UIApplication sharedApplication];
  double v17 = [v16 bridgeController];
  [v17 setShouldSuppressTransportReachabilityTimeout:1];

  double v18 = [v10 valueForProperty:NRDevicePropertySerialNumber];
  if (v18)
  {
    +[AMSDevice registerCompanionWithSerialNumber:v18];
    v19 = pbb_setupflow_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      v20 = "Notified Morocco";
      v21 = v19;
      uint32_t v22 = 2;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v23, v22);
    }
  }
  else
  {
    v19 = pbb_setupflow_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      long long v24 = v10;
      v20 = "Skipped Morocco %@";
      v21 = v19;
      uint32_t v22 = 12;
      goto LABEL_19;
    }
  }
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"APPLE_WATCH_READY_TO_GO" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)okayButtonTitle
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"DONE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)deviceIsSetup:(id)a3
{
  id v4 = a3;
  double v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(COSHelloAppleWatchViewController) Device Is Setup (Sender %@)", (uint8_t *)&v8, 0xCu);
  }

  double v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remove Observer For NRPairedDeviceRegistryDeviceIsSetupNotification", (uint8_t *)&v8, 2u);
  }

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:NRPairedDeviceRegistryDeviceIsSetupNotification object:0];

  [(COSHelloAppleWatchViewController *)self setOkayButtonEnabled:1];
}

- (BOOL)requiresActivationCheck
{
  return 0;
}

- (void)setOkayButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(COSHelloAppleWatchViewController *)self okayButton];
  [v4 setEnabled:v3];
}

- (void)autoDismissIfNeeded
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 objectForKey:@"COSWatchReportedUseAfterSetup"];

  double v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Watch reported use after Setup: %@", (uint8_t *)&v9, 0xCu);
  }

  double v6 = [(COSHelloAppleWatchViewController *)self okayButton];
  unsigned int v7 = [v6 isEnabled];

  if (v4) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    [(COSHelloAppleWatchViewController *)self dismissSetupFlow];
  }
}

- (void)dismissSetupFlow
{
  v2 = pbb_setupflow_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v6 = 138412546;
    unsigned int v7 = v4;
    __int16 v8 = 2080;
    int v9 = "-[COSHelloAppleWatchViewController dismissSetupFlow]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ -- %s, dismissing setup flow", (uint8_t *)&v6, 0x16u);
  }
  sub_100034068();
  double v5 = [UIApp setupController];
  [v5 setSetupCompletedSuccessfully:1];

  [UIApp dismissSetupFlowComplete:1 animated:1];
}

- (_TtC6Bridge34COSIllustratedWatchCursiveTextView)customWatchView
{
  return self->_customWatchView;
}

- (void)setCustomWatchView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end