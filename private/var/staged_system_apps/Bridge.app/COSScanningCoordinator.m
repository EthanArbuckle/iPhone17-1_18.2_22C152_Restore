@interface COSScanningCoordinator
- (BOOL)checkIfShouldUpdateInRevLockFlowForWatchPairingVersion:(unint64_t)a3 watchChipID:(id)a4;
- (BOOL)hasStartedPairing;
- (BOOL)inProgress;
- (BOOL)pairingStarted;
- (BOOL)registeredForCompatibilityState;
- (COSScanningCoordinatorDelegate)delegate;
- (NSString)deviceSetupName;
- (NSString)oobIdentifier;
- (NSTimer)discoveryTimeoutTimer;
- (int)pairingStartedNotificationToken;
- (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5;
- (unint64_t)pairingVersionFromCode;
- (unint64_t)retryMetadataReadCounter;
- (void)_nanoRegistryHPPairingComplete;
- (void)_nanoRegistryManualPairingComplete;
- (void)beginNanoRegistryPair;
- (void)continueWithFetchingExtendedMetadataFromNanoRegistryWithIDContext:(id)a3;
- (void)didBeginToPair:(id)a3;
- (void)discoveryDidTimeout;
- (void)enteredCompatibilityState:(id)a3;
- (void)nanoRegistryPairingComplete;
- (void)nanoRegistryPairingComplete:(BOOL)a3;
- (void)nanoRegistryStatusChanged:(id)a3;
- (void)pairingRequestAttempted:(id)a3;
- (void)receivedWatchPairingExtendedMetadata:(id)a3 withIDContext:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceSetupName:(id)a3;
- (void)setDiscoveryTimeoutTimer:(id)a3;
- (void)setInProgress:(BOOL)a3;
- (void)setOobIdentifier:(id)a3;
- (void)setPairingStarted:(BOOL)a3;
- (void)setPairingStartedNotificationToken:(int)a3;
- (void)setPairingVersionFromCode:(unint64_t)a3;
- (void)setRegisteredForCompatibilityState:(BOOL)a3;
- (void)setRetryMetadataReadCounter:(unint64_t)a3;
- (void)startObservingCompatibilityState;
- (void)startPairingWithScannedCode:(id)a3;
- (void)stopObservingCompatibilityState;
@end

@implementation COSScanningCoordinator

- (void)startPairingWithScannedCode:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000DC734;
  v6[3] = &unk_100243A30;
  objc_copyWeak(&v9, &location);
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)continueWithFetchingExtendedMetadataFromNanoRegistryWithIDContext:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[NRPairedDeviceRegistry sharedInstance];
  deviceSetupName = self->_deviceSetupName;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DD128;
  v8[3] = &unk_100246C90;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v5 waitForWatchPairingExtendedMetadataForAdvertisedName:deviceSetupName completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)receivedWatchPairingExtendedMetadata:(id)a3 withIDContext:(id)a4
{
  id v6 = a4;
  id v7 = (void *)UIApp;
  id v8 = a3;
  id v9 = [v7 setupController];
  id v10 = [v9 pairingCompatiblity];

  [v10 setCompatiblityCriteriaWithMetadata:v8 scannedPairingVersion:self->_pairingVersionFromCode];
  if ([v10 blockTinkerPairing])
  {
    v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10017452C();
    }

    v12 = [(COSScanningCoordinator *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = [(COSScanningCoordinator *)self delegate];
      [v14 scanningCoordinatorDidDetectUnsupportedTinkerHardware:self];
LABEL_11:

      goto LABEL_29;
    }
    goto LABEL_29;
  }
  if (![v10 blockYorktownPairing])
  {
    if ([v10 pairingShouldContinue])
    {
      v18 = +[COSBackupManager sharedBackupManager];
      v19 = [v6 osVersionString];
      [v18 setMinWatchOSVersion:v19];

      v20 = +[NSNotificationCenter defaultCenter];
      [v20 addObserver:self selector:"didBeginToPair:" name:NRPairedDeviceRegistryDeviceDidBeginPairingNotification object:0];

      v21 = +[NSNotificationCenter defaultCenter];
      [v21 addObserver:self selector:"pairingRequestAttempted:" name:NRPairedDeviceRegistryDeviceDidReceiveBTPairingRequestNotification object:0];

      if (sub_100032540())
      {
        v22 = +[COSInternalUserStudyDataManager sharedManager];
        [v22 setSize:[v6 size]];
        [v22 setMaterial:[v6 material]];

        uint64_t v23 = 2;
      }
      else
      {
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_1000DD848;
        v39[3] = &unk_100246CB8;
        v39[4] = self;
        self->_pairingStartedNotificationToken = [(COSScanningCoordinator *)self registerNotifyTokenWithName:@"com.apple.nanoregistry.isbeginningtopair" withQueue:&_dispatch_main_q withBlock:v39];
        v28 = +[NRPairedDeviceRegistry sharedInstance];
        uint64_t v23 = (uint64_t)[v28 status];
      }
      v29 = +[NSUserDefaults standardUserDefaults];
      unsigned __int8 v30 = [v29 BOOLForKey:@"LiveOnCollection"];

      if ((v30 & 1) == 0)
      {
        v31 = +[NSTimer timerWithTimeInterval:self target:"discoveryDidTimeout" selector:0 userInfo:0 repeats:60.0];
        discoveryTimeoutTimer = self->_discoveryTimeoutTimer;
        self->_discoveryTimeoutTimer = v31;

        v33 = +[NSRunLoop currentRunLoop];
        [v33 addTimer:self->_discoveryTimeoutTimer forMode:NSRunLoopCommonModes];
      }
      if (v23 == 2)
      {
        [(COSScanningCoordinator *)self beginNanoRegistryPair];
LABEL_28:
        v35 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
        [v35 endMacroActivity:@"COSGizmoCaptureViewControllerScanningPhase" beginTime:CFAbsoluteTimeGetCurrent()];
        double v37 = v36;

        +[PBBridgeCAReporter pushTimingType:0 withValue:v37];
        goto LABEL_29;
      }
      v34 = pbb_setupflow_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Waiting for NR to be ready (Process Code)...", v38, 2u);
      }

      v27 = +[NSNotificationCenter defaultCenter];
      [v27 addObserver:self selector:"nanoRegistryStatusChanged:" name:NRPairedDeviceRegistryStatusDidChange object:0];
    }
    else
    {
      v24 = pbb_setupflow_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v38 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Gizmo is Ahead", v38, 2u);
      }

      +[PBBridgeCAReporter recordEndOfLifePhoneAlertPresented:0];
      v25 = [(COSScanningCoordinator *)self delegate];
      char v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) == 0) {
        goto LABEL_28;
      }
      v27 = [(COSScanningCoordinator *)self delegate];
      [v27 scanningCoordinatorDidDetectUnsupportedCompanionSoftware:self];
    }

    goto LABEL_28;
  }
  v15 = pbb_setupflow_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_100174560();
  }

  v16 = [(COSScanningCoordinator *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    v14 = [(COSScanningCoordinator *)self delegate];
    [v14 scanningCoordinatorDidDetectUnsupportedYorktownHardware:self];
    goto LABEL_11;
  }
LABEL_29:
}

- (void)beginNanoRegistryPair
{
  v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    deviceSetupName = self->_deviceSetupName;
    *(_DWORD *)buf = 138412290;
    unsigned __int8 v30 = deviceSetupName;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tell NR to pair with device named %@", buf, 0xCu);
  }

  id v5 = [UIApp setupController];
  id v6 = [v5 pairingReportManager];

  [v6 addPairingTimeEventToPairingReportPlist:8 withValue:&__kCFBooleanTrue withError:0];
  self->_pairingStarted = 1;
  if (self->_deviceSetupName)
  {
    id v7 = pbb_setupflow_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stop waiting for NR to be ready. (We're Pairing)", buf, 2u);
    }

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self name:NRPairedDeviceRegistryStatusDidChange object:0];

    id v9 = +[NSUserDefaults standardUserDefaults];
    unsigned int v10 = [v9 BOOLForKey:@"LiveOnCollection"];

    BOOL v11 = sub_100032540();
    v12 = pbb_setupflow_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if ((v11 | v10))
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "User Study Testing skipping pairing...", buf, 2u);
      }

      if ((int)sub_10003245C() > 0) {
        int v14 = 1;
      }
      else {
        int v14 = v10;
      }
      if (v14 == 1)
      {
        v15 = [(COSScanningCoordinator *)self delegate];
        char v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          char v17 = [(COSScanningCoordinator *)self delegate];
          [v17 scanningCoordinatorDidCompleteForInternalUserStudyFlow:self];
        }
      }
      else
      {
        [(COSScanningCoordinator *)self nanoRegistryPairingComplete];
      }
    }
    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Kick off pairing...", buf, 2u);
      }

      kdebug_trace();
      v18 = [UIApp bridgeController];
      v27[0] = NRPairOptionGizmoPairingVersion;
      v19 = +[NSNumber numberWithUnsignedInteger:self->_pairingVersionFromCode];
      v28[0] = v19;
      v27[1] = NRPairOptionIsAltAccountGizmo;
      v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 isTinkerPairing]);
      v28[1] = v20;
      v21 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

      objc_initWeak((id *)buf, self);
      v22 = +[NRPairedDeviceRegistry sharedInstance];
      uint64_t v23 = self->_deviceSetupName;
      v24 = PBOOBDataFromHexString();
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000DDCFC;
      v25[3] = &unk_1002452E8;
      objc_copyWeak(&v26, (id *)buf);
      [v22 companionOOBDiscoverAndPairWithName:v23 withOutOfBandPairingKey:v24 withOptions:v21 operationHasBegun:v25];

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (BOOL)hasStartedPairing
{
  return self->_pairingStarted;
}

- (void)nanoRegistryPairingComplete
{
}

- (void)nanoRegistryPairingComplete:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[COSScanningCoordinator nanoRegistryPairingComplete:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s manual pairing %{BOOL}d", (uint8_t *)&v7, 0x12u);
  }

  [(COSScanningCoordinator *)self stopObservingCompatibilityState];
  [(NSTimer *)self->_discoveryTimeoutTimer invalidate];
  discoveryTimeoutTimer = self->_discoveryTimeoutTimer;
  self->_discoveryTimeoutTimer = 0;

  if (v3) {
    [(COSScanningCoordinator *)self _nanoRegistryManualPairingComplete];
  }
  else {
    [(COSScanningCoordinator *)self _nanoRegistryHPPairingComplete];
  }
}

- (void)_nanoRegistryManualPairingComplete
{
  BOOL v3 = [(COSScanningCoordinator *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(COSScanningCoordinator *)self delegate];
    [v5 scanningCoordinatorDidCompleteForManualPairing:self];
  }
}

- (void)_nanoRegistryHPPairingComplete
{
  BOOL v3 = [(COSScanningCoordinator *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(COSScanningCoordinator *)self delegate];
    [v5 scanningCoordinatorDidFinishPairing:self];
  }
}

- (void)startObservingCompatibilityState
{
  BOOL v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[COSScanningCoordinator startObservingCompatibilityState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  if (!self->_registeredForCompatibilityState)
  {
    self->_registeredForCompatibilityState = 1;
    char v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"enteredCompatibilityState:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];
  }
}

- (void)stopObservingCompatibilityState
{
  BOOL v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[COSScanningCoordinator stopObservingCompatibilityState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  if (self->_registeredForCompatibilityState)
  {
    self->_registeredForCompatibilityState = 0;
    char v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];
  }
}

- (void)didBeginToPair:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  int v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:NRPairedDeviceRegistryDeviceDidBeginPairingNotification object:0];

  id v6 = [v4 userInfo];

  int v7 = [v6 objectForKey:NRPairedDeviceRegistryDevice];

  id v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    deviceSetupName = self->_deviceSetupName;
    BOOL v10 = [v7 valueForProperty:NRDevicePropertyAdvertisedName];
    int v11 = 138412546;
    v12 = deviceSetupName;
    __int16 v13 = 2112;
    int v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Began to pair with %@ -- %@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)pairingRequestAttempted:(id)a3
{
  id v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    char v16 = "-[COSScanningCoordinator pairingRequestAttempted:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v15, 0xCu);
  }

  kdebug_trace();
  int pairingStartedNotificationToken = self->_pairingStartedNotificationToken;
  if (pairingStartedNotificationToken != -1)
  {
    notify_cancel(pairingStartedNotificationToken);
    self->_int pairingStartedNotificationToken = -1;
  }
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:NRPairedDeviceRegistryDeviceDidReceiveBTPairingRequestNotification object:0];

  [(COSScanningCoordinator *)self nanoRegistryPairingComplete];
  int v7 = +[NSUserDefaults standardUserDefaults];
  [v7 doubleForKey:@"AlreadyPairedFiredTimeStamp"];
  double v9 = v8;

  if (v9 > 0.0)
  {
    double v10 = CFAbsoluteTimeGetCurrent() - v9;
    int v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = +[NSNumber numberWithDouble:v10];
      int v15 = 138412290;
      char v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Already Paired Detector] Successful Attempt took: %@.", (uint8_t *)&v15, 0xCu);
    }
    +[PBBridgeCAReporter recordAlreadyPairedAlertFiredAndWatchRecovered:v10];
    __int16 v13 = +[NSUserDefaults standardUserDefaults];
    [v13 removeObjectForKey:@"AlreadyPairedFiredTimeStamp"];
  }
  int v14 = +[NRPairedDeviceRegistry sharedInstance];
  [v14 notifyPairingShouldContinue];
}

- (void)nanoRegistryStatusChanged:(id)a3
{
  id v4 = [a3 userInfo];
  int v5 = [v4 objectForKey:NRPairedDeviceRegistryStatusKey];

  id v6 = pbb_setupflow_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    deviceSetupName = self->_deviceSetupName;
    int v17 = 138412546;
    v18 = v5;
    __int16 v19 = 2112;
    v20 = deviceSetupName;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(Scanning Coordinator) NR Status Changed to %@ // Device name: %@", (uint8_t *)&v17, 0x16u);
  }

  double v8 = [(COSScanningCoordinator *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0
    || ([(COSScanningCoordinator *)self delegate],
        double v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v10 isViewControllerVisibleForScanningCoordinator:self],
        v10,
        (v11 & 1) == 0))
  {
    v12 = pbb_setupflow_log();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_15:

      int v14 = +[NSNotificationCenter defaultCenter];
      [v14 removeObserver:self name:NRPairedDeviceRegistryStatusDidChange object:0];
LABEL_16:

      goto LABEL_17;
    }
    LOWORD(v17) = 0;
    __int16 v13 = "(Scanning Coordinator) No longer visible, skipping actions and removing observer";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 2u);
    goto LABEL_15;
  }
  if (v5)
  {
    if ([v5 integerValue] == (id)2)
    {
      if (self->_deviceSetupName && ![(COSScanningCoordinator *)self hasStartedPairing]) {
        [(COSScanningCoordinator *)self beginNanoRegistryPair];
      }
      v12 = pbb_setupflow_log();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      LOWORD(v17) = 0;
      __int16 v13 = "(Scanning Coordinator) Stops waiting for NR to be ready. (Changed To Ready)";
      goto LABEL_14;
    }
    if (![(COSScanningCoordinator *)self hasStartedPairing])
    {
      int v15 = [(COSScanningCoordinator *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        int v14 = [(COSScanningCoordinator *)self delegate];
        [v14 scanningCoordinatorDidUnpair:self];
        goto LABEL_16;
      }
    }
  }
LABEL_17:
}

- (void)enteredCompatibilityState:(id)a3
{
  id v4 = a3;
  int v5 = [(COSScanningCoordinator *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = [(COSScanningCoordinator *)self delegate];
    unsigned int v8 = [v7 isManualPairingVisibleForScanningCoordinator:self];

    if (v8)
    {
      char v9 = [v4 userInfo];
      uint64_t v10 = NRPairedDeviceRegistryDevice;
      unsigned __int8 v11 = [v9 objectForKeyedSubscript:NRPairedDeviceRegistryDevice];
      v12 = [v9 objectForKeyedSubscript:NRPairedDeviceRegistryCompatibilityStateKey];
      unsigned __int16 v13 = (unsigned __int16)[v12 unsignedIntValue];

      int v14 = pbb_setupflow_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 134217984;
        uint64_t v31 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "COSScanningCoordinator: NR enteredCompatibilityState %ld", (uint8_t *)&v30, 0xCu);
      }

      if ((v13 & 0xFFFE) == 0) {
        goto LABEL_25;
      }
      int v15 = [v9 objectForKeyedSubscript:v10];
      char v16 = [v15 valueForProperty:NRDevicePropertySystemVersion];
      id v17 = [v16 copy];

      v18 = [UIApp setupController];
      __int16 v19 = [v18 pairingCompatiblity];

      [v19 setCompatiblityCriteriaWithDevice:v15];
      if ([v19 blockTinkerPairing])
      {
        v20 = pbb_setupflow_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100174644();
        }

        v21 = [(COSScanningCoordinator *)self delegate];
        char v22 = objc_opt_respondsToSelector();

        if ((v22 & 1) == 0) {
          goto LABEL_24;
        }
        uint64_t v23 = [(COSScanningCoordinator *)self delegate];
        [v23 scanningCoordinatorDidDetectUnsupportedTinkerHardware:self];
        goto LABEL_23;
      }
      if ([v19 blockYorktownPairing])
      {
        v24 = pbb_setupflow_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_100174678();
        }

        v25 = [(COSScanningCoordinator *)self delegate];
        char v26 = objc_opt_respondsToSelector();

        if ((v26 & 1) == 0) {
          goto LABEL_24;
        }
        uint64_t v23 = [(COSScanningCoordinator *)self delegate];
        [v23 scanningCoordinatorDidDetectUnsupportedYorktownHardware:self];
        goto LABEL_23;
      }
      if ([v19 pairingShouldContinue])
      {
        if ([v19 pairingShouldContinue])
        {
          if ([v19 failSafeUpdateRequested])
          {
            v27 = [UIApp bridgeController];
            [v27 tellWatchToPrepareForForcedSUWithCompletion:&stru_100246CD8];
          }
          [(COSScanningCoordinator *)self nanoRegistryPairingComplete:1];
          uint64_t v23 = +[COSBackupManager sharedBackupManager];
          [v23 setMinWatchOSVersion:v17];
          goto LABEL_23;
        }
      }
      else
      {
        +[PBBridgeCAReporter recordEndOfLifePhoneAlertPresented:1];
        v28 = [(COSScanningCoordinator *)self delegate];
        char v29 = objc_opt_respondsToSelector();

        if (v29)
        {
          uint64_t v23 = [(COSScanningCoordinator *)self delegate];
          [v23 scanningCoordinatorDidDetectUnsupportedCompanionSoftware:self];
LABEL_23:
        }
      }
LABEL_24:

LABEL_25:
    }
  }
}

- (void)discoveryDidTimeout
{
  v2 = pbb_setupflow_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Aborted Pairing Between Scanning and BT Pairing Request Attempt", v3, 2u);
  }

  [UIApp resetSetupFlowAnimated:1 forEvent:40];
}

- (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5
{
  id v7 = a3;
  unsigned int v8 = a4;
  id v9 = a5;
  int out_token = -1;
  id v10 = v7;
  unsigned __int8 v11 = (const char *)[v10 UTF8String];
  if (v9)
  {
    if (!notify_register_dispatch(v11, &out_token, v8, v9)) {
      goto LABEL_8;
    }
  }
  else if (!notify_register_check(v11, &out_token))
  {
    goto LABEL_8;
  }
  v12 = pbb_setupflow_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1001746AC((uint64_t)v10, v12);
  }

LABEL_8:
  int v13 = out_token;

  return v13;
}

- (BOOL)checkIfShouldUpdateInRevLockFlowForWatchPairingVersion:(unint64_t)a3 watchChipID:(id)a4
{
  if (_BPSIsPairingCompatible()) {
    return 0;
  }
  char v6 = +[NRPairingCompatibilityVersionInfo systemVersions];
  id v7 = [v6 maxPairingCompatibilityVersion];

  return (unint64_t)v7 > a3;
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (void)setInProgress:(BOOL)a3
{
  self->_inProgress = a3;
}

- (COSScanningCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSScanningCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)deviceSetupName
{
  return self->_deviceSetupName;
}

- (void)setDeviceSetupName:(id)a3
{
}

- (NSString)oobIdentifier
{
  return self->_oobIdentifier;
}

- (void)setOobIdentifier:(id)a3
{
}

- (unint64_t)pairingVersionFromCode
{
  return self->_pairingVersionFromCode;
}

- (void)setPairingVersionFromCode:(unint64_t)a3
{
  self->_pairingVersionFromCode = a3;
}

- (BOOL)pairingStarted
{
  return self->_pairingStarted;
}

- (void)setPairingStarted:(BOOL)a3
{
  self->_pairingStarted = a3;
}

- (BOOL)registeredForCompatibilityState
{
  return self->_registeredForCompatibilityState;
}

- (void)setRegisteredForCompatibilityState:(BOOL)a3
{
  self->_registeredForCompatibilityState = a3;
}

- (int)pairingStartedNotificationToken
{
  return self->_pairingStartedNotificationToken;
}

- (void)setPairingStartedNotificationToken:(int)a3
{
  self->_int pairingStartedNotificationToken = a3;
}

- (NSTimer)discoveryTimeoutTimer
{
  return self->_discoveryTimeoutTimer;
}

- (void)setDiscoveryTimeoutTimer:(id)a3
{
}

- (unint64_t)retryMetadataReadCounter
{
  return self->_retryMetadataReadCounter;
}

- (void)setRetryMetadataReadCounter:(unint64_t)a3
{
  self->_retryMetadataReadCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_oobIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceSetupName, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end