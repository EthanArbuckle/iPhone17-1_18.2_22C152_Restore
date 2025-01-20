@interface SystemDiagnosticLogAgent
+ (BOOL)_runBlock:(id)a3 withTimeout:(double)a4;
+ (BOOL)_runDispatchBlock:(id)a3 withTimeout:(double)a4 onQueue:(id)a5;
+ (id)logAgentWithTaskType:(int)a3;
+ (id)stringForReqType:(int)a3;
- (BOOL)ACLogsTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)ASPMagazineTaskForDir:(id)a3 withTimeout:(double)a4;
- (BOOL)ASPToolGenericWithTimeout:(double)a3 forFile:(id)a4 andBlock:(id)a5;
- (BOOL)ASPToolSnapshotForDir:(id)a3 withTimeout:(double)a4;
- (BOOL)ASPToolTaskForDir:(id)a3 withTimeout:(double)a4;
- (BOOL)DSCSYMTaskForDir:(id)a3 withTimeout:(double)a4;
- (BOOL)FDRDiagnosticTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)HIDCrashlogsTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)PersonalizationTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)_backgroundPowerTaskForDir:(id)a3 withTimeout:(double)a4;
- (BOOL)_extendedPowerTaskForDir:(id)a3;
- (BOOL)_libNotifyTaskAtLocation:(id)a3 andTimeout:(double)a4;
- (BOOL)_memoryExceptionsListLogsTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)_powerTaskForDir:(id)a3 withTimeout:(double)a4;
- (BOOL)_runBlockForCurrentUser:(id)a3 withTimeout:(double)a4;
- (BOOL)batteryHealthTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)batteryUITaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)coreCaptureTaskWithDir:(id)a3 withTimeout:(double)a4 ofType:(int)a5;
- (BOOL)coreRepairDiagnosticTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)getCloudKitPreferences:(id)a3 withTimeout:(double)a4;
- (BOOL)getPreferences:(id)a3 withTimeout:(double)a4;
- (BOOL)getPreferencesInternal:(id)a3 withTimeout:(double)a4;
- (BOOL)osEligibilityDumpToDir:(id)a3 withTimeout:(double)a4;
- (BOOL)parseLogAgentRequest:(id)a3 outputPath:(id *)a4 timeout:(double *)a5 taskType:(int *)a6 startTimeClockNS:(int64_t *)a7;
- (BOOL)proactiveInputPredictionsTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)runningBoardTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)setRootMode;
- (BOOL)setUserMode;
- (BOOL)tailspinInfoTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)tailspinSaveNoSymbolicateTSTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)tailspinSaveSpiWrapperForReason:(id)a3 forPath:(id)a4 collectAriadne:(BOOL)a5 withTimeout:(double)a6;
- (BOOL)timezoneTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)trialTaskWithDir:(id)a3 withTimeout:(double)a4;
- (BOOL)unifiedAssetTaskWithDir:(id)a3 withTimeout:(double)a4;
- (OS_dispatch_queue)serialQueue;
- (OS_os_log)logHandle;
- (id)_memoryExceptionsTaskWithTimeout:(double)a3;
- (id)coreCaptureConfigTask:(double)a3;
- (id)excResourcePathsWithTimeout:(double)a3;
- (id)getPreferencesForDomain:(id)a3 withKey:(id)a4 andNestedKeys:(id)a5 currentUser:(BOOL)a6;
- (id)getPreferencesForDomain:(id)a3 withKeys:(id)a4 currentUser:(BOOL)a5;
- (id)intelligencePlatformTaskWithTimeout:(id)a3 withTimeout:(double)a4;
- (id)tailspinAugmentSpiWrapperForPath:(id)a3 withDestName:(id)a4 collectAriadne:(BOOL)a5 withTimeout:(double)a6;
- (id)tailspinAugmentTaskWithDir:(id)a3 withTimeout:(double)a4;
- (id)tailspinKeychordTaskWithDir:(id)a3 withTimeout:(double)a4;
- (int64_t)_logItemForType:(int)a3;
- (void)processMessage:(id)a3 replyWith:(id)a4;
- (void)setLogHandle:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)writePreferenceInDomain:(id)a3 withKey:(id)a4 toDirectory:(id)a5 currentUser:(BOOL)a6;
@end

@implementation SystemDiagnosticLogAgent

+ (id)logAgentWithTaskType:(int)a3
{
  v4 = objc_alloc_init(SystemDiagnosticLogAgentiOS);
  sub_100007958(a3);
  id v5 = objc_claimAutoreleasedReturnValue();
  os_log_t v6 = os_log_create("com.apple.sysdiagnose", (const char *)[v5 UTF8String]);
  [(SystemDiagnosticLogAgent *)v4 setLogHandle:v6];

  return v4;
}

- (void)processMessage:(id)a3 replyWith:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[SystemDiagnosticLogAgent processMessage:replyWith:]", "SystemDiagnosticLogAgent.m", 162, "0 && \"Should call this from subclass only\"");
}

- (BOOL)HIDCrashlogsTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v5 = a3;
  if (objc_opt_class())
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008A64;
    v8[3] = &unk_10006CA20;
    id v9 = v5;
    BOOL v6 = +[SystemDiagnosticLogAgent _runBlock:v8 withTimeout:a4];
    if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HIDCrashlogsTaskWithDir SPI timed out", buf, 2u);
    }
  }
  else
  {
    BOOL v6 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AppleDeviceManagementHIDDiagnostics class not found on this platform, failing HIDCrashlogsTaskWithDir", buf, 2u);
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)DSCSYMTaskForDir:(id)a3 withTimeout:(double)a4
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100008BC8;
  v11[3] = &unk_10006C860;
  v13 = &v14;
  id v6 = a3;
  id v12 = v6;
  if (!+[SystemDiagnosticLogAgent _runBlock:v11 withTimeout:a4])
  {
    v7 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DSCSYM task timed out", v10, 2u);
    }
  }
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (BOOL)ACLogsTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  if (objc_opt_class())
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    *(void *)buf = 0;
    v18 = buf;
    uint64_t v19 = 0x3032000000;
    v20 = sub_100008E48;
    v21 = sub_100008E58;
    id v22 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100008E60;
    v13[3] = &unk_10006C9D8;
    v15 = buf;
    v13[4] = self;
    id v14 = v6;
    uint64_t v16 = &v23;
    if (+[SystemDiagnosticLogAgent _runBlock:v13 withTimeout:a4])
    {
      BOOL v7 = *((unsigned char *)v24 + 24) != 0;
    }
    else
    {
      id v9 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ACLogsTaskWithDir SPI timed out", v12, 2u);
      }

      v10 = (void *)*((void *)v18 + 5);
      if (v10) {
        [v10 endSession];
      }
      BOOL v7 = 0;
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    char v8 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NFHardwareManager class not found on this platform, failing ACLogsTaskWithDir", buf, 2u);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (id)intelligencePlatformTaskWithTimeout:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  if (objc_opt_class())
  {
    *(void *)buf = 0;
    v24 = buf;
    uint64_t v25 = 0x3032000000;
    char v26 = sub_100008E48;
    v27 = sub_100008E58;
    id v28 = 0;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000943C;
    v18[3] = &unk_10006CA70;
    v18[4] = self;
    v18[5] = buf;
    v18[6] = &v19;
    if (+[SystemDiagnosticLogAgent _runBlock:v18 withTimeout:a4])
    {
      if (*((unsigned char *)v20 + 24))
      {
        BOOL v7 = [v6 stringByAppendingPathComponent:@"intelligence_platform_status.json"];
        char v8 = (void *)*((void *)v24 + 5);
        id v17 = 0;
        unsigned __int8 v9 = [v8 writeToFile:v7 atomically:0 encoding:4 error:&v17];
        v10 = v17;
        if (v9)
        {
          v29 = v7;
          v11 = +[NSArray arrayWithObjects:&v29 count:1];
        }
        else
        {
          id v14 = [(SystemDiagnosticLogAgent *)self logHandle];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = [v10 localizedDescription];
            *(_DWORD *)v30 = 138412546;
            v31 = v7;
            __int16 v32 = 2112;
            v33 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to write intelligence platform data to '%@' with error: %@", v30, 0x16u);
          }
          v11 = &__NSArray0__struct;
        }

        goto LABEL_19;
      }
      v10 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        v13 = "Intelligence platform SPI did not succeed";
        goto LABEL_13;
      }
    }
    else
    {
      v10 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        v13 = "Intelligence platform SPI timed out";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v13, v30, 2u);
      }
    }
    v11 = &__NSArray0__struct;
LABEL_19:

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_20;
  }
  id v12 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "GDXPCSysdiagnoseService class not found on this platform, failing intelligencePlatformTaskWithTimeout", buf, 2u);
  }

  v11 = &__NSArray0__struct;
LABEL_20:

  return v11;
}

- (BOOL)PersonalizationTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  [v6 stringByAppendingPathComponent:@"PersonalizationPortrait.log"];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000096E0;
  v12[3] = &unk_10006C920;
  v12[4] = self;
  id v14 = &v15;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v7;
  if (+[SystemDiagnosticLogAgent _runBlock:v12 withTimeout:a4]&& *((unsigned char *)v16 + 24))
  {
    BOOL v8 = 1;
  }
  else
  {
    unsigned __int8 v9 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Personalization SPI timed out or couldn't create the dest file", v11, 2u);
    }

    BOOL v8 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)batteryUITaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  id v7 = v6;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  if (&_PLSysdiagnoseCopyBatteryUILogs)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100009A08;
    v12[3] = &unk_10006CA98;
    uint64_t v15 = &v17;
    id v13 = v6;
    id v14 = self;
    if (+[SystemDiagnosticLogAgent _runBlock:v12 withTimeout:a4]&& *((unsigned char *)v18 + 24))
    {
      BOOL v9 = 1;
    }
    else
    {
      v10 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Battery UI logs timedout / resulted an error", buf, 2u);
      }

      BOOL v9 = 0;
    }
    BOOL v8 = v13;
  }
  else
  {
    BOOL v8 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PLSysdiagnoseCopyBatteryUILogs SPI not found", buf, 2u);
    }
    BOOL v9 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (BOOL)proactiveInputPredictionsTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  [v6 stringByAppendingPathComponent:@"ProactiveInputPredictions.log"];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009C88;
  v12[3] = &unk_10006C920;
  void v12[4] = self;
  id v14 = &v15;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v7;
  if (+[SystemDiagnosticLogAgent _runBlock:v12 withTimeout:a4]&& *((unsigned char *)v16 + 24))
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v9 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ProactiveInputPredictions SPI timed out or couldn't create the dest file", v11, 2u);
    }

    BOOL v8 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)batteryHealthTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  id v7 = v6;
  if (&_IOPSCopyPowerSourcesByTypePrecise)
  {
    [v6 stringByAppendingPathComponent:@"BatteryHealth.log"];
    *(void *)buf = 0;
    char v18 = buf;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000A018;
    v14[3] = &unk_10006C920;
    v14[4] = self;
    uint64_t v16 = buf;
    BOOL v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = v8;
    unsigned int v10 = +[SystemDiagnosticLogAgent _runBlock:v14 withTimeout:a4];
    if (v10 && v18[24])
    {
      BOOL v9 = 1;
    }
    else
    {
      v11 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = v18[24];
        *(_DWORD *)uint64_t v21 = 67109376;
        unsigned int v22 = v10;
        __int16 v23 = 1024;
        int v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "IOKitPS SPI timed out (%d) or couldn't create the dest file (%d)", v21, 0xEu);
      }

      BOOL v9 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v8 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IOPSCopyPowerSourcesByTypePrecise SPI not found", buf, 2u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)timezoneTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  [v6 stringByAppendingPathComponent:@"tzDataVersion.log"];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000A500;
  v12[3] = &unk_10006C860;
  id v14 = &v15;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v7;
  if (+[SystemDiagnosticLogAgent _runBlock:v12 withTimeout:a4]&& *((unsigned char *)v16 + 24))
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v9 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SPI timed out or couldn't create the dest file", v11, 2u);
    }

    BOOL v8 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)runningBoardTaskWithDir:(id)a3 withTimeout:(double)a4
{
  if (&_RBSCaptureStateToFile)
  {
    [a3 stringByAppendingPathComponent:@"RunningBoard_state.log"];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000A74C;
    v10[3] = &unk_10006CA20;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v5;
    BOOL v6 = +[SystemDiagnosticLogAgent _runBlock:v10 withTimeout:a4];
    if (!v6)
    {
      BOOL v8 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "RunningBoard SPI timed out or couldn't create the dest file", buf, 2u);
      }
    }
  }
  else
  {
    id v5 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RunningBoard SPI not found", buf, 2u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)_logItemForType:(int)a3
{
  int64_t v3 = 56;
  if (a3) {
    int64_t v3 = 0;
  }
  if (a3 == 1) {
    return 79;
  }
  else {
    return v3;
  }
}

- (BOOL)coreCaptureTaskWithDir:(id)a3 withTimeout:(double)a4 ofType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  if (objc_opt_class())
  {
    int64_t v9 = [(SystemDiagnosticLogAgent *)self _logItemForType:v5];
    if (v9)
    {
      *(void *)buf = 0;
      __int16 v32 = buf;
      uint64_t v33 = 0x3032000000;
      v34 = sub_100008E48;
      v35 = sub_100008E58;
      id v36 = 0;
      uint64_t v25 = 0;
      char v26 = &v25;
      uint64_t v27 = 0x3032000000;
      id v28 = sub_100008E48;
      v29 = sub_100008E58;
      id v30 = 0;
      uint64_t v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      uint64_t v17 = sub_10000AAE8;
      char v18 = &unk_10006CAC0;
      int64_t v23 = v9;
      uint64_t v19 = self;
      double v24 = a4;
      id v20 = v8;
      uint64_t v21 = buf;
      unsigned int v22 = &v25;
      if (+[SystemDiagnosticLogAgent _runBlock:&v15 withTimeout:a4])
      {
        if (*((void *)v32 + 5))
        {
          BOOL v10 = 1;
LABEL_17:

          _Block_object_dispose(&v25, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_18;
        }
        int v12 = [(SystemDiagnosticLogAgent *)self logHandle];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [(id)v26[5] localizedDescription];
          *(_DWORD *)v37 = 138412290;
          v38 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CoreCapture SPI failed due to %@", v37, 0xCu);
        }
      }
      else
      {
        int v12 = [(SystemDiagnosticLogAgent *)self logHandle];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v37 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CoreCapture task timed out", v37, 2u);
        }
      }

      BOOL v10 = 0;
      goto LABEL_17;
    }
    v11 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not a valid corecapture request type.", buf, 2u);
    }
  }
  else
  {
    v11 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Wifi velocity SPI not found", buf, 2u);
    }
  }

  BOOL v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)unifiedAssetTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  if (objc_opt_class())
  {
    [v6 stringByAppendingPathComponent:@"unified_asset_manager.log"];
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000AE88;
    v11[3] = &unk_10006C920;
    void v11[4] = self;
    id v13 = &v14;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    int v12 = v7;
    if (+[SystemDiagnosticLogAgent _runBlock:v11 withTimeout:a4]&& *((unsigned char *)v15 + 24))
    {
      BOOL v8 = 1;
    }
    else
    {
      int64_t v9 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000394EC();
      }

      BOOL v8 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v7 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000394B8();
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)trialTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  if (objc_opt_class())
  {
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_10000B0C0;
    uint64_t v14 = &unk_10006CAE8;
    uint64_t v15 = v6;
    uint64_t v16 = self;
    BOOL v7 = +[SystemDiagnosticLogAgent _runBlock:&v11 withTimeout:a4];
    if (!v7)
    {
      BOOL v8 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100039690();
      }
    }
    int64_t v9 = v15;
  }
  else
  {
    int64_t v9 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003965C();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_backgroundPowerTaskForDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (&_PLSysdiagnoseCopyLogs)
  {
    *(void *)buf = 0;
    id v20 = buf;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000B370;
    v15[3] = &unk_10006CB10;
    double v18 = a4;
    id v16 = v6;
    char v17 = buf;
    unsigned int v10 = +[SystemDiagnosticLogAgent _runBlock:v15 withTimeout:a4];
    if ((v10 & 1) == 0)
    {
      v11 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Background powerlogs timed out", v14, 2u);
      }
    }
    if (v20[24])
    {
      if (v10)
      {
LABEL_11:
        BOOL v9 = v20[24] != 0;
LABEL_16:

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v12 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Background powerlogs did not succeed", v14, 2u);
      }

      if (v10) {
        goto LABEL_11;
      }
    }
    BOOL v9 = 0;
    goto LABEL_16;
  }
  BOOL v8 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Background powerlog SPI not found", buf, 2u);
  }

  BOOL v9 = 0;
LABEL_17:

  return v9;
}

- (BOOL)_powerTaskForDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  [(SystemDiagnosticLogAgent *)self _extendedPowerTaskForDir:v6];
  if (&_PLSysdiagnoseCopyPowerlog)
  {
    *(void *)buf = 0;
    id v20 = buf;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000B5EC;
    v14[3] = &unk_10006CB38;
    double v18 = a4;
    id v15 = v6;
    id v16 = self;
    char v17 = buf;
    unsigned int v9 = +[SystemDiagnosticLogAgent _runBlock:v14 withTimeout:a4];
    if ((v9 & 1) == 0)
    {
      unsigned int v10 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Power logs timed out", v13, 2u);
      }
    }
    if (v20[24])
    {
      if (v9)
      {
LABEL_11:
        BOOL v8 = v20[24] != 0;
LABEL_16:

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      v11 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Power logs did not succeed", v13, 2u);
      }

      if (v9) {
        goto LABEL_11;
      }
    }
    BOOL v8 = 0;
    goto LABEL_16;
  }
  BOOL v7 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PowerTask SPI not found", buf, 2u);
  }

  BOOL v8 = 0;
LABEL_17:

  return v8;
}

- (BOOL)_extendedPowerTaskForDir:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (&_PLSysdiagnoseCopyExtendedPersistenceLog)
  {
    *(void *)buf = 0;
    char v17 = buf;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000B998;
    v13[3] = &unk_10006C8B0;
    id v14 = v4;
    id v15 = buf;
    unsigned int v8 = +[SystemDiagnosticLogAgent _runBlock:v13 withTimeout:5.0];
    if ((v8 & 1) == 0)
    {
      unsigned int v9 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Powerlog Extended Persistence SPI timed out", v12, 2u);
      }
    }
    if (v17[24])
    {
      if (v8)
      {
LABEL_11:
        BOOL v7 = v17[24] != 0;
LABEL_16:

        _Block_object_dispose(buf, 8);
        goto LABEL_17;
      }
    }
    else
    {
      unsigned int v10 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Powerlog Extended Persistence SPI response did not contain path key", v12, 2u);
      }

      if (v8) {
        goto LABEL_11;
      }
    }
    BOOL v7 = 0;
    goto LABEL_16;
  }
  id v6 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Powerlog Extended Persistence SPI not found", buf, 2u);
  }

  BOOL v7 = 0;
LABEL_17:

  return v7;
}

- (id)excResourcePathsWithTimeout:(double)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100008E48;
  id v15 = sub_100008E58;
  id v16 = 0;
  if (!&_ExcResourceReportPaths)
  {
    id v4 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v5 = "CoreDiagnostics SPI not available.";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000BBC0;
  v9[3] = &unk_10006CB60;
  v9[4] = &v11;
  if (!+[SystemDiagnosticLogAgent _runBlock:v9 withTimeout:a3]|| (id v6 = (void *)v12[5]) == 0)
  {
    id v4 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v5 = "Failed to get paths for ExcResource logs.";
      goto LABEL_8;
    }
LABEL_9:

    id v6 = (void *)v12[5];
  }
  id v7 = v6;
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (id)_memoryExceptionsTaskWithTimeout:(double)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_100008E48;
  id v14 = sub_100008E58;
  id v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000BD70;
  v9[3] = &unk_10006CB60;
  v9[4] = &v10;
  if (!+[SystemDiagnosticLogAgent _runBlock:v9 withTimeout:a3]|| (id v4 = (void *)v11[5]) == 0)
  {
    uint64_t v5 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed to get ReportMemoryException logs.", v8, 2u);
    }

    id v4 = (void *)v11[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (BOOL)_memoryExceptionsListLogsTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  [v6 stringByAppendingPathComponent:@"ReportMemoryExceptionTool_listLogs.txt"];
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000BF94;
  v13[3] = &unk_10006C920;
  void v13[4] = self;
  id v15 = &v16;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  unsigned int v8 = +[SystemDiagnosticLogAgent _runBlock:v13 withTimeout:a4];
  if (v8 && *((unsigned char *)v17 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v10 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *((unsigned __int8 *)v17 + 24);
      *(_DWORD *)buf = 67109376;
      unsigned int v21 = v8;
      __int16 v22 = 1024;
      int v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "RMECacheEnumerator getLogPathsSortedByTime timed out !(%d) or failed to create dest file !(%d)", buf, 0xEu);
    }

    BOOL v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (id)coreCaptureConfigTask:(double)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (objc_opt_class())
  {
    *(void *)buf = 0;
    uint64_t v25 = buf;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = sub_100008E48;
    id v28 = sub_100008E58;
    id v29 = 0;
    uint64_t v18 = 0;
    char v19 = &v18;
    uint64_t v20 = 0x3032000000;
    unsigned int v21 = sub_100008E48;
    __int16 v22 = sub_100008E58;
    id v23 = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000C55C;
    v17[3] = &unk_10006CB88;
    v17[4] = self;
    v17[5] = buf;
    v17[6] = &v18;
    if (!+[SystemDiagnosticLogAgent _runBlock:v17 withTimeout:a3])
    {
      uint64_t v12 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CoreCaptureConfig task timed out", v30, 2u);
      }

      id v11 = 0;
      goto LABEL_24;
    }
    if (!*((void *)v25 + 5))
    {
      uint64_t v13 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(id)v19[5] localizedDescription];
        *(_DWORD *)id v30 = 138412290;
        v31 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Error querying Wifi Velocity configuration for peer due to %@. Assuming WiFiVelocity MegaProfile is not enabled", v30, 0xCu);
      }
      xpc_dictionary_set_BOOL(v5, "wiFiVelocityMegaProfile", 0);
      goto LABEL_23;
    }
    id v6 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10003974C(v30, (uint64_t)[*((id *)v25 + 5) megaWiFiProfile], v6);
    }

    id v7 = (void *)*((void *)v25 + 5);
    if (v7 && [v7 megaWiFiProfile] == (id)1)
    {
      xpc_dictionary_set_BOOL(v5, "wiFiVelocityMegaProfile", 1);
      unsigned int v8 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        BOOL v9 = "WiFiVelocity MegaProfile is enabled";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v16, 2u);
      }
    }
    else
    {
      xpc_dictionary_set_BOOL(v5, "wiFiVelocityMegaProfile", 0);
      unsigned int v8 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        BOOL v9 = "WiFiVelocity MegaProfile is not enabled";
        goto LABEL_18;
      }
    }

LABEL_23:
    id v11 = v5;
LABEL_24:
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_25;
  }
  uint64_t v10 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "WiFi Velocity SPI not found", buf, 2u);
  }

  id v11 = 0;
LABEL_25:

  return v11;
}

- (BOOL)ASPToolGenericWithTimeout:(double)a3 forFile:(id)a4 andBlock:(id)a5
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000C764;
  v14[3] = &unk_10006CBB0;
  id v15 = a4;
  uint64_t v16 = self;
  id v17 = a5;
  id v8 = v17;
  id v9 = v15;
  BOOL v10 = +[SystemDiagnosticLogAgent _runBlock:v14 withTimeout:a3];
  if (!v10)
  {
    id v11 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ASPTool task timed out", v13, 2u);
    }
  }
  return v10;
}

- (BOOL)ASPToolSnapshotForDir:(id)a3 withTimeout:(double)a4
{
  id v6 = [a3 stringByAppendingPathComponent:@"asptool_snapshot_timesensitive.log"];
  LOBYTE(self) = [(SystemDiagnosticLogAgent *)self ASPToolGenericWithTimeout:v6 forFile:&stru_10006CBD0 andBlock:a4];

  return (char)self;
}

- (BOOL)ASPToolTaskForDir:(id)a3 withTimeout:(double)a4
{
  id v6 = [a3 stringByAppendingPathComponent:@"asptool_snapshot.log"];
  LOBYTE(self) = [(SystemDiagnosticLogAgent *)self ASPToolGenericWithTimeout:v6 forFile:&stru_10006CBF0 andBlock:a4];

  return (char)self;
}

- (BOOL)FDRDiagnosticTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  id v7 = v6;
  if (&_ZhuGeCopyValue)
  {
    v26[0] = v6;
    v26[1] = @"FDRDiagnosticReport.plist";
    BOOL v10 = +[NSArray arrayWithObjects:v26 count:2];
    id v8 = +[NSURL fileURLWithPathComponents:v10];

    *(void *)buf = 0;
    char v19 = buf;
    uint64_t v20 = 0x3032000000;
    unsigned int v21 = sub_100008E48;
    __int16 v22 = sub_100008E58;
    id v23 = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000CC74;
    v17[3] = &unk_10006C860;
    v17[4] = self;
    v17[5] = buf;
    if (+[SystemDiagnosticLogAgent _runBlock:v17 withTimeout:a4])
    {
      id v11 = (void *)*((void *)v19 + 5);
      if (v11)
      {
        id v16 = 0;
        unsigned __int8 v12 = [v11 writeToURL:v8 error:&v16];
        uint64_t v13 = v16;
        if (v12)
        {
          id v14 = [(SystemDiagnosticLogAgent *)self logHandle];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)double v24 = 138412290;
            uint64_t v25 = v8;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FDRDiagnostic report generated successfully at %@", v24, 0xCu);
          }
          BOOL v9 = 1;
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v13 = 0;
      }
      id v14 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)double v24 = 138412290;
        uint64_t v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Could not write FDRDiagnostic report: %@", v24, 0xCu);
      }
    }
    else
    {
      id v14 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ZhuGe SPI timed out", v24, 2u);
      }
      uint64_t v13 = 0;
    }
    BOOL v9 = 0;
LABEL_18:

    _Block_object_dispose(buf, 8);
    goto LABEL_19;
  }
  id v8 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ZhuGe SPI not found", buf, 2u);
  }
  BOOL v9 = 0;
LABEL_19:

  return v9;
}

- (BOOL)coreRepairDiagnosticTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  if (&_CRGenerateRepairReport)
  {
    *(void *)buf = 0;
    uint64_t v20 = buf;
    uint64_t v21 = 0x3032000000;
    __int16 v22 = sub_100008E48;
    id v23 = sub_100008E58;
    id v24 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000D074;
    v18[3] = &unk_10006C8B0;
    v18[4] = self;
    v18[5] = buf;
    if (+[SystemDiagnosticLogAgent _runBlock:v18 withTimeout:a4])
    {
      if (*((void *)v20 + 5))
      {
        v26[0] = v6;
        v26[1] = @"RepairReport.plist";
        BOOL v9 = +[NSArray arrayWithObjects:v26 count:2];
        BOOL v10 = +[NSURL fileURLWithPathComponents:v9];

        id v11 = (void *)*((void *)v20 + 5);
        id v17 = 0;
        unsigned __int8 v8 = [v11 writeToURL:v10 error:&v17];
        id v12 = v17;
        uint64_t v13 = v12;
        if ((v8 & 1) == 0)
        {
          if (v12)
          {
            id v14 = [v12 localizedDescription];
          }
          else
          {
            id v14 = @"nil";
          }
          id v15 = [(SystemDiagnosticLogAgent *)self logHandle];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_1000397C8((uint64_t)[(__CFString *)v14 UTF8String], v25, v15);
          }
        }
        goto LABEL_20;
      }
      BOOL v10 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100039794();
      }
    }
    else
    {
      BOOL v10 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100039810();
      }
    }
    unsigned __int8 v8 = 0;
LABEL_20:

    _Block_object_dispose(buf, 8);
    goto LABEL_21;
  }
  id v7 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CoreRepair SPI not found", buf, 2u);
  }

  unsigned __int8 v8 = 0;
LABEL_21:

  return v8;
}

- (BOOL)tailspinInfoTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  id v7 = [(SystemDiagnosticLogAgent *)self logHandle];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (&_tailspin_config_copy_description) {
    BOOL v9 = &_tailspin_config_create_with_current_state == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tailspin SPI not found", buf, 2u);
    }
    BOOL v10 = 0;
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tailspin info task starting", buf, 2u);
    }

    v27[0] = v6;
    v27[1] = @"tailspin-info.txt";
    id v11 = +[NSArray arrayWithObjects:v27 count:2];
    id v12 = +[NSURL fileURLWithPathComponents:v11];

    *(void *)buf = 0;
    id v24 = buf;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000D47C;
    v19[3] = &unk_10006C920;
    id v7 = v12;
    uint64_t v21 = self;
    __int16 v22 = buf;
    uint64_t v20 = v7;
    unsigned int v13 = +[SystemDiagnosticLogAgent _runBlock:v19 withTimeout:a4];
    id v14 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Tailspin info task ending", v18, 2u);
    }

    if ((v13 & 1) == 0)
    {
      id v15 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Tailspin Info SPI timed out", v18, 2u);
      }
    }
    if (!v24[24])
    {
      id v16 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Tailspin Info SPI failed to create dest file", v18, 2u);
      }
    }
    if (v13) {
      BOOL v10 = v24[24] != 0;
    }
    else {
      BOOL v10 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  return v10;
}

- (BOOL)tailspinSaveSpiWrapperForReason:(id)a3 forPath:(id)a4 collectAriadne:(BOOL)a5 withTimeout:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(SystemDiagnosticLogAgent *)self logHandle];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!&_tailspin_dump_output_with_options_sync)
  {
    if (v13)
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Tailspin SPI not found", (uint8_t *)&buf, 2u);
    }

LABEL_16:
    BOOL v20 = 0;
    goto LABEL_27;
  }
  if (v13)
  {
    LOWORD(buf.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Tailspin save task starting", (uint8_t *)&buf, 2u);
  }

  id v14 = v11;
  int v15 = open((const char *)[v14 fileSystemRepresentation], 2562, 420);
  if (v15 == -1)
  {
    uint64_t v21 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000398C8();
    }

    goto LABEL_16;
  }
  int v16 = v15;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000D978;
  v29[3] = &unk_10006CC18;
  id v17 = v10;
  BOOL v33 = a5;
  id v30 = v17;
  v31 = &v34;
  int v32 = v16;
  unsigned int v18 = +[SystemDiagnosticLogAgent _runBlock:v29 withTimeout:a6];
  char v19 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Tailspin save task ending", (uint8_t *)&buf, 2u);
  }

  fsync(v16);
  if (v18)
  {
    if (*((unsigned char *)v35 + 24))
    {
      BOOL v20 = 1;
    }
    else
    {
      memset(&buf, 0, sizeof(buf));
      if (fstat(v16, &buf)) {
        BOOL v25 = 0;
      }
      else {
        BOOL v25 = buf.st_size == 0;
      }
      BOOL v20 = !v25;
      if (v25)
      {
        char v26 = [(SystemDiagnosticLogAgent *)self logHandle];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v27 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Removing empty tailspin-trace file", v27, 2u);
        }

        unlink((const char *)[v14 fileSystemRepresentation]);
      }
    }
  }
  else
  {
    BOOL v20 = 0;
  }
  close(v16);
  if ((v18 & 1) == 0)
  {
    __int16 v22 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Tailspin Save No Symbolicate SPI timed out", (uint8_t *)&buf, 2u);
    }
  }
  if (!*((unsigned char *)v35 + 24))
  {
    id v23 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Tailspin Save No Symbolicate SPI failed to create dest file", (uint8_t *)&buf, 2u);
    }
  }
  _Block_object_dispose(&v34, 8);
LABEL_27:

  return v20;
}

- (id)tailspinAugmentSpiWrapperForPath:(id)a3 withDestName:(id)a4 collectAriadne:(BOOL)a5 withTimeout:(double)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (!&_tailspin_augment_output)
  {
    id v12 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Tailspin augment SPI not found", buf, 2u);
    }
LABEL_12:

    id v28 = v10;
    goto LABEL_18;
  }
  id v10 = v10;
  if (sub_1000087FC((const char *)[v10 fileSystemRepresentation], 2) == -1)
  {
    int v27 = *__error();
    id v12 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 136315394;
      *(void *)&uint8_t buf[4] = [v10 fileSystemRepresentation];
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = strerror(v27);
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to open '%s' for augmenting with error: %s", buf, 0x16u);
    }
    goto LABEL_12;
  }
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  *(void *)stat buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v40 = 0;
  v38[0] = &__kCFBooleanTrue;
  v37[0] = UnsafePointer;
  v37[1] = UnsafePointer;
  id v14 = +[NSNumber numberWithBool:v7];
  v38[1] = v14;
  v38[2] = &__kCFBooleanTrue;
  v37[2] = UnsafePointer;
  v37[3] = UnsafePointer;
  v38[3] = &__kCFBooleanTrue;
  int v15 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];

  dispatch_queue_t v16 = dispatch_queue_create("com.apple.sysdiagnose.tailspin_augment_queue", 0);
  id v17 = v13;
  tailspin_augment_output();
  dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a6 * 1000000000.0));
  intptr_t v19 = dispatch_semaphore_wait(v17, v18);
  intptr_t v20 = v19;
  if (!*(unsigned char *)(*(void *)&buf[8] + 24) || v19)
  {
    char v26 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
      *(_DWORD *)int v32 = 67109376;
      *(_DWORD *)BOOL v33 = v20 != 0;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Tailspin augment task timed out (!%d) or failed (!%d)", v32, 0xEu);
    }
  }
  else
  {
    id v10 = v10;
    uint64_t v21 = (const std::__fs::filesystem::path *)[v10 fileSystemRepresentation];
    id v22 = v11;
    id v23 = (const std::__fs::filesystem::path *)[v22 fileSystemRepresentation];
    rename(v21, v23, v24);
    if (v25 == -1)
    {
      int v30 = *__error();
      char v26 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v10 = v10;
        *(_DWORD *)int v32 = 136315650;
        *(void *)BOOL v33 = [v10 fileSystemRepresentation];
        *(_WORD *)&v33[8] = 2080;
        id v34 = [v22 fileSystemRepresentation];
        __int16 v35 = 2080;
        uint64_t v36 = strerror(v30);
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to rename %s -> %s: %s", v32, 0x20u);
      }
    }
    else
    {
      char v26 = v10;
      id v10 = v22;
    }
  }

  id v28 = v10;
  _Block_object_dispose(buf, 8);

LABEL_18:

  return v28;
}

- (BOOL)tailspinSaveNoSymbolicateTSTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = [a3 stringByAppendingPathComponent:@"tailspin-trace.tailspin"];
  LOBYTE(self) = [(SystemDiagnosticLogAgent *)self tailspinSaveSpiWrapperForReason:@"sysdiagnose" forPath:v6 collectAriadne:1 withTimeout:a4];

  return (char)self;
}

- (id)tailspinAugmentTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  BOOL v7 = [v6 stringByAppendingPathComponent:@"tailspin-trace-unsymbolicated.tailspin"];
  BOOL v8 = [v6 stringByAppendingPathComponent:@"tailspin-trace.tailspin"];

  BOOL v9 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Tailspin augment task starting", buf, 2u);
  }

  id v10 = [(SystemDiagnosticLogAgent *)self tailspinAugmentSpiWrapperForPath:v7 withDestName:v8 collectAriadne:1 withTimeout:a4];
  id v11 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_semaphore_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Tailspin save task ending", v13, 2u);
  }

  return v10;
}

- (id)tailspinKeychordTaskWithDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  sub_100008168(v12, 0x400uLL, "tailspin", "no-symbols", "tailspin");
  BOOL v7 = +[NSString stringWithUTF8String:v12];
  BOOL v8 = [v6 stringByAppendingPathComponent:v7];

  if (v8)
  {
    if (![(SystemDiagnosticLogAgent *)self tailspinSaveSpiWrapperForReason:@"tailspin keychord" forPath:v8 collectAriadne:0 withTimeout:a4])goto LABEL_8; {
    BOOL v9 = [v8 stringByReplacingOccurrencesOfString:@"-no-symbols" withString:&stru_10006DD30];
    }
    uint64_t v10 = [(SystemDiagnosticLogAgent *)self tailspinAugmentSpiWrapperForPath:v8 withDestName:v9 collectAriadne:0 withTimeout:a4];

    BOOL v8 = (void *)v10;
  }
  else
  {
    BOOL v9 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100039950();
    }
    BOOL v8 = 0;
  }

LABEL_8:

  return v8;
}

- (BOOL)ASPMagazineTaskForDir:(id)a3 withTimeout:(double)a4
{
  id v6 = [a3 stringByAppendingPathComponent:@"asptool_magazine_stats.log"];
  LOBYTE(self) = [(SystemDiagnosticLogAgent *)self ASPToolGenericWithTimeout:v6 forFile:&stru_10006CC60 andBlock:a4];

  return (char)self;
}

- (BOOL)_libNotifyTaskAtLocation:(id)a3 andTimeout:(double)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E488;
  v8[3] = &unk_10006CA20;
  id v9 = a3;
  id v5 = v9;
  BOOL v6 = +[SystemDiagnosticLogAgent _runBlock:v8 withTimeout:a4];

  return v6;
}

- (BOOL)setUserMode
{
  int64_t v3 = getpwnam((const char *)[@"mobile" UTF8String]);
  if (v3)
  {
    id v4 = v3;
    uid_t pw_uid = v3->pw_uid;
    if (!pw_uid)
    {
      id v9 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100039A58();
      }
      goto LABEL_11;
    }
    gid_t pw_gid = v4->pw_gid;
  }
  else
  {
    gid_t pw_gid = 501;
    uid_t pw_uid = 501;
  }
  if (pthread_setugid_np(pw_uid, pw_gid) != -1) {
    return 1;
  }
  int v8 = *__error();
  id v9 = [(SystemDiagnosticLogAgent *)self logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000399DC(v8);
  }
LABEL_11:

  return 0;
}

- (BOOL)setRootMode
{
  uid_t v3 = getuid();
  gid_t v4 = v3 | getgid();
  BOOL v5 = v4 != 0;
  if (v4)
  {
    if (pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B) == -1) {
      sub_100039A8C(&v8, v9);
    }
  }
  else
  {
    BOOL v6 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100039B50();
    }
  }
  return v5;
}

- (id)getPreferencesForDomain:(id)a3 withKeys:(id)a4 currentUser:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = (__CFString *)a3;
  CFArrayRef v9 = (const __CFArray *)a4;
  if (v5)
  {
    uint64_t v10 = @"mobile";
    getpwnam((const char *)[@"mobile" UTF8String]);
  }
  else
  {
    uint64_t v10 = (id)kCFPreferencesCurrentUser;
  }
  if (v8) {
    CFStringRef v11 = v8;
  }
  else {
    CFStringRef v11 = kCFPreferencesAnyApplication;
  }
  CFDictionaryRef v12 = CFPreferencesCopyMultiple(v9, v11, v10, kCFPreferencesAnyHost);
  CFTypeID v13 = CFGetTypeID(v12);
  if (v13 == CFDictionaryGetTypeID())
  {
    id v14 = +[NSDictionary dictionaryWithDictionary:v12];
  }
  else
  {
    int v15 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      dispatch_time_t v18 = v8;
      __int16 v19 = 2112;
      CFArrayRef v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to get preferences: Domain: %@, keys: %@.", (uint8_t *)&v17, 0x16u);
    }

    id v14 = &__NSDictionary0__struct;
  }
  CFRelease(v12);

  return v14;
}

- (id)getPreferencesForDomain:(id)a3 withKey:(id)a4 andNestedKeys:(id)a5 currentUser:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v27 = a4;
  id v11 = a4;
  id v12 = a3;
  CFTypeID v13 = +[NSArray arrayWithObjects:&v27 count:1];
  id v14 = [(SystemDiagnosticLogAgent *)self getPreferencesForDomain:v12 withKeys:v13 currentUser:v6];

  int v15 = +[NSMutableDictionary dictionary];
  dispatch_queue_t v16 = [v14 objectForKeyedSubscript:v11];
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  id v23 = sub_10000E9A0;
  id v24 = &unk_10006CC88;
  id v25 = v10;
  id v26 = v15;
  id v17 = v15;
  id v18 = v10;
  [v16 enumerateKeysAndObjectsUsingBlock:&v21];

  id v19 = [v17 copy:v21, v22, v23, v24];

  return v19;
}

- (void)writePreferenceInDomain:(id)a3 withKey:(id)a4 toDirectory:(id)a5 currentUser:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    id v22 = v11;
    CFTypeID v13 = +[NSArray arrayWithObjects:&v22 count:1];
    id v14 = v11;
  }
  else
  {
    CFTypeID v13 = 0;
    id v14 = v10;
  }
  int v15 = [(SystemDiagnosticLogAgent *)self getPreferencesForDomain:v10 withKeys:v13 currentUser:v6];
  if (v6) {
    CFStringRef v16 = @"_CurrentUser.txt";
  }
  else {
    CFStringRef v16 = @"_Global.txt";
  }
  id v17 = [v14 stringByAppendingString:v16];
  id v18 = [v15 description];
  unsigned __int8 v19 = sub_1000084F0(v12, (uint64_t)v17, v18);

  if ((v19 & 1) == 0)
  {
    CFArrayRef v20 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unable to create file to write preferences", v21, 2u);
    }
  }
}

- (BOOL)getPreferences:(id)a3 withTimeout:(double)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000ECB8;
  v11[3] = &unk_10006CAE8;
  void v11[4] = self;
  id v12 = a3;
  id v6 = v12;
  BOOL v7 = +[SystemDiagnosticLogAgent _runBlock:v11 withTimeout:a4];
  if (!v7)
  {
    uint64_t v8 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preferences did not return in time.", v10, 2u);
    }
  }
  return v7;
}

- (BOOL)osEligibilityDumpToDir:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (&_os_eligibility_dump_sysdiagnose_data_to_dir)
  {
    *(void *)stat buf = 0;
    id v18 = buf;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000EFF4;
    v13[3] = &unk_10006CCB0;
    id v14 = v6;
    int v15 = self;
    CFStringRef v16 = buf;
    if (+[SystemDiagnosticLogAgent _runBlock:v13 withTimeout:a4])
    {
      BOOL v9 = v18[24] != 0;
    }
    else
    {
      id v10 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "os eligibility task timed out", v12, 2u);
      }

      BOOL v9 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v8 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "os eligibility SPI not found", buf, 2u);
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)getPreferencesInternal:(id)a3 withTimeout:(double)a4
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F178;
  v11[3] = &unk_10006CAE8;
  void v11[4] = self;
  id v12 = a3;
  id v6 = v12;
  BOOL v7 = +[SystemDiagnosticLogAgent _runBlock:v11 withTimeout:a4];
  if (!v7)
  {
    uint64_t v8 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preferences did not return in time.", v10, 2u);
    }
  }
  return v7;
}

- (BOOL)getCloudKitPreferences:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  uint64_t v28 = 0;
  int v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_100008E48;
  int v32 = sub_100008E58;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100008E48;
  id v26 = sub_100008E58;
  id v27 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000F434;
  v16[3] = &unk_10006CCD8;
  v16[4] = self;
  id v17 = @"com.apple.CloudKit";
  id v18 = @"BehaviorOptions";
  uint64_t v19 = &off_10006EA68;
  char v20 = &v28;
  uint64_t v21 = &v22;
  if (!+[SystemDiagnosticLogAgent _runBlock:v16 withTimeout:a4])
  {
    id v12 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v15 = 0;
      CFTypeID v13 = "Couldn't retrieve the preferences within the required time";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v15, 2u);
    }
LABEL_9:

    BOOL v11 = 0;
    goto LABEL_10;
  }
  BOOL v7 = [(id)v29[5] description];
  unsigned __int8 v8 = sub_1000084F0(v6, @"CloudKit_SelectBehaviorOptions_Global.txt", v7);

  BOOL v9 = [(id)v23[5] description];
  char v10 = v8 & sub_1000084F0(v6, @"CloudKit_SelectBehaviorOptions_CurrentUser.txt", v9);

  if ((v10 & 1) == 0)
  {
    id v12 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v15 = 0;
      CFTypeID v13 = "Couldn't write CloudKit preferences";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  BOOL v11 = 1;
LABEL_10:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v11;
}

+ (BOOL)_runDispatchBlock:(id)a3 withTimeout:(double)a4 onQueue:(id)a5
{
  id v7 = a3;
  dispatch_async((dispatch_queue_t)a5, v7);
  if (a4 == -1.0)
  {
    dispatch_time_t v8 = -1;
LABEL_5:
    BOOL v9 = dispatch_block_wait(v7, v8) == 0;
    goto LABEL_6;
  }
  if (a4 > 0.0)
  {
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    goto LABEL_5;
  }
  BOOL v9 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown value for timeout specified. Returning", v11, 2u);
    BOOL v9 = 0;
  }
LABEL_6:

  return v9;
}

+ (BOOL)_runBlock:(id)a3 withTimeout:(double)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F67C;
  block[3] = &unk_10006CD00;
  id v11 = a3;
  id v6 = v11;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_time_t v8 = dispatch_get_global_queue(0, 0);
  LOBYTE(a1) = [a1 _runDispatchBlock:v7 withTimeout:v8 onQueue:a4];

  return (char)a1;
}

- (BOOL)_runBlockForCurrentUser:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.sysdiagnose_helper.userModeQueue", 0);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  CFTypeID v13 = sub_10000F778;
  id v14 = &unk_10006CD28;
  int v15 = self;
  id v16 = v6;
  id v8 = v6;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v11);
  LOBYTE(self) = [objc_opt_class() _runDispatchBlock:v9 withTimeout:v7 onQueue:a4];

  return (char)self;
}

+ (id)stringForReqType:(int)a3
{
  uid_t v3 = sub_100007958(a3);
  gid_t v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@" "];
  }
  else
  {
    BOOL v5 = @"<UNKNOWN>";
  }

  return v5;
}

- (BOOL)parseLogAgentRequest:(id)a3 outputPath:(id *)a4 timeout:(double *)a5 taskType:(int *)a6 startTimeClockNS:(int64_t *)a7
{
  id v12 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v12, "taskType");
  id v14 = +[SystemDiagnosticLogAgent stringForReqType:int64];
  double v15 = xpc_dictionary_get_double(v12, "taskTimeout");
  string = (void *)xpc_dictionary_get_string(v12, "taskOutputDir");
  if (string || xpc_dictionary_get_BOOL(v12, "taskNoOutputDir"))
  {
    int64_t v17 = xpc_dictionary_get_int64(v12, "startTimeClockNS");
    if (!v17)
    {
      id v23 = v14;
      id v18 = [(SystemDiagnosticLogAgent *)self logHandle];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sysdiagnose_agent: No sysdiagnoseStartTimeClockNS provided)", buf, 2u);
      }

      id v14 = v23;
    }
    uint64_t v19 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138412290;
      id v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "sysdiagnose_agent: Received message with task type: %@", buf, 0xCu);
    }

    if (string)
    {
      string = +[NSString stringWithUTF8String:string];
    }
    if (a4) {
      *a4 = string;
    }
    if (a5) {
      *a5 = v15;
    }
    if (a6) {
      *a6 = int64;
    }
    if (a7) {
      *a7 = v17;
    }
    BOOL v20 = 1;
  }
  else
  {
    uint64_t v22 = [(SystemDiagnosticLogAgent *)self logHandle];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138412546;
      id v25 = v14;
      __int16 v26 = 2080;
      id v27 = "taskNoOutputDir";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "sysdiagnose_agent: No output dir for task type %@, without %s being set", buf, 0x16u);
    }

    BOOL v20 = 0;
    string = 0;
  }

  return v20;
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end