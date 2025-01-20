@interface COSSetupSoftwareUpdateManager
- (BOOL)displayingUpdatePane;
- (BOOL)forcedUpdateOrUpdateInBackup;
- (BOOL)observingActivation;
- (BOOL)observingCompatibilityChanges;
- (COSBuddyController)controller;
- (COSSoftwareUpdateController)updateController;
- (COSSpinnerPageController)connectSpinner;
- (id)finishCompletion;
- (id)getVersionUpdatedFrom;
- (void)cleanupAfterRestoreSuccess;
- (void)clearVersionUpdatedFrom;
- (void)completedActivation:(id)a3;
- (void)consistencyCheckInstall;
- (void)displayUpdatePane;
- (void)enteredCompatibilityState:(id)a3;
- (void)evaluateUpdateCriteria;
- (void)saveVersionUpdateFrom:(id)a3;
- (void)sendPairingFailedNotification;
- (void)setConnectSpinner:(id)a3;
- (void)setController:(id)a3;
- (void)setDisplayingUpdatePane:(BOOL)a3;
- (void)setFinishCompletion:(id)a3;
- (void)setForcedUpdateOrUpdateInBackup:(BOOL)a3;
- (void)setObservingActivation:(BOOL)a3;
- (void)setObservingCompatibilityChanges:(BOOL)a3;
- (void)setUpdateController:(id)a3;
- (void)startUpdateInSetupWithController:(id)a3 forcedUpdateOrUpdateInBackup:(BOOL)a4 completion:(id)a5;
@end

@implementation COSSetupSoftwareUpdateManager

- (void)startUpdateInSetupWithController:(id)a3 forcedUpdateOrUpdateInBackup:(BOOL)a4 completion:(id)a5
{
  self->_forcedUpdateOrUpdateInBackup = a4;
  id v7 = a3;
  id v8 = objc_retainBlock(a5);
  id finishCompletion = self->_finishCompletion;
  self->_id finishCompletion = v8;

  v10 = [UIApp setupController];
  id v11 = [v10 pairingReportManager];

  [v11 addPairingTimeEventToPairingReportPlist:57 withValue:&__kCFBooleanTrue withError:0];
  objc_storeWeak((id *)&self->_controller, v7);

  [(COSSetupSoftwareUpdateManager *)self evaluateUpdateCriteria];
}

- (void)evaluateUpdateCriteria
{
  v3 = +[UIApplication sharedApplication];
  unsigned int v4 = [v3 isActivated];

  v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[COSSetupSoftwareUpdateManager evaluateUpdateCriteria]";
    __int16 v44 = 1024;
    *(_DWORD *)v45 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s, activated: %{BOOL}d", buf, 0x12u);
  }

  v6 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned int v7 = [v6 compatibilityState];

  int v8 = v7 & 0xFFFE;
  v9 = pbb_bridge_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v43 = "-[COSSetupSoftwareUpdateManager evaluateUpdateCriteria]";
    __int16 v44 = 1024;
    *(_DWORD *)v45 = v8 == 2;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s, reached valid compatibility state: %{BOOL}d - %hu", buf, 0x18u);
  }

  v10 = [UIApp setupController];
  id v11 = v10;
  if (v8 == 2)
  {
    if (v4)
    {
      v12 = [v10 navigationController];
      WeakRetained = [v12 topViewController];

      v14 = objc_opt_class();
      if ([v14 isEqual:objc_opt_class()])
      {
        v15 = pbb_bridge_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v43 = "-[COSSetupSoftwareUpdateManager evaluateUpdateCriteria]";
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Spinner is the top controller, nil spinner", buf, 0xCu);
        }

        connectSpinner = self->_connectSpinner;
        self->_connectSpinner = 0;
      }
      v17 = +[NSNotificationCenter defaultCenter];
      [v17 removeObserver:self name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

      v18 = +[NSNotificationCenter defaultCenter];
      [v18 removeObserver:self name:PBBridgeGizmoDidFinishActivatingNotification object:0];

      if (!self->_displayingUpdatePane)
      {
        self->_displayingUpdatePane = 1;
        v19 = [UIApp activeWatch];
        v20 = [v19 valueForProperty:NRDevicePropertySystemBuildVersion];
        v21 = [(COSSetupSoftwareUpdateManager *)self getVersionUpdatedFrom];
        v22 = pbb_bridge_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v43 = v21;
          __int16 v44 = 2112;
          *(void *)v45 = v20;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Previous Version: %@ buildVersion: %@", buf, 0x16u);
        }

        if (v21 && ([v20 isEqualToString:v21] & 1) == 0 && v7 == 3)
        {
          v23 = pbb_bridge_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Found previous version that is different than current version, resuming crash monitoring and finishing the update tasks", buf, 2u);
          }

          v24 = +[UIApplication sharedApplication];
          v25 = [v24 setupController];
          v26 = [v25 linkUpgradeMonitor];
          [v26 requestLinkUpgrade];

          v27 = +[NRPairedDeviceRegistry sharedInstance];
          [v27 resumePairingClientCrashMonitoring];

          [(COSSetupSoftwareUpdateManager *)self cleanupAfterRestoreSuccess];
          id finishCompletion = self->_finishCompletion;
          if (finishCompletion) {
            (*((void (**)(id, void, void, void))finishCompletion + 2))(finishCompletion, 0, 0, 0);
          }
        }
        else
        {
          [(COSSetupSoftwareUpdateManager *)self saveVersionUpdateFrom:v20];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100025C5C;
          block[3] = &unk_1002438A0;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
      }
LABEL_30:

      goto LABEL_31;
    }
LABEL_23:
    if (!self->_observingActivation)
    {
      self->_observingActivation = 1;
      v29 = +[NSNotificationCenter defaultCenter];
      [v29 addObserver:self selector:"completedActivation:" name:PBBridgeGizmoDidFinishActivatingNotification object:0];

      v30 = pbb_bridge_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[COSSetupSoftwareUpdateManager evaluateUpdateCriteria]";
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s, push COSActivationViewController", buf, 0xCu);
      }

      p_controller = &self->_controller;
      WeakRetained = objc_loadWeakRetained((id *)p_controller);
      v32 = [WeakRetained delegate];
      id v33 = objc_loadWeakRetained((id *)p_controller);
      [v32 buddyControllerDone:v33 nextControllerClass:objc_opt_class()];

      goto LABEL_30;
    }
    goto LABEL_31;
  }
  if (!self->_observingCompatibilityChanges)
  {
    self->_observingCompatibilityChanges = 1;
    v34 = +[NSNotificationCenter defaultCenter];
    [v34 addObserver:self selector:"enteredCompatibilityState:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

    v35 = [COSSpinnerPageController alloc];
    v36 = +[NSBundle mainBundle];
    v37 = [v36 localizedStringForKey:@"INITIAL_PROPERTY_EXCHANGE_HOLD_DESCRIPTION" value:&stru_100249230 table:@"Localizable"];
    v38 = [(COSSpinnerPageController *)v35 initWithLabel:v37];
    v39 = self->_connectSpinner;
    self->_connectSpinner = v38;

    v40 = [v11 navigationController];
    [v40 pushViewController:self->_connectSpinner animated:1];

    [v11 blockGoingBackFromCurrentController];
    goto LABEL_31;
  }
  if ((v4 & 1) == 0) {
    goto LABEL_23;
  }
LABEL_31:
}

- (void)cleanupAfterRestoreSuccess
{
  [(COSSetupSoftwareUpdateManager *)self clearVersionUpdatedFrom];
  v3 = +[UIApplication sharedApplication];
  unsigned int v4 = [v3 setupController];
  v5 = [v4 linkUpgradeMonitor];
  [v5 indicateSoftwareUpdateStateResolved];

  v6 = +[UIApplication sharedApplication];
  unsigned int v7 = [v6 setupController];
  [v7 startPostActivationCompatiblePairingBackgroundTasks];

  id v8 = UIApp;
  [v8 setIsUpdatingGizmoInSetupFlow:0];
  v9 = [v8 bridgeController];

  [v9 setShouldSuppressTransportReachabilityTimeout:0];

  [(COSSetupSoftwareUpdateManager *)self consistencyCheckInstall];
}

- (void)saveVersionUpdateFrom:(id)a3
{
  CFPreferencesSetAppValue(@"kIsUpdatingFromVersionInSetupFlow", a3, @"com.apple.Bridge");

  CFPreferencesAppSynchronize(@"com.apple.Bridge");
}

- (id)getVersionUpdatedFrom
{
  v2 = (void *)CFPreferencesCopyAppValue(@"kIsUpdatingFromVersionInSetupFlow", @"com.apple.Bridge");

  return v2;
}

- (void)clearVersionUpdatedFrom
{
}

- (void)enteredCompatibilityState:(id)a3
{
  unsigned int v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[COSSetupSoftwareUpdateManager enteredCompatibilityState:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(COSSetupSoftwareUpdateManager *)self evaluateUpdateCriteria];
}

- (void)completedActivation:(id)a3
{
  unsigned int v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[COSSetupSoftwareUpdateManager completedActivation:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(COSSetupSoftwareUpdateManager *)self evaluateUpdateCriteria];
}

- (void)displayUpdatePane
{
  v3 = [UIApp setupController];
  if (_os_feature_enabled_impl())
  {
    unsigned int v4 = pbb_bridge_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[COSSetupSoftwareUpdateManager displayUpdatePane]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s resetting link monitor to proceed with update", buf, 0xCu);
    }

    int v5 = [UIApp setupController];
    v6 = [v5 linkUpgradeMonitor];
    [v6 resetMonitor];
  }
  [v3 setResolvedPreconditionsForSoftwareUpdate:1];
  unsigned int v7 = +[NRPairedDeviceRegistry sharedInstance];
  [v7 suspendPairingClientCrashMonitoring];

  [UIApp setIsUpdatingGizmoInSetupFlow:1];
  id v8 = [UIApp activeWatch];
  if (!self->_updateController)
  {
    v9 = (COSSoftwareUpdateController *)objc_opt_new();
    updateController = self->_updateController;
    self->_updateController = v9;
  }
  objc_initWeak((id *)buf, self);
  id v11 = [UIApp setupController];
  v12 = [v11 pairingCompatiblity];

  if (self->_forcedUpdateOrUpdateInBackup || [v12 requiresZeroDayUpdate])
  {
    v13 = [UIApp bridgeController];
    [v13 tellWatchToPrepareForForcedSUWithCompletion:&stru_100243BD8];
  }
  v14 = self->_updateController;
  BOOL forcedUpdateOrUpdateInBackup = self->_forcedUpdateOrUpdateInBackup;
  v16 = [v3 navigationController];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100026268;
  v17[3] = &unk_100243C00;
  objc_copyWeak(&v18, (id *)buf);
  [(COSSoftwareUpdateController *)v14 presentInSetupFlowForDevice:v8 userForcedUpdate:forcedUpdateOrUpdateInBackup withController:v16 animated:1 completion:v17];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)consistencyCheckInstall
{
  v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = 236;
    __int16 v9 = 2080;
    v10 = "-[COSSetupSoftwareUpdateManager consistencyCheckInstall]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%d %s - Checking if update in Setup flow has completed", (uint8_t *)v8, 0x12u);
  }

  unsigned int v4 = [UIApp activeWatch];
  int v5 = [v4 valueForProperty:NRDevicePropertyMaxPairingCompatibilityVersion];
  [v5 integerValue];

  v6 = [v4 valueForProperty:NRDevicePropertyChipID];
  if ((_BPSIsPairingCompatible() & 1) == 0)
  {
    unsigned int v7 = pbb_setupflow_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001719E8(v7);
    }

    [(COSSetupSoftwareUpdateManager *)self sendPairingFailedNotification];
  }
}

- (void)sendPairingFailedNotification
{
  v2 = +[NSNotificationCenter defaultCenter];
  CFStringRef v4 = @"error";
  CFStringRef v5 = @"Updated to Incompatible Version";
  v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  [v2 postNotificationName:@"COSDevicePairingFailed" object:0 userInfo:v3];
}

- (COSBuddyController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (COSBuddyController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (COSSoftwareUpdateController)updateController
{
  return self->_updateController;
}

- (void)setUpdateController:(id)a3
{
}

- (COSSpinnerPageController)connectSpinner
{
  return self->_connectSpinner;
}

- (void)setConnectSpinner:(id)a3
{
}

- (BOOL)forcedUpdateOrUpdateInBackup
{
  return self->_forcedUpdateOrUpdateInBackup;
}

- (void)setForcedUpdateOrUpdateInBackup:(BOOL)a3
{
  self->_BOOL forcedUpdateOrUpdateInBackup = a3;
}

- (BOOL)displayingUpdatePane
{
  return self->_displayingUpdatePane;
}

- (void)setDisplayingUpdatePane:(BOOL)a3
{
  self->_displayingUpdatePane = a3;
}

- (BOOL)observingActivation
{
  return self->_observingActivation;
}

- (void)setObservingActivation:(BOOL)a3
{
  self->_observingActivation = a3;
}

- (BOOL)observingCompatibilityChanges
{
  return self->_observingCompatibilityChanges;
}

- (void)setObservingCompatibilityChanges:(BOOL)a3
{
  self->_observingCompatibilityChanges = a3;
}

- (id)finishCompletion
{
  return self->_finishCompletion;
}

- (void)setFinishCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishCompletion, 0);
  objc_storeStrong((id *)&self->_connectSpinner, 0);
  objc_storeStrong((id *)&self->_updateController, 0);

  objc_destroyWeak((id *)&self->_controller);
}

@end