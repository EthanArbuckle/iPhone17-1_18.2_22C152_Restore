@interface MIBUNFCController
- (BOOL)_isHeartbeatMode;
- (BOOL)isNFCConfigured;
- (BOOL)terminated;
- (MIBUHCESession)session;
- (MIBUNFCController)initWithDelegate:(id)a3;
- (MIBUNFCControllerDelegate)delegate;
- (NSDictionary)dispatchTable;
- (NSMutableArray)observers;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)heartbeatConnectionSem;
- (PCPersistentTimer)nfcInactivityTimer;
- (PCPersistentTimer)sessionRestartTimer;
- (double)heartbeatPeriod;
- (double)nfcInactivityTimeout;
- (id)_getDispatchTable;
- (id)_handleConfigureNFC:(id)a3;
- (id)_handleDeviceInfo:(id)a3;
- (id)_handleHeartbeat:(id)a3;
- (id)_handleInstallUpdate:(id *)a3;
- (id)_handleNetworkInfo:(id *)a3;
- (id)_handleRetryAfter:(id)a3;
- (id)_handleSelect:(id)a3;
- (id)_handleStartDiag:(id)a3;
- (id)_handleStartUpdate:(id)a3;
- (id)_handleStatusUpdate:(id)a3;
- (id)handleCommand:(id)a3;
- (void)_nfcInactivityTimeoutHandler:(id)a3;
- (void)_resetNFCInactivityTimer;
- (void)_restartSession:(id)a3;
- (void)_restartSessionAfter:(double)a3 forceTerminate:(BOOL)a4 andCompletion:(id)a5;
- (void)_startHCESession:(id *)a3;
- (void)_startNFCInactivityTimer:(double)a3;
- (void)_startSessionRestartTimer:(double)a3 error:(id *)a4;
- (void)_stopNFCInactivityTimer;
- (void)_stopSessionRestartTimer;
- (void)_verifyTatsuTicketFromCmd:(id)a3 error:(id *)a4;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidEndUnexpectedly:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchTable:(id)a3;
- (void)setHeartbeatConnectionSem:(id)a3;
- (void)setHeartbeatPeriod:(double)a3;
- (void)setIsNFCConfigured:(BOOL)a3;
- (void)setNfcInactivityTimeout:(double)a3;
- (void)setNfcInactivityTimer:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionRestartTimer:(id)a3;
- (void)setTerminated:(BOOL)a3;
- (void)start:(id *)a3;
- (void)terminate:(id *)a3;
- (void)terminateWithCompletion:(id)a3;
@end

@implementation MIBUNFCController

- (MIBUNFCController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MIBUNFCController;
  v5 = [(MIBUNFCController *)&v12 init];
  if (v5)
  {
    v6 = [[MIBUHCESession alloc] initWithDelegate:v5];
    [(MIBUNFCController *)v5 setSession:v6];

    v7 = [(MIBUNFCController *)v5 _getDispatchTable];
    [(MIBUNFCController *)v5 setDispatchTable:v7];

    [(MIBUNFCController *)v5 setDelegate:v4];
    v8 = objc_opt_new();
    [(MIBUNFCController *)v5 setObservers:v8];

    [(MIBUNFCController *)v5 setSessionRestartTimer:0];
    [(MIBUNFCController *)v5 setNfcInactivityTimer:0];
    [(MIBUNFCController *)v5 setHeartbeatConnectionSem:0];
    [(MIBUNFCController *)v5 setHeartbeatPeriod:0.0];
    [(MIBUNFCController *)v5 setNfcInactivityTimeout:0.0];
    [(MIBUNFCController *)v5 setIsNFCConfigured:0];
    v9 = dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mibu_nfc_task_queue", v9);
    [(MIBUNFCController *)v5 setQueue:v10];
  }
  return v5;
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(MIBUNFCController *)v4 observers];
  unsigned __int8 v6 = [v5 containsObject:v8];

  if ((v6 & 1) == 0)
  {
    v7 = [(MIBUNFCController *)v4 observers];
    [v7 addObject:v8];
  }
  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(MIBUNFCController *)v4 observers];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)start:(id *)a3
{
  id v6 = 0;
  [(MIBUNFCController *)self _startHCESession:&v6];
  id v5 = v6;
  if (!v5) {
    [(MIBUNFCController *)self setTerminated:0];
  }
  if (a3) {
    *a3 = v5;
  }
}

- (void)terminate:(id *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100009544;
  v22 = sub_100009554;
  id v23 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  dispatch_time_t v6 = dispatch_time(0, 60000000000);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000955C;
  v15[3] = &unk_100058F48;
  v17 = &v18;
  v7 = v5;
  v16 = v7;
  [(MIBUNFCController *)self terminateWithCompletion:v15];
  if (dispatch_semaphore_wait(v7, v6))
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058F68);
    }
    id v8 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003DE94(v8);
    }
    v13 = (id *)(v19 + 5);
    id obj = (id)v19[5];
    sub_1000102B8(&obj, 83886087, 0, @"NFC termination wait timed out after %ds", v9, v10, v11, v12, 60);
    objc_storeStrong(v13, obj);
  }
  if (a3) {
    *a3 = (id) v19[5];
  }

  _Block_object_dispose(&v18, 8);
}

- (void)terminateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  if ([(MIBUNFCController *)self _isHeartbeatMode])
  {
    id v11 = 0;
    uint64_t v5 = objc_opt_class();
    sub_1000102B8(&v11, 2147483651, 0, @"Cannot terminate %{public}@ in heartbeat mode", v6, v7, v8, v9, v5);
    id v10 = v11;
    if (v4) {
      v4[2](v4, v10);
    }
  }
  else
  {
    [(MIBUNFCController *)self setTerminated:1];
    [(MIBUNFCController *)self _restartSessionAfter:0 forceTerminate:v4 andCompletion:0.0];
  }
}

- (id)handleCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
  uint64_t v7 = [(MIBUNFCController *)self nfcInactivityTimer];

  if (v7) {
    [(MIBUNFCController *)self _resetNFCInactivityTimer];
  }
  uint64_t v8 = [(MIBUNFCController *)self delegate];
  unsigned int v9 = [v8 isCommandAllowed:v6];

  if (!v9) {
    goto LABEL_20;
  }
  id v10 = [(MIBUNFCController *)self dispatchTable];
  id v11 = [v10 allKeys];
  unsigned __int8 v12 = [v11 containsObject:v6];

  if ((v12 & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058F88);
    }
    v26 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003DF14(v26, v4);
    }
LABEL_20:
    [v5 setRejected:1];
    goto LABEL_13;
  }
  v13 = [(MIBUNFCController *)self dispatchTable];
  v14 = [v13 objectForKey:v6];
  SEL v15 = NSSelectorFromString(v14);

  v16 = ((void (*)(MIBUNFCController *, SEL, id))[(MIBUNFCController *)self methodForSelector:v15])(self, v15, v4);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v17 = [(MIBUNFCController *)self observers];
  id v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v23 = [v16 error];
        [v22 didHandleCommand:v4 withError:v23];
      }
      id v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v19);
  }

  uint64_t v5 = v16;
LABEL_13:
  id v24 = v5;

  return v24;
}

- (void)sessionDidConnect:(id)a3
{
  if ([(MIBUNFCController *)self _isHeartbeatMode])
  {
    id v4 = [(MIBUNFCController *)self heartbeatConnectionSem];
    dispatch_semaphore_signal(v4);

    [(MIBUNFCController *)self heartbeatPeriod];
    -[MIBUNFCController _restartSessionAfter:forceTerminate:andCompletion:](self, "_restartSessionAfter:forceTerminate:andCompletion:", 1, 0);
  }
}

- (void)sessionDidEndUnexpectedly:(id)a3
{
  if (![(MIBUNFCController *)self terminated])
  {
    [(MIBUNFCController *)self _restartSessionAfter:1 forceTerminate:0 andCompletion:1.0];
  }
}

- (id)_getDispatchTable
{
  v4[0] = &off_10005FE20;
  v4[1] = &off_10005FE38;
  v5[0] = @"_handleSelect:";
  v5[1] = @"_handleDeviceInfo:";
  v4[2] = &off_10005FE50;
  v4[3] = &off_10005FE68;
  v5[2] = @"_handleStartUpdate:";
  v5[3] = @"_handleStatusUpdate:";
  v4[4] = &off_10005FE80;
  v4[5] = &off_10005FE98;
  v5[4] = @"_handleRetryAfter:";
  v5[5] = @"_handleHeartbeat:";
  v4[6] = &off_10005FEB0;
  v4[7] = &off_10005FEC8;
  v5[6] = @"_handleInstallUpdate:";
  v5[7] = @"_handleNetworkInfo:";
  v4[8] = &off_10005FEE0;
  v4[9] = &off_10005FEF8;
  v5[8] = @"_handleConfigureNFC:";
  v5[9] = @"_handleStartDiag:";
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:10];

  return v2;
}

- (id)_handleSelect:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100058FA8);
  }
  uint64_t v5 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling select command...", (uint8_t *)&v12, 2u);
  }
  uint64_t v6 = +[NSData dataWithBytes:&unk_1000509C8 length:7];
  uint64_t v7 = [v3 payload];

  uint64_t v8 = [v7 objectForKey:@"ApplicationID"];

  if ([v6 isEqualToData:v8])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058FE8);
    }
    unsigned int v9 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      v13 = v8;
      __int16 v14 = 1024;
      int v15 = 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Selecting AID: %@; returning protocol version: %d",
        (uint8_t *)&v12,
        0x12u);
    }
    [v4 setProtocolVersion:&off_10005FF10];
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100058FC8);
    }
    id v11 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AID %@ not supported", (uint8_t *)&v12, 0xCu);
    }
    [v4 setRejected:1];
  }

  return v4;
}

- (id)_handleDeviceInfo:(id)a3
{
  id v3 = objc_opt_new();
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059008);
  }
  id v4 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling device info command...", buf, 2u);
  }
  unsigned int v9 = (void *)MGCopyAnswer();
  if (!v9)
  {
    v58 = 0;
    sub_1000102B8(&v58, 100663299, 0, @"Failed to fetch device serial number", v5, v6, v7, v8, v51);
    v26 = v58;
LABEL_28:
    id v24 = v26;
    goto LABEL_19;
  }
  uint64_t v10 = MGCopyAnswer();
  if (!v10)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059028);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003DFB0();
    }
    v57 = 0;
    sub_1000102B8(&v57, 100663299, 0, @"Failed to fetch device ecid", v27, v28, v29, v30, v51);
    v26 = v57;
    goto LABEL_28;
  }
  id v11 = (void *)v10;
  uint64_t v12 = MGCopyAnswer();
  if (!v12)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059048);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003DFE4();
    }
    id v56 = 0;
    sub_1000102B8(&v56, 100663299, 0, @"Failed to fetch device boardID", v31, v32, v33, v34, v51);
    id v24 = v56;
    goto LABEL_56;
  }
  v13 = (void *)v12;
  uint64_t v14 = MGCopyAnswer();
  if (!v14)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059068);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E018();
    }
    id v55 = 0;
    sub_1000102B8(&v55, 100663299, 0, @"Failed to fetch device chipID", v35, v36, v37, v38, v51);
    id v24 = v55;
    goto LABEL_55;
  }
  int v15 = (void *)v14;
  uint64_t v16 = MGCopyAnswer();
  if (!v16)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059088);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E04C();
    }
    id v54 = 0;
    sub_1000102B8(&v54, 100663299, 0, @"Failed to fetch device security domain", v39, v40, v41, v42, v51);
    id v24 = v54;
    goto LABEL_54;
  }
  v17 = (void *)v16;
  uint64_t v18 = +[MIBUTatsuVerifier apNonce];
  if (!v18)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000590A8);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E080();
    }
    id v53 = 0;
    sub_1000102B8(&v53, 100663299, 0, @"Failed to fetch device apNonce", v43, v44, v45, v46, v51);
    id v24 = v53;

    goto LABEL_54;
  }
  id v19 = (void *)v18;
  uint64_t v20 = +[MIBUTatsuVerifier sepNonce];
  if (!v20)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000590C8);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E0B4();
    }
    id v52 = 0;
    sub_1000102B8(&v52, 100663299, 0, @"Failed to fetch device sepNonce", v47, v48, v49, v50, v51);
    id v24 = v52;

LABEL_54:
LABEL_55:

LABEL_56:
    goto LABEL_19;
  }
  v21 = (void *)v20;
  v22 = +[MIBUTatsuVerifier sikaFuse];
  if (!v22)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000590E8);
    }
    id v23 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No SikAFuse key detected", buf, 2u);
    }
    v22 = +[NSNumber numberWithInt:0];
    [v3 setSikaFuseExists:0];
  }
  [v3 setSerialNumber:v9];
  [v3 setEcid:v11];
  [v3 setBoardID:v13];
  [v3 setChipID:v15];
  [v3 setSecurityDomain:v17];
  [v3 setApNonce:v19];
  [v3 setSepNonce:v21];
  [v3 setSikaFuse:v22];
  [v3 setProductionMode:MGGetBoolAnswer()];
  [v3 setSecurityMode:MGGetBoolAnswer()];
  [v3 setUidMode:0];

  id v24 = 0;
LABEL_19:
  [v3 setError:v24];

  return v3;
}

- (id)_handleStartUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059108);
  }
  uint64_t v6 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling start update command...", buf, 2u);
  }
  id v9 = 0;
  [(MIBUNFCController *)self _verifyTatsuTicketFromCmd:v4 error:&v9];

  id v7 = v9;
  [v5 setError:v7];

  return v5;
}

- (id)_handleStatusUpdate:(id)a3
{
  id v4 = objc_opt_new();
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059128);
  }
  uint64_t v5 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling status update command...", buf, 2u);
  }
  uint64_t v6 = [(MIBUNFCController *)self delegate];
  id v7 = [v6 deviceStatus];
  [v4 setStatus:v7];

  uint64_t v8 = +[MIBUDeviceController sharedInstance];
  id v9 = [v8 osVersion];
  [v4 setOsVersion:v9];

  uint64_t v10 = [v4 osVersion];

  if (v10)
  {
    int v15 = (void *)MGCopyAnswer();
    [v4 setSerialNumber:v15];

    uint64_t v16 = [v4 serialNumber];

    if (v16)
    {
      v17 = +[MIBUDeviceController sharedInstance];
      uint64_t v18 = [v17 buildVersion];
      [v4 setBuildVersion:v18];

      id v19 = [v4 buildVersion];

      if (v19)
      {
        id v20 = 0;
        goto LABEL_9;
      }
      uint64_t v26 = 0;
      v22 = @"Failed to fetch device build version";
      id v23 = (id *)&v26;
      id v24 = &v26;
    }
    else
    {
      uint64_t v27 = 0;
      v22 = @"Failed to fetch device os serial number";
      id v23 = (id *)&v27;
      id v24 = &v27;
    }
  }
  else
  {
    uint64_t v28 = 0;
    v22 = @"Failed to fetch device os version";
    id v23 = (id *)&v28;
    id v24 = &v28;
  }
  sub_1000102B8(v24, 100663299, 0, v22, v11, v12, v13, v14, v25);
  id v20 = *v23;
LABEL_9:
  [v4 setError:v20];

  return v4;
}

- (id)_handleRetryAfter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059148);
  }
  uint64_t v6 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling retry after command...", buf, 2u);
  }
  id v7 = [v4 payload];

  uint64_t v8 = [v7 objectForKey:@"RetryAfter"];

  if (v8)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059168);
    }
    uint64_t v13 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Retry after %{public}@ seconds", buf, 0xCu);
    }
    uint64_t v14 = [(MIBUNFCController *)self session];
    [v14 stopListening];

    [v8 doubleValue];
    -[MIBUNFCController _restartSessionAfter:forceTerminate:andCompletion:](self, "_restartSessionAfter:forceTerminate:andCompletion:", 0, &stru_1000591A8);
    id v15 = 0;
  }
  else
  {
    id v17 = 0;
    sub_1000102B8(&v17, 0x80000000, 0, @"Request does not contain %{public}@ in payload", v9, v10, v11, v12, @"RetryAfter");
    id v15 = v17;
  }
  [v5 setError:v15];

  return v5;
}

- (id)_handleHeartbeat:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = objc_opt_new();
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_1000591E8);
  }
  uint64_t v6 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling heartbeat command...", buf, 2u);
  }
  *(void *)buf = 0;
  uint64_t v34 = buf;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_100009544;
  uint64_t v37 = sub_100009554;
  id v7 = [v4 payload];
  id v38 = [v7 objectForKey:@"HeartbeatPeriod"];

  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_100009544;
  uint64_t v31 = sub_100009554;
  uint64_t v8 = [v4 payload];
  id v32 = [v8 objectForKey:@"HeartbeatTimeout"];

  if (!*((void *)v34 + 5))
  {
    uint64_t v26 = 0;
    sub_1000102B8(&v26, 0x80000000, 0, @"Request does not contain %{public}@ in payload", v9, v10, v11, v12, @"HeartbeatPeriod");
    v22 = v26;
LABEL_17:
    id v20 = v22;
    goto LABEL_12;
  }
  if (!v28[5])
  {
    uint64_t v25 = 0;
    sub_1000102B8(&v25, 0x80000000, 0, @"Request does not contain %{public}@ in payload", v9, v10, v11, v12, @"HeartbeatTimeout");
    v22 = v25;
    goto LABEL_17;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059208);
  }
  uint64_t v13 = (id)qword_10006C950;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [*((id *)v34 + 5) doubleValue];
    uint64_t v15 = v14;
    [(id)v28[5] doubleValue];
    *(_DWORD *)uint64_t v40 = 134218240;
    uint64_t v41 = v15;
    __int16 v42 = 2048;
    uint64_t v43 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Heartbeat period = %lfs; timeout = %lfs",
      v40,
      0x16u);
  }

  id v17 = [(MIBUNFCController *)self session];
  [v17 stopListening];

  [*((id *)v34 + 5) doubleValue];
  double v19 = v18;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000B5F0;
  v23[3] = &unk_100059298;
  v23[4] = self;
  objc_copyWeak(&v24, &location);
  v23[5] = buf;
  v23[6] = &v27;
  [(MIBUNFCController *)self _restartSessionAfter:0 forceTerminate:v23 andCompletion:v19];
  objc_destroyWeak(&v24);
  id v20 = 0;
LABEL_12:
  [v5 setError:v20];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);

  return v5;
}

- (id)_handleInstallUpdate:(id *)a3
{
  id v3 = objc_opt_new();
  [v3 setError:0];
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_1000592B8);
  }
  id v4 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling Install Update command...", v6, 2u);
  }

  return v3;
}

- (id)_handleNetworkInfo:(id *)a3
{
  id v3 = objc_opt_new();
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_1000592D8);
  }
  id v4 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling network info command...", v7, 2u);
  }
  uint64_t v5 = +[MIBUNetworkInfo queryNetworkInfo];
  [v3 setNetworkInfo:v5];

  return v3;
}

- (id)_handleConfigureNFC:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  if (![(MIBUNFCController *)self isNFCConfigured])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059318);
    }
    id v7 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling configureNFC command...", buf, 2u);
    }
    uint64_t v8 = [v4 payload];
    uint64_t v9 = [v8 objectForKey:@"NFCInactivityTimeout"];

    if (v9)
    {
      [v9 doubleValue];
      if (v18 >= 0.0)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100059338);
        }
        double v19 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v27 = v9;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "nfcInactivity timeout: %{public}@ seconds", buf, 0xCu);
        }
        [v9 doubleValue];
        [(MIBUNFCController *)self setNfcInactivityTimeout:"setNfcInactivityTimeout:"];
        [(MIBUNFCController *)self nfcInactivityTimeout];
        -[MIBUNFCController _startNFCInactivityTimer:](self, "_startNFCInactivityTimer:");
        [(MIBUNFCController *)self setIsNFCConfigured:1];
        id v20 = 0;
        goto LABEL_18;
      }
      id v24 = 0;
      sub_1000102B8(&v24, 0x1000000, 0, @"nfcInactivity timeout value must be >= 0", v14, v15, v16, v17, v23);
      v22 = v24;
    }
    else
    {
      uint64_t v25 = 0;
      sub_1000102B8(&v25, 0x80000000, 0, @"Request does not contain %{public}@ in payload", v10, v11, v12, v13, @"NFCInactivityTimeout");
      v22 = v25;
    }
    id v20 = v22;
LABEL_18:
    [v5 setError:v20];

    goto LABEL_19;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_1000592F8);
  }
  uint64_t v6 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NFC has already been configured. Rejecting command", buf, 2u);
  }
  [v5 setRejected:1];
LABEL_19:

  return v5;
}

- (id)_handleStartDiag:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059358);
  }
  uint64_t v6 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Handling start diag command...", buf, 2u);
  }
  id v9 = 0;
  [(MIBUNFCController *)self _verifyTatsuTicketFromCmd:v4 error:&v9];

  id v7 = v9;
  [v5 setError:v7];

  return v5;
}

- (void)_startHCESession:(id *)a3
{
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100009544;
  uint64_t v27 = sub_100009554;
  id v28 = 0;
  uint64_t v5 = [(MIBUNFCController *)self session];
  unsigned __int8 v6 = [v5 running];

  if (v6)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000593E0);
    }
    id v7 = (id)qword_10006C950;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v8;
      id v9 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not starting %{public}@ since HCE session already running", buf, 0xCu);
    }
  }
  else
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    dispatch_time_t v11 = dispatch_time(0, 60000000000);
    uint64_t v12 = [(MIBUNFCController *)self session];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000C55C;
    v20[3] = &unk_1000593A0;
    v22 = &v23;
    v20[4] = self;
    id v7 = v10;
    v21 = v7;
    [v12 startHCESessionWithCompletion:v20];

    if (dispatch_semaphore_wait(v7, v11))
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_1000593C0);
      }
      uint64_t v13 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003E1C4(v13);
      }
      double v18 = (id *)(v24 + 5);
      id obj = (id)v24[5];
      sub_1000102B8(&obj, 83886086, 0, @"NFC termination wait timed out after %ds", v14, v15, v16, v17, 60);
      objc_storeStrong(v18, obj);
    }
  }
  if (a3) {
    *a3 = (id) v24[5];
  }
  _Block_object_dispose(&v23, 8);
}

- (void)_restartSessionAfter:(double)a3 forceTerminate:(BOOL)a4 andCompletion:(id)a5
{
  id v8 = a5;
  objc_initWeak(&location, self);
  id v9 = [(MIBUNFCController *)self queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000C8B8;
  v11[3] = &unk_100059428;
  objc_copyWeak(v13, &location);
  BOOL v14 = a4;
  v13[1] = *(id *)&a3;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)_startSessionRestartTimer:(double)a3 error:(id *)a4
{
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000CBC8;
  v6[3] = &unk_100059470;
  v6[4] = self;
  objc_copyWeak(v7, &location);
  v7[1] = *(id *)&a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_stopSessionRestartTimer
{
  id v3 = [(MIBUNFCController *)self sessionRestartTimer];
  objc_sync_enter(v3);
  id v4 = [(MIBUNFCController *)self sessionRestartTimer];

  if (v4)
  {
    if (![(MIBUNFCController *)self _isHeartbeatMode])
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059490);
      }
      uint64_t v5 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping session restart timer", v7, 2u);
      }
    }
    unsigned __int8 v6 = [(MIBUNFCController *)self sessionRestartTimer];
    [v6 invalidate];

    [(MIBUNFCController *)self setSessionRestartTimer:0];
  }
  objc_sync_exit(v3);
}

- (BOOL)_isHeartbeatMode
{
  v2 = [(MIBUNFCController *)self heartbeatConnectionSem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_restartSession:(id)a3
{
  if (![(MIBUNFCController *)self _isHeartbeatMode])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000594B0);
    }
    id v4 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Session Restart Timer Fired! Restarting HCE Session...", v5, 2u);
    }
  }
  [(MIBUNFCController *)self _startHCESession:0];
}

- (void)_startNFCInactivityTimer:(double)a3
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D1C8;
  v5[3] = &unk_100059470;
  v5[4] = self;
  objc_copyWeak(v6, &location);
  v6[1] = *(id *)&a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)_nfcInactivityTimeoutHandler:(id)a3
{
  id v4 = a3;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_1000594D0);
  }
  uint64_t v5 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NFC Inactivity timer Fired!", v9, 2u);
  }
  [(MIBUNFCController *)self _stopNFCInactivityTimer];
  unsigned __int8 v6 = [(MIBUNFCController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(MIBUNFCController *)self delegate];
    [v8 nfcActivityDidTimeout];
  }
}

- (void)_stopNFCInactivityTimer
{
  BOOL v3 = [(MIBUNFCController *)self nfcInactivityTimer];

  if (v3)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000594F0);
    }
    id v4 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping nfcInactivityTimer...", v6, 2u);
    }
    uint64_t v5 = [(MIBUNFCController *)self nfcInactivityTimer];
    [v5 invalidate];

    [(MIBUNFCController *)self setNfcInactivityTimer:0];
  }
}

- (void)_resetNFCInactivityTimer
{
  BOOL v3 = [(MIBUNFCController *)self nfcInactivityTimer];

  if (v3)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059510);
    }
    id v4 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping isNFCActive Timer...", (uint8_t *)&v9, 2u);
    }
    uint64_t v5 = [(MIBUNFCController *)self nfcInactivityTimer];
    [v5 invalidate];

    [(MIBUNFCController *)self setNfcInactivityTimer:0];
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059530);
  }
  unsigned __int8 v6 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = v6;
    [(MIBUNFCController *)self nfcInactivityTimeout];
    int v9 = 134217984;
    uint64_t v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting nfcInactivityTimer with timeout: %lf", (uint8_t *)&v9, 0xCu);
  }
  [(MIBUNFCController *)self nfcInactivityTimeout];
  -[MIBUNFCController _startNFCInactivityTimer:](self, "_startNFCInactivityTimer:");
}

- (void)_verifyTatsuTicketFromCmd:(id)a3 error:(id *)a4
{
  uint64_t v5 = [a3 payload];
  unsigned __int8 v6 = [v5 objectForKey:@"TatsuTicket"];

  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059550);
  }
  char v7 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    double v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received Tatsu ticket: %{public}@", buf, 0xCu);
  }
  if (v6)
  {
    uint64_t v15 = 0;
    id v12 = (id *)&v15;
    +[MIBUTatsuVerifier verifyTatsuEntitlement:v6 error:&v15];
  }
  else
  {
    uint64_t v16 = 0;
    id v12 = (id *)&v16;
    sub_1000102B8(&v16, 100663297, 0, @"No Tatsu Ticket", v8, v9, v10, v11, v15);
  }
  id v13 = *v12;
  BOOL v14 = v13;
  if (v13) {
    *a4 = v13;
  }
}

- (MIBUHCESession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (MIBUNFCControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSDictionary)dispatchTable
{
  return self->_dispatchTable;
}

- (void)setDispatchTable:(id)a3
{
}

- (PCPersistentTimer)sessionRestartTimer
{
  return self->_sessionRestartTimer;
}

- (void)setSessionRestartTimer:(id)a3
{
}

- (PCPersistentTimer)nfcInactivityTimer
{
  return self->_nfcInactivityTimer;
}

- (void)setNfcInactivityTimer:(id)a3
{
}

- (OS_dispatch_semaphore)heartbeatConnectionSem
{
  return self->_heartbeatConnectionSem;
}

- (void)setHeartbeatConnectionSem:(id)a3
{
}

- (double)heartbeatPeriod
{
  return self->_heartbeatPeriod;
}

- (void)setHeartbeatPeriod:(double)a3
{
  self->_heartbeatPeriod = a3;
}

- (double)nfcInactivityTimeout
{
  return self->_nfcInactivityTimeout;
}

- (void)setNfcInactivityTimeout:(double)a3
{
  self->_nfcInactivityTimeout = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)terminated
{
  return self->_terminated;
}

- (void)setTerminated:(BOOL)a3
{
  self->_terminated = a3;
}

- (BOOL)isNFCConfigured
{
  return self->_isNFCConfigured;
}

- (void)setIsNFCConfigured:(BOOL)a3
{
  self->_isNFCConfigured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_heartbeatConnectionSem, 0);
  objc_storeStrong((id *)&self->_nfcInactivityTimer, 0);
  objc_storeStrong((id *)&self->_sessionRestartTimer, 0);
  objc_storeStrong((id *)&self->_dispatchTable, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end