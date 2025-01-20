@interface SystemDiagnosticLogAgentiOS
- (BOOL)ASPToolTrace:(id)a3 withTimeout:(double)a4;
- (BOOL)GEAvailabilityTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)_BTPHYTaskWithTimeout:(double)a3;
- (BOOL)_basebandTSTriggerWithTimeout:(double)a3;
- (BOOL)_networkRelayTaskWithTimeout:(double)a3 atDirectory:(id)a4;
- (BOOL)_proximityTaskWithTimeout:(double)a3;
- (BOOL)getAccessibilityPreferences:(id)a3 withTimeout:(double)a4;
- (BOOL)getKeyboardPreferences:(id)a3 withTimeout:(double)a4;
- (BOOL)springBoardStateDumpTaskWithTimeout:(double)a3;
- (BOOL)takeStackshotWithFlags:(unsigned int)a3 withTimeout:(double)a4;
- (id)_AWDTaskWithTimeout:(double)a3;
- (id)fetchSiriEnrollmentLogsWithTimeout:(double)a3;
- (void)processMessage:(id)a3 replyWith:(id)a4;
@end

@implementation SystemDiagnosticLogAgentiOS

- (BOOL)_proximityTaskWithTimeout:(double)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v5 = dlopen(0, 2);
  if (!v5)
  {
    v10 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "couldn't get handle", buf, 2u);
    }

    goto LABEL_16;
  }
  dlerror();
  v6 = dlsym(v5, "PRCollectLogs");
  if (!v6)
  {
    v11 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Proximity API not found", buf, 2u);
    }

    dlclose(v5);
LABEL_16:
    BOOL v9 = 0;
    goto LABEL_17;
  }
  v7 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Proximity API found", buf, 2u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000555C;
  v13[3] = &unk_10006C7F8;
  v13[4] = &v15;
  v13[5] = v6;
  if (!+[SystemDiagnosticLogAgent _runBlock:v13 withTimeout:a3])
  {
    v8 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Proxmitiy SPI timed out", buf, 2u);
    }
  }
  dlclose(v5);
  BOOL v9 = *((unsigned char *)v16 + 24) != 0;
LABEL_17:
  _Block_object_dispose(&v15, 8);
  return v9;
}

- (BOOL)springBoardStateDumpTaskWithTimeout:(double)a3
{
  if (objc_opt_class())
  {
    if (+[SystemDiagnosticLogAgent _runBlock:&stru_10006C838 withTimeout:a3])
    {
      return 1;
    }
    v6 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100039318();
    }
  }
  else
  {
    v6 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000392E4();
    }
  }

  return 0;
}

- (id)fetchSiriEnrollmentLogsWithTimeout:(double)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_100005834;
  v13 = sub_100005844;
  id v14 = &__NSArray0__struct;
  if (objc_opt_class())
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000584C;
    v8[3] = &unk_10006C860;
    v8[4] = self;
    v8[5] = &v9;
    if (+[SystemDiagnosticLogAgent _runBlock:v8 withTimeout:a3])
    {
      goto LABEL_8;
    }
    v5 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100039380();
    }
  }
  else
  {
    v5 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003934C();
    }
  }

LABEL_8:
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_AWDTaskWithTimeout:(double)a3
{
  if (&_AWDServerConsolidateDeviceDiagnostics)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    v32 = buf;
    uint64_t v33 = 0x3032000000;
    v34 = sub_100005834;
    v35 = sub_100005844;
    id v36 = 0;
    id v8 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v9 = dispatch_get_global_queue(25, 0);
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    v27 = sub_100005D3C;
    v28 = &unk_10006C888;
    v30 = buf;
    v4 = v7;
    v29 = v4;
    AWDServerConsolidateDeviceDiagnostics();

    if (a3 == -1.0)
    {
      dispatch_time_t v10 = -1;
    }
    else
    {
      if (a3 <= 0.0)
      {
        uint64_t v11 = [(SystemDiagnosticLogAgent *)self logHandle];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          v12 = "Unknown value for timeout specified. Returning";
          goto LABEL_25;
        }
LABEL_29:
        id v5 = 0;
LABEL_30:

        _Block_object_dispose(buf, 8);
        goto LABEL_31;
      }
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    }
    if (dispatch_semaphore_wait(v4, v10))
    {
      uint64_t v11 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        v12 = "Timed out waiting for AWD server.";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, v24, 2u);
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v11 = [*((id *)v32 + 5) objectForKey:kAwdDiagnosticsFileArray];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v11 = v11;
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v37 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v21;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v17 = sub_1000085D8(v16);
                [v8 addObject:v17];
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v20 objects:v37 count:16];
          }
          while (v13);
        }

        id v5 = v8;
        goto LABEL_30;
      }
      char v18 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Invalid file list returned from AWD server.", v24, 2u);
      }
    }
    goto LABEL_29;
  }
  v4 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AWDServer SPI not available", buf, 2u);
  }
  id v5 = 0;
LABEL_31:

  return v5;
}

- (BOOL)_BTPHYTaskWithTimeout:(double)a3
{
  if (&_CoreCaptureControlCreate)
  {
    *(void *)buf = 0;
    uint64_t v11 = buf;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100005F08;
    v9[3] = &unk_10006C8B0;
    v9[4] = self;
    v9[5] = buf;
    BOOL v5 = +[SystemDiagnosticLogAgent _runBlock:v9 withTimeout:a3];
    id v6 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished corecapture BTPHY SPI", v8, 2u);
    }

    if (!v11[24]) {
      BOOL v5 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v4 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CoreCapture SPI not available", buf, 2u);
    }

    return 0;
  }
  return v5;
}

- (BOOL)_networkRelayTaskWithTimeout:(double)a3 atDirectory:(id)a4
{
  id v6 = a4;
  dispatch_semaphore_t v7 = v6;
  if (&_NRDiagnosticSaveNetworkRelayStatusToDirectory)
  {
    *(void *)buf = 0;
    long long v23 = buf;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    char v18 = sub_10000626C;
    v19 = &unk_10006C860;
    long long v21 = buf;
    id v20 = v6;
    if (+[SystemDiagnosticLogAgent _runBlock:&v16 withTimeout:a3])
    {
      dispatch_time_t v10 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = v23[24];
        *(_DWORD *)uint64_t v26 = 67109120;
        int v27 = v11;
        uint64_t v12 = "Did NRDiagnosticSaveNetworkRelayStatusToDirectory succeed %d";
        char v13 = v10;
        uint32_t v14 = 8;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, v26, v14);
      }
    }
    else
    {
      dispatch_time_t v10 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v26 = 0;
        uint64_t v12 = "NRDiagnosticSaveNetworkRelayStatusToDirectory timed out.";
        char v13 = v10;
        uint32_t v14 = 2;
        goto LABEL_10;
      }
    }

    BOOL v9 = v23[24] != 0;
    _Block_object_dispose(buf, 8);
    goto LABEL_12;
  }
  id v8 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NetworkRelay SPI not available", buf, 2u);
  }

  BOOL v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)_basebandTSTriggerWithTimeout:(double)a3
{
  if (&_PLSysdiagnoseTimeSensitivePhase)
  {
    if (+[SystemDiagnosticLogAgent _runBlock:&stru_10006C8D0 withTimeout:a3])
    {
      return 1;
    }
    v4 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      BOOL v5 = "PLSysdiagnoseTimeSensitivePhase timed out.";
      id v6 = (uint8_t *)&v8;
      goto LABEL_8;
    }
  }
  else
  {
    v4 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      BOOL v5 = "PLSysdiagnoseTimeSensitivePhase SPI not available";
      id v6 = (uint8_t *)&v9;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }

  return 0;
}

- (BOOL)GEAvailabilityTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  [v6 stringByAppendingPathComponent:@"GEAvailability.log"];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000650C;
  v12[3] = &unk_10006C920;
  v12[4] = self;
  uint32_t v14 = &v15;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v7;
  if (+[SystemDiagnosticLogAgent _runBlock:v12 withTimeout:a4]&& *((unsigned char *)v16 + 24))
  {
    BOOL v8 = 1;
  }
  else
  {
    __int16 v9 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "GEAvailability task SPI not available, timed out or couldn't create the dest file", v11, 2u);
    }

    BOOL v8 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)takeStackshotWithFlags:(unsigned int)a3 withTimeout:(double)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000690C;
  v5[3] = &unk_10006C948;
  v5[4] = self;
  unsigned int v6 = a3;
  return +[SystemDiagnosticLogAgent _runBlock:v5 withTimeout:a4];
}

- (BOOL)ASPToolTrace:(id)a3 withTimeout:(double)a4
{
  unsigned int v6 = [a3 stringByAppendingPathComponent:@"asptool_trace.log"];
  LOBYTE(self) = [(SystemDiagnosticLogAgent *)self ASPToolGenericWithTimeout:v6 forFile:&stru_10006C988 andBlock:a4];

  return (char)self;
}

- (BOOL)getKeyboardPreferences:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100005834;
  uint64_t v33 = sub_100005844;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100005834;
  int v27 = sub_100005844;
  id v28 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006D84;
  v18[3] = &unk_10006C9B0;
  v18[4] = self;
  v19 = &off_10006EA08;
  long long v21 = &v29;
  long long v22 = &v23;
  id v20 = &off_10006EA20;
  unsigned __int8 v7 = +[SystemDiagnosticLogAgent _runBlock:v18 withTimeout:a4];
  if ((v7 & 1) == 0)
  {
    BOOL v8 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Couldn't retrieve the preferences within the required time", v17, 2u);
    }
  }
  if ([(id)v30[5] count] || objc_msgSend((id)v24[5], "count"))
  {
    __int16 v9 = [(id)v30[5] description];
    dispatch_time_t v10 = [@"com.apple.Preferences:\n" stringByAppendingString:v9];

    int v11 = [(id)v24[5] description];
    uint64_t v12 = [@"GlobalPreferences:\n" stringByAppendingString:v11];
    id v13 = [v10 stringByAppendingString:v12];
  }
  else
  {
    id v13 = @"Could not retrieve keyboard preferences.";
  }
  unsigned __int8 v14 = sub_1000084F0(v6, @"Keyboard_Preferences.txt", v13);
  if ((v14 & 1) == 0)
  {
    uint64_t v15 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Couldn't write keyboard preferences.", v17, 2u);
    }
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v7 & v14;
}

- (BOOL)getAccessibilityPreferences:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_100005834;
  v30 = sub_100005844;
  id v31 = 0;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100005834;
  uint64_t v24 = sub_100005844;
  id v25 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000070C4;
  v16[3] = &unk_10006C9D8;
  v16[4] = self;
  uint64_t v17 = &off_10006EA38;
  char v18 = &v26;
  v19 = &v20;
  unsigned int v7 = +[SystemDiagnosticLogAgent _runBlock:v16 withTimeout:a4];
  if ((v7 & 1) == 0)
  {
    BOOL v8 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Could not retrieve accessibility preferences within the required time", buf, 2u);
    }
  }
  if ([(id)v27[5] count])
  {
    __int16 v9 = [(id)v27[5] description];
    dispatch_time_t v10 = [@"com.apple.Accessibility:" stringByAppendingString:v9];
  }
  else
  {
    dispatch_time_t v10 = @"Could not retrieve accessibility preferences.";
  }
  if ([(id)v21[5] count])
  {
    int v11 = [(id)v21[5] description];
    uint64_t v12 = [(__CFString *)v10 stringByAppendingFormat:@"com.apple.Accessibility.TouchAccommodations:\n%s", [(__CFString *)v11 UTF8String]];

    dispatch_time_t v10 = v11;
  }
  else
  {
    uint64_t v12 = [(__CFString *)v10 stringByAppendingString:@"Could not retrieve touch accommodations preferences."];
  }

  unsigned int v13 = v7 & sub_1000084F0(v6, @"Accessibility_Preferences.txt", v12);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v13;
}

- (void)processMessage:(id)a3 replyWith:(id)a4
{
  id v6 = a4;
  int v39 = -1;
  uint64_t v37 = 0;
  double v38 = 0.0;
  id v36 = 0;
  unsigned int v7 = [(SystemDiagnosticLogAgent *)self parseLogAgentRequest:a3 outputPath:&v36 timeout:&v38 taskType:&v39 startTimeClockNS:&v37];
  id v8 = v36;
  id v9 = v8;
  if (v7)
  {
    switch(v39)
    {
      case 1:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgentiOS *)self getAccessibilityPreferences:v8 withTimeout:v38];
        goto LABEL_62;
      case 2:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self ACLogsTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 3:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self ASPToolTaskForDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 4:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self ASPMagazineTaskForDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 5:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self ASPToolSnapshotForDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 6:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgentiOS *)self ASPToolTrace:v8 withTimeout:v38];
        goto LABEL_62;
      case 7:
        int v11 = [(SystemDiagnosticLogAgentiOS *)self _AWDTaskWithTimeout:v38];
        goto LABEL_66;
      case 8:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self _backgroundPowerTaskForDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 9:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self batteryHealthTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 10:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self batteryUITaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 11:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgentiOS *)self _BTPHYTaskWithTimeout:v38];
        goto LABEL_62;
      case 12:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self getCloudKitPreferences:v8 withTimeout:v38];
        goto LABEL_62;
      case 13:
        double v12 = v38;
        unsigned int v13 = self;
        id v14 = v9;
        uint64_t v15 = 1;
        goto LABEL_19;
      case 14:
        self = [(SystemDiagnosticLogAgent *)self coreCaptureConfigTask:v38];
        if (!self) {
          goto LABEL_63;
        }
        xpc_dictionary_set_value(v6, "replyDictionary", self);

        id v16 = 0;
        id v17 = 0;
        goto LABEL_78;
      case 15:
        double v12 = v38;
        unsigned int v13 = self;
        id v14 = v9;
        uint64_t v15 = 0;
LABEL_19:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)v13 coreCaptureTaskWithDir:v14 withTimeout:v15 ofType:v12];
        goto LABEL_62;
      case 16:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self coreRepairDiagnosticTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 18:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self DSCSYMTaskForDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 20:
        int v11 = [(SystemDiagnosticLogAgent *)self excResourcePathsWithTimeout:v38];
        goto LABEL_66;
      case 21:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self FDRDiagnosticTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 23:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgentiOS *)self GEAvailabilityTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 25:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self HIDCrashlogsTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 26:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgentiOS *)self getKeyboardPreferences:v8 withTimeout:v38];
        goto LABEL_62;
      case 27:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self _libNotifyTaskAtLocation:v8 andTimeout:v38];
        goto LABEL_62;
      case 28:
        int v11 = [(SystemDiagnosticLogAgent *)self _memoryExceptionsTaskWithTimeout:v38];
        goto LABEL_66;
      case 29:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self _memoryExceptionsListLogsTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 30:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgentiOS *)self _networkRelayTaskWithTimeout:v8 atDirectory:v38];
        goto LABEL_62;
      case 31:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self osEligibilityDumpToDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 32:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self PersonalizationTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 33:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self _powerTaskForDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 34:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self getPreferences:v8 withTimeout:v38];
        goto LABEL_62;
      case 35:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self getPreferencesInternal:v8 withTimeout:v38];
        goto LABEL_62;
      case 36:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self proactiveInputPredictionsTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 38:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgentiOS *)self _proximityTaskWithTimeout:v38];
        goto LABEL_62;
      case 39:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self runningBoardTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 40:
        double v19 = v38;
        uint64_t v20 = self;
        uint64_t v21 = 0;
        goto LABEL_46;
      case 41:
        double v19 = v38;
        uint64_t v20 = self;
        uint64_t v21 = 0x8000;
LABEL_46:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgentiOS *)v20 takeStackshotWithFlags:v21 withTimeout:v19];
        goto LABEL_62;
      case 46:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self tailspinInfoTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 47:
        id v17 = [(SystemDiagnosticLogAgent *)self tailspinKeychordTaskWithDir:v8 withTimeout:v38];
        LOBYTE(self) = 0;
        goto LABEL_53;
      case 48:
        uint64_t v22 = [v8 stringByAppendingPathComponent:@"sysdiagnose_logarchive_timeout_nosymbols.tailspin"];

        double v23 = v38;
        CFStringRef v24 = @"logarchive timeout";
        goto LABEL_51;
      case 49:
        uint64_t v22 = [v8 stringByAppendingPathComponent:@"sysdiagnose_outputdir_timeout_nosymbols.tailspin"];

        double v23 = v38;
        CFStringRef v24 = @"Output Dir timeout";
LABEL_51:
        if ([(SystemDiagnosticLogAgent *)self tailspinSaveSpiWrapperForReason:v24 forPath:v22 collectAriadne:1 withTimeout:v23])
        {
          id v9 = v22;
          LOBYTE(self) = 1;
          id v17 = v9;
LABEL_53:
          if (v17)
          {
            xpc_object_t v25 = xpc_array_create(0, 0);
            id v16 = v17;
            xpc_array_set_string(v25, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v16 fileSystemRepresentation]);
            id v17 = 0;
            goto LABEL_76;
          }
          id v16 = 0;
        }
        else
        {
          id v16 = 0;
          id v17 = 0;
          LOBYTE(self) = 0;
          id v9 = v22;
        }
        break;
      case 50:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self tailspinSaveNoSymbolicateTSTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 51:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self timezoneTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 52:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self trialTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 54:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgent *)self unifiedAssetTaskWithDir:v8 withTimeout:v38];
        goto LABEL_62;
      case 55:
        int v11 = [(SystemDiagnosticLogAgent *)self intelligencePlatformTaskWithTimeout:v8 withTimeout:v38];
        goto LABEL_66;
      case 57:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgentiOS *)self _basebandTSTriggerWithTimeout:v38];
        goto LABEL_62;
      case 59:
        unsigned __int8 v10 = [(SystemDiagnosticLogAgentiOS *)self springBoardStateDumpTaskWithTimeout:v38];
LABEL_62:
        LOBYTE(self) = v10;
LABEL_63:
        id v16 = 0;
        id v17 = 0;
        break;
      case 61:
        int v11 = [(SystemDiagnosticLogAgentiOS *)self fetchSiriEnrollmentLogsWithTimeout:v38];
LABEL_66:
        id v17 = v11;
        if (!v11 || ![v11 count])
        {
          id v16 = 0;
          goto LABEL_25;
        }
        xpc_object_t v25 = xpc_array_create(0, 0);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v17 = v17;
        id v26 = [v17 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v32;
          do
          {
            for (i = 0; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v32 != v28) {
                objc_enumerationMutation(v17);
              }
              id v30 = *(id *)(*((void *)&v31 + 1) + 8 * i);
              xpc_array_set_string(v25, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v30 fileSystemRepresentation:[v31 fileSystemRepresentation]]);
            }
            id v27 = [v17 countByEnumeratingWithState:&v31 objects:v40 count:16];
          }
          while (v27);
        }

        LOBYTE(self) = 0;
        id v16 = 0;
LABEL_76:
        if (v25)
        {
          xpc_dictionary_set_value(v6, "resultPaths", v25);

LABEL_78:
          LOBYTE(self) = 1;
        }
        break;
      default:
        char v18 = [(SystemDiagnosticLogAgent *)self logHandle];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not a valid request type for sysdiagnose_agent", buf, 2u);
        }

        goto LABEL_24;
    }
  }
  else
  {
LABEL_24:
    id v16 = 0;
    id v17 = 0;
LABEL_25:
    LOBYTE(self) = 0;
  }
  xpc_dictionary_set_BOOL(v6, "result", (BOOL)self);
}

@end