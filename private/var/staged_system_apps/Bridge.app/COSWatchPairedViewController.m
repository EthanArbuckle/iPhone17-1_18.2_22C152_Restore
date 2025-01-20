@interface COSWatchPairedViewController
- (BOOL)completedIntroAnimation;
- (BOOL)leftWristSelected;
- (BOOL)rightCrownSelected;
- (COSAnimatedInsigniaWatchView)insigniaWatchView;
- (COSSetupController)setupController;
- (COSWatchPairedViewController)init;
- (NRDevice)observedDevice;
- (UIActivityIndicatorView)spinner;
- (UINotificationFeedbackGenerator)successBehavior;
- (id)alternateButtonTitle;
- (id)suggestedButtonTitle;
- (id)titleString;
- (unint64_t)backupStatus;
- (void)_continueRestoring;
- (void)_continueSetupAsNew;
- (void)_madeWristOnLeftSelection:(BOOL)a3 crownOnRightSelection:(BOOL)a4;
- (void)alternateButtonPressed:(id)a3;
- (void)backupsChanged:(unint64_t)a3;
- (void)dealloc;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)outroAnimationFinished:(id)a3;
- (void)processWristDetectionResults;
- (void)refreshBackupStatus;
- (void)setBackupStatus:(unint64_t)a3;
- (void)setCompletedIntroAnimation:(BOOL)a3;
- (void)setInsigniaWatchView:(id)a3;
- (void)setLeftWristSelected:(BOOL)a3;
- (void)setObservedDevice:(id)a3;
- (void)setRightCrownSelected:(BOOL)a3;
- (void)setSetupController:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setSuccessBehavior:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSWatchPairedViewController

- (COSWatchPairedViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSWatchPairedViewController;
  v2 = [(COSWatchPairedViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSWatchPairedViewController *)v2 setStyle:6];
  }
  return v3;
}

- (void)dealloc
{
  observedDevice = self->_observedDevice;
  uint64_t v6 = NRDevicePropertyLocalPairingDataStorePath;
  v4 = +[NSArray arrayWithObjects:&v6 count:1];
  [(NRDevice *)observedDevice removePropertyObserver:self forPropertyChanges:v4];

  v5.receiver = self;
  v5.super_class = (Class)COSWatchPairedViewController;
  [(COSWatchPairedViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v40.receiver = self;
  v40.super_class = (Class)COSWatchPairedViewController;
  [(COSWatchPairedViewController *)&v40 viewDidLoad];
  self->_completedIntroAnimation = 0;
  v3 = objc_alloc_init(COSAnimatedInsigniaWatchView);
  insigniaWatchView = self->_insigniaWatchView;
  self->_insigniaWatchView = v3;

  objc_super v5 = [(COSWatchPairedViewController *)self contentView];
  [v5 addSubview:self->_insigniaWatchView];

  [(COSAnimatedInsigniaWatchView *)self->_insigniaWatchView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v6 = [(COSAnimatedInsigniaWatchView *)self->_insigniaWatchView topAnchor];
  v7 = [(COSWatchPairedViewController *)self contentView];
  v8 = [v7 topAnchor];
  v9 = [v6 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [(COSAnimatedInsigniaWatchView *)self->_insigniaWatchView bottomAnchor];
  v11 = [(COSWatchPairedViewController *)self contentView];
  v12 = [v11 bottomAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [(COSAnimatedInsigniaWatchView *)self->_insigniaWatchView centerXAnchor];
  v15 = [(COSWatchPairedViewController *)self view];
  v16 = [v15 centerXAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  spinner = self->_spinner;
  self->_spinner = v18;

  [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
  v20 = [(COSWatchPairedViewController *)self view];
  [v20 addSubview:self->_spinner];

  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = [(UIActivityIndicatorView *)self->_spinner bottomAnchor];
  v22 = [(COSWatchPairedViewController *)self view];
  v23 = [v22 bottomAnchor];
  v24 = [v21 constraintEqualToAnchor:v23 constant:-44.0];
  [v24 setActive:1];

  v25 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
  v26 = [(COSWatchPairedViewController *)self view];
  v27 = [v26 centerXAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  v29 = +[COSBackupManager sharedBackupManager];
  [v29 setDelegate:self];

  if (_os_feature_enabled_impl())
  {
    v30 = +[COSBackupManager sharedBackupManager];
    v31 = [v30 compatiblePairedDevices];
    id v32 = [v31 count];

    if (v32)
    {
      v33 = pbb_bridge_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Paired device detected, entering express mode", v39, 2u);
      }

      v34 = [(COSWatchPairedViewController *)self setupController];
      [v34 setExpressMode:1];
    }
  }
  id v35 = objc_alloc((Class)UINotificationFeedbackGenerator);
  v36 = [(COSWatchPairedViewController *)self view];
  v37 = (UINotificationFeedbackGenerator *)[v35 initWithCoordinateSpace:v36];
  successBehavior = self->_successBehavior;
  self->_successBehavior = v37;

  [(UINotificationFeedbackGenerator *)self->_successBehavior activateWithCompletionBlock:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v31.receiver = self;
  v31.super_class = (Class)COSWatchPairedViewController;
  [(COSWatchPairedViewController *)&v31 viewWillAppear:a3];
  v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL completedIntroAnimation = self->_completedIntroAnimation;
    *(_DWORD *)buf = 136315394;
    v33 = "-[COSWatchPairedViewController viewWillAppear:]";
    __int16 v34 = 1024;
    LODWORD(v35) = completedIntroAnimation;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s, completedIntroAnimation: %i", buf, 0x12u);
  }

  uint64_t v6 = +[UIApplication sharedApplication];
  v7 = [v6 activeWatch];

  v8 = [(COSWatchPairedViewController *)self setupController];
  [v8 updateActivePairingDevice:v7];

  v9 = +[COSBackupManager sharedBackupManager];
  v10 = [v9 minWatchOSVersion];

  if (!v10)
  {
    v11 = [v7 valueForProperty:NRDevicePropertySystemVersion];
    v12 = pbb_bridge_log();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "-[COSWatchPairedViewController viewWillAppear:]";
        __int16 v34 = 2112;
        id v35 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s, setting backups min watchOS version to: %@", buf, 0x16u);
      }

      v13 = +[COSBackupManager sharedBackupManager];
      [v13 setMinWatchOSVersion:v11];
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[COSWatchPairedViewController viewWillAppear:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: ERROR: no minimum watchOS version is being provided to COSBackupManager", buf, 0xCu);
    }
  }
  [(COSWatchPairedViewController *)self refreshBackupStatus];
  if (!self->_completedIntroAnimation)
  {
    v14 = [(COSWatchPairedViewController *)self buttonTray];
    [v14 setAlpha:0.0];

    v15 = [(COSWatchPairedViewController *)self spinner];
    [v15 setAlpha:0.0];

    [(UINotificationFeedbackGenerator *)self->_successBehavior notificationOccurred:0];
    [(COSWatchPairedViewController *)self processWristDetectionResults];
    objc_initWeak((id *)buf, self);
    dispatch_time_t v16 = dispatch_time(0, 2000000000);
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    v27 = sub_1000E9660;
    v28 = &unk_100243D28;
    objc_copyWeak(&v30, (id *)buf);
    v29 = self;
    dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, &v25);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  [UIApp setupController:v25, v26, v27, v28];
  v18 = [v17 pairingCompatiblity];
  unsigned __int8 v19 = [v18 failSafeUpdateRequested];

  v20 = +[NRPairedDeviceRegistry sharedInstance];
  LODWORD(v18) = [v20 compatibilityState];

  if (v18 == 3 && (v19 & 1) == 0)
  {
    v21 = pbb_setupflow_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "NR is now in configure state, we can't allow navigating back to the skipped update pane.", buf, 2u);
    }

    v22 = [UIApp setupController];
    [v22 blockGoingBackFromCurrentController];
  }
  v23 = [(COSWatchPairedViewController *)self setupController];
  v24 = [v23 resumePairingController];
  [v24 didConnectToWatch:v7];
}

- (void)outroAnimationFinished:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_1000E9ABC;
  v9 = &unk_1002439E0;
  objc_copyWeak(&v10, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v6);
  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:@"COSOutroAnimationFinishedNotification"];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)titleString
{
  v2 = [UIApp bridgeController];
  unsigned int v3 = [v2 isTinkerPairing];

  id v4 = +[NSBundle mainBundle];
  objc_super v5 = v4;
  if (v3)
  {
    CFStringRef v6 = @"GIZMO_PAIRED_TINKER";
    CFStringRef v7 = @"Localizable-tinker";
  }
  else
  {
    CFStringRef v6 = @"GIZMO_PAIRED";
    CFStringRef v7 = @"Localizable";
  }
  v8 = [v4 localizedStringForKey:v6 value:&stru_100249230 table:v7];

  return v8;
}

- (id)suggestedButtonTitle
{
  unint64_t backupStatus = self->_backupStatus;
  if (backupStatus == 1)
  {
    unsigned int v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"RESTORE_BACKUP" value:&stru_100249230 table:@"Localizable"];
    CFStringRef v7 = +[NSString stringWithFormat:v4];
    goto LABEL_5;
  }
  if (backupStatus == 2)
  {
    unsigned int v3 = +[NSBundle mainBundle];
    id v4 = [v3 localizedStringForKey:@"SETUP_%@" value:&stru_100249230 table:@"Localizable"];
    objc_super v5 = +[NSBundle mainBundle];
    CFStringRef v6 = [v5 localizedStringForKey:@"APPLE_WATCH_ALL_STRING" value:&stru_100249230 table:@"Localizable"];
    CFStringRef v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

LABEL_5:
    goto LABEL_7;
  }
  CFStringRef v7 = 0;
LABEL_7:

  return v7;
}

- (id)alternateButtonTitle
{
  if (self->_backupStatus == 1)
  {
    v2 = +[NSBundle mainBundle];
    unsigned int v3 = [v2 localizedStringForKey:@"SETUP_NEW_%@" value:&stru_100249230 table:@"Localizable"];
    id v4 = +[NSBundle mainBundle];
    objc_super v5 = [v4 localizedStringForKey:@"APPLE_WATCH_ALL_STRING" value:&stru_100249230 table:@"Localizable"];
    CFStringRef v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);
  }
  else
  {
    CFStringRef v6 = 0;
  }

  return v6;
}

- (void)suggestedButtonPressed:(id)a3
{
  if (self->_backupStatus == 1) {
    [(COSWatchPairedViewController *)self _continueRestoring];
  }
  else {
    [(COSWatchPairedViewController *)self _continueSetupAsNew];
  }
}

- (void)alternateButtonPressed:(id)a3
{
}

- (void)_continueRestoring
{
  unsigned int v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[COSWatchPairedViewController _continueRestoring]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [UIApp setupController];
  objc_super v5 = [v4 pairingReportManager];

  [v5 addPairingTimeEventToPairingReportPlist:11 withValue:&__kCFBooleanTrue withError:0];
  CFStringRef v6 = [(COSWatchPairedViewController *)self delegate];
  [v6 buddyControllerDone:self nextControllerClass:objc_opt_class()];
}

- (void)_continueSetupAsNew
{
  unsigned int v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[COSWatchPairedViewController _continueSetupAsNew]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  id v4 = [UIApp setupController];
  objc_super v5 = [v4 linkUpgradeMonitor];
  [v5 indicateBackupRestoreStepCompleted];

  CFStringRef v6 = [(COSWatchPairedViewController *)self setupController];
  LODWORD(v5) = [v6 wristChoicesDetected];

  int v7 = [(COSWatchPairedViewController *)self delegate];
  v8 = v7;
  if (v5)
  {
    [v7 buddyControllerDone:self nextControllerClass:objc_opt_class()];

    if (!PBLogPerformanceMetrics()) {
      return;
    }
    v8 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    [v8 beginMacroActivity:@"COSPostWristChoiceUserWaitPhase" beginTime:CFAbsoluteTimeGetCurrent()];
  }
  else
  {
    [v7 buddyControllerDone:self];
  }
}

- (void)processWristDetectionResults
{
  unsigned int v3 = [UIApp setupController];
  id v4 = [v3 visualDetector];

  objc_super v5 = [v4 confidenceSummary];
  CFStringRef v6 = [(COSWatchPairedViewController *)self setupController];
  [v6 setWristChoicesDetected:0];

  if ((unint64_t)[v5 attribute] >= 5)
  {
    int v7 = [(COSWatchPairedViewController *)self setupController];
    [v7 setWristChoicesDetected:1];

    v8 = (char *)[v5 attribute];
    if ((unint64_t)(v8 - 5) <= 3)
    {
      char v9 = 8 * ((_BYTE)v8 - 5);
      self->_leftWristSelected = 0x101u >> v9;
      self->_rightCrownSelected = 0x10001u >> v9;
    }
    id v10 = pbb_setupflow_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = +[NSNumber numberWithBool:self->_leftWristSelected];
      v12 = +[NSNumber numberWithBool:self->_rightCrownSelected];
      int v19 = 138412546;
      v20 = v11;
      __int16 v21 = 2112;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Detected Wrist: %@ // Crown: %@", (uint8_t *)&v19, 0x16u);
    }
    [(COSWatchPairedViewController *)self _madeWristOnLeftSelection:self->_leftWristSelected crownOnRightSelection:self->_rightCrownSelected];
    if (!sub_10003245C())
    {
      v13 = +[COSInternalUserStudyDataManager sharedManager];
      [v13 setDetectedWristChoice:!self->_leftWristSelected];

      v14 = +[COSInternalUserStudyDataManager sharedManager];
      [v14 setDetectedCrownChoice:!self->_rightCrownSelected];
    }
    goto LABEL_12;
  }
  if ([v5 attribute] == (id)1)
  {
    PBBridgeCAReporterIncrementSuccessType();
    v15 = +[COSInternalUserStudyDataManager sharedManager];
    dispatch_time_t v16 = v15;
    uint64_t v17 = 4;
    goto LABEL_17;
  }
  if ([v5 attribute] != (id)4)
  {
    if ([v5 attribute] == (id)3)
    {
      PBBridgeCAReporterIncrementSuccessType();
      v15 = +[COSInternalUserStudyDataManager sharedManager];
      dispatch_time_t v16 = v15;
      uint64_t v17 = 5;
    }
    else
    {
      if ([v5 attribute] != (id)2) {
        goto LABEL_18;
      }
      PBBridgeCAReporterIncrementSuccessType();
      v15 = +[COSInternalUserStudyDataManager sharedManager];
      dispatch_time_t v16 = v15;
      uint64_t v17 = 2;
    }
LABEL_17:
    [v15 setDetectedWristChoice:v17];

    goto LABEL_18;
  }
LABEL_12:
  PBBridgeCAReporterIncrementSuccessType();
LABEL_18:
  v18 = +[COSInternalUserStudyDataManager sharedManager];
  [v5 confidence];
  [v18 setConfidence:];
}

- (void)_madeWristOnLeftSelection:(BOOL)a3 crownOnRightSelection:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v33 = v5;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[ML Flow] Set Orientation Choice: Wrist on Left: %{BOOL}d, Crown on Right: %{BOOL}d", buf, 0xEu);
  }

  v8 = [UIApp setupController];
  char v9 = [v8 pairingReportManager];

  id v10 = +[NSNumber numberWithBool:v5];
  [v9 addPairingTimeEventToPairingReportPlist:10 withValue:v10 withError:0];

  [v9 addPairingTimeEventToPairingReportPlist:11 withValue:&__kCFBooleanFalse withError:0];
  if (sub_100032540())
  {
    v11 = +[COSInternalUserStudyDataManager sharedManager];
    [v11 setWristChoice:v5 ^ 1];
  }
  else
  {
    v12 = +[UIApplication sharedApplication];
    v11 = [v12 activeWatch];

    v13 = [v11 valueForProperty:NRDevicePropertyPairingID];
    uint64_t v14 = NRDevicePropertyLocalPairingDataStorePath;
    v15 = [v11 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
    dispatch_time_t v16 = [v11 valueForProperty:NRDevicePropertyProductType];
    if (NRDeviceSizeForProductType() - 7 >= 3)
    {
      int v19 = pbb_setupflow_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)v33 = "-[COSWatchPairedViewController _madeWristOnLeftSelection:crownOnRightSelection:]";
        *(_WORD *)&v33[8] = 2112;
        __int16 v34 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Device is eligible for BeamBridge: %@", buf, 0x16u);
      }

      if (v15)
      {
        v18 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nano" pairingID:v13 pairingDataStore:v15];
        [v18 setBool:v5 ^ 1 forKey:@"wornOnRightArm"];
        [v18 setBool:v4 ^ 1 forKey:@"invertUI"];
        id v20 = [v18 synchronize];
        if (v5) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = 2;
        }
        +[PBBridgeCAReporter recordPairingInitiatedDeviceWristChoice:v21 pairingSelectionType:2];
        if (v4) {
          uint64_t v22 = 1;
        }
        else {
          uint64_t v22 = 2;
        }
        +[PBBridgeCAReporter recordPairingInitiatedDeviceOrientationChoice:v22 pairingSelectionType:2];
        v23 = +[NRPairedDeviceRegistry sharedInstance];
        unsigned int v24 = [v23 compatibilityState];

        v25 = pbb_setupflow_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)v33 = "-[COSWatchPairedViewController _madeWristOnLeftSelection:crownOnRightSelection:]";
          *(_WORD *)&v33[8] = 1024;
          LODWORD(v34) = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s NRCompatibilityState is %i", buf, 0x12u);
        }

        if (v24 == 3)
        {
          uint64_t v26 = pbb_setupflow_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)v33 = "-[COSWatchPairedViewController _madeWristOnLeftSelection:crownOnRightSelection:]";
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s IPE is complete, sending crown orientation directly to gizmo.", buf, 0xCu);
          }

          v27 = +[UIApplication sharedApplication];
          v28 = [v27 bridgeController];
          [v28 tellGizmoToSetCrownOrientationRight:v4];
        }
      }
      else
      {
        v29 = pbb_setupflow_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100174814(v11, v29);
        }

        objc_storeStrong((id *)&self->_observedDevice, v11);
        observedDevice = self->_observedDevice;
        uint64_t v31 = v14;
        v18 = +[NSArray arrayWithObjects:&v31 count:1];
        [(NRDevice *)observedDevice addPropertyObserver:self forPropertyChanges:v18];
      }
    }
    else
    {
      uint64_t v17 = [(COSWatchPairedViewController *)self setupController];
      [v17 setWristChoicesDetected:0];

      v18 = pbb_setupflow_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)v33 = "-[COSWatchPairedViewController _madeWristOnLeftSelection:crownOnRightSelection:]";
        *(_WORD *)&v33[8] = 2112;
        __int16 v34 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Device ineligible for BeamBridge: %@", buf, 0x16u);
      }
    }
  }
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = NRDevicePropertyLocalPairingDataStorePath;
  id v10 = [v7 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
  if (v10 && [v8 isEqualToString:v9])
  {
    v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      int v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NRDevice propertyDidChange %@ %@", buf, 0x16u);
    }

    uint64_t v15 = v9;
    v12 = +[NSArray arrayWithObjects:&v15 count:1];
    [v7 removePropertyObserver:self forPropertyChanges:v12];

    v13 = [(COSWatchPairedViewController *)self setupController];
    unsigned int v14 = [v13 wristChoicesDetected];

    if (v14) {
      [(COSWatchPairedViewController *)self _madeWristOnLeftSelection:self->_leftWristSelected crownOnRightSelection:self->_rightCrownSelected];
    }
  }
}

- (void)refreshBackupStatus
{
  unsigned int v3 = [UIApp bridgeController];
  unsigned int v4 = [v3 isTinkerPairing];

  if (v4)
  {
    self->_unint64_t backupStatus = 2;
  }
  else
  {
    BOOL v5 = +[COSBackupManager sharedBackupManager];
    self->_unint64_t backupStatus = (unint64_t)[v5 shouldOfferToRestore];
  }
  CFStringRef v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t backupStatus = self->_backupStatus;
    int v9 = 136315394;
    id v10 = "-[COSWatchPairedViewController refreshBackupStatus]";
    __int16 v11 = 2048;
    unint64_t v12 = backupStatus;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s - backupStatus: %lu", (uint8_t *)&v9, 0x16u);
  }

  [(COSWatchPairedViewController *)self refreshViews];
  spinner = self->_spinner;
  if (self->_backupStatus) {
    [(UIActivityIndicatorView *)spinner stopAnimating];
  }
  else {
    [(UIActivityIndicatorView *)spinner startAnimating];
  }
}

- (void)backupsChanged:(unint64_t)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EACF8;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (COSSetupController)setupController
{
  p_setupController = &self->_setupController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);

  if (!WeakRetained)
  {
    unsigned int v4 = [UIApp setupController];
    objc_storeWeak((id *)p_setupController, v4);
  }
  id v5 = objc_loadWeakRetained((id *)p_setupController);

  return (COSSetupController *)v5;
}

- (COSAnimatedInsigniaWatchView)insigniaWatchView
{
  return self->_insigniaWatchView;
}

- (void)setInsigniaWatchView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (BOOL)completedIntroAnimation
{
  return self->_completedIntroAnimation;
}

- (void)setCompletedIntroAnimation:(BOOL)a3
{
  self->_BOOL completedIntroAnimation = a3;
}

- (unint64_t)backupStatus
{
  return self->_backupStatus;
}

- (void)setBackupStatus:(unint64_t)a3
{
  self->_unint64_t backupStatus = a3;
}

- (NRDevice)observedDevice
{
  return self->_observedDevice;
}

- (void)setObservedDevice:(id)a3
{
}

- (BOOL)leftWristSelected
{
  return self->_leftWristSelected;
}

- (void)setLeftWristSelected:(BOOL)a3
{
  self->_leftWristSelected = a3;
}

- (BOOL)rightCrownSelected
{
  return self->_rightCrownSelected;
}

- (void)setRightCrownSelected:(BOOL)a3
{
  self->_rightCrownSelected = a3;
}

- (void)setSetupController:(id)a3
{
}

- (UINotificationFeedbackGenerator)successBehavior
{
  return self->_successBehavior;
}

- (void)setSuccessBehavior:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successBehavior, 0);
  objc_destroyWeak((id *)&self->_setupController);
  objc_storeStrong((id *)&self->_observedDevice, 0);
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_insigniaWatchView, 0);
}

@end