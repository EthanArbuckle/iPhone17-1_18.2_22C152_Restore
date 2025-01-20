@interface MIBUDiagnosticsController
- (BOOL)terminate:(id *)a3;
- (DADiagnosticsLauncher)diagsLauncher;
- (MIBUDiagnosticsController)initWithDelegate:(id)a3;
- (MIBUDiagnosticsDelegate)delegate;
- (MIBUWiFiHelper)wifiHelper;
- (void)diagnosticsAppDidExitWithReason:(int64_t)a3;
- (void)diagnosticsAppLaunchedWithResult:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDiagsLauncher:(id)a3;
- (void)setWifiHelper:(id)a3;
- (void)start;
@end

@implementation MIBUDiagnosticsController

- (MIBUDiagnosticsController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MIBUDiagnosticsController;
  v5 = [(MIBUDiagnosticsController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(MIBUDiagnosticsController *)v5 setDelegate:v4];
    v7 = +[MIBUWiFiHelper sharedInstance];
    [(MIBUDiagnosticsController *)v6 setWifiHelper:v7];

    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v8 = (void *)qword_10006C8A8;
    uint64_t v17 = qword_10006C8A8;
    if (!qword_10006C8A8)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100013598;
      v13[3] = &unk_100059DC8;
      v13[4] = &v14;
      sub_100013598((uint64_t)v13);
      v8 = (void *)v15[3];
    }
    v9 = v8;
    _Block_object_dispose(&v14, 8);
    id v10 = [[v9 alloc] initWithDelegate:v6];
    [(MIBUDiagnosticsController *)v6 setDiagsLauncher:v10];
  }
  return v6;
}

- (void)start
{
  uint64_t v31 = 0;
  v32 = (id *)&v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_100012AA8;
  v35 = sub_100012AB8;
  id v36 = 0;
  v2 = self;
  objc_sync_enter(v2);
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059C50);
  }
  v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting diagnostics controller...", buf, 2u);
  }
  id v4 = [(MIBUDiagnosticsController *)v2 diagsLauncher];

  if (!v4)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059C70);
    }
    v11 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F178(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012B90;
    block[3] = &unk_100059C98;
    block[4] = v2;
    block[5] = &v31;
    id v10 = block;
    goto LABEL_19;
  }
  if (os_variant_has_internal_content())
  {
    v5 = +[MIBUTestPreferences sharedInstance];
    unsigned int v6 = [v5 skipWiFiAssociation];

    if (v6)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059CB8);
      }
      v7 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Skipping WiFi Association...", buf, 2u);
      }
      goto LABEL_13;
    }
  }
  v8 = [(MIBUDiagnosticsController *)v2 wifiHelper];
  v9 = v32;
  id obj = v32[5];
  [v8 connectAndMonitor:&obj];
  objc_storeStrong(v9 + 5, obj);

  if (!v32[5])
  {
LABEL_13:
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100012CE0;
    v27[3] = &unk_100059D00;
    v27[4] = v2;
    id v10 = v27;
LABEL_19:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    goto LABEL_20;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059CD8);
  }
  v19 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
    sub_10003F1B0(v19, v20, v21, v22, v23, v24, v25, v26);
  }
LABEL_20:
  objc_sync_exit(v2);

  _Block_object_dispose(&v31, 8);
}

- (BOOL)terminate:(id *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059D20);
  }
  v5 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Terminating diagnostics controller...", buf, 2u);
  }
  unsigned int v6 = [(MIBUDiagnosticsController *)v4 wifiHelper];
  [v6 stopMonitor];

  v7 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:@"com.apple.Diagnostics"];
  id v8 = [objc_alloc((Class)RBSTerminateContext) initWithExplanation:@"Terminated by inboxupdaterd"];
  id v9 = [objc_alloc((Class)RBSTerminateRequest) initWithPredicate:v7 context:v8];
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059D40);
  }
  id v10 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v15 = @"com.apple.Diagnostics";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Terminating app: %{public}@", buf, 0xCu);
  }
  id v13 = 0;
  unsigned __int8 v11 = [v9 execute:&v13];
  if (a3) {
    *a3 = v13;
  }

  objc_sync_exit(v4);
  return v11;
}

- (void)diagnosticsAppLaunchedWithResult:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v14 = 0;
    sub_1000102B8(&v14, 3221225472, 0, @"Diagnostics app failed to launch!", v3, v4, v5, v6, v12);
    id v10 = v14;
LABEL_12:
    id v9 = v10;
    goto LABEL_13;
  }
  if (a3 == 1)
  {
    CFStringRef v15 = 0;
    sub_1000102B8(&v15, 3221225472, 0, @"Diagnostics app launched, but unable to communicate with launcher service over XPC", v3, v4, v5, v6, v12);
    id v10 = v15;
    goto LABEL_12;
  }
  if (a3)
  {
    id v13 = 0;
    sub_1000102B8(&v13, 3221225472, 0, @"Unhandled Diagnostics app launch result %ld.", v3, v4, v5, v6, a3);
    id v10 = v13;
    goto LABEL_12;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059D60);
  }
  id v8 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Diagnostics app launched successfully. Waiting for exit...", buf, 2u);
  }
  id v9 = 0;
LABEL_13:
  unsigned __int8 v11 = [(MIBUDiagnosticsController *)self delegate];
  [v11 appDidLaunchWithError:v9];
}

- (void)diagnosticsAppDidExitWithReason:(int64_t)a3
{
  switch(a3)
  {
    case -1:
      uint64_t v20 = 0;
      sub_1000102B8(&v20, 3221225477, 0, @"Diagnostics app exited without sending a reason", v3, v4, v5, v6, v13);
      id v8 = v20;
      goto LABEL_18;
    case 0:
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059D80);
      }
      id v9 = qword_10006C950;
      if (!os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      id v10 = "Diagnostics app was exited by the user.";
      goto LABEL_12;
    case 2:
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059DA0);
      }
      id v9 = qword_10006C950;
      if (!os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      id v10 = "Diagnostics app was exited because the session archived.";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
LABEL_13:
      id v11 = 0;
      break;
    case 3:
      uint64_t v18 = 0;
      sub_1000102B8(&v18, 3221225473, 0, @"Diagnostics app was exited because of a fatal AST2 error", v3, v4, v5, v6, v13);
      id v8 = v18;
      goto LABEL_18;
    case 4:
      uint64_t v17 = 0;
      sub_1000102B8(&v17, 3221225474, 0, @"Diagnostics app was exited because the network is not reachable.", v3, v4, v5, v6, v13);
      id v8 = v17;
      goto LABEL_18;
    case 5:
      uint64_t v16 = 0;
      sub_1000102B8(&v16, 3221225475, 0, @"Diagnostics app was exited due to inactivity.", v3, v4, v5, v6, v13);
      id v8 = v16;
      goto LABEL_18;
    case 6:
      CFStringRef v15 = 0;
      sub_1000102B8(&v15, 3221225476, 0, @"Diagnostics app exited due to a fatal error.", v3, v4, v5, v6, v13);
      id v8 = v15;
      goto LABEL_18;
    default:
      uint64_t v14 = 0;
      sub_1000102B8(&v14, 3221225477, 0, @"Unhandled Diagnostics app exit reason: %ld", v3, v4, v5, v6, a3);
      id v8 = v14;
LABEL_18:
      id v11 = v8;
      break;
  }
  uint64_t v12 = [(MIBUDiagnosticsController *)self delegate];
  [v12 appDidExitWithError:v11];
}

- (MIBUDiagnosticsDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (MIBUWiFiHelper)wifiHelper
{
  return self->_wifiHelper;
}

- (void)setWifiHelper:(id)a3
{
}

- (DADiagnosticsLauncher)diagsLauncher
{
  return self->_diagsLauncher;
}

- (void)setDiagsLauncher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagsLauncher, 0);
  objc_storeStrong((id *)&self->_wifiHelper, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end