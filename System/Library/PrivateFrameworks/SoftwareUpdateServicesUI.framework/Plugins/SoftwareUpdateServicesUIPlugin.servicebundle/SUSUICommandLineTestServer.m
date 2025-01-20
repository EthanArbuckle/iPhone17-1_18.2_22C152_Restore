@interface SUSUICommandLineTestServer
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)miniAlertNeedsAutoInstallForecastDescriptor:(unint64_t)a3;
- (BOOL)miniAlertNeedsDownloadDescriptor:(unint64_t)a3;
- (BOOL)miniAlertNeedsRollbackDescriptor:(unint64_t)a3;
- (BOOL)miniAlertNeedsScanResultsDescriptor:(unint64_t)a3;
- (void)ddmInstallNow;
- (void)destroyInstallationKeybag;
- (void)dismissAllAlerts;
- (void)downloadDidFinish;
- (void)getAlertStatus:(id)a3;
- (void)getDDMAlertStatus:(id)a3;
- (void)presentMiniAlert:(unint64_t)a3 errorCode:(id)a4 downloadDescriptor:(id)a5 scanResultsDescriptor:(id)a6 autoInstallForecast:(id)a7 andRollbackDescriptor:(id)a8 result:(id)a9;
- (void)reboot:(BOOL)a3;
- (void)run;
- (void)setInstallOperation:(id)a3;
- (void)setPasscodePolicy:(unint64_t)a3;
- (void)setRestartCountdownOverrideIntervalSeconds:(id)a3;
- (void)setUpdateToInstall:(id)a3;
- (void)showAuthenticationUIWithOptions:(unint64_t)a3 result:(id)a4;
- (void)showDDMAlert:(int64_t)a3 install:(BOOL)a4;
- (void)showEmergencyCallUIWithOptions:(unint64_t)a3 result:(id)a4;
- (void)showFollowUp:(unint64_t)a3;
- (void)showLaggardsUi:(unint64_t)a3 usingFakeData:(BOOL)a4 result:(id)a5;
- (void)showMiniAlertWithDescriptors:(unint64_t)a3 errorCode:(id)a4 downloadDescriptor:(id)a5 scanResultsDescriptor:(id)a6 autoInstallForecast:(id)a7 andRollbackDescriptor:(id)a8 result:(id)a9;
- (void)showMiniAlertWithScan:(unint64_t)a3 errorCode:(id)a4 result:(id)a5;
- (void)simulateComingFromOTAUpdate;
- (void)toggleSettingsBadge:(BOOL)a3;
@end

@implementation SUSUICommandLineTestServer

+ (id)sharedInstance
{
  v5 = (dispatch_once_t *)&unk_703B0;
  id location = 0;
  objc_storeStrong(&location, &stru_5EBA0);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)qword_703A8;

  return v2;
}

- (void)run
{
  v8 = self;
  v7[1] = (id)a2;
  if (_BSIsInternalInstall())
  {
    v2 = _NSConcreteStackBlock;
    int v3 = -1073741824;
    int v4 = 0;
    v5 = sub_13A94;
    v6 = &unk_5CC30;
    v7[0] = v8;
    v10 = (dispatch_once_t *)&unk_703B8;
    id location = 0;
    objc_storeStrong(&location, &v2);
    if (*v10 != -1) {
      dispatch_once(v10, location);
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(v7, 0);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v10 = [v16 valueForEntitlement:@"com.apple.softwareupdateservices.ui.cli.allowed"];
  unsigned __int8 v11 = [v10 BOOLValue];

  if (v11)
  {
    [v16 _setQueue:v18->_queue];
    objc_msgSend(v16, "setInterruptionHandler:");
    [v16 setInvalidationHandler:0];
    id v5 = v16;
    v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SUSUICommandLineToolClientInterface];
    objc_msgSend(v5, "setRemoteObjectInterface:");

    id v7 = v16;
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SUSUICommandLineToolServerInterface];
    objc_msgSend(v7, "setExportedInterface:");

    [v16 setExportedObject:v18];
    [v16 resume];
    id v12 = (id)SUSUILog();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v20, (uint64_t)v16);
      _os_log_impl(&def_46F0, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "Adding plugin client: %@", v20, 0xCu);
    }
    objc_storeStrong(&v12, 0);
    char v19 = 1;
    int v13 = 1;
  }
  else
  {
    id v15 = (id)SUSUILog();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      sub_548C((uint64_t)v21, (uint64_t)v16);
      _os_log_impl(&def_46F0, (os_log_t)v15, v14, "Ignoring plugin client: %@", v21, 0xCu);
    }
    objc_storeStrong(&v15, 0);
    char v19 = 0;
    int v13 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v19 & 1;
}

- (void)showMiniAlertWithScan:(unint64_t)a3 errorCode:(id)a4 result:(id)a5
{
  v28 = self;
  SEL v27 = a2;
  v26 = (void *)a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v24 = 0;
  objc_storeStrong(&v24, a5);
  BSDispatchQueueAssert();
  id v23 = (id)SUSUILog();
  os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
  {
    sub_141D8((uint64_t)v29, (int)v26);
    _os_log_impl(&def_46F0, (os_log_t)v23, v22, "Got mini-alert to show: %d", v29, 8u);
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong((id *)&v28->stringResponse, @"[] Locking for a new update for the alert.\n");
  id v5 = +[SUSUISoftwareUpdateController sharedInstance];
  id v21 = [(SUSUISoftwareUpdateController *)v5 _download];

  v6 = +[SUSUISoftwareUpdateController sharedInstance];
  id v20 = [(SUSUISoftwareUpdateController *)v6 _availableRollback];

  v8 = +[SUSUISoftwareUpdateController sharedInstance];
  id v7 = objc_alloc_init((Class)SUScanOptions);
  id v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  int v13 = sub_14210;
  os_log_type_t v14 = &unk_5EBF0;
  id v15 = v28;
  v19[1] = v26;
  id v16 = location;
  id v17 = v21;
  id v18 = v20;
  v19[0] = v24;
  [(SUSUISoftwareUpdateController *)v8 scanForUpdates:v7 withScanResults:&v10];

  objc_storeStrong(v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&location, 0);
}

- (void)showMiniAlertWithDescriptors:(unint64_t)a3 errorCode:(id)a4 downloadDescriptor:(id)a5 scanResultsDescriptor:(id)a6 autoInstallForecast:(id)a7 andRollbackDescriptor:(id)a8 result:(id)a9
{
  os_log_type_t v22 = self;
  SEL v21 = a2;
  unint64_t v20 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  id v17 = 0;
  objc_storeStrong(&v17, a6);
  id v16 = 0;
  objc_storeStrong(&v16, a7);
  id v15 = 0;
  objc_storeStrong(&v15, a8);
  id v14 = 0;
  objc_storeStrong(&v14, a9);
  BSDispatchQueueAssert();
  id v13 = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    sub_141D8((uint64_t)v23, v20);
    _os_log_impl(&def_46F0, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "Got mini-alert to show: %d", v23, 8u);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v22->stringResponse, @"[] Making alert with given descriptors.\n");
  [(SUSUICommandLineTestServer *)v22 presentMiniAlert:v20 errorCode:location downloadDescriptor:v18 scanResultsDescriptor:v17 autoInstallForecast:v16 andRollbackDescriptor:v15 result:v14];
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&location, 0);
}

- (void)presentMiniAlert:(unint64_t)a3 errorCode:(id)a4 downloadDescriptor:(id)a5 scanResultsDescriptor:(id)a6 autoInstallForecast:(id)a7 andRollbackDescriptor:(id)a8 result:(id)a9
{
  v102 = self;
  SEL v101 = a2;
  unint64_t v100 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v98 = 0;
  objc_storeStrong(&v98, a5);
  id v97 = 0;
  objc_storeStrong(&v97, a6);
  id v96 = 0;
  objc_storeStrong(&v96, a7);
  id v95 = 0;
  objc_storeStrong(&v95, a8);
  id v94 = 0;
  objc_storeStrong(&v94, a9);
  char v92 = 0;
  if (v98
    || (char v65 = 1,
        ![(SUSUICommandLineTestServer *)v102 miniAlertNeedsDownloadDescriptor:v100]))
  {
    if (v97 && (v93 = [v97 preferredDescriptor], char v92 = 1, v93)
      || (char v65 = 1,
          ![(SUSUICommandLineTestServer *)v102 miniAlertNeedsScanResultsDescriptor:v100]))
    {
      if (v96
        || (char v65 = 1,
            ![(SUSUICommandLineTestServer *)v102 miniAlertNeedsAutoInstallForecastDescriptor:v100]))
      {
        unsigned __int8 v64 = 0;
        if (!v95) {
          unsigned __int8 v64 = [(SUSUICommandLineTestServer *)v102 miniAlertNeedsRollbackDescriptor:v100];
        }
        char v65 = v64;
      }
    }
  }
  if (v92) {

  }
  if (v65)
  {
    v9 = [(NSString *)v102->stringResponse stringByAppendingString:@"[] Got empty descriptors. Can't show the alert.\n[] Exits.\n"];
    stringResponse = v102->stringResponse;
    v102->stringResponse = v9;

    if (v94)
    {
      v62 = (void (**)(id, void))v94;
      v61 = v102->stringResponse;
      id v63 = +[NSError buildCheckedSUCoreError:8100 underlying:0 description:@"Got empty descriptors. Can't show the alert."];
      ((void (**)(id, NSString *))v62)[2](v62, v61);
    }
    int v91 = 1;
  }
  else
  {
    char v88 = 0;
    if (v98)
    {
      id v89 = [v98 descriptor];
      char v88 = 1;
      id v11 = v89;
    }
    else
    {
      id v11 = 0;
    }
    id v90 = v11;
    if (v88) {

    }
    v87[8] = 0;
    id v86 = +[SUSUISoftwareUpdateController sharedInstance];
    *(void *)v87 = BYSetupAssistantNeedsToRun() & 1;
    if (v100)
    {
      unint64_t v13 = v100;
      char v12 = 1;
    }
    else
    {
      unint64_t v13 = 0;
      char v12 = 0;
    }
    if (v12)
    {
      os_log_t oslog = (os_log_t)(id)SUSUILog();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_141D8((uint64_t)v103, v100);
        _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "Unrecognized mini-alert to show: %d", v103, 8u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    else
    {
      switch(v13)
      {
        case 0uLL:
          v59 = [SUSUISoftwareUpdateAvailableAlertItem alloc];
          id v60 = [v97 latestUpdate];
          id v14 = -[SUSUIBaseSoftwareUpdateAlertItem initWithDescriptor:softwareUpdateController:](v59, "initWithDescriptor:softwareUpdateController:");
          id v15 = *(void **)&v87[1];
          *(void *)&v87[1] = v14;

          break;
        case 1uLL:
          id v16 = [[SUSUISoftwareUpdateInstallAlertItem alloc] initWithDownload:v98 style:1 softwareUpdateController:v86 tryTonightInstallOperationForecast:v96 installOptions:0];
          id v17 = *(void **)&v87[1];
          *(void *)&v87[1] = v16;

          break;
        case 2uLL:
          id v18 = [[SUSUISoftwareUpdateInstallAlertItem alloc] initWithDownload:v98 style:2 softwareUpdateController:v86 tryTonightInstallOperationForecast:v96 installOptions:0];
          char v19 = *(void **)&v87[1];
          *(void *)&v87[1] = v18;

          break;
        case 3uLL:
          unint64_t v20 = [[SUSUISoftwareUpdateInstallAlertItem alloc] initWithDownload:v98 style:3 softwareUpdateController:v86 tryTonightInstallOperationForecast:v96 installOptions:0];
          SEL v21 = *(void **)&v87[1];
          *(void *)&v87[1] = v20;

          break;
        case 4uLL:
          os_log_type_t v22 = [[SUSUISoftwareUpdateInstallLaterAlertItem alloc] initWithDescriptor:v90 softwareUpdateController:v86 tryTonightOperationForecast:v96];
          id v23 = *(void **)&v87[1];
          *(void *)&v87[1] = v22;

          break;
        case 5uLL:
          if (v87[0])
          {
            id v85 = (id)SUSUILog();
            os_log_type_t v84 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled((os_log_t)v85, OS_LOG_TYPE_DEFAULT))
            {
              log = v85;
              os_log_type_t type = v84;
              sub_5A1C(v83);
              _os_log_impl(&def_46F0, log, type, "Buddy running. Not showing install failure UI", v83, 2u);
            }
            objc_storeStrong(&v85, 0);
          }
          else
          {
            id v24 = [(SUSUIBaseSoftwareUpdateAlertItem *)[SUSUISoftwareUpdateUnableToInstallAlertItem alloc] initWithDescriptor:v90 softwareUpdateController:v86];
            v25 = *(void **)&v87[1];
            *(void *)&v87[1] = v24;

            if (location)
            {
              v58 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SUErrorDomain, [location integerValue], 0);
              objc_msgSend(*(id *)&v87[1], "setError:");
            }
          }
          break;
        case 6uLL:
          v26 = [(SUSUIBaseSoftwareUpdateAlertItem *)[SUSUISoftwareUpdateVerifyingUpdateAlertItem alloc] initWithDescriptor:v90 softwareUpdateController:v86];
          SEL v27 = *(void **)&v87[1];
          *(void *)&v87[1] = v26;

          break;
        case 7uLL:
          if (v87[0])
          {
            id v82 = (id)SUSUILog();
            os_log_type_t v81 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled((os_log_t)v82, OS_LOG_TYPE_DEFAULT))
            {
              v53 = v82;
              os_log_type_t v54 = v81;
              sub_5A1C(v80);
              _os_log_impl(&def_46F0, v53, v54, "Buddy running. Not showing verification failure UI", v80, 2u);
            }
            objc_storeStrong(&v82, 0);
          }
          else
          {
            v28 = [(SUSUIBaseSoftwareUpdateAlertItem *)[SUSUISoftwareUpdateVerificationFailedAlertItem alloc] initWithDescriptor:v90 softwareUpdateController:v86];
            v29 = *(void **)&v87[1];
            *(void *)&v87[1] = v28;

            if (location)
            {
              v55 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SUErrorDomain, [location integerValue], 0);
              objc_msgSend(*(id *)&v87[1], "setError:");
            }
          }
          break;
        case 8uLL:
          if (v87[0])
          {
            id v79 = (id)SUSUILog();
            os_log_type_t v78 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled((os_log_t)v79, OS_LOG_TYPE_DEFAULT))
            {
              v50 = v79;
              os_log_type_t v51 = v78;
              sub_5A1C(v77);
              _os_log_impl(&def_46F0, v50, v51, "Buddy running. Not showing download failure UI", v77, 2u);
            }
            objc_storeStrong(&v79, 0);
          }
          else
          {
            v30 = -[SUSUISoftwareUpdateDownloadFailedAlertItem initWithDescriptor:softwareUpdateController:fromSettings:]([SUSUISoftwareUpdateDownloadFailedAlertItem alloc], "initWithDescriptor:softwareUpdateController:fromSettings:", v90, v86, (unint64_t)[v86 settingsForeground] & 1);
            v31 = *(void **)&v87[1];
            *(void *)&v87[1] = v30;

            if (location)
            {
              v52 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SUErrorDomain, [location integerValue], 0);
              objc_msgSend(*(id *)&v87[1], "setError:");
            }
          }
          break;
        case 9uLL:
          v32 = [(SUSUIBaseRollbackAlertItem *)[SUSUIRollbackCountdownAlertItem alloc] initWithRollbackDescriptor:v95 softwareUpdateController:v86];
          v33 = *(void **)&v87[1];
          *(void *)&v87[1] = v32;

          break;
        case 0xAuLL:
          v34 = [(SUSUIBaseSoftwareUpdateAlertItem *)[SUSUISoftwareUpdateRebootingAlertItem alloc] initWithDescriptor:v90 softwareUpdateController:v86];
          v35 = *(void **)&v87[1];
          *(void *)&v87[1] = v34;

          break;
        case 0xBuLL:
          v36 = objc_alloc_init(SUSUIPostSplatRollbackAlertItem);
          v37 = *(void **)&v87[1];
          *(void *)&v87[1] = v36;

          break;
        case 0xCuLL:
          v49 = [SUSUISetupUpgradeAlertItem alloc];
          v71 = _NSConcreteStackBlock;
          int v72 = -1073741824;
          int v73 = 0;
          v74 = sub_15A88;
          v75 = &unk_5CC30;
          id v76 = *(id *)&v87[1];
          v38 = [(SUSUISetupUpgradeAlertItem *)v49 initWithGoingToSetup:0 isLocked:1 withAcknowledgementBlock:&v71];
          v39 = *(void **)&v87[1];
          *(void *)&v87[1] = v38;

          int v91 = 2;
          objc_storeStrong(&v76, 0);
          break;
        case 0xDuLL:
          v40 = [[SUSUISoftwareUpdateRecommendedAvailableAlertItem alloc] initWithDescriptor:v90 softwareUpdateController:v86];
          v41 = *(void **)&v87[1];
          *(void *)&v87[1] = v40;

          break;
        default:
          JUMPOUT(0);
      }
    }
    objc_msgSend(*(id *)&v87[1], "setIsUILocked:", (unint64_t)objc_msgSend(v86, "isUILocked") & 1);
    if ([v86 presentAlert:*(void *)&v87[1]])
    {
      v42 = [(NSString *)v102->stringResponse stringByAppendingString:@"[] Presenting the alert.\n[] Exits.\n"];
      v43 = v102->stringResponse;
      v102->stringResponse = v42;

      if (v94) {
        (*((void (**)(void))v94 + 2))();
      }
    }
    else
    {
      v44 = [(NSString *)v102->stringResponse stringByAppendingString:@"[] Failed to present the alert.\n[] Exits.\n"];
      v45 = v102->stringResponse;
      v102->stringResponse = v44;

      if (v94)
      {
        v47 = (void (**)(id, void))v94;
        v46 = v102->stringResponse;
        id v48 = +[NSError buildCheckedSUCoreError:8100 underlying:0 description:@"Failed to present the alert due to unknown reason."];
        ((void (**)(id, NSString *))v47)[2](v47, v46);
      }
    }
    objc_storeStrong(&v86, 0);
    objc_storeStrong((id *)&v87[1], 0);
    objc_storeStrong(&v90, 0);
    int v91 = 0;
  }
  objc_storeStrong(&v94, 0);
  objc_storeStrong(&v95, 0);
  objc_storeStrong(&v96, 0);
  objc_storeStrong(&v97, 0);
  objc_storeStrong(&v98, 0);
  objc_storeStrong(&location, 0);
}

- (BOOL)miniAlertNeedsDownloadDescriptor:(unint64_t)a3
{
  return a3 == 1 || a3 == 2 || a3 == 3 || a3 == 4 || a3 == 5 || a3 == 6 || a3 == 7 || a3 == 8 || a3 == 10 || a3 == 13;
}

- (BOOL)miniAlertNeedsScanResultsDescriptor:(unint64_t)a3
{
  return a3 == 0;
}

- (BOOL)miniAlertNeedsAutoInstallForecastDescriptor:(unint64_t)a3
{
  return a3 == 1 || a3 == 2 || a3 == 3 || a3 == 4;
}

- (BOOL)miniAlertNeedsRollbackDescriptor:(unint64_t)a3
{
  return a3 == 9;
}

- (void)destroyInstallationKeybag
{
  v2 = +[SUSUISoftwareUpdateController sharedInstance];
  [(SUSUISoftwareUpdateController *)v2 destroyInstallationKeybag];
}

- (void)dismissAllAlerts
{
  id location[2] = self;
  location[1] = (id)a2;
  BSDispatchQueueAssert();
  location[0] = (id)SUSUILog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    os_log_type_t type = v6;
    sub_5A1C(v5);
    _os_log_impl(&def_46F0, log, type, "About to dismiss all mini alerts", v5, 2u);
  }
  objc_storeStrong(location, 0);
  int v4 = +[SUSUISoftwareUpdateController sharedInstance];
  [(SUSUISoftwareUpdateController *)v4 _dismissAllAlerts];
  objc_storeStrong((id *)&v4, 0);
}

- (void)showFollowUp:(unint64_t)a3
{
  id v10 = self;
  SEL v9 = a2;
  unint64_t v8 = a3;
  BSDispatchQueueAssert();
  os_log_type_t v6 = +[SUSUIPreferences sharedInstance];
  [(SUSUIPreferences *)v6 setNeedsAlertPresentationAfterOTAUpdate:1];

  if (v8)
  {
    id location = (id)SUSUILog();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      sub_16030((uint64_t)v11, v8);
      _os_log_impl(&def_46F0, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "Unknown follow up type: %lu", v11, 0xCu);
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    int v3 = [_SUSUIPostUpdateAlertController alloc];
    id v5 = objc_alloc_init(SUSUILayoutStateMonitor);
    int v4 = [[SUSUIAlertPresentationManager alloc] initWithQueue:v10->_queue];
  }
}

- (void)showLaggardsUi:(unint64_t)a3 usingFakeData:(BOOL)a4 result:(id)a5
{
  v26 = self;
  SEL v25 = a2;
  id v24 = (void *)a3;
  BOOL v23 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  BSDispatchQueueAssert();
  id v21 = (id)SUSUILog();
  os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
  {
    sub_16030((uint64_t)v27, (uint64_t)v24);
    _os_log_impl(&def_46F0, (os_log_t)v21, v20, "Laggards UI type: %lu", v27, 0xCu);
  }
  objc_storeStrong(&v21, 0);
  unint64_t v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  id v16 = sub_16304;
  id v17 = &unk_5EC58;
  v18[1] = v24;
  v18[0] = location;
  char v19 = objc_retainBlock(&v13);
  id v5 = +[SUSUISoftwareUpdateController sharedInstance];
  os_log_type_t v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  SEL v9 = sub_16594;
  id v10 = &unk_5EC80;
  id v11 = location;
  char v12 = v19;
  [(SUSUISoftwareUpdateController *)v5 _discoveredUpdates:&v6];

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v19, 0);
  objc_storeStrong(v18, 0);
  objc_storeStrong(&location, 0);
}

- (void)showAuthenticationUIWithOptions:(unint64_t)a3 result:(id)a4
{
  v38 = self;
  SEL v37 = a2;
  unint64_t v36 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  BSDispatchQueueAssert();
  BOOL v34 = sub_16B80(v36, 4);
  BOOL v33 = sub_16B80(v36, 2);
  BOOL v32 = sub_16B80(v36, 8);
  os_log_type_t v22 = _NSConcreteStackBlock;
  int v23 = -1073741824;
  int v24 = 0;
  SEL v25 = sub_16BBC;
  v26 = &unk_5ECA8;
  BOOL v29 = v34;
  BOOL v30 = v32;
  SEL v27 = v38;
  id v28 = location;
  id v31 = objc_retainBlock(&v22);
  if (v33)
  {
    char v19 = 0;
    if (v34)
    {
      id v20 = objc_alloc_init((Class)SUSUIFakeSUAutoInstallOperation);
      char v19 = 1;
      id v4 = v20;
    }
    else
    {
      id v4 = 0;
    }
    id v21 = v4;
    if (v19) {

    }
    id v18 = objc_alloc_init((Class)SUSUIFakeSUDownload);
    int v8 = (void (**)(id, id))v31;
    id v7 = v18;
    id v9 = [v21 forecast];
    v8[2](v8, v7);

    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v21, 0);
  }
  else
  {
    os_log_type_t v6 = +[SUSUISoftwareUpdateController sharedInstance];
    id v17 = [(SUSUISoftwareUpdateController *)v6 _download];

    if (v34)
    {
      id v5 = +[SUSUISoftwareUpdateController sharedInstance];
      id v10 = _NSConcreteStackBlock;
      int v11 = -1073741824;
      int v12 = 0;
      unint64_t v13 = sub_16DF4;
      int v14 = &unk_5ECD0;
      id v16 = v31;
      id v15 = v17;
      [(SUSUISoftwareUpdateController *)v5 _createInstallTonightForecastWithResult:&v10];

      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v16, 0);
    }
    else
    {
      (*((void (**)(id, id, void))v31 + 2))(v31, v17, 0);
    }
    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong((id *)&v27, 0);
  objc_storeStrong(&location, 0);
}

- (void)showEmergencyCallUIWithOptions:(unint64_t)a3 result:(id)a4
{
  id location[3] = self;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  BSDispatchQueueAssert();
  id v4 = [SUSUIFullScreenEmergencyCallAlert alloc];
  os_log_type_t v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_16FA4;
  id v10 = &unk_5CFD8;
  id v11 = location[0];
  int v12 = -[SUSUIFullScreenEmergencyCallAlert initWithCompletionBlock:](v4, "initWithCompletionBlock:");
  id v5 = +[SUSUISoftwareUpdateController sharedInstance];
  [(SUSUISoftwareUpdateController *)v5 presentEmergencyCallAlert:v12 completion:0];

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)toggleSettingsBadge:(BOOL)a3
{
  id v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  id v6 = objc_alloc_init((Class)SUSUIFakeSUDownload);
  id v5 = +[SUSUISoftwareUpdateController sharedInstance];
  BOOL v3 = v7;
  id v4 = [v6 descriptor];
  -[SUSUISoftwareUpdateController toggleSettingsBadge:update:](v5, "toggleSettingsBadge:update:", v3);

  objc_storeStrong(&v6, 0);
}

- (void)reboot:(BOOL)a3
{
  BOOL v4 = a3;
  BOOL v3 = +[SUSUISoftwareUpdateController sharedInstance];
  [(SUSUISoftwareUpdateController *)v3 reboot:v4];
}

- (void)simulateComingFromOTAUpdate
{
  int v12 = self;
  v11[1] = (id)a2;
  v2 = +[SUSUIPreferences sharedInstance];
  [(SUSUIPreferences *)v2 setNeedsAlertPresentationAfterOTAUpdate:1];

  BOOL v3 = +[NSFileManager defaultManager];
  -[NSFileManager createFileAtPath:contents:attributes:](v3, "createFileAtPath:contents:attributes:", @"/var/mobile/Library/SoftwareUpdate/susdKeepAlive", 0);

  dispatch_time_t when = dispatch_time(0, 5000000000);
  dispatch_queue_t queue = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_1728C;
  id v10 = &unk_5CC30;
  v11[0] = v12;
  dispatch_after(when, queue, &v6);

  objc_storeStrong(v11, 0);
}

- (void)downloadDidFinish
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = +[SUSUISoftwareUpdateController sharedInstance];
  id v3 = [v4[0] _download];
  id v2 = [v4[0] _installPolicy];
  objc_msgSend(v4[0], "client:downloadDidFinish:withInstallPolicy:");
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v4, 0);
}

- (void)setPasscodePolicy:(unint64_t)a3
{
  id v3 = +[SUSUISoftwareUpdateController sharedInstance];
  [(SUSUISoftwareUpdateController *)v3 setPasscodePolicy:a3];
}

- (void)getDDMAlertStatus:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v16 = +[SUSUIDDMController sharedInstance];
    id v15 = [(SUSUIDDMController *)v16 enforcedInstallDate];
    id v14 = [(SUSUIDDMController *)v16 schduledAlertDate];
    char v11 = 0;
    if (v15)
    {
      int v12 = +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v15, 4);
      char v11 = 1;
      id v3 = v12;
    }
    else
    {
      id v3 = @"N/A";
    }
    unint64_t v13 = v3;
    if (v11) {

    }
    char v8 = 0;
    if (v14)
    {
      id v9 = +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v14, 4);
      char v8 = 1;
      BOOL v4 = v9;
    }
    else
    {
      BOOL v4 = @"N/A";
    }
    id v10 = v4;
    if (v8) {

    }
    id v5 = (void (**)(void))location[0];
    v18[0] = @"DDMEnforcedDate";
    v19[0] = v13;
    v18[1] = @"DDMScheduledAlertDate";
    v19[1] = v10;
    id v18[2] = @"DDMScheduledAlertStyle";
    int v7 = SUSUIStringForInstallAlertInstallStyle([(SUSUIDDMController *)v16 scheduledAlertStyle]);
    id v19[2] = v7;
    id v6 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
    v5[2]();

    objc_storeStrong((id *)&v10, 0);
    objc_storeStrong((id *)&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong((id *)&v16, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)showDDMAlert:(int64_t)a3 install:(BOOL)a4
{
  BOOL v6 = a4;
  if (a3 == 0x8000000000000000)
  {
    id v5 = +[SUSUIDDMController sharedInstance];
    [(SUSUIDDMController *)v5 showNextDDMAlert:v6];
  }
  else
  {
    BOOL v4 = +[SUSUIDDMController sharedInstance];
    [(SUSUIDDMController *)v4 showDDMAlert:a3 install:v6];
  }
}

- (void)ddmInstallNow
{
  id location[2] = self;
  location[1] = (id)a2;
  id v3 = +[SUSUIDDMController sharedInstance];
  [(SUSUIDDMController *)v3 installNow];

  location[0] = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = +[SUSUIPreferences sharedInstance];
    sub_141D8((uint64_t)v5, [(SUSUIPreferences *)v2 isSharedIPad] & 1);
    _os_log_impl(&def_46F0, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "issharedipad=%d", v5, 8u);
  }
  objc_storeStrong(location, 0);
}

- (void)getAlertStatus:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v14 = +[SUSUISoftwareUpdateController sharedInstance];
    id v13 = [v14 _alertModel];
    id v5 = (void (**)(void))location[0];
    v16[0] = @"AlertFlow";
    BOOL v6 = SUSUIStringForInstallAlertFlow((uint64_t)[v13 alertFlow]);
    v17[0] = v6;
    v16[1] = @"RepopStrategy";
    int v7 = SUSUIStringForInstallAlertRepopStrategy((uint64_t)[v13 nextAlertRepopStrategy]);
    v17[1] = v7;
    v16[2] = @"NextAlertDate";
    id v8 = [v13 nextAlertDate];
    char v11 = 0;
    char v9 = 0;
    if (v8)
    {
      id v12 = [v13 nextAlertDate];
      char v11 = 1;
      id v10 = +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:");
      char v9 = 1;
      CFStringRef v4 = (const __CFString *)v10;
    }
    else
    {
      CFStringRef v4 = @"N/A";
    }
    v17[2] = v4;
    id v3 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
    v5[2]();

    if (v9) {
    if (v11)
    }

    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)setRestartCountdownOverrideIntervalSeconds:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[SUSUIPreferences sharedInstance];
  [(SUSUIPreferences *)v3 setRestartCountdownOverrideIntervalSeconds:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setInstallOperation:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[SUSUISoftwareUpdateController sharedInstance];
  [(SUSUISoftwareUpdateController *)v3 setInstallOperation:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setUpdateToInstall:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[SUSUISoftwareUpdateController sharedInstance];
  [(SUSUISoftwareUpdateController *)v3 setUpdateToInstall:location[0]];

  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end