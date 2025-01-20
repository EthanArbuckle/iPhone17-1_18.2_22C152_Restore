@interface SystemDiagnosticBT
+ (id)sharedInstance;
- (BOOL)attachedToBTSession;
- (BOOL)isLimitedLoggingEnabled;
- (BOOL)shouldGatherBTLogs;
- (BOOL)waitingToCaptureAirPodLogs;
- (BOOL)waitingToCaptureExposureNotificationLogs;
- (BTAccessoryManagerImpl)accessoryManager;
- (BTSessionImpl)btSession;
- (NSArray)accessoryLogs;
- (NSString)diagnosticID;
- (NSURL)exposureNotificationDBURL;
- (OS_dispatch_group)airpodsGroup;
- (OS_dispatch_group)exposureNotificationGroup;
- (OS_dispatch_queue)bluetoothQueue;
- (OS_os_log)accessoryLogSubsystem;
- (SystemDiagnosticBT)init;
- (id)waitForAirPodLogsIfAvailable;
- (id)waitForExposureNotificationLogsIfAvailable:(int64_t)a3;
- (int)numAttachTries;
- (unint64_t)defaultAirpodTimeout;
- (unint64_t)getAirpodsTimeout;
- (void)attachToBTSession;
- (void)deregisterBTSession;
- (void)deregisterBTSessionIfDone;
- (void)forceDeregisterBTSession;
- (void)logCompletionHandler:(char *)a3 size:(unint64_t)a4;
- (void)markAirpodLogsDone:(BOOL)a3;
- (void)markExposureNotificationLogsDone:(BOOL)a3;
- (void)retryAttachToBTSession;
- (void)sessionEvent:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5;
- (void)setAccessoryLogSubsystem:(id)a3;
- (void)setAccessoryLogs:(id)a3;
- (void)setAccessoryManager:(BTAccessoryManagerImpl *)a3;
- (void)setAirpodsGroup:(id)a3;
- (void)setAttachedToBTSession:(BOOL)a3;
- (void)setBluetoothQueue:(id)a3;
- (void)setBtSession:(BTSessionImpl *)a3;
- (void)setDefaultAirpodTimeout:(unint64_t)a3;
- (void)setDiagnosticID:(id)a3;
- (void)setExposureNotificationDBURL:(id)a3;
- (void)setExposureNotificationGroup:(id)a3;
- (void)setNumAttachTries:(int)a3;
- (void)setShouldGatherBTLogs:(BOOL)a3;
- (void)setWaitingToCaptureAirPodLogs:(BOOL)a3;
- (void)setWaitingToCaptureExposureNotificationLogs:(BOOL)a3;
- (void)startBTSession:(id)a3;
- (void)startBTSessionAndTriggerAirPodLogs:(id)a3;
- (void)startBTSessionAndTriggerExposureNotificationLogs:(id)a3;
- (void)triggerAirPodLogsIfConnected;
- (void)triggerExposureNotificationLogs;
@end

@implementation SystemDiagnosticBT

+ (id)sharedInstance
{
  if (qword_1000BD738 != -1) {
    dispatch_once(&qword_1000BD738, &stru_10009CFB8);
  }
  v2 = (void *)qword_1000BD730;

  return v2;
}

- (SystemDiagnosticBT)init
{
  v12.receiver = self;
  v12.super_class = (Class)SystemDiagnosticBT;
  v2 = [(SystemDiagnosticBT *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_shouldGatherBTLogs = 1;
    os_log_t v4 = os_log_create("com.apple.sysdiagnose", "bluetooth");
    accessoryLogSubsystem = v3->_accessoryLogSubsystem;
    v3->_accessoryLogSubsystem = (OS_os_log *)v4;

    airpodsGroup = v3->_airpodsGroup;
    v3->_airpodsGroup = 0;

    v3->_defaultAirpodTimeout = 0;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.sysdiagnose.bluetooth", 0);
    bluetoothQueue = v3->_bluetoothQueue;
    v3->_bluetoothQueue = (OS_dispatch_queue *)v7;

    v3->_numAttachTries = 0;
    exposureNotificationGroup = v3->_exposureNotificationGroup;
    v3->_exposureNotificationGroup = 0;

    exposureNotificationDBURL = v3->_exposureNotificationDBURL;
    v3->_exposureNotificationDBURL = 0;
  }
  return v3;
}

- (void)attachToBTSession
{
  block[5] = sub_10000A14C;
  id v3 = [(SystemDiagnosticBT *)self diagnosticID];
  [v3 UTF8String];
  int v4 = BTSessionAttachWithQueue();

  [(SystemDiagnosticBT *)self setNumAttachTries:[(SystemDiagnosticBT *)self numAttachTries] + 1];
  v5 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000612F4();
    }

    dispatch_queue_t v7 = [(SystemDiagnosticBT *)self bluetoothQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000077BC;
    block[3] = &unk_10009CFE0;
    block[4] = self;
    dispatch_sync(v7, block);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully attached to bluetoothd, waiting for session callback.", v8, 2u);
    }

    [(SystemDiagnosticBT *)self setAttachedToBTSession:1];
  }
}

- (void)startBTSession:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5 = [(SystemDiagnosticBT *)self bluetoothQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000078D8;
  v6[3] = &unk_10009D008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  if (!*((unsigned char *)v8 + 24) && ![(SystemDiagnosticBT *)self attachedToBTSession])
  {
    [(SystemDiagnosticBT *)self setNumAttachTries:0];
    [(SystemDiagnosticBT *)self setDiagnosticID:v4];
    [(SystemDiagnosticBT *)self attachToBTSession];
  }
  _Block_object_dispose(&v7, 8);
}

- (void)startBTSessionAndTriggerExposureNotificationLogs:(id)a3
{
  id v4 = a3;
  if (qword_1000BD748 != -1) {
    dispatch_once(&qword_1000BD748, &stru_10009D078);
  }
  if (byte_1000BD740)
  {
    if ([(SystemDiagnosticBT *)self shouldGatherBTLogs])
    {
      v5 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Querying bluetooth if ExposureNotification is supported, and collect db if so.", buf, 2u);
      }

      v6 = +[SDResourceManager sharedResourceManager];
      [v6 logWithSubsystem:"remoteSysdiagnose", "AccessoryLogSubsystem", @"Querying bluetooth if ExposureNotification is supported, and collect db if so." category msg];

      [(SystemDiagnosticBT *)self setExposureNotificationDBURL:0];
      dispatch_group_t v7 = dispatch_group_create();
      [(SystemDiagnosticBT *)self setExposureNotificationGroup:v7];

      v8 = [(SystemDiagnosticBT *)self exposureNotificationGroup];

      if (v8)
      {
        uint64_t v9 = [(SystemDiagnosticBT *)self exposureNotificationGroup];
        dispatch_group_enter(v9);
      }
      *(void *)buf = 0;
      v15 = buf;
      uint64_t v16 = 0x2020000000;
      char v17 = 0;
      char v10 = [(SystemDiagnosticBT *)self bluetoothQueue];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100007BDC;
      v13[3] = &unk_10009D008;
      v13[4] = self;
      v13[5] = buf;
      dispatch_sync(v10, v13);

      if (v15[24]) {
        [(SystemDiagnosticBT *)self startBTSession:v4];
      }
      _Block_object_dispose(buf, 8);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not triggering exposure notification logs, as self.shouldGatherBTLogs is set to NO", buf, 2u);
    }
  }
  else
  {
    v11 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not triggering exposure notifications since bluetooth is missing", buf, 2u);
    }

    objc_super v12 = +[SDResourceManager sharedResourceManager];
    [v12 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:@"Not triggering exposure notifications since bluetooth is missing"];
  }
}

- (id)waitForExposureNotificationLogsIfAvailable:(int64_t)a3
{
  if (qword_1000BD748 != -1) {
    dispatch_once(&qword_1000BD748, &stru_10009D078);
  }
  if (byte_1000BD740 != 1) {
    goto LABEL_12;
  }
  if (![(SystemDiagnosticBT *)self shouldGatherBTLogs])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not waiting for exposure notification logs, as self.shouldGatherBTLogs is set to NO", buf, 2u);
    }
LABEL_12:
    id v7 = 0;
    goto LABEL_25;
  }
  v5 = [(SystemDiagnosticBT *)self exposureNotificationDBURL];

  if (!v5)
  {
    objc_super v12 = [(SystemDiagnosticBT *)self exposureNotificationGroup];

    v13 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ExposureNotification db still collecting; waiting for it to become available.",
          buf,
          2u);
      }

      v15 = [(SystemDiagnosticBT *)self exposureNotificationGroup];
      dispatch_time_t v16 = dispatch_time(0, a3);
      intptr_t v17 = dispatch_group_wait(v15, v16);

      if (!v17)
      {
        v22 = [(SystemDiagnosticBT *)self exposureNotificationDBURL];
        id v7 = [v22 copy];

        v23 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received ExposureNotification db after wait.", buf, 2u);
        }

        uint64_t v9 = +[SDResourceManager sharedResourceManager];
        char v10 = v9;
        CFStringRef v11 = @"Received ExposureNotification db after wait.";
        goto LABEL_9;
      }
      v18 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10006135C();
      }

      v19 = +[SDResourceManager sharedResourceManager];
      [v19 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:@"Timed out waiting for ExposureNotification db collection."];

      v20 = [(SystemDiagnosticBT *)self bluetoothQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100008024;
      block[3] = &unk_10009CFE0;
      block[4] = self;
      dispatch_sync(v20, block);
    }
    else
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No ExposureNotification db available to collect.", buf, 2u);
      }

      v20 = +[SDResourceManager sharedResourceManager];
      [v20 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:@"No ExposureNotification db available to collect."];
    }

    id v7 = 0;
    goto LABEL_24;
  }
  v6 = [(SystemDiagnosticBT *)self exposureNotificationDBURL];
  id v7 = [v6 copy];

  v8 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found collected ExposureNotification db.", buf, 2u);
  }

  uint64_t v9 = +[SDResourceManager sharedResourceManager];
  char v10 = v9;
  CFStringRef v11 = @"Found collected ExposureNotification db.";
LABEL_9:
  [v9 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:v11];

LABEL_24:
  [(SystemDiagnosticBT *)self setExposureNotificationDBURL:0];
LABEL_25:

  return v7;
}

- (void)markExposureNotificationLogsDone:(BOOL)a3
{
  v5 = [(SystemDiagnosticBT *)self bluetoothQueue];
  dispatch_assert_queue_V2(v5);

  [(SystemDiagnosticBT *)self setWaitingToCaptureExposureNotificationLogs:0];
  v6 = [(SystemDiagnosticBT *)self exposureNotificationGroup];

  if (v6)
  {
    if (!a3)
    {
      id v7 = [(SystemDiagnosticBT *)self exposureNotificationGroup];
      dispatch_group_leave(v7);
    }
    [(SystemDiagnosticBT *)self setExposureNotificationGroup:0];
  }

  [(SystemDiagnosticBT *)self deregisterBTSessionIfDone];
}

- (void)triggerExposureNotificationLogs
{
  id v3 = [(SystemDiagnosticBT *)self bluetoothQueue];
  dispatch_assert_queue_V2(v3);

  [(SystemDiagnosticBT *)self btSession];
  if (BTLocalDeviceGetDefault())
  {
    id v4 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100061390();
    }
  }
  else
  {
    int v5 = BTLocalDeviceDumpExposureNotificationDatabase();
    if (v5)
    {
      int v6 = v5;
      id v4 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v9 = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Could not dump ExposureNotification db from bluetoothd with error %d", buf, 8u);
      }
    }
    else
    {
      id v4 = +[NSString stringWithUTF8String:v10];
      id v7 = +[NSURL fileURLWithPath:v4 isDirectory:1];
      [(SystemDiagnosticBT *)self setExposureNotificationDBURL:v7];
    }
  }

  [(SystemDiagnosticBT *)self markExposureNotificationLogsDone:0];
}

- (void)startBTSessionAndTriggerAirPodLogs:(id)a3
{
  id v4 = a3;
  if (qword_1000BD748 != -1) {
    dispatch_once(&qword_1000BD748, &stru_10009D078);
  }
  if (byte_1000BD740)
  {
    if ([(SystemDiagnosticBT *)self shouldGatherBTLogs])
    {
      int v5 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Querying bluetooth if Airpods are connected, and collect AirPod logs if so.", buf, 2u);
      }

      int v6 = +[SDResourceManager sharedResourceManager];
      [v6 logWithSubsystem:"remoteSysdiagnose", "AccessoryLogSubsystem", @"Querying bluetooth if Airpods are connected, and collect AirPod logs if so." category msg];

      [(SystemDiagnosticBT *)self setAccessoryLogs:0];
      dispatch_group_t v7 = dispatch_group_create();
      [(SystemDiagnosticBT *)self setAirpodsGroup:v7];

      v8 = [(SystemDiagnosticBT *)self airpodsGroup];

      if (v8)
      {
        int v9 = [(SystemDiagnosticBT *)self airpodsGroup];
        dispatch_group_enter(v9);
      }
      *(void *)buf = 0;
      v15 = buf;
      uint64_t v16 = 0x2020000000;
      char v17 = 0;
      char v10 = [(SystemDiagnosticBT *)self bluetoothQueue];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100008518;
      v13[3] = &unk_10009D008;
      v13[4] = self;
      v13[5] = buf;
      dispatch_sync(v10, v13);

      if (v15[24]) {
        [(SystemDiagnosticBT *)self startBTSession:v4];
      }
      _Block_object_dispose(buf, 8);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not triggering AirPod logs, as self.shouldGatherBTLogs is set to NO", buf, 2u);
    }
  }
  else
  {
    CFStringRef v11 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not triggering airpod logs since bluetooth is missing", buf, 2u);
    }

    objc_super v12 = +[SDResourceManager sharedResourceManager];
    [v12 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:@"Not triggering airpod logs since bluetooth is missing"];
  }
}

- (BOOL)isLimitedLoggingEnabled
{
  if (objc_opt_class())
  {
    *(void *)v21 = 0;
    v22 = v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    int v5 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000887C;
    block[3] = &unk_10009D058;
    block[4] = self;
    v20 = v21;
    int v6 = v3;
    v19 = v6;
    dispatch_async(v5, block);

    if (dispatch_semaphore_wait(v6, v4))
    {
      dispatch_group_t v7 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Timed out waiting for limited logging check. Assuming limited logging disabled", buf, 2u);
      }

      v8 = +[SDResourceManager sharedResourceManager];
      [v8 stdoutWrite:@"Subsystem: %s; Category: %s; Log: "];
        "remoteSysdiagnose",
        "AccessoryLogSubsystem");

      int v9 = +[SDResourceManager sharedResourceManager];
      [v9 stdoutWrite:@"Timed out waiting for limited logging check. Assuming limited logging disabled"];

      char v10 = +[SDResourceManager sharedResourceManager];
      [v10 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:@"Timed out waiting for limited logging check. Assuming limited logging disabled"];

      BOOL v11 = 0;
    }
    else
    {
      BOOL v11 = v22[24] != 0;
    }

    _Block_object_dispose(v21, 8);
  }
  else
  {
    objc_super v12 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CBUserController not found. Assuming limited logging disabled", v21, 2u);
    }

    v13 = +[SDResourceManager sharedResourceManager];
    [v13 stdoutWrite:@"Subsystem: %s; Category: %s; Log: "];
      "remoteSysdiagnose",
      "AccessoryLogSubsystem");

    BOOL v14 = +[SDResourceManager sharedResourceManager];
    [v14 stdoutWrite:@"CBUserController not found. Assuming limited logging disabled"];

    v15 = +[SDResourceManager sharedResourceManager];
    [v15 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:@"CBUserController not found. Assuming limited logging disabled"];

    return 0;
  }
  return v11;
}

- (unint64_t)getAirpodsTimeout
{
  if ([(SystemDiagnosticBT *)self defaultAirpodTimeout])
  {
    dispatch_semaphore_t v3 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = [(SystemDiagnosticBT *)self defaultAirpodTimeout];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Found testing airpod timeouts override. Using timeout: %llu", buf, 0xCu);
    }

    dispatch_time_t v4 = +[SDResourceManager sharedResourceManager];
    [v4 stdoutWrite:@"Subsystem: %s; Category: %s; Log: "];
      "remoteSysdiagnose",
      "AccessoryLogSubsystem");

    int v5 = +[SDResourceManager sharedResourceManager];
    [v5 stdoutWrite:@"Found testing airpod timeouts override. Using timeout: %llu" -[SystemDiagnosticBT defaultAirpodTimeout](self, "defaultAirpodTimeout")];

    int v6 = +[SDResourceManager sharedResourceManager];
    [v6 logWithSubsystem:@"remoteSysdiagnose" category:@"AccessoryLogSubsystem" msg:@"Found testing airpod timeouts override. Using timeout: %llu" -[SystemDiagnosticBT defaultAirpodTimeout](self, "defaultAirpodTimeout")];

    return [(SystemDiagnosticBT *)self defaultAirpodTimeout];
  }
  else
  {
    *(void *)buf = 0;
    if (sub_100048888(@"airpods-timeout", @"com.apple.sysdiagnose", @"mobile", buf))
    {
      unint64_t v7 = 1000000000 * *(void *)buf;
      v8 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found manual airpods timeout override. Using timeout: %llu", buf, 0xCu);
      }

      int v9 = +[SDResourceManager sharedResourceManager];
      [v9 stdoutWrite:@"Subsystem: %s; Category: %s; Log: "];
        "remoteSysdiagnose",
        "AccessoryLogSubsystem");

      char v10 = +[SDResourceManager sharedResourceManager];
      CFStringRef v11 = @"Found manual airpods timeout override. Using timeout: %llu";
      [v10 stdoutWrite:@"Found manual airpods timeout override. Using timeout: %llu", v7];
    }
    else if ([(SystemDiagnosticBT *)self isLimitedLoggingEnabled])
    {
      unint64_t v7 = 300000000000;
      objc_super v12 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = 300000000000;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Limited logging is enabled. Using airpods timeout: %llu", buf, 0xCu);
      }

      v13 = +[SDResourceManager sharedResourceManager];
      [v13 stdoutWrite:@"Subsystem: %s; Category: %s; Log: "];
        "remoteSysdiagnose",
        "AccessoryLogSubsystem");

      char v10 = +[SDResourceManager sharedResourceManager];
      CFStringRef v11 = @"Limited logging is enabled. Using airpods timeout: %llu";
      [v10 stdoutWrite:@"Limited logging is enabled. Using airpods timeout: %llu", 300000000000];
    }
    else if (sub_100048604() {
           && (buf[0] = 0, sub_1000487D8(@"prioritizeAirPods", @"com.apple.sysdiagnose", (BOOL *)buf))
    }
           && buf[0])
    {
      unint64_t v7 = 300000000000;
      BOOL v14 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = 300000000000;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found prioritizeAirpodsWait timeout. Using timeout: %llu", buf, 0xCu);
      }

      v15 = +[SDResourceManager sharedResourceManager];
      [v15 stdoutWrite:@"Subsystem: %s; Category: %s; Log: "];
        "remoteSysdiagnose",
        "AccessoryLogSubsystem");

      char v10 = +[SDResourceManager sharedResourceManager];
      CFStringRef v11 = @"Found prioritizeAirpodsWait timeout. Using timeout: %llu";
      [v10 stdoutWrite:@"Found prioritizeAirpodsWait timeout. Using timeout: %llu", 300000000000];
    }
    else
    {
      unint64_t v7 = 30000000000;
      uint64_t v16 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = 30000000000;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No preferences found. Using default airpods timeout value of: %llu", buf, 0xCu);
      }

      char v17 = +[SDResourceManager sharedResourceManager];
      [v17 stdoutWrite:@"Subsystem: %s; Category: %s; Log: "];
        "remoteSysdiagnose",
        "AccessoryLogSubsystem");

      char v10 = +[SDResourceManager sharedResourceManager];
      CFStringRef v11 = @"No preferences found. Using default airpods timeout value of: %llu";
      [v10 stdoutWrite:@"No preferences found. Using default airpods timeout value of: %llu", 30000000000];
    }

    v18 = +[SDResourceManager sharedResourceManager];
    [v18 logWithSubsystem:@"remoteSysdiagnose" category:@"AccessoryLogSubsystem" msg:v11];
  }
  return v7;
}

- (id)waitForAirPodLogsIfAvailable
{
  if (qword_1000BD748 != -1) {
    dispatch_once(&qword_1000BD748, &stru_10009D078);
  }
  if (byte_1000BD740 != 1) {
    goto LABEL_12;
  }
  if (![(SystemDiagnosticBT *)self shouldGatherBTLogs])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not waiting for AirPod logs, as self.shouldGatherBTLogs is set to NO", buf, 2u);
    }
LABEL_12:
    id v5 = 0;
    goto LABEL_25;
  }
  dispatch_semaphore_t v3 = [(SystemDiagnosticBT *)self accessoryLogs];

  if (!v3)
  {
    char v10 = [(SystemDiagnosticBT *)self airpodsGroup];

    CFStringRef v11 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AirPod logs still collecting; waiting for them to become available.",
          buf,
          2u);
      }

      int64_t v13 = [(SystemDiagnosticBT *)self getAirpodsTimeout];
      BOOL v14 = [(SystemDiagnosticBT *)self airpodsGroup];
      dispatch_time_t v15 = dispatch_time(0, v13);
      intptr_t v16 = dispatch_group_wait(v14, v15);

      if (!v16)
      {
        v21 = [(SystemDiagnosticBT *)self accessoryLogs];
        id v5 = [v21 copy];

        v22 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received AirPod logs after wait.", buf, 2u);
        }

        unint64_t v7 = +[SDResourceManager sharedResourceManager];
        v8 = v7;
        CFStringRef v9 = @"Received AirPod logs after wait.";
        goto LABEL_9;
      }
      char v17 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000613F8();
      }

      v18 = +[SDResourceManager sharedResourceManager];
      [v18 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:@"Timed out waiting for AirPod logs collection."];

      v19 = [(SystemDiagnosticBT *)self bluetoothQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100009488;
      block[3] = &unk_10009CFE0;
      block[4] = self;
      dispatch_async(v19, block);
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No AirPod logs available to collect.", buf, 2u);
      }

      v19 = +[SDResourceManager sharedResourceManager];
      [v19 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:@"No AirPod logs available to collect."];
    }

    id v5 = 0;
    goto LABEL_24;
  }
  dispatch_time_t v4 = [(SystemDiagnosticBT *)self accessoryLogs];
  id v5 = [v4 copy];

  int v6 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found collected AirPod logs.", buf, 2u);
  }

  unint64_t v7 = +[SDResourceManager sharedResourceManager];
  v8 = v7;
  CFStringRef v9 = @"Found collected AirPod logs.";
LABEL_9:
  [v7 logWithSubsystem:"remoteSysdiagnose" category:"AccessoryLogSubsystem" msg:v9];

LABEL_24:
  [(SystemDiagnosticBT *)self setAccessoryLogs:0];
LABEL_25:

  return v5;
}

- (void)deregisterBTSession
{
  dispatch_semaphore_t v3 = [(SystemDiagnosticBT *)self bluetoothQueue];
  dispatch_assert_queue_V2(v3);

  if ([(SystemDiagnosticBT *)self accessoryManager])
  {
    dispatch_time_t v4 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unregistering AirPod logs dump with BTAccessoryManager.", v6, 2u);
    }

    [(SystemDiagnosticBT *)self accessoryManager];
    BTAccessoryManagerDeregisterCustomMessageClient();
    [(SystemDiagnosticBT *)self setAccessoryManager:0];
  }
  if ([(SystemDiagnosticBT *)self btSession])
  {
    id v5 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Detaching from bluetoothd.", v6, 2u);
    }

    *(void *)int v6 = [(SystemDiagnosticBT *)self btSession];
    BTSessionDetachWithQueue();
    [(SystemDiagnosticBT *)self setBtSession:0];
  }
  [(SystemDiagnosticBT *)self setAttachedToBTSession:0];
}

- (void)deregisterBTSessionIfDone
{
  dispatch_semaphore_t v3 = [(SystemDiagnosticBT *)self bluetoothQueue];
  dispatch_assert_queue_V2(v3);

  if (![(SystemDiagnosticBT *)self waitingToCaptureAirPodLogs]
    && ![(SystemDiagnosticBT *)self waitingToCaptureExposureNotificationLogs])
  {
    [(SystemDiagnosticBT *)self deregisterBTSession];
  }
}

- (void)forceDeregisterBTSession
{
  dispatch_semaphore_t v3 = [(SystemDiagnosticBT *)self bluetoothQueue];
  dispatch_assert_queue_V2(v3);

  [(SystemDiagnosticBT *)self markAirpodLogsDone:0];
  [(SystemDiagnosticBT *)self markExposureNotificationLogsDone:0];

  [(SystemDiagnosticBT *)self deregisterBTSession];
}

- (void)retryAttachToBTSession
{
  dispatch_semaphore_t v3 = [(SystemDiagnosticBT *)self bluetoothQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(SystemDiagnosticBT *)self numAttachTries];
  id v5 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
  int v6 = v5;
  if (v4 > 2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006142C(self, v6);
    }

    [(SystemDiagnosticBT *)self forceDeregisterBTSession];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v9 = [(SystemDiagnosticBT *)self numAttachTries];
      __int16 v10 = 1024;
      int v11 = 3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempt (%d/%d) to attach to BTSession failed. Trying again...", buf, 0xEu);
    }

    [(SystemDiagnosticBT *)self deregisterBTSession];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009818;
    block[3] = &unk_10009CFE0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)markAirpodLogsDone:(BOOL)a3
{
  id v5 = [(SystemDiagnosticBT *)self bluetoothQueue];
  dispatch_assert_queue_V2(v5);

  [(SystemDiagnosticBT *)self setWaitingToCaptureAirPodLogs:0];
  int v6 = [(SystemDiagnosticBT *)self airpodsGroup];

  if (v6)
  {
    if (!a3)
    {
      unint64_t v7 = [(SystemDiagnosticBT *)self airpodsGroup];
      dispatch_group_leave(v7);
    }
    [(SystemDiagnosticBT *)self setAirpodsGroup:0];
  }

  [(SystemDiagnosticBT *)self deregisterBTSessionIfDone];
}

- (void)triggerAirPodLogsIfConnected
{
  dispatch_semaphore_t v3 = [(SystemDiagnosticBT *)self bluetoothQueue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to trigger AirPod logs dump.", buf, 2u);
  }

  *(void *)buf = 0;
  [(SystemDiagnosticBT *)self btSession];
  if (BTAccessoryManagerGetDefault())
  {
    id v5 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000615FC();
    }

    goto LABEL_27;
  }
  [(SystemDiagnosticBT *)self setAccessoryManager:*(void *)buf];
  __int16 v10 = sub_10000A224;
  [(SystemDiagnosticBT *)self accessoryManager];
  int v6 = BTAccessoryManagerRegisterCustomMessageClient();
  if (v6 > 9)
  {
    switch(v6)
    {
      case 10:
        unint64_t v7 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_100061560();
        }
        goto LABEL_26;
      case 312:
        unint64_t v7 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_100061594();
        }
        goto LABEL_26;
      case 11:
        unint64_t v7 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_10006152C();
        }
LABEL_26:

LABEL_27:
        [(SystemDiagnosticBT *)self markAirpodLogsDone:0];
        return;
    }
LABEL_24:
    unint64_t v7 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000614C4();
    }
    goto LABEL_26;
  }
  if (v6)
  {
    if (v6 == 2)
    {
      unint64_t v7 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000615C8();
      }
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  v8 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully registered AirPod logs dump with BTAccessoryManager, waiting for accessory logs callback.", v9, 2u);
  }
}

- (void)sessionEvent:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5
{
  unsigned int v9 = [(SystemDiagnosticBT *)self bluetoothQueue];
  dispatch_assert_queue_V2(v9);

  switch(a4)
  {
    case 0:
      if (a5)
      {
        __int16 v10 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1000616D8();
        }

        [(SystemDiagnosticBT *)self retryAttachToBTSession];
      }
      else
      {
        [(SystemDiagnosticBT *)self setBtSession:a3];
        int64_t v13 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received BT_SESSION_ATTACHED (BT_SUCCESS) event in BTSession event callback. Capturing available data.", buf, 2u);
        }

        if ([(SystemDiagnosticBT *)self waitingToCaptureAirPodLogs]) {
          [(SystemDiagnosticBT *)self triggerAirPodLogsIfConnected];
        }
        if ([(SystemDiagnosticBT *)self waitingToCaptureExposureNotificationLogs])
        {
          [(SystemDiagnosticBT *)self triggerExposureNotificationLogs];
        }
      }
      return;
    case 1:
      int v11 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received BT_SESSION_DETACHED event in BTSession event callback. Ignoring.", v14, 2u);
      }
      goto LABEL_15;
    case 2:
      BOOL v12 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100061740();
      }

      [(SystemDiagnosticBT *)self forceDeregisterBTSession];
      return;
    case 3:
      int v11 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_100061774();
      }
      goto LABEL_15;
    default:
      int v11 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_100061664();
      }
LABEL_15:

      return;
  }
}

- (void)logCompletionHandler:(char *)a3 size:(unint64_t)a4
{
  unint64_t v7 = [(SystemDiagnosticBT *)self bluetoothQueue];
  dispatch_assert_queue_V2(v7);

  v8 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AirPod logs callback received.", (uint8_t *)&v19, 2u);
  }

  unsigned int v9 = [(SystemDiagnosticBT *)self accessoryLogs];

  if (v9)
  {
    __int16 v10 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100061860();
    }
  }
  else
  {
    __int16 v10 = objc_opt_new();
    if ((uint64_t)a4 >= 1)
    {
      int v11 = &a3[a4];
      while (1)
      {
        BOOL v12 = +[NSString stringWithUTF8String:a3];
        int64_t v13 = v12;
        if (!v12 || ![v12 length]) {
          break;
        }
        [v10 addObject:v13];
        a3 += strlen(a3) + 1;

        if (a3 >= v11) {
          goto LABEL_15;
        }
      }
      BOOL v14 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10006182C();
      }
    }
LABEL_15:
    dispatch_time_t v15 = [(SystemDiagnosticBT *)self airpodsGroup];

    intptr_t v16 = [(SystemDiagnosticBT *)self accessoryLogSubsystem];
    char v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        v20 = v10;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "AirPod logs dumped, file(s) received in callback: %@", (uint8_t *)&v19, 0xCu);
      }

      id v18 = [v10 copy];
      [(SystemDiagnosticBT *)self setAccessoryLogs:v18];

      [(SystemDiagnosticBT *)self markAirpodLogsDone:0];
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000617B4((uint64_t)v10, v17);
      }
    }
  }
}

- (BOOL)shouldGatherBTLogs
{
  return self->_shouldGatherBTLogs;
}

- (void)setShouldGatherBTLogs:(BOOL)a3
{
  self->_shouldGatherBTLogs = a3;
}

- (unint64_t)defaultAirpodTimeout
{
  return self->_defaultAirpodTimeout;
}

- (void)setDefaultAirpodTimeout:(unint64_t)a3
{
  self->_defaultAirpodTimeout = a3;
}

- (OS_dispatch_queue)bluetoothQueue
{
  return self->_bluetoothQueue;
}

- (void)setBluetoothQueue:(id)a3
{
}

- (NSArray)accessoryLogs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccessoryLogs:(id)a3
{
}

- (OS_os_log)accessoryLogSubsystem
{
  return self->_accessoryLogSubsystem;
}

- (void)setAccessoryLogSubsystem:(id)a3
{
}

- (BTSessionImpl)btSession
{
  return self->_btSession;
}

- (void)setBtSession:(BTSessionImpl *)a3
{
  self->_btSession = a3;
}

- (BTAccessoryManagerImpl)accessoryManager
{
  return self->_accessoryManager;
}

- (void)setAccessoryManager:(BTAccessoryManagerImpl *)a3
{
  self->_accessoryManager = a3;
}

- (int)numAttachTries
{
  return self->_numAttachTries;
}

- (void)setNumAttachTries:(int)a3
{
  self->_numAttachTries = a3;
}

- (NSString)diagnosticID
{
  return self->_diagnosticID;
}

- (void)setDiagnosticID:(id)a3
{
}

- (BOOL)attachedToBTSession
{
  return self->_attachedToBTSession;
}

- (void)setAttachedToBTSession:(BOOL)a3
{
  self->_attachedToBTSession = a3;
}

- (BOOL)waitingToCaptureAirPodLogs
{
  return self->_waitingToCaptureAirPodLogs;
}

- (void)setWaitingToCaptureAirPodLogs:(BOOL)a3
{
  self->_waitingToCaptureAirPodLogs = a3;
}

- (OS_dispatch_group)airpodsGroup
{
  return self->_airpodsGroup;
}

- (void)setAirpodsGroup:(id)a3
{
}

- (BOOL)waitingToCaptureExposureNotificationLogs
{
  return self->_waitingToCaptureExposureNotificationLogs;
}

- (void)setWaitingToCaptureExposureNotificationLogs:(BOOL)a3
{
  self->_waitingToCaptureExposureNotificationLogs = a3;
}

- (OS_dispatch_group)exposureNotificationGroup
{
  return self->_exposureNotificationGroup;
}

- (void)setExposureNotificationGroup:(id)a3
{
}

- (NSURL)exposureNotificationDBURL
{
  return self->_exposureNotificationDBURL;
}

- (void)setExposureNotificationDBURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposureNotificationDBURL, 0);
  objc_storeStrong((id *)&self->_exposureNotificationGroup, 0);
  objc_storeStrong((id *)&self->_airpodsGroup, 0);
  objc_storeStrong((id *)&self->_diagnosticID, 0);
  objc_storeStrong((id *)&self->_accessoryLogSubsystem, 0);
  objc_storeStrong((id *)&self->_accessoryLogs, 0);

  objc_storeStrong((id *)&self->_bluetoothQueue, 0);
}

@end