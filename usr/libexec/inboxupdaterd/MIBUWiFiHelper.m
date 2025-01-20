@interface MIBUWiFiHelper
+ (MIBUWiFiHelper)sharedInstance;
- (BOOL)_associateFromScanResult:(id)a3 error:(id *)a4;
- (BOOL)_isWiFiConnected;
- (CWFInterface)wifiInterface;
- (MIBUWiFiHelper)init;
- (NSOperationQueue)wifiRetryQueue;
- (OS_dispatch_semaphore)connectionSem;
- (OS_nw_path_monitor)networkMonitor;
- (double)globalRetryInterval;
- (double)localRetryDelay;
- (id)_scanForSSID:(id)a3 error:(id *)a4;
- (int64_t)localRetryLimit;
- (void)_connectToWiFiWithError:(id *)a3;
- (void)_dispatchRetryOperation;
- (void)_enableWiFi:(id *)a3;
- (void)_initNetworkMonitor;
- (void)_retryWiFiConnection:(id *)a3;
- (void)_waitForWiFiConnection:(id *)a3;
- (void)_waitForWiFiInterface:(id *)a3;
- (void)connectAndMonitor:(id *)a3;
- (void)setConnectionSem:(id)a3;
- (void)setGlobalRetryInterval:(double)a3;
- (void)setLocalRetryDelay:(double)a3;
- (void)setLocalRetryLimit:(int64_t)a3;
- (void)setNetworkMonitor:(id)a3;
- (void)setWifiInterface:(id)a3;
- (void)setWifiRetryQueue:(id)a3;
- (void)stopMonitor;
@end

@implementation MIBUWiFiHelper

- (MIBUWiFiHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)MIBUWiFiHelper;
  v2 = [(MIBUWiFiHelper *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(MIBUWiFiHelper *)v2 setWifiInterface:0];
    [(MIBUWiFiHelper *)v3 setConnectionSem:0];
    [(MIBUWiFiHelper *)v3 setNetworkMonitor:0];
    id v4 = objc_alloc_init((Class)NSOperationQueue);
    [(MIBUWiFiHelper *)v3 setWifiRetryQueue:v4];

    v5 = [(MIBUWiFiHelper *)v3 wifiRetryQueue];
    [v5 setMaxConcurrentOperationCount:1];

    v6 = [(MIBUWiFiHelper *)v3 wifiRetryQueue];
    [v6 setName:@"com.apple.mobileinboxupdate.service_queue"];

    [(MIBUWiFiHelper *)v3 setLocalRetryDelay:3.0];
    [(MIBUWiFiHelper *)v3 setLocalRetryLimit:3];
    [(MIBUWiFiHelper *)v3 setGlobalRetryInterval:60.0];
  }
  return v3;
}

+ (MIBUWiFiHelper)sharedInstance
{
  if (qword_10006C900 != -1) {
    dispatch_once(&qword_10006C900, &stru_10005B2E0);
  }
  v2 = (void *)qword_10006C908;

  return (MIBUWiFiHelper *)v2;
}

- (void)connectAndMonitor:(id *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100023950;
  v22 = sub_100023960;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100023950;
  v16[4] = sub_100023960;
  v17 = self;
  id v4 = v17;
  objc_sync_enter(v4);
  v5 = [(MIBUWiFiHelper *)v4 networkMonitor];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    id v7 = objc_alloc_init((Class)CWFInterface);
    [(MIBUWiFiHelper *)v4 setWifiInterface:v7];

    objc_super v8 = [(MIBUWiFiHelper *)v4 wifiInterface];
    [v8 activate];

    [(MIBUWiFiHelper *)v4 _initNetworkMonitor];
    v9 = [(MIBUWiFiHelper *)v4 wifiRetryQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000239D0;
    v15[3] = &unk_10005B328;
    v15[4] = v16;
    v15[5] = &v18;
    v10 = +[NSBlockOperation blockOperationWithBlock:v15];
    [v9 addOperation:v10];

    v11 = [(MIBUWiFiHelper *)v4 wifiRetryQueue];
    [v11 waitUntilAllOperationsAreFinished];
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B300);
    }
    v11 = (id)qword_10006C950;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      sub_1000402F8(v14, (uint64_t)v24, v11);
    }
  }

  objc_sync_exit(v4);
  if (a3) {
    *a3 = (id) v19[5];
  }
  if (v19[5])
  {
    v12 = [(MIBUWiFiHelper *)v4 wifiInterface];
    [v12 invalidate];

    v13 = [(MIBUWiFiHelper *)v4 networkMonitor];
    nw_path_monitor_cancel(v13);

    [(MIBUWiFiHelper *)v4 setNetworkMonitor:0];
  }
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(&v18, 8);
}

- (void)stopMonitor
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MIBUWiFiHelper *)v2 networkMonitor];

  if (v3)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B348);
    }
    id v4 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping network monitoring...", v6, 2u);
    }
    v5 = [(MIBUWiFiHelper *)v2 networkMonitor];
    nw_path_monitor_cancel(v5);

    [(MIBUWiFiHelper *)v2 setNetworkMonitor:0];
  }
  objc_sync_exit(v2);
}

- (void)_initNetworkMonitor
{
  nw_path_monitor_t v3 = nw_path_monitor_create();
  [(MIBUWiFiHelper *)self setNetworkMonitor:v3];

  id v4 = [(MIBUWiFiHelper *)self networkMonitor];
  update_handler[0] = _NSConcreteStackBlock;
  update_handler[1] = 3221225472;
  update_handler[2] = sub_100023C40;
  update_handler[3] = &unk_10005B3B0;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v4, update_handler);

  v5 = [(MIBUWiFiHelper *)self networkMonitor];
  nw_path_monitor_start(v5);
}

- (void)_dispatchRetryOperation
{
  v2 = self;
  objc_sync_enter(v2);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_100023950;
  v11[4] = sub_100023960;
  nw_path_monitor_t v3 = v2;
  v12 = v3;
  id v4 = [(MIBUWiFiHelper *)v3 wifiRetryQueue];
  id v5 = [v4 operationCount];

  if (v5)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B3D0);
    }
    objc_super v8 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WiFi Retry operation already in progress", buf, 2u);
    }
  }
  else
  {
    BOOL v6 = [(MIBUWiFiHelper *)v3 wifiRetryQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100024100;
    v9[3] = &unk_100059DC8;
    v9[4] = v11;
    id v7 = +[NSBlockOperation blockOperationWithBlock:v9];
    [v6 addOperation:v7];
  }
  _Block_object_dispose(v11, 8);

  objc_sync_exit(v3);
}

- (void)_retryWiFiConnection:(id *)a3
{
  if ([(MIBUWiFiHelper *)self _isWiFiConnected])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B450);
    }
    objc_super v8 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device already connected to wifi", buf, 2u);
    }
    BOOL v6 = 0;
    if (a3) {
      goto LABEL_6;
    }
  }
  else
  {
    id v11 = 0;
    [(MIBUWiFiHelper *)self _enableWiFi:&v11];
    id v5 = v11;
    if (!v5)
    {
      id v10 = 0;
      [(MIBUWiFiHelper *)self _connectToWiFiWithError:&v10];
      id v5 = v10;
      if (!v5)
      {
        id v9 = 0;
        [(MIBUWiFiHelper *)self _waitForWiFiConnection:&v9];
        id v5 = v9;
      }
    }
    BOOL v6 = v5;
    if (a3) {
LABEL_6:
    }
      *a3 = v6;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B470);
  }
  id v7 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Connection retry finished with error: %{public}@", buf, 0xCu);
  }
}

- (BOOL)_isWiFiConnected
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v2 = nw_parameters_create();
  nw_parameters_set_multipath_service(v2, nw_multipath_service_handover);
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002484C;
  v7[3] = &unk_10005B498;
  id v4 = (id)nw_path_evaluator_copy_path();
  objc_super v8 = v4;
  id v9 = &v10;
  nw_path_enumerate_interfaces(v4, v7);
  char v5 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)_enableWiFi:(id *)a3
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B4B8);
  }
  char v5 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enabling WiFi interface on device", buf, 2u);
  }
  id v33 = 0;
  [(MIBUWiFiHelper *)self _waitForWiFiInterface:&v33];
  id v6 = v33;
  if (v6)
  {
    id v13 = v6;
    sub_1000102B8(a3, 1879048192, v6, @"Failed to wait for wifi interface", v7, v8, v9, v10, (uint64_t)v32);
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B4D8);
    }
    uint64_t v18 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_1000403D0((uint64_t)v13, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  else
  {
    id v11 = [(MIBUWiFiHelper *)self wifiInterface];
    id v32 = 0;
    unsigned __int8 v12 = [v11 setPower:1 error:&v32];
    id v13 = v32;

    if ((v12 & 1) == 0)
    {
      sub_1000102B8(a3, 1879048192, v13, @"Failed to set wifi power state", v14, v15, v16, v17, (uint64_t)v32);
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B4F8);
      }
      v25 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_100040364((uint64_t)v13, v25, v26, v27, v28, v29, v30, v31);
      }
    }
  }
}

- (void)_connectToWiFiWithError:(id *)a3
{
  if (os_variant_has_internal_content()
    && (+[MIBUTestPreferences sharedInstance],
        char v5 = objc_claimAutoreleasedReturnValue(),
        [v5 wifiSSID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    uint64_t v7 = +[MIBUTestPreferences sharedInstance];
    uint64_t v8 = [v7 wifiSSID];

    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B518);
    }
    uint64_t v9 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Overriding wifi SSID to: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = @"neon";
  }
  id v27 = 0;
  uint64_t v10 = [(MIBUWiFiHelper *)self _scanForSSID:v8 error:&v27];
  id v11 = v27;
  uint64_t v16 = v11;
  if (v10)
  {
    id v26 = v11;
    unsigned __int8 v17 = [(MIBUWiFiHelper *)self _associateFromScanResult:v10 error:&v26];
    id v18 = v26;

    if (v17)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B578);
      }
      uint64_t v23 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v8;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Successfully connected to SSID: %{public}@!", buf, 0xCu);
      }
    }
    else
    {
      sub_1000102B8(a3, 1879048194, v18, @"Failed to associate to ssid", v19, v20, v21, v22, (uint64_t)v26);
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B558);
      }
      v25 = (void *)qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_1000404D0((uint64_t)v8, v25, self);
      }
    }
    uint64_t v16 = v18;
  }
  else
  {
    sub_1000102B8(a3, 1879048193, v11, @"Failed to find matching ssid", v12, v13, v14, v15, (uint64_t)v26);
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B538);
    }
    uint64_t v24 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10004043C((uint64_t)v8, v24, self);
    }
  }
}

- (void)_waitForWiFiInterface:(id *)a3
{
  id v5 = objc_alloc_init((Class)NSCondition);
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
  uint64_t v7 = [(MIBUWiFiHelper *)self wifiInterface];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000253BC;
  v27[3] = &unk_10005B5C0;
  id v8 = v5;
  id v28 = v8;
  [v7 setEventHandler:v27];

  uint64_t v9 = [(MIBUWiFiHelper *)self wifiInterface];
  id v26 = 0;
  unsigned __int8 v10 = [v9 startMonitoringEventType:10 error:&v26];
  id v11 = v26;

  if (v10)
  {
    [v8 lock];
    while (1)
    {
      uint64_t v12 = [(MIBUWiFiHelper *)self wifiInterface];
      uint64_t v13 = [v12 interfaceName];

      if (v13) {
        break;
      }
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B600);
      }
      uint64_t v14 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Wifi interface is not intialized, waiting for  CWFEventTypeInterfaceAdded event.", buf, 2u);
      }
      if (([v8 waitUntilDate:v6] & 1) == 0)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005B620);
        }
        uint64_t v15 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Wait for wifi interface initialization timed out after 5 seconds", buf, 2u);
        }
        break;
      }
    }
    [v8 unlock];
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B640);
    }
    uint64_t v16 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Wifi interface is initialized!", buf, 2u);
    }
    unsigned __int8 v17 = [(MIBUWiFiHelper *)self wifiInterface];
    [v17 stopMonitoringEventType:10];
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B5E0);
    }
    id v18 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040564((uint64_t)v11, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  if (a3) {
    *a3 = v11;
  }
}

- (void)_waitForWiFiConnection:(id *)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  [(MIBUWiFiHelper *)self setConnectionSem:v5];

  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B660);
  }
  uint64_t v7 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v17 = 30;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Waiting %ds for network connection...", buf, 8u);
  }
  id v8 = [(MIBUWiFiHelper *)self connectionSem];
  id v9 = (id)dispatch_semaphore_wait(v8, v6);

  if (v9)
  {
    if ([(MIBUWiFiHelper *)self _isWiFiConnected])
    {
      id v9 = 0;
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B680);
      }
      unsigned __int8 v10 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_1000405D0(v10);
      }
      id v15 = 0;
      sub_1000102B8(&v15, 1879048195, 0, @"No network connection after %ds", v11, v12, v13, v14, 30);
      id v9 = v15;
    }
  }
  [(MIBUWiFiHelper *)self setConnectionSem:0];
  if (a3) {
    *a3 = v9;
  }
}

- (id)_scanForSSID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v41 = objc_alloc_init((Class)CWFScanParameters);
  int64_t v6 = [(MIBUWiFiHelper *)self localRetryLimit];
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B6A0);
  }
  uint64_t v7 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v48 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scanning for wifi with SSID: %{public}@", buf, 0xCu);
  }
  [v41 setIncludeHiddenNetworks:1];
  [v41 setSSID:v5];
  [v41 setBSSType:2];
  id v8 = 0;
  id v9 = 0;
  *(void *)&long long v10 = 138543618;
  long long v37 = v10;
  v39 = self;
  while (1)
  {
    uint64_t v11 = v9;
    uint64_t v12 = v8;
    uint64_t v13 = [(MIBUWiFiHelper *)self wifiInterface];
    id v46 = v9;
    id v8 = [v13 performScanWithParameters:v41 error:&v46];
    id v9 = v46;

    if (!v9) {
      break;
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B6C0);
    }
    uint64_t v14 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v37;
      id v48 = v5;
      __int16 v49 = 2114;
      id v50 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to scan for SSID: %{public}@ with error:%{public}@", buf, 0x16u);
    }
LABEL_38:
    if (!--v6)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B740);
      }
      id v32 = a4;
      id v33 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v48 = v5;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "All wifi scan tries exhausted; %{public}@ not found",
          buf,
          0xCu);
      }
      id v19 = 0;
      if (!a4) {
        goto LABEL_45;
      }
LABEL_44:
      *id v32 = v9;
      goto LABEL_45;
    }
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B6E0);
  }
  id v15 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v48 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "WiFi scan found results: %{public}@", buf, 0xCu);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v16 = v8;
  id v17 = [v16 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (!v17)
  {

LABEL_33:
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B700);
    }
    id v28 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = v28;
      [(MIBUWiFiHelper *)self localRetryDelay];
      *(_DWORD *)buf = 138543874;
      id v48 = v5;
      __int16 v49 = 2048;
      id v50 = v30;
      __int16 v51 = 2048;
      int64_t v52 = v6 - 1;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "SSID %{public}@ not found, waiting for %lfs and rescan (%lu tries remaining)", buf, 0x20u);
    }
    [(MIBUWiFiHelper *)self localRetryDelay];
    sleep(v31);
    goto LABEL_38;
  }
  id v18 = v17;
  v40 = v8;
  id v19 = 0;
  uint64_t v20 = *(void *)v43;
  do
  {
    uint64_t v21 = 0;
    do
    {
      if (*(void *)v43 != v20) {
        objc_enumerationMutation(v16);
      }
      uint64_t v22 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v21);
      uint64_t v23 = [v22 networkName];
      if ([v23 isEqualToString:v5])
      {
        unsigned int v24 = [v22 isEAP];

        if (v24)
        {
          if (v19)
          {
            id v25 = [v22 RSSI];
            if ((uint64_t)v25 > (uint64_t)[v19 RSSI])
            {
              id v26 = v22;

              id v19 = v26;
            }
          }
          else
          {
            id v19 = v22;
          }
        }
      }
      else
      {
      }
      uint64_t v21 = (char *)v21 + 1;
    }
    while (v18 != v21);
    id v27 = [v16 countByEnumeratingWithState:&v42 objects:v53 count:16];
    id v18 = v27;
  }
  while (v27);

  id v9 = 0;
  id v8 = v40;
  self = v39;
  if (!v19) {
    goto LABEL_33;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B720);
  }
  id v32 = a4;
  v36 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v48 = v19;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Found scan result with highest RSSI: %{public}@", buf, 0xCu);
  }
  id v9 = 0;
  if (a4) {
    goto LABEL_44;
  }
LABEL_45:
  id v34 = v19;

  return v34;
}

- (BOOL)_associateFromScanResult:(id)a3 error:(id *)a4
{
  id v29 = a3;
  uint64_t v44 = 0;
  long long v45 = (id *)&v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_100023950;
  id v48 = sub_100023960;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = sub_100023950;
  long long v42 = sub_100023960;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100023950;
  v36 = sub_100023960;
  id v37 = 0;
  id v28 = objc_opt_new();
  int64_t v6 = [(MIBUWiFiHelper *)self localRetryLimit];
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005B760);
  }
  uint64_t v7 = (id)qword_10006C950;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v29 networkName];
    *(_DWORD *)buf = 138543362;
    __int16 v51 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Associating with SSID: %{public}@", buf, 0xCu);
  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100026750;
  v31[3] = &unk_10005B788;
  v31[4] = &v44;
  v31[5] = &v38;
  v31[6] = &v32;
  +[MIBUCertHelper trustCertificatesWithCompletion:v31];
  id v9 = v45[5];
  if (v9)
  {
    id v12 = 0;
    unsigned __int8 v22 = 0;
    *a4 = v9;
  }
  else
  {
    [v28 setObject:&off_1000612D0 forKey:@"AcceptEAPTypes"];
    long long v10 = (void *)v39[5];
    if (v10 && [v10 count]) {
      [v28 setObject:v39[5] forKey:@"TLSTrustedCertificates"];
    }
    uint64_t v11 = (void *)v33[5];
    if (v11 && [v11 count]) {
      [v28 setObject:v33[5] forKey:@"TLSTrustedServerNames"];
    }
    id v12 = objc_alloc_init((Class)CWFAssocParameters);
    [v12 setScanResult:v29];
    [v12 setRememberUponSuccessfulAssociation:0];
    id v13 = objc_alloc_init((Class)CWFNetworkProfile);
    [v12 setKnownNetworkProfile:v13];

    uint64_t v14 = [v12 knownNetworkProfile];
    [v14 setHiddenState:1];

    id v15 = [v12 knownNetworkProfile];
    [v15 setEAPProfile:v28];

    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B7A8);
    }
    id v16 = (id)qword_10006C950;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v12 knownNetworkProfile];
      id v18 = [v17 EAPProfile];
      *(_DWORD *)buf = 138543362;
      __int16 v51 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "EAP Profile: %{public}@", buf, 0xCu);
    }
    int64_t v19 = v6 - 1;
    do
    {
      uint64_t v20 = [(MIBUWiFiHelper *)self wifiInterface];
      uint64_t v21 = v45;
      id obj = v45[5];
      unsigned __int8 v22 = [v20 associateWithParameters:v12 error:&obj];
      objc_storeStrong(v21 + 5, obj);

      if (v22) {
        break;
      }
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005B7C8);
      }
      uint64_t v23 = (id)qword_10006C950;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v24 = [v29 networkName];
        [(MIBUWiFiHelper *)self localRetryDelay];
        *(_DWORD *)buf = 138543874;
        __int16 v51 = v24;
        __int16 v52 = 2048;
        uint64_t v53 = v25;
        __int16 v54 = 2048;
        int64_t v55 = v19;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to associate to %{public}@, waiting for %lfs and re-associate (%lu tries remaining)", buf, 0x20u);
      }
      [(MIBUWiFiHelper *)self localRetryDelay];
      sleep(v26);
      --v19;
    }
    while (v19 != -1);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v22;
}

- (CWFInterface)wifiInterface
{
  return self->_wifiInterface;
}

- (void)setWifiInterface:(id)a3
{
}

- (OS_nw_path_monitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
}

- (OS_dispatch_semaphore)connectionSem
{
  return self->_connectionSem;
}

- (void)setConnectionSem:(id)a3
{
}

- (NSOperationQueue)wifiRetryQueue
{
  return self->_wifiRetryQueue;
}

- (void)setWifiRetryQueue:(id)a3
{
}

- (int64_t)localRetryLimit
{
  return self->_localRetryLimit;
}

- (void)setLocalRetryLimit:(int64_t)a3
{
  self->_localRetryLimit = a3;
}

- (double)localRetryDelay
{
  return self->_localRetryDelay;
}

- (void)setLocalRetryDelay:(double)a3
{
  self->_localRetryDelay = a3;
}

- (double)globalRetryInterval
{
  return self->_globalRetryInterval;
}

- (void)setGlobalRetryInterval:(double)a3
{
  self->_globalRetryInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiRetryQueue, 0);
  objc_storeStrong((id *)&self->_connectionSem, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);

  objc_storeStrong((id *)&self->_wifiInterface, 0);
}

@end