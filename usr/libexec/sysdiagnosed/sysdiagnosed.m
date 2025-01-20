void sub_100007564(id a1)
{
  uint64_t vars8;

  qword_1000BD730 = objc_alloc_init(SystemDiagnosticBT);

  _objc_release_x1();
}

id sub_1000077BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) forceDeregisterBTSession];
}

void sub_1000078C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000078D8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) btSession];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void sub_100007BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100007BDC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) btSession];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 triggerExposureNotificationLogs];
  }
  else
  {
    id result = [v3 setWaitingToCaptureExposureNotificationLogs:1];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

id sub_100008024(uint64_t a1)
{
  return [*(id *)(a1 + 32) markExposureNotificationLogsDone:1];
}

void sub_100008500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100008518(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) btSession];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 triggerAirPodLogsIfConnected];
  }
  else
  {
    id result = [v3 setWaitingToCaptureAirPodLogs:1];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void sub_100008860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000887C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)CBUserController);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008930;
  v5[3] = &unk_10009D030;
  v5[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 appleAudioAccessoryLimitedLoggingWithCompletion:v5];
}

void sub_100008930(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  long long v6 = [*(id *)(a1 + 32) accessoryLogSubsystem];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = [v5 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CBUserController returned error for limited logging check, assuming not enabled: %@", buf, 0xCu);
    }
    v9 = +[SDResourceManager sharedResourceManager];
    [v9 stdoutWrite:@"Subsystem: %s; Category: %s; Log: "];
      "remoteSysdiagnose",
      "AccessoryLogSubsystem");

    v10 = +[SDResourceManager sharedResourceManager];
    v11 = [v5 localizedDescription];
    [v10 stdoutWrite:@"CBUserController returned error for limited logging check, assuming not enabled: %@", v11];

    v12 = +[SDResourceManager sharedResourceManager];
    v13 = [v5 localizedDescription];
    [v12 logWithSubsystem:"remoteSysdiagnose", "AccessoryLogSubsystem", @"CBUserController returned error for limited logging check, assuming not enabled: %@", v13 category msg];
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CBUserController returned limited logging value: %d", buf, 8u);
    }

    v14 = +[SDResourceManager sharedResourceManager];
    [v14 stdoutWrite:@"Subsystem: %s; Category: %s; Log: "];
      "remoteSysdiagnose",
      "AccessoryLogSubsystem");

    v15 = +[SDResourceManager sharedResourceManager];
    [v15 stdoutWrite:@"CBUserController returned limited logging value: %d", a2];

    v16 = +[SDResourceManager sharedResourceManager];
    [v16 logWithSubsystem:@"remoteSysdiagnose" category:@"AccessoryLogSubsystem" msg:@"CBUserController returned limited logging value: %d", a2];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_100009488(uint64_t a1)
{
  return [*(id *)(a1 + 32) markAirpodLogsDone:1];
}

id sub_100009818(uint64_t a1)
{
  return [*(id *)(a1 + 32) attachToBTSession];
}

void sub_10000A14C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = +[SystemDiagnosticBT sharedInstance];
  [v6 sessionEvent:a1 event:a2 result:a3];
}

void sub_10000A1BC(id a1)
{
  if (&_BTAccessoryManagerDeregisterCustomMessageClient) {
    BOOL v1 = &_BTSessionDetachWithQueue == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1
    && &_BTSessionAttachWithQueue != 0
    && &_BTLocalDeviceDumpExposureNotificationDatabase != 0
    && &_BTAccessoryManagerRegisterCustomMessageClient != 0
    && &_BTLocalDeviceGetDefault != 0
    && &_BTAccessoryManagerGetDefault != 0)
  {
    byte_1000BD740 = 1;
  }
}

void sub_10000A224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = +[SystemDiagnosticBT sharedInstance];
  [v7 logCompletionHandler:a4 size:a5];
}

void sub_10000A284(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000A2AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

BOOL sub_10000A440(id a1, NSURL *a2, NSError *a3)
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    long long v4 = [(NSError *)v3 localizedDescription];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@\n", buf, 0xCu);
  }
  id v5 = +[SDResourceManager sharedResourceManager];
  id v6 = [(NSError *)v3 localizedDescription];
  [v5 log:@"%@\n", v6];

  return 1;
}

BOOL sub_10000C8C8(id a1, NSURL *a2, NSError *a3)
{
  id v3 = a3;
  long long v4 = sub_10002820C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(NSError *)v3 localizedDescription];
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Error expanding user home directories: %@\n", buf, 0xCu);
  }
  id v6 = +[SDResourceManager sharedResourceManager];
  id v7 = [(NSError *)v3 localizedDescription];
  [v6 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Error expanding user home directories: %@\n", v7 category msg];

  return 1;
}

int sub_10000DD7C(id a1, const char *a2, int a3)
{
  uint64_t v3 = *(void *)&a3;
  id v5 = sub_10002820C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v9 = v3;
    __int16 v10 = 2080;
    v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Glob Error (%d) %s ", buf, 0x12u);
  }

  id v6 = +[SDResourceManager sharedResourceManager];
  [v6 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:@"Glob Error (%d) %s ", v3, a2];

  return v3;
}

void sub_10000ED1C(id a1)
{
  BOOL v1 = objc_alloc_init(SDResourceManager);
  id v2 = (void *)qword_1000BD750;
  qword_1000BD750 = (uint64_t)v1;

  if (qword_1000BD750)
  {
    uint64_t v3 = sub_1000484D4();
    long long v4 = (void *)qword_1000BD750;
    [v4 setIsDaemon:v3];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create SDResourceManager singleton.", v5, 2u);
  }
}

void sub_10000EF90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F024(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F27C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F5F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F6B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F708(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F850(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F928(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000FAF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000FB80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000FCA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000FECC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001009C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010298(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000104E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010614(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010A30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010CF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010E60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010F8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000110A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011210(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000112C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000115CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001170C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011814(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000118D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011B18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011C50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011E48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011EF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSArray *__cdecl sub_100013458(id a1, NSDate *a2)
{
  id v2 = a2;
  uint64_t v3 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/root/Library/Caches/hangtracerd/spool/*.tailspin*" withDate:v2 withFilter:0 newestFileCount:0 atInternalDirectory:@"spool" withRuntimeChecks:0];
  v7[0] = v3;
  long long v4 = +[SDUnitLogGlob logRuleWithGlob:@"/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/HangTracer/*.tailspin*" withDate:v2 withFilter:0 newestFileCount:0 atInternalDirectory:@"HangTracer" withRuntimeChecks:0];

  v7[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v7 count:2];

  return (NSArray *)v5;
}

void sub_100016BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016BEC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100016BFC(uint64_t a1)
{
}

char *sub_100016C04(uint64_t a1, uint64_t a2, unint64_t a3)
{
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:*(void *)(a1 + 32), a2];
  id result = (char *)[*(id *)(a1 + 40) count];
  if ((unint64_t)(result - 1) > a3)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    return (char *)[v6 appendString:@" AND "];
  }
  return result;
}

void sub_100016DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

char *sub_100016DF4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:*(void *)(a1 + 32), a2];
  id result = (char *)[*(id *)(a1 + 40) count];
  if ((unint64_t)(result - 1) > a3)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    return (char *)[v6 appendString:@" OR "];
  }
  return result;
}

void sub_1000171CC(id a1)
{
  qword_1000BD760 = objc_alloc_init(CSCoordinator);

  _objc_release_x1();
}

void sub_100017494(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001760C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017750(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000178A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017A00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017B6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017CC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017E24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017EFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017FBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000183FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100018814(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000188C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100019060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100019090(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [*(id *)(a1 + 32) getProxiesForDiagnosticID:*(void *)(a1 + 40)];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
        {
          id v7 = +[CSCoordinator sharedInstance];
          v8 = [v7 logSubsystem];

          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)int v9 = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Timed out waiting on proxies. Skipping remaining", v9, 2u);
          }

          goto LABEL_13;
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) waitToReceiveCoSysdiagnose];
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

void sub_1000197BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000197D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_10001AF2C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Collecting ExposureNotification DB", buf, 2u);
  }
  id v2 = +[SDResourceManager sharedResourceManager];
  [v2 stdoutWrite:@"Collecting ExposureNotification DB"];

  id v3 = +[SDResourceManager sharedResourceManager];
  [v3 log:@"Collecting ExposureNotification DB"];

  id v4 = +[SystemDiagnosticBT sharedInstance];
  uint64_t v5 = [*(id *)(a1 + 32) diagnosticID];
  [v4 startBTSessionAndTriggerExposureNotificationLogs:v5];

  id v6 = [v4 waitForExposureNotificationLogsIfAvailable:5000000000];
  if (v6)
  {
    id v7 = +[NSMutableArray array];
    v8 = +[NSFileManager defaultManager];
    NSURLResourceKey v25 = NSURLNameKey;
    uint64_t v9 = +[NSArray arrayWithObjects:&v25 count:1];
    long long v10 = [v8 enumeratorAtURL:v6 includingPropertiesForKeys:v9 options:0 errorHandler:&stru_10009D268];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v19 + 1) + 8 * i) path:v19];
          [v7 addObject:v16];
        }
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }

    if ([v7 count]) {
      id v17 = v7;
    }
    else {
      id v17 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Did not get any URL to collect from ExposureNotification API", buf, 2u);
    }
    id v7 = +[SDResourceManager sharedResourceManager];
    [v7 log:@"Did not get any URL to collect from ExposureNotification API"];
    id v17 = 0;
  }

  return v17;
}

BOOL sub_10001B23C(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NSError *)v5 localizedDescription];
    *(_DWORD *)buf = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ExposureNotification enumeration error for URL %@ : %@", buf, 0x16u);
  }
  id v7 = +[SDResourceManager sharedResourceManager];
  v8 = [(NSError *)v5 localizedDescription];
  [v7 log:@"ExposureNotification enumeration error for URL %@ : %@", v4, v8];

  return 1;
}

void sub_10001B514(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) outputDirectory];
  v48[0] = v2;
  id v3 = [*(id *)(a1 + 40) destination];
  v48[1] = v3;
  id v4 = [*(id *)(a1 + 40) stdoutPath];
  v48[2] = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:v48 count:3];
  id v6 = +[NSString pathWithComponents:v5];

  if ([*(id *)(a1 + 40) terminationStatus])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [*(id *)(a1 + 40) terminationStatus];
      *(_DWORD *)buf = 67109120;
      LODWORD(v45) = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Baseband: exited with termination status %d", buf, 8u);
    }
    v8 = +[SDResourceManager sharedResourceManager];
    [v8 log:@"Baseband: exited with termination status %d" , [*(id *)(a1 + 40) terminationStatus]];
  }
  else
  {
    v8 = +[NSFileManager defaultManager];
    if ([v8 fileExistsAtPath:v6]
      && ([v8 isReadableFileAtPath:v6] & 1) != 0)
    {
      id v40 = 0;
      uint64_t v41 = 0;
      uint64_t v9 = +[NSString stringWithContentsOfFile:v6 usedEncoding:&v41 error:&v40];
      id v10 = v40;
      if (v9)
      {
        id v11 = [v9 componentsSeparatedByString:@"\n"];
        __int16 v12 = v11;
        if (v11)
        {
          if ((unint64_t)[v11 count] >= 3)
          {
            id v13 = [v12 objectAtIndexedSubscript:1];
            id v14 = [v13 rangeOfString:@"Path ="];

            if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v15 = [v12 objectAtIndexedSubscript:1];
              v16 = [v12 objectAtIndexedSubscript:1];
              id v17 = [v15 substringFromIndex:((char *)[v16 rangeOfString:@"="] + 1)];

              v18 = [v17 stringByRemovingWhitespace];

              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                if ([v18 isAbsolutePath]) {
                  long long v19 = "YES";
                }
                else {
                  long long v19 = "NO";
                }
                *(_DWORD *)buf = 138412546;
                v45 = v18;
                __int16 v46 = 2080;
                v47 = v19;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Baseband: File found at location %@? %s", buf, 0x16u);
              }
              long long v20 = +[SDResourceManager sharedResourceManager];
              unsigned int v21 = [v18 isAbsolutePath];
              long long v22 = "YES";
              if (!v21) {
                long long v22 = "NO";
              }
              [v20 log:@"Baseband: File found at location %@? %s", v18, v22];

              if (v18)
              {
                v37 = [v18 stringByAppendingPathComponent:@"index.plist"];
                v43[0] = v37;
                v35 = [v18 stringByAppendingPathComponent:@"info.csv"];
                v43[1] = v35;
                v23 = [v18 stringByAppendingPathComponent:@"info.txt"];
                v43[2] = v23;
                v24 = [v18 stringByAppendingPathComponent:@"Default.dmc"];
                v43[3] = v24;
                v39 = +[NSArray arrayWithObjects:v43 count:4];

                NSURLResourceKey v25 = [*(id *)(a1 + 40) destination];
                v26 = [v18 lastPathComponent];
                [v25 stringByAppendingPathComponent:v26];
                uint64_t v27 = v36 = v18;

                v38 = (void *)v27;
                uint64_t v28 = v27;
                v18 = v36;
                v29 = +[SDLogCollectionContainer containerWithName:@"basebandMeta collection" destination:v28 withDelegate:*(void *)(a1 + 32)];
                v30 = v29;
                if (v29)
                {
                  [v29 setRuntimeChecks:0];
                  [v30 setMaximumSizeMB:128];
                  v34 = +[SDUnitLogPathArray logRuleWithPaths:v39];
                  v42[0] = v34;
                  v31 = +[SDUnitLogDirectory logRuleWithDirectory:v36];
                  v42[1] = v31;
                  v32 = +[NSArray arrayWithObjects:v42 count:2];
                  [v30 addRules:v32];

                  [v30 execute];
                }
              }
            }
          }
        }
      }
      else
      {
        __int16 v12 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Baseband: File %@ was not generated or unreadable", buf, 0xCu);
      }
      v33 = +[SDResourceManager sharedResourceManager];
      [v33 log:@"Baseband: File %@ was not generated or unreadable", v6];
    }
  }
}

NSMutableArray *__cdecl sub_10001BC20(id a1)
{
  CFPropertyListRef v1 = CFPreferencesCopyAppValue(@"StateDumpFrequency", @"com.apple.soundautoconfig");
  CFPreferencesSetAppValue(@"StateDumpFrequency", @"1", @"com.apple.soundautoconfig");
  sleep(3u);
  if (v1)
  {
    CFPreferencesSetAppValue(@"StateDumpFrequency", v1, @"com.apple.soundautoconfig");
    CFRelease(v1);
  }
  else
  {
    CFPreferencesSetAppValue(@"StateDumpFrequency", 0, @"com.apple.soundautoconfig");
  }
  return 0;
}

void sub_100020C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100020C40(uint64_t a1, xpc_object_t xdict)
{
  id v3 = xpc_dictionary_get_value(xdict, "replyDictionary");
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062544(v3);
    }
    id v4 = +[SDResourceManager sharedResourceManager];
    [v4 log:@"CoreCaptureConfig unxpected reply. Expected XPC_TYPE_DICTIONARY. Received %@", xpc_get_type(v3), v9];
LABEL_9:

    goto LABEL_10;
  }
  if (xpc_dictionary_get_BOOL(v3, "wiFiVelocityMegaProfile"))
  {
    uint64_t v5 = [*(id *)(a1 + 32) taskContainer];
    [v5 setTimeout:36.0];

    id v6 = [*(id *)(a1 + 32) collectionContainer];
    [v6 setMaximumSizeMB:100];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134218240;
      uint64_t v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received WiFiVelocity MegaProfile Enabled. New timeout: %.2f seconds and max size: %luMB", buf, 0x16u);
    }
    id v4 = +[SDResourceManager sharedResourceManager];
    [v4 log:@"Received WiFiVelocity MegaProfile Enabled. New timeout: %.2f seconds and max size: %luMB", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    goto LABEL_9;
  }
LABEL_10:
  [*(id *)(a1 + 32) executeFromCallback];
}

void sub_1000225C0(id a1)
{
  CFPropertyListRef v1 = (void *)qword_1000BD770;
  qword_1000BD770 = (uint64_t)&off_1000B0E78;
}

id sub_100022854()
{
  if (qword_1000BD780 != -1) {
    dispatch_once(&qword_1000BD780, &stru_10009D380);
  }
  v0 = (void *)qword_1000BD788;

  return v0;
}

BOOL sub_1000228A8(id a1, NSURL *a2, NSError *a3)
{
  id v3 = a3;
  id v4 = sub_100022854();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000625C8(v3, v4);
  }

  return 1;
}

void sub_100023080(id a1)
{
  qword_1000BD788 = (uint64_t)os_log_create("com.apple.sysdiagnose.CacheDelete", "enumerator");

  _objc_release_x1();
}

void sub_100023108(id a1)
{
  if (sub_100048C0C()) {
    char v1 = 1;
  }
  else {
    char v1 = sub_100048BA0();
  }
  byte_1000BD790 = v1;
}

void sub_1000233EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100023424(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = +[CSCoordinator sharedInstance];
  uint64_t v7 = [v6 logSubsystem];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: Found device %@", (uint8_t *)&v11, 0xCu);
  }

  if (a3)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else if (v5)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v8 = +[CSRemoteXPCProxy getService:"com.apple.sysdiagnose.remote" forDevice:v5];

    if (v8)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    uint64_t v9 = +[CSCoordinator sharedInstance];
    uint64_t v10 = [v9 logSubsystem];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000626E8(v10);
    }
  }
}

void sub_100023724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100023748(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void sub_1000239AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000239D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000239E4(uint64_t a1)
{
}

void sub_1000239EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CSRemoteXPCProxy getUUIDStrForRemoteDevice:v3];
  id v5 = +[CSCoordinator sharedInstance];
  id v6 = [v5 getRemoteUUIDsForDiagnosticID:*(void *)(a1 + 32)];

  if ([v6 containsObject:v4])
  {
    uint64_t v7 = +[CSCoordinator sharedInstance];
    uint64_t v8 = [v7 logSubsystem];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      int v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: Found valid display with uuid %@, but already manually requested from client - skipping", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v9 = [(CSRemoteXPCProxy *)[CSDisplayProxy alloc] _initWithDevice:v3 forDiagnosticID:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];
  }
}

void start()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v1) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Launching daemon not from DDCSI", (uint8_t *)&v1, 2u);
  }
  if (sub_1000484D4())
  {
    if (setiopolicy_np(0, 0, 2)) {
      _os_assumes_log();
    }
    sub_100023D0C();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315138;
    id v2 = "Error: sysdiagnosed should only be invoked by launchd";
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v1, 0xCu);
  }
  puts("Error: sysdiagnosed should only be invoked by launchd");
  exit(1);
}

void sub_100023D0C()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting server", buf, 2u);
  }
  v0 = +[SDResourceManager sharedResourceManager];
  [v0 stdoutWrite:@"Starting server"];

  int v1 = +[SDResourceManager sharedResourceManager];
  [v1 log:@"Starting server"];

  id v2 = dispatch_get_global_queue(0, 0);
  sub_1000293AC(v2, &stru_10009D438);

  sub_1000295A4();
  id v3 = +[CSCoordinator sharedInstance];
  [v3 initRemoteServers];

  if (sub_1000342D8())
  {
    uint64_t v10 = 0;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    *(_OWORD *)buf = 0u;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  else if (!sub_100037920())
  {
    id v4 = +[SystemDiagnosticIDS sharedInstance];
    [v4 sendMessage:0];

    +[SDCacheDeleter registerCallbacks];
    dispatch_main();
  }
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)buf = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100023F54(id a1)
{
  int v1 = +[SDResourceManager sharedResourceManager];
  unsigned int v2 = [v1 areDiagnosticsInFlight];

  if (v2)
  {
    sub_1000295A4();
  }
}

CFStringRef sub_100023FB0(unint64_t a1)
{
  if (a1 > 0xF) {
    return @"Unknown server error";
  }
  else {
    return off_10009D7D0[a1];
  }
}

BOOL sub_100023FD4()
{
  uid_t v0 = geteuid();
  int v1 = getpwnam("mobile");
  if (v1) {
    uid_t pw_uid = v1->pw_uid;
  }
  else {
    uid_t pw_uid = 501;
  }
  if (seteuid(pw_uid))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = __error();
      id v4 = strerror(*v3);
      int buf = 136315138;
      v39 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not drop to mobile with error: %s", (uint8_t *)&buf, 0xCu);
    }
    id v5 = +[SDResourceManager sharedResourceManager];
    long long v6 = __error();
    [v5 log:@"Could not drop to mobile with error: %s", strerror(*v6)];
LABEL_38:

    return 0;
  }
  uid_t v25 = v0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v27 = [&off_1000B13D0 countByEnumeratingWithState:&v34 objects:v43 count:16];
  BOOL v7 = 0;
  if (v27)
  {
    uint64_t v26 = *(void *)v35;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(&off_1000B13D0);
        }
        uint64_t v28 = v8;
        long long v9 = *(void **)(*((void *)&v34 + 1) + 8 * v8);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v10 = [&off_1000B13D0 objectForKeyedSubscript:v9];
        id v11 = [v10 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v31;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              BOOL v29 = 0;
              if (sub_1000487D8(v15, v9, &v29))
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  int buf = 138412546;
                  v39 = v9;
                  __int16 v40 = 2112;
                  uint64_t v41 = v15;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "A preference was found! Domain %@ with variable %@", (uint8_t *)&buf, 0x16u);
                }
                v16 = +[SDResourceManager sharedResourceManager];
                [v16 log:@"A preference was found! Domain %@ with variable %@", v9, v15];

                BOOL v7 = v29 || v7;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v30 objects:v42 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v28 + 1;
      }
      while ((id)(v28 + 1) != v27);
      id v27 = [&off_1000B13D0 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v27);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      id v17 = "YES";
    }
    else {
      id v17 = "NO";
    }
    int buf = 136315138;
    v39 = (void *)v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nShould run full idstool dump: %s\n\n", (uint8_t *)&buf, 0xCu);
  }
  v18 = +[SDResourceManager sharedResourceManager];
  long long v19 = v18;
  if (v7) {
    long long v20 = "YES";
  }
  else {
    long long v20 = "NO";
  }
  [v18 log:@"\nShould run full idstool dump: %s\n\n", v20];

  if (seteuid(v25))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v21 = __error();
      long long v22 = strerror(*v21);
      int buf = 136315138;
      v39 = v22;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not return to original euid with error: %s", (uint8_t *)&buf, 0xCu);
    }
    id v5 = +[SDResourceManager sharedResourceManager];
    v23 = __error();
    [v5 log:@"Could not return to original euid with error: %s", strerror(*v23)];
    goto LABEL_38;
  }
  return v7;
}

uint64_t sub_100024418()
{
  uid_t v0 = getpwnam("mobile");
  if (v0) {
    return v0->pw_uid;
  }
  else {
    return 501;
  }
}

void sub_100024448()
{
  CFDictionaryRef v0 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
  if (v0)
  {
    CFDictionaryRef v1 = v0;
    CFDictionaryGetValue(v0, _kCFSystemVersionProductNameKey);
    unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFDictionaryGetValue(v1, _kCFSystemVersionProductVersionKey);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = CFDictionaryGetValue(v1, _kCFSystemVersionBuildVersionKey);
    id v5 = (__CFString *)v4;
    if (v2) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v3 == 0;
    }
    if (!v6 || v4 != 0)
    {
      BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v2) {
        CFStringRef v9 = v2;
      }
      else {
        CFStringRef v9 = @"UNKNOWN";
      }
      if (v8)
      {
        if (v3) {
          CFStringRef v10 = v3;
        }
        else {
          CFStringRef v10 = @"UNKNOWN";
        }
        *(_DWORD *)int buf = 138412802;
        CFStringRef v17 = v9;
        __int16 v18 = 2112;
        CFStringRef v19 = v10;
        if (v5) {
          CFStringRef v11 = v5;
        }
        else {
          CFStringRef v11 = @"UNKNOWN";
        }
        __int16 v20 = 2112;
        CFStringRef v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ %@ (Build %@)", buf, 0x20u);
      }
      else
      {
        if (v3) {
          CFStringRef v10 = v3;
        }
        else {
          CFStringRef v10 = @"UNKNOWN";
        }
        if (v5) {
          CFStringRef v11 = v5;
        }
        else {
          CFStringRef v11 = @"UNKNOWN";
        }
      }
      id v12 = +[SDResourceManager sharedResourceManager];
      [v12 log:@"%@ %@ (Build %@)", v9, v10, v11];
    }
    CFRelease(v1);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (sub_100048604()) {
      CFStringRef v13 = @"Internal";
    }
    else {
      CFStringRef v13 = @"Customer";
    }
    *(_DWORD *)int buf = 138412290;
    CFStringRef v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose mode: %@", buf, 0xCu);
  }
  uint64_t v14 = +[SDResourceManager sharedResourceManager];
  if (sub_100048604()) {
    CFStringRef v15 = @"Internal";
  }
  else {
    CFStringRef v15 = @"Customer";
  }
  [v14 log:@"Sysdiagnose mode: %@", v15];
}

id sub_100024694()
{
  if (!objc_opt_class())
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2) {
      sub_10006272C(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v10) {
      sub_1000627F8(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    return 0;
  }
  id v19 = 0;
  id v0 = +[SDBetaManager canFileFeedbackOnThisDevice:&v19];
  id v1 = v19;
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062768(v1);
    }
    id v0 = 0;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 67109120;
    int v21 = (int)v0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Seed check: canFileFeedbackOnThisDevice: %d", buf, 8u);
  }

  return v0;
}

uint64_t sub_1000247E8()
{
  if (qword_1000BD7A8 != -1) {
    dispatch_once(&qword_1000BD7A8, &stru_10009D458);
  }
  return byte_1000BD7A0;
}

void sub_10002482C(id a1)
{
  byte_1000BD7A0 = os_variant_is_darwinos();
}

BOOL sub_100024854()
{
  if (qword_1000BD7A8 != -1) {
    dispatch_once(&qword_1000BD7A8, &stru_10009D458);
  }
  if (!byte_1000BD7A0) {
    return 0;
  }
  if (qword_1000BD7B8 != -1) {
    dispatch_once(&qword_1000BD7B8, &stru_10009D478);
  }
  return byte_1000BD7B0 != 0;
}

void sub_1000248DC(id a1)
{
  byte_1000BD7B0 = MGGetBoolAnswer();
}

uint64_t sub_100024904()
{
  if (qword_1000BD7C8 != -1) {
    dispatch_once(&qword_1000BD7C8, &stru_10009D498);
  }
  return byte_1000BD7C0;
}

void sub_100024948(id a1)
{
  byte_1000BD7C0 = os_variant_has_factory_content();
}

uint64_t sub_100024970()
{
  if (qword_1000BD7D8 != -1) {
    dispatch_once(&qword_1000BD7D8, &stru_10009D4B8);
  }
  return byte_1000BD7D0;
}

void sub_1000249B4(id a1)
{
  id v1 = (const void *)MGCopyAnswer();
  if (v1)
  {
    BOOL v2 = v1;
    byte_1000BD7D0 = CFEqual(v1, @"Desense") != 0;
    CFRelease(v2);
  }
}

uint64_t sub_100024A24()
{
  if (qword_1000BD7E8 != -1) {
    dispatch_once(&qword_1000BD7E8, &stru_10009D4D8);
  }
  return byte_1000BD7E0;
}

void sub_100024A68(id a1)
{
  byte_1000BD7E0 = MGGetSInt32Answer() == 7;
}

id sub_100024A9C()
{
  if (qword_1000BD7F8 != -1) {
    dispatch_once(&qword_1000BD7F8, &stru_10009D4F8);
  }
  id v0 = (void *)qword_1000BD7F0;

  return v0;
}

void sub_100024AF0(id a1)
{
  id v1 = (void *)MGCopyAnswer();
  if (v1)
  {
    objc_storeStrong((id *)&qword_1000BD7F0, v1);
  }
}

void sub_100024B3C()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Screen flash requested", v2, 2u);
  }
  id v0 = +[SDResourceManager sharedResourceManager];
  [v0 log:@"Screen flash requested"];

  id v1 = dispatch_get_global_queue(25, 0);
  dispatch_async(v1, &stru_10009D518);
}

CFStringRef sub_100024BEC(int a1)
{
  if (a1 > 11)
  {
    switch(a1)
    {
      case '0':
        return @"PlayPause + Volume Down";
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
        return @"?";
      case '6':
        return @"Cmd-Opt-Ctrl-Shift-Comma";
      case '7':
        return @"Cmd-Opt-Ctrl-Shift-Period";
      case '8':
        return @"Cmd-Opt-Ctrl-Shift-Slash";
      default:
        if (a1 == 12)
        {
          CFStringRef result = @"Crown + Pill";
        }
        else
        {
          if (a1 != 36) {
            return @"?";
          }
          CFStringRef result = @"Legacy: Menu + Volume Down";
        }
        break;
    }
  }
  else
  {
    if (a1 <= -2147483637)
    {
      if (a1 == 0x80000000) {
        return @"Full Diagnostic from Driver";
      }
      if (a1 == -2147483641) {
        return @"Power + Volume Up + Volume Down";
      }
    }
    else
    {
      switch(a1)
      {
        case -2147483636:
          return @"Hold Crown + Pill";
        case 3:
          return @"Power + Volume Up";
        case 6:
          return @"Legacy: Menu + Volume Up";
      }
    }
    return @"?";
  }
  return result;
}

CFStringRef sub_100024D2C(int a1)
{
  if ((a1 - 1) > 4) {
    return @"?";
  }
  else {
    return off_10009D850[(__int16)(a1 - 1)];
  }
}

CFStringRef sub_100024D58(unsigned int a1)
{
  if (a1 > 0xC) {
    return @"?";
  }
  else {
    return off_10009D878[(__int16)a1];
  }
}

CFStringRef sub_100024D80(unsigned int a1)
{
  if (a1 > 2) {
    return @"?";
  }
  else {
    return off_10009D8E0[(__int16)a1];
  }
}

id sub_100024DA8()
{
  id v0 = getpwnam("mobile");
  if (v0) {
    uint64_t pw_uid = v0->pw_uid;
  }
  else {
    uint64_t pw_uid = 501;
  }

  return sub_100024DE8(pw_uid);
}

id sub_100024DE8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 67109120;
    LODWORD(v12) = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Getting home dir for uid %d", buf, 8u);
  }
  BOOL v2 = +[SDResourceManager sharedResourceManager];
  [v2 log:@"Getting home dir for uid %d", a1];

  uint64_t v3 = getpwuid(a1);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = __error();
      uint64_t v8 = strerror(*v7);
      *(_DWORD *)int buf = 136315138;
      uint64_t v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "getpwuid failed, err: %s", buf, 0xCu);
    }
    uint64_t v5 = +[SDResourceManager sharedResourceManager];
    uint64_t v9 = __error();
    [v5 log:@"getpwuid failed, err: %s", strerror(*v9)];
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  uint64_t v4 = +[NSString stringWithUTF8String:v3->pw_dir];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_100056460(v4);
LABEL_9:

    goto LABEL_11;
  }
  uint64_t v6 = 0;
LABEL_11:

  return v6;
}

id sub_100024FA0()
{
  sub_100048214(v2, 0x400uLL, "sysdiagnose", 0, 0);
  id v0 = +[NSString stringWithUTF8String:v2];

  return v0;
}

void sub_100025030(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = fopen((const char *)[v4 fileSystemRepresentation], "wx");
  if (v5)
  {
    uint64_t v6 = v5;
    fputs((const char *)[v3 UTF8String], v5);
    fclose(v6);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "File %@ could not be created", buf, 0xCu);
    }
    uint64_t v7 = +[SDResourceManager sharedResourceManager];
    [v7 log:@"File %@ could not be created", v4];
  }
}

id sub_100025154(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (v3)
  {
    id v4 = +[NSFileManager defaultManager];
    uint64_t v5 = +[SDCacheEnumerator sysdiagnoseDirectory];
    uint64_t v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];
    uint64_t v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLNameKey, NSURLPathKey, NSURLCreationDateKey, 0);
    uint64_t v8 = [v4 enumeratorAtURL:v6 includingPropertiesForKeys:v7 options:7 errorHandler:&stru_10009D538];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v8;
    id v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v26 = v4;
      uint64_t v28 = *(void *)v31;
      NSURLResourceKey v11 = NSURLIsDirectoryKey;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v31 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v29 = 0;
          [v13 getResourceValue:&v29 forKey:v11 error:0];
          id v15 = v29;
          if ([v15 BOOLValue] == a2)
          {
            uint64_t v16 = [v13 path];
            id v17 = [v16 rangeOfString:v3];

            if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if (a2) {
                goto LABEL_16;
              }
              __int16 v18 = [v13 path];
              id v19 = [v18 lastPathComponent];
              uint64_t v20 = a2;
              id v21 = v3;
              id v22 = [v19 rangeOfString:@".tar"];

              BOOL v23 = v22 == (id)0x7FFFFFFFFFFFFFFFLL;
              id v3 = v21;
              a2 = v20;
              NSURLResourceKey v11 = NSURLIsDirectoryKey;
              if (!v23)
              {
LABEL_16:
                v24 = [v13 path];

                goto LABEL_17;
              }
            }
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      v24 = 0;
LABEL_17:
      id v4 = v26;
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

BOOL sub_100025454(id a1, NSURL *a2, NSError *a3)
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@\n", buf, 0xCu);
  }
  id v4 = +[SDResourceManager sharedResourceManager];
  [v4 log:@"%@\n", v3];

  return 1;
}

id sub_100025528(void *a1)
{
  id v1 = a1;
  BOOL v2 = +[NSMutableArray array];
  if (v1)
  {
    if (xpc_array_get_count(v1))
    {
      size_t v3 = 0;
      do
      {
        string = xpc_array_get_string(v1, v3);
        if (string)
        {
          uint64_t v5 = +[NSString stringWithUTF8String:string];
          [v2 addObject:v5];
        }
        ++v3;
      }
      while (xpc_array_get_count(v1) > v3);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not a valid xpc array", v8, 2u);
    }
    uint64_t v6 = +[SDResourceManager sharedResourceManager];
    [v6 log:@"Not a valid xpc array"];
  }

  return v2;
}

uint64_t sub_100025658(uint64_t a1)
{
  id v1 = sub_100025940(a1);
  if (v1)
  {
    for (uint64_t i = 0; i != 216; i += 8)
    {
      size_t v3 = *(__CFString **)((char *)&off_10009D558 + i);
      if (([(__CFString *)v3 containsString:v1] & 1) != 0
        || [v1 containsString:v3])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Matched approved path", buf, 2u);
        }
        id v6 = +[SDResourceManager sharedResourceManager];
        [v6 log:@"Matched approved path"];
LABEL_21:
        uint64_t v15 = 1;
        goto LABEL_22;
      }
    }
    if (!NSClassFromString(@"DEExtensionManager")) {
      goto LABEL_17;
    }
    id v4 = +[DEExtensionManager sharedInstance];
    [v4 loadExtensions];

    uint64_t v5 = +[DEExtensionManager sharedInstance];
    size_t v3 = [v5 extensionsWithFilter:0];

    [(__CFString *)v3 valueForKeyPath:@"identifier"];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        id v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          NSURLResourceKey v11 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v10);
          uint64_t v12 = [v1 lastPathComponent];
          if ([v11 containsString:v12])
          {

LABEL_25:
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)int buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Encountered diagnostic extension, approving request", buf, 2u);
            }
            id v17 = +[SDResourceManager sharedResourceManager];
            [v17 log:@"Encountered diagnostic extension, approving request"];

            goto LABEL_21;
          }
          uint64_t v13 = [v1 lastPathComponent];
          unsigned int v14 = [v13 containsString:v11];

          if (v14) {
            goto LABEL_25;
          }
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    uint64_t v15 = 0;
LABEL_22:
  }
  else
  {
LABEL_17:
    uint64_t v15 = 0;
  }

  return v15;
}

id sub_100025940(uint64_t a1)
{
  proc_pidpath(a1, buffer, 0x400u);
  BOOL v2 = +[NSString stringWithCString:buffer encoding:4];
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v6) = a1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get client proc path for pid %d", buf, 8u);
    }
    size_t v3 = +[SDResourceManager sharedResourceManager];
    [v3 log:@"Failed to get client proc path for pid %d", a1];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412546;
    id v6 = v2;
    __int16 v7 = 1024;
    int v8 = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got path %@ for pid %d", buf, 0x12u);
  }

  return v2;
}

id sub_100025AA8(uint64_t a1)
{
  id v1 = sub_100025940(a1);
  if (v1) {
    id v2 = [@"/AppleInternal/Library/Frameworks/TapToRadarDaemon.framework/Support/taptoradard" isEqualToString:v1];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

uint64_t sub_100025AF8(void *a1)
{
  id v1 = a1;
  [v1 fileSystemRepresentation];
  if ((dirstat_np() & 0x80000000) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = __error();
      size_t v3 = strerror(*v2);
      *(_DWORD *)int buf = 138412546;
      id v8 = v1;
      __int16 v9 = 2080;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Directory sizing for %@ failed with error %s", buf, 0x16u);
    }
    id v4 = +[SDResourceManager sharedResourceManager];
    uint64_t v5 = __error();
    [v4 log:@"Directory sizing for %@ failed with error %s", v1, strerror(*v5)];
  }
  return 0;
}

_xpc_connection_s *sub_100025C18(void *a1)
{
  id v1 = a1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Trying to create a sysdiagnose_helper connection", buf, 2u);
  }
  id v2 = +[SDResourceManager sharedResourceManager];
  [v2 log:@"Trying to create a sysdiagnose_helper connection"];

  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose_helper", 0, 2uLL);
  id v4 = mach_service;
  if (mach_service)
  {
    if (!v1) {
      id v1 = &stru_10009D650;
    }
    xpc_connection_set_event_handler(mach_service, v1);
    *(void *)int buf = 0;
    uint64_t v18 = 0;
    uuid_generate_random(buf);
    xpc_connection_set_oneshot_instance();
    xpc_connection_activate(v4);
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "taskType", 24);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sending HANDSHAKE to sysdiagnose_helper", v16, 2u);
    }
    id v6 = +[SDResourceManager sharedResourceManager];
    [v6 log:@"Sending HANDSHAKE to sysdiagnose_helper"];

    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v4, v5);
    id v8 = v7;
    if (v7)
    {
      if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary && xpc_dictionary_get_BOOL(v8, "result"))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose_helper connection success", v16, 2u);
        }
        __int16 v9 = +[SDResourceManager sharedResourceManager];
        [v9 log:@"sysdiagnose_helper connection success"];

        id v10 = v4;
        goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't connect to sysdiagnose_helper", v16, 2u);
      }
      uint64_t v12 = +[SDResourceManager sharedResourceManager];
      uint64_t v13 = v12;
      CFStringRef v14 = @"Couldn't connect to sysdiagnose_helper";
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose_helper returned empty for a HANDSHAKE", v16, 2u);
      }
      uint64_t v12 = +[SDResourceManager sharedResourceManager];
      uint64_t v13 = v12;
      CFStringRef v14 = @"sysdiagnose_helper returned empty for a HANDSHAKE";
    }
    [v12 log:v14];

    id v10 = 0;
LABEL_24:

    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No connection with sysdiagnose_helper", buf, 2u);
  }
  NSURLResourceKey v11 = +[SDResourceManager sharedResourceManager];
  [v11 log:@"No connection with sysdiagnose_helper"];

  id v10 = 0;
LABEL_25:

  return v10;
}

void sub_100025FBC(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = 5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Dumping stackshot with timeout of %ld seconds", (uint8_t *)&v4, 0xCu);
  }
  id v2 = +[SDCacheEnumerator sysdiagnoseDirectory];
  size_t v3 = +[SDLogAgentContainer containerAtLocation:v2 forTaskType:a1 withTimeout:0 withDelegate:0 withMsgContents:0 withReplyBlock:5.0];

  if (v3)
  {
    [v3 setName:@"standalone-stackshot"];
    [v3 setRuntimeChecks:0];
    [v3 setBlockUntilFinished:1];
    [v3 execute];
  }
}

void sub_1000260E8(void *a1)
{
  id v1 = a1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "tailspin key chord pressed", (uint8_t *)&buf, 2u);
  }
  id v2 = +[SDResourceManager sharedResourceManager];
  [v2 log:@"tailspin key chord pressed"];

  size_t v3 = +[SDResourceManager sharedResourceManager];
  unsigned __int8 v4 = [v3 setUpDiagnosticID:v1];

  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set up tailspinDiagnosticID with SDResourceManager.", (uint8_t *)&buf, 2u);
    }
    uint64_t v5 = +[SDResourceManager sharedResourceManager];
    [v5 log:@"Failed to set up tailspinDiagnosticID with SDResourceManager."];
  }
  CFPreferencesAddSuitePreferencesToApp(kCFPreferencesCurrentApplication, @"com.apple.tailspin");
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"TailspinKeychordTimeoutSeconds", kCFPreferencesCurrentApplication, 0);
  if (AppIntegerValue) {
    uint64_t v7 = AppIntegerValue;
  }
  else {
    uint64_t v7 = 40;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Dumping tailspin with timeout of %ld seconds", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1000264FC;
  uint64_t v18 = sub_10002650C;
  id v19 = 0;
  id v8 = +[SDCacheEnumerator sysdiagnoseDirectory];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100026514;
  v12[3] = &unk_10009D678;
  v12[4] = &buf;
  __int16 v9 = +[SDLogAgentContainer containerAtLocation:v8 forTaskType:47 withTimeout:0 withDelegate:0 withMsgContents:v12 withReplyBlock:(double)v7];

  if (v9)
  {
    [v9 setName:@"tailspin-keychord"];
    [v9 setBlockUntilFinished:1];
    [v9 setRuntimeChecks:0];
    [v9 execute];
  }
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)uint64_t v13 = 138412290;
      uint64_t v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Done dumping tailspin to path '%@'", v13, 0xCu);
    }
    NSURLResourceKey v11 = +[SDResourceManager sharedResourceManager];
    [v11 log:@"Done dumping tailspin to path '%@'", *(void *)(*((void *)&buf + 1) + 40)];
LABEL_22:

    goto LABEL_23;
  }
  unlink((const char *)[0 fileSystemRepresentation]);
  if (sub_100048604())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Tailspin keychord failed", v13, 2u);
    }
    NSURLResourceKey v11 = +[SDResourceManager sharedResourceManager];
    [v11 log:@"Tailspin keychord failed"];
    goto LABEL_22;
  }
LABEL_23:

  _Block_object_dispose(&buf, 8);
}

void sub_1000264DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000264FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002650C(uint64_t a1)
{
}

void sub_100026514(uint64_t a1, xpc_object_t xdict)
{
  size_t v3 = xpc_dictionary_get_value(xdict, "resultPaths");
  unsigned __int8 v4 = v3;
  if (v3)
  {
    uint64_t v5 = sub_100025528(v3);
    id v6 = [v5 count];
    if (v6 == (id)1)
    {
      uint64_t v7 = [v5 firstObject];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      __int16 v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    else
    {
      id v10 = v6;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134217984;
        id v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "tailspin keychord task returned wrong number of paths (%ld)", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

unint64_t sub_100026628(unint64_t a1)
{
  unint64_t v1 = a1;
  if (!a1) {
    unint64_t v1 = sub_100026744();
  }
  if (v1 <= 0xC7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 134218240;
      unint64_t v4 = v1;
      __int16 v5 = 2048;
      unint64_t v1 = 200;
      uint64_t v6 = 200;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Tailspin buffer size is %lu. Rounding up to minimum size cap of %lu", (uint8_t *)&v3, 0x16u);
    }
    else
    {
      unint64_t v1 = 200;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    unint64_t v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Tailspin save size cap requested. Returning %lu", (uint8_t *)&v3, 0xCu);
  }
  return v1;
}

uint64_t sub_100026744()
{
  uint64_t v24 = 0;
  uid_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  if (&_tailspin_config_free) {
    BOOL v0 = &_tailspin_buffer_size_get == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0 || &_tailspin_config_create_with_current_state == 0)
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2) {
      sub_100062834(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    uint64_t v10 = v25[3];
  }
  else
  {
    int v11 = dispatch_group_create();
    id v12 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028DC8;
    block[3] = &unk_10009D7B0;
    block[4] = &v24;
    dispatch_group_async(v11, v12, block);

    dispatch_time_t v13 = dispatch_time(0, 1000000000);
    if (dispatch_group_wait(v11, v13))
    {
      BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v14) {
        sub_100062870(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    uint64_t v10 = v25[3];
  }
  _Block_object_dispose(&v24, 8);
  return v10;
}

unint64_t sub_1000268A8(unint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  if (!a2)
  {
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4) {
      sub_1000628E8(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    unint64_t v2 = 1;
  }
  if (v2 <= a1)
  {
    unint64_t v12 = a1;
  }
  else
  {
    unint64_t v12 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218240;
      unint64_t v15 = a1;
      __int16 v16 = 2048;
      unint64_t v17 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got small tailspin buffer size of %lu. Rounding to minimum %lu", (uint8_t *)&v14, 0x16u);
      unint64_t v12 = v2;
    }
  }
  if (!(v12 % v2)) {
    return v12;
  }
  if (v2 + v2 * (v12 / v2) >= v12) {
    v2 += v2 * (v12 / v2);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218240;
    unint64_t v15 = v12;
    __int16 v16 = 2048;
    unint64_t v17 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got non-standard tailspin buffer size of %lu. Rounding up to %lu", (uint8_t *)&v14, 0x16u);
  }
  return v2;
}

unint64_t sub_100026A18(unint64_t a1)
{
  if (!a1) {
    a1 = sub_100026744();
  }
  return 10 * (sub_1000268A8(a1, 0x32uLL) / 0x32);
}

SDArchive *sub_100026A64(uint64_t a1, void *a2, void *a3, int a4, int a5)
{
  id v9 = a2;
  if (a5) {
    unsigned int v10 = 3;
  }
  else {
    unsigned int v10 = 1;
  }
  if (a5) {
    unsigned int v11 = 2;
  }
  else {
    unsigned int v11 = 0;
  }
  if (a4) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v11;
  }
  id v13 = a3;
  int v14 = [SDArchive alloc];
  if ((a1 & 0x80000000) != 0) {
    unint64_t v15 = [(SDArchive *)v14 initWithPath:v9 withOptions:v12 withName:v13];
  }
  else {
    unint64_t v15 = [(SDArchive *)v14 initWithFD:a1 withOptions:v12 withName:v13];
  }
  __int16 v16 = v15;

  return v16;
}

id sub_100026B44(int a1)
{
  if ((a1 & 0x80000000) == 0)
  {
    bzero(v6, 0x400uLL);
    if (fcntl(a1, 50, v6) != -1)
    {
      unint64_t v2 = +[NSString stringWithUTF8String:v6];
      goto LABEL_8;
    }
    int v3 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062924(v3);
    }
    BOOL v4 = +[SDResourceManager sharedResourceManager];
    [v4 log:@"Failed to get path from FD: %s", strerror(v3)];
  }
  unint64_t v2 = 0;
LABEL_8:

  return v2;
}

uint64_t sub_100026C54(int a1)
{
  if (a1 < 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return fcntl(a1, 63);
  }
}

uint64_t sub_100026C68(int a1, int a2)
{
  sub_100026B44(a1);
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (const char *)[v4 fileSystemRepresentation];

  sub_100026B44(a2);
  id v6 = objc_claimAutoreleasedReturnValue();
  id v7 = [v6 fileSystemRepresentation];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Falling back to creating new tarball at final location '%s'", buf, 0xCu);
  }
  uint64_t v8 = +[SDResourceManager sharedResourceManager];
  [v8 log:@"Falling back to creating new tarball at final location '%s'", v7];

  if (lseek(a1, 0, 0) == -1)
  {
    int v10 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062998((int)v5, (int)v7, v10);
    }
    unsigned int v11 = +[SDResourceManager sharedResourceManager];
    [v11 log:@"Failed to copy tarball '%s' to final location '%s'. Unable to lseek to start: %s", v5, v7, strerror(v10)];
    goto LABEL_13;
  }
  if (fcopyfile(a1, a2, 0, 0xFu) < 0)
  {
    int v12 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062A2C((int)v5, (int)v7, v12);
    }
    unsigned int v11 = +[SDResourceManager sharedResourceManager];
    [v11 log:@"Failed to copy tarball '%s' to final location '%s': %s", v5, v7, strerror(v12)];
LABEL_13:
    uint64_t v9 = 0;
LABEL_14:

    goto LABEL_15;
  }
  if (unlink(v5) == -1)
  {
    int v14 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062AC0((int)v5, v14);
    }
    unsigned int v11 = +[SDResourceManager sharedResourceManager];
    [v11 log:@"Failed to unlink tarball '%s' after copy': %s", v5, strerror(v14)];
    uint64_t v9 = 1;
    goto LABEL_14;
  }
  uint64_t v9 = 1;
LABEL_15:
  close(a2);
  return v9;
}

uint64_t sub_100026EF8(const char *a1, int a2)
{
  if (a2) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 2;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      uint64_t v5 = "YES";
    }
    else {
      uint64_t v5 = "NO";
    }
    *(_DWORD *)long long buf = 136315394;
    int v14 = v5;
    __int16 v15 = 1024;
    int v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device unlocked since boot? %s. Will use protection class %d", buf, 0x12u);
  }
  id v6 = +[SDResourceManager sharedResourceManager];
  id v7 = v6;
  if (a2) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  [v6 log:@"Device unlocked since boot? %s. Will use protection class %d", v8, v4];

  uint64_t v9 = open_dprotected_np(a1, 536873474, v4, 0, 416);
  if (v9 == -1)
  {
    int v10 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062B4C((uint64_t)a1, v10, v4);
    }
    unsigned int v11 = +[SDResourceManager sharedResourceManager];
    [v11 log:@"Opening tarball file descriptor at %s with protection class %d failed: %s", a1, v4, strerror(v10)];
  }
  return v9;
}

uint64_t sub_1000270A8(void *a1, void *a2, unsigned int a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  int v10 = +[NSFileManager defaultManager];
  char v35 = 0;
  [v10 fileExistsAtPath:v7 isDirectory:&v35];
  if (v35
    && ((id v11 = v9, (v12 = v11) != 0)
     || (sub_100026A64(0xFFFFFFFFLL, v8, &stru_1000A1EA8, a3 & 1, (a3 >> 2) & 1),
         (int v12 = objc_claimAutoreleasedReturnValue()) != 0)))
  {
    uint64_t v31 = 0;
    long long v32 = &v31;
    uint64_t v33 = 0x2020000000;
    int v34 = 0;
    id v13 = [v12 tarQueue];
    BOOL v14 = v11 == 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000274A4;
    block[3] = &unk_10009D6A0;
    id v15 = v12;
    id v27 = v15;
    id v16 = v7;
    id v28 = v16;
    id v29 = &v31;
    BOOL v30 = v14;
    dispatch_sync(v13, block);

    if ([v15 archiveStatus] == (id)1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v37 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Results written to %@", buf, 0xCu);
      }
      unint64_t v17 = +[SDResourceManager sharedResourceManager];
      [v17 log:@"Results written to %@", v8];

      if ((a3 & 0x10) != 0) {
        [v10 removeItemAtPath:v16 error:0];
      }
    }
    else
    {
      id v19 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v15 archiveStatus];
        *(_DWORD *)long long buf = 134218242;
        id v37 = v20;
        __int16 v38 = 2112;
        id v39 = v16;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive failed with status %zd, output at %@", buf, 0x16u);
      }

      uint64_t v21 = +[SDResourceManager sharedResourceManager];
      [v21 stdoutWrite:@"SDArchive failed with status %zd, output at %@", [v15 archiveStatus], v16];

      id v22 = +[SDResourceManager sharedResourceManager];
      [v22 log:@"SDArchive failed with status %zd, output at %@", [v15 archiveStatus], v16];
    }
    BOOL v23 = +[NSNumber numberWithInt:436];
    uint64_t v24 = +[NSDictionary dictionaryWithObjectsAndKeys:NSFileOwnerAccountName, @"mobile", NSFileGroupOwnerAccountName, v23, NSFilePosixPermissions, 0];

    [v10 setAttributes:v24 ofItemAtPath:v8 error:0];
    uint64_t v18 = *((unsigned int *)v32 + 6);

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    uint64_t v18 = 0xFFFFFFFFLL;
  }

  return v18;
}

void sub_10002747C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000274A4(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  int v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 lastPathComponent];
  [v2 addDirectoryToArchive:v3 withDirName:v4];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) getProtectionClass];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);

  return [v5 finalizeArchiveAndClose:v6];
}

off_t sub_100027520(uint64_t a1)
{
  unint64_t v2 = (stat *)malloc_type_malloc(0x90uLL, 0x1000040B72DA15FuLL);
  int v3 = __error();
  if (v2)
  {
    uint64_t v4 = fstat(a1, v2);
    uint64_t v5 = __error();
    if (v4)
    {
      int v6 = *v5;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109634;
        *(_DWORD *)id v13 = a1;
        *(_WORD *)&uint8_t v13[4] = 1024;
        *(_DWORD *)&v13[6] = v4;
        __int16 v14 = 2080;
        id v15 = strerror(v6);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to stat %d with return code: %d, errno: %s", buf, 0x18u);
      }
      id v7 = +[SDResourceManager sharedResourceManager];
      [v7 log:@"Failed to stat %d with return code: %d, errno: %s", a1, v4, strerror(v6)];

      off_t st_size = 0;
    }
    else
    {
      off_t st_size = v2->st_size;
    }
    free(v2);
  }
  else
  {
    int v9 = *v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)id v13 = strerror(v9);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to malloc stat struct with errno: %s", buf, 0xCu);
    }
    int v10 = +[SDResourceManager sharedResourceManager];
    [v10 log:@"Failed to malloc stat struct with errno: %s", strerror(v9)];

    return 0;
  }
  return st_size;
}

BOOL sub_100027714(FILE *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  int v10 = sub_10002797C(a2);
  id v11 = sub_10002797C(v9);

  int v12 = [v11 lastPathComponent];
  id v13 = [v10 componentsSeparatedByString:v12];

  id v14 = [v13 count];
  BOOL v15 = (unint64_t)v14 > 1;
  if ((unint64_t)v14 < 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Non-matching paths passed to addFileToOutputSummary %@ - %@", buf, 0x16u);
    }
    unint64_t v17 = +[SDResourceManager sharedResourceManager];
    [v17 log:@"Non-matching paths passed to addFileToOutputSummary %@ - %@", v10, v11];
  }
  else
  {
    uint64_t v16 = [v13 objectAtIndexedSubscript:1];
    if (!v16)
    {
      BOOL v15 = 0;
      goto LABEL_9;
    }
    unint64_t v17 = (void *)v16;
    if (a1)
    {
      id v18 = +[NSString stringWithFormat:@"File: %@ -- size: %lld -- compressed: %lld\n", v16, a4, a5];
      fputs((const char *)[v18 UTF8String], a1);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218498;
        id v22 = a4;
        __int16 v23 = 2048;
        uint64_t v24 = a5;
        __int16 v25 = 2112;
        uint64_t v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Resource Usage: %lld bytes original and %lld compressed for '%@'", buf, 0x20u);
      }
      id v20 = +[SDResourceManager sharedResourceManager];
      [v20 log:@"Resource Usage: %lld bytes original and %lld compressed for '%@'", a4, a5, v17];
    }
  }

LABEL_9:
  return v15;
}

id sub_10002797C(void *a1)
{
  id v1 = a1;
  if ([v1 containsString:@"IN_PROGRESS_"])
  {
    id v2 = [v1 stringByReplacingOccurrencesOfString:@"IN_PROGRESS_" withString:&stru_1000A1EA8];
  }
  else
  {
    id v2 = v1;
  }
  int v3 = v2;

  return v3;
}

void sub_1000279F0(CFTimeInterval a1)
{
  if (dword_1000BD800)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempting to take sysdiagnose power assertion but an assertion is already held.", buf, 2u);
    }
    id v1 = +[SDResourceManager sharedResourceManager];
    [v1 log:@"Attempting to take sysdiagnose power assertion but an assertion is already held."];
  }
  else
  {
    IOPMAssertionID AssertionID = 0;
    uint64_t v3 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", @"com.apple.sysdiagnose", @"sysdiagnose gathering diagnostics", 0, 0, a1, @"TimeoutActionTurnOff", &AssertionID);
    if (v3)
    {
      uint64_t v4 = v3;
      dword_1000BD800 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218240;
        CFTimeInterval v10 = a1;
        __int16 v11 = 1024;
        int v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed attempt to take sysdiagnose power assertion for %.0f secs with reason %d", buf, 0x12u);
      }
      uint64_t v5 = +[SDResourceManager sharedResourceManager];
      [v5 stdoutWrite:@"Failed attempt to take sysdiagnose power assertion for %.0f secs with reason %d", *(void *)&a1, v4];

      int v6 = +[SDResourceManager sharedResourceManager];
      [v6 log:@"Failed attempt to take sysdiagnose power assertion for %.0f secs with reason %d", *(void *)&a1, v4];
    }
    else
    {
      dword_1000BD800 = AssertionID;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        CFTimeInterval v10 = a1;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Took power assertion for %.0f secs", buf, 0xCu);
      }
      int v6 = +[SDResourceManager sharedResourceManager];
      [v6 log:@"Took power assertion for %.0f secs", *(void *)&a1, v7];
    }
  }
}

void sub_100027C2C(double a1)
{
  if (qword_1000BD808 != -1) {
    dispatch_once(&qword_1000BD808, &stru_10009D6C0);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027D14;
  block[3] = &unk_10009D6E0;
  *(double *)&void block[4] = a1;
  dispatch_async((dispatch_queue_t)qword_1000BD810, block);
}

void sub_100027CD4(id a1)
{
  qword_1000BD810 = (uint64_t)dispatch_queue_create("com.apple.sysdiagnose.power-assertions-queue", 0);

  _objc_release_x1();
}

void sub_100027D14(uint64_t a1)
{
}

void sub_100027D1C()
{
  if (dword_1000BD800)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      int v2 = dword_1000BD800;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Releasing sysdiagnose power assertion %u", buf, 8u);
    }
    BOOL v0 = +[SDResourceManager sharedResourceManager];
    [v0 log:@"Releasing sysdiagnose power assertion %u", dword_1000BD800];

    IOPMAssertionRelease(dword_1000BD800);
    dword_1000BD800 = 0;
  }
}

uint64_t sub_100027E00(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  __int16 v11 = [v9 dataUsingEncoding:4];
  [v7 writeData:v11];

  return 1;
}

void sub_100027EDC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long buf)
{
  if (a2 == 1)
  {
    id v15 = objc_begin_catch(a1);
    uint64_t v16 = [v15 name];
    uint64_t v21 = [v15 reason];
    unint64_t v17 = +[NSString stringWithFormat:@"Hit exception %@ %@. Error was %@."];

    BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v18)
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
      }
      id v19 = +[SDResourceManager sharedResourceManager];
      [v19 log:@"%@"];
    }
    else if (v18)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
    }
    if (v13)
    {
      id v20 = [v17 dataUsingEncoding:4];
      [v13 writeData:v20];
    }
    objc_end_catch();
    JUMPOUT(0x100027E88);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10002808C()
{
  if (qword_1000BD820 != -1) {
    dispatch_once(&qword_1000BD820, &stru_10009D700);
  }
  return byte_1000BD818;
}

void sub_1000280D0(id a1)
{
  byte_1000BD818 = OSAInMultiUserMode();
}

id sub_1000280F0(void *a1)
{
  id v1 = a1;
  int v2 = +[OSASystemConfiguration sharedInstance];
  uint64_t v3 = [v2 pathSubmission];
  uint64_t v4 = [v3 stringByAppendingPathComponent:v1];

  return v4;
}

id sub_100028174()
{
  if (qword_1000BD828 != -1) {
    dispatch_once(&qword_1000BD828, &stru_10009D720);
  }
  BOOL v0 = off_1000BD468;

  return v0;
}

void sub_1000281C8(id a1)
{
  off_1000BD468 = os_log_create("com.apple.sysdiagnose", "signpost");

  _objc_release_x1();
}

id sub_10002820C()
{
  if (qword_1000BD830 != -1) {
    dispatch_once(&qword_1000BD830, &stru_10009D740);
  }
  BOOL v0 = off_1000BD470;

  return v0;
}

void sub_100028260(id a1)
{
  off_1000BD470 = os_log_create("com.apple.sysdiagnose", "containers");

  _objc_release_x1();
}

uint64_t sub_1000282A4()
{
  return 0;
}

id sub_1000282AC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v4)
  {
    int v6 = [v4 stringByAppendingString:@"sysdiagnose_temp.XXXXXX"];
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v6 = @"sysdiagnose_temp.XXXXXX";
  if (v3)
  {
LABEL_3:
    uint64_t v7 = [v3 stringByAppendingPathComponent:v6];

    int v6 = (__CFString *)v7;
  }
LABEL_4:
  id v8 = v6;
  id v9 = strndup((const char *)[(__CFString *)v8 UTF8String], (size_t)[(__CFString *)v8 length]);
  if (v9)
  {
    id v10 = v9;
    if (mkdtemp(v9))
    {
      __int16 v11 = +[NSFileManager defaultManager];
      int v12 = [v11 stringWithFileSystemRepresentation:v10 length:strlen(v10)];

      free(v10);
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062C38();
    }
    __int16 v23 = +[SDResourceManager sharedResourceManager];
    uint64_t v24 = __error();
    [v23 stderrWrite:@"Unable to create user temporary directory %@: %s", v8, strerror(*v24)];

    __int16 v25 = +[SDResourceManager sharedResourceManager];
    uint64_t v26 = __error();
    [v25 log:@"Unable to create user temporary directory %@: %s", v8, strerror(*v26)];

    free(v10);
  }
  else
  {
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v13) {
      sub_100062BFC(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    uint64_t v21 = +[SDResourceManager sharedResourceManager];
    [v21 stderrWrite:@"Unable to allocate temporary directory template"];

    id v22 = +[SDResourceManager sharedResourceManager];
    [v22 log:@"Unable to allocate temporary directory template"];
  }
  int v12 = 0;
LABEL_16:

  return v12;
}

id sub_1000284E0(void *a1)
{
  id v1 = a1;
  [v1 UTF8String];
  uint64_t v2 = container_system_group_path_for_identifier();
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = +[NSString stringWithUTF8String:v2];
    free(v3);
  }
  else
  {
    container_get_error_description();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062CC8();
    }
    id v4 = 0;
  }

  return v4;
}

id sub_1000285AC(void *a1, int a2)
{
  id v3 = a1;
  if (!container_query_create())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062D38();
    }
    goto LABEL_20;
  }
  container_query_set_class();
  container_query_operation_set_flags();
  id v4 = v3;
  xpc_object_t v5 = xpc_string_create((const char *)[v4 UTF8String]);
  container_query_set_group_identifiers();

  if (a2)
  {
    int v6 = getpwnam("mobile");
    if (v6) {
      uid_t pw_uid = v6->pw_uid;
    }
    else {
      uid_t pw_uid = 501;
    }
    if (!getpwuid(pw_uid))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100062DA8((uint64_t)v4, pw_uid);
      }
      goto LABEL_20;
    }
    container_query_set_uid();
  }
  if (container_query_get_single_result())
  {
    uint64_t path = container_get_path();
    if (path)
    {
      id v9 = +[NSString stringWithUTF8String:path];
      goto LABEL_21;
    }
    container_query_get_last_error();
    id v10 = (void *)container_error_copy_unlocalized_description();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062EA4();
    }
  }
  else
  {
    container_query_get_last_error();
    id v10 = (void *)container_error_copy_unlocalized_description();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100062E34();
    }
  }
  free(v10);
LABEL_20:
  id v9 = 0;
LABEL_21:
  container_query_free();

  return v9;
}

uint64_t sub_100028778(uint64_t a1)
{
  if (qword_1000BD838 != -1) {
    dispatch_once(&qword_1000BD838, &stru_10009D760);
  }
  return qword_1000BD840 * a1;
}

void sub_1000287CC(id a1)
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info)) {
    qword_1000BD840 = info.numer / info.denom;
  }
}

uint64_t sub_100028808(int a1)
{
  if (a1 == -1) {
    return 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  long long v2 = 0u;
  proc_pid_rusage(a1, 5, (rusage_info_t *)&v2);
  return *((void *)&v3 + 1) + v3;
}

unint64_t sub_1000288A8(uint64_t a1, uint64_t a2)
{
  unint64_t result = 0;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)a2 + *(void *)a1;
    int v5 = *(_DWORD *)(a2 + 8) + *(_DWORD *)(a1 + 8);
    if (v5 > 0xF423F)
    {
      ++v4;
      v5 -= 1000000;
    }
    return (unint64_t)(float)((float)(unint64_t)(1000000000 * v4) + (float)(unint64_t)(1000 * v5));
  }
  return result;
}

double sub_100028914(void *a1)
{
  id v1 = a1;
  long long v2 = +[NSDate date];
  v1[2](v1);

  long long v3 = +[NSDate date];
  [v3 timeIntervalSinceDate:v2];
  double v5 = v4;

  return v5;
}

NSObject *sub_10002899C(void *a1, void *a2)
{
  id v3 = a1;
  double v4 = a2;
  double v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, (int)[v3 processIdentifier], 0x80000000uLL, v4);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100028A80;
  handler[3] = &unk_10009CFE0;
  id v9 = v3;
  id v6 = v3;
  dispatch_source_set_registration_handler(v5, handler);

  return v5;
}

void sub_100028A80(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Resuming process", (uint8_t *)&v7, 2u);
  }
  if ([*(id *)(a1 + 32) resume])
  {
    long long v2 = sub_100028174();
    id v3 = v2;
    double v4 = *(void **)(a1 + 32);
    if ((unint64_t)v4 + 1 >= 2 && os_signpost_enabled(v2))
    {
      id v6 = [v4 executionLine];
      int v7 = 138412290;
      long long v8 = v6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v4, "CLI Task", "%@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [*(id *)(a1 + 32) executionLine];
    int v7 = 138412290;
    long long v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error resuming process %@", (uint8_t *)&v7, 0xCu);
  }
}

id sub_100028C10(void *a1, void *a2)
{
  id v3 = a1;
  double v4 = [a2 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
  double v5 = +[NSString stringWithFormat:@"%@_task_failures.txt", v4];

  v9[0] = v3;
  v9[1] = @"errors";
  v9[2] = v5;
  id v6 = +[NSArray arrayWithObjects:v9 count:3];
  int v7 = +[NSString pathWithComponents:v6];

  return v7;
}

id sub_100028D20(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 && [v3 length] && (objc_msgSend(v3, "isEqualToString:", @".") & 1) == 0)
  {
    id v5 = [v3 lastPathComponent];
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

id sub_100028DB0(void *a1, const char *a2)
{
  return [a1 stringByAppendingString:@" task"];
}

id sub_100028DBC(void *a1, const char *a2)
{
  return [a1 stringByAppendingString:@" collection"];
}

void sub_100028DC8(uint64_t a1)
{
  if (tailspin_config_create_with_current_state())
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = tailspin_buffer_size_get();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      int v3 = 134217984;
      uint64_t v4 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Stored system tailspin buffer size is %lu", (uint8_t *)&v3, 0xCu);
    }
    tailspin_config_free();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100062F14();
  }
}

void sub_1000291EC()
{
}

void sub_100029204(char a1)
{
  uint64_t v2 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029294;
  block[3] = &unk_10009D8F8;
  char v4 = a1;
  dispatch_async(v2, block);
}

void sub_100029294(uint64_t a1)
{
  uint64_t v2 = +[NSMutableDictionary dictionaryWithObject:&off_1000B1118 forKey:kAudioServicesPlaySystemSoundOptionFlagsKey];
  if (*(unsigned char *)(a1 + 32)) {
    int v3 = &off_1000B0ED8;
  }
  else {
    int v3 = &off_1000B0EF0;
  }
  v6[0] = @"Intensity";
  v6[1] = @"VibePattern";
  v7[0] = &off_1000B13F8;
  v7[1] = v3;
  char v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [v2 setObject:v4 forKey:kAudioServicesPlaySystemSoundOptionVibrationPatternKey];

  id v5 = [v2 copy];
  AudioServicesPlaySystemSoundWithOptions();
}

void sub_1000293AC(void *a1, void *a2)
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100029540;
  v11[3] = &unk_10009D920;
  id v3 = a2;
  id v12 = v3;
  char v4 = a1;
  id v5 = objc_retainBlock(v11);
  if (sub_100048B34()) {
    id v6 = "com.apple.appletv.backgroundstate";
  }
  else {
    id v6 = "com.apple.springboard.lockstate";
  }
  uint32_t v7 = notify_register_dispatch(v6, &dword_1000BD84C, v4, v5);

  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to register lock notification", v10, 2u);
    }
    long long v8 = +[SDResourceManager sharedResourceManager];
    [v8 stdoutWrite:@"failed to register lock notification"];

    id v9 = +[SDResourceManager sharedResourceManager];
    [v9 log:@"failed to register lock notification"];
  }
  byte_1000BD478 = 1;
  ((void (*)(void *, void))v5[2])(v5, dword_1000BD84C);
}

uint64_t sub_100029540(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(token, &state64);
  if (!result)
  {
    byte_1000BD478 = state64 != 0;
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t sub_1000295A4()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1000BD478) {
      BOOL v0 = "LOCKED!";
    }
    else {
      BOOL v0 = "unlocked";
    }
    *(_DWORD *)long long buf = 136315138;
    id v9 = v0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device %s", buf, 0xCu);
  }
  id v1 = +[SDResourceManager sharedResourceManager];
  uint64_t v2 = v1;
  if (byte_1000BD478) {
    id v3 = "LOCKED!";
  }
  else {
    id v3 = "unlocked";
  }
  [v1 stdoutWrite:@"Device %s", v3];

  char v4 = +[SDResourceManager sharedResourceManager];
  id v5 = v4;
  if (byte_1000BD478) {
    id v6 = "LOCKED!";
  }
  else {
    id v6 = "unlocked";
  }
  [v4 log:@"Device %s", v6];

  return byte_1000BD478;
}

void sub_1000296D8(uint64_t a1)
{
  if (objc_opt_class())
  {
    uint64_t v2 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000297A4;
    block[3] = &unk_10009D6E0;
    void block[4] = a1;
    dispatch_async(v2, block);
  }
  else
  {
    id v3 = (void *)qword_1000BD850;
    qword_1000BD850 = 0;
  }
}

void sub_1000297A4(uint64_t a1)
{
  id v2 = STBackgroundActivityIdentifierSysdiagnose;
  if (!*(void *)(a1 + 32)) {
    _os_assumes_log();
  }
  uint64_t v3 = +[SBSBackgroundActivityAssertion assertionWithBackgroundActivityIdentifier:v2 forPID:getpid() exclusive:1 showsWhenForeground:1];
  char v4 = (void *)qword_1000BD850;
  qword_1000BD850 = v3;

  if (!qword_1000BD850) {
    _os_assumes_log();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Acquiring status bar assertion", buf, 2u);
  }
  id v5 = +[SDResourceManager sharedResourceManager];
  [v5 stdoutWrite:@"Acquiring status bar assertion"];

  id v6 = +[SDResourceManager sharedResourceManager];
  [v6 log:@"Acquiring status bar assertion"];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_100029944;
  v7[3] = &unk_10009D948;
  long long v8 = @"Gathering diagnostics...";
  [(id)qword_1000BD850 acquireWithHandler:v7 invalidationHandler:&stru_10009D968];
}

void sub_100029944(uint64_t a1, int a2)
{
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v4)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully acquired status bar assertion", buf, 2u);
    }
    id v5 = +[SDResourceManager sharedResourceManager];
    [v5 stdoutWrite:@"Successfully acquired status bar assertion"];

    id v6 = +[SDResourceManager sharedResourceManager];
    [v6 log:@"Successfully acquired status bar assertion"];

    sub_100029A80(*(void **)(a1 + 32));
  }
  else
  {
    if (v4)
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to acquire status bar assertion", v9, 2u);
    }
    uint32_t v7 = +[SDResourceManager sharedResourceManager];
    [v7 stdoutWrite:@"Unable to acquire status bar assertion"];

    long long v8 = +[SDResourceManager sharedResourceManager];
    [v8 log:@"Unable to acquire status bar assertion"];
  }
}

void sub_100029A80(void *a1)
{
  id v1 = a1;
  if (!v1) {
    _os_assumes_log();
  }
  id v2 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029BF4;
  block[3] = &unk_10009CFE0;
  id v5 = v1;
  id v3 = v1;
  dispatch_async(v2, block);
}

void sub_100029B38(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Status bar assertion released", v3, 2u);
  }
  id v1 = +[SDResourceManager sharedResourceManager];
  [v1 stdoutWrite:@"Status bar assertion released"];

  id v2 = +[SDResourceManager sharedResourceManager];
  [v2 log:@"Status bar assertion released"];

  [(id)qword_1000BD850 invalidate];
}

void *sub_100029BF4(void *result)
{
  if (qword_1000BD850) {
    return [(id)qword_1000BD850 setStatusString:result[4]];
  }
  return result;
}

void sub_100029C10(int a1, uint64_t a2)
{
  if (a1) {
    sub_100029204(0);
  }
  if (a2)
  {
    sub_1000296D8(a2);
  }
}

void sub_100029C60(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Launching FBA ...", buf, 2u);
  }
  id v5 = +[SDResourceManager sharedResourceManager];
  [v5 stdoutWrite:@"Launching FBA ..."];

  id v6 = +[SDResourceManager sharedResourceManager];
  [v6 log:@"Launching FBA ..."];

  uint32_t v7 = +[NSString stringWithFormat:@"applefeedback://new?bundleID?=%@&extension=com.apple.DiagnosticExtensions.sysdiagnose&com.apple.DiagnosticExtensions.sysdiagnose%%5BshouldCreateTarBall=0%%5D&com.apple.DiagnosticExtensions.sysdiagnose%%5BdiagnosticID%%5D=%@&com.apple.DiagnosticExtensions.sysdiagnose[fbaKeychord]=1", v4, v3];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FBA Params %{public}@", buf, 0xCu);
  }
  long long v8 = +[SDResourceManager sharedResourceManager];
  [v8 log:@"FBA Params %{public}@", v7];

  id v9 = +[NSURL URLWithString:v7];
  long long v10 = +[LSApplicationWorkspace defaultWorkspace];
  [v10 openURL:v9 configuration:0 completionHandler:0];
}

void sub_100029E38(void *a1, int a2, void *a3, void *a4)
{
  __int16 v46 = a1;
  id v47 = a3;
  CFStringRef v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Launching TTR ...", buf, 2u);
  }
  long long v8 = +[SDResourceManager sharedResourceManager];
  [v8 stdoutWrite:@"Launching TTR ..."];

  id v9 = +[SDResourceManager sharedResourceManager];
  [v9 log:@"Launching TTR ..."];

  v45 = (__CFString *)v7;
  if (v7) {
    CFStringRef v10 = v7;
  }
  else {
    CFStringRef v10 = @"tap-to-radar://new";
  }
  long long v11 = +[NSURLComponents componentsWithString:v10];
  id v12 = +[NSMutableDictionary dictionary];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v13 = [v11 queryItems];
  id v14 = [v13 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v54 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        long long v19 = [v18 value];
        long long v20 = [v18 name];
        [v12 setObject:v19 forKeyedSubscript:v20];
      }
      id v15 = [v13 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v15);
  }

  uint64_t v21 = [v12 objectForKeyedSubscript:@"Keywords"];

  if (!v21) {
    [v12 setObject:@"579886" forKeyedSubscript:@"Keywords"];
  }
  id v22 = [v12 objectForKeyedSubscript:@"Title"];

  if (!v22)
  {
    *(_OWORD *)long long buf = 0u;
    long long v60 = 0u;
    memset(v58, 0, sizeof(v58));
    size_t v52 = 32;
    sysctlbyname("hw.targettype", v58, &v52, 0, 0);
    size_t v52 = 32;
    sysctlbyname("kern.osversion", buf, &v52, 0, 0);
    if (LOBYTE(v58[0]))
    {
      if (buf[0])
      {
        __int16 v23 = +[NSString stringWithFormat:@"%s/%s: ", v58, buf];
        [v12 setObject:v23 forKeyedSubscript:@"Title"];
      }
    }
  }
  uint64_t v24 = [v12 objectForKeyedSubscript:@"BundleID"];

  if (v47 && !v24) {
    [v12 setObject:v47 forKeyedSubscript:@"BundleID"];
  }
  if (a2)
  {
    CFStringRef v25 = @"diagnosticID";
    uint64_t v26 = v12;
    CFStringRef v27 = v46;
  }
  else
  {
    id v28 = sub_100025154(v46, 0);
    [v12 setObject:v28 forKeyedSubscript:@"Attachments"];

    CFStringRef v27 = @"0";
    CFStringRef v25 = @"AutoDiagnostics";
    uint64_t v26 = v12;
  }
  [v26 setObject:v27 forKeyedSubscript:v25];
  id v29 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v30 = v12;
  id v31 = [v30 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v49;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v49 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v48 + 1) + 8 * (void)j);
        long long v36 = [v30 objectForKeyedSubscript:v35];
        id v37 = +[NSURLQueryItem queryItemWithName:v35 value:v36];
        [v29 addObject:v37];
      }
      id v32 = [v30 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v32);
  }

  [v11 setQueryItems:v29];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v38 = [v11 URL];
    id v39 = [v38 absoluteString];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v39;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TTR Params %{public}@", buf, 0xCu);
  }
  __int16 v40 = +[SDResourceManager sharedResourceManager];
  uint64_t v41 = [v11 URL];
  v42 = [v41 absoluteString];
  [v40 log:@"TTR Params %{public}@", v42];

  v43 = +[LSApplicationWorkspace defaultWorkspace];
  v44 = [v11 URL];
  [v43 openURL:v44 configuration:0 completionHandler:0];
}

void sub_10002A3EC(void *a1)
{
  id v6 = a1;
  if (qword_1000BD850) {
    [(id)qword_1000BD850 invalidate];
  }
  int v1 = sub_100048604();
  id v2 = [v6 diagnosticID];
  if (v1)
  {
    int v3 = [v6 isEarlyPrompt];
    id v4 = [v6 bundleID];
    id v5 = [v6 ttrOverrideURLStr];
    sub_100029E38(v2, v3, v4, v5);
  }
  else
  {
    id v4 = [v6 bundleID];
    sub_100029C60(v2, v4);
  }
}

void sub_10002A4CC(void *a1)
{
  id v1 = a1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting prompting logic", v2, 2u);
  }
  if ([v1 openIssueFiler] == (id)1) {
    [v1 setOpenIssueFiler:sub_10002A568(v1)];
  }
  sub_10002A93C(v1);
}

uint64_t sub_10002A568(void *a1)
{
  id v1 = a1;
  if ((sub_100048604() & 1) == 0 && (sub_100024694() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Prompt disabled on non-seed customer builds.", v17, 2u);
    }
    id v12 = +[SDResourceManager sharedResourceManager];
    long long v13 = v12;
    CFStringRef v14 = @"Prompt disabled on non-seed customer builds.";
    goto LABEL_37;
  }
  if (([v1 isCoSysdiagnoseResponse] & 1) == 0)
  {
    if (byte_1000BD478)
    {
      unsigned __int8 v2 = atomic_load(byte_1000BD848);
      if (v2)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Prompt disabled since device is currently locked and was locked at beginning of diagnostics.", v17, 2u);
        }
        id v12 = +[SDResourceManager sharedResourceManager];
        long long v13 = v12;
        CFStringRef v14 = @"Prompt disabled since device is currently locked and was locked at beginning of diagnostics.";
LABEL_37:
        [v12 log:v14];

        uint64_t v11 = 0;
        goto LABEL_38;
      }
    }
  }
  *(void *)long long v17 = 0;
  if ([v1 didPartnerTimeout])
  {
    if (sub_100048604()) {
      CFStringRef v3 = @"Only the local diagnostics will be available, file radar anyways?";
    }
    else {
      CFStringRef v3 = @"Only the local diagnostics will be available, send feedback anyways?";
    }
    CFStringRef v4 = @"Watch diagnostics did not complete in time.";
  }
  else
  {
    if ([v1 isEarlyPrompt]) {
      CFStringRef v4 = @"Diagnostics are in flight";
    }
    else {
      CFStringRef v4 = @"Diagnostics complete.";
    }
    if ([v1 isEarlyPrompt]) {
      CFStringRef v3 = @"Perform the following:";
    }
    else {
      CFStringRef v3 = @"Sharing options:";
    }
  }
  if (sub_100048604()) {
    CFStringRef v5 = @"Open with Tap-to-Radar";
  }
  else {
    CFStringRef v5 = @"Send Feedback";
  }
  CFStringRef v6 = (const __CFString *)CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v4, v3, v5, @"Ignore", 0, (CFOptionFlags *)v17);
  if (v6)
  {
    CFStringRef v7 = v6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      int v19 = (int)v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CFUserNotificationDisplayAlert for prompt failed with value %d", buf, 8u);
    }
    long long v8 = +[SDResourceManager sharedResourceManager];
    id v9 = v8;
    CFStringRef otherButtonTitle = v7;
    CFStringRef v10 = @"CFUserNotificationDisplayAlert for prompt failed with value %d";
  }
  else if (*(void *)v17 == 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User selected to ignore the prompt.", buf, 2u);
    }
    long long v8 = +[SDResourceManager sharedResourceManager];
    id v9 = v8;
    CFStringRef v10 = @"User selected to ignore the prompt.";
  }
  else
  {
    if (!*(void *)v17)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User selected to create radar", buf, 2u);
      }
      id v9 = +[SDResourceManager sharedResourceManager];
      [v9 log:@"User selected to create radar"];
      uint64_t v11 = 2;
      goto LABEL_25;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "End of promptPostAction", buf, 2u);
    }
    long long v8 = +[SDResourceManager sharedResourceManager];
    id v9 = v8;
    CFStringRef v10 = @"End of promptPostAction";
  }
  [v8 log:v10, otherButtonTitle];
  uint64_t v11 = 0;
LABEL_25:

LABEL_38:
  return v11;
}

void sub_10002A93C(void *a1)
{
  id v1 = a1;
  if (![v1 openIssueFiler] || (sub_100048604() & 1) == 0 && (sub_100024694() & 1) == 0)
  {
    id v2 = [v1 openIssueFiler];
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (!v3) {
        goto LABEL_12;
      }
      __int16 v6 = 0;
      CFStringRef v4 = "Current install does not permit prompting";
      CFStringRef v5 = (uint8_t *)&v6;
    }
    else
    {
      if (!v3) {
        goto LABEL_12;
      }
      *(_WORD *)long long buf = 0;
      CFStringRef v4 = "Not prompting due to openIssueFiler = Do Nothing";
      CFStringRef v5 = buf;
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    goto LABEL_12;
  }
  if ([v1 openIssueFiler] == (id)2) {
    sub_10002A3EC(v1);
  }
LABEL_12:
}

void sub_10002AA18(void *a1)
{
  id v1 = a1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [v1 description];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Prompt Status %{public}@", (uint8_t *)&buf, 0xCu);
  }
  BOOL v3 = +[SDResourceManager sharedResourceManager];
  CFStringRef v4 = [v1 description];
  [v3 log:@"Prompt Status %{public}@", v4];

  if ([v1 openIssueFiler])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v12 = 0x3032000000;
    long long v13 = sub_10002AC40;
    CFStringRef v14 = sub_10002AC50;
    id v15 = [v1 copy];
    CFStringRef v5 = (void *)os_transaction_create();
    __int16 v6 = dispatch_get_global_queue(33, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002AC58;
    block[3] = &unk_10009D008;
    id v9 = v5;
    p_long long buf = &buf;
    id v7 = v5;
    dispatch_async(v6, block);

    _Block_object_dispose(&buf, 8);
  }
}

void sub_10002AC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002AC40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002AC50(uint64_t a1)
{
}

void sub_10002AC58(uint64_t a1)
{
}

CFStringRef sub_10002AC68()
{
  return &stru_1000A1EA8;
}

id sub_10002AC74(uint64_t a1)
{
  id v1 = +[NSInputStream inputStreamWithFileAtPath:a1];
  id v2 = v1;
  if (v1)
  {
    [v1 open];
    BOOL v3 = +[NSPropertyListSerialization propertyListWithStream:v2 options:0 format:0 error:0];
    [v2 close];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

id sub_10002AD00()
{
  return sub_10002AC74(@"/private/var/mobile/Library/Preferences/com.apple.sysdiagnose.plist");
}

uint64_t sub_10002AD0C()
{
  if (qword_1000BD858 != -1) {
    dispatch_once(&qword_1000BD858, &stru_10009D988);
  }
  return byte_1000BD860;
}

void sub_10002AD50(id a1)
{
  if (byte_1000BD860)
  {
    id v1 = 0;
    id v2 = 0;
  }
  else
  {
    BOOL v3 = sub_10002AC74(@"/private/var/mobile/Library/Preferences/com.apple.sysdiagnose.plist");
    id v2 = v3;
    if (v3)
    {
      id v1 = [v3 objectForKeyedSubscript:@"sysdiagnoseIgnoreKeychords"];
      if (v1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v4 = [v1 BOOLValue];
          byte_1000BD860 = v4;
          if (v4)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int16 v6 = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnoseIgnoreKeychords is on", v6, 2u);
            }
            CFStringRef v5 = +[SDResourceManager sharedResourceManager];
            [v5 log:@"sysdiagnoseIgnoreKeychords is on"];
          }
        }
      }
    }
    else
    {
      id v1 = 0;
    }
  }
}

uint64_t sub_10002AE68()
{
  uint64_t result = sub_100024904();
  if (result)
  {
    BOOL v1 = 0;
    sub_1000487D8(@"factoryDisable", @"com.apple.sysdiagnose", &v1);
    return v1;
  }
  return result;
}

uint64_t sub_10002AEB4(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v10 = v1;
    id v2 = +[SystemDiagnosticIDS sharedInstance];
    BOOL v3 = [v2 localGroupDictionary];
    [v3 removeObjectForKey:v10];

    unsigned int v4 = +[SystemDiagnosticIDS sharedInstance];
    CFStringRef v5 = [v4 executionGroupDictionary];
    __int16 v6 = [v5 objectForKey:v10];

    if (v6)
    {
      dispatch_group_leave(v6);
      id v7 = +[SystemDiagnosticIDS sharedInstance];
      long long v8 = [v7 executionGroupDictionary];
      [v8 removeObjectForKey:v10];
    }
  }

  return _objc_release_x1();
}

void sub_10002AFA4(void *a1)
{
  id v2 = a1;
  if (qword_1000BD850) {
    [(id)qword_1000BD850 invalidate];
  }
  sub_100027D1C();
  id v1 = [v2 diagnosticID];
  sub_10002AEB4(v1);
}

id sub_10002B338(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    CFStringRef v5 = [v3 tmpOutputDirectory];

    if (v5)
    {
      CFStringRef v5 = [v3 tmpOutputDirectory];
    }
  }
  else
  {
    CFStringRef v5 = 0;
  }
  __int16 v6 = [v4 stringByAppendingString:@"_"];
  id v7 = sub_1000282AC(v5, v6);

  id v8 = v7;
  if (sub_100056818((const char *)[v8 fileSystemRepresentation], 0x1EDu))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000630B0((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v16 = +[SDResourceManager sharedResourceManager];
    [v16 stderrWrite:@"Unable to set attributes on task temporary directory %@", v8];

    id v17 = +[SDResourceManager sharedResourceManager];
    [v17 log:@"Unable to set attributes on task temporary directory %@", v8];
    long long v18 = 0;
  }
  else
  {
    int v19 = [v8 stringByAppendingPathComponent:v4];

    long long v20 = +[NSFileManager defaultManager];
    NSFileAttributeKey v29 = NSFilePosixPermissions;
    id v30 = &off_1000B1190;
    uint64_t v21 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v28 = 0;
    unsigned __int8 v22 = [v20 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:v21 error:&v28];
    id v17 = v28;

    if (v22)
    {
      id v8 = v19;
      long long v18 = v8;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100063004((uint64_t)v19, v17);
      }
      __int16 v23 = +[SDResourceManager sharedResourceManager];
      uint64_t v24 = [v17 localizedDescription];
      [v23 stderrWrite:@"Could not create target location %@ with error %@", v19, v24];

      CFStringRef v25 = +[SDResourceManager sharedResourceManager];
      uint64_t v26 = [v17 localizedDescription];
      [v25 log:@"Could not create target location %@ with error %@", v19, v26];

      long long v18 = 0;
      id v8 = v19;
    }
  }

  return v18;
}

id sub_10002B628(uint64_t a1)
{
  id result = *(id *)(a1 + 32);
  if (result) {
    return [result execute];
  }
  return result;
}

id sub_10002B934(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a1 + 32);
  if (result)
  {
    [result addRulesFromHelperReply:a2];
    id v4 = *(void **)(a1 + 32);
    return [v4 execute];
  }
  return result;
}

void *sub_10002BC40(void *result, uint64_t a2)
{
  if (a2)
  {
    id v2 = result;
    id v3 = (void *)result[4];
    if (v3)
    {
      id v4 = +[SDUnitLogPathArray logRuleWithMutablePaths:a2];
      __int16 v6 = v4;
      CFStringRef v5 = +[NSArray arrayWithObjects:&v6 count:1];
      [v3 addRules:v5];

      return [(id)v2[4] execute];
    }
  }
  return result;
}

id sub_10002D6C0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Collecting MultiTouch diagnostics", buf, 2u);
  }
  id v2 = +[SDResourceManager sharedResourceManager];
  [v2 stdoutWrite:@"Collecting MultiTouch diagnostics"];

  id v3 = +[SDResourceManager sharedResourceManager];
  [v3 log:@"Collecting MultiTouch diagnostics"];

  if ([*(id *)(a1 + 32) pidForProcessName:@"mtrecorder.internal"] != -1
    || [*(id *)(a1 + 32) pidForProcessName:@"mtrecorder"] != -1)
  {
    id v4 = objc_alloc_init(MultiTouchDiagnostic);
    if (![(MultiTouchDiagnostic *)v4 runWithTimeout:5.0])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out.", buf, 2u);
      }
      CFStringRef v5 = +[SDResourceManager sharedResourceManager];
      [v5 stdoutWrite:@"Timed out."];

      __int16 v6 = +[SDResourceManager sharedResourceManager];
      [v6 log:@"Timed out."];
    }
  }
  id v7 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v25 = [&off_1000B1040 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v25; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(&off_1000B1040);
        }
        uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v10 = +[NSFileManager defaultManager];
        uint64_t v11 = +[NSURL fileURLWithPath:v9 isDirectory:1];
        NSURLResourceKey v37 = NSURLNameKey;
        uint64_t v12 = +[NSArray arrayWithObjects:&v37 count:1];
        uint64_t v13 = [v10 enumeratorAtURL:v11 includingPropertiesForKeys:v12 options:6 errorHandler:&stru_10009DA30];

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v14 = v13;
        id v15 = [v14 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v28;
          do
          {
            for (j = 0; j != v16; j = (char *)j + 1)
            {
              if (*(void *)v28 != v17) {
                objc_enumerationMutation(v14);
              }
              int v19 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
              uint64_t v26 = 0;
              [v19 getResourceValue:&v26 forKey:NSURLNameKey error:0];
              if (v26)
              {
                uint64_t v21 = [v9 stringByAppendingPathComponent:];
                [v7 addObject:v21];
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v27 objects:v36 count:16];
          }
          while (v16);
        }
      }
      id v25 = [&off_1000B1040 countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v25);
  }
  if ([v7 count]) {
    id v22 = v7;
  }
  else {
    id v22 = 0;
  }

  return v22;
}

BOOL sub_10002DAC8(id a1, NSURL *a2, NSError *a3)
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NSError *)v3 localizedDescription];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MultiTouch error %@", buf, 0xCu);
  }
  CFStringRef v5 = +[SDResourceManager sharedResourceManager];
  __int16 v6 = [(NSError *)v3 localizedDescription];
  [v5 log:@"MultiTouch error %@", v6];

  return 1;
}

void sub_10002E348(uint64_t a1)
{
  id v2 = +[SDLogCollectionContainer containerWithName:@"tailspin-save-ts-collection" destination:&stru_1000A1EA8 withDelegate:*(void *)(a1 + 32)];
  if (v2)
  {
    [v2 setMaximumSizeMB:sub_100026628(0)];
    uint64_t v6 = *(void *)(a1 + 40);
    id v3 = +[NSArray arrayWithObjects:&v6 count:1];
    id v4 = +[SDUnitLogPathArray logRuleWithPaths:v3];
    id v7 = v4;
    CFStringRef v5 = +[NSArray arrayWithObjects:&v7 count:1];
    [v2 addRules:v5];

    [v2 execute];
  }
}

void sub_10002E864(uint64_t a1)
{
  id v2 = +[SDLogCollectionContainer containerWithName:@"spindump-meta-collection" destination:&stru_1000A1EA8 withDelegate:*(void *)(a1 + 32)];
  id v3 = v2;
  if (v2)
  {
    [v2 setMaximumSizeMB:200];
    uint64_t v7 = *(void *)(a1 + 40);
    id v4 = +[NSArray arrayWithObjects:&v7 count:1];
    CFStringRef v5 = +[SDUnitLogPathArray logRuleWithPaths:v4];
    id v8 = v5;
    uint64_t v6 = +[NSArray arrayWithObjects:&v8 count:1];
    [v3 addRules:v6];

    [v3 execute];
  }
}

void sub_10002ED80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002F8C0(uint64_t a1)
{
  id v7 = xpc_dictionary_create(0, 0, 0);
  id v2 = +[CSCoordinator sharedInstance];
  id v3 = [v2 gatherLocalSysdiagnoseForMsg:*(void *)(a1 + 32) withReply:v7];

  id v4 = +[CSCoordinator sharedInstance];
  unsigned __int8 v5 = [v4 isHost];

  if ((v5 & 1) == 0)
  {
    if (v3) {
      +[CSRemoteXPCProxy remoteSendFile:v3 toPeer:*(void *)(a1 + 40) withTimeoutTarget:0];
    }
    else {
      xpc_remote_connection_send_message();
    }
  }
  uint64_t v6 = +[CSCoordinator sharedInstance];
  [v6 endRemoteInitiatedFlow];
}

void sub_10002FC04(id a1)
{
  id v1 = +[CSCoordinator sharedInstance];
  [v1 safeLeaveHostWaitGroup];
}

void sub_10002FD24(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if ((sub_100048604() & 1) != 0
    || (sub_100048C78() & 1) != 0
    || (sub_100048CE4() & 1) != 0
    || (sub_1000490F0() & 1) != 0
    || sub_100024854())
  {
    id v7 = v2;
    xpc_remote_connection_set_event_handler();
    xpc_remote_connection_activate();
    id v3 = +[CSCoordinator sharedInstance];
    id v4 = [v3 logSubsystem];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Connection started.", buf, 2u);
    }
  }
  else
  {
    unsigned __int8 v5 = +[CSCoordinator sharedInstance];
    uint64_t v6 = [v5 logSubsystem];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Current configuration prevents device from accepting RemoteXPC requests. Cancelling remote connection", buf, 2u);
    }

    xpc_remote_connection_cancel();
  }
}

void sub_10002FEC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  unsigned __int8 v5 = +[CSCoordinator sharedInstance];
  uint64_t v6 = [v5 logSubsystem];

  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v7)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Initiating remote connection", buf, 2u);
    }

    +[CSRemoteXPCProxy handleRemoteConnection:*(void *)(a1 + 32) forMsg:v3 isTrusted:0];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Cancelling remote connection", v8, 2u);
    }

    xpc_remote_connection_cancel();
  }
}

BOOL sub_1000306BC(void *a1)
{
  id v1 = [a1 lowercaseString];
  id v2 = [v1 rangeOfString:@"bridge"];

  return v2 != (id)0x7FFFFFFFFFFFFFFFLL;
}

uint64_t sub_100030704(uint64_t a1, int a2)
{
  id v4 = +[CSCoordinator sharedInstance];
  unsigned __int8 v5 = [v4 logSubsystem];

  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) fileSystemRepresentation];
      int v16 = 136315650;
      id v17 = v7;
      __int16 v18 = 1024;
      int v19 = a2;
      __int16 v20 = 2080;
      uint64_t v21 = strerror(a2);
      id v8 = "CSRemoteXPCProxy: File transfer failed to \"%s\" with error %d:%s";
      uint64_t v9 = v5;
      uint32_t v10 = 28;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v16, v10);
    }
  }
  else if (v6)
  {
    id v11 = [*(id *)(a1 + 32) fileSystemRepresentation];
    int v16 = 136315138;
    id v17 = v11;
    id v8 = "CSRemoteXPCProxy: File transfer succeeded to \"%s\"";
    uint64_t v9 = v5;
    uint32_t v10 = 12;
    goto LABEL_6;
  }

  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v12, v13, v14);
}

void sub_100030B9C(uint64_t a1, int a2)
{
  id v4 = +[CSCoordinator sharedInstance];
  unsigned __int8 v5 = [v4 logSubsystem];

  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      v10[0] = 67109378;
      v10[1] = a2;
      __int16 v11 = 2080;
      uint64_t v12 = strerror(a2);
      id v7 = "CSRemoteXPCProxy: File transfer failed with error %d:%s";
      id v8 = v5;
      uint32_t v9 = 18;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)v10, v9);
    }
  }
  else if (v6)
  {
    LOWORD(v10[0]) = 0;
    id v7 = "CSRemoteXPCProxy: File transfer succeeded";
    id v8 = v5;
    uint32_t v9 = 2;
    goto LABEL_6;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000312E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    unsigned __int8 v5 = type;
    BOOL v6 = +[CSCoordinator sharedInstance];
    id v7 = [v6 logSubsystem];

    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5 == (const _xpc_type_s *)&_xpc_type_error)
    {
      if (v8)
      {
        uint64_t v11 = *(void *)(a1 + 40);
        int v12 = 136315394;
        uint64_t v13 = v11;
        __int16 v14 = 2080;
        string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
        uint32_t v10 = "CSRemoteXPCProxy: Connection to '%s' terminated with error: %s";
        goto LABEL_8;
      }
    }
    else if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 136315394;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      string = xpc_type_get_name(v5);
      uint32_t v10 = "CSRemoteXPCProxy: Connection to '%s' terminated with event type: %s";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x16u);
    }

    [*(id *)(a1 + 32) safeLeaveRemoteGroup];
    [*(id *)(a1 + 32) cancelConnection];
    goto LABEL_10;
  }
  [*(id *)(a1 + 32) handleRemoteResponse:v3];
LABEL_10:
}

id sub_1000317B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) safeLeaveRemoteGroup];
}

void sub_100031AF0(id a1)
{
  dword_1000BD868 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
}

void sub_1000321DC(void *a1)
{
  id v3 = 0;
  unsigned __int8 v1 = [a1 seekToOffset:0 error:&v3];
  id v2 = v3;
  if ((v1 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006363C();
  }
}

void sub_10003292C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 248), 8);
  _Unwind_Resume(a1);
}

void sub_100032970(uint64_t a1, char *a2)
{
  id v3 = *(FILE **)(a1 + 32);
  if (v3)
  {
    fputs(a2, v3);
    unsigned __int8 v5 = *(FILE **)(a1 + 32);
    fputc(10, v5);
  }
  else
  {
    BOOL v6 = sub_10002820C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100063750();
    }

    id v7 = +[SDResourceManager sharedResourceManager];
    [v7 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:@"OSLOGCREATE Error: %s" a2];
  }
}

uint64_t sub_100032A38(uint64_t a1, uint64_t a2, const char *a3)
{
  id v7 = +[NSString stringWithUTF8String:a3];
  BOOL v8 = [@"/" stringByAppendingString:v7];

  uint64_t v9 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint32_t v10 = sub_10002820C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000638E8(v10);
    }

    uint64_t v11 = +[SDResourceManager sharedResourceManager];
    [v11 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"logarchive block timedout."];

    LODWORD(v12) = 60;
    goto LABEL_16;
  }
  memset(&v51, 0, sizeof(v51));
  bzero(v52, 0x400uLL);
  if (fstat(a2, &v51))
  {
    uint64_t v12 = *__error();
    if (fcntl(a2, 50, v52) == -1) {
      sub_100063828();
    }
    uint64_t v13 = +[NSString stringWithFormat:@"unable to stat temp fd: %s: %s (%d)", v52, strerror(v12), v12];
    uint64_t v14 = *(void *)(a1 + 56);
    goto LABEL_15;
  }
  if (sub_100056610((uint64_t)&v51))
  {
    LODWORD(v12) = *__error();
    if (fcntl(a2, 50, v52) == -1) {
      sub_100063828();
    }
    uint64_t v15 = +[NSString stringWithFormat:@"Unable to construct archive block for suspicious file: %s", v52];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000637B8();
    }
    int v16 = +[SDResourceManager sharedResourceManager];
    [v16 stderrWrite:@"%@", v15];

    id v17 = +[SDResourceManager sharedResourceManager];
    [v17 log:@"%@", v15];

    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v13 = (void *)v15;
    goto LABEL_15;
  }
  if (!strcmp(a3, "."))
  {
    if (fcopyfile(a2, *(_DWORD *)(a1 + 72), 0, 4u))
    {
      uint64_t v21 = *(void *)(a1 + 56);
      uint64_t v24 = __error();
      v43 = strerror(*v24);
      v44 = (char *)*__error();
      CFStringRef v23 = @"failed to copyfile on root node: %s (%d)";
      goto LABEL_26;
    }
    if (*(void *)(a1 + 76) && fchown(*(_DWORD *)(a1 + 72), *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 80)) == -1) {
      sub_100063828();
    }
    goto LABEL_51;
  }
  if ((v51.st_mode & 0xF000) == 0x4000)
  {
    if (mkdirat(*(_DWORD *)(a1 + 72), a3, 0x1FFu))
    {
      uint64_t v21 = *(void *)(a1 + 56);
      id v22 = __error();
      v44 = strerror(*v22);
      uint64_t v45 = *__error();
      v43 = (char *)a3;
      CFStringRef v23 = @"failed to mkdir: %s: %s (%d)";
LABEL_26:
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v43, v44, v45);
      uint64_t v12 = (uint64_t) objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v21 + 16))(v21, [(id)v12 UTF8String]);

      LODWORD(v12) = *__error();
      goto LABEL_16;
    }
    int v33 = sub_100056760(*(_DWORD *)(a1 + 72), a3, 0);
    if (v33 == -1)
    {
      uint64_t v21 = *(void *)(a1 + 56);
      v42 = __error();
      v44 = strerror(*v42);
      uint64_t v45 = *__error();
      v43 = (char *)a3;
      CFStringRef v23 = @"failed to open: %s: %s (%d)";
      goto LABEL_26;
    }
    int v34 = v33;
    if (fcopyfile(a2, v33, 0, 4u))
    {
      uint64_t v35 = __error();
      uint64_t v36 = *v35;
      uint64_t v37 = *(void *)(a1 + 56);
      uint64_t v12 = +[NSString stringWithFormat:@"failed to copyfile: %s: %s (%d)", a3, strerror(*v35), v36];
      (*(void (**)(uint64_t, id))(v37 + 16))(v37, [(id)v12 UTF8String]);

      close(v34);
      int v19 = 1;
      LODWORD(v12) = v36;
      goto LABEL_17;
    }
    if (*(void *)(a1 + 76) && fchown(v34, *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 80)) == -1) {
      sub_100063828();
    }
    close(v34);
LABEL_51:
    LODWORD(v12) = 0;
    goto LABEL_16;
  }
  if (!strcmp(a3, "Info.plist")) {
    [*(id *)(a1 + 40) extractMetricsFromInfoPlist:a2];
  }
  uint64_t v25 = [*(id *)(a1 + 40) archive];
  if (!v25) {
    goto LABEL_32;
  }
  uint64_t v26 = (void *)v25;
  long long v27 = [*(id *)(a1 + 40) archive];
  long long v28 = [v27 tarQueue];

  if (v28)
  {
    uint64_t v12 = [*(id *)(a1 + 40) archive];
    long long v29 = [(id)v12 tarQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000331A0;
    block[3] = &unk_10009DB78;
    long long v30 = *(void **)(a1 + 48);
    void block[4] = *(void *)(a1 + 40);
    id v47 = v30;
    id v48 = v8;
    id v49 = v9;
    int v50 = a2;
    dispatch_sync(v29, block);
  }
  else
  {
LABEL_32:
    id v31 = v9;
    int v32 = sub_1000566DC((const char *)[v31 fileSystemRepresentation], 2, 0x1B6u);
    if (v32 == -1)
    {
      LODWORD(v12) = *__error();
      uint64_t v38 = *(void *)(a1 + 56);
      id v39 = +[NSString stringWithFormat:@"failed to open %@", v31];
      (*(void (**)(uint64_t, id))(v38 + 16))(v38, [v39 UTF8String]);

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100063848((uint64_t)v31, v12);
      }
      __int16 v40 = +[SDResourceManager sharedResourceManager];
      [v40 stderrWrite:@"Unable to create file %@: %s", v31, strerror(v12)];

      uint64_t v41 = +[SDResourceManager sharedResourceManager];
      [v41 log:@"Unable to create file %@: %s", v31, strerror(v12)];

      goto LABEL_16;
    }
    LODWORD(v12) = v32;
    if (fcopyfile(a2, v32, 0, 0xEu) < 0)
    {
      LODWORD(v12) = *__error();
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v13 = +[NSString stringWithFormat:@"error writing file %@ - %s", v31, strerror(v12)];
LABEL_15:
      id v18 = v13;
      (*(void (**)(uint64_t, id))(v14 + 16))(v14, [v18 UTF8String]);

LABEL_16:
      int v19 = 1;
      goto LABEL_17;
    }
    close(v12);
  }
  int v19 = 0;
LABEL_17:

  if (v19) {
    return v12;
  }
  else {
    return 0;
  }
}

void sub_1000331A0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) destination];
  id v3 = [v2 lastPathComponent];
  id v7 = [v3 stringByAppendingPathComponent:*(void *)(a1 + 40)];

  id v4 = [v7 stringByAppendingPathComponent:*(void *)(a1 + 48)];
  unsigned __int8 v5 = [[SDArchiveFile alloc] initWithPath:*(void *)(a1 + 56) target:v4 ofType:NSFileTypeRegular];
  [(SDArchiveFile *)v5 setFd:*(unsigned int *)(a1 + 64)];
  BOOL v6 = [*(id *)(a1 + 32) archive];
  [v6 addArchiveFile:v5];
}

uint64_t sub_100033280(uint64_t a1)
{
  uint64_t result = OSLogConstructArchive();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

uint64_t sub_1000332B8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t sub_100033588(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = sub_100024BEC(a1);
    *(_DWORD *)long long buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = a1;
    *(_WORD *)&uint8_t buf[8] = 2112;
    *(void *)&buf[10] = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received keycode: %x with name: %@", buf, 0x12u);
  }
  id v3 = +[SDResourceManager sharedResourceManager];
  id v4 = sub_100024BEC(a1);
  [v3 stdoutWrite:@"Received keycode: %x with name: %@", a1, v4];

  unsigned __int8 v5 = +[SDResourceManager sharedResourceManager];
  BOOL v6 = sub_100024BEC(a1);
  [v5 log:@"Received keycode: %x with name: %@", a1, v6];

  kdebug_trace();
  if ((int)a1 > 5)
  {
    if (a1 == 6 || a1 == 36)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = sub_100024BEC(-2147483641);
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v16;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Legacy keychord support has been dropped. Use %@.", buf, 0xCu);
      }
      id v17 = +[SDResourceManager sharedResourceManager];
      id v18 = sub_100024BEC(-2147483641);
      [v17 stdoutWrite:@"Legacy keychord support has been dropped. Use %@.", v18];

      int v19 = +[SDResourceManager sharedResourceManager];
      __int16 v20 = sub_100024BEC(-2147483641);
      [v19 log:@"Legacy keychord support has been dropped. Use %@.", v20];

      return 4;
    }
  }
  else
  {
    if (a1 == -2147483641)
    {
      int v21 = -2147483641;
      return sub_100033BB8(v21);
    }
    if (a1 == 3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = sub_100024BEC(3);
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = "sysdiagnose (stackshot only)";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "request: %s keychord: %@", buf, 0x16u);
      }
      BOOL v8 = +[SDResourceManager sharedResourceManager];
      uint64_t v9 = sub_100024BEC(3);
      [v8 stdoutWrite:@"request: %s keychord: %@", "sysdiagnose (stackshot only)", v9];

      uint32_t v10 = +[SDResourceManager sharedResourceManager];
      uint64_t v11 = sub_100024BEC(3);
      [v10 log:@"request: %s keychord: %@", "sysdiagnose (stackshot only)", v11];

      if (sub_10002AD0C())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Keychord ignored due to settings.", buf, 2u);
        }
        uint64_t v12 = +[SDResourceManager sharedResourceManager];
        [v12 stdoutWrite:@"Keychord ignored due to settings."];

        uint64_t v13 = +[SDResourceManager sharedResourceManager];
        id v14 = v13;
        CFStringRef v15 = @"Keychord ignored due to settings.";
      }
      else
      {
        if (!sub_10002AE68())
        {
          long long v28 = (void *)os_transaction_create();
          long long v29 = dispatch_get_global_queue(25, 0);
          *(void *)long long buf = _NSConcreteStackBlock;
          *(void *)&uint8_t buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = sub_100038040;
          int v32 = &unk_10009DC58;
          id v33 = v28;
          int v34 = 3;
          id v14 = v28;
          dispatch_async(v29, buf);

          uint64_t v25 = 0;
          goto LABEL_33;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose ignored due to factory settings: com.apple.sysdiagnose factoryDisable -BOOL is TRUE", buf, 2u);
        }
        uint64_t v13 = +[SDResourceManager sharedResourceManager];
        id v14 = v13;
        CFStringRef v15 = @"Sysdiagnose ignored due to factory settings: com.apple.sysdiagnose factoryDisable -BOOL is TRUE";
      }
      [v13 log:v15];
      uint64_t v25 = 5;
LABEL_33:

      return v25;
    }
  }
  BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if ((a1 & 0x80000000) != 0)
  {
    if (v22)
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "default case hit for keycode: %x. Running full diagnostic", buf, 8u);
    }
    uint64_t v26 = +[SDResourceManager sharedResourceManager];
    [v26 stdoutWrite:@"default case hit for keycode: %x. Running full diagnostic", a1];

    long long v27 = +[SDResourceManager sharedResourceManager];
    [v27 log:@"default case hit for keycode: %x. Running full diagnostic", a1];

    int v21 = a1;
    return sub_100033BB8(v21);
  }
  if (v22)
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unexpected keycode: %x. Not running full diagnostic", buf, 8u);
  }
  CFStringRef v23 = +[SDResourceManager sharedResourceManager];
  [v23 stdoutWrite:@"unexpected keycode: %x. Not running full diagnostic", a1];

  uint64_t v24 = +[SDResourceManager sharedResourceManager];
  [v24 log:@"unexpected keycode: %x. Not running full diagnostic", a1];

  return 4;
}

uint64_t sub_100033BB8(int a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = sub_100024BEC(a1);
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "sysdiagnose (full)";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "request: %s keychord: %@", buf, 0x16u);
  }
  id v3 = +[SDResourceManager sharedResourceManager];
  id v4 = sub_100024BEC(a1);
  [v3 stdoutWrite:@"request: %s keychord: %@", "sysdiagnose (full)", v4];

  unsigned __int8 v5 = +[SDResourceManager sharedResourceManager];
  BOOL v6 = sub_100024BEC(a1);
  [v5 log:@"request: %s keychord: %@", "sysdiagnose (full)", v6];

  if (sub_10002AD0C())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Keychord ignored due to settings.", buf, 2u);
    }
    id v7 = +[SDResourceManager sharedResourceManager];
    [v7 stdoutWrite:@"Keychord ignored due to settings."];

    BOOL v8 = +[SDResourceManager sharedResourceManager];
    [(SystemDiagnosticiOS *)v8 log:@"Keychord ignored due to settings."];
LABEL_11:
    uint64_t v9 = 5;
    goto LABEL_31;
  }
  if (sub_10002AE68())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose ignored due to factory settings: com.apple.sysdiagnose factoryDisable -BOOL is TRUE", buf, 2u);
    }
    BOOL v8 = +[SDResourceManager sharedResourceManager];
    [(SystemDiagnosticiOS *)v8 log:@"Sysdiagnose ignored due to factory settings: com.apple.sysdiagnose factoryDisable -BOOL is TRUE"];
    goto LABEL_11;
  }
  sub_100037D14();
  if (sub_100048604())
  {
    if (objc_opt_class())
    {
      *(void *)uint64_t v36 = 0;
      uint64_t v37 = v36;
      uint64_t v38 = 0x2020000000;
      char v39 = 0;
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      uint64_t v11 = +[TapToRadarService shared];
      *(void *)long long buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_100037ED4;
      uint64_t v41 = &unk_10009DC30;
      v43 = v36;
      uint64_t v12 = v10;
      v42 = v12;
      [v11 performSysdiagnoseKeychordEventWithCompletionHandler:buf];

      dispatch_time_t v13 = dispatch_time(0, 3500000000);
      if (dispatch_semaphore_wait(v12, v13))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v35 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out waiting for Tap-to-Radar. Assuming we should handle this keychord", v35, 2u);
        }
        id v14 = +[SDResourceManager sharedResourceManager];
        [v14 stdoutWrite:@"Timed out waiting for Tap-to-Radar. Assuming we should handle this keychord"];

        CFStringRef v15 = +[SDResourceManager sharedResourceManager];
        [v15 log:@"Timed out waiting for Tap-to-Radar. Assuming we should handle this keychord"];
      }
      BOOL v16 = v37[24] == 0;

      _Block_object_dispose(v36, 8);
      if (!v16)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Keychord is being handled by ttr. Terminating and waiting to be invoked through DE", buf, 2u);
        }
        id v17 = +[SDResourceManager sharedResourceManager];
        [v17 stdoutWrite:@"Keychord is being handled by ttr. Terminating and waiting to be invoked through DE"];

        BOOL v8 = +[SDResourceManager sharedResourceManager];
        [(SystemDiagnosticiOS *)v8 log:@"Keychord is being handled by ttr. Terminating and waiting to be invoked through DE"];
        uint64_t v9 = 0;
        goto LABEL_31;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v36 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TapToRadarKit framework is not available", v36, 2u);
      }
      id v18 = +[SDResourceManager sharedResourceManager];
      [v18 stdoutWrite:@"TapToRadarKit framework is not available"];

      int v19 = +[SDResourceManager sharedResourceManager];
      [v19 log:@"TapToRadarKit framework is not available"];
    }
  }
  BOOL v8 = objc_alloc_init(SystemDiagnosticiOS);
  __int16 v20 = +[SDResourceManager sharedResourceManager];
  int v21 = [(SystemDiagnostic *)v8 diagnosticID];
  unsigned int v22 = [v20 checkAndIncreaseDiagnosticCountForDiagnosticID:v21 collectingLocalLogs:1];

  if (v22)
  {
    CFStringRef v23 = +[SDResourceManager sharedResourceManager];
    [v23 setCurrentClient:@"KEYCHORD"];

    uint64_t v24 = (void *)os_transaction_create();
    uint64_t v25 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100037DC0;
    block[3] = &unk_10009D2B8;
    id v33 = v24;
    int v34 = v8;
    id v26 = v24;
    dispatch_async(v25, block);

    uint64_t v9 = 0;
    long long v27 = v33;
  }
  else
  {
    sub_100029204(1);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      long long v28 = sub_100024BEC(a1);
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v28;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose already in progress - ignoring keychord %@", buf, 0xCu);
    }
    long long v29 = +[SDResourceManager sharedResourceManager];
    long long v30 = sub_100024BEC(a1);
    [v29 stdoutWrite:@"sysdiagnose already in progress - ignoring keychord %@", v30];

    id v26 = +[SDResourceManager sharedResourceManager];
    long long v27 = sub_100024BEC(a1);
    [v26 log:@"sysdiagnose already in progress - ignoring keychord %@", v27];
    uint64_t v9 = 5;
  }

LABEL_31:
  return v9;
}

void sub_100034288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000342A8(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 | a3[1] | a3[2] | a3[3]) {
    return 5;
  }
  else {
    return sub_100033588(a2);
  }
}

uint64_t sub_1000342D0()
{
  return 46;
}

uint64_t sub_1000342D8()
{
  if (task_get_special_port(mach_task_self_, 4, &bootstrap_port)) {
    sub_1000639B8(&v7, port_info);
  }
  if (bootstrap_check_in(bootstrap_port, "com.apple.sysdiagnose.kernel.ipc", (mach_port_t *)&dword_1000BD880)) {
    sub_10006392C(&v7, port_info);
  }
  port_info[0] = 16;
  if (mach_port_set_attributes(mach_task_self_, dword_1000BD880, 1, port_info, 1u)) {
    _os_assumes_log();
  }
  BOOL v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  uint64_t v1 = dispatch_queue_create("Sysdiagnose MIG RECV Queue", v0);
  dispatch_source_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, dword_1000BD880, 0, v1);
  id v3 = (void *)qword_1000BD878;
  qword_1000BD878 = (uint64_t)v2;

  dispatch_source_set_cancel_handler((dispatch_source_t)qword_1000BD878, &stru_10009DBE8);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000BD878, &stru_10009DC08);
  dispatch_resume((dispatch_object_t)qword_1000BD878);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MIG server initialized.", (uint8_t *)&v7, 2u);
  }
  id v4 = +[SDResourceManager sharedResourceManager];
  [v4 stdoutWrite:@"MIG server initialized."];

  unsigned __int8 v5 = +[SDResourceManager sharedResourceManager];
  [v5 log:@"MIG server initialized."];

  return 0;
}

void sub_1000344D8(id a1)
{
  if (mach_port_mod_refs(mach_task_self_, dword_1000BD880, 1u, -1)) {
    _os_assumes_log();
  }
}

void sub_10003451C(id a1)
{
  if (dispatch_mig_server()) {
    _os_assumes_log();
  }
}

id sub_100034560(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = dispatch_group_create();
  unsigned __int8 v5 = [v3 componentsSeparatedByString:@"remote:"];
  BOOL v6 = [v5 lastObject];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Remote archive request for %@", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v7 = +[SDCacheEnumerator sysdiagnoseDirectory];
  BOOL v8 = [v7 stringByAppendingPathComponent:v6];

  uint64_t v9 = +[NSFileManager defaultManager];
  unsigned int v10 = [v9 fileExistsAtPath:v8];

  if (v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Archive already exists", (uint8_t *)&v21, 2u);
    }
    goto LABEL_12;
  }
  if (v4)
  {
    uint64_t v11 = +[SystemDiagnosticIDS sharedInstance];
    uint64_t v12 = [v11 executionGroupDictionary];
    [v12 setObject:v4 forKey:v6];

    dispatch_group_enter(v4);
    dispatch_time_t v13 = +[SystemDiagnosticIDS sharedInstance];
    [v13 sendRemoteArchiveMessage:v6];

    dispatch_time_t v14 = dispatch_time(0, 1801000000000);
    if (dispatch_group_wait(v4, v14) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out waiting for file transfer from watch for %@", (uint8_t *)&v21, 0xCu);
    }
    CFStringRef v15 = +[NSFileManager defaultManager];
    unsigned __int8 v16 = [v15 fileExistsAtPath:v8];

    if (v16)
    {
      id v17 = +[SystemDiagnosticIDS sharedInstance];
      id v18 = [v17 executionGroupDictionary];
      [v18 removeObjectForKey:v6];

LABEL_12:
      *a2 = 0;
      id v19 = v8;
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Archive not received", (uint8_t *)&v21, 0xCu);
    }
  }
  id v19 = 0;
  *a2 = 4;
LABEL_16:

  return v19;
}

void sub_100034894(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    dispatch_source_t v2 = +[SystemDiagnosticIDS sharedInstance];
    id v3 = [v2 executionGroupDictionary];
    id v4 = [v3 objectForKey:v1];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v23 = v1;
      __int16 v24 = 1024;
      BOOL v25 = v4 != 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Looking for dispatch_group for diagnostic id %@. Found ? %d", buf, 0x12u);
    }
    unsigned __int8 v5 = +[SDResourceManager sharedResourceManager];
    [v5 log:@"Looking for dispatch_group for diagnostic id %@. Found ? %d", v1, v4 != 0];

    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Waiting for the execution group.", buf, 2u);
      }
      BOOL v6 = +[SDResourceManager sharedResourceManager];
      [v6 stdoutWrite:@"Waiting for the execution group."];

      uint64_t v7 = +[SDResourceManager sharedResourceManager];
      [v7 log:@"Waiting for the execution group."];

      dispatch_time_t v8 = dispatch_time(0, 1801000000000);
      intptr_t v9 = dispatch_group_wait(v4, v8);
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v10)
        {
          uint64_t v11 = +[SystemDiagnosticIDS sharedInstance];
          uint64_t v12 = [v11 executionGroupDictionary];
          *(_DWORD *)long long buf = 138412290;
          id v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out waiting for execution group. Available: %@", buf, 0xCu);
        }
        dispatch_time_t v13 = +[SDResourceManager sharedResourceManager];
        dispatch_time_t v14 = +[SystemDiagnosticIDS sharedInstance];
        CFStringRef v15 = [v14 executionGroupDictionary];
        [v13 stdoutWrite:@"Timed out waiting for execution group. Available: %@", v15];

        unsigned __int8 v16 = +[SDResourceManager sharedResourceManager];
        id v17 = +[SystemDiagnosticIDS sharedInstance];
        id v18 = [v17 executionGroupDictionary];
        [v16 log:@"Timed out waiting for execution group. Available: %@", v18];
      }
      else
      {
        if (v10)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Execution group has returned successfully", buf, 2u);
        }
        id v19 = +[SDResourceManager sharedResourceManager];
        [v19 stdoutWrite:@"Execution group has returned successfully"];

        unsigned __int8 v16 = +[SDResourceManager sharedResourceManager];
        [v16 log:@"Execution group has returned successfully"];
      }
    }
    __int16 v20 = +[SDResourceManager sharedResourceManager];
    int v21 = [v20 diagnosticObjectForDiagnosticID:v1];

    [v21 waitUntilComplete:2400];
  }
}

uint64_t sub_100034C30(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[CSCoordinator sharedInstance];
  unsigned int v5 = [v4 isAutomaticCoSysdiagnosePossible];

  BOOL v6 = +[CSCoordinator sharedInstance];
  unsigned int v7 = [v6 getCollectAllTrustedForDiagnosticID:v3];

  if (a2) {
    int v8 = 1;
  }
  else {
    int v8 = v5;
  }
  return v8 | v7;
}

void sub_100034CBC(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Remote XPC Stackshot: stackshot only", buf, 2u);
    }
    int v8 = +[SDResourceManager sharedResourceManager];
    intptr_t v9 = v8;
    CFStringRef v10 = @"Remote XPC Stackshot: stackshot only";
  }
  else
  {
    if (v7)
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPC: stackshot only", v12, 2u);
    }
    int v8 = +[SDResourceManager sharedResourceManager];
    intptr_t v9 = v8;
    CFStringRef v10 = @"XPC: stackshot only";
  }
  [v8 stdoutWrite:v10];

  uint64_t v11 = +[SDResourceManager sharedResourceManager];
  [v11 log:v10];

  sub_100025FBC(40);
  xpc_dictionary_set_uint64(v6, "RESPONSE_TYPE", 1uLL);
}

id sub_100034E04(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary) {
    sub_100063BB8(v305, buf);
  }
  unsigned __int16 uint64 = xpc_dictionary_get_uint64(v6, "REQUEST_TYPE");
  intptr_t v9 = sub_100024D58(uint64);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received request of type '%@'", buf, 0xCu);
  }
  if (!v5)
  {
    CFStringRef v10 = xpc_copy_description(v6);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received Remote request: %s", buf, 0xCu);
    }
    uint64_t v11 = +[SDResourceManager sharedResourceManager];
    [v11 log:@"Received Remote request: %s", v10];

    free(v10);
  }
  xpc_dictionary_set_uint64(v7, "REQUEST_TYPE", uint64);
  xpc_dictionary_set_uint64(v7, "MSG_TYPE", 2uLL);
  switch(uint64)
  {
    case 1u:
      uint64_t v12 = (_xpc_connection_s *)v5;
      id v264 = v6;
      id v13 = v6;
      id v14 = v7;
      id v268 = v5;
      xdict = v13;
      v287 = v12;
      if (!v5)
      {
        v121 = +[SDResourceManager sharedResourceManager];
        [v121 setPossibleClient:@"REMOTE"];

        unsigned __int16 v15 = 5;
        goto LABEL_139;
      }
      if (xpc_dictionary_get_BOOL(v13, "SDRequestSourceShell")) {
        unsigned __int16 v15 = 2;
      }
      else {
        unsigned __int16 v15 = 3;
      }
      uint64_t pid = xpc_connection_get_pid(v12);
      uint64_t v301 = 0;
      memset(v300, 0, sizeof(v300));
      long long v298 = 0u;
      long long v299 = 0u;
      memset(buf, 0, sizeof(buf));
      unsigned int v17 = proc_pidinfo(pid, 3, 0, buf, 136);
      id v18 = +[NSString stringWithUTF8String:v300];
      id v19 = +[SDResourceManager sharedResourceManager];
      [v19 setPossibleClient:v18];

      BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v17 > 0x87)
      {
        if (v20)
        {
          *(_DWORD *)v305 = 136446466;
          *(void *)&v305[4] = v300;
          *(_WORD *)&v305[12] = 1024;
          *(_DWORD *)&v305[14] = pid;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose request from %{public}s (%d)", v305, 0x12u);
        }
        int v21 = +[SDResourceManager sharedResourceManager];
        [v21 log:@"Sysdiagnose request from %{public}s (%d)", v300, pid];
      }
      else
      {
        if (v20)
        {
          *(_DWORD *)v305 = 67109120;
          *(_DWORD *)&v305[4] = pid;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to obtain requestor process name. Pid is %d", v305, 8u);
        }
        int v21 = +[SDResourceManager sharedResourceManager];
        [v21 log:@"Failed to obtain requestor process name. Pid is %d", pid, v260];
      }

      v129 = xdict;
      xpc_dictionary_set_int64(xdict, "clientPID", (int)pid);
      if ((sub_100025658(pid) & 1) != 0
        || (sub_100048358(v287, @"com.apple.private.sysdiagnose.internal") & 1) != 0)
      {
        goto LABEL_139;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v305 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Peer is not allowed", v305, 2u);
      }
      v130 = +[SDResourceManager sharedResourceManager];
      [v130 log:@"Peer is not allowed"];

      xpc_dictionary_set_string(xdict, "warnProcAllowlist", (const char *)v300);
      if (sub_100048604())
      {
LABEL_139:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          id v131 = [@"XPC: sysdiagnose (full)" UTF8String];
          *(_DWORD *)long long buf = 136315138;
          *(void *)&uint8_t buf[4] = v131;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
        }
        v132 = +[SDResourceManager sharedResourceManager];
        [v132 stdoutWrite:@"%s", @"XPC: sysdiagnose (full)"];

        v133 = +[SDResourceManager sharedResourceManager];
        [v133 log:@"%s", @"XPC: sysdiagnose (full)"];

        BOOL v134 = xpc_dictionary_get_BOOL(xdict, "getMetrics");
        *(void *)v312 = 0;
        *(void *)&long long v308 = 0;
        if (v134)
        {
          *(void *)v302 = 0;
          v135 = (id *)v302;
          v136 = sub_100038234(v15, xdict, (id *)&v308, v312, v302);
          id v137 = (id)v308;
        }
        else
        {
          v135 = (id *)&v308;
          v136 = sub_100038234(v15, xdict, 0, v312, &v308);
          id v137 = 0;
        }
        id v138 = *v135;
        unint64_t v139 = *(void *)v312;
        if (*(void *)v312 <= 0xEuLL)
        {
          if (((1 << v312[0]) & 0x7252) != 0)
          {
            v140 = +[SDResourceManager sharedResourceManager];
            [v140 decreaseDiagnosticCountForDiagnosticID:v138];
          }
          else if (!*(void *)v312)
          {
            id v142 = v136;
            xpc_dictionary_set_string(v14, "path", (const char *)[v142 cStringUsingEncoding:4]);
            if (v137) {
              BOOL v177 = v134;
            }
            else {
              BOOL v177 = 0;
            }
            if (v177)
            {
              v274 = v9;
              id v280 = v7;
              v178 = [v137 allKeys];
              memset(v305, 0, sizeof(v305));
              long long v306 = 0u;
              long long v307 = 0u;
              id v179 = [v178 countByEnumeratingWithState:v305 objects:buf count:16];
              if (v179)
              {
                id v180 = v179;
                uint64_t v181 = **(void **)&v305[16];
                do
                {
                  for (uint64_t i = 0; i != v180; uint64_t i = (char *)i + 1)
                  {
                    if (**(void **)&v305[16] != v181) {
                      objc_enumerationMutation(v178);
                    }
                    v183 = *(void **)(*(void *)&v305[8] + 8 * i);
                    v184 = [v137 objectForKey:v183];
                    v185 = (const char *)[v183 UTF8String];
                    [v184 doubleValue];
                    xpc_dictionary_set_double(v14, v185, v186);
                  }
                  id v180 = [v178 countByEnumeratingWithState:v305 objects:buf count:16];
                }
                while (v180);
              }

              intptr_t v9 = v274;
              id v7 = v280;
            }
            xpc_dictionary_set_uint64(v14, "RESPONSE_TYPE", 1uLL);

            goto LABEL_148;
          }
        }
        xpc_dictionary_set_uint64(v14, "RESPONSE_TYPE", 2uLL);
        sub_100023FB0(v139);
        id v141 = objc_claimAutoreleasedReturnValue();
        xpc_dictionary_set_string(v14, "error", (const char *)[v141 UTF8String]);

        id v142 = 0;
LABEL_148:
        v129 = xdict;
        goto LABEL_149;
      }
      v231 = +[SDResourceManager sharedResourceManager];
      [v231 decreaseDiagnosticCount];

      xpc_dictionary_set_uint64(v14, "RESPONSE_TYPE", 2uLL);
      sub_100023FB0(0xFuLL);
      id v138 = objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_string(v14, "error", (const char *)[v138 UTF8String]);
      id v142 = 0;
LABEL_149:

      id v6 = v264;
      id v5 = v268;
      goto LABEL_256;
    case 2u:
      sub_100034CBC(v6, v7, v5 == 0);
      goto LABEL_255;
    case 4u:
      v271 = v9;
      id v23 = (_xpc_connection_s *)v5;
      id v277 = v7;
      id v24 = v7;
      if (v5)
      {
        BOOL v25 = +[SDResourceManager sharedResourceManager];
        unsigned __int8 v26 = [v25 areDiagnosticsInFlight];

        if (v26)
        {
          uint64_t v27 = xpc_connection_get_pid(v23);
          int v28 = v27;
          unsigned __int8 v29 = sub_100025AA8(v27);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v28;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Server received programmatic cancel request from peer with pid %d.", buf, 8u);
          }
          if (v29)
          {
            if (sub_100048604())
            {
              long long v30 = +[SDResourceManager sharedResourceManager];
              id v31 = [v30 getCurrentInflightLocalDiagnostic];

              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                *(void *)&uint8_t buf[4] = v31;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Peer is TTR - using in-flight diagnostic with ID %@", buf, 0xCu);
              }
LABEL_180:
              if (v31)
              {
                v170 = +[SDResourceManager sharedResourceManager];
                [v170 registerActivityWithID:v31];

                v171 = +[SDResourceManager sharedResourceManager];
                [v171 cancelAll:v31];

                +[SDTaskDepot signalStopTasks];
                v172 = +[SDResourceManager sharedResourceManager];
                [v172 closeSysdiagnoseLog];

                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Waiting for sysdiagnose to cleanup", buf, 2u);
                }
                v173 = +[SDResourceManager sharedResourceManager];
                [v173 stdoutWrite:@"Waiting for sysdiagnose to cleanup"];

                v174 = +[SDResourceManager sharedResourceManager];
                [v174 log:@"Waiting for sysdiagnose to cleanup"];

                v175 = +[SDResourceManager sharedResourceManager];
                v176 = [v175 diagnosticObjectForDiagnosticID:v31];

                if ([v176 waitUntilComplete:60])
                {
                  xpc_dictionary_set_uint64(v24, "RESPONSE_TYPE", 1uLL);
                }
                else
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose took too long to cancel.", buf, 2u);
                  }
                  v206 = +[SDResourceManager sharedResourceManager];
                  [v206 stdoutWrite:@"Sysdiagnose took too long to cancel."];

                  v207 = +[SDResourceManager sharedResourceManager];
                  [v207 log:@"Sysdiagnose took too long to cancel."];

                  sub_1000378B8(v24, 8uLL);
                }
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Goodbye!", buf, 2u);
                }
                v208 = +[SDResourceManager sharedResourceManager];
                [v208 stdoutWrite:@"Goodbye!"];

                v209 = +[SDResourceManager sharedResourceManager];
                [v209 log:@"Goodbye!"];
              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No diagnostic is associated with client - abort cancellation.", buf, 2u);
                }
                sub_1000378B8(v24, 0xAuLL);
              }

LABEL_224:
              id v142 = 0;
              intptr_t v9 = v271;
              id v7 = v277;
              goto LABEL_256;
            }
          }
          else
          {
            v165 = +[SystemDiagnosticIDS sharedInstance];
            unsigned int v166 = [v165 isPaired];

            if (v166)
            {
              v167 = +[SystemDiagnosticIDS sharedInstance];
              [v167 sendMessage:2];
            }
          }
          v168 = +[SDResourceManager sharedResourceManager];
          v169 = +[NSNumber numberWithLongLong:v28];
          id v31 = [v168 getDiagnosticIDForPid:v169];

          goto LABEL_180;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Server received programmatic cancel request when no sysdiagnose in flight.", buf, 2u);
        }
        v123 = v24;
        uint64_t v124 = 7;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cancel operation not implemented", buf, 2u);
        }
        v122 = +[SDResourceManager sharedResourceManager];
        [v122 log:@"Cancel operation not implemented"];

        v123 = v24;
        uint64_t v124 = 9;
      }
      sub_1000378B8(v123, v124);
      goto LABEL_224;
    case 5u:
      int v32 = v9;
      id v33 = v7;
      BOOL v34 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (!v5)
      {
        if (v34)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CancelAll operation not implemented", buf, 2u);
        }
        v125 = +[SDResourceManager sharedResourceManager];
        [v125 log:@"CancelAll operation not implemented"];

        uint64_t v41 = v33;
        uint64_t v42 = 9;
        goto LABEL_113;
      }
      if (v34)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Server received cancelAll request.", buf, 2u);
      }
      uint64_t v35 = +[SystemDiagnosticIDS sharedInstance];
      unsigned int v36 = [v35 isPaired];

      if (v36)
      {
        uint64_t v37 = +[SystemDiagnosticIDS sharedInstance];
        [v37 sendMessage:2];
      }
      uint64_t v38 = +[SDResourceManager sharedResourceManager];
      [v38 clearAllResources];

      +[SDTaskDepot signalStopTasks];
      char v39 = +[SDResourceManager sharedResourceManager];
      id v40 = [v39 numberDiagnosticsInflight];

      if (v40)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "There are still sysdiagnoses in-flight after cancellation.", buf, 2u);
        }
        uint64_t v41 = v33;
        uint64_t v42 = 3;
LABEL_113:
        sub_1000378B8(v41, v42);
        goto LABEL_171;
      }
      xpc_dictionary_set_uint64(v33, "RESPONSE_TYPE", 1uLL);
LABEL_171:

      id v142 = 0;
      intptr_t v9 = v32;
      goto LABEL_256;
    case 6u:
      id v43 = v7;
      id v44 = v43;
      if (v5)
      {
        xpc_dictionary_set_uint64(v43, "RESPONSE_TYPE", 1uLL);
        +[SDTaskDepot signalInterrupt];
        goto LABEL_120;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "UserInterrupt operation not implemented", buf, 2u);
      }
      v126 = +[SDResourceManager sharedResourceManager];
      [v126 log:@"UserInterrupt operation not implemented"];

      goto LABEL_119;
    case 7u:
      id v44 = v7;
      if (v5)
      {
        uint64_t v45 = +[SDResourceManager sharedResourceManager];
        unsigned int v46 = [v45 areDiagnosticsInFlight];

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v46;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Polling sysdiagnose status: %d", buf, 8u);
        }
        xpc_dictionary_set_uint64(v44, "RESPONSE_TYPE", 1uLL);
        if (v46) {
          id v47 = "Running";
        }
        else {
          id v47 = "Idle";
        }
        xpc_dictionary_set_string(v44, "status", v47);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Status Poll not implemented", buf, 2u);
        }
LABEL_119:
        sub_1000378B8(v44, 9uLL);
      }
LABEL_120:

      goto LABEL_255;
    case 8u:
      id v48 = v6;
      id v49 = v7;
      if (objc_opt_class())
      {
        id xdicta = v49;
        id v265 = v6;
        id v269 = v5;
        uint64_t v50 = objc_opt_class();
        uint64_t v51 = objc_opt_class();
        uint64_t v52 = objc_opt_class();
        uint64_t v53 = objc_opt_class();
        long long v54 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v50, v51, v52, v53, objc_opt_class(), 0);
        *(void *)v305 = 0;
        data = xpc_dictionary_get_data(v48, "detail", (size_t *)v305);
        if (data)
        {
          uint64_t v56 = +[NSData dataWithBytes:data length:*(void *)v305];
          if (v56)
          {
            v57 = (void *)v56;
            *(void *)v312 = 0;
            id v58 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v54 fromData:v56 error:v312];
            id v59 = *(id *)v312;
            long long v60 = v59;
            if (v58)
            {

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v58 = v58;
                id v49 = xdicta;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 136315394;
                  *(void *)&uint8_t buf[4] = "detail";
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v58;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting %s to %@", buf, 0x16u);
                }
                v61 = +[SDResourceManager sharedResourceManager];
                [v61 log:@"Setting %s to %@", "detail", v58];

                v62 = v58;
                goto LABEL_230;
              }
LABEL_229:
              v62 = 0;
              id v49 = xdicta;
LABEL_230:

              v213 = +[NSMutableArray array];
              memset(v305, 0, sizeof(v305));
              long long v306 = 0u;
              long long v307 = 0u;
              id v214 = v62;
              id v215 = [v214 countByEnumeratingWithState:v305 objects:buf count:16];
              if (v215)
              {
                id v216 = v215;
                id v289 = v48;
                v276 = v9;
                id v282 = v7;
                v217 = 0;
                uint64_t v218 = **(void **)&v305[16];
                do
                {
                  v219 = 0;
                  v220 = v217;
                  do
                  {
                    if (**(void **)&v305[16] != v218) {
                      objc_enumerationMutation(v214);
                    }
                    v221 = *(void **)(*(void *)&v305[8] + 8 * (void)v219);
                    v222 = +[SDCacheEnumerator sysdiagnoseDirectory];
                    v223 = [v221 lastPathComponent];
                    v217 = [v222 stringByAppendingPathComponent:v223];

                    [v213 addObject:v217];
                    v219 = (char *)v219 + 1;
                    v220 = v217;
                  }
                  while (v216 != v219);
                  id v216 = [v214 countByEnumeratingWithState:v305 objects:buf count:16];
                }
                while (v216);

                intptr_t v9 = v276;
                id v7 = v282;
                id v48 = v289;
                id v49 = xdicta;
              }

              id v224 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.SysViewService" viewControllerClassName:@"ShareSheetViewControllerProxy"];
              id v225 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
              *(void *)v302 = @"Path";
              *(void *)&long long v308 = v213;
              v226 = +[NSDictionary dictionaryWithObjects:&v308 forKeys:v302 count:1];
              [v225 setUserInfo:v226];

              id v227 = +[SBSRemoteAlertHandle newHandleWithDefinition:v224 configurationContext:v225];
              [v227 activateWithContext:0];
              xpc_dictionary_set_uint64(v49, "RESPONSE_TYPE", 1uLL);

              id v6 = v265;
              id v5 = v269;
              goto LABEL_239;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v210 = [v60 localizedDescription];
              *(_DWORD *)long long buf = 136315394;
              *(void *)&uint8_t buf[4] = "detail";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v210;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error fetching key '%s': %@", buf, 0x16u);
            }
            v211 = +[SDResourceManager sharedResourceManager];
            v212 = [v60 localizedDescription];
            [v211 log:@"Error fetching key '%s': %@", "detail", v212];
          }
        }
        id v58 = 0;
        goto LABEL_229;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Airdrop not implemented", buf, 2u);
      }
      v127 = +[SDResourceManager sharedResourceManager];
      [v127 log:@"Airdrop not implemented"];

      sub_1000378B8(v49, 9uLL);
LABEL_239:

      goto LABEL_240;
    case 9u:
      id v63 = v7;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "watch archivelist", buf, 2u);
      }
      v64 = +[SystemDiagnosticIDS sharedInstance];
      unsigned __int8 v65 = [v64 isPaired];

      BOOL v66 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v65)
      {
        if (v66)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is paired", buf, 2u);
        }
        v67 = sub_100024FA0();
        v68 = dispatch_group_create();
        if (v68)
        {
          v69 = +[SystemDiagnosticIDS sharedInstance];
          v70 = [v69 executionGroupDictionary];
          [v70 setObject:v68 forKey:v67];

          dispatch_group_enter(v68);
          v71 = +[SystemDiagnosticIDS sharedInstance];
          [v71 sendWatchListWithDiagnosticId:v67];

          dispatch_time_t v72 = dispatch_time(0, 5000000000);
          if (dispatch_group_wait(v68, v72))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out waiting for the list of watch archives", buf, 2u);
            }
          }
          else
          {
            v288 = v68;
            v194 = +[SystemDiagnosticIDS sharedInstance];
            v195 = [v194 executionGroupDictionary];
            v196 = [v195 objectForKey:v67];

            if (v196)
            {
              v197 = +[SystemDiagnosticIDS sharedInstance];
              v198 = [v197 executionGroupDictionary];
              [v198 removeObjectForKey:v67];

              if ([v196 count])
              {
                id objb = v63;
                v275 = v9;
                id v281 = v7;
                xpc_object_t v199 = xpc_array_create(0, 0);
                memset(v305, 0, sizeof(v305));
                long long v306 = 0u;
                long long v307 = 0u;
                id v200 = v196;
                id v201 = [v200 countByEnumeratingWithState:v305 objects:buf count:16];
                if (v201)
                {
                  id v202 = v201;
                  uint64_t v203 = **(void **)&v305[16];
                  do
                  {
                    for (j = 0; j != v202; j = (char *)j + 1)
                    {
                      if (**(void **)&v305[16] != v203) {
                        objc_enumerationMutation(v200);
                      }
                      id v205 = [@"remote:" stringByAppendingString:*(void *)(*(void *)&v305[8] + 8 * (void)j)];
                      xpc_array_set_string(v199, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v205 UTF8String]);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v312 = 138412290;
                        *(void *)&v312[4] = v205;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Adding path %@", v312, 0xCu);
                      }
                    }
                    id v202 = [v200 countByEnumeratingWithState:v305 objects:buf count:16];
                  }
                  while (v202);
                }

                id v63 = objb;
                xpc_dictionary_set_value(objb, "archive_list", v199);
                xpc_dictionary_set_uint64(objb, "RESPONSE_TYPE", 1uLL);

                intptr_t v9 = v275;
                id v7 = v281;
                v68 = v288;
                goto LABEL_253;
              }
            }
            else
            {
              xpc_dictionary_set_uint64(v63, "RESPONSE_TYPE", 1uLL);
              v232 = +[SystemDiagnosticIDS sharedInstance];
              v233 = [v232 executionGroupDictionary];
              [v233 removeObjectForKey:v67];
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No archives present on the watch", buf, 2u);
            }

            v68 = v288;
          }
          v234 = +[SystemDiagnosticIDS sharedInstance];
          v235 = [v234 executionGroupDictionary];
          [v235 removeObjectForKey:v67];
        }
        xpc_dictionary_set_uint64(v63, "RESPONSE_TYPE", 2uLL);
LABEL_253:

        goto LABEL_254;
      }
      if (v66)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device not paired", buf, 2u);
      }
      xpc_dictionary_set_uint64(v63, "RESPONSE_TYPE", 2uLL);
LABEL_254:

      goto LABEL_255;
    case 0xAu:
      id v48 = v6;
      id v73 = v7;
      v74 = v73;
      if (!v5)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Delete Archive not implemented", buf, 2u);
        }
        v128 = +[SDResourceManager sharedResourceManager];
        [v128 log:@"Delete Archive not implemented"];

        sub_1000378B8(v74, 9uLL);
LABEL_127:

LABEL_240:
LABEL_255:
        id v142 = 0;
        goto LABEL_256;
      }
      id v263 = v73;
      v272 = v9;
      id v278 = v7;
      uint64_t v75 = objc_opt_class();
      uint64_t v76 = objc_opt_class();
      uint64_t v77 = objc_opt_class();
      uint64_t v78 = objc_opt_class();
      uint64_t v79 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v75, v76, v77, v78, objc_opt_class(), 0);
      *(void *)v305 = 0;
      v80 = xpc_dictionary_get_data(v48, "detail", (size_t *)v305);
      v262 = (void *)v79;
      if (v80
        && (+[NSData dataWithBytes:v80 length:*(void *)v305],
            (uint64_t v81 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v82 = (void *)v81;
        id v295 = 0;
        v83 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v79 fromData:v81 error:&v295];
        id v84 = v295;
        v85 = v84;
        if (v83)
        {

          objc_opt_class();
          intptr_t v9 = v272;
          if (objc_opt_isKindOfClass())
          {
            id v86 = v83;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315394;
              *(void *)&uint8_t buf[4] = "detail";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v86;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting %s to %@", buf, 0x16u);
            }
            id v261 = v48;
            id v266 = v6;
            id v270 = v5;
            v87 = +[SDResourceManager sharedResourceManager];
            [v87 log:@"Setting %s to %@", "detail", v86];

            id v88 = v86;
            xdictb = +[NSFileManager defaultManager];
            id v89 = objc_alloc_init((Class)NSMutableArray);
            *(_OWORD *)v312 = 0u;
            long long v313 = 0u;
            long long v314 = 0u;
            long long v315 = 0u;
            id v90 = v88;
            id v91 = [v90 countByEnumeratingWithState:v312 objects:buf count:16];
            id obj = v90;
            if (v91)
            {
              id v92 = v91;
              v93 = 0;
              uint64_t v94 = *(void *)v313;
              do
              {
                v95 = 0;
                v96 = v93;
                do
                {
                  if (*(void *)v313 != v94) {
                    objc_enumerationMutation(obj);
                  }
                  v97 = *(void **)(*(void *)&v312[8] + 8 * (void)v95);
                  v98 = +[SDCacheEnumerator sysdiagnoseDirectory];
                  v99 = [v97 lastPathComponent];
                  v93 = [v98 stringByAppendingPathComponent:v99];

                  [v89 addObject:v93];
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v302 = 138412290;
                    *(void *)&v302[4] = v93;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "File to delete: %@", v302, 0xCu);
                  }
                  v100 = +[SDResourceManager sharedResourceManager];
                  [v100 log:@"File to delete: %@", v93];

                  v95 = (char *)v95 + 1;
                  v96 = v93;
                }
                while (v92 != v95);
                id v90 = obj;
                id v92 = [obj countByEnumeratingWithState:v312 objects:buf count:16];
              }
              while (v92);
            }
            else
            {
              v93 = 0;
            }

            long long v310 = 0u;
            long long v311 = 0u;
            long long v308 = 0u;
            long long v309 = 0u;
            id v237 = v89;
            id v238 = [v237 countByEnumeratingWithState:&v308 objects:v305 count:16];
            if (v238)
            {
              id v239 = v238;
              id v240 = 0;
              uint64_t v290 = *(void *)v309;
              char v241 = 1;
              id v283 = v237;
              do
              {
                v242 = 0;
                v243 = v240;
                do
                {
                  if (*(void *)v309 != v290) {
                    objc_enumerationMutation(v283);
                  }
                  uint64_t v244 = *(void *)(*((void *)&v308 + 1) + 8 * (void)v242);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v302 = 138412290;
                    *(void *)&v302[4] = v244;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deleting element: %@", v302, 0xCu);
                  }
                  v245 = +[SDResourceManager sharedResourceManager];
                  [v245 log:@"Deleting element: %@", v244];

                  id v296 = v243;
                  unsigned __int8 v246 = [xdictb removeItemAtPath:v244 error:&v296];
                  id v240 = v296;

                  if ((v246 & 1) == 0)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      v247 = [v240 localizedDescription];
                      *(_DWORD *)v302 = 138412546;
                      *(void *)&v302[4] = v244;
                      __int16 v303 = 2112;
                      v304 = v247;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error deleting element at %@ for reason %@", v302, 0x16u);
                    }
                    v248 = +[SDResourceManager sharedResourceManager];
                    v249 = [v240 localizedDescription];
                    [v248 log:@"Error deleting element at %@ for reason %@", v244, v249];
                  }
                  v241 &= v246;
                  v242 = (char *)v242 + 1;
                  v243 = v240;
                }
                while (v239 != v242);
                id v239 = [v283 countByEnumeratingWithState:&v308 objects:v305 count:16];
              }
              while (v239);

              id v48 = v261;
              if ((v241 & 1) == 0)
              {
                id v6 = v266;
                id v5 = v270;
                intptr_t v9 = v272;
                id v7 = v278;
                v118 = v262;
                v74 = v263;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deletion failed", buf, 2u);
                }
                v119 = +[SDResourceManager sharedResourceManager];
                [v119 log:@"Deletion failed"];
                uint64_t v120 = 2;
                goto LABEL_105;
              }
              id v6 = v266;
              id v5 = v270;
              intptr_t v9 = v272;
              id v7 = v278;
            }
            else
            {

              id v6 = v266;
              id v5 = v270;
              intptr_t v9 = v272;
              id v7 = v278;
              id v48 = v261;
            }
LABEL_102:
            v118 = v262;
            v74 = v263;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deletion succeeded", buf, 2u);
            }
            v119 = +[SDResourceManager sharedResourceManager];
            [v119 log:@"Deletion succeeded"];
            uint64_t v120 = 1;
LABEL_105:

            xpc_dictionary_set_uint64(v74, "RESPONSE_TYPE", v120);
            goto LABEL_127;
          }
LABEL_101:

          id obj = 0;
          goto LABEL_102;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v228 = [v85 localizedDescription];
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = "detail";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v228;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error fetching key '%s': %@", buf, 0x16u);
        }
        v229 = +[SDResourceManager sharedResourceManager];
        v230 = [v85 localizedDescription];
        [v229 log:@"Error fetching key '%s': %@", "detail", v230];

        v83 = 0;
      }
      else
      {
        v83 = 0;
      }
      intptr_t v9 = v272;
      goto LABEL_101;
    case 0xBu:
      v101 = v9;
      id v102 = v6;
      id v103 = v7;
      id v104 = v7;
      if (v5)
      {
        v105 = +[SDResourceManager sharedResourceManager];
        v106 = [v105 getCurrentInflightLocalDiagnostic];

        if (v106)
        {
          v107 = +[SDResourceManager sharedResourceManager];
          [v107 registerActivityWithID:v106];

          sub_100034894(v106);
          BOOL v108 = xpc_dictionary_get_BOOL(v102, "compress");
          v109 = sub_100025154(v106, !v108);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v109;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Getting in-progress archive %@", buf, 0xCu);
          }
          xpc_dictionary_set_uint64(v104, "RESPONSE_TYPE", 1uLL);
          if (v109)
          {
            id v110 = v109;
            xpc_dictionary_set_string(v104, "path", (const char *)[v110 UTF8String]);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No in-progress archive found", buf, 2u);
          }
          xpc_dictionary_set_uint64(v104, "RESPONSE_TYPE", 1uLL);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Get in-progress archive not implemented", buf, 2u);
        }
        sub_1000378B8(v104, 9uLL);
      }

      id v142 = 0;
      id v7 = v103;
      intptr_t v9 = v101;
      goto LABEL_256;
    case 0xCu:
      id v111 = v6;
      id v279 = v7;
      id v112 = v7;
      if (sub_100048358(v5, @"com.apple.private.sysdiagnose.cli"))
      {
        v113 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v111, "CLI_REQUEST_TYPE")];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v114 = sub_100024D58(0xCu);
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v113;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v114;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Handling '%@' for '%@'", buf, 0x16u);
        }
        if ([@"isAutomaticCoSysdiagnosePossible" isEqualToString:v113])
        {
          v115 = +[CSCoordinator sharedInstance];
          unsigned int v116 = [v115 isAutomaticCoSysdiagnosePossible];

          xpc_dictionary_set_uint64(v112, "RESPONSE_DATA", v116);
LABEL_92:
          xpc_dictionary_set_uint64(v112, "RESPONSE_TYPE", 1uLL);
LABEL_286:

          goto LABEL_287;
        }
        if (![@"validateRemoteUUIDs" isEqualToString:v113])
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100063B44((uint64_t)v113, v187, v188, v189, v190, v191, v192, v193);
          }
          sub_1000378B8(v112, 0xBuLL);
          goto LABEL_286;
        }
        id v267 = v6;
        uint64_t v143 = objc_opt_class();
        v144 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v143, objc_opt_class(), 0);
        *(void *)v305 = 0;
        v145 = xpc_dictionary_get_data(v111, "REQUEST_DATA", (size_t *)v305);
        if (v145
          && (+[NSData dataWithBytes:v145 length:*(void *)v305],
              (uint64_t v146 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v147 = (void *)v146;
          *(void *)v312 = 0;
          xdictc = v144;
          v148 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v144 fromData:v146 error:v312];
          id v149 = *(id *)v312;
          v150 = v149;
          if (v148)
          {

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id obja = v113;
              v273 = v9;
              id v151 = v148;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 136315394;
                *(void *)&uint8_t buf[4] = "REQUEST_DATA";
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v151;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting %s to %@", buf, 0x16u);
              }
              v152 = +[SDResourceManager sharedResourceManager];
              [v152 log:@"Setting %s to %@", "REQUEST_DATA", v151];

              v153 = objc_opt_new();
              memset(v305, 0, sizeof(v305));
              long long v306 = 0u;
              long long v307 = 0u;
              id v154 = v151;
              id v155 = [v154 countByEnumeratingWithState:v305 objects:buf count:16];
              if (v155)
              {
                id v156 = v155;
                uint64_t v157 = **(void **)&v305[16];
                do
                {
                  for (k = 0; k != v156; k = (char *)k + 1)
                  {
                    if (**(void **)&v305[16] != v157) {
                      objc_enumerationMutation(v154);
                    }
                    uint64_t v159 = *(void *)(*(void *)&v305[8] + 8 * (void)k);
                    v160 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[CSRemoteXPCProxy isDeviceWithUUIDAvailable:v159]);
                    [v153 setObject:v160 forKeyedSubscript:v159];
                  }
                  id v156 = [v154 countByEnumeratingWithState:v305 objects:buf count:16];
                }
                while (v156);
              }

              id v161 = [v153 copy];
              *(void *)&long long v308 = 0;
              v162 = +[NSKeyedArchiver archivedDataWithRootObject:v161 requiringSecureCoding:1 error:&v308];
              id v163 = (id)v308;

              if (v162)
              {
                id v164 = v162;
                xpc_dictionary_set_data(v112, "RESPONSE_DATA", [v164 bytes], (size_t)[v164 length]);
                intptr_t v9 = v273;
              }
              else
              {
                intptr_t v9 = v273;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_100063AB8(v163);
                }
                sub_1000378B8(v112, 4uLL);
              }

              id v6 = v267;
              v113 = obja;
              if (!v162) {
                goto LABEL_286;
              }
              goto LABEL_92;
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v250 = [v150 localizedDescription];
              *(_DWORD *)long long buf = 136315394;
              *(void *)&uint8_t buf[4] = "REQUEST_DATA";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v250;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error fetching key '%s': %@", buf, 0x16u);
            }
            v251 = +[SDResourceManager sharedResourceManager];
            v252 = [v150 localizedDescription];
            [v251 log:@"Error fetching key '%s': %@", "REQUEST_DATA", v252];

            v148 = 0;
          }
          id v6 = v267;
          v144 = xdictc;
        }
        else
        {
          v148 = 0;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100063A44((uint64_t)v113, v253, v254, v255, v256, v257, v258, v259);
        }
        sub_1000378B8(v112, 0xBuLL);

        goto LABEL_286;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v117 = sub_100024D58(0xCu);
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v117;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error: %@ invoked by unentitled client", buf, 0xCu);
      }
      sub_1000378B8(v112, 0xFuLL);
LABEL_287:

      id v142 = 0;
      id v7 = v279;
LABEL_256:

      return v142;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Request not implemented", buf, 2u);
      }
      id v22 = +[SDResourceManager sharedResourceManager];
      [v22 log:@"Request not implemented"];

      sub_1000378B8(v7, 0xBuLL);
      goto LABEL_255;
  }
}

void sub_1000378B8(void *a1, uint64_t a2)
{
  xpc_object_t xdict = a1;
  xpc_dictionary_set_uint64(xdict, "RESPONSE_TYPE", 2uLL);
  xpc_dictionary_set_uint64(xdict, "FAILURE_REASON", a2);
}

uint64_t sub_100037920()
{
  BOOL v0 = dispatch_get_global_queue(25, 0);
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose.service.xpc", v0, 1uLL);
  dispatch_source_t v2 = (void *)qword_1000BD888;
  qword_1000BD888 = (uint64_t)mach_service;

  id v3 = (_xpc_connection_s *)qword_1000BD888;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100037A80;
  handler[3] = &unk_10009D9E8;
  id v4 = v0;
  CFStringRef v10 = v4;
  xpc_connection_set_event_handler(v3, handler);
  xpc_connection_resume((xpc_connection_t)qword_1000BD888);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPC server initialized.", (uint8_t *)&v8, 2u);
  }
  id v5 = +[SDResourceManager sharedResourceManager];
  [v5 stdoutWrite:@"XPC server initialized."];

  id v6 = +[SDResourceManager sharedResourceManager];
  [v6 log:@"XPC server initialized."];

  return 0;
}

void sub_100037A80(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    intptr_t v9 = *(void **)(a1 + 32);
    CFStringRef v10 = (_xpc_connection_s *)v3;
    uint64_t v11 = v9;
    uint64_t v12 = (void *)os_transaction_create();
    xpc_connection_set_target_queue(v10, v11);

    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    unsigned int v17 = sub_10003DFA8;
    id v18 = &unk_10009DA58;
    id v19 = v12;
    BOOL v20 = v10;
    id v13 = v12;
    __int16 v8 = v10;
    xpc_connection_set_event_handler(v8, &buf);
    xpc_connection_resume(v8);

LABEL_7:
    goto LABEL_11;
  }
  xpc_type_t v5 = type;
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v5 != (xpc_type_t)&_xpc_type_error)
  {
    if (v6)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unrecognized connection event", (uint8_t *)&buf, 2u);
    }
    id v7 = +[SDResourceManager sharedResourceManager];
    [v7 stdoutWrite:@"unrecognized connection event"];

    __int16 v8 = +[SDResourceManager sharedResourceManager];
    [(_xpc_connection_s *)v8 log:@"unrecognized connection event"];
    goto LABEL_7;
  }
  if (v6)
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "connection error: %s", (uint8_t *)&buf, 0xCu);
  }
  id v14 = +[SDResourceManager sharedResourceManager];
  [v14 stdoutWrite:@"connection error: %s", xpc_dictionary_get_string(v3, _xpc_error_key_description)];

  unsigned __int16 v15 = +[SDResourceManager sharedResourceManager];
  [v15 log:@"connection error: %s", xpc_dictionary_get_string(v3, _xpc_error_key_description)];

LABEL_11:
}

void sub_100037D14()
{
  BOOL v0 = +[SDCacheEnumerator sysdiagnoseDirectory];
  id v1 = +[SDLogAgentContainer containerAtLocation:v0 forTaskType:59 withTimeout:0 withDelegate:0 withMsgContents:0 withReplyBlock:1.0];

  if (v1)
  {
    [v1 setName:@"SpringBoardStateDump"];
    [v1 setRuntimeChecks:0];
    [v1 execute];
  }
}

void sub_100037DC0(uint64_t a1)
{
  [*(id *)(a1 + 40) setRequestSource:1];
  sub_100024B3C();
  [*(id *)(a1 + 40) run];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    xpc_type_t v5 = "sysdiagnose (full)";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s complete", buf, 0xCu);
  }
  dispatch_source_t v2 = +[SDResourceManager sharedResourceManager];
  [v2 stdoutWrite:@"%s complete" stringByAppendingString:@"sysdiagnose (full)"]

  id v3 = +[SDResourceManager sharedResourceManager];
  [v3 log:@"%s complete" @"sysdiagnose (full)"];
}

void sub_100037ED4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v3 localizedDescription];
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Tap-to-Radar failed to handle the keychord event with error: %@", buf, 0xCu);
    }
    xpc_type_t v5 = +[SDResourceManager sharedResourceManager];
    BOOL v6 = [v3 localizedDescription];
    [v5 stdoutWrite:@"Tap-to-Radar failed to handle the keychord event with error: %@", v6];

    id v7 = +[SDResourceManager sharedResourceManager];
    __int16 v8 = [v3 localizedDescription];
    [v7 log:@"Tap-to-Radar failed to handle the keychord event with error: %@", v8];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100038040(uint64_t a1)
{
  sub_100024B3C();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_source_t v2 = sub_100024BEC(*(_DWORD *)(a1 + 40));
    *(_DWORD *)long long buf = 136315394;
    CFStringRef v10 = "sysdiagnose (stackshot only)";
    __int16 v11 = 2112;
    uint64_t v12 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s trigger: %@", buf, 0x16u);
  }
  id v3 = +[SDResourceManager sharedResourceManager];
  id v4 = sub_100024BEC(*(_DWORD *)(a1 + 40));
  [v3 stdoutWrite:@"%s trigger: %@", "sysdiagnose (stackshot only)", v4];

  xpc_type_t v5 = +[SDResourceManager sharedResourceManager];
  BOOL v6 = sub_100024BEC(*(_DWORD *)(a1 + 40));
  [v5 log:@"%s trigger: %@", "sysdiagnose (stackshot only)", v6];

  sub_100025FBC(41);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    CFStringRef v10 = "sysdiagnose (stackshot only)";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s complete", buf, 0xCu);
  }
  id v7 = +[SDResourceManager sharedResourceManager];
  [v7 stdoutWrite:@"%s complete" stringByAppendingString:@"sysdiagnose (stackshot only)"]

  __int16 v8 = +[SDResourceManager sharedResourceManager];
  [v8 log:@"%s complete" @"sysdiagnose (stackshot only)"];
}

id sub_100038234(uint64_t a1, void *a2, id *a3, void *a4, void *a5)
{
  id v8 = a2;
  *a4 = 0;
  if (sub_10002AE68())
  {
    id v9 = 0;
    *a4 = 5;
    goto LABEL_488;
  }
  if (a1 == 2) {
    sub_100037D14();
  }
  v551 = +[NSMutableString string];
  if (!v8)
  {
    unsigned __int16 v15 = 0;
    goto LABEL_15;
  }
  CFStringRef v10 = xpc_dictionary_get_value(v8, "diagnosticID");
  __int16 v11 = v10;
  if (v10)
  {
    if (xpc_get_type(v10) == (xpc_type_t)&_xpc_type_string)
    {
      unsigned __int16 v15 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v8, "diagnosticID")];
      goto LABEL_14;
    }
    id v12 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
    }

    id v13 = +[SDResourceManager sharedResourceManager];
    [v13 stdoutWrite:@"Invalid flag argument type."];

    id v14 = +[SDResourceManager sharedResourceManager];
    [v14 log:@"Invalid flag argument type."];
  }
  unsigned __int16 v15 = 0;
LABEL_14:

LABEL_15:
  id v16 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v15 UTF8String];
    *(_DWORD *)long long buf = 136315394;
    *(void *)v570 = "diagnosticID";
    *(_WORD *)&v570[8] = 2080;
    id v571 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);
  }

  id v18 = +[SDResourceManager sharedResourceManager];
  id v19 = v15;
  [v18 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to string %s", "diagnosticID", [v19 UTF8String]];

  BOOL v20 = +[SDResourceManager sharedResourceManager];
  id v21 = v19;
  [v20 log:[NSString stringWithFormat:@"sysdiagnose XPC dictionary: Set %s to string %s", @"diagnosticID", [v21 UTF8String]]];

  v550 = v21;
  [0 isEqualToString:v21];
  v549 = a4;
  if (!v8)
  {
    BOOL v27 = 1;
    goto LABEL_27;
  }
  id v22 = xpc_dictionary_get_value(v8, "shouldCreateTarBall");
  id v23 = v22;
  if (v22)
  {
    if (xpc_get_type(v22) == (xpc_type_t)&_xpc_type_BOOL)
    {
      BOOL v27 = xpc_dictionary_get_BOOL(v8, "shouldCreateTarBall");
      goto LABEL_26;
    }
    id v24 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
    }

    BOOL v25 = +[SDResourceManager sharedResourceManager];
    [v25 stdoutWrite:@"Invalid flag argument type."];

    unsigned __int8 v26 = +[SDResourceManager sharedResourceManager];
    [v26 log:@"Invalid flag argument type."];
  }
  BOOL v27 = 1;
LABEL_26:

LABEL_27:
  id v28 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)v570 = "shouldCreateTarBall";
    *(_WORD *)&v570[8] = 1024;
    LODWORD(v571) = v27;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
  }

  unsigned __int8 v29 = +[SDResourceManager sharedResourceManager];
  [v29 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldCreateTarBall", v27];

  long long v30 = +[SDResourceManager sharedResourceManager];
  [v30 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldCreateTarBall", v27];

  if (!v27)
  {
    id v31 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "shouldCreateTarBall", 1, 0];
    [v551 appendString:v31];
  }
  int v32 = objc_alloc_init(SystemDiagnosticiOS);
  id v33 = v32;
  if (!v32)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100063C64();
    }
    uint64_t v45 = +[SDResourceManager sharedResourceManager];
    [v45 stderrWrite:@"Failed to allocate diagnostic object. Failing early from do_sysdiagnose"];

    unsigned int v46 = +[SDResourceManager sharedResourceManager];
    [v46 log:@"Failed to allocate diagnostic object. Failing early from do_sysdiagnose"];

    id v9 = 0;
    uint64_t v41 = v550;
    goto LABEL_487;
  }
  v552 = v32;
  if (a5
    && ([(SystemDiagnostic *)v32 diagnosticID],
        BOOL v34 = objc_claimAutoreleasedReturnValue(),
        v34,
        v34))
  {
    *a5 = [(SystemDiagnostic *)v33 diagnosticID];
  }
  else
  {
    id v35 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100063CA8((uint64_t)a5, v33);
    }

    unsigned int v36 = +[SDResourceManager sharedResourceManager];
    uint64_t v37 = [(SystemDiagnostic *)v33 diagnosticID];
    [v36 stderrWrite:@"Error setting diagnosticIDOut: trying to set '%p' to '%@'", a5, v37];

    uint64_t v38 = +[SDResourceManager sharedResourceManager];
    char v39 = [(SystemDiagnostic *)v33 diagnosticID];
    [v38 log:@"Error setting diagnosticIDOut: trying to set '%p' to '%@'", a5, v39];
  }
  uint64_t v40 = xpc_dictionary_get_value(v8, "coSysdiagnoseOnly");
  uint64_t v41 = v550;
  if (v40)
  {
    uint64_t v42 = (void *)v40;
    BOOL v43 = xpc_dictionary_get_BOOL(v8, "coSysdiagnoseOnly");

    uint64_t v44 = !v43;
  }
  else
  {
    uint64_t v44 = 1;
  }
  id v47 = +[SDResourceManager sharedResourceManager];
  id v48 = [(SystemDiagnostic *)v552 diagnosticID];
  unsigned int v49 = [v47 checkAndIncreaseDiagnosticCountForDiagnosticID:v48 collectingLocalLogs:v44];

  if (v550)
  {
    if (([v550 isEqualToString:@"waitIfAny"] & v49 & 1) == 0)
    {
      if (![v550 hasPrefix:@"remote:"])
      {
        unsigned int v50 = [v550 isEqualToString:@"waitIfAny"];
        id v33 = v552;
        if (v50)
        {
          uint64_t v51 = +[SDResourceManager sharedResourceManager];
          uint64_t v52 = [v51 getCurrentInflightLocalDiagnostic];

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)v570 = v52;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Selected the following diagnostic %@", buf, 0xCu);
          }
          uint64_t v53 = +[SDResourceManager sharedResourceManager];
          [v53 log:@"Selected the following diagnostic %@", v52];
        }
        else
        {
          uint64_t v52 = v550;
        }
        v67 = +[SDResourceManager sharedResourceManager];
        unsigned int v68 = [v67 registerActivityWithID:v52];

        if (((v50 | v68 ^ 1) & 1) == 0)
        {
          v69 = xpc_dictionary_get_remote_connection(v8);
          v70 = v69;
          if (v69)
          {
            if (xpc_get_type(v69) == (xpc_type_t)&_xpc_type_connection)
            {
              v71 = +[SDResourceManager sharedResourceManager];
              unsigned __int8 v72 = [v71 initConnectionWithPeer:v70 forDiagnosticID:v52];

              if ((v72 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                *(void *)v570 = v52;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't set progressHandler for sysdiagnose with the diagnostcID %@", buf, 0xCu);
              }
            }
          }
        }
        sub_100034894(v52);
        sub_100025154(v52, v27 ^ 1);
        id v66 = (id)objc_claimAutoreleasedReturnValue();
        if (v66)
        {
          uint64_t v73 = 0;
          v74 = a4;
        }
        else
        {
          v74 = a4;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)v570 = v52;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't get an archive with the diagnostcID %@", buf, 0xCu);
          }
          id v102 = +[SDResourceManager sharedResourceManager];
          [v102 log:@"Couldn't get an archive with the diagnostcID %@", v52];

          uint64_t v73 = 2;
        }
        uint64_t *v74 = v73;
        uint64_t v41 = v52;
        goto LABEL_94;
      }
LABEL_61:
      sub_100034560(v550, a4);
      id v66 = (id)objc_claimAutoreleasedReturnValue();
      id v33 = v552;
LABEL_94:
      id v103 = +[SDResourceManager sharedResourceManager];
      id v104 = [(SystemDiagnostic *)v33 diagnosticID];
      [v103 decreaseDiagnosticCountForDiagnosticID:v104];

      goto LABEL_486;
    }
  }
  else if (!v49)
  {
    if (([0 hasPrefix:@"remote:"] & 1) == 0)
    {
      id v66 = 0;
      uint64_t v41 = 0;
      *a4 = 3;
      id v33 = v552;
LABEL_486:
      id v9 = v66;
      goto LABEL_487;
    }
    goto LABEL_61;
  }
  long long v54 = sub_100028174();
  if (os_signpost_enabled(v54))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v54, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "doSDSetup", "[do_sysdiagnose] Setup/Parsing begins", buf, 2u);
  }

  long long v55 = +[SDResourceManager sharedResourceManager];
  uint64_t v56 = [v55 possibleClient];
  v57 = +[SDResourceManager sharedResourceManager];
  [v57 setCurrentClient:v56];

  id v58 = v552;
  [(SystemDiagnostic *)v552 setRequestSource:a1];
  id v59 = a4;
  if (!v8)
  {
LABEL_421:
    v477 = [(SystemDiagnostic *)v58 diagnosticID];

    if (v8 && v477)
    {
      int int64 = xpc_dictionary_get_int64(v8, "clientPID");
      v479 = +[SDResourceManager sharedResourceManager];
      v480 = [(SystemDiagnostic *)v58 diagnosticID];
      v481 = +[NSNumber numberWithLongLong:int64];
      [v479 setUpSysdiagnoseSession:v480 clientPid:v481];

      id v58 = v552;
      proc_pidpath(int64, buf, 0x400u);
      v482 = +[NSString stringWithCString:buf encoding:4];
      -[SystemDiagnostic setIsTestingMode:](v552, "setIsTestingMode:", [v482 rangeOfString:@"dt_sysdiagnose"] != (id)0x7FFFFFFFFFFFFFFFLL);

      unsigned int v483 = [(SystemDiagnostic *)v552 tconNvmDump];
    }
    else
    {
      unsigned int v483 = [(SystemDiagnostic *)v58 tconNvmDump];
      if (!v8)
      {
LABEL_432:
        id v489 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v490 = [(SystemDiagnostic *)v58 tconNvmDump];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "tconNvmDump";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v490;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        v491 = +[SDResourceManager sharedResourceManager];
        [v491 stdoutWrite:[NSString stringWithFormat:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"tconNvmDump", -[SystemDiagnostic tconNvmDump](v552, "tconNvmDump")];

        id v33 = v552;
        v492 = +[SDResourceManager sharedResourceManager];
        [v492 log: @"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"tconNvmDump", -[SystemDiagnostic tconNvmDump](v552, "tconNvmDump")];

        if (v483 != [(SystemDiagnostic *)v552 tconNvmDump])
        {
          v493 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "tconNvmDump", v483, [(SystemDiagnostic *)v552 tconNvmDump]];
          [v551 appendString:v493];
        }
        if (sub_100048604())
        {
          unsigned int v494 = [(SystemDiagnostic *)v552 collectWifiDextCoreFiles];
          if (v8)
          {
            v495 = xpc_dictionary_get_value(v8, "collectWifiDextCoreFiles");
            v496 = v495;
            if (v495)
            {
              if (xpc_get_type(v495) == (xpc_type_t)&_xpc_type_BOOL)
              {
                [(SystemDiagnostic *)v552 setCollectWifiDextCoreFiles:xpc_dictionary_get_BOOL(v8, "collectWifiDextCoreFiles")];
              }
              else
              {
                id v497 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                }

                v498 = +[SDResourceManager sharedResourceManager];
                [v498 stdoutWrite:@"Invalid flag argument type."];

                v499 = +[SDResourceManager sharedResourceManager];
                [v499 log:@"Invalid flag argument type."];

                id v33 = v552;
              }
            }
          }
          id v500 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v501 = [(SystemDiagnostic *)v33 collectWifiDextCoreFiles];
            *(_DWORD *)long long buf = 136315394;
            *(void *)v570 = "collectWifiDextCoreFiles";
            *(_WORD *)&v570[8] = 1024;
            LODWORD(v571) = v501;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
          }

          v502 = +[SDResourceManager sharedResourceManager];
          [v502 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"collectWifiDextCoreFiles", -[SystemDiagnostic collectWifiDextCoreFiles](v552, "collectWifiDextCoreFiles")];

          id v33 = v552;
          v503 = +[SDResourceManager sharedResourceManager];
          [v503 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"collectWifiDextCoreFiles", -[SystemDiagnostic collectWifiDextCoreFiles](v552, "collectWifiDextCoreFiles")];

          if (v494 != [(SystemDiagnostic *)v552 collectWifiDextCoreFiles])
          {
            v504 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "collectWifiDextCoreFiles", v494, [(SystemDiagnostic *)v552 collectWifiDextCoreFiles]];
            [v551 appendString:v504];
          }
        }
        if ([(SystemDiagnostic *)v33 requestSource] == 2)
        {
          uint64_t v505 = xpc_dictionary_dup_fd(v8, "stdout");
          uint64_t v506 = xpc_dictionary_dup_fd(v8, "stderr");
          uint64_t v507 = v506;
          if (v505 == -1 || v506 == -1)
          {
            id v508 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 67109376;
              *(_DWORD *)v570 = v505;
              *(_WORD *)&v570[4] = 1024;
              *(_DWORD *)&v570[6] = v507;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Server received invalid CLI descriptors: stdout %d, stderr %d", buf, 0xEu);
            }

            v509 = +[SDResourceManager sharedResourceManager];
            [v509 log:@"Server received invalid CLI descriptors: stdout %d, stderr %d", v505, v507];
          }
          v510 = +[SDResourceManager sharedResourceManager];
          v511 = [(SystemDiagnostic *)v552 diagnosticID];
          unsigned __int8 v512 = [v510 setUpCLI:v511 stdoutfd:v505 stderrfd:v507];

          id v33 = v552;
          if ((v512 & 1) == 0)
          {
            id v513 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v514 = [(SystemDiagnostic *)v552 diagnosticID];
              *(_DWORD *)long long buf = 138412290;
              *(void *)v570 = v514;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setUpCli failed for diagnostic ID :%@.", buf, 0xCu);
            }
            v515 = +[SDResourceManager sharedResourceManager];
            v516 = [(SystemDiagnostic *)v552 diagnosticID];
            [v515 log:@"setUpCli failed for diagnostic ID :%@.", v516];
          }
        }
        if (![(SystemDiagnostic *)v33 verbose])
        {
          v517 = xpc_dictionary_get_remote_connection(v8);
          v518 = v517;
          if (v517 && xpc_get_type(v517) == (xpc_type_t)&_xpc_type_connection)
          {
            v519 = +[SDResourceManager sharedResourceManager];
            [v519 initProgressTrackerWithConnection:v518];
          }
        }
        [(SystemDiagnostic *)v33 setChangedDiagnosticProperties:v551];
        v520 = sub_100028174();
        if (os_signpost_enabled(v520))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v520, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "doSDSetup", "[do_sysdiagnose] setup/parse input ended!", buf, 2u);
        }

        [(SystemDiagnosticiOS *)v33 run];
        unsigned int v521 = [(SystemDiagnostic *)v33 requestSource];
        if (a3 && v521 == 3)
        {
          id v548 = v8;
          id v522 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Getting a copy of metrics", buf, 2u);
          }

          v523 = +[SDResourceManager sharedResourceManager];
          [v523 stdoutWrite:@"Getting a copy of metrics"];

          v524 = +[SDResourceManager sharedResourceManager];
          [v524 log:@"Getting a copy of metrics"];

          v525 = [(SystemDiagnostic *)v33 metricsDict];
          *a3 = [v525 copy];

          long long v559 = 0u;
          long long v560 = 0u;
          long long v557 = 0u;
          long long v558 = 0u;
          id obja = [*a3 allKeys];
          id v526 = [obja countByEnumeratingWithState:&v557 objects:v568 count:16];
          if (v526)
          {
            id v527 = v526;
            uint64_t v528 = *(void *)v558;
            do
            {
              for (uint64_t i = 0; i != v527; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v558 != v528) {
                  objc_enumerationMutation(obja);
                }
                v530 = *(void **)(*((void *)&v557 + 1) + 8 * i);
                id v531 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  id v532 = v530;
                  id v533 = [v532 UTF8String];
                  v534 = [*a3 objectForKey:v532];
                  [v534 doubleValue];
                  *(_DWORD *)long long buf = 136315394;
                  *(void *)v570 = v533;
                  *(_WORD *)&v570[8] = 2048;
                  id v571 = v535;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Key: %s, Val: %f", buf, 0x16u);
                }
                v536 = +[SDResourceManager sharedResourceManager];
                id v537 = v530;
                id v538 = [v537 UTF8String];
                v539 = [*a3 objectForKey:v537];
                [v539 doubleValue];
                [v536 stdoutWrite:@"Key: %s, Val: %f", v538, v540];

                v541 = +[SDResourceManager sharedResourceManager];
                id v542 = v537;
                id v543 = [v542 UTF8String];
                v544 = [*a3 objectForKey:v542];
                [v544 doubleValue];
                [v541 log:@"Key: %s, Val: %f", v543, v545];
              }
              id v527 = [obja countByEnumeratingWithState:&v557 objects:v568 count:16];
            }
            while (v527);
          }

          id v8 = v548;
          id v59 = v549;
          uint64_t v41 = v550;
          id v33 = v552;
        }
        if ([(SystemDiagnostic *)v33 didComplete])
        {
          if ([(SystemDiagnostic *)v33 shouldCreateTarBall]) {
            [(SystemDiagnostic *)v33 tarballPath];
          }
          else {
          id v66 = [(SystemDiagnostic *)v33 outputDirectory];
          }
        }
        else
        {
          id v66 = 0;
          *id v59 = 6;
        }
        goto LABEL_486;
      }
    }
    v484 = xpc_dictionary_get_value(v8, "tconNvmDump");
    v485 = v484;
    if (v484)
    {
      if (xpc_get_type(v484) == (xpc_type_t)&_xpc_type_BOOL)
      {
        [(SystemDiagnostic *)v58 setTconNvmDump:xpc_dictionary_get_BOOL(v8, "tconNvmDump")];
      }
      else
      {
        id v486 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
        }

        v487 = +[SDResourceManager sharedResourceManager];
        [v487 stdoutWrite:@"Invalid flag argument type."];

        v488 = +[SDResourceManager sharedResourceManager];
        [v488 log:@"Invalid flag argument type."];

        id v58 = v552;
      }
    }

    goto LABEL_432;
  }
  long long v60 = [(SystemDiagnostic *)v552 providedPIDorProcess];
  v61 = xpc_dictionary_get_value(v8, "pidOrProcess");
  v62 = v61;
  if (v61)
  {
    if (xpc_get_type(v61) == (xpc_type_t)&_xpc_type_string)
    {
      unsigned __int8 v65 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v8, "pidOrProcess")];
      [(SystemDiagnostic *)v552 setProvidedPIDorProcess:v65];
    }
    else
    {
      id v63 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
      }

      v64 = +[SDResourceManager sharedResourceManager];
      [v64 stdoutWrite:@"Invalid flag argument type."];

      unsigned __int8 v65 = +[SDResourceManager sharedResourceManager];
      [v65 log:@"Invalid flag argument type."];
      id v58 = v552;
    }
  }
  id v75 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v76 = [(SystemDiagnostic *)v58 providedPIDorProcess];
    id v77 = [v76 UTF8String];
    *(_DWORD *)long long buf = 136315394;
    *(void *)v570 = "pidOrProcess";
    *(_WORD *)&v570[8] = 2080;
    id v571 = v77;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);
  }
  uint64_t v78 = +[SDResourceManager sharedResourceManager];
  id v79 = [(SystemDiagnostic *)v58 providedPIDorProcess];
  [v78 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to string %s", "pidOrProcess", [v79 UTF8String]];

  v80 = +[SDResourceManager sharedResourceManager];
  id v81 = [(SystemDiagnostic *)v552 providedPIDorProcess];
  [v80 log:@"sysdiagnose XPC dictionary: Set %s to string %s", "pidOrProcess", [v81 UTF8String]];

  v82 = [(SystemDiagnostic *)v552 providedPIDorProcess];
  if (([v60 isEqualToString:v82] & 1) == 0 && v60)
  {
    v83 = [(SystemDiagnostic *)v552 providedPIDorProcess];

    if (!v83) {
      goto LABEL_82;
    }
    id v84 = [(SystemDiagnostic *)v552 providedPIDorProcess];
    v82 = +[NSString stringWithFormat:@"Property %s changed from default %@ to %@\n", "pidOrProcess", v60, v84];

    [v551 appendString:v82];
  }

LABEL_82:
  uint64_t v85 = [(SystemDiagnostic *)v552 providedPIDorProcess];
  uint64_t v41 = v550;
  if (!v85) {
    goto LABEL_112;
  }
  id v86 = (void *)v85;
  v87 = [(SystemDiagnostic *)v552 providedPIDorProcess];
  if ([v87 rangeOfString:@"Mail" options:1] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v88 = [(SystemDiagnostic *)v552 providedPIDorProcess];
    id v89 = [v88 rangeOfString:@"Safari" options:1];

    if (v89 != (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_112;
    }
    [(SystemDiagnostic *)v552 populateProcessInfoForInput];
    uint64_t v90 = [(SystemDiagnostic *)v552 targetPIDs];
    if (!v90
      || (id v91 = (void *)v90,
          [(SystemDiagnostic *)v552 targetPIDs],
          id v92 = objc_claimAutoreleasedReturnValue(),
          id v93 = [v92 count],
          v92,
          v91,
          !v93))
    {
      *a4 = 12;
      v105 = sub_100028174();
      if (os_signpost_enabled(v105))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v105, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "doSDSetup", "[do_sysdiagnose] setup/parse input ended!", buf, 2u);
      }

      goto LABEL_378;
    }
    uint64_t v94 = +[NSCharacterSet decimalDigitCharacterSet];
    id v86 = [v94 invertedSet];

    v95 = [(SystemDiagnostic *)v552 providedPIDorProcess];
    id v96 = [v95 rangeOfCharacterFromSet:v86];

    if (v96 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v97 = [(SystemDiagnostic *)v552 providedPIDorProcess];
      id v98 = [v97 intValue];

      v99 = +[NSNumber numberWithInt:v98];
      v100 = [(SystemDiagnostic *)v552 targetPIDs];
      unsigned __int8 v101 = [v100 containsObject:v99];

      if (v101) {
        goto LABEL_111;
      }
LABEL_107:
      void *v549 = 12;
      id v112 = sub_100028174();
      if (os_signpost_enabled(v112))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v112, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "doSDSetup", "[do_sysdiagnose] setup/parse input ended!", buf, 2u);
      }

      goto LABEL_378;
    }
    long long v566 = 0u;
    long long v567 = 0u;
    long long v564 = 0u;
    long long v565 = 0u;
    v87 = [(SystemDiagnostic *)v552 targetPIDs];
    v106 = (char *)[v87 countByEnumeratingWithState:&v564 objects:v574 count:16];
    if (!v106)
    {
LABEL_106:

      goto LABEL_107;
    }
    v107 = v106;
    uint64_t v108 = *(void *)v565;
LABEL_100:
    v109 = 0;
    while (1)
    {
      if (*(void *)v565 != v108) {
        objc_enumerationMutation(v87);
      }
      id v110 = [(SystemDiagnostic *)v552 providedPIDorProcess];
      BOOL v111 = sub_1000489E8();

      if (v111) {
        break;
      }
      ++v109;
      uint64_t v41 = v550;
      if (v107 == v109)
      {
        v107 = (char *)[v87 countByEnumeratingWithState:&v564 objects:v574 count:16];
        if (v107) {
          goto LABEL_100;
        }
        goto LABEL_106;
      }
    }
  }

LABEL_111:
LABEL_112:
  v113 = xpc_dictionary_get_value(v8, "commandLineArgs");
  v114 = v113;
  if (v113)
  {
    v115 = &selRef_verbose;
    if (xpc_get_type(v113) == (xpc_type_t)&_xpc_type_string)
    {
      v119 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v8, "commandLineArgs")];
    }
    else
    {
      id v116 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
      }

      v117 = +[SDResourceManager sharedResourceManager];
      [v117 stdoutWrite:@"Invalid flag argument type."];

      v118 = +[SDResourceManager sharedResourceManager];
      [v118 log:@"Invalid flag argument type."];

      v119 = 0;
    }
  }
  else
  {
    v119 = 0;
    v115 = &selRef_verbose;
  }

  id v120 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v121 = [v119 UTF8String];
    *(_DWORD *)long long buf = 136315394;
    *(void *)v570 = "commandLineArgs";
    *(_WORD *)&v570[8] = 2080;
    id v571 = v121;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);
  }

  v122 = [v115 + 373 sharedResourceManager];
  id v123 = v119;
  [v122 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to string %s", "commandLineArgs", [v123 UTF8String]];

  uint64_t v124 = [v115 + 373 sharedResourceManager];
  id v125 = v123;
  [v124 log:@"sysdiagnose XPC dictionary: Set %s to string %s", "commandLineArgs", [v125 UTF8String]];

  id obj = v125;
  [0 isEqualToString:v125];
  v126 = v552;
  v127 = [(SystemDiagnostic *)v552 baseDirectory];
  v128 = xpc_dictionary_get_value(v8, "baseDirectory");
  v129 = v128;
  if (v128)
  {
    if (xpc_get_type(v128) == (xpc_type_t)&_xpc_type_string)
    {
      v132 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v8, "baseDirectory")];
      [(SystemDiagnostic *)v552 setBaseDirectory:v132];
    }
    else
    {
      id v130 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
      }

      id v131 = [v115 + 373 sharedResourceManager];
      [v131 stdoutWrite:@"Invalid flag argument type."];

      v132 = [v115 + 373 sharedResourceManager];
      [v132 log:@"Invalid flag argument type."];
      v126 = v552;
    }
  }
  id v133 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v134 = [(SystemDiagnostic *)v126 baseDirectory];
    id v135 = [v134 UTF8String];
    *(_DWORD *)long long buf = 136315394;
    *(void *)v570 = "baseDirectory";
    *(_WORD *)&v570[8] = 2080;
    id v571 = v135;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);
  }
  v136 = [v115 + 373 sharedResourceManager];
  id v137 = [(SystemDiagnostic *)v126 baseDirectory];
  [v136 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to string %s", "baseDirectory", [v137 UTF8String]];

  id v138 = [v115 + 373 sharedResourceManager];
  id v139 = [(SystemDiagnostic *)v552 baseDirectory];
  v140 = v552;
  [v138 log:@"sysdiagnose XPC dictionary: Set %s to string %s", "baseDirectory", [v139 UTF8String]];

  id v141 = [(SystemDiagnostic *)v552 baseDirectory];
  if (([v127 isEqualToString:v141] & 1) != 0 || !v127) {
    goto LABEL_134;
  }
  id v142 = [(SystemDiagnostic *)v552 baseDirectory];

  if (v142)
  {
    uint64_t v143 = [(SystemDiagnostic *)v552 baseDirectory];
    id v141 = +[NSString stringWithFormat:@"Property %s changed from default %@ to %@\n", "baseDirectory", v127, v143];

    [v551 appendString:v141];
LABEL_134:
  }
  if (!xpc_dictionary_get_string(v8, "baseDirectory")) {
    goto LABEL_141;
  }
  v144 = [(SystemDiagnosticiOS *)v552 defaultBaseDirectory];
  v145 = +[NSURL fileURLWithPath:v144 isDirectory:1];

  uint64_t v146 = [(SystemDiagnostic *)v552 baseDirectory];
  v147 = +[NSURL fileURLWithPath:v146 isDirectory:1];
  v148 = [v147 URLByResolvingSymlinksInPath];

  id v149 = [v145 absoluteString];
  v150 = [v148 absoluteString];
  unsigned __int8 v151 = [v149 isEqualToString:v150];

  if (v151)
  {
LABEL_140:

    v140 = v552;
LABEL_141:
    unsigned int v156 = [(SystemDiagnostic *)v140 deShowFeedback];
    uint64_t v157 = xpc_dictionary_get_value(v8, "shouldDisplayBannerUI");
    v158 = v157;
    if (v157)
    {
      if (xpc_get_type(v157) == (xpc_type_t)&_xpc_type_BOOL)
      {
        [(SystemDiagnostic *)v140 setDeShowFeedback:xpc_dictionary_get_BOOL(v8, "shouldDisplayBannerUI")];
      }
      else
      {
        id v159 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
        }

        v160 = [v115 + 373 sharedResourceManager];
        [v160 stdoutWrite:@"Invalid flag argument type."];

        id v161 = [v115 + 373 sharedResourceManager];
        [v161 log:@"Invalid flag argument type."];

        v140 = v552;
      }
    }

    id v162 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v163 = [(SystemDiagnostic *)v140 deShowFeedback];
      *(_DWORD *)long long buf = 136315394;
      *(void *)v570 = "shouldDisplayBannerUI";
      *(_WORD *)&v570[8] = 1024;
      LODWORD(v571) = v163;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
    }

    id v164 = [v115 + 373 sharedResourceManager];
    [v164 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldDisplayBannerUI", -[SystemDiagnostic deShowFeedback](v140, "deShowFeedback")];

    v165 = [v115 + 373 sharedResourceManager];
    [v165 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldDisplayBannerUI", -[SystemDiagnostic deShowFeedback](v140, "deShowFeedback")];

    if (v156 != [(SystemDiagnostic *)v140 deShowFeedback])
    {
      unsigned int v166 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "shouldDisplayBannerUI", v156, [(SystemDiagnostic *)v140 deShowFeedback]];
      [v551 appendString:v166];
    }
    id v167 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v168 = [(SystemDiagnostic *)v140 deShowFeedback];
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)v570 = v168;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "should show UI banner? %d", buf, 8u);
    }

    v169 = [v115 + 373 sharedResourceManager];
    [v169 log:@"should show UI banner? %d" -[SystemDiagnostic deShowFeedback](v140, "deShowFeedback")];

    v170 = [(SystemDiagnostic *)v140 rootPath];
    v171 = xpc_dictionary_get_value(v8, "rootPath");
    v172 = v171;
    if (v171)
    {
      if (xpc_get_type(v171) == (xpc_type_t)&_xpc_type_string)
      {
        v175 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v8, "rootPath")];
        [(SystemDiagnostic *)v140 setRootPath:v175];
      }
      else
      {
        id v173 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
        }

        v174 = [v115 + 373 sharedResourceManager];
        [v174 stdoutWrite:@"Invalid flag argument type."];

        v175 = [v115 + 373 sharedResourceManager];
        [v175 log:@"Invalid flag argument type."];
        v140 = v552;
      }
    }
    id v176 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v177 = [(SystemDiagnostic *)v140 rootPath];
      id v178 = [v177 UTF8String];
      *(_DWORD *)long long buf = 136315394;
      *(void *)v570 = "rootPath";
      *(_WORD *)&v570[8] = 2080;
      id v571 = v178;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);
    }
    id v179 = [v115 + 373 sharedResourceManager];
    id v180 = [(SystemDiagnostic *)v140 rootPath];
    [v179 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to string %s", "rootPath", [v180 UTF8String]];

    uint64_t v181 = [v115 + 373 sharedResourceManager];
    id v182 = [(SystemDiagnostic *)v552 rootPath];
    v183 = v552;
    [v181 log:@"sysdiagnose XPC dictionary: Set %s to string %s", "rootPath", [v182 UTF8String]];

    v184 = [(SystemDiagnostic *)v552 rootPath];
    if (([v170 isEqualToString:v184] & 1) == 0 && v170)
    {
      v185 = [(SystemDiagnostic *)v552 rootPath];

      if (!v185) {
        goto LABEL_167;
      }
      double v186 = [(SystemDiagnostic *)v552 rootPath];
      v184 = +[NSString stringWithFormat:@"Property %s changed from default %@ to %@\n", "rootPath", v170, v186];

      [v551 appendString:v184];
    }

LABEL_167:
    uint64_t v187 = [(SystemDiagnostic *)v552 archiveName];
    uint64_t v188 = xpc_dictionary_get_value(v8, "archiveName");
    uint64_t v189 = v188;
    if (v188)
    {
      if (xpc_get_type(v188) == (xpc_type_t)&_xpc_type_string)
      {
        uint64_t v192 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v8, "archiveName")];
        [(SystemDiagnostic *)v552 setArchiveName:v192];
      }
      else
      {
        id v190 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
        }

        uint64_t v191 = [v115 + 373 sharedResourceManager];
        [v191 stdoutWrite:@"Invalid flag argument type."];

        uint64_t v192 = [v115 + 373 sharedResourceManager];
        [v192 log:@"Invalid flag argument type."];
        v183 = v552;
      }
    }
    id v193 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v194 = [(SystemDiagnostic *)v183 archiveName];
      id v195 = [v194 UTF8String];
      *(_DWORD *)long long buf = 136315394;
      *(void *)v570 = "archiveName";
      *(_WORD *)&v570[8] = 2080;
      id v571 = v195;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);
    }
    v196 = [v115 + 373 sharedResourceManager];
    id v197 = [(SystemDiagnostic *)v183 archiveName];
    [v196 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to string %s", "archiveName", [v197 UTF8String]];

    v198 = [v115 + 373 sharedResourceManager];
    id v199 = [(SystemDiagnostic *)v552 archiveName];
    id v200 = v552;
    [v198 log:@"sysdiagnose XPC dictionary: Set %s to string %s", "archiveName", [v199 UTF8String]];

    id v201 = [(SystemDiagnostic *)v552 archiveName];
    if (([v187 isEqualToString:v201] & 1) == 0 && v187)
    {
      id v202 = [(SystemDiagnostic *)v552 archiveName];

      if (!v202) {
        goto LABEL_181;
      }
      uint64_t v203 = [(SystemDiagnostic *)v552 archiveName];
      id v201 = +[NSString stringWithFormat:@"Property %s changed from default %@ to %@\n", "archiveName", v187, v203];

      [v551 appendString:v201];
    }

LABEL_181:
    v204 = xpc_dictionary_get_value(v8, "shouldCollectAllTrusted");

    if (v204)
    {
      BOOL v205 = xpc_dictionary_get_BOOL(v8, "shouldCollectAllTrusted");
      v206 = +[CSCoordinator sharedInstance];
      v207 = [(SystemDiagnostic *)v552 diagnosticID];
      [v206 setCollectAllTrusted:v205 forDiagnosticID:v207];

      id v200 = v552;
    }
    uint64_t v208 = objc_opt_class();
    uint64_t v209 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v208, objc_opt_class(), 0);
    size_t length = 0;
    data = xpc_dictionary_get_data(v8, "remoteUUIDs", &length);
    v553 = (void *)v209;
    if (data
      && (+[NSData dataWithBytes:data length:length],
          (uint64_t v211 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v212 = (void *)v211;
      id v562 = 0;
      v213 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v209 fromData:v211 error:&v562];
      id v214 = v562;
      id v215 = v214;
      if (!v213)
      {
        id v437 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v438 = [v215 localizedDescription];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "remoteUUIDs";
          *(_WORD *)&v570[8] = 2112;
          id v571 = v438;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error fetching key '%s': %@", buf, 0x16u);
        }
        v439 = [v115 + 373 sharedResourceManager];
        v440 = [v215 localizedDescription];
        [v439 log:@"Error fetching key '%s': %@", "remoteUUIDs", v440];

        v213 = 0;
        v220 = 0;
        id v200 = v552;
LABEL_192:

        v221 = xpc_dictionary_get_value(v8, "coSysdiagnoseOnly");

        uint64_t v41 = v550;
        if (v221)
        {
          BOOL v222 = xpc_dictionary_get_BOOL(v8, "coSysdiagnoseOnly");
          if (v222)
          {
            v223 = [(SystemDiagnostic *)v552 diagnosticID];
            char v224 = sub_100034C30(v223, (uint64_t)v220);

            if ((v224 & 1) == 0)
            {
              id v434 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "coSysdiagnoseOnly requested, but no co-sysdiagnoses available to collect - terminating", buf, 2u);
              }

              v435 = [v115 + 373 sharedResourceManager];
              [v435 log:@"coSysdiagnoseOnly requested, but no co-sysdiagnoses available to collect - terminating"];

              void *v549 = 4;
              v436 = sub_100028174();
              id v33 = v552;
              if (os_signpost_enabled(v436))
              {
                *(_WORD *)long long buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v436, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "doSDSetup", "[do_sysdiagnose] setup/parse input ended!", buf, 2u);
              }

              id v9 = 0;
              goto LABEL_487;
            }
          }
          [(SystemDiagnostic *)v552 setCoSysdiagnoseOnly:v222];
          id v225 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 67109120;
            *(_DWORD *)v570 = v222;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set coSysdiagnoseOnly to value %d", buf, 8u);
          }

          v226 = [v115 + 373 sharedResourceManager];
          [v226 stdoutWrite:@"sysdiagnose XPC dictionary: Set coSysdiagnoseOnly to value %d", v222];

          id v227 = [v115 + 373 sharedResourceManager];
          [v227 log:@"sysdiagnose XPC dictionary: Set coSysdiagnoseOnly to value %d", v222];

          id v200 = v552;
        }
        v228 = xpc_dictionary_get_value(v8, "coSysdiagnose");

        if (v228)
        {
          if (xpc_dictionary_get_BOOL(v8, "coSysdiagnose")) {
            uint64_t v229 = 2;
          }
          else {
            uint64_t v229 = 1;
          }
          [(SystemDiagnostic *)v200 setCoSysdiagnose:v229];
          id v230 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v231 = [(SystemDiagnostic *)v200 coSysdiagnose];
            *(_DWORD *)long long buf = 134217984;
            *(void *)v570 = v231;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set coSysdiagnose to value %ld", buf, 0xCu);
          }

          v232 = [v115 + 373 sharedResourceManager];
          [v232 stdoutWrite:@"sysdiagnose XPC dictionary: Set coSysdiagnose to value %ld" , -[SystemDiagnostic coSysdiagnose](v200, "coSysdiagnose")];

          v233 = [v115 + 373 sharedResourceManager];
          [v233 log:@"sysdiagnose XPC dictionary: Set coSysdiagnose to value %ld" -[SystemDiagnostic coSysdiagnose](v200, "coSysdiagnose")];
        }
        v547 = v220;
        unsigned int v234 = [(SystemDiagnostic *)v200 generatePlist];
        v235 = xpc_dictionary_get_value(v8, "generatePlist");
        v236 = v235;
        if (v235)
        {
          if (xpc_get_type(v235) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v200 setGeneratePlist:xpc_dictionary_get_BOOL(v8, "generatePlist")];
          }
          else
          {
            id v237 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            id v238 = [v115 + 373 sharedResourceManager];
            [v238 stdoutWrite:@"Invalid flag argument type."];

            id v239 = [v115 + 373 sharedResourceManager];
            [v239 log:@"Invalid flag argument type."];

            id v200 = v552;
          }
        }

        id v240 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v241 = [(SystemDiagnostic *)v200 generatePlist];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "generatePlist";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v241;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        v242 = [v115 + 373 sharedResourceManager];
        [v242 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"generatePlist", -[SystemDiagnostic generatePlist](v200, "generatePlist")];

        v243 = [v115 + 373 sharedResourceManager];
        [v243 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"generatePlist", -[SystemDiagnostic generatePlist](v200, "generatePlist")];

        if (v234 != [(SystemDiagnostic *)v200 generatePlist])
        {
          uint64_t v244 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "generatePlist", v234, [(SystemDiagnostic *)v200 generatePlist]];
          [v551 appendString:v244];
        }
        unsigned int v245 = [(SystemDiagnostic *)v200 quickMode];
        unsigned __int8 v246 = xpc_dictionary_get_value(v8, "quickMode");
        v247 = v246;
        if (v246)
        {
          if (xpc_get_type(v246) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v200 setQuickMode:xpc_dictionary_get_BOOL(v8, "quickMode")];
          }
          else
          {
            id v248 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            v249 = [v115 + 373 sharedResourceManager];
            [v249 stdoutWrite:@"Invalid flag argument type."];

            v250 = [v115 + 373 sharedResourceManager];
            [v250 log:@"Invalid flag argument type."];

            id v200 = v552;
          }
        }

        id v251 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v252 = [(SystemDiagnostic *)v200 quickMode];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "quickMode";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v252;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        uint64_t v253 = [v115 + 373 sharedResourceManager];
        [v253 stdoutWrite:[NSString stringWithFormat:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"quickMode", -[SystemDiagnostic quickMode](v200, "quickMode")]];

        uint64_t v254 = [v115 + 373 sharedResourceManager];
        [v254 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"quickMode", -[SystemDiagnostic quickMode](v200, "quickMode")];

        if (v245 != [(SystemDiagnostic *)v200 quickMode])
        {
          uint64_t v255 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "quickMode", v245, [(SystemDiagnostic *)v200 quickMode]];
          [v551 appendString:v255];
        }
        unsigned int v256 = [(SystemDiagnostic *)v200 shouldDisplayTarBall];
        uint64_t v257 = xpc_dictionary_get_value(v8, "shouldDisplayTarBall");
        uint64_t v258 = v257;
        if (v257)
        {
          if (xpc_get_type(v257) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v200 setShouldDisplayTarBall:xpc_dictionary_get_BOOL(v8, "shouldDisplayTarBall")];
          }
          else
          {
            id v259 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            uint64_t v260 = [v115 + 373 sharedResourceManager];
            [v260 stdoutWrite:@"Invalid flag argument type."];

            id v261 = [v115 + 373 sharedResourceManager];
            [v261 log:@"Invalid flag argument type."];

            id v200 = v552;
          }
        }

        id v262 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v263 = [(SystemDiagnostic *)v200 shouldDisplayTarBall];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "shouldDisplayTarBall";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v263;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        id v264 = [v115 + 373 sharedResourceManager];
        [v264 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldDisplayTarBall", -[SystemDiagnostic shouldDisplayTarBall](v200, "shouldDisplayTarBall")];

        id v265 = [v115 + 373 sharedResourceManager];
        [v265 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldDisplayTarBall", -[SystemDiagnostic shouldDisplayTarBall](v200, "shouldDisplayTarBall")];

        if (v256 != [(SystemDiagnostic *)v200 shouldDisplayTarBall])
        {
          id v266 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "shouldDisplayTarBall", v256, [(SystemDiagnostic *)v200 shouldDisplayTarBall]];
          [v551 appendString:v266];
        }
        unsigned int v267 = [(SystemDiagnostic *)v200 shouldCreateTarBall];
        id v268 = xpc_dictionary_get_value(v8, "shouldCreateTarBall");
        id v269 = v268;
        if (v268)
        {
          if (xpc_get_type(v268) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v200 setShouldCreateTarBall:xpc_dictionary_get_BOOL(v8, "shouldCreateTarBall")];
          }
          else
          {
            id v270 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            v271 = [v115 + 373 sharedResourceManager];
            [v271 stdoutWrite:@"Invalid flag argument type."];

            v272 = [v115 + 373 sharedResourceManager];
            [v272 log:@"Invalid flag argument type."];

            id v200 = v552;
          }
        }

        id v273 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v274 = [(SystemDiagnostic *)v200 shouldCreateTarBall];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "shouldCreateTarBall";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v274;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        v275 = [v115 + 373 sharedResourceManager];
        [v275 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldCreateTarBall", -[SystemDiagnostic shouldCreateTarBall](v200, "shouldCreateTarBall")];

        v276 = [v115 + 373 sharedResourceManager];
        [v276 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldCreateTarBall", -[SystemDiagnostic shouldCreateTarBall](v200, "shouldCreateTarBall")];

        if (v267 != [(SystemDiagnostic *)v200 shouldCreateTarBall])
        {
          id v277 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "shouldCreateTarBall", v267, [(SystemDiagnostic *)v200 shouldCreateTarBall]];
          [v551 appendString:v277];
        }
        unsigned int v278 = [(SystemDiagnostic *)v200 shouldRunLogCopyTasks];
        id v279 = xpc_dictionary_get_value(v8, "shouldRunLogCopyTasks");
        id v280 = v279;
        if (v279)
        {
          if (xpc_get_type(v279) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v200 setShouldRunLogCopyTasks:xpc_dictionary_get_BOOL(v8, "shouldRunLogCopyTasks")];
          }
          else
          {
            id v281 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            id v282 = [v115 + 373 sharedResourceManager];
            [v282 stdoutWrite:@"Invalid flag argument type."];

            id v283 = [v115 + 373 sharedResourceManager];
            [v283 log:@"Invalid flag argument type."];

            id v200 = v552;
          }
        }

        id v284 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v285 = [(SystemDiagnostic *)v200 shouldRunLogCopyTasks];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "shouldRunLogCopyTasks";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v285;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        v286 = [v115 + 373 sharedResourceManager];
        [v286 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldRunLogCopyTasks", -[SystemDiagnostic shouldRunLogCopyTasks](v200, "shouldRunLogCopyTasks")];

        v287 = [v115 + 373 sharedResourceManager];
        [v287 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldRunLogCopyTasks", -[SystemDiagnostic shouldRunLogCopyTasks](v200, "shouldRunLogCopyTasks")];

        if (v278 != [(SystemDiagnostic *)v200 shouldRunLogCopyTasks])
        {
          v288 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "shouldRunLogCopyTasks", v278, [(SystemDiagnostic *)v200 shouldRunLogCopyTasks]];
          [v551 appendString:v288];
        }
        unsigned int v289 = [(SystemDiagnostic *)v200 shouldRunLogGenerationTasks];
        uint64_t v290 = xpc_dictionary_get_value(v8, "shouldRunLogGenerationTasks");
        v291 = v290;
        if (v290)
        {
          if (xpc_get_type(v290) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v200 setShouldRunLogGenerationTasks:xpc_dictionary_get_BOOL(v8, "shouldRunLogGenerationTasks")];
          }
          else
          {
            id v292 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            v293 = [v115 + 373 sharedResourceManager];
            [v293 stdoutWrite:@"Invalid flag argument type."];

            v294 = [v115 + 373 sharedResourceManager];
            [v294 log:@"Invalid flag argument type."];

            id v200 = v552;
          }
        }

        id v295 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v296 = [(SystemDiagnostic *)v200 shouldRunLogGenerationTasks];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "shouldRunLogGenerationTasks";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v296;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        v297 = [v115 + 373 sharedResourceManager];
        [v297 stdoutWrite:[NSString stringWithFormat:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldRunLogGenerationTasks", -[SystemDiagnostic shouldRunLogGenerationTasks](v200, "shouldRunLogGenerationTasks")]];

        long long v298 = [v115 + 373 sharedResourceManager];
        [v298 log:[NSString stringWithFormat:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldRunLogGenerationTasks", -[SystemDiagnostic shouldRunLogGenerationTasks](v200, "shouldRunLogGenerationTasks")]];

        if (v289 != [(SystemDiagnostic *)v200 shouldRunLogGenerationTasks])
        {
          long long v299 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "shouldRunLogGenerationTasks", v289, [(SystemDiagnostic *)v200 shouldRunLogGenerationTasks]];
          [v551 appendString:v299];
        }
        unsigned int v300 = [(SystemDiagnostic *)v200 shouldRunTimeSensitiveTasks];
        uint64_t v301 = xpc_dictionary_get_value(v8, "shouldRunTimeSensitiveTasks");
        v302 = v301;
        if (v301)
        {
          if (xpc_get_type(v301) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v200 setShouldRunTimeSensitiveTasks:xpc_dictionary_get_BOOL(v8, "shouldRunTimeSensitiveTasks")];
          }
          else
          {
            id v303 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            v304 = [v115 + 373 sharedResourceManager];
            [v304 stdoutWrite:@"Invalid flag argument type."];

            v305 = [v115 + 373 sharedResourceManager];
            [v305 log:@"Invalid flag argument type."];

            id v200 = v552;
          }
        }

        id v306 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v307 = [(SystemDiagnostic *)v200 shouldRunTimeSensitiveTasks];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "shouldRunTimeSensitiveTasks";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v307;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        long long v308 = [v115 + 373 sharedResourceManager];
        [v308 stdoutWrite:[NSString stringWithFormat:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldRunTimeSensitiveTasks", -[SystemDiagnostic shouldRunTimeSensitiveTasks](v200, "shouldRunTimeSensitiveTasks")]];

        long long v309 = [v115 + 373 sharedResourceManager];
        [v309 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldRunTimeSensitiveTasks", -[SystemDiagnostic shouldRunTimeSensitiveTasks](v200, "shouldRunTimeSensitiveTasks")];

        if (v300 != [(SystemDiagnostic *)v200 shouldRunTimeSensitiveTasks])
        {
          long long v310 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "shouldRunTimeSensitiveTasks", v300, [(SystemDiagnostic *)v200 shouldRunTimeSensitiveTasks]];
          [v551 appendString:v310];
        }
        unsigned int v311 = [(SystemDiagnostic *)v200 shouldRunOSLogArchive];
        v312 = xpc_dictionary_get_value(v8, "shouldRunOSLogArchive");
        long long v313 = v312;
        if (v312)
        {
          if (xpc_get_type(v312) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v200 setShouldRunOSLogArchive:xpc_dictionary_get_BOOL(v8, "shouldRunOSLogArchive")];
          }
          else
          {
            id v314 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            long long v315 = [v115 + 373 sharedResourceManager];
            [v315 stdoutWrite:@"Invalid flag argument type."];

            v316 = [v115 + 373 sharedResourceManager];
            [v316 log:@"Invalid flag argument type."];

            id v200 = v552;
          }
        }

        id v317 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v318 = [(SystemDiagnostic *)v200 shouldRunOSLogArchive];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "shouldRunOSLogArchive";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v318;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        v319 = [v115 + 373 sharedResourceManager];
        [v319 stdoutWrite:[NSString stringWithFormat:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldRunOSLogArchive", -[SystemDiagnostic shouldRunOSLogArchive](v200, "shouldRunOSLogArchive")]];

        v320 = [v115 + 373 sharedResourceManager];
        [v320 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldRunOSLogArchive", -[SystemDiagnostic shouldRunOSLogArchive](v200, "shouldRunOSLogArchive")];

        if (v311 != [(SystemDiagnostic *)v200 shouldRunOSLogArchive])
        {
          v321 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "shouldRunOSLogArchive", v311, [(SystemDiagnostic *)v200 shouldRunOSLogArchive]];
          [v551 appendString:v321];
        }
        unsigned int v322 = [(SystemDiagnostic *)v200 shouldRemoveTemporaryDirectory];
        v323 = xpc_dictionary_get_value(v8, "shouldRemoveTemporaryDirectory");
        v324 = v323;
        if (v323)
        {
          if (xpc_get_type(v323) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v200 setShouldRemoveTemporaryDirectory:xpc_dictionary_get_BOOL(v8, "shouldRemoveTemporaryDirectory")];
          }
          else
          {
            id v325 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            v326 = [v115 + 373 sharedResourceManager];
            [v326 stdoutWrite:@"Invalid flag argument type."];

            v327 = [v115 + 373 sharedResourceManager];
            [v327 log:@"Invalid flag argument type."];

            id v200 = v552;
          }
        }

        id v328 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v329 = [(SystemDiagnostic *)v200 shouldRemoveTemporaryDirectory];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "shouldRemoveTemporaryDirectory";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v329;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        v330 = [v115 + 373 sharedResourceManager];
        [v330 stdoutWrite:[NSString stringWithFormat:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldRemoveTemporaryDirectory", -[SystemDiagnostic shouldRemoveTemporaryDirectory](v200, "shouldRemoveTemporaryDirectory")]];

        v331 = [v115 + 373 sharedResourceManager];
        [v331 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldRemoveTemporaryDirectory", -[SystemDiagnostic shouldRemoveTemporaryDirectory](v200, "shouldRemoveTemporaryDirectory")];

        if (v322 != [(SystemDiagnostic *)v200 shouldRemoveTemporaryDirectory])
        {
          v332 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "shouldRemoveTemporaryDirectory", v322, [(SystemDiagnostic *)v200 shouldRemoveTemporaryDirectory]];
          [v551 appendString:v332];
        }
        unsigned int v333 = [(SystemDiagnostic *)v200 verbose];
        v334 = xpc_dictionary_get_value(v8, "verbose");
        v335 = v334;
        if (v334)
        {
          if (xpc_get_type(v334) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v200 setVerbose:xpc_dictionary_get_BOOL(v8, "verbose")];
          }
          else
          {
            id v336 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            v337 = [v115 + 373 sharedResourceManager];
            [v337 stdoutWrite:@"Invalid flag argument type."];

            v338 = [v115 + 373 sharedResourceManager];
            [v338 log:@"Invalid flag argument type."];

            id v200 = v552;
          }
        }

        id v339 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v340 = [(SystemDiagnostic *)v200 verbose];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "verbose";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v340;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        v341 = [v115 + 373 sharedResourceManager];
        [v341 stdoutWrite:[NSString stringWithFormat:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"verbose", -[SystemDiagnostic verbose](v200, "verbose")]];

        v342 = [v115 + 373 sharedResourceManager];
        [v342 log:(@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"verbose", -[SystemDiagnostic verbose](v200, "verbose"));

        if (v333 != [(SystemDiagnostic *)v200 verbose])
        {
          v343 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "verbose", v333, [(SystemDiagnostic *)v200 verbose]];
          [v551 appendString:v343];
        }
        unsigned int v344 = [(SystemDiagnostic *)v200 useParallelCompression];
        v345 = xpc_dictionary_get_value(v8, "useParallelCompression");
        v346 = v345;
        if (v345)
        {
          if (xpc_get_type(v345) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v200 setUseParallelCompression:xpc_dictionary_get_BOOL(v8, "useParallelCompression")];
          }
          else
          {
            id v347 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            v348 = [v115 + 373 sharedResourceManager];
            [v348 stdoutWrite:@"Invalid flag argument type."];

            v349 = [v115 + 373 sharedResourceManager];
            [v349 log:@"Invalid flag argument type."];

            id v200 = v552;
          }
        }

        id v350 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v351 = [(SystemDiagnostic *)v200 useParallelCompression];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "useParallelCompression";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v351;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        v352 = [v115 + 373 sharedResourceManager];
        [v352 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"useParallelCompression", -[SystemDiagnostic useParallelCompression](v200, "useParallelCompression")];

        v353 = [v115 + 373 sharedResourceManager];
        [v353 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"useParallelCompression", -[SystemDiagnostic useParallelCompression](v200, "useParallelCompression")];

        if (v344 != [(SystemDiagnostic *)v200 useParallelCompression])
        {
          v354 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "useParallelCompression", v344, [(SystemDiagnostic *)v200 useParallelCompression]];
          [v551 appendString:v354];
        }
        v355 = +[SystemDiagnosticBT sharedInstance];
        unsigned int v356 = [v355 shouldGatherBTLogs];

        v357 = xpc_dictionary_get_value(v8, "shouldGatherBTLogs");
        v358 = v357;
        if (v357)
        {
          if (xpc_get_type(v357) == (xpc_type_t)&_xpc_type_BOOL)
          {
            BOOL v362 = xpc_dictionary_get_BOOL(v8, "shouldGatherBTLogs");
            v361 = +[SystemDiagnosticBT sharedInstance];
            [v361 setShouldGatherBTLogs:v362];
          }
          else
          {
            id v359 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            v360 = [v115 + 373 sharedResourceManager];
            [v360 stdoutWrite:@"Invalid flag argument type."];

            v361 = [v115 + 373 sharedResourceManager];
            [v361 log:@"Invalid flag argument type."];
          }
        }
        id v363 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v364 = +[SystemDiagnosticBT sharedInstance];
          unsigned int v365 = [v364 shouldGatherBTLogs];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "shouldGatherBTLogs";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v365;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }
        v366 = [v115 + 373 sharedResourceManager];
        v367 = +[SystemDiagnosticBT sharedInstance];
        [v366 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldGatherBTLogs", objc_msgSend(v367, "shouldGatherBTLogs")];

        v368 = [v115 + 373 sharedResourceManager];
        v369 = +[SystemDiagnosticBT sharedInstance];
        [v368 log: @"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldGatherBTLogs", objc_msgSend(v369, "shouldGatherBTLogs")];

        v370 = +[SystemDiagnosticBT sharedInstance];
        LODWORD(v369) = [v370 shouldGatherBTLogs];

        if (v356 != v369)
        {
          v371 = +[SystemDiagnosticBT sharedInstance];
          v372 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Property %s changed from default %d to %d\n", "shouldGatherBTLogs", v356, [v371 shouldGatherBTLogs]);

          [v551 appendString:v372];
        }
        string = xpc_dictionary_get_string(v8, "onlyRunContainersWithNames");
        v374 = v552;
        if (string)
        {
          v375 = string;
          v376 = +[NSString stringWithUTF8String:string];
          [(SystemDiagnostic *)v552 createOnlyRunContainersWithNamesArray:v376];

          id v377 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            *(void *)v570 = v375;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set onlyRunContainersWithNames array from string %s", buf, 0xCu);
          }

          v378 = [v115 + 373 sharedResourceManager];
          [v378 stdoutWrite:@"sysdiagnose XPC dictionary: Set onlyRunContainersWithNames array from string %s", v375];

          v379 = [v115 + 373 sharedResourceManager];
          [v379 log:@"sysdiagnose XPC dictionary: Set onlyRunContainersWithNames array from string %s", v375];

          v374 = v552;
        }
        if (![(SystemDiagnostic *)v374 shouldRemoveTemporaryDirectory])
        {
          id v380 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disabling streaming as we are not removing the temporary directory", buf, 2u);
          }

          v381 = [v115 + 373 sharedResourceManager];
          [v381 log:@"Disabling streaming as we are not removing the temporary directory"];

          [(SystemDiagnostic *)v374 setDisableStreamTar:1];
        }
        unsigned int v382 = [(SystemDiagnostic *)v374 shouldGetFeedbackData];
        v383 = xpc_dictionary_get_value(v8, "shouldGetFeedbackData");
        v384 = v383;
        if (v383)
        {
          if (xpc_get_type(v383) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v374 setShouldGetFeedbackData:xpc_dictionary_get_BOOL(v8, "shouldGetFeedbackData")];
          }
          else
          {
            id v385 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            v386 = [v115 + 373 sharedResourceManager];
            [v386 stdoutWrite:@"Invalid flag argument type."];

            v387 = [v115 + 373 sharedResourceManager];
            [v387 log:@"Invalid flag argument type."];

            v374 = v552;
          }
        }

        id v388 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v389 = [(SystemDiagnostic *)v374 shouldGetFeedbackData];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "shouldGetFeedbackData";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v389;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        v390 = [v115 + 373 sharedResourceManager];
        [v390 stdoutWrite:[NSString stringWithFormat:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldGetFeedbackData", -[SystemDiagnostic shouldGetFeedbackData](v374, "shouldGetFeedbackData")]];

        v391 = [v115 + 373 sharedResourceManager];
        [v391 log:x0, @"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"shouldGetFeedbackData", -[SystemDiagnostic shouldGetFeedbackData](v374, "shouldGetFeedbackData")];

        if (v382 != [(SystemDiagnostic *)v374 shouldGetFeedbackData])
        {
          v392 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "shouldGetFeedbackData", v382, [(SystemDiagnostic *)v374 shouldGetFeedbackData]];
          [v551 appendString:v392];
        }
        unsigned int v393 = [(SystemDiagnostic *)v374 disableStreamTar];
        v394 = xpc_dictionary_get_value(v8, "disableStreamTar");
        v395 = v394;
        if (v394)
        {
          if (xpc_get_type(v394) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v374 setDisableStreamTar:xpc_dictionary_get_BOOL(v8, "disableStreamTar")];
          }
          else
          {
            id v396 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            v397 = [v115 + 373 sharedResourceManager];
            [v397 stdoutWrite:@"Invalid flag argument type."];

            v398 = [v115 + 373 sharedResourceManager];
            [v398 log:@"Invalid flag argument type."];

            v374 = v552;
          }
        }

        id v399 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v400 = [(SystemDiagnostic *)v374 disableStreamTar];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "disableStreamTar";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v400;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        v401 = [v115 + 373 sharedResourceManager];
        [v401 stdoutWrite:[NSString stringWithFormat:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"disableStreamTar", -[SystemDiagnostic disableStreamTar](v374, "disableStreamTar")]];

        v402 = [v115 + 373 sharedResourceManager];
        [v402 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"disableStreamTar", -[SystemDiagnostic disableStreamTar](v374, "disableStreamTar")];

        if (v393 != [(SystemDiagnostic *)v374 disableStreamTar])
        {
          v403 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "disableStreamTar", v393, [(SystemDiagnostic *)v374 disableStreamTar]];
          [v551 appendString:v403];
        }
        unsigned int v404 = [(SystemDiagnostic *)v374 disableUIFeedback];
        v405 = xpc_dictionary_get_value(v8, "disableUIFeedback");
        v406 = v405;
        if (v405)
        {
          if (xpc_get_type(v405) == (xpc_type_t)&_xpc_type_BOOL)
          {
            [(SystemDiagnostic *)v374 setDisableUIFeedback:xpc_dictionary_get_BOOL(v8, "disableUIFeedback")];
          }
          else
          {
            id v407 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
            }

            v408 = [v115 + 373 sharedResourceManager];
            [v408 stdoutWrite:@"Invalid flag argument type."];

            v409 = [v115 + 373 sharedResourceManager];
            [v409 log:@"Invalid flag argument type."];

            v374 = v552;
          }
        }

        id v410 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v411 = [(SystemDiagnostic *)v374 disableUIFeedback];
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "disableUIFeedback";
          *(_WORD *)&v570[8] = 1024;
          LODWORD(v571) = v411;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
        }

        v412 = [v115 + 373 sharedResourceManager];
        [v412 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"disableUIFeedback", -[SystemDiagnostic disableUIFeedback](v374, "disableUIFeedback")];

        v413 = [v115 + 373 sharedResourceManager];
        [v413 log:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"disableUIFeedback", -[SystemDiagnostic disableUIFeedback](v374, "disableUIFeedback")];

        if (v404 != [(SystemDiagnostic *)v374 disableUIFeedback])
        {
          v414 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "disableUIFeedback", v404, [(SystemDiagnostic *)v374 disableUIFeedback]];
          [v551 appendString:v414];
        }
        if ([(SystemDiagnostic *)v374 disableUIFeedback]) {
          [(SystemDiagnostic *)v374 setShouldDisplayTarBall:0];
        }
        v415 = +[SDTaskDepot sharedTaskDepot];
        [v415 setNoTimeout:xpc_dictionary_get_BOOL(v8, "setNoTimeOut")];

        uint64_t v416 = objc_opt_class();
        uint64_t v417 = objc_opt_class();
        uint64_t v418 = objc_opt_class();
        uint64_t v419 = objc_opt_class();
        uint64_t v420 = objc_opt_class();
        uint64_t v421 = objc_opt_class();
        v422 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v416, v417, v418, v419, v420, v421, objc_opt_class(), 0);

        size_t length = 0;
        v423 = xpc_dictionary_get_data(v8, "capOverride", &length);
        if (v423)
        {
          uint64_t v424 = +[NSData dataWithBytes:v423 length:length];
          if (v424)
          {
            v425 = (void *)v424;
            id v561 = 0;
            v426 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v422 fromData:v424 error:&v561];
            id v427 = v561;
            v428 = v427;
            if (v426)
            {

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v429 = v426;
                id v430 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 136315394;
                  *(void *)v570 = "capOverride";
                  *(_WORD *)&v570[8] = 2112;
                  id v571 = v429;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting %s to %@", buf, 0x16u);
                }

                v431 = +[SDResourceManager sharedResourceManager];
                [v431 log:@"Setting %s to %@", "capOverride", v429];

                [(SystemDiagnostic *)v552 setCapOverride:v429];
LABEL_392:
                v445 = xpc_dictionary_get_value(v8, "capOverrideFullLogarchive");
                v446 = v445;
                if (v445)
                {
                  if (xpc_get_type(v445) == (xpc_type_t)&_xpc_type_BOOL)
                  {
                    BOOL v450 = xpc_dictionary_get_BOOL(v8, "capOverrideFullLogarchive");
LABEL_399:

                    id v451 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = 136315394;
                      *(void *)v570 = "capOverrideFullLogarchive";
                      *(_WORD *)&v570[8] = 1024;
                      LODWORD(v571) = v450;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
                    }

                    v452 = +[SDResourceManager sharedResourceManager];
                    [v452 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"capOverrideFullLogarchive", v450];

                    v453 = +[SDResourceManager sharedResourceManager];
                    [v453 log:[NSString stringWithFormat:@"sysdiagnose XPC dictionary: Set %s to BOOL %d", @"capOverrideFullLogarchive", v450]];

                    if (v450)
                    {
                      v454 = +[NSString stringWithFormat:@"Property %s changed from default %d to %d\n", "capOverrideFullLogarchive", 0, 1];
                      [v551 appendString:v454];

                      v455 = [(SystemDiagnostic *)v552 capOverride];

                      if (v455)
                      {
                        v456 = [(SystemDiagnostic *)v552 capOverride];
                        id v457 = [v456 mutableCopy];
                      }
                      else
                      {
                        id v457 = (id)objc_opt_new();
                      }
                      v572[0] = @"filename";
                      v572[1] = OSLogConstructPersistSizeLimit;
                      v573[0] = @"system_logs_full.logarchive";
                      v573[1] = &off_1000B11D8;
                      v572[2] = OSLogConstructSpecialSizeLimit;
                      v572[3] = OSLogConstructSignpostSizeLimit;
                      v573[2] = &off_1000B11D8;
                      v573[3] = &off_1000B11D8;
                      v572[4] = OSLogConstructHighVolumeSizeLimit;
                      v572[5] = OSLogConstructPersistAgeLimit;
                      v573[4] = &off_1000B11D8;
                      v573[5] = &off_1000B11D8;
                      v572[6] = OSLogConstructSpecialAgeLimit;
                      v572[7] = OSLogConstructSignpostAgeLimit;
                      v573[6] = &off_1000B11D8;
                      v573[7] = &off_1000B11D8;
                      v572[8] = OSLogConstructHighVolumeAgeLimit;
                      v572[9] = @"timeout";
                      v573[8] = &off_1000B11D8;
                      v573[9] = &off_1000B11F0;
                      v458 = +[NSDictionary dictionaryWithObjects:v573 forKeys:v572 count:10];
                      [v457 setObject:v458 forKeyedSubscript:@"logarchive"];
                      id v459 = [v457 copy];
                      [(SystemDiagnostic *)v552 setCapOverride:v459];
                    }
                    v460 = v552;
                    v461 = [(SystemDiagnostic *)v552 warnProcessAllowlist];
                    v462 = xpc_dictionary_get_value(v8, "warnProcAllowlist");
                    v463 = v462;
                    if (v462)
                    {
                      if (xpc_get_type(v462) == (xpc_type_t)&_xpc_type_string)
                      {
                        v466 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v8, "warnProcAllowlist")];
                        [(SystemDiagnostic *)v552 setWarnProcessAllowlist:v466];
                      }
                      else
                      {
                        id v464 = &_os_log_default;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)long long buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                        }

                        v465 = +[SDResourceManager sharedResourceManager];
                        [v465 stdoutWrite:@"Invalid flag argument type."];

                        v466 = +[SDResourceManager sharedResourceManager];
                        [v466 log:@"Invalid flag argument type."];
                        v460 = v552;
                      }
                    }
                    id v467 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      id v468 = [(SystemDiagnostic *)v460 warnProcessAllowlist];
                      id v469 = [v468 UTF8String];
                      *(_DWORD *)long long buf = 136315394;
                      *(void *)v570 = "warnProcAllowlist";
                      *(_WORD *)&v570[8] = 2080;
                      id v571 = v469;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);
                    }
                    v470 = +[SDResourceManager sharedResourceManager];
                    id v471 = [(SystemDiagnostic *)v460 warnProcessAllowlist];
                    [v470 stdoutWrite:@"sysdiagnose XPC dictionary: Set %s to string %s", "warnProcAllowlist", [v471 UTF8String]];

                    v472 = +[SDResourceManager sharedResourceManager];
                    id v473 = [(SystemDiagnostic *)v552 warnProcessAllowlist];
                    id v58 = v552;
                    [v472 log:@"sysdiagnose XPC dictionary: Set %s to string %s", "warnProcAllowlist", [v473 UTF8String]];

                    v474 = [(SystemDiagnostic *)v552 warnProcessAllowlist];
                    if (([v461 isEqualToString:v474] & 1) == 0 && v461)
                    {
                      v475 = [(SystemDiagnostic *)v552 warnProcessAllowlist];

                      if (!v475)
                      {
LABEL_420:

                        id v59 = v549;
                        uint64_t v41 = v550;
                        goto LABEL_421;
                      }
                      v476 = [(SystemDiagnostic *)v552 warnProcessAllowlist];
                      v474 = +[NSString stringWithFormat:@"Property %s changed from default %@ to %@\n", "warnProcAllowlist", v461, v476];

                      [v551 appendString:v474];
                    }

                    goto LABEL_420;
                  }
                  id v447 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v448 = +[SDResourceManager sharedResourceManager];
                  [v448 stdoutWrite:@"Invalid flag argument type."];

                  v449 = +[SDResourceManager sharedResourceManager];
                  [v449 log:@"Invalid flag argument type."];
                }
                BOOL v450 = 0;
                goto LABEL_399;
              }
LABEL_391:

              id v429 = 0;
              goto LABEL_392;
            }
            id v441 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v442 = [v428 localizedDescription];
              *(_DWORD *)long long buf = 136315394;
              *(void *)v570 = "capOverride";
              *(_WORD *)&v570[8] = 2112;
              id v571 = v442;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error fetching key '%s': %@", buf, 0x16u);
            }
            v443 = +[SDResourceManager sharedResourceManager];
            v444 = [v428 localizedDescription];
            [v443 log:@"Error fetching key '%s': %@", "capOverride", v444];
          }
        }
        v426 = 0;
        goto LABEL_391;
      }

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v216 = v213;
        id v217 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315394;
          *(void *)v570 = "remoteUUIDs";
          *(_WORD *)&v570[8] = 2112;
          id v571 = v216;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting %s to %@", buf, 0x16u);
        }

        uint64_t v218 = [v115 + 373 sharedResourceManager];
        [v218 log:@"Setting %s to %@", "remoteUUIDs", v216];

        v213 = +[CSCoordinator sharedInstance];
        v219 = [(SystemDiagnostic *)v200 diagnosticID];
        [v213 setRemoteUUIDs:v216 forDiagnosticID:v219];

        v220 = v216;
        goto LABEL_192;
      }
    }
    else
    {
      v213 = 0;
    }
    v220 = 0;
    goto LABEL_192;
  }
  v152 = +[NSFileManager defaultManager];
  LOBYTE(length) = 0;
  v153 = [v148 path];
  unsigned int v154 = [v152 fileExistsAtPath:v153 isDirectory:&length];
  int v155 = length;

  if (v154 && v155)
  {

    goto LABEL_140;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Specified output directory does not exist.", buf, 2u);
  }
  v432 = [v115 + 373 sharedResourceManager];
  [v432 log:@"Specified output directory does not exist."];

  void *v549 = 1;
  v433 = sub_100028174();
  uint64_t v41 = v550;
  if (os_signpost_enabled(v433))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v433, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "doSDSetup", "[do_sysdiagnose] setup/parse input ended!", buf, 2u);
  }

LABEL_378:
  id v9 = 0;
  id v33 = v552;
LABEL_487:

LABEL_488:

  return v9;
}

void sub_10003DFA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (sub_100048358(*(void **)(a1 + 40), @"com.apple.private.sysdiagnose")) {
    goto LABEL_8;
  }
  pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
  uint64_t v18 = 0;
  memset(buffer, 0, sizeof(buffer));
  unsigned int v5 = proc_pidinfo(pid, 3, 0, buffer, 136);
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v5 > 0x87)
  {
    if (v6) {
      sub_100063DCC();
    }
  }
  else if (v6)
  {
    sub_100063D50();
  }
  if (sub_100048604())
  {
LABEL_8:
    xpc_type_t type = xpc_get_type(v3);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v3);
      if (reply)
      {
        id v12 = reply;
        id v13 = sub_100034E04(*(void **)(a1 + 40), v3, reply);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v12);
LABEL_24:

        goto LABEL_25;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buffer[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ignoring message: unable to create reply", (uint8_t *)buffer, 2u);
      }
      id v8 = +[SDResourceManager sharedResourceManager];
      id v9 = v8;
      CFStringRef v10 = @"Ignoring message: unable to create reply";
LABEL_23:
      [v8 stdoutWrite:v10];

      id v12 = +[SDResourceManager sharedResourceManager];
      [v12 log:v10, v16];
      goto LABEL_24;
    }
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buffer[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unexpected peer event", (uint8_t *)buffer, 2u);
      }
      id v8 = +[SDResourceManager sharedResourceManager];
      id v9 = v8;
      CFStringRef v10 = @"unexpected peer event";
      goto LABEL_23;
    }
    if (v3 != &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
        LODWORD(buffer[0]) = 136315138;
        *(void *)((char *)buffer + 4) = string;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "peer error: %s", (uint8_t *)buffer, 0xCu);
      }
      unsigned __int16 v15 = +[SDResourceManager sharedResourceManager];
      [v15 stdoutWrite:@"peer error: %s", xpc_dictionary_get_string(v3, _xpc_error_key_description)];

      id v12 = +[SDResourceManager sharedResourceManager];
      [v12 log:@"peer error: %s", xpc_dictionary_get_string(v3, _xpc_error_key_description)];
      goto LABEL_24;
    }
  }
  else
  {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
  }
LABEL_25:
}

uint64_t sub_10003E2D4()
{
  return _os_log_send_and_compose_impl();
}

double sub_10003E304(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void sub_10003E37C(id a1)
{
  id v9 = 0;
  uint64_t v1 = +[LWCR withVersion:1 withConstraintCategory:17 withRequirements:0 withError:&v9];
  id v2 = v9;
  id v3 = (void *)qword_1000BD890;
  qword_1000BD890 = v1;

  if (!qword_1000BD890)
  {
    id v4 = sub_10002820C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v2 description];
      id v6 = [v5 UTF8String];
      *(_DWORD *)long long buf = 136315138;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to generate launch constraint: %s", buf, 0xCu);
    }
    id v7 = +[SDResourceManager sharedResourceManager];
    id v8 = [v2 description];
    [v7 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:@"Failed to generate launch constraint: %s" UTF8String:[v8 UTF8String]];

    if (!qword_1000BD890) {
      sub_100063E58();
    }
  }
}

void sub_10003EA38(id a1)
{
  uint64_t v1 = open("/dev/null", 2);
  if (v1 == -1) {
    sub_100063E84();
  }
  id v2 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v1];
  id v3 = (void *)qword_1000BD8A8;
  qword_1000BD8A8 = (uint64_t)v2;

  if (!qword_1000BD8A8) {
    sub_100063EB0();
  }
}

void sub_100040330(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long buf, int a14, __int16 a15, __int16 a16, void *a17)
{
  if (a2 == 1)
  {
    id v18 = objc_begin_catch(a1);
    id v19 = sub_10002820C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v23 = [v18 name];
      id v24 = [v17 executionLine];
      BOOL v25 = [v18 reason];
      LODWORD(buf) = 138412802;
      *(void *)((char *)&buf + 4) = v23;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v24;
      a16 = 2112;
      a17 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error '%@' while attempting to run '%@': '%@'", (uint8_t *)&buf, 0x20u);
    }
    BOOL v20 = +[SDResourceManager sharedResourceManager];
    id v21 = [v18 name];
    id v22 = [v17 executionLine];
    unsigned __int8 v26 = [v18 reason];
    [v20 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Error '%@' while attempting to run '%@': '%@'"];

    objc_end_catch();
    JUMPOUT(0x100040324);
  }
  _Unwind_Resume(a1);
}

void sub_1000412E4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long buf,int a22,__int16 a23,__int16 a24,id a25,long long a26)
{
  if (a2 == 1)
  {
    id v41 = objc_begin_catch(a1);
    BOOL v27 = sub_10002820C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [v41 name];
      unsigned __int8 v29 = [v26 launchPath];
      id v30 = [v29 lastPathComponent];
      id v31 = [v26 stdoutPath];
      id v32 = [v31 lastPathComponent];
      id v33 = [v41 reason];
      LODWORD(buf) = 138413058;
      *(void *)((char *)&buf + 4) = v28;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v30;
      a24 = 2112;
      a25 = v32;
      LOWORD(a26) = 2112;
      *(void *)((char *)&a26 + 2) = v33;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Error '%@' while attempting to terminate '%@|%@': %@'", (uint8_t *)&buf, 0x2Au);
    }
    BOOL v34 = +[SDResourceManager sharedResourceManager];
    id v35 = [v41 name];
    unsigned int v36 = [v26 launchPath];
    uint64_t v37 = [v36 lastPathComponent];
    uint64_t v38 = [v26 stdoutPath];
    char v39 = [v38 lastPathComponent];
    uint64_t v40 = [v41 reason];
    [v34 logWithSubsystem:"com.apple.sysdiagnose" category:"containers" msg:@"Error '%@' while attempting to terminate '%@|%@': %@'"];

    objc_end_catch();
    JUMPOUT(0x100041204);
  }
  _Unwind_Resume(a1);
}

id sub_1000414DC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isRunning];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = (*(_DWORD *)(a1 + 40) + 1);
    return [v3 stop:v4];
  }
  return result;
}

void sub_100041AA8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100041AC8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100041B00(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100041B18(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100041B8C(id a1)
{
  uint64_t v1 = objc_alloc_init(SDTaskDepot);
  id v2 = (void *)qword_1000BD8B0;
  qword_1000BD8B0 = (uint64_t)v1;

  [(id)qword_1000BD8B0 setOutputDirectory:0];
  [(id)qword_1000BD8B0 setMayStartExecuting:1];
  [(id)qword_1000BD8B0 setNoTimeout:0];
  [(id)qword_1000BD8B0 setTotalTasks:0];
  [(id)qword_1000BD8B0 setTotalFailedTasks:0];
  [(id)qword_1000BD8B0 setTotalTimeouts:0];
  [(id)qword_1000BD8B0 setPushBufferDelegate:0];
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.sysdiagnose.SDTaskDepot.taskQueue", v3);
  [(id)qword_1000BD8B0 setTaskQueue:v4];

  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  [(id)qword_1000BD8B0 setDefaultAllTasksFinishedSemaphore:v5];

  id v6 = +[NSMutableArray array];
  [(id)qword_1000BD8B0 setAllTasksFinishedSemaphoresArray:v6];

  id v7 = +[NSMutableArray array];
  [(id)qword_1000BD8B0 setRunningTaskContainers:v7];

  [(id)qword_1000BD8B0 setNumRunningBlocks:0];
  [(id)qword_1000BD8B0 setNumRunningTaskContainers:0];
  [(id)qword_1000BD8B0 setMinimumTimeBeforeTimeouts:0.0];
  id v8 = (void *)qword_1000BD8B0;

  [v8 setTaskCompletionBlock:0];
}

void sub_1000421C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100042564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  objc_sync_exit(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_1000425A4(uint64_t a1)
{
  intptr_t result = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

void sub_100042868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100042890(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) reapTasks];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

id sub_100042A38(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMayStartExecuting:0];
}

void sub_100043400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100043434(uint64_t a1)
{
  [*(id *)(a1 + 32) setStartDate:*(void *)(a1 + 40)];
  id result = [*(id *)(a1 + 32) _execute];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_100043470(uint64_t a1)
{
  [*(id *)(a1 + 32) setStartDate:*(void *)(a1 + 40)];
  id result = [*(id *)(a1 + 32) _execute];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100043684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004369C(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) setBlockUntilFinished:[*(id *)(a1 + 32) runByItself] | [*(id *)(a1 + 32) blockUntilFinished]];
  id v3 = +[SDTaskDepot sharedTaskDepot];
  [*v2 updateContainerWithOverride];
  if (([*v2 evaluateCollectionFlags] & 1) == 0)
  {
    id v14 = [v3 taskCompletionBlock];

    if (!v14) {
      goto LABEL_19;
    }
    unsigned __int16 v15 = [v3 taskCompletionBlock];
    v15[2]();
LABEL_18:

    goto LABEL_19;
  }
  if ([*v2 runByItself])
  {
    dispatch_queue_t v4 = sub_10002820C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_semaphore_t v5 = [*v2 name];
      *(_DWORD *)long long buf = 138412290;
      id v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Waiting for other containers to finish before starting %@", buf, 0xCu);
    }
    id v6 = +[SDResourceManager sharedResourceManager];
    id v7 = [*v2 name];
    [v6 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Waiting for other containers to finish before starting %@", v7 category msg];

    [v3 waitUntilAllTasksComplete:0];
  }
  id v8 = *v2;
  id v9 = +[NSDate date];
  LOBYTE(v8) = [v8 setStartDate:v9 AndExecuteFromCallback:0];

  if ((v8 & 1) == 0)
  {
    uint64_t v16 = sub_10002820C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100064A34(v2);
    }

    unsigned __int16 v15 = +[SDResourceManager sharedResourceManager];
    id v17 = [*v2 name];
    [v15 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Failed to execute %@", v17 category msg];

    goto LABEL_18;
  }
  if ([*v2 blockUntilFinished] && objc_msgSend(v3, "mayStartExecuting"))
  {
    uint64_t v10 = sub_10002820C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [*v2 name];
      *(_DWORD *)long long buf = 138412290;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Waiting for container %@ to finish", buf, 0xCu);
    }
    id v12 = +[SDResourceManager sharedResourceManager];
    id v13 = [*v2 name];
    [v12 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Waiting for container %@ to finish", v13 category msg];

    [v3 waitUntilAllTasksComplete:0];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_19:
}

void sub_100044390(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) executionActivity];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100044434;
  v5[3] = &unk_10009D2B8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  os_activity_apply(v2, v5);
}

id sub_100044434(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) exitSource];
  dispatch_source_cancel(v2);

  [*(id *)(a1 + 32) childExitHandler];
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);

  return [v3 markTaskAsDone:v4];
}

void sub_100044488(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) executionActivity];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004452C;
  v5[3] = &unk_10009D2B8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  os_activity_apply(v2, v5);
}

id sub_10004452C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isRunning];
  if (result)
  {
    [*(id *)(a1 + 32) finishChild];
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    return [v3 markTaskAsDone:v4];
  }
  return result;
}

void sub_100044A0C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) completionBlock];
  v1[2]();
}

void sub_100045054(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) executionActivity];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000450E4;
  block[3] = &unk_10009CFE0;
  void block[4] = *(void *)(a1 + 32);
  os_activity_apply(v2, block);
}

void sub_1000450E4(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) setNumTimeouts:((char *)[*(id *)(a1 + 32) numTimeouts]) + 1];
  id v2 = +[SDTaskDepot sharedTaskDepot];
  id v3 = [*v1 countCPUTimeUsedNS];
  if (([*v1 isRunningAlone] & 1) != 0
    || ([*v1 ranForMaximumTime] & 1) != 0
    || [*v1 ranForMinimumTime]
    && [*v1 exceededAllowedCPUTime:v3])
  {
    uint64_t v4 = sub_10002820C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100064B4C(v1);
    }

    dispatch_semaphore_t v5 = +[SDResourceManager sharedResourceManager];
    id v6 = [*v1 name];
    uint64_t v7 = [*v1 timeoutMetricsString];
    [v5 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"[%@ container] Task(s) timed out: %@", v6, v7 category msg];

    [*v1 setNumReapedTasks:((char *)[*v1 reapTasks] + [*v1 numReapedTasks])];
    [v2 setTotalTimeouts:[v2 totalTimeouts] + 1];
  }
  else
  {
    [*v1 timeout];
    if (v8 > 5.0) {
      double v8 = 5.0;
    }
    uint64_t v9 = v8;
    uint64_t v10 = sub_10002820C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [*v1 name];
      id v12 = [*v1 timeoutMetricsString];
      *(_DWORD *)long long buf = 138412802;
      id v17 = v11;
      __int16 v18 = 1024;
      int v19 = v9;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@ container] Giving another %us timeout because it hasn't exceeded its minimum CPU and/or wall time: %@", buf, 0x1Cu);
    }
    id v13 = +[SDResourceManager sharedResourceManager];
    id v14 = [*v1 name];
    unsigned __int16 v15 = [*v1 timeoutMetricsString];
    [v13 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"[%@ container] Giving another %us timeout because it hasn't exceeded its minimum CPU and/or wall time: %@", v14, v9, v15 category msg];

    [*v1 resetTimeout:v9];
  }
}

id sub_100045C6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) endExecution];
}

void sub_100045C74(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) runningTasks];
  [v2 removeObject:*(void *)(a1 + 40)];
}

id sub_100045CC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) endExecution];
}

id sub_100045DC0(uint64_t a1)
{
  return [*(id *)(a1 + 32) startTasks];
}

id sub_100046534(uint64_t a1)
{
  id v2 = sub_10002820C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100064DB0(a1);
  }

  id v3 = +[SDResourceManager sharedResourceManager];
  uint64_t v4 = [*(id *)(a1 + 32) name];
  [v3 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Block timed out for %@. It will continue to run, but sysdiagnose will not wait for it to finish. Logs may be missing.", v4 category msg];

  return [*(id *)(a1 + 32) end];
}

void sub_100046698(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) startTimeout];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100046988;
  v16[3] = &unk_10009CFE0;
  v16[4] = *v1;
  double v2 = sub_100028914(v16);
  id v3 = sub_10002820C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*v1 name];
    *(_DWORD *)long long buf = 138412546;
    __int16 v18 = v4;
    __int16 v19 = 2048;
    double v20 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ block container executed in %.1f seconds", buf, 0x16u);
  }
  dispatch_semaphore_t v5 = +[SDResourceManager sharedResourceManager];
  id v6 = [*v1 name];
  [v5 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ block container executed in %.1f seconds", v6, *(void *)&v2 category msg];

  uint64_t v7 = [*v1 completionBlock];

  if (v7)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000469F8;
    v15[3] = &unk_10009CFE0;
    v15[4] = *v1;
    double v8 = sub_100028914(v15);
    if (v8 > 1.0)
    {
      uint64_t v9 = sub_10002820C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100064E38(v1);
      }

      uint64_t v10 = +[SDResourceManager sharedResourceManager];
      id v11 = [*v1 name];
      [v10 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Completion block for %@ took too long: %.1fs (allowed: %.1fs)", v11, *(void *)&v8, 0x3FF0000000000000 category msg];
    }
  }
  id v12 = +[SDTaskDepot sharedTaskDepot];
  id v13 = [v12 taskQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046A6C;
  block[3] = &unk_10009CFE0;
  void block[4] = *v1;
  dispatch_sync(v13, block);
}

void sub_100046988(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) block];
  double v2 = v3[2]();
  [*(id *)(a1 + 32) setPaths:v2];
}

void sub_1000469F8(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) completionBlock];
  double v2 = [*(id *)(a1 + 32) paths];
  v3[2](v3, v2);
}

id sub_100046A6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) end];
}

void sub_100046D70(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v9 = sub_10002820C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v28 = [*(id *)(a1 + 32) taskName];
      uint64_t v10 = _xpc_error_key_description;
      *(_DWORD *)long long buf = 138412546;
      id v33 = v28;
      __int16 v34 = 2080;
      string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Helper connection error for task %@: %s", buf, 0x16u);
    }
    else
    {
      uint64_t v10 = _xpc_error_key_description;
    }

    uint64_t v7 = +[SDResourceManager sharedResourceManager];
    double v8 = [*(id *)(a1 + 32) taskName];
    [v7 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Helper connection error for task %@: %s", v8, xpc_dictionary_get_string(v3, v10) category msg];
  }
  else
  {
    dispatch_semaphore_t v5 = type;
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      if (xpc_dictionary_get_BOOL(v3, "result"))
      {
        int v11 = 1;
        goto LABEL_15;
      }
      id v12 = sub_10002820C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100064FE8(a1);
      }

      uint64_t v7 = +[SDResourceManager sharedResourceManager];
      double v8 = [*(id *)(a1 + 32) taskName];
      [v7 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Helper connection error for task %@: failure while running task.", v8, v29 category msg];
    }
    else
    {
      id v6 = sub_10002820C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100065070(a1, v5);
      }

      uint64_t v7 = +[SDResourceManager sharedResourceManager];
      double v8 = [*(id *)(a1 + 32) taskName];
      [v7 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Helper connection error for task %@: Received unexpected reply with type: %s", v8, xpc_type_get_name(v5) category msg];
    }
  }

  int v11 = 0;
LABEL_15:
  id v14 = *(void **)(a1 + 32);
  id v13 = (id *)(a1 + 32);
  [v14 setReply:v3];
  unsigned __int16 v15 = [*v13 replyBlock];

  if (v15)
  {
    if (!v11)
    {
      double v20 = sub_10002820C();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100064F60(v13);
      }

      __int16 v18 = +[SDResourceManager sharedResourceManager];
      __int16 v19 = [*v13 taskName];
      [v18 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Helper connection error for task %@: not calling reply block due to failure", v19, v29, v30 category msg];
      goto LABEL_24;
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100047264;
    v31[3] = &unk_10009CFE0;
    v31[4] = *v13;
    double v16 = sub_100028914(v31);
    if (v16 > 1.0)
    {
      id v17 = sub_10002820C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100064ECC(v13);
      }

      __int16 v18 = +[SDResourceManager sharedResourceManager];
      __int16 v19 = [*v13 taskName];
      [v18 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Helper connection error for task %@: reply took too long: %.1fs (allowed: %.1fs)", v19, *(void *)&v16, 0x3FF0000000000000 category msg];
LABEL_24:
    }
  }
  id v21 = +[SDTaskDepot sharedTaskDepot];
  [v21 recordHelperTaskEnd];

  id v22 = sub_100028174();
  id v23 = v22;
  id v24 = *v13;
  if ((unint64_t)*v13 + 1 >= 2 && os_signpost_enabled(v22))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v24, "Helper Task", "", buf, 2u);
  }

  xpc_object_t v25 = xpc_dictionary_create(0, 0, 0);
  unsigned __int8 v26 = v25;
  if (v25)
  {
    xpc_dictionary_set_int64(v25, "taskType", -1);
    BOOL v27 = [*v13 logAgentConnection];
    xpc_connection_send_message(v27, v26);
  }
}

void sub_100047264(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) replyBlock];
  double v2 = [*(id *)(a1 + 32) reply];
  v3[2](v3, v2);
}

void sub_100047700(id a1, OS_xpc_object *a2)
{
  double v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    id v3 = sub_10002820C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      string = xpc_dictionary_get_string(v2, _xpc_error_key_description);
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "XPC connection with sysdiagnose_helper failed with error: %s", buf, 0xCu);
    }

    uint64_t v4 = +[SDResourceManager sharedResourceManager];
    [v4 logWithSubsystem:@"com.apple.sysdiagnose" category:@"containers" msg:@"XPC connection with sysdiagnose_helper failed with error: %s" xpc_dictionary_get_string(v2, _xpc_error_key_description)];
  }
}

void sub_1000479C4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000479E4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

__CFString *sub_100047A04(int a1)
{
  double v2 = 0;
  switch(a1)
  {
    case -1:
      double v2 = @"END_HELPER";
      break;
    case 1:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_ACCESSIBILITY_PREFERENCES";
      goto LABEL_64;
    case 2:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_AC_LOGS";
      goto LABEL_64;
    case 3:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_ASPTOOL";
      goto LABEL_64;
    case 4:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_ASPTOOL_MAGAZINE";
      goto LABEL_64;
    case 5:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_ASPTOOL_SNAP";
      goto LABEL_64;
    case 6:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_ASPTOOL_TRACE";
      goto LABEL_64;
    case 7:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_AWD";
      goto LABEL_64;
    case 8:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_BACKGROUND_POWER_LOGS";
      goto LABEL_64;
    case 9:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_BATTERY_HEALTH";
      goto LABEL_64;
    case 10:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_BATTERY_UI";
      goto LABEL_64;
    case 11:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_BTPHY";
      goto LABEL_64;
    case 12:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_CLOUDKIT_PREFERENCES";
      goto LABEL_64;
    case 13:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_CORECAPTURE_BT";
      goto LABEL_64;
    case 14:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_CORECAPTURE_CONFIG";
      goto LABEL_64;
    case 15:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_CORECAPTURE_WIFI";
      goto LABEL_64;
    case 16:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_COREREPAIR_DIAGNOSTIC";
      goto LABEL_64;
    case 17:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_DATACACHE";
      goto LABEL_64;
    case 18:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_DSCSYM";
      goto LABEL_64;
    case 19:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_ENDPOINT_SECURITY";
      goto LABEL_64;
    case 20:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_EXC_RESOURCE";
      goto LABEL_64;
    case 21:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_FDR_DIAGNOSTIC";
      goto LABEL_64;
    case 22:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_FILE_COORDINATION";
      goto LABEL_64;
    case 23:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_GE_AVAILABILITY";
      goto LABEL_64;
    case 24:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_HANDSHAKE";
      goto LABEL_64;
    case 25:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_HID_CRASHLOGS";
      goto LABEL_64;
    case 26:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_KEYBOARD_PREFERENCES";
      goto LABEL_64;
    case 27:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_LIBNOTIFY";
      goto LABEL_64;
    case 28:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_MEMORY_EXCEPTIONS";
      goto LABEL_64;
    case 29:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_MEMORY_EXCEPTIONS_LIST_LOGS";
      goto LABEL_64;
    case 30:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_NETWORK_RELAY";
      goto LABEL_64;
    case 31:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_OS_ELIGIBILITY";
      goto LABEL_64;
    case 32:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_PERSONALIZATION";
      goto LABEL_64;
    case 33:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_POWER_LOGS";
      goto LABEL_64;
    case 34:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_PREFERENCES";
      goto LABEL_64;
    case 35:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_PREFERENCES_INTERNAL";
      goto LABEL_64;
    case 36:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_PROACTIVE_INPUT";
      goto LABEL_64;
    case 37:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_PROMPT";
      goto LABEL_64;
    case 38:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_PROXIMITY";
      goto LABEL_64;
    case 39:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_RUNNING_BOARD";
      goto LABEL_64;
    case 40:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_STACKSHOT_TAKE_AND_RETRIEVE";
      goto LABEL_64;
    case 41:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_STACKSHOT_RETRIEVE_EXISTING";
      goto LABEL_64;
    case 42:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_SYSMON";
      goto LABEL_64;
    case 43:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_SYSTEM_EXP";
      goto LABEL_64;
    case 44:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_SYSTEM_STATS";
      goto LABEL_64;
    case 45:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_TAILSPIN_AUGMENT_LG";
      goto LABEL_64;
    case 46:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_TAILSPIN_INFO";
      goto LABEL_64;
    case 47:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_TAILSPIN_KEYCHORD";
      goto LABEL_64;
    case 48:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_TAILSPIN_LOGARCHIVE_TIMEOUT";
      goto LABEL_64;
    case 49:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_TAILSPIN_OUTPUTDIR_TIMEOUT";
      goto LABEL_64;
    case 50:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_TAILSPIN_SAVE_NO_SYMBOLICATE_TS";
      goto LABEL_64;
    case 51:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_TIMEZONE";
      goto LABEL_64;
    case 52:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_TRIAL";
      goto LABEL_64;
    case 53:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_TRIGGER_CORETHREAD_TOPOLOGY";
      goto LABEL_64;
    case 54:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_UNIFIED_ASSET";
      goto LABEL_64;
    case 55:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_INTELLIGENCE_PLATFORM";
      goto LABEL_64;
    case 56:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_POLARIS";
      goto LABEL_64;
    case 57:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_BASEBAND_TS_TRIGGER";
      goto LABEL_64;
    case 58:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_UID";
      goto LABEL_64;
    case 59:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_SPRING_BOARD_STATE_DUMP";
      goto LABEL_64;
    case 60:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_APPLECV3D";
      goto LABEL_64;
    case 61:
      id v3 = [@"TASK_TYPE_" length];
      uint64_t v4 = @"TASK_TYPE_SIRI_ENROLLMENT";
LABEL_64:
      double v2 = [(__CFString *)v4 substringFromIndex:v3];
      break;
    default:
      break;
  }

  return v2;
}

uint64_t sub_100048214(char *a1, size_t a2, const char *a3, const char *a4, const char *a5)
{
  memset(&v18, 0, sizeof(v18));
  time_t v19 = time(0);
  if (!localtime_r(&v19, &v18) || !strftime(__str, 0x40uLL, "%Y.%m.%d_%H-%M-%S%z", &v18))
  {
    uint32_t v10 = arc4random();
    snprintf(__str, 0x40uLL, "UNKNOWN-%u", v10);
  }
  int v11 = "";
  id v12 = "_";
  if (a3) {
    id v13 = a3;
  }
  else {
    id v13 = "";
  }
  if (!a3) {
    id v12 = "";
  }
  id v14 = "-";
  if (a4)
  {
    unsigned __int16 v15 = a4;
  }
  else
  {
    id v14 = "";
    unsigned __int16 v15 = "";
  }
  double v16 = ".";
  if (a5) {
    int v11 = a5;
  }
  else {
    double v16 = "";
  }
  return snprintf(a1, a2, "%s%s%s%s%s%s%s", v13, v12, __str, v14, v15, v16, v11);
}

uint64_t sub_100048358(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  [v3 UTF8String];
  dispatch_semaphore_t v5 = (void *)xpc_connection_copy_entitlement_value();

  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL)
  {
    if (xpc_BOOL_get_value(v5))
    {
      uint64_t v6 = 1;
      goto LABEL_10;
    }
    uint64_t v6 = 0;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v10 = 138412546;
    id v11 = v3;
    __int16 v12 = 1024;
    int v13 = 0;
    uint64_t v7 = "Peer has entitlement '%@' set, but value is %d";
    uint32_t v8 = 18;
    goto LABEL_5;
  }
  uint64_t v6 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    uint64_t v7 = "Peer does not have entitlement '%@' set, returning default NO for check";
    uint32_t v8 = 12;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v8);
    uint64_t v6 = 0;
  }
LABEL_10:

  return v6;
}

uint64_t sub_1000484D4()
{
  if (qword_1000BD8C8 != -1) {
    dispatch_once(&qword_1000BD8C8, &stru_10009DD48);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1000BD8C0) {
      uint64_t v0 = "launchd";
    }
    else {
      uint64_t v0 = "shell";
    }
    int v2 = 136315138;
    id v3 = v0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "started by %s", (uint8_t *)&v2, 0xCu);
  }
  return byte_1000BD8C0;
}

void sub_1000485BC(id a1)
{
  byte_1000BD8C0 = 0;
}

uint64_t sub_100048604()
{
  if (qword_1000BD8D8 != -1) {
    dispatch_once(&qword_1000BD8D8, &stru_10009DD68);
  }
  return byte_1000BD8D0;
}

void sub_100048648(id a1)
{
  if (os_variant_has_internal_diagnostics()) {
    char has_internal_content = 1;
  }
  else {
    char has_internal_content = os_variant_has_internal_content();
  }
  byte_1000BD8D0 = has_internal_content;
  BOOL v3 = 0;
  if (sub_1000487D8(@"customer-mode", @"com.apple.sysdiagnose", &v3) && v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Customer-mode enabled. Forcing external behavior.", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "To disable, run: 'sudo defaults write com.apple.sysdiagnose customer-mode -BOOL false; sudo pkill -9 sysdiagnose'",
        buf,
        2u);
    }
    byte_1000BD8D0 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1000BD8D0) {
      int v2 = "YES";
    }
    else {
      int v2 = "NO";
    }
    *(_DWORD *)long long buf = 136315138;
    dispatch_semaphore_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Apple Internal: %s", buf, 0xCu);
  }
}

BOOL sub_1000487D8(void *a1, void *a2, BOOL *a3)
{
  dispatch_semaphore_t v5 = a1;
  CFStringRef v6 = a2;
  uint64_t v7 = (__CFString *)v6;
  if (v5 && v6 && a3)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(v5, v6, &keyExistsAndHasValidFormat);
    int v9 = keyExistsAndHasValidFormat;
    if (keyExistsAndHasValidFormat) {
      *a3 = AppBooleanValue != 0;
    }
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_1000651A0(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t sub_100048888(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a1;
  uint32_t v8 = a2;
  CFStringRef v9 = a3;
  BOOL v10 = (__CFString *)v9;
  if (!v7 || !v8 || !v9 || !a4)
  {
    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v15) {
      sub_10006521C(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_11;
  }
  CFPropertyListRef v11 = CFPreferencesCopyValue(v7, v8, v9, kCFPreferencesAnyHost);
  if (!v11)
  {
LABEL_11:
    uint64_t v14 = 0;
    goto LABEL_12;
  }
  uint64_t v12 = (void *)v11;
  CFTypeID v13 = CFGetTypeID(v11);
  if (v13 != CFNumberGetTypeID())
  {
    CFRelease(v12);
    goto LABEL_11;
  }
  *a4 = [v12 longValue];

  uint64_t v14 = 1;
LABEL_12:

  return v14;
}

BOOL sub_100048970(const char *a1, const char *a2)
{
  size_t v4 = strlen(a1);
  size_t v5 = strlen(a2);
  size_t v6 = v5;
  if (v5 >= v4) {
    size_t v7 = v4;
  }
  else {
    size_t v7 = v5;
  }
  if (!strncasecmp(a2, a1, v7)) {
    return 1;
  }
  if (v6 <= v4) {
    uint32_t v8 = a1;
  }
  else {
    uint32_t v8 = a2;
  }
  if (v6 <= v4) {
    CFStringRef v9 = a2;
  }
  else {
    CFStringRef v9 = a1;
  }
  return strcasestr(v8, v9) != 0;
}

BOOL sub_1000489E8()
{
  uint64_t v0 = (void *)__chkstk_darwin();
  id v2 = v1;
  if (proc_pidpath((int)[v0 intValue], buffer, 0x1000u) < 1)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v3 = +[NSString stringWithUTF8String:buffer];
    BOOL v4 = sub_100048970([v3 fileSystemRepresentation], [v2 fileSystemRepresentation]);
  }
  return v4;
}

BOOL sub_100048AD8(const void *a1)
{
  id v2 = (const void *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  BOOL v4 = CFEqual(v2, a1) != 0;
  CFRelease(v3);
  return v4;
}

uint64_t sub_100048B34()
{
  if (qword_1000BD8E8 != -1) {
    dispatch_once(&qword_1000BD8E8, &stru_10009DD88);
  }
  return byte_1000BD8E0;
}

void sub_100048B78(id a1)
{
  byte_1000BD8E0 = sub_100048AD8(@"AppleTV");
}

uint64_t sub_100048BA0()
{
  if (qword_1000BD8F8 != -1) {
    dispatch_once(&qword_1000BD8F8, &stru_10009DDA8);
  }
  return byte_1000BD8F0;
}

void sub_100048BE4(id a1)
{
  byte_1000BD8F0 = sub_100048AD8(@"iPad");
}

uint64_t sub_100048C0C()
{
  if (qword_1000BD908 != -1) {
    dispatch_once(&qword_1000BD908, &stru_10009DDC8);
  }
  return byte_1000BD900;
}

void sub_100048C50(id a1)
{
  byte_1000BD900 = sub_100048AD8(@"iPhone");
}

uint64_t sub_100048C78()
{
  if (qword_1000BD918 != -1) {
    dispatch_once(&qword_1000BD918, &stru_10009DDE8);
  }
  return byte_1000BD910;
}

void sub_100048CBC(id a1)
{
  byte_1000BD910 = sub_100048AD8(@"AppleDisplay");
}

uint64_t sub_100048CE4()
{
  if (qword_1000BD928 != -1) {
    dispatch_once(&qword_1000BD928, &stru_10009DE08);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = byte_1000BD920;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got result %d for isComputeModuleB check", (uint8_t *)v1, 8u);
  }
  return byte_1000BD920;
}

void sub_100048DB4(id a1)
{
  byte_1000BD920 = sub_100048DDC("manta-b");
}

uint64_t sub_100048DDC(const char *a1)
{
  kern_return_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  kern_return_t v14;
  io_registry_entry_t v16;
  kern_return_t v17;
  uint64_t v18;
  uint64_t v19;
  io_iterator_t iterator[2];
  uint8_t buf[4];
  _DWORD v22[3];
  io_name_t name;
  void v24[2];
  uint64_t v25;

  *(void *)iterator = 0;
  if (!a1)
  {
    xpc_object_t v25 = 0;
    memset(name, 0, 80);
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    LODWORD(v24[0]) = 134217984;
    *(void *)((char *)v24 + 4) = 0;
    _os_log_send_and_compose_impl();
    uint64_t v18 = _os_crash_msg();
    sub_100065298(v18);
  }
  io_iterator_t v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/");
  io_object_t v3 = v2;
  iterator[1] = v2;
  if (v2)
  {
    BOOL v4 = IORegistryEntryCreateIterator(v2, "IODeviceTree", 0, iterator);
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100065414(v4);
      }
    }
    else
    {
      while (1)
      {
        uint64_t v16 = IOIteratorNext(iterator[0]);
        if (!v16) {
          break;
        }
        memset(name, 0, sizeof(name));
        uint64_t v17 = IORegistryEntryGetName(v16, name);
        if (v17)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1000653C8(buf, v17, v22);
          }
        }
        else if (!strcmp(a1, name))
        {
          CFTypeID v13 = 1;
          goto LABEL_9;
        }
      }
    }
  }
  else
  {
    size_t v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_10006534C(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  CFTypeID v13 = 0;
LABEL_9:
  if (iterator[0])
  {
    uint64_t v14 = IOObjectRelease(iterator[0]);
    if (v14)
    {
      v24[0] = 0;
      memset(name, 0, 80);
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      LODWORD(v25) = 67109120;
      HIDWORD(v25) = v14;
      _os_log_send_and_compose_impl();
      uint64_t v19 = _os_crash_msg();
      sub_100065298(v19);
    }
  }
  if (v3 && IOObjectRelease(v3)) {
    sub_10006529C(v24, name);
  }
  return v13;
}

void sub_1000490B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13)
{
}

uint64_t sub_1000490F0()
{
  if (qword_1000BD938 != -1) {
    dispatch_once(&qword_1000BD938, &stru_10009DE28);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = byte_1000BD930;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got result %d for isComputeModuleC check", (uint8_t *)v1, 8u);
  }
  return byte_1000BD930;
}

void sub_1000491C0(id a1)
{
  byte_1000BD930 = sub_100048DDC("manta-c");
}

NSString *sub_1000491E8()
{
  return +[NSString stringWithFormat:@"sysdiagnose version %d.%d", 3, 0];
}

uint64_t sub_100049220(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    if (result) {
      sub_100065494(&v2, v3);
    }
  }
  return result;
}

uint64_t sub_10004A514(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  size_t v6 = +[NSString stringWithUTF8String:a2];
  if ([*(id *)(a1 + 32) containsObject:v6])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v12 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Skipping forwarding %s key", buf, 0xCu);
    }
    size_t v7 = +[SDResourceManager sharedResourceManager];
    [v7 log:@"Skipping forwarding %s key", a2];
  }
  else
  {
    uint32_t v8 = *(void **)(a1 + 40);
    xpc_object_t v9 = xpc_copy(v5);
    xpc_dictionary_set_value(v8, a2, v9);
  }
  return 1;
}

void sub_10004C4C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
}

void sub_10004C510(uint64_t a1)
{
  if ([*(id *)(a1 + 32) prepareOutput])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to create the output directory.", v4, 2u);
    }
    uint64_t v2 = +[SDResourceManager sharedResourceManager];
    [v2 stdoutWrite:@"Unable to create the output directory."];

    io_object_t v3 = +[SDResourceManager sharedResourceManager];
    [v3 log:@"Unable to create the output directory."];
  }
}

uint64_t sub_10004E0DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004E1C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004EC48(uint64_t a1, void *a2, char a3)
{
  id v12 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a3)
  {
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_9;
    }
    id v6 = v12;
    size_t v7 = [v6 durationMetrics];

    if (v7)
    {
      uint32_t v8 = [*(id *)(a1 + 32) metricsDict];
      xpc_object_t v9 = [v6 durationMetrics];
      [v8 addEntriesFromDictionary:v9];
    }
  }
  else
  {
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_9;
    }
    BOOL v10 = +[SDComplexContainer complexContainerWithSPITask:48 withTimeout:&stru_1000A1EA8 atDestination:*(void *)(a1 + 32) withDelegate:10.0];
    id v6 = v10;
    if (v10)
    {
      CFPropertyListRef v11 = [v10 collectionContainer];
      [v11 setMaximumSizeMB:200];

      [v6 setRuntimeChecks:64];
      [v6 setName:@"tailspin-save-logarchive-timeout"];
      [v6 execute];
    }
  }

LABEL_9:
}

id sub_10004F2BC(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1000504B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100050608(uint64_t a1)
{
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v4);
  uint64_t v2 = *(void **)(a1 + 40);
  io_object_t v3 = [*(id *)(a1 + 48) diagnosticID];
  [v2 registerActivityWithID:v3];

  [*(id *)(a1 + 40) finishedItemForPhaseAndUpdatePeer:*(unsigned int *)(a1 + 56)];
  os_activity_scope_leave(&v4);
}

void sub_10005067C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

id sub_100051A04(uint64_t a1)
{
  return [*(id *)(a1 + 32) prompt];
}

void sub_1000531E0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) archive];
  [v2 addArchiveFile:*(void *)(a1 + 40)];
}

void sub_100053BAC(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  uint32_t v8 = sub_100053CA8;
  xpc_object_t v9 = &unk_10009D9E8;
  BOOL v10 = v2;
  xpc_remote_connection_set_event_handler();
  xpc_remote_connection_activate();
  io_object_t v3 = +[CSCoordinator sharedInstance];
  os_activity_scope_state_s v4 = [v3 logSubsystem];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Connection started.", v5, 2u);
  }
}

void sub_100053CA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  id v5 = +[CSCoordinator sharedInstance];
  id v6 = [v5 logSubsystem];

  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v7)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Initiating remote connection", buf, 2u);
    }

    +[CSRemoteXPCProxy handleRemoteConnection:*(void *)(a1 + 32) forMsg:v3 isTrusted:1];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)uint32_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Cancelling remote connection", v8, 2u);
    }

    xpc_remote_connection_cancel();
  }
}

void sub_100054190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000541C8(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = +[CSCoordinator sharedInstance];
  BOOL v7 = [v6 logSubsystem];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Found device %@", (uint8_t *)&v12, 0xCu);
  }

  if (a3)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else if (v5)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint32_t v8 = +[CSRemoteXPCProxy getService:"com.apple.sysdiagnose.remote.trusted" forDevice:v5];

    if (v8)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      id v9 = [(CSRemoteXPCProxy *)[CSCoreDeviceProxy alloc] _initWithDevice:v5 forDiagnosticID:*(void *)(a1 + 40)];
      [*(id *)(a1 + 48) addObject:v9];
    }
  }
  else
  {
    BOOL v10 = +[CSCoordinator sharedInstance];
    CFPropertyListRef v11 = [v10 logSubsystem];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100065E48(v11);
    }
  }
}

void sub_1000547E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100054800(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareSummary];
  [*(id *)(a1 + 32) updateContainerWithOverride];
  if ([*(id *)(a1 + 32) evaluateCollectionFlags])
  {
    id v2 = [*(id *)(a1 + 32) delegate];

    if (v2)
    {
      id v3 = [*(id *)(a1 + 32) delegate];
      id v4 = [v3 shouldStreamToTar];

      id v5 = [*(id *)(a1 + 32) delegate];
      id v2 = [v5 outputDirectory];
    }
    else
    {
      id v4 = 0;
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [*(id *)(a1 + 32) units];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          CFPropertyListRef v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          [*(id *)(a1 + 32) applyRule:v11];
          if ([v11 pipelineFlush])
          {
            [*(id *)(a1 + 32) writeToSummary:@"Flushing the LogCollection Pipeline\n"];
            [*(id *)(a1 + 32) enforceContainerSizeLimit];
            [*(id *)(a1 + 32) copyFilesForDirectory:v2 withStreaming:v4];
            [*(id *)(a1 + 32) clearLogs];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [*(id *)(a1 + 32) enforceContainerSizeLimit];
    [*(id *)(a1 + 32) copyFilesForDirectory:v2 withStreaming:v4];
    [*(id *)(a1 + 32) closeSummary];
    [*(id *)(a1 + 32) clearLogs];
    int v12 = [*(id *)(a1 + 32) units];
    [v12 removeAllObjects];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

id sub_100056460(void *a1)
{
  id v1 = a1;
  id v2 = +[NSArray arrayWithObjects:@"/var", @"/tmp", @"/etc", 0];
  id v3 = v1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
  id v5 = v3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v13;
    id v5 = v3;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v2);
        }
        if ([v3 hasPrefix:*(void *)(*((void *)&v12 + 1) + 8 * i)])
        {
          v16[0] = @"/private";
          v16[1] = v3;
          uint64_t v9 = +[NSArray arrayWithObjects:v16 count:2];
          uint64_t v10 = +[NSString pathWithComponents:v9];

          id v5 = (void *)v10;
        }
      }
      id v6 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }

  return v5;
}

uint64_t sub_100056610(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  if ((*(_WORD *)(a1 + 4) & 0xF000) != 0x8000 || *(unsigned __int16 *)(a1 + 6) < 2u) {
    return 0;
  }
  *__error() = 9;
  return 1;
}

uint64_t sub_100056668(int a1)
{
  memset(&v3, 0, sizeof(v3));
  if (fstat(a1, &v3) != -1)
  {
    if ((v3.st_mode & 0xF000) != 0x8000 || v3.st_nlink < 2u) {
      return 0;
    }
    *__error() = 9;
  }
  return 1;
}

uint64_t sub_1000566DC(const char *a1, int a2, unsigned int a3)
{
  return open(a1, a2 | 0x20000A00, a3);
}

uint64_t sub_100056710(const char *a1, int a2)
{
  if ((a2 & 0x200) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = open(a1, a2 | 0x20000000);
  uint64_t v3 = v2;
  if (v2 != -1 && sub_100056668(v2))
  {
    close(v3);
    return 0xFFFFFFFFLL;
  }
  return v3;
}

uint64_t sub_100056760(int a1, const char *a2, int a3)
{
  if ((a3 & 0x200) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = openat(a1, a2, a3 | 0x20000000);
  uint64_t v4 = v3;
  if (v3 != -1 && sub_100056668(v3))
  {
    close(v4);
    return 0xFFFFFFFFLL;
  }
  return v4;
}

uint64_t sub_1000567B0(const char *a1, uid_t a2, gid_t a3)
{
  int v5 = sub_100056710(a1, 0);
  if (v5 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v6 = v5;
  if (fchown(v5, a2, a3) == -1) {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v7 = 0;
  }
  close(v6);
  return v7;
}

uint64_t sub_100056818(const char *a1, mode_t a2)
{
  int v3 = sub_100056710(a1, 0);
  if (v3 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v4 = v3;
  if (fchmod(v3, a2) == -1) {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v5 = 0;
  }
  close(v4);
  return v5;
}

uint64_t sub_100056870(const char *a1, const char *a2, copyfile_flags_t a3)
{
  int v5 = sub_100056710(a1, 0);
  if (v5 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v6 = v5;
  int v7 = open(a2, 536873473, 420);
  if (v7 == -1)
  {
    uint64_t v9 = 0xFFFFFFFFLL;
  }
  else
  {
    int v8 = v7;
    uint64_t v9 = fcopyfile(v6, v7, 0, a3);
    close(v6);
    int v6 = v8;
  }
  close(v6);
  return v9;
}

id sub_100056DA8()
{
  if (qword_1000BD940 != -1) {
    dispatch_once(&qword_1000BD940, &stru_10009E080);
  }
  uint64_t v0 = (void *)qword_1000BD948;

  return v0;
}

void sub_100056F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100056F5C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100056F6C(uint64_t a1)
{
}

__CFDictionary *__cdecl sub_100056F74(id a1, int a2, __CFDictionary *a3)
{
  int v3 = [(__CFDictionary *)a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  int v4 = sub_100056DA8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    int v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received request to report purgeable for volume '%{public}@. Skipping", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

__CFDictionary *__cdecl sub_100057034(id a1, int a2, __CFDictionary *a3)
{
  int v3 = [(__CFDictionary *)a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  int v4 = sub_100056DA8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    int v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received purge request for volume '%{public}@. Skipping", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

void sub_1000570F4(id a1)
{
  id v1 = sub_100056DA8();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Received purge cancel request. Skipping", v2, 2u);
  }
}

id sub_10005715C(uint64_t a1, uint64_t a2, void *a3)
{
  int v4 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  int v5 = sub_100056DA8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received periodic purge request for volume '%{public}@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) periodicAPFSMarkAsPurgeable:v4];
  return v6;
}

void sub_100057260(id a1)
{
  qword_1000BD948 = (uint64_t)os_log_create("com.apple.sysdiagnose.CacheDelete", "deleter");

  _objc_release_x1();
}

int64_t sub_10005791C(id a1, NSURL *a2, NSURL *a3)
{
  id v9 = 0;
  int v4 = a3;
  [(NSURL *)a2 getResourceValue:&v9 forKey:NSURLCreationDateKey error:0];
  id v8 = 0;
  id v5 = v9;
  [(NSURL *)v4 getResourceValue:&v8 forKey:NSURLCreationDateKey error:0];

  id v6 = [v8 compare:v5];
  return (int64_t)v6;
}

void sub_1000586E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (v5 || !v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device assertion failed, %@", buf, 0xCu);
    }
    id v8 = +[SDResourceManager sharedResourceManager];
    [v8 log:@"Device assertion failed, %@", v5];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 320), a3);
  }
}

void sub_100058AA0(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Launching Settings ...", v5, 2u);
  }
  id v1 = +[SDResourceManager sharedResourceManager];
  [v1 stdoutWrite:@"Launching Settings ..."];

  uint64_t v2 = +[SDResourceManager sharedResourceManager];
  [v2 log:@"Launching Settings ..."];

  int v3 = +[NSURL URLWithString:@"prefs:root=INTERNAL_SETTINGS&path=sysdiagnose"];
  int v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 openSensitiveURL:v3 withOptions:0];
}

void sub_10005AA30(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out in transferring watch archive", v2, 2u);
  }
  id v1 = +[SDResourceManager sharedResourceManager];
  [v1 log:@"Timed out in transferring watch archive"];

  sub_10002AFA4(0);
}

void sub_10005B10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10005B12C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10005B13C(uint64_t a1)
{
}

void sub_10005B144(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543874;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v8;
    __int16 v20 = 2114;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Current User Activity UUID %{public}@; BundleId: %{public}@; Error: %{public}@",
      buf,
      0x20u);
  }
  id v10 = +[SDResourceManager sharedResourceManager];
  [v10 stdoutWrite:@"Current User Activity UUID %{public}@; BundleId: %{public}@; Error: %{public}@",
    v7,
    v8,
    v9);

  CFPropertyListRef v11 = +[SDResourceManager sharedResourceManager];
  [v11 log:@"Current User Activity UUID %@; BundleId: %@; Error: %@",
    v7,
    v8,
    v9);

  if (v7)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10005B31C;
    v14[3] = &unk_10009E130;
    long long v13 = *(_OWORD *)(a1 + 32);
    id v12 = (id)v13;
    long long v15 = v13;
    +[UAUserActivity fetchUserActivityWithUUID:v7 completionHandler:v14];
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void sub_10005B31C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User activity: %@; error: %@",
      buf,
      0x16u);
  }
  id v7 = +[SDResourceManager sharedResourceManager];
  [v7 stdoutWrite:@"User activity: %@; error: %@", v5, v6];

  id v8 = +[SDResourceManager sharedResourceManager];
  [v8 log:@"User activity: %@; error: %@", v5, v6];

  id v9 = [v5 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"tap-to-radar"];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10005B77C(int *a1, char *a2, size_t a3)
{
  size_t v3 = a3;
  int v4 = a2;
  int v5 = *a1;
  unint64_t v6 = write(*a1, a2, a3);
  uint64_t v7 = 0;
  if (v6)
  {
    while (v6 != v3)
    {
      if (v6 >= v3) {
        unint64_t v8 = 0;
      }
      else {
        unint64_t v8 = v6;
      }
      v4 += v8;
      v3 -= v8;
      v7 += v8;
      unint64_t v6 = write(v5, v4, v3);
      if (!v6) {
        return v7;
      }
    }
    v7 += v6;
  }
  return v7;
}

BOOL sub_10005D578(id a1, NSURL *a2, NSError *a3)
{
  size_t v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(NSError *)v3 localizedDescription];
    *(_DWORD *)long long buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive error %@", buf, 0xCu);
  }
  int v5 = +[SDResourceManager sharedResourceManager];
  unint64_t v6 = [(NSError *)v3 localizedDescription];
  [v5 log:@"SDArchive error %@", v6];

  return 1;
}

void sub_10005DE98(id a1)
{
  id v1 = objc_alloc_init(SystemDiagnosticIDS);
  uint64_t v2 = (void *)qword_1000BD958;
  qword_1000BD958 = (uint64_t)v1;

  size_t v3 = (void *)qword_1000BD958;

  [v3 setTransferIdentifier:&stru_1000A1EA8];
}

void sub_10005E138(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) service];
  [v2 setProtobufAction:"SDStart:" forIncomingRequestsOfType:1];

  size_t v3 = [*(id *)(a1 + 32) service];
  [v3 setProtobufAction:"SDStart:" forIncomingResponsesOfType:1];

  int v4 = [*(id *)(a1 + 32) service];
  [v4 setProtobufAction:"SDStop" forIncomingRequestsOfType:2];

  int v5 = [*(id *)(a1 + 32) service];
  [v5 setProtobufAction:"SDStop" forIncomingResponsesOfType:2];

  unint64_t v6 = [*(id *)(a1 + 32) service];
  [v6 setProtobufAction:"SDComplete:" forIncomingRequestsOfType:3];

  uint64_t v7 = [*(id *)(a1 + 32) service];
  [v7 setProtobufAction:"SDComplete:" forIncomingResponsesOfType:3];

  unint64_t v8 = [*(id *)(a1 + 32) service];
  [v8 setProtobufAction:"SDTargetFilename:" forIncomingRequestsOfType:5];

  id v9 = [*(id *)(a1 + 32) service];
  [v9 setProtobufAction:"SDTargetFilename:" forIncomingResponsesOfType:5];

  uint64_t v10 = [*(id *)(a1 + 32) service];
  [v10 setProtobufAction:"SDTransfer_Size:" forIncomingRequestsOfType:4];

  uint64_t v11 = [*(id *)(a1 + 32) service];
  [v11 setProtobufAction:"SDTransfer_Size:" forIncomingResponsesOfType:4];

  id v12 = [*(id *)(a1 + 32) service];
  [v12 setProtobufAction:"SDWatch_List:" forIncomingRequestsOfType:6];

  long long v13 = [*(id *)(a1 + 32) service];
  [v13 setProtobufAction:"SDWatch_List:" forIncomingResponsesOfType:6];

  id v14 = [*(id *)(a1 + 32) service];
  [v14 setProtobufAction:"SDList_Complete:" forIncomingRequestsOfType:7];

  __int16 v15 = [*(id *)(a1 + 32) service];
  [v15 setProtobufAction:"SDList_Complete:" forIncomingResponsesOfType:7];

  id v16 = [*(id *)(a1 + 32) service];
  [v16 setProtobufAction:"SDTransfer_Remote:" forIncomingRequestsOfType:8];

  id v17 = [*(id *)(a1 + 32) service];
  [v17 setProtobufAction:"SDTransfer_Remote:" forIncomingResponsesOfType:8];

  __int16 v18 = [*(id *)(a1 + 32) service];
  [v18 setProtobufAction:"SDRemote_Complete:" forIncomingRequestsOfType:9];

  id v19 = [*(id *)(a1 + 32) service];
  [v19 setProtobufAction:"SDRemote_Complete:" forIncomingResponsesOfType:9];

  id v22 = [*(id *)(a1 + 32) service];
  __int16 v20 = *(void **)(a1 + 32);
  id v21 = [v20 run_queue];
  [v22 addDelegate:v20 queue:v21];
}

void sub_10005EA1C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) stringFromProtobuf:*(void *)(a1 + 48)];
  size_t v3 = +[SDCacheEnumerator sysdiagnoseDirectory];
  int v4 = objc_alloc_init(SystemDiagnosticiOS);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10006602C();
    }
    id v12 = +[SDResourceManager sharedResourceManager];
    [v12 stderrWrite:@"Failed to allocate diagnostic object. Failing early from SDStart"];

    long long v13 = +[SDResourceManager sharedResourceManager];
    [v13 log:@"Failed to allocate diagnostic object. Failing early from SDStart"];
    goto LABEL_16;
  }
  int v5 = +[SDResourceManager sharedResourceManager];
  unint64_t v6 = [(SystemDiagnostic *)v4 diagnosticID];
  unsigned int v7 = [v5 checkAndIncreaseDiagnosticCountForDiagnosticID:v6 collectingLocalLogs:1];

  if (v7)
  {
    unint64_t v8 = +[SDResourceManager sharedResourceManager];
    [v8 setCurrentClient:@"IDS"];

    [*(id *)(a1 + 40) setTransfer_size:0];
    [(SystemDiagnostic *)v4 setRequestSource:4];
    [(SystemDiagnosticiOS *)v4 setIdsCase:4];
    [(SystemDiagnostic *)v4 setShouldCreateTarBall:1];
    [(SystemDiagnostic *)v4 setShouldRemoveTemporaryDirectory:1];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = +[SystemDiagnosticIDS getIDSCaseString:[(SystemDiagnosticiOS *)v4 idsCase]];
      *(_DWORD *)long long buf = 138412290;
      id v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IDS SDStart idsCase: %@", buf, 0xCu);
    }
    uint64_t v10 = +[SDResourceManager sharedResourceManager];
    uint64_t v11 = +[SystemDiagnosticIDS getIDSCaseString:[(SystemDiagnosticiOS *)v4 idsCase]];
    [v10 log:@"IDS SDStart idsCase: %@", v11];

    if (v2) {
      [(SystemDiagnostic *)v4 setRemoteSysdiagnoseID:v2];
    }
    [(SystemDiagnosticiOS *)v4 run];
    goto LABEL_17;
  }
  if (!v2)
  {
    long long v13 = [v3 stringByAppendingPathComponent:@"no-location.log"];
    sub_100025030(@"Incoming co-sysdiagnose request with no target location specified.", v13);
LABEL_16:

    goto LABEL_17;
  }
  id v14 = [@"error" stringByAppendingString:@"-"];
  __int16 v15 = [v14 stringByAppendingString:v2];

  id v16 = [v15 stringByAppendingPathExtension:@"log"];
  id v17 = [v3 stringByAppendingPathComponent:v16];

  __int16 v18 = +[NSString stringWithFormat:@"Current request %@ could not be completed because there is an inflight sysdiagnose.\n", v2];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error %@", buf, 0xCu);
  }
  id v19 = +[SDResourceManager sharedResourceManager];
  [v19 log:@"Error %@", v18];

  sub_100025030(v18, v17);
  __int16 v20 = *(void **)(a1 + 40);
  v22[0] = v15;
  v22[1] = v2;
  id v21 = +[NSArray arrayWithObjects:v22 count:2];
  [v20 sendFilenamePair:v21];

LABEL_17:
}

BOOL sub_100060D5C(id a1, NSURL *a2, NSError *a3)
{
  size_t v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(NSError *)v3 localizedDescription];
    *(_DWORD *)long long buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@\n", buf, 0xCu);
  }
  int v5 = +[SDResourceManager sharedResourceManager];
  unint64_t v6 = [(NSError *)v3 localizedDescription];
  [v5 log:@"%@\n", v6];

  return 1;
}

BOOL sub_100060E64(id a1, NSURL *a2, NSError *a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(NSError *)a3 localizedDescription];
    int v6 = 138412290;
    unsigned int v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@\n", (uint8_t *)&v6, 0xCu);
  }
  return 1;
}

uint64_t sub_100061124(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 31339) >= 0xFFFFFFFE) {
    return (uint64_t)*(&off_10009E278 + 5 * (v1 - 31337) + 5);
  }
  else {
    return 0;
  }
}

_DWORD *sub_100061160(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    uint64_t result = (_DWORD *)sub_1000342D0();
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t sub_1000611C4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      uint64_t v5 = *(unsigned int *)(result + 32);
      long long v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = sub_1000342A8(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100061260(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 31339) >= 0xFFFFFFFE
    && (uint64_t v5 = (void (*)(void))*(&off_10009E278 + 5 * (v4 - 31337) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_1000612F4()
{
  sub_10000A2C8();
  sub_10000A2AC((void *)&_mh_execute_header, v0, v1, "Failed to attach to bluetoothd with error %d", v2, v3, v4, v5, v6);
}

void sub_10006135C()
{
  sub_10000A2A0();
  sub_10000A284((void *)&_mh_execute_header, v0, v1, "Timed out waiting for ExposureNotification db collection.", v2, v3, v4, v5, v6);
}

void sub_100061390()
{
  sub_10000A2C8();
  sub_10000A2AC((void *)&_mh_execute_header, v0, v1, "Failed to get default local device from bluetoothd with error %d", v2, v3, v4, v5, v6);
}

void sub_1000613F8()
{
  sub_10000A2A0();
  sub_10000A284((void *)&_mh_execute_header, v0, v1, "Timed out waiting for AirPod logs collection.", v2, v3, v4, v5, v6);
}

void sub_10006142C(void *a1, NSObject *a2)
{
  [a1 numAttachTries];
  sub_10000A2C8();
  __int16 v4 = 1024;
  int v5 = 3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Attempt (%d/%d) to attach to BTSession failed. Giving up.", v3, 0xEu);
}

void sub_1000614C4()
{
  sub_10000A2C8();
  sub_10000A2AC((void *)&_mh_execute_header, v0, v1, "Registration for AirPod logs trigger callback with bluetooth returned error %d", v2, v3, v4, v5, v6);
}

void sub_10006152C()
{
  sub_10000A2A0();
  sub_10000A284((void *)&_mh_execute_header, v0, v1, "AirPods not supported, or the logs are already dumped to other paired device's sysdiagnose", v2, v3, v4, v5, v6);
}

void sub_100061560()
{
  sub_10000A2A0();
  sub_10000A284((void *)&_mh_execute_header, v0, v1, "AirPods are already logging to a different connected device.", v2, v3, v4, v5, v6);
}

void sub_100061594()
{
  sub_10000A2A0();
  sub_10000A284((void *)&_mh_execute_header, v0, v1, "AirPods are not connected.", v2, v3, v4, v5, v6);
}

void sub_1000615C8()
{
  sub_10000A2A0();
  sub_10000A284((void *)&_mh_execute_header, v0, v1, "Tried to trigger logs from AirPods V1 on iOS -- abort.", v2, v3, v4, v5, v6);
}

void sub_1000615FC()
{
  sub_10000A2C8();
  sub_10000A2AC((void *)&_mh_execute_header, v0, v1, "BTAccessoryManagerGetDefault() failed while triggering AirPod logs with error: %d", v2, v3, v4, v5, v6);
}

void sub_100061664()
{
  sub_10000A2C8();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Received unexpected event value (%d) in BTSession event callback.", v1, 8u);
}

void sub_1000616D8()
{
  sub_10000A2C8();
  sub_10000A2AC((void *)&_mh_execute_header, v0, v1, "Received BT_SESSION_ATTACHED (error %d) event in BTSession event callback.", v2, v3, v4, v5, v6);
}

void sub_100061740()
{
  sub_10000A2A0();
  sub_10000A284((void *)&_mh_execute_header, v0, v1, "Received BT_SESSION_TERMINATED event in BTSession event callback. Cleaning up.", v2, v3, v4, v5, v6);
}

void sub_100061774()
{
  sub_10000A2A0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Received unexpected BT_SESSION_FAILED in BTSession event callback.", v1, 2u);
}

void sub_1000617B4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error: Received callback without dispatch group in SystemDiagnosticBT, reporting AirPod logs %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006182C()
{
  sub_10000A2A0();
  sub_10000A284((void *)&_mh_execute_header, v0, v1, "Error: Received unexpected AirPod log name, stopping.", v2, v3, v4, v5, v6);
}

void sub_100061860()
{
  sub_10000A2A0();
  sub_10000A284((void *)&_mh_execute_header, v0, v1, "Found existing accessory logs in AirPod logs callback -- ignoring.", v2, v3, v4, v5, v6);
}

void sub_100061894(void *a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)long long buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Count is 0 but local log collection ID is: %@ - resetting to nil for caller: %@", buf, 0x16u);
}

void sub_1000618FC(uint8_t *buf, uint64_t a2)
{
  *(_DWORD *)long long buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Atomic count did not match. Resetting to dictionary count %ld", buf, 0xCu);
}

void sub_100061948()
{
  __assert_rtn("-[SDResourceManager setUpFH:]", "SDResourceManager.m", 442, "fd != -1");
}

void sub_100061974()
{
}

void sub_1000619A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000619DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061A18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100061A54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000197BC((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
}

void sub_100061ACC()
{
  sub_1000197A8();
  sub_1000197D8((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
}

void sub_100061B40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000197BC((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
}

void sub_100061BB8()
{
  sub_1000197A8();
  sub_1000197D8((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
}

void sub_100061C2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000197BC((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
}

void sub_100061CA4()
{
  sub_1000197A8();
  sub_1000197D8((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
}

void sub_100061D18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000197BC((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
}

void sub_100061D90()
{
  sub_1000197A8();
  sub_1000197D8((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
}

void sub_100061E04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000197BC((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
}

void sub_100061E7C()
{
  sub_1000197A8();
  sub_1000197D8((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
}

void sub_100061EF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000197BC((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
}

void sub_100061F68()
{
  sub_1000197A8();
  sub_1000197D8((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
}

void sub_100061FDC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000197BC((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
}

void sub_100062054()
{
  sub_1000197A8();
  sub_1000197D8((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
}

void sub_1000620C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000197BC((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
}

void sub_100062140()
{
  sub_1000197A8();
  sub_1000197D8((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
}

void sub_1000621B4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: CSCoordinator: Failed to allocate CSSessionConfig object", v1, 2u);
}

void sub_1000621F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062278()
{
  sub_1000197A8();
  sub_1000197D8((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
}

void sub_1000622EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000197BC((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
}

void sub_100062364(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: CSCoordinator: failed to create hostWaitGroup. Failing to startRemoteInitiatedFlow", v1, 2u);
}

void sub_1000623A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000197BC((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
}

void sub_100062420(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000197BC((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
}

void sub_100062498(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100062544(void *a1)
{
  int v1 = 138412290;
  xpc_type_t type = xpc_get_type(a1);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "CoreCaptureConfig unxpected reply. Expected XPC_TYPE_DICTIONARY. Received %@", (uint8_t *)&v1, 0xCu);
}

void sub_1000625C8(void *a1, NSObject *a2)
{
  id v3 = [a1 localizedDescription];
  int v4 = 136446210;
  id v5 = [v3 UTF8String];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "CacheEnumerator error: %{public}s", (uint8_t *)&v4, 0xCu);
}

void sub_100062668(os_log_t log)
{
  int v1 = 134217984;
  uint64_t v2 = 5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: CSDisplayProxy: timed out (%lus) waiting for browsing to finish", (uint8_t *)&v1, 0xCu);
}

void sub_1000626E8(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: CSDisplayProxy: got nil device from from browsing SPI with canceling == false", v1, 2u);
}

void sub_10006272C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062768(void *a1)
{
  id v1 = [a1 localizedDescription];
  [v1 UTF8String];
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v2, "canFileFeedbackOnThisDevice returned error: '%s'. Assuming not on seed", v3, v4, v5, v6, v7);
}

void sub_1000627F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000628E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062924(int a1)
{
  strerror(a1);
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v1, "Failed to get path from FD: %s", v2, v3, v4, v5, v6);
}

void sub_100062998(int a1, int a2, int __errnum)
{
  strerror(__errnum);
  sub_100028ED0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to copy tarball '%s' to final location '%s'. Unable to lseek to start: %s", v3, 0x20u);
}

void sub_100062A2C(int a1, int a2, int __errnum)
{
  strerror(__errnum);
  sub_100028ED0();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to copy tarball '%s' to final location '%s': %s", v3, 0x20u);
}

void sub_100062AC0(int a1, int __errnum)
{
  strerror(__errnum);
  sub_100028EF0();
  sub_1000197D8((void *)&_mh_execute_header, &_os_log_default, v2, "Failed to unlink tarball '%s' after copy': %s", v3, v4, v5, v6, 2u);
}

void sub_100062B4C(uint64_t a1, int __errnum, int a3)
{
  int v3 = 136315650;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a3;
  __int16 v7 = 2080;
  unint64_t v8 = strerror(__errnum);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Opening tarball file descriptor at %s with protection class %d failed: %s", (uint8_t *)&v3, 0x1Cu);
}

void sub_100062BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100062C38()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100028EF0();
  sub_1000197D8((void *)&_mh_execute_header, &_os_log_default, v1, "Unable to create user temporary directory %@: %s", v2, v3, v4, v5, 2u);
}

void sub_100062CC8()
{
  sub_100028EB8();
  sub_1000197D8((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to get system group container for identifier '%@' (error: %s)", v1, v2, v3, v4, v5);
}

void sub_100062D38()
{
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to create container query for identifier '%@'", v1, v2, v3, v4, v5);
}

void sub_100062DA8(uint64_t a1, int a2)
{
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Active UID '%d' user doesn't exist. Returning nil for container path '%@'", (uint8_t *)v2, 0x12u);
}

void sub_100062E34()
{
  sub_100028EB8();
  sub_1000197D8((void *)&_mh_execute_header, &_os_log_default, v0, "Error executing query for identifier '%@': %s", v1, v2, v3, v4, v5);
}

void sub_100062EA4()
{
  sub_100028EB8();
  sub_1000197D8((void *)&_mh_execute_header, &_os_log_default, v0, "Error fetching path for identifier '%@': %s", v1, v2, v3, v4, v5);
}

void sub_100062F14()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v1, "Error: failed to fetch tailspin config with error: '%s'. Returning 0 for buffer size", v2, v3, v4, v5, v6);
}

void sub_100062F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100063004(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 localizedDescription];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  __int16 v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not create target location %@ with error %@", (uint8_t *)&v4, 0x16u);
}

void sub_1000630B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100063124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100063198()
{
  sub_10002E978();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create intermediate tailspin save directory %@: %@", v0, 0x16u);
}

void sub_100063214()
{
  sub_10002E978();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create intermediate spindump directory %@: %@", v0, 0x16u);
}

void sub_100063290(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000632C8(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 localizedDescription];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  __int16 v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create co-sysdiagnose directory at: %@ with error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_100063374(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000633AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000633E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not intialize a file handle from Info plist fd.", v1, 2u);
}

void sub_100063428()
{
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, v0, v1, "Could not create a plist object from the file: %@", v2, v3, v4, v5, v6);
}

void sub_100063490(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 durationMetrics];
  uint64_t v5 = [v4 objectForKeyedSubscript:metricPersistLookback];
  uint8_t v6 = [a1 durationMetrics];
  __int16 v7 = [v6 objectForKeyedSubscript:metricSpecialLookback];
  unint64_t v8 = [a1 durationMetrics];
  id v9 = [v8 objectForKeyedSubscript:metricSignpostLookback];
  int v10 = 138412802;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  long long v13 = v7;
  __int16 v14 = 2112;
  __int16 v15 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Log archive metrics: Persist %@ Special %@ Signpost %@", (uint8_t *)&v10, 0x20u);
}

void sub_1000635D4()
{
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, v0, v1, "Could not read the log archive Info plist: %@", v2, v3, v4, v5, v6);
}

void sub_10006363C()
{
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v0, "Could not set the offset of the log archive Info plist to 0: %@", v1, v2, v3, v4, v5);
}

void sub_1000636AC(uint64_t a1, int __errnum, NSObject *a3)
{
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  __int16 v7 = strerror(__errnum);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to open log archive %@: %s", (uint8_t *)&v4, 0x16u);
}

void sub_100063750()
{
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, v0, v1, "OSLOGCREATE Error: %s", v2, v3, v4, v5, v6);
}

void sub_1000637B8()
{
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v0, "%@", v1, v2, v3, v4, v5);
}

uint64_t sub_100063828()
{
  return _os_assumes_log();
}

void sub_100063848(uint64_t a1, int __errnum)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint8_t v5 = strerror(__errnum);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create file %@: %s", (uint8_t *)&v2, 0x16u);
}

void sub_1000638E8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "logarchive block timedout.", v1, 2u);
}

void sub_10006392C(void *a1, _OWORD *a2)
{
}

void sub_1000639B8(void *a1, _OWORD *a2)
{
}

void sub_100063A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100063AB8(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v2, "Error writing remote UUIDs to response dict: %@", v3, v4, v5, v6, 2u);
}

void sub_100063B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100063BB8(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100063C64()
{
  sub_10003E2F8();
  _os_log_error_impl(v0, v1, v2, v3, v4, 2u);
}

void sub_100063CA8(uint64_t a1, void *a2)
{
  __int16 v7 = [a2 diagnosticID];
  sub_10003E2F8();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

void sub_100063D50()
{
  sub_10003E2F8();
  _os_log_error_impl(v0, v1, v2, v3, v4, 8u);
}

void sub_100063DCC()
{
  sub_10003E2F8();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
}

void sub_100063E58()
{
  __assert_rtn("+[SDTask createLaunchConstraintData]_block_invoke", "SDTask.m", 62, "launchConstraint != nil");
}

void sub_100063E84()
{
  __assert_rtn("-[SDTask init]_block_invoke", "SDTask.m", 140, "fd != -1");
}

void sub_100063EB0()
{
}

void sub_100063EDC()
{
  sub_100028F00();
  sub_100041B00((void *)&_mh_execute_header, v0, v1, "Failed to create file for writing at path: %@", v2);
}

void sub_100063F48()
{
  sub_10002E978();
  sub_100041B18((void *)&_mh_execute_header, v0, v1, "Failed to create dir at %@, err: %@");
}

void sub_100063FB0(void *a1)
{
  os_log_t v1 = [a1 stderrPath];
  sub_100028F00();
  sub_100041AA8((void *)&_mh_execute_header, v2, v3, "Failed to create error file for writing at path: %@", v4, v5, v6, v7, v8);
}

void sub_100064034(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_1000640E0(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 objectAtIndex:1];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "File '%@' does not exist; will not execute %@.",
    (uint8_t *)&v6,
    0x16u);
}

void sub_100064198()
{
  sub_100028F00();
  sub_100041B00((void *)&_mh_execute_header, v0, v1, "File '%@' does not exist; will not execute.", v2);
}

void sub_100064204()
{
  sub_10002E978();
  sub_100041B18((void *)&_mh_execute_header, v0, v1, "Error: Blocked launchctl %@ %@ on this build.");
}

void sub_10006426C()
{
  sub_100028F00();
  sub_100041B00((void *)&_mh_execute_header, v0, v1, "Error: Blocked launching %@ on this build.", v2);
}

void sub_1000642D8()
{
  sub_100028F00();
  sub_100041B00((void *)&_mh_execute_header, v0, v1, "Launch path '%@' not accessible", v2);
}

void sub_100064344()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100028F00();
  sub_100041AA8((void *)&_mh_execute_header, v1, v2, "Failed to malloc arg array with errno: %s", v3, v4, v5, v6, v7);
}

void sub_1000643C4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not get spawn attributes. Skipping this task", v1, 2u);
}

void sub_100064408(int a1)
{
  strerror(a1);
  sub_100028F00();
  sub_100041AA8((void *)&_mh_execute_header, v1, v2, "posix_spawn failed: %s", v3, v4, v5, v6, v7);
}

void sub_100064480(int a1)
{
  strerror(a1);
  sub_100028F00();
  sub_100041AA8((void *)&_mh_execute_header, v1, v2, "Failed to posix_spawn_file_actions_init with error: %s. Skipping this task", v3, v4, v5, v6, v7);
}

void sub_1000644F8(void *a1)
{
  uint64_t v1 = [a1 executionLine];
  sub_100028F00();
  sub_100041AA8((void *)&_mh_execute_header, v2, v3, "Task '%@' has already been started; will not execute",
    v4,
    v5,
    v6,
    v7,
    v8);
}

void sub_100064580(void *a1)
{
  uint64_t v1 = [a1 launchPath];
  sub_100041AE8();
  sub_100041AC8((void *)&_mh_execute_header, v2, v3, "Child process '%@' terminated due to signal %d", v4, v5, v6, v7, v8);
}

void sub_100064610(void *a1)
{
  uint64_t v1 = [a1 launchPath];
  sub_100028F00();
  sub_100041AC8((void *)&_mh_execute_header, v2, v3, "Child process '%@' exited with nonzero status %d", v4, v5, v6, v7, v8);
}

void sub_1000646B0(void *a1)
{
  uint64_t v1 = [a1 launchPath];
  sub_100041AE8();
  sub_100041AC8((void *)&_mh_execute_header, v2, v3, "Unknown state of child process '%@' with wstatus %04x", v4, v5, v6, v7, v8);
}

void sub_100064740(void *a1)
{
  uint64_t v1 = [a1 launchPath];
  sub_100041AE8();
  sub_100041AC8((void *)&_mh_execute_header, v2, v3, "Child process '%@' stopped (but did not terminate) due to signal %d", v4, v5, v6, v7, v8);
}

void sub_1000647D0()
{
}

void sub_1000647FC(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown task stop state: %u", (uint8_t *)v2, 8u);
}

void sub_100064874()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Semaphore to wait for tasks to complete is nil", v0, 2u);
}

void sub_1000648BC(uint64_t a1)
{
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Timed out waiting for all tasks to complete. Timeout: %llus", (uint8_t *)&v1, 0xCu);
}

void sub_10006493C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Attempted to block multiple threads on the same task semaphore. Different threads should use different semaphores.", v0, 2u);
}

void sub_100064984()
{
}

void sub_1000649B0(void *a1)
{
  int v1 = [a1 name];
  sub_100028F00();
  sub_100041AA8((void *)&_mh_execute_header, v2, v3, "Failed to execute %@", v4, v5, v6, v7, v8);
}

void sub_100064A34(id *a1)
{
  int v1 = [*a1 name];
  sub_100028F00();
  sub_100041AA8((void *)&_mh_execute_header, v2, v3, "Failed to execute %@", v4, v5, v6, v7, v8);
}

void sub_100064ABC(void *a1)
{
  int v1 = [a1 name];
  sub_1000479A0();
  sub_1000479E4((void *)&_mh_execute_header, v2, v3, "Completion block for %@ took too long: %.1fs (allowed: %.1fs)", v4, v5, v6, v7, v8);
}

void sub_100064B4C(id *a1)
{
  uint64_t v2 = [*a1 name];
  id v9 = [*a1 timeoutMetricsString];
  sub_1000479C4((void *)&_mh_execute_header, v3, v4, "[%@ container] Task(s) timed out: %@", v5, v6, v7, v8, 2u);
}

void sub_100064C04(void *a1)
{
  int v1 = [a1 name];
  sub_100028F00();
  sub_100041AA8((void *)&_mh_execute_header, v2, v3, "No tasks were created for %@", v4, v5, v6, v7, v8);
}

void sub_100064C88(void *a1)
{
  int v1 = [a1 name];
  sub_1000479C4((void *)&_mh_execute_header, v2, v3, "Container %@ shouldn't be marked as not concurrent because it only has %lu task", v4, v5, v6, v7, 2u);
}

void sub_100064D28()
{
  sub_100028F00();
  __int16 v1 = 2112;
  uint64_t v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Can't create a block container with nil block %@, block : %@", v0, 0x16u);
}

void sub_100064DB0(uint64_t a1)
{
  __int16 v1 = [*(id *)(a1 + 32) name];
  sub_100028F00();
  sub_100041AA8((void *)&_mh_execute_header, v2, v3, "Block timed out for %@. It will continue to run, but sysdiagnose will not wait for it to finish. Logs may be missing.", v4, v5, v6, v7, v8);
}

void sub_100064E38(id *a1)
{
  __int16 v1 = [*a1 name];
  sub_1000479A0();
  sub_1000479E4((void *)&_mh_execute_header, v2, v3, "Completion block for %@ took too long: %.1fs (allowed: %.1fs)", v4, v5, v6, v7, v8);
}

void sub_100064ECC(id *a1)
{
  __int16 v1 = [*a1 taskName];
  sub_1000479A0();
  sub_1000479E4((void *)&_mh_execute_header, v2, v3, "Helper connection error for task %@: reply took too long: %.1fs (allowed: %.1fs)", v4, v5, v6, v7, v8);
}

void sub_100064F60(id *a1)
{
  __int16 v1 = [*a1 taskName];
  sub_100028F00();
  sub_100041AA8((void *)&_mh_execute_header, v2, v3, "Helper connection error for task %@: not calling reply block due to failure", v4, v5, v6, v7, v8);
}

void sub_100064FE8(uint64_t a1)
{
  __int16 v1 = [*(id *)(a1 + 32) taskName];
  sub_100028F00();
  sub_100041AA8((void *)&_mh_execute_header, v2, v3, "Helper connection error for task %@: failure while running task.", v4, v5, v6, v7, v8);
}

void sub_100065070(uint64_t a1, const _xpc_type_s *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) taskName];
  xpc_type_get_name(a2);
  sub_1000479C4((void *)&_mh_execute_header, v4, v5, "Helper connection error for task %@: Received unexpected reply with type: %s", v6, v7, v8, v9, 2u);
}

void sub_10006511C(void *a1)
{
  __int16 v1 = [a1 taskName];
  sub_100028F00();
  sub_100041AA8((void *)&_mh_execute_header, v2, v3, "No connection with sysdiagnose_helper. Cannot execute task: %@", v4, v5, v6, v7, v8);
}

void sub_1000651A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006521C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006529C(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_10003E2D4();
  _os_crash_msg();
  __break(1u);
}

void sub_10006534C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000653C8(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)long long buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "IORegistryEntryGetName: %d", buf, 8u);
}

void sub_100065414(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failed to create IORegistryEntryCreateIterator: %d", (uint8_t *)v1, 8u);
}

void sub_100065494(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_10003E2D4();
  _os_crash_msg();
  __break(1u);
}

void sub_100065530(void *a1, void *a2)
{
  uint64_t v4 = [a1 tarballPath];
  uint64_t v5 = [a1 completedTarballPath];
  uint64_t v6 = [a2 localizedDescription];
  int v7 = 138412802;
  uint8_t v8 = v4;
  __int16 v9 = 2112;
  int v10 = v5;
  __int16 v11 = 2112;
  __int16 v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to move tarball '%@' to final location '%@': %@", (uint8_t *)&v7, 0x20u);
}

void sub_100065614(void *a1)
{
  __int16 v1 = [a1 archiveName];
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v2, "Archive name invalid: %@", v3, v4, v5, v6, v7);
}

void sub_10006569C(void *a1)
{
  __int16 v1 = [a1 outputDirectory];
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v2, "Internal output directory already exists: %@\n", v3, v4, v5, v6, v7);
}

void sub_100065724(void *a1)
{
  __int16 v1 = [a1 completedTarballPath];
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v2, "Output archive already exists: %@\n", v3, v4, v5, v6, v7);
}

void sub_1000657AC(void *a1)
{
  __int16 v1 = [a1 baseDirectory];
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v2, "Failed to set attributes on %@", v3, v4, v5, v6, v7);
}

void sub_100065834()
{
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v0, "Unable to create summaries directory: %@", v1, v2, v3, v4, v5);
}

void sub_1000658A4()
{
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v0, "Unable to create errors directory: %@", v1, v2, v3, v4, v5);
}

void sub_100065914(void *a1)
{
  uint64_t v1 = [a1 completedOutputDirectory];
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v2, "Output directory already exists: %@\n", v3, v4, v5, v6, v7);
}

void sub_10006599C()
{
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v0, "Timed out waiting for sysdiagnose to complete. Timeout: %llus", v1, v2, v3, v4, v5);
}

void sub_100065A0C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Nil names string passed to setOnlyRunContainersWithNames", v0, 2u);
}

void sub_100065A54(uint8_t *buf, unsigned char *a2)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Invalid name passed to onlyRunContainersWithNames", buf, 2u);
}

void sub_100065A98()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Resetting only run containers with names array", v0, 2u);
}

void sub_100065AE0()
{
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v0, "[%@ phase] failed to complete in time. The tasks may continue to run, but continuing to the next phase.", v1, v2, v3, v4, v5);
}

void sub_100065B50()
{
  int v0 = *__error();
  uint64_t v1 = __error();
  uint64_t v2 = strerror(*v1);
  v3[0] = 67109378;
  v3[1] = v0;
  __int16 v4 = 2080;
  uint8_t v5 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Got return value of 0 from clock_gettime_nsec_np with error (%d): %s", (uint8_t *)v3, 0x12u);
}

void sub_100065BF8()
{
  sub_100028F00();
  sub_1000197BC((void *)&_mh_execute_header, &_os_log_default, v0, "%lu tasks were still running after the generation phases ended.", v1, v2, v3, v4, v5);
}

void sub_100065C68(uint64_t a1)
{
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint8_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create %@: %s", (uint8_t *)&v4, 0x16u);
}

void sub_100065D0C(void *a1)
{
  uint64_t v2 = [a1 sourcePath];
  uint64_t v3 = [a1 targetPath];
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint8_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Tar streaming from: %@, to: %@", (uint8_t *)&v4, 0x16u);
}

void sub_100065DC8(os_log_t log)
{
  int v1 = 134217984;
  uint64_t v2 = 5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: CSCoreDeviceProxy: timed out (%lus) waiting for browsing to finish", (uint8_t *)&v1, 0xCu);
}

void sub_100065E48(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: CSCoreDeviceProxy: got nil device from from browsing SPI with canceling == false", v1, 2u);
}

void sub_100065E8C(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100065F38()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "SDArchive: not going to add file to archive, as its source path is nil", v0, 2u);
}

void sub_100065F80(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "SDArchive: not going to add source file %@ to archive, as its target path is nil", (uint8_t *)&v1, 0xCu);
}

void sub_100066000()
{
}

void sub_10006602C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to allocate diagnostic object. Failing early from SDStart", v0, 2u);
}

void sub_100066074(uint64_t a1, void *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [a2 localizedDescription];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v8 = a1;
    __int16 v9 = 2112;
    int v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not create directory %@ with error %@", buf, 0x16u);
  }
  uint64_t v5 = +[SDResourceManager sharedResourceManager];
  __int16 v6 = [a2 localizedDescription];
  [v5 log:@"Could not create directory %@ with error %@", a1, v6];

  __assert_rtn("-[SystemDiagnosticIDS service:account:incomingResourceAtURL:metadata:fromID:context:]", "SystemDiagnosticIDS.m", 816, "0");
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return _AudioServicesPlaySystemSoundWithOptions();
}

uint64_t BTAccessoryManagerDeregisterCustomMessageClient()
{
  return _BTAccessoryManagerDeregisterCustomMessageClient();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return _BTAccessoryManagerGetDefault();
}

uint64_t BTAccessoryManagerRegisterCustomMessageClient()
{
  return _BTAccessoryManagerRegisterCustomMessageClient();
}

uint64_t BTLocalDeviceDumpExposureNotificationDatabase()
{
  return _BTLocalDeviceDumpExposureNotificationDatabase();
}

uint64_t BTLocalDeviceGetDefault()
{
  return _BTLocalDeviceGetDefault();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

uint64_t BTSessionDetachWithQueue()
{
  return _BTSessionDetachWithQueue();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

void CFPreferencesAddSuitePreferencesToApp(CFStringRef applicationID, CFStringRef suiteID)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationDisplayAlert(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, otherButtonTitle, responseFlags);
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return _CacheDeleteRegisterInfoCallbacks();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithDescription(AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, Timeout, TimeoutAction, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t OSAInMultiUserMode()
{
  return _OSAInMultiUserMode();
}

uint64_t OSLogConstructArchive()
{
  return _OSLogConstructArchive();
}

uint64_t ParallelArchiveWriteEntryData()
{
  return _ParallelArchiveWriteEntryData();
}

uint64_t ParallelArchiveWriteEntryHeader()
{
  return _ParallelArchiveWriteEntryHeader();
}

uint64_t ParallelArchiveWriterCreate()
{
  return _ParallelArchiveWriterCreate();
}

uint64_t ParallelArchiveWriterDestroy()
{
  return _ParallelArchiveWriterDestroy();
}

uint64_t ParallelCompressionOStreamCreate()
{
  return _ParallelCompressionOStreamCreate();
}

uint64_t ParallelCompressionOStreamDestroy()
{
  return _ParallelCompressionOStreamDestroy();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return __CFCopySupplementalVersionDictionary();
}

char ***_NSGetEnviron(void)
{
  return __NSGetEnviron();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash_msg()
{
  return __os_crash_msg();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t amfi_launch_constraint_set_spawnattr()
{
  return _amfi_launch_constraint_set_spawnattr();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

uint64_t archive_entry_copy_sourcepath()
{
  return _archive_entry_copy_sourcepath();
}

uint64_t archive_entry_copy_stat()
{
  return _archive_entry_copy_stat();
}

uint64_t archive_entry_new()
{
  return _archive_entry_new();
}

uint64_t archive_entry_set_mode()
{
  return _archive_entry_set_mode();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_errno()
{
  return _archive_errno();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_read_disk_entry_from_file()
{
  return _archive_read_disk_entry_from_file();
}

uint64_t archive_read_disk_new()
{
  return _archive_read_disk_new();
}

uint64_t archive_read_free()
{
  return _archive_read_free();
}

uint64_t archive_write_add_filter_gzip()
{
  return _archive_write_add_filter_gzip();
}

uint64_t archive_write_add_filter_none()
{
  return _archive_write_add_filter_none();
}

uint64_t archive_write_close()
{
  return _archive_write_close();
}

uint64_t archive_write_data()
{
  return _archive_write_data();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

uint64_t archive_write_new()
{
  return _archive_write_new();
}

uint64_t archive_write_open_fd()
{
  return _archive_write_open_fd();
}

uint64_t archive_write_set_format_pax()
{
  return _archive_write_set_format_pax();
}

uint64_t archive_write_set_options()
{
  return _archive_write_set_options();
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int close(int a1)
{
  return _close(a1);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return _container_create_or_lookup_path_for_current_user();
}

uint64_t container_error_copy_unlocalized_description()
{
  return _container_error_copy_unlocalized_description();
}

uint64_t container_get_error_description()
{
  return _container_get_error_description();
}

uint64_t container_get_path()
{
  return _container_get_path();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_get_last_error()
{
  return _container_query_get_last_error();
}

uint64_t container_query_get_single_result()
{
  return _container_query_get_single_result();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_group_identifiers()
{
  return _container_query_set_group_identifiers();
}

uint64_t container_query_set_uid()
{
  return _container_query_set_uid();
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

uint64_t container_system_path_for_identifier()
{
  return _container_system_path_for_identifier();
}

uint64_t csops()
{
  return _csops();
}

uint64_t dirstat_np()
{
  return _dirstat_np();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return _dispatch_block_wait(block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_main(void)
{
}

uint64_t dispatch_mig_server()
{
  return _dispatch_mig_server();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_registration_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int dlclose(void *__handle)
{
  return _dlclose(__handle);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return _fcopyfile(from_fd, to_fd, a3, flags);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _ffsctl(a1, a2, a3, a4);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

uid_t geteuid(void)
{
  return _geteuid();
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

int glob_b(const char *a1, int a2, void *a3, glob_t *a4)
{
  return _glob_b(a1, a2, a3, a4);
}

void globfree(glob_t *a1)
{
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

int killpg(pid_t a1, int a2)
{
  return _killpg(a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return _mach_port_set_attributes(task, name, flavor, port_info, port_infoCnt);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return _mkdirat(a1, a2, a3);
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return _openat(a1, a2, a3);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

os_activity_id_t os_activity_get_identifier(os_activity_t activity, os_activity_id_t *parent_id)
{
  return _os_activity_get_identifier(activity, parent_id);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return _os_parse_boot_arg_int();
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_factory_content()
{
  return _os_variant_has_factory_content();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

uint64_t os_variant_is_darwinos()
{
  return _os_variant_is_darwinos();
}

void perror(const char *a1)
{
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return _posix_spawn_file_actions_adddup2(a1, a2, a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_destroy(a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_destroy(a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_init(a1);
}

uint64_t posix_spawnattr_set_launch_type_np()
{
  return _posix_spawnattr_set_launch_type_np();
}

uint64_t posix_spawnattr_set_uid_np()
{
  return _posix_spawnattr_set_uid_np();
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return _posix_spawnattr_setflags(a1, a2);
}

uint64_t posix_spawnattr_setjetsam_ext()
{
  return _posix_spawnattr_setjetsam_ext();
}

int posix_spawnattr_setsigdefault(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return _posix_spawnattr_setsigdefault(a1, a2);
}

int posix_spawnattr_setsigmask(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return _posix_spawnattr_setsigmask(a1, a2);
}

int proc_listallpids(void *buffer, int buffersize)
{
  return _proc_listallpids(buffer, buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int puts(const char *a1)
{
  return _puts(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

uint64_t remote_device_browse_present()
{
  return _remote_device_browse_present();
}

uint64_t remote_device_copy_device_with_name()
{
  return _remote_device_copy_device_with_name();
}

uint64_t remote_device_copy_device_with_uuid()
{
  return _remote_device_copy_device_with_uuid();
}

uint64_t remote_device_copy_service()
{
  return _remote_device_copy_service();
}

uint64_t remote_device_copy_uuid()
{
  return _remote_device_copy_uuid();
}

uint64_t remote_device_get_name()
{
  return _remote_device_get_name();
}

uint64_t remote_device_get_state()
{
  return _remote_device_get_state();
}

uint64_t remote_device_get_type()
{
  return _remote_device_get_type();
}

uint64_t remote_device_type_get_description()
{
  return _remote_device_type_get_description();
}

int seteuid(uid_t a1)
{
  return _seteuid(a1);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return _strndup(__s1, __n);
}

char *__cdecl strsignal(int __sig)
{
  return _strsignal(__sig);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t tailspin_buffer_size_get()
{
  return _tailspin_buffer_size_get();
}

uint64_t tailspin_config_create_with_current_state()
{
  return _tailspin_config_create_with_current_state();
}

uint64_t tailspin_config_free()
{
  return _tailspin_config_free();
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return _task_get_special_port(task, which_port, special_port);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

void uuid_generate_random(uuid_t out)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

uint64_t vproc_swap_integer()
{
  return _vproc_swap_integer();
}

pid_t wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  return _wait4(a1, a2, a3, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_oneshot_instance()
{
  return _xpc_connection_set_oneshot_instance();
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return _xpc_copy(object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_file_transfer_create_with_path()
{
  return _xpc_file_transfer_create_with_path();
}

uint64_t xpc_file_transfer_write_to_path()
{
  return _xpc_file_transfer_write_to_path();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_remote_connection_activate()
{
  return _xpc_remote_connection_activate();
}

uint64_t xpc_remote_connection_cancel()
{
  return _xpc_remote_connection_cancel();
}

uint64_t xpc_remote_connection_create_remote_service_listener()
{
  return _xpc_remote_connection_create_remote_service_listener();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return _xpc_remote_connection_create_with_remote_service();
}

uint64_t xpc_remote_connection_send_message()
{
  return _xpc_remote_connection_send_message();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return _xpc_remote_connection_set_event_handler();
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return _xpc_type_get_name(type);
}

id objc_msgSend_SDTaskPOSIXSpawnAttributes(void *a1, const char *a2, ...)
{
  return [a1 SDTaskPOSIXSpawnAttributes];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 URLByResolvingSymlinksInPath];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__copyAccessibilityPreferences(void *a1, const char *a2, ...)
{
  return [a1 _copyAccessibilityPreferences];
}

id objc_msgSend__copyAppInstallationLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 _copyAppInstallationLogsContainer];
}

id objc_msgSend__copyAstroLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 _copyAstroLogsContainer];
}

id objc_msgSend__copyBTLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 _copyBTLogsContainer];
}

id objc_msgSend__copyCompanionSyncContainer(void *a1, const char *a2, ...)
{
  return [a1 _copyCompanionSyncContainer];
}

id objc_msgSend__copyCoreCaptureBTLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 _copyCoreCaptureBTLogsContainer];
}

id objc_msgSend__copyHIDFWCrashLogs(void *a1, const char *a2, ...)
{
  return [a1 _copyHIDFWCrashLogs];
}

id objc_msgSend__copyHangTracerTailspinsContainer(void *a1, const char *a2, ...)
{
  return [a1 _copyHangTracerTailspinsContainer];
}

id objc_msgSend__copyMCLogs(void *a1, const char *a2, ...)
{
  return [a1 _copyMCLogs];
}

id objc_msgSend__copyMobileActivationLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 _copyMobileActivationLogsContainer];
}

id objc_msgSend__copyMobileAssetHistoryLogs(void *a1, const char *a2, ...)
{
  return [a1 _copyMobileAssetHistoryLogs];
}

id objc_msgSend__copyMobileInstallationLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 _copyMobileInstallationLogsContainer];
}

id objc_msgSend__copyNanoPreferencesSyncLogs(void *a1, const char *a2, ...)
{
  return [a1 _copyNanoPreferencesSyncLogs];
}

id objc_msgSend__copyOnDemandDaemonLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 _copyOnDemandDaemonLogsContainer];
}

id objc_msgSend__copyParsecdBagLogs(void *a1, const char *a2, ...)
{
  return [a1 _copyParsecdBagLogs];
}

id objc_msgSend__copyProxiedDeviceCrashLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 _copyProxiedDeviceCrashLogsContainer];
}

id objc_msgSend__copySentryPlistsContainer(void *a1, const char *a2, ...)
{
  return [a1 _copySentryPlistsContainer];
}

id objc_msgSend__copySiriAnalyticsDB(void *a1, const char *a2, ...)
{
  return [a1 _copySiriAnalyticsDB];
}

id objc_msgSend__copySiriLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 _copySiriLogsContainer];
}

id objc_msgSend__copySplatVersioningLogs(void *a1, const char *a2, ...)
{
  return [a1 _copySplatVersioningLogs];
}

id objc_msgSend__copySplunkHistoryLogs(void *a1, const char *a2, ...)
{
  return [a1 _copySplunkHistoryLogs];
}

id objc_msgSend__copyTCCLogs(void *a1, const char *a2, ...)
{
  return [a1 _copyTCCLogs];
}

id objc_msgSend__copyThermalLogs(void *a1, const char *a2, ...)
{
  return [a1 _copyThermalLogs];
}

id objc_msgSend__copyVideoProcessingLogs(void *a1, const char *a2, ...)
{
  return [a1 _copyVideoProcessingLogs];
}

id objc_msgSend__copyWatchdogTailspins(void *a1, const char *a2, ...)
{
  return [a1 _copyWatchdogTailspins];
}

id objc_msgSend__copyWatchdogdDDTs(void *a1, const char *a2, ...)
{
  return [a1 _copyWatchdogdDDTs];
}

id objc_msgSend__execute(void *a1, const char *a2, ...)
{
  return [a1 _execute];
}

id objc_msgSend__getAGXMTLCompilerCrashLogs(void *a1, const char *a2, ...)
{
  return [a1 _getAGXMTLCompilerCrashLogs];
}

id objc_msgSend__getCalendarPrefLogs(void *a1, const char *a2, ...)
{
  return [a1 _getCalendarPrefLogs];
}

id objc_msgSend__getCloudKitBookmarksContainer(void *a1, const char *a2, ...)
{
  return [a1 _getCloudKitBookmarksContainer];
}

id objc_msgSend__getCrashesAndSpinsContainer(void *a1, const char *a2, ...)
{
  return [a1 _getCrashesAndSpinsContainer];
}

id objc_msgSend__getFscklogs(void *a1, const char *a2, ...)
{
  return [a1 _getFscklogs];
}

id objc_msgSend__getMapsSyncJournalContainer(void *a1, const char *a2, ...)
{
  return [a1 _getMapsSyncJournalContainer];
}

id objc_msgSend__getSocialLayerPlist(void *a1, const char *a2, ...)
{
  return [a1 _getSocialLayerPlist];
}

id objc_msgSend__iOSGetTimeSensitiveContainers(void *a1, const char *a2, ...)
{
  return [a1 _iOSGetTimeSensitiveContainers];
}

id objc_msgSend__iOSgetLogCopyingContainers(void *a1, const char *a2, ...)
{
  return [a1 _iOSgetLogCopyingContainers];
}

id objc_msgSend__iOSgetLogGenerationContainers(void *a1, const char *a2, ...)
{
  return [a1 _iOSgetLogGenerationContainers];
}

id objc_msgSend__internalSpindumpContainers(void *a1, const char *a2, ...)
{
  return [a1 _internalSpindumpContainers];
}

id objc_msgSend__localUserHomeDirectories(void *a1, const char *a2, ...)
{
  return [a1 _localUserHomeDirectories];
}

id objc_msgSend__reapTasks(void *a1, const char *a2, ...)
{
  return [a1 _reapTasks];
}

id objc_msgSend__sizeOutputDirectoryAndGenerateDiagnosticSummary(void *a1, const char *a2, ...)
{
  return [a1 _sizeOutputDirectoryAndGenerateDiagnosticSummary];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessoryLogSubsystem(void *a1, const char *a2, ...)
{
  return [a1 accessoryLogSubsystem];
}

id objc_msgSend_accessoryLogs(void *a1, const char *a2, ...)
{
  return [a1 accessoryLogs];
}

id objc_msgSend_accessoryManager(void *a1, const char *a2, ...)
{
  return [a1 accessoryManager];
}

id objc_msgSend_activeLimit(void *a1, const char *a2, ...)
{
  return [a1 activeLimit];
}

id objc_msgSend_advanceMatchEnumerator(void *a1, const char *a2, ...)
{
  return [a1 advanceMatchEnumerator];
}

id objc_msgSend_airpodsGroup(void *a1, const char *a2, ...)
{
  return [a1 airpodsGroup];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allTasksComplete(void *a1, const char *a2, ...)
{
  return [a1 allTasksComplete];
}

id objc_msgSend_allTasksFinishedSemaphoresArray(void *a1, const char *a2, ...)
{
  return [a1 allTasksFinishedSemaphoresArray];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_applyFilters(void *a1, const char *a2, ...)
{
  return [a1 applyFilters];
}

id objc_msgSend_archive(void *a1, const char *a2, ...)
{
  return [a1 archive];
}

id objc_msgSend_archiveFD(void *a1, const char *a2, ...)
{
  return [a1 archiveFD];
}

id objc_msgSend_archiveName(void *a1, const char *a2, ...)
{
  return [a1 archiveName];
}

id objc_msgSend_archiveStatus(void *a1, const char *a2, ...)
{
  return [a1 archiveStatus];
}

id objc_msgSend_archivesDirectory(void *a1, const char *a2, ...)
{
  return [a1 archivesDirectory];
}

id objc_msgSend_areDiagnosticsInFlight(void *a1, const char *a2, ...)
{
  return [a1 areDiagnosticsInFlight];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachToBTSession(void *a1, const char *a2, ...)
{
  return [a1 attachToBTSession];
}

id objc_msgSend_attachedToBTSession(void *a1, const char *a2, ...)
{
  return [a1 attachedToBTSession];
}

id objc_msgSend_baseDirectory(void *a1, const char *a2, ...)
{
  return [a1 baseDirectory];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return [a1 block];
}

id objc_msgSend_blockUntilFinished(void *a1, const char *a2, ...)
{
  return [a1 blockUntilFinished];
}

id objc_msgSend_bluetoothQueue(void *a1, const char *a2, ...)
{
  return [a1 bluetoothQueue];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_btSession(void *a1, const char *a2, ...)
{
  return [a1 btSession];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_canAddToCandidateList(void *a1, const char *a2, ...)
{
  return [a1 canAddToCandidateList];
}

id objc_msgSend_canLaunch(void *a1, const char *a2, ...)
{
  return [a1 canLaunch];
}

id objc_msgSend_cancelConnection(void *a1, const char *a2, ...)
{
  return [a1 cancelConnection];
}

id objc_msgSend_capOverride(void *a1, const char *a2, ...)
{
  return [a1 capOverride];
}

id objc_msgSend_changedDiagnosticProperties(void *a1, const char *a2, ...)
{
  return [a1 changedDiagnosticProperties];
}

id objc_msgSend_childExitHandler(void *a1, const char *a2, ...)
{
  return [a1 childExitHandler];
}

id objc_msgSend_clearAllResources(void *a1, const char *a2, ...)
{
  return [a1 clearAllResources];
}

id objc_msgSend_clearHistory(void *a1, const char *a2, ...)
{
  return [a1 clearHistory];
}

id objc_msgSend_clearLogs(void *a1, const char *a2, ...)
{
  return [a1 clearLogs];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_closeArchive(void *a1, const char *a2, ...)
{
  return [a1 closeArchive];
}

id objc_msgSend_closeCLI(void *a1, const char *a2, ...)
{
  return [a1 closeCLI];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_closeFileHandles(void *a1, const char *a2, ...)
{
  return [a1 closeFileHandles];
}

id objc_msgSend_closeSummary(void *a1, const char *a2, ...)
{
  return [a1 closeSummary];
}

id objc_msgSend_closeSysdiagnoseLog(void *a1, const char *a2, ...)
{
  return [a1 closeSysdiagnoseLog];
}

id objc_msgSend_closeSysdiagnoseSession(void *a1, const char *a2, ...)
{
  return [a1 closeSysdiagnoseSession];
}

id objc_msgSend_closeTaskSummaryHandle(void *a1, const char *a2, ...)
{
  return [a1 closeTaskSummaryHandle];
}

id objc_msgSend_coSysdiagnose(void *a1, const char *a2, ...)
{
  return [a1 coSysdiagnose];
}

id objc_msgSend_coSysdiagnoseOnly(void *a1, const char *a2, ...)
{
  return [a1 coSysdiagnoseOnly];
}

id objc_msgSend_coSysdiagnoseParameters(void *a1, const char *a2, ...)
{
  return [a1 coSysdiagnoseParameters];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectWifiDextCoreFiles(void *a1, const char *a2, ...)
{
  return [a1 collectWifiDextCoreFiles];
}

id objc_msgSend_collectionContainer(void *a1, const char *a2, ...)
{
  return [a1 collectionContainer];
}

id objc_msgSend_completeTarball(void *a1, const char *a2, ...)
{
  return [a1 completeTarball];
}

id objc_msgSend_completedOutputDirectory(void *a1, const char *a2, ...)
{
  return [a1 completedOutputDirectory];
}

id objc_msgSend_completedTarballPath(void *a1, const char *a2, ...)
{
  return [a1 completedTarballPath];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_completionDispatchGroup(void *a1, const char *a2, ...)
{
  return [a1 completionDispatchGroup];
}

id objc_msgSend_configureDefaultSettings(void *a1, const char *a2, ...)
{
  return [a1 configureDefaultSettings];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyCoreaudioReportingLogs(void *a1, const char *a2, ...)
{
  return [a1 copyCoreaudioReportingLogs];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countCPUTimeUsedNS(void *a1, const char *a2, ...)
{
  return [a1 countCPUTimeUsedNS];
}

id objc_msgSend_cpuTimeUsedNS(void *a1, const char *a2, ...)
{
  return [a1 cpuTimeUsedNS];
}

id objc_msgSend_createChild(void *a1, const char *a2, ...)
{
  return [a1 createChild];
}

id objc_msgSend_createChildProcess(void *a1, const char *a2, ...)
{
  return [a1 createChildProcess];
}

id objc_msgSend_createFileHandles(void *a1, const char *a2, ...)
{
  return [a1 createFileHandles];
}

id objc_msgSend_createLaunchConstraintData(void *a1, const char *a2, ...)
{
  return [a1 createLaunchConstraintData];
}

id objc_msgSend_createdSince(void *a1, const char *a2, ...)
{
  return [a1 createdSince];
}

id objc_msgSend_createdUntil(void *a1, const char *a2, ...)
{
  return [a1 createdUntil];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentClient(void *a1, const char *a2, ...)
{
  return [a1 currentClient];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_deShowFeedback(void *a1, const char *a2, ...)
{
  return [a1 deShowFeedback];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_decreaseDiagnosticCount(void *a1, const char *a2, ...)
{
  return [a1 decreaseDiagnosticCount];
}

id objc_msgSend_defaultAirpodTimeout(void *a1, const char *a2, ...)
{
  return [a1 defaultAirpodTimeout];
}

id objc_msgSend_defaultAllTasksFinishedSemaphore(void *a1, const char *a2, ...)
{
  return [a1 defaultAllTasksFinishedSemaphore];
}

id objc_msgSend_defaultBaseDirectory(void *a1, const char *a2, ...)
{
  return [a1 defaultBaseDirectory];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_depth(void *a1, const char *a2, ...)
{
  return [a1 depth];
}

id objc_msgSend_deregisterBTSession(void *a1, const char *a2, ...)
{
  return [a1 deregisterBTSession];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return [a1 destination];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_diagnosticID(void *a1, const char *a2, ...)
{
  return [a1 diagnosticID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didComplete(void *a1, const char *a2, ...)
{
  return [a1 didComplete];
}

id objc_msgSend_didPartnerTimeout(void *a1, const char *a2, ...)
{
  return [a1 didPartnerTimeout];
}

id objc_msgSend_directory(void *a1, const char *a2, ...)
{
  return [a1 directory];
}

id objc_msgSend_directoryQueue(void *a1, const char *a2, ...)
{
  return [a1 directoryQueue];
}

id objc_msgSend_disableStreamTar(void *a1, const char *a2, ...)
{
  return [a1 disableStreamTar];
}

id objc_msgSend_disableUIFeedback(void *a1, const char *a2, ...)
{
  return [a1 disableUIFeedback];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dpClass(void *a1, const char *a2, ...)
{
  return [a1 dpClass];
}

id objc_msgSend_durationMetrics(void *a1, const char *a2, ...)
{
  return [a1 durationMetrics];
}

id objc_msgSend_earlyPrompt(void *a1, const char *a2, ...)
{
  return [a1 earlyPrompt];
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return [a1 elapsedTime];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 endDiagnostics];
}

id objc_msgSend_endExecution(void *a1, const char *a2, ...)
{
  return [a1 endExecution];
}

id objc_msgSend_endRemoteInitiatedFlow(void *a1, const char *a2, ...)
{
  return [a1 endRemoteInitiatedFlow];
}

id objc_msgSend_endStatus(void *a1, const char *a2, ...)
{
  return [a1 endStatus];
}

id objc_msgSend_enforceContainerSizeLimit(void *a1, const char *a2, ...)
{
  return [a1 enforceContainerSizeLimit];
}

id objc_msgSend_enumerators(void *a1, const char *a2, ...)
{
  return [a1 enumerators];
}

id objc_msgSend_evaluateCollectionFlags(void *a1, const char *a2, ...)
{
  return [a1 evaluateCollectionFlags];
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return [a1 execute];
}

id objc_msgSend_executeDiagnosticContainers(void *a1, const char *a2, ...)
{
  return [a1 executeDiagnosticContainers];
}

id objc_msgSend_executeFromCallback(void *a1, const char *a2, ...)
{
  return [a1 executeFromCallback];
}

id objc_msgSend_executeOSLogArchiveContainers(void *a1, const char *a2, ...)
{
  return [a1 executeOSLogArchiveContainers];
}

id objc_msgSend_executedContainers(void *a1, const char *a2, ...)
{
  return [a1 executedContainers];
}

id objc_msgSend_executionActivity(void *a1, const char *a2, ...)
{
  return [a1 executionActivity];
}

id objc_msgSend_executionGroupDictionary(void *a1, const char *a2, ...)
{
  return [a1 executionGroupDictionary];
}

id objc_msgSend_executionLine(void *a1, const char *a2, ...)
{
  return [a1 executionLine];
}

id objc_msgSend_executionTime(void *a1, const char *a2, ...)
{
  return [a1 executionTime];
}

id objc_msgSend_exitSource(void *a1, const char *a2, ...)
{
  return [a1 exitSource];
}

id objc_msgSend_exposureNotificationDBURL(void *a1, const char *a2, ...)
{
  return [a1 exposureNotificationDBURL];
}

id objc_msgSend_exposureNotificationGroup(void *a1, const char *a2, ...)
{
  return [a1 exposureNotificationGroup];
}

id objc_msgSend_fd(void *a1, const char *a2, ...)
{
  return [a1 fd];
}

id objc_msgSend_fdManager(void *a1, const char *a2, ...)
{
  return [a1 fdManager];
}

id objc_msgSend_fetchUserActivity(void *a1, const char *a2, ...)
{
  return [a1 fetchUserActivity];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return [a1 fileCreationDate];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileHandleForError(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForError];
}

id objc_msgSend_fileHandleForOutput(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForOutput];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return [a1 fileModificationDate];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return [a1 fileType];
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return [a1 filename];
}

id objc_msgSend_filter(void *a1, const char *a2, ...)
{
  return [a1 filter];
}

id objc_msgSend_finishChild(void *a1, const char *a2, ...)
{
  return [a1 finishChild];
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return [a1 finished];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flattenReturnedDirectoryPaths(void *a1, const char *a2, ...)
{
  return [a1 flattenReturnedDirectoryPaths];
}

id objc_msgSend_forceDeregisterBTSession(void *a1, const char *a2, ...)
{
  return [a1 forceDeregisterBTSession];
}

id objc_msgSend_frontmostBundleID(void *a1, const char *a2, ...)
{
  return [a1 frontmostBundleID];
}

id objc_msgSend_gatherDiagnostic(void *a1, const char *a2, ...)
{
  return [a1 gatherDiagnostic];
}

id objc_msgSend_generatePlist(void *a1, const char *a2, ...)
{
  return [a1 generatePlist];
}

id objc_msgSend_generateSummary(void *a1, const char *a2, ...)
{
  return [a1 generateSummary];
}

id objc_msgSend_getACLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 getACLogsContainer];
}

id objc_msgSend_getACMToolContainer(void *a1, const char *a2, ...)
{
  return [a1 getACMToolContainer];
}

id objc_msgSend_getAHSToolContainer(void *a1, const char *a2, ...)
{
  return [a1 getAHSToolContainer];
}

id objc_msgSend_getAOPFirmwareStateContainer(void *a1, const char *a2, ...)
{
  return [a1 getAOPFirmwareStateContainer];
}

id objc_msgSend_getASPMagazineContainer(void *a1, const char *a2, ...)
{
  return [a1 getASPMagazineContainer];
}

id objc_msgSend_getASPSnapshotContainer(void *a1, const char *a2, ...)
{
  return [a1 getASPSnapshotContainer];
}

id objc_msgSend_getASPSnapshotsContainers(void *a1, const char *a2, ...)
{
  return [a1 getASPSnapshotsContainers];
}

id objc_msgSend_getASPTraceContainers(void *a1, const char *a2, ...)
{
  return [a1 getASPTraceContainers];
}

id objc_msgSend_getAccessibilityPrefContainer(void *a1, const char *a2, ...)
{
  return [a1 getAccessibilityPrefContainer];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getActivityID(void *a1, const char *a2, ...)
{
  return [a1 getActivityID];
}

id objc_msgSend_getAirPlayContainer(void *a1, const char *a2, ...)
{
  return [a1 getAirPlayContainer];
}

id objc_msgSend_getAirpodsTimeout(void *a1, const char *a2, ...)
{
  return [a1 getAirpodsTimeout];
}

id objc_msgSend_getAopaudctlContainer(void *a1, const char *a2, ...)
{
  return [a1 getAopaudctlContainer];
}

id objc_msgSend_getApfsStatsContainer(void *a1, const char *a2, ...)
{
  return [a1 getApfsStatsContainer];
}

id objc_msgSend_getAppleInternalPreferencesLogs(void *a1, const char *a2, ...)
{
  return [a1 getAppleInternalPreferencesLogs];
}

id objc_msgSend_getArchiveExtension(void *a1, const char *a2, ...)
{
  return [a1 getArchiveExtension];
}

id objc_msgSend_getArkitctlContainer(void *a1, const char *a2, ...)
{
  return [a1 getArkitctlContainer];
}

id objc_msgSend_getAutogenLogCopyingContainers(void *a1, const char *a2, ...)
{
  return [a1 getAutogenLogCopyingContainers];
}

id objc_msgSend_getAutogenLogGenerationContainers(void *a1, const char *a2, ...)
{
  return [a1 getAutogenLogGenerationContainers];
}

id objc_msgSend_getAutogenTimeSensitiveContainers(void *a1, const char *a2, ...)
{
  return [a1 getAutogenTimeSensitiveContainers];
}

id objc_msgSend_getBTPHYLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 getBTPHYLogsContainer];
}

id objc_msgSend_getBaseBandContainer(void *a1, const char *a2, ...)
{
  return [a1 getBaseBandContainer];
}

id objc_msgSend_getBatteryUIContainer(void *a1, const char *a2, ...)
{
  return [a1 getBatteryUIContainer];
}

id objc_msgSend_getBrctlContainer(void *a1, const char *a2, ...)
{
  return [a1 getBrctlContainer];
}

id objc_msgSend_getCADebugContainer(void *a1, const char *a2, ...)
{
  return [a1 getCADebugContainer];
}

id objc_msgSend_getCKKSCTLContainer(void *a1, const char *a2, ...)
{
  return [a1 getCKKSCTLContainer];
}

id objc_msgSend_getCoreCaptureSPIContainer(void *a1, const char *a2, ...)
{
  return [a1 getCoreCaptureSPIContainer];
}

id objc_msgSend_getCoreDuetLogs(void *a1, const char *a2, ...)
{
  return [a1 getCoreDuetLogs];
}

id objc_msgSend_getCurrentInflightLocalDiagnostic(void *a1, const char *a2, ...)
{
  return [a1 getCurrentInflightLocalDiagnostic];
}

id objc_msgSend_getDSCSYMContainer(void *a1, const char *a2, ...)
{
  return [a1 getDSCSYMContainer];
}

id objc_msgSend_getDefaultArchiveName(void *a1, const char *a2, ...)
{
  return [a1 getDefaultArchiveName];
}

id objc_msgSend_getDiagnosticID(void *a1, const char *a2, ...)
{
  return [a1 getDiagnosticID];
}

id objc_msgSend_getDiagnosticIDSimple(void *a1, const char *a2, ...)
{
  return [a1 getDiagnosticIDSimple];
}

id objc_msgSend_getDiskTasksContainer(void *a1, const char *a2, ...)
{
  return [a1 getDiskTasksContainer];
}

id objc_msgSend_getDisplaytoolContainer(void *a1, const char *a2, ...)
{
  return [a1 getDisplaytoolContainer];
}

id objc_msgSend_getEnumerateCrashReporterContainer(void *a1, const char *a2, ...)
{
  return [a1 getEnumerateCrashReporterContainer];
}

id objc_msgSend_getExcResourceContainer(void *a1, const char *a2, ...)
{
  return [a1 getExcResourceContainer];
}

id objc_msgSend_getExposureNotificationContainer(void *a1, const char *a2, ...)
{
  return [a1 getExposureNotificationContainer];
}

id objc_msgSend_getFDRDiagnosticContainer(void *a1, const char *a2, ...)
{
  return [a1 getFDRDiagnosticContainer];
}

id objc_msgSend_getFileProviderCTLContainer(void *a1, const char *a2, ...)
{
  return [a1 getFileProviderCTLContainer];
}

id objc_msgSend_getFreezerctlContainer(void *a1, const char *a2, ...)
{
  return [a1 getFreezerctlContainer];
}

id objc_msgSend_getGMSAvailabilityContainer(void *a1, const char *a2, ...)
{
  return [a1 getGMSAvailabilityContainer];
}

id objc_msgSend_getGNIContainer(void *a1, const char *a2, ...)
{
  return [a1 getGNIContainer];
}

id objc_msgSend_getGestaltQueryContainer(void *a1, const char *a2, ...)
{
  return [a1 getGestaltQueryContainer];
}

id objc_msgSend_getHIDRecorderdContainer(void *a1, const char *a2, ...)
{
  return [a1 getHIDRecorderdContainer];
}

id objc_msgSend_getHIDReportContainers(void *a1, const char *a2, ...)
{
  return [a1 getHIDReportContainers];
}

id objc_msgSend_getHomeUtilAccessoryStateContainer(void *a1, const char *a2, ...)
{
  return [a1 getHomeUtilAccessoryStateContainer];
}

id objc_msgSend_getHomeUtilDumpAllContainer(void *a1, const char *a2, ...)
{
  return [a1 getHomeUtilDumpAllContainer];
}

id objc_msgSend_getIDSContainer(void *a1, const char *a2, ...)
{
  return [a1 getIDSContainer];
}

id objc_msgSend_getIOLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 getIOLogsContainer];
}

id objc_msgSend_getIOREGContainer(void *a1, const char *a2, ...)
{
  return [a1 getIOREGContainer];
}

id objc_msgSend_getInternalLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 getInternalLogsContainer];
}

id objc_msgSend_getKCSharingContainer(void *a1, const char *a2, ...)
{
  return [a1 getKCSharingContainer];
}

id objc_msgSend_getKeyboardPrefContainer(void *a1, const char *a2, ...)
{
  return [a1 getKeyboardPrefContainer];
}

id objc_msgSend_getLGSystemInfoContainer(void *a1, const char *a2, ...)
{
  return [a1 getLGSystemInfoContainer];
}

id objc_msgSend_getLGUtilitiesContainer(void *a1, const char *a2, ...)
{
  return [a1 getLGUtilitiesContainer];
}

id objc_msgSend_getLibnotifyContainer(void *a1, const char *a2, ...)
{
  return [a1 getLibnotifyContainer];
}

id objc_msgSend_getLibtraceContainers(void *a1, const char *a2, ...)
{
  return [a1 getLibtraceContainers];
}

id objc_msgSend_getLogCopyingContainers(void *a1, const char *a2, ...)
{
  return [a1 getLogCopyingContainers];
}

id objc_msgSend_getLogGenerationContainers(void *a1, const char *a2, ...)
{
  return [a1 getLogGenerationContainers];
}

id objc_msgSend_getLogStreamFilterContainer(void *a1, const char *a2, ...)
{
  return [a1 getLogStreamFilterContainer];
}

id objc_msgSend_getLogarchiveCollectionContainer(void *a1, const char *a2, ...)
{
  return [a1 getLogarchiveCollectionContainer];
}

id objc_msgSend_getLogarchiveSummaryContainer(void *a1, const char *a2, ...)
{
  return [a1 getLogarchiveSummaryContainer];
}

id objc_msgSend_getMediaContainer(void *a1, const char *a2, ...)
{
  return [a1 getMediaContainer];
}

id objc_msgSend_getMicrostackshotsWithPostContainers(void *a1, const char *a2, ...)
{
  return [a1 getMicrostackshotsWithPostContainers];
}

id objc_msgSend_getMultiTouchContainer(void *a1, const char *a2, ...)
{
  return [a1 getMultiTouchContainer];
}

id objc_msgSend_getNextMatch(void *a1, const char *a2, ...)
{
  return [a1 getNextMatch];
}

id objc_msgSend_getOTCTLContainer(void *a1, const char *a2, ...)
{
  return [a1 getOTCTLContainer];
}

id objc_msgSend_getPersonalizationLogs(void *a1, const char *a2, ...)
{
  return [a1 getPersonalizationLogs];
}

id objc_msgSend_getPommesStatusContainer(void *a1, const char *a2, ...)
{
  return [a1 getPommesStatusContainer];
}

id objc_msgSend_getPowerLogContainer(void *a1, const char *a2, ...)
{
  return [a1 getPowerLogContainer];
}

id objc_msgSend_getPowermetricsContainer(void *a1, const char *a2, ...)
{
  return [a1 getPowermetricsContainer];
}

id objc_msgSend_getPreferencesLogs(void *a1, const char *a2, ...)
{
  return [a1 getPreferencesLogs];
}

id objc_msgSend_getProcessesInfoContainer(void *a1, const char *a2, ...)
{
  return [a1 getProcessesInfoContainer];
}

id objc_msgSend_getProgress(void *a1, const char *a2, ...)
{
  return [a1 getProgress];
}

id objc_msgSend_getProtectionClass(void *a1, const char *a2, ...)
{
  return [a1 getProtectionClass];
}

id objc_msgSend_getProximityContainers(void *a1, const char *a2, ...)
{
  return [a1 getProximityContainers];
}

id objc_msgSend_getRemotectlContainer(void *a1, const char *a2, ...)
{
  return [a1 getRemotectlContainer];
}

id objc_msgSend_getRmdContainer(void *a1, const char *a2, ...)
{
  return [a1 getRmdContainer];
}

id objc_msgSend_getRunningBoardLogs(void *a1, const char *a2, ...)
{
  return [a1 getRunningBoardLogs];
}

id objc_msgSend_getSPIContainers(void *a1, const char *a2, ...)
{
  return [a1 getSPIContainers];
}

id objc_msgSend_getSWTransparencyContainer(void *a1, const char *a2, ...)
{
  return [a1 getSWTransparencyContainer];
}

id objc_msgSend_getSampleContainer(void *a1, const char *a2, ...)
{
  return [a1 getSampleContainer];
}

id objc_msgSend_getSelfCtlContainer(void *a1, const char *a2, ...)
{
  return [a1 getSelfCtlContainer];
}

id objc_msgSend_getSettings(void *a1, const char *a2, ...)
{
  return [a1 getSettings];
}

id objc_msgSend_getSoundAutoConfigContainer(void *a1, const char *a2, ...)
{
  return [a1 getSoundAutoConfigContainer];
}

id objc_msgSend_getSoundBoardContainer(void *a1, const char *a2, ...)
{
  return [a1 getSoundBoardContainer];
}

id objc_msgSend_getSpindumpContainers(void *a1, const char *a2, ...)
{
  return [a1 getSpindumpContainers];
}

id objc_msgSend_getSpuctlContainer(void *a1, const char *a2, ...)
{
  return [a1 getSpuctlContainer];
}

id objc_msgSend_getStackshotContainer(void *a1, const char *a2, ...)
{
  return [a1 getStackshotContainer];
}

id objc_msgSend_getStoreServicesContainer(void *a1, const char *a2, ...)
{
  return [a1 getStoreServicesContainer];
}

id objc_msgSend_getStspContainer(void *a1, const char *a2, ...)
{
  return [a1 getStspContainer];
}

id objc_msgSend_getSysCfgContainer(void *a1, const char *a2, ...)
{
  return [a1 getSysCfgContainer];
}

id objc_msgSend_getTSProcessSpecificContainers(void *a1, const char *a2, ...)
{
  return [a1 getTSProcessSpecificContainers];
}

id objc_msgSend_getTSSystemInfoContainer(void *a1, const char *a2, ...)
{
  return [a1 getTSSystemInfoContainer];
}

id objc_msgSend_getTailspinContainers(void *a1, const char *a2, ...)
{
  return [a1 getTailspinContainers];
}

id objc_msgSend_getThermHIDContainers(void *a1, const char *a2, ...)
{
  return [a1 getThermHIDContainers];
}

id objc_msgSend_getTimeSensitiveContainers(void *a1, const char *a2, ...)
{
  return [a1 getTimeSensitiveContainers];
}

id objc_msgSend_getTimeoutSec(void *a1, const char *a2, ...)
{
  return [a1 getTimeoutSec];
}

id objc_msgSend_getTimeoutTarget(void *a1, const char *a2, ...)
{
  return [a1 getTimeoutTarget];
}

id objc_msgSend_getTimezoneDBLogs(void *a1, const char *a2, ...)
{
  return [a1 getTimezoneDBLogs];
}

id objc_msgSend_getTransparencyContainer(void *a1, const char *a2, ...)
{
  return [a1 getTransparencyContainer];
}

id objc_msgSend_getTrialRolloutsContainer(void *a1, const char *a2, ...)
{
  return [a1 getTrialRolloutsContainer];
}

id objc_msgSend_getTriggerBasebandDumpContainer(void *a1, const char *a2, ...)
{
  return [a1 getTriggerBasebandDumpContainer];
}

id objc_msgSend_getUncompressedSize(void *a1, const char *a2, ...)
{
  return [a1 getUncompressedSize];
}

id objc_msgSend_getUptimeContainer(void *a1, const char *a2, ...)
{
  return [a1 getUptimeContainer];
}

id objc_msgSend_getUserSettings(void *a1, const char *a2, ...)
{
  return [a1 getUserSettings];
}

id objc_msgSend_getWifiDextCorefilesContainer(void *a1, const char *a2, ...)
{
  return [a1 getWifiDextCorefilesContainer];
}

id objc_msgSend_getaccountsInternalLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 getaccountsInternalLogsContainer];
}

id objc_msgSend_getc26ToolContainer(void *a1, const char *a2, ...)
{
  return [a1 getc26ToolContainer];
}

id objc_msgSend_getclpcContainer(void *a1, const char *a2, ...)
{
  return [a1 getclpcContainer];
}

id objc_msgSend_getclpcctrlContainer(void *a1, const char *a2, ...)
{
  return [a1 getclpcctrlContainer];
}

id objc_msgSend_getcontrolbitsContainer(void *a1, const char *a2, ...)
{
  return [a1 getcontrolbitsContainer];
}

id objc_msgSend_getlaunchdAndCTSContainers(void *a1, const char *a2, ...)
{
  return [a1 getlaunchdAndCTSContainers];
}

id objc_msgSend_getlaunchdContainer(void *a1, const char *a2, ...)
{
  return [a1 getlaunchdContainer];
}

id objc_msgSend_getmiscInternalLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 getmiscInternalLogsContainer];
}

id objc_msgSend_getosvariantUtilContainer(void *a1, const char *a2, ...)
{
  return [a1 getosvariantUtilContainer];
}

id objc_msgSend_getsmcDiagnoseContainer(void *a1, const char *a2, ...)
{
  return [a1 getsmcDiagnoseContainer];
}

id objc_msgSend_getswcutilContainer(void *a1, const char *a2, ...)
{
  return [a1 getswcutilContainer];
}

id objc_msgSend_getsysconfigInternalLogsContainer(void *a1, const char *a2, ...)
{
  return [a1 getsysconfigInternalLogsContainer];
}

id objc_msgSend_glob(void *a1, const char *a2, ...)
{
  return [a1 glob];
}

id objc_msgSend_headDir(void *a1, const char *a2, ...)
{
  return [a1 headDir];
}

id objc_msgSend_helperRepliedHandler(void *a1, const char *a2, ...)
{
  return [a1 helperRepliedHandler];
}

id objc_msgSend_highPriorityLogs(void *a1, const char *a2, ...)
{
  return [a1 highPriorityLogs];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_hostOutputDir(void *a1, const char *a2, ...)
{
  return [a1 hostOutputDir];
}

id objc_msgSend_hostWaitGroup(void *a1, const char *a2, ...)
{
  return [a1 hostWaitGroup];
}

id objc_msgSend_idsCase(void *a1, const char *a2, ...)
{
  return [a1 idsCase];
}

id objc_msgSend_inactiveLimit(void *a1, const char *a2, ...)
{
  return [a1 inactiveLimit];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initCacheEnumerator(void *a1, const char *a2, ...)
{
  return [a1 initCacheEnumerator];
}

id objc_msgSend_initPeerProgressHandler(void *a1, const char *a2, ...)
{
  return [a1 initPeerProgressHandler];
}

id objc_msgSend_initRemoteServers(void *a1, const char *a2, ...)
{
  return [a1 initRemoteServers];
}

id objc_msgSend_initStreaming(void *a1, const char *a2, ...)
{
  return [a1 initStreaming];
}

id objc_msgSend_initiatedByRemoteHost(void *a1, const char *a2, ...)
{
  return [a1 initiatedByRemoteHost];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return [a1 isAbsolutePath];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAutomaticCoSysdiagnosePossible(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticCoSysdiagnosePossible];
}

id objc_msgSend_isCoSysdiagnoseResponse(void *a1, const char *a2, ...)
{
  return [a1 isCoSysdiagnoseResponse];
}

id objc_msgSend_isConcurrent(void *a1, const char *a2, ...)
{
  return [a1 isConcurrent];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isDaemon(void *a1, const char *a2, ...)
{
  return [a1 isDaemon];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDevice];
}

id objc_msgSend_isDeviceUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 isDeviceUnlockedSinceBoot];
}

id objc_msgSend_isEarlyPrompt(void *a1, const char *a2, ...)
{
  return [a1 isEarlyPrompt];
}

id objc_msgSend_isHost(void *a1, const char *a2, ...)
{
  return [a1 isHost];
}

id objc_msgSend_isLimitedLoggingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isLimitedLoggingEnabled];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return [a1 isPaired];
}

id objc_msgSend_isPromptEligible(void *a1, const char *a2, ...)
{
  return [a1 isPromptEligible];
}

id objc_msgSend_isRemoteInitiated(void *a1, const char *a2, ...)
{
  return [a1 isRemoteInitiated];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isRunningAlone(void *a1, const char *a2, ...)
{
  return [a1 isRunningAlone];
}

id objc_msgSend_isTestingMode(void *a1, const char *a2, ...)
{
  return [a1 isTestingMode];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_launchPath(void *a1, const char *a2, ...)
{
  return [a1 launchPath];
}

id objc_msgSend_layoutRole(void *a1, const char *a2, ...)
{
  return [a1 layoutRole];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadExtensions(void *a1, const char *a2, ...)
{
  return [a1 loadExtensions];
}

id objc_msgSend_localGroupDictionary(void *a1, const char *a2, ...)
{
  return [a1 localGroupDictionary];
}

id objc_msgSend_localLogCollectionDiagnosticID(void *a1, const char *a2, ...)
{
  return [a1 localLogCollectionDiagnosticID];
}

id objc_msgSend_localTupleDictionary(void *a1, const char *a2, ...)
{
  return [a1 localTupleDictionary];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logAgentConnection(void *a1, const char *a2, ...)
{
  return [a1 logAgentConnection];
}

id objc_msgSend_logArray(void *a1, const char *a2, ...)
{
  return [a1 logArray];
}

id objc_msgSend_logDates(void *a1, const char *a2, ...)
{
  return [a1 logDates];
}

id objc_msgSend_logSubsystem(void *a1, const char *a2, ...)
{
  return [a1 logSubsystem];
}

id objc_msgSend_logs(void *a1, const char *a2, ...)
{
  return [a1 logs];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_makeOutputDirectory(void *a1, const char *a2, ...)
{
  return [a1 makeOutputDirectory];
}

id objc_msgSend_markFoldersAsComplete(void *a1, const char *a2, ...)
{
  return [a1 markFoldersAsComplete];
}

id objc_msgSend_matchEnumerator(void *a1, const char *a2, ...)
{
  return [a1 matchEnumerator];
}

id objc_msgSend_maxDepth(void *a1, const char *a2, ...)
{
  return [a1 maxDepth];
}

id objc_msgSend_maxHistory(void *a1, const char *a2, ...)
{
  return [a1 maxHistory];
}

id objc_msgSend_maxVariety(void *a1, const char *a2, ...)
{
  return [a1 maxVariety];
}

id objc_msgSend_maximumSizeMB(void *a1, const char *a2, ...)
{
  return [a1 maximumSizeMB];
}

id objc_msgSend_mayStartExecuting(void *a1, const char *a2, ...)
{
  return [a1 mayStartExecuting];
}

id objc_msgSend_metricsDict(void *a1, const char *a2, ...)
{
  return [a1 metricsDict];
}

id objc_msgSend_minimumTimeBeforeTimeouts(void *a1, const char *a2, ...)
{
  return [a1 minimumTimeBeforeTimeouts];
}

id objc_msgSend_mobileContainer(void *a1, const char *a2, ...)
{
  return [a1 mobileContainer];
}

id objc_msgSend_mobileContainerClass(void *a1, const char *a2, ...)
{
  return [a1 mobileContainerClass];
}

id objc_msgSend_msgContents(void *a1, const char *a2, ...)
{
  return [a1 msgContents];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newestFileLimit(void *a1, const char *a2, ...)
{
  return [a1 newestFileLimit];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nextSysdiagnoseFile(void *a1, const char *a2, ...)
{
  return [a1 nextSysdiagnoseFile];
}

id objc_msgSend_nextValidURL(void *a1, const char *a2, ...)
{
  return [a1 nextValidURL];
}

id objc_msgSend_noTimeout(void *a1, const char *a2, ...)
{
  return [a1 noTimeout];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_numAttachTries(void *a1, const char *a2, ...)
{
  return [a1 numAttachTries];
}

id objc_msgSend_numExitedTasks(void *a1, const char *a2, ...)
{
  return [a1 numExitedTasks];
}

id objc_msgSend_numReapedTasks(void *a1, const char *a2, ...)
{
  return [a1 numReapedTasks];
}

id objc_msgSend_numRunningBlocks(void *a1, const char *a2, ...)
{
  return [a1 numRunningBlocks];
}

id objc_msgSend_numRunningHelperTasks(void *a1, const char *a2, ...)
{
  return [a1 numRunningHelperTasks];
}

id objc_msgSend_numRunningTaskContainers(void *a1, const char *a2, ...)
{
  return [a1 numRunningTaskContainers];
}

id objc_msgSend_numTimeouts(void *a1, const char *a2, ...)
{
  return [a1 numTimeouts];
}

id objc_msgSend_numberDiagnosticsInflight(void *a1, const char *a2, ...)
{
  return [a1 numberDiagnosticsInflight];
}

id objc_msgSend_offsets(void *a1, const char *a2, ...)
{
  return [a1 offsets];
}

id objc_msgSend_onlyRunContainersWithNames(void *a1, const char *a2, ...)
{
  return [a1 onlyRunContainersWithNames];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_openIssueFiler(void *a1, const char *a2, ...)
{
  return [a1 openIssueFiler];
}

id objc_msgSend_outputDir(void *a1, const char *a2, ...)
{
  return [a1 outputDir];
}

id objc_msgSend_outputDirectory(void *a1, const char *a2, ...)
{
  return [a1 outputDirectory];
}

id objc_msgSend_outputMetrics(void *a1, const char *a2, ...)
{
  return [a1 outputMetrics];
}

id objc_msgSend_overrideContainers(void *a1, const char *a2, ...)
{
  return [a1 overrideContainers];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pathSubmission(void *a1, const char *a2, ...)
{
  return [a1 pathSubmission];
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return [a1 paths];
}

id objc_msgSend_peerManager(void *a1, const char *a2, ...)
{
  return [a1 peerManager];
}

id objc_msgSend_phaseTracker(void *a1, const char *a2, ...)
{
  return [a1 phaseTracker];
}

id objc_msgSend_pidIndices(void *a1, const char *a2, ...)
{
  return [a1 pidIndices];
}

id objc_msgSend_pipelineFlush(void *a1, const char *a2, ...)
{
  return [a1 pipelineFlush];
}

id objc_msgSend_populateProcessInfoForInput(void *a1, const char *a2, ...)
{
  return [a1 populateProcessInfoForInput];
}

id objc_msgSend_populateProcesses(void *a1, const char *a2, ...)
{
  return [a1 populateProcesses];
}

id objc_msgSend_possibleClient(void *a1, const char *a2, ...)
{
  return [a1 possibleClient];
}

id objc_msgSend_prepareCoSysdiagnoseParams(void *a1, const char *a2, ...)
{
  return [a1 prepareCoSysdiagnoseParams];
}

id objc_msgSend_prepareOutput(void *a1, const char *a2, ...)
{
  return [a1 prepareOutput];
}

id objc_msgSend_prepareOutputDirectory(void *a1, const char *a2, ...)
{
  return [a1 prepareOutputDirectory];
}

id objc_msgSend_preparePaths(void *a1, const char *a2, ...)
{
  return [a1 preparePaths];
}

id objc_msgSend_prepareSummary(void *a1, const char *a2, ...)
{
  return [a1 prepareSummary];
}

id objc_msgSend_processCount(void *a1, const char *a2, ...)
{
  return [a1 processCount];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processes(void *a1, const char *a2, ...)
{
  return [a1 processes];
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 productBuildVersion];
}

id objc_msgSend_progressManager(void *a1, const char *a2, ...)
{
  return [a1 progressManager];
}

id objc_msgSend_prompt(void *a1, const char *a2, ...)
{
  return [a1 prompt];
}

id objc_msgSend_providedPIDorProcess(void *a1, const char *a2, ...)
{
  return [a1 providedPIDorProcess];
}

id objc_msgSend_proxies(void *a1, const char *a2, ...)
{
  return [a1 proxies];
}

id objc_msgSend_pushBufferDelegate(void *a1, const char *a2, ...)
{
  return [a1 pushBufferDelegate];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_quickMode(void *a1, const char *a2, ...)
{
  return [a1 quickMode];
}

id objc_msgSend_ranForMaximumTime(void *a1, const char *a2, ...)
{
  return [a1 ranForMaximumTime];
}

id objc_msgSend_ranForMinimumTime(void *a1, const char *a2, ...)
{
  return [a1 ranForMinimumTime];
}

id objc_msgSend_readCoSysdiagnoseSetting(void *a1, const char *a2, ...)
{
  return [a1 readCoSysdiagnoseSetting];
}

id objc_msgSend_reapTasks(void *a1, const char *a2, ...)
{
  return [a1 reapTasks];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_receiveFileSema(void *a1, const char *a2, ...)
{
  return [a1 receiveFileSema];
}

id objc_msgSend_recordBlockTaskEnd(void *a1, const char *a2, ...)
{
  return [a1 recordBlockTaskEnd];
}

id objc_msgSend_recordBlockTaskStart(void *a1, const char *a2, ...)
{
  return [a1 recordBlockTaskStart];
}

id objc_msgSend_recordHelperTaskEnd(void *a1, const char *a2, ...)
{
  return [a1 recordHelperTaskEnd];
}

id objc_msgSend_recordHelperTaskStart(void *a1, const char *a2, ...)
{
  return [a1 recordHelperTaskStart];
}

id objc_msgSend_registerActivity(void *a1, const char *a2, ...)
{
  return [a1 registerActivity];
}

id objc_msgSend_registerCallbacks(void *a1, const char *a2, ...)
{
  return [a1 registerCallbacks];
}

id objc_msgSend_relative(void *a1, const char *a2, ...)
{
  return [a1 relative];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return [a1 relativePath];
}

id objc_msgSend_remainingDepth(void *a1, const char *a2, ...)
{
  return [a1 remainingDepth];
}

id objc_msgSend_remoteGroup(void *a1, const char *a2, ...)
{
  return [a1 remoteGroup];
}

id objc_msgSend_remoteSysdiagnoseID(void *a1, const char *a2, ...)
{
  return [a1 remoteSysdiagnoseID];
}

id objc_msgSend_remoteUUIDs(void *a1, const char *a2, ...)
{
  return [a1 remoteUUIDs];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_reply(void *a1, const char *a2, ...)
{
  return [a1 reply];
}

id objc_msgSend_replyBlock(void *a1, const char *a2, ...)
{
  return [a1 replyBlock];
}

id objc_msgSend_requestSource(void *a1, const char *a2, ...)
{
  return [a1 requestSource];
}

id objc_msgSend_resolveHomeDirs(void *a1, const char *a2, ...)
{
  return [a1 resolveHomeDirs];
}

id objc_msgSend_resolvePaths(void *a1, const char *a2, ...)
{
  return [a1 resolvePaths];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retryAttachToBTSession(void *a1, const char *a2, ...)
{
  return [a1 retryAttachToBTSession];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rootPath(void *a1, const char *a2, ...)
{
  return [a1 rootPath];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runByItself(void *a1, const char *a2, ...)
{
  return [a1 runByItself];
}

id objc_msgSend_runningTaskContainers(void *a1, const char *a2, ...)
{
  return [a1 runningTaskContainers];
}

id objc_msgSend_runningTasks(void *a1, const char *a2, ...)
{
  return [a1 runningTasks];
}

id objc_msgSend_runtimeChecks(void *a1, const char *a2, ...)
{
  return [a1 runtimeChecks];
}

id objc_msgSend_runtimeFlagDelegate(void *a1, const char *a2, ...)
{
  return [a1 runtimeFlagDelegate];
}

id objc_msgSend_safeLeaveHostWaitGroup(void *a1, const char *a2, ...)
{
  return [a1 safeLeaveHostWaitGroup];
}

id objc_msgSend_safeLeaveRemoteGroup(void *a1, const char *a2, ...)
{
  return [a1 safeLeaveRemoteGroup];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 seekToEndOfFile];
}

id objc_msgSend_sendCoreAnalytics(void *a1, const char *a2, ...)
{
  return [a1 sendCoreAnalytics];
}

id objc_msgSend_sendDefaultsInstructions(void *a1, const char *a2, ...)
{
  return [a1 sendDefaultsInstructions];
}

id objc_msgSend_sendFailedInstructions(void *a1, const char *a2, ...)
{
  return [a1 sendFailedInstructions];
}

id objc_msgSend_sendPathToArchive(void *a1, const char *a2, ...)
{
  return [a1 sendPathToArchive];
}

id objc_msgSend_sendUnableToCreateMsg(void *a1, const char *a2, ...)
{
  return [a1 sendUnableToCreateMsg];
}

id objc_msgSend_sequentialTasksQueue(void *a1, const char *a2, ...)
{
  return [a1 sequentialTasksQueue];
}

id objc_msgSend_sequentialTasksSem(void *a1, const char *a2, ...)
{
  return [a1 sequentialTasksSem];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_sessionConfigs(void *a1, const char *a2, ...)
{
  return [a1 sessionConfigs];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedResourceManager(void *a1, const char *a2, ...)
{
  return [a1 sharedResourceManager];
}

id objc_msgSend_sharedTaskDepot(void *a1, const char *a2, ...)
{
  return [a1 sharedTaskDepot];
}

id objc_msgSend_shouldCollectAllTrusted(void *a1, const char *a2, ...)
{
  return [a1 shouldCollectAllTrusted];
}

id objc_msgSend_shouldCreateTarBall(void *a1, const char *a2, ...)
{
  return [a1 shouldCreateTarBall];
}

id objc_msgSend_shouldDisplayTarBall(void *a1, const char *a2, ...)
{
  return [a1 shouldDisplayTarBall];
}

id objc_msgSend_shouldGatherBTLogs(void *a1, const char *a2, ...)
{
  return [a1 shouldGatherBTLogs];
}

id objc_msgSend_shouldGatherCoSysdiagnoses(void *a1, const char *a2, ...)
{
  return [a1 shouldGatherCoSysdiagnoses];
}

id objc_msgSend_shouldGetFeedbackData(void *a1, const char *a2, ...)
{
  return [a1 shouldGetFeedbackData];
}

id objc_msgSend_shouldPostProcess(void *a1, const char *a2, ...)
{
  return [a1 shouldPostProcess];
}

id objc_msgSend_shouldRemoveTemporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 shouldRemoveTemporaryDirectory];
}

id objc_msgSend_shouldRunIDSDump(void *a1, const char *a2, ...)
{
  return [a1 shouldRunIDSDump];
}

id objc_msgSend_shouldRunLogCopyTasks(void *a1, const char *a2, ...)
{
  return [a1 shouldRunLogCopyTasks];
}

id objc_msgSend_shouldRunLogGenerationTasks(void *a1, const char *a2, ...)
{
  return [a1 shouldRunLogGenerationTasks];
}

id objc_msgSend_shouldRunOSLogArchive(void *a1, const char *a2, ...)
{
  return [a1 shouldRunOSLogArchive];
}

id objc_msgSend_shouldRunTimeSensitiveTasks(void *a1, const char *a2, ...)
{
  return [a1 shouldRunTimeSensitiveTasks];
}

id objc_msgSend_shouldRunWifiDextCoreFilesCollection(void *a1, const char *a2, ...)
{
  return [a1 shouldRunWifiDextCoreFilesCollection];
}

id objc_msgSend_shouldStreamToTar(void *a1, const char *a2, ...)
{
  return [a1 shouldStreamToTar];
}

id objc_msgSend_signalInterrupt(void *a1, const char *a2, ...)
{
  return [a1 signalInterrupt];
}

id objc_msgSend_signalStopTasks(void *a1, const char *a2, ...)
{
  return [a1 signalStopTasks];
}

id objc_msgSend_sizeBytes(void *a1, const char *a2, ...)
{
  return [a1 sizeBytes];
}

id objc_msgSend_sizes(void *a1, const char *a2, ...)
{
  return [a1 sizes];
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return [a1 skipDescendants];
}

id objc_msgSend_slowTimeout(void *a1, const char *a2, ...)
{
  return [a1 slowTimeout];
}

id objc_msgSend_sourcePath(void *a1, const char *a2, ...)
{
  return [a1 sourcePath];
}

id objc_msgSend_standardizedURL(void *a1, const char *a2, ...)
{
  return [a1 standardizedURL];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startDiagnosticTime(void *a1, const char *a2, ...)
{
  return [a1 startDiagnosticTime];
}

id objc_msgSend_startDiagnosticTimeClockNS(void *a1, const char *a2, ...)
{
  return [a1 startDiagnosticTimeClockNS];
}

id objc_msgSend_startIDSConnection(void *a1, const char *a2, ...)
{
  return [a1 startIDSConnection];
}

id objc_msgSend_startTasks(void *a1, const char *a2, ...)
{
  return [a1 startTasks];
}

id objc_msgSend_startTasksSequentially(void *a1, const char *a2, ...)
{
  return [a1 startTasksSequentially];
}

id objc_msgSend_startTimeout(void *a1, const char *a2, ...)
{
  return [a1 startTimeout];
}

id objc_msgSend_started(void *a1, const char *a2, ...)
{
  return [a1 started];
}

id objc_msgSend_statusBar(void *a1, const char *a2, ...)
{
  return [a1 statusBar];
}

id objc_msgSend_stderrPath(void *a1, const char *a2, ...)
{
  return [a1 stderrPath];
}

id objc_msgSend_stdoutPath(void *a1, const char *a2, ...)
{
  return [a1 stdoutPath];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopTasks(void *a1, const char *a2, ...)
{
  return [a1 stopTasks];
}

id objc_msgSend_stopped(void *a1, const char *a2, ...)
{
  return [a1 stopped];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByRemovingWhitespace(void *a1, const char *a2, ...)
{
  return [a1 stringByRemovingWhitespace];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subdirectory(void *a1, const char *a2, ...)
{
  return [a1 subdirectory];
}

id objc_msgSend_summarizeErrorsForExecutedContainers(void *a1, const char *a2, ...)
{
  return [a1 summarizeErrorsForExecutedContainers];
}

id objc_msgSend_summaryFD(void *a1, const char *a2, ...)
{
  return [a1 summaryFD];
}

id objc_msgSend_summaryHandle(void *a1, const char *a2, ...)
{
  return [a1 summaryHandle];
}

id objc_msgSend_supportsPartialCollection(void *a1, const char *a2, ...)
{
  return [a1 supportsPartialCollection];
}

id objc_msgSend_sysdiagnoseDirectory(void *a1, const char *a2, ...)
{
  return [a1 sysdiagnoseDirectory];
}

id objc_msgSend_sysdiagnoseInternalDirectory(void *a1, const char *a2, ...)
{
  return [a1 sysdiagnoseInternalDirectory];
}

id objc_msgSend_tailspinOnly(void *a1, const char *a2, ...)
{
  return [a1 tailspinOnly];
}

id objc_msgSend_tarQueue(void *a1, const char *a2, ...)
{
  return [a1 tarQueue];
}

id objc_msgSend_tarballPath(void *a1, const char *a2, ...)
{
  return [a1 tarballPath];
}

id objc_msgSend_targetPIDs(void *a1, const char *a2, ...)
{
  return [a1 targetPIDs];
}

id objc_msgSend_targetPath(void *a1, const char *a2, ...)
{
  return [a1 targetPath];
}

id objc_msgSend_taskCompletionBlock(void *a1, const char *a2, ...)
{
  return [a1 taskCompletionBlock];
}

id objc_msgSend_taskContainer(void *a1, const char *a2, ...)
{
  return [a1 taskContainer];
}

id objc_msgSend_taskFileHandleArray(void *a1, const char *a2, ...)
{
  return [a1 taskFileHandleArray];
}

id objc_msgSend_taskName(void *a1, const char *a2, ...)
{
  return [a1 taskName];
}

id objc_msgSend_taskQueue(void *a1, const char *a2, ...)
{
  return [a1 taskQueue];
}

id objc_msgSend_taskType(void *a1, const char *a2, ...)
{
  return [a1 taskType];
}

id objc_msgSend_tasks(void *a1, const char *a2, ...)
{
  return [a1 tasks];
}

id objc_msgSend_tconNvmDump(void *a1, const char *a2, ...)
{
  return [a1 tconNvmDump];
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return [a1 terminationStatus];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_timeoutMetricsString(void *a1, const char *a2, ...)
{
  return [a1 timeoutMetricsString];
}

id objc_msgSend_timeoutSource(void *a1, const char *a2, ...)
{
  return [a1 timeoutSource];
}

id objc_msgSend_tmpOutputDirectory(void *a1, const char *a2, ...)
{
  return [a1 tmpOutputDirectory];
}

id objc_msgSend_totalFailedTasks(void *a1, const char *a2, ...)
{
  return [a1 totalFailedTasks];
}

id objc_msgSend_totalTaskContainers(void *a1, const char *a2, ...)
{
  return [a1 totalTaskContainers];
}

id objc_msgSend_totalTasks(void *a1, const char *a2, ...)
{
  return [a1 totalTasks];
}

id objc_msgSend_totalTime(void *a1, const char *a2, ...)
{
  return [a1 totalTime];
}

id objc_msgSend_totalTimeouts(void *a1, const char *a2, ...)
{
  return [a1 totalTimeouts];
}

id objc_msgSend_triggerAirPodLogsIfConnected(void *a1, const char *a2, ...)
{
  return [a1 triggerAirPodLogsIfConnected];
}

id objc_msgSend_triggerExposureNotificationLogs(void *a1, const char *a2, ...)
{
  return [a1 triggerExposureNotificationLogs];
}

id objc_msgSend_triggerRemoteSysdiagnoses(void *a1, const char *a2, ...)
{
  return [a1 triggerRemoteSysdiagnoses];
}

id objc_msgSend_triggerWatchCoSysdiagnose(void *a1, const char *a2, ...)
{
  return [a1 triggerWatchCoSysdiagnose];
}

id objc_msgSend_ttrOverrideURLStr(void *a1, const char *a2, ...)
{
  return [a1 ttrOverrideURLStr];
}

id objc_msgSend_unit(void *a1, const char *a2, ...)
{
  return [a1 unit];
}

id objc_msgSend_units(void *a1, const char *a2, ...)
{
  return [a1 units];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateContainerWithOverride(void *a1, const char *a2, ...)
{
  return [a1 updateContainerWithOverride];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_urlEnumerator(void *a1, const char *a2, ...)
{
  return [a1 urlEnumerator];
}

id objc_msgSend_useParallelCompression(void *a1, const char *a2, ...)
{
  return [a1 useParallelCompression];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_validFileSubstrings(void *a1, const char *a2, ...)
{
  return [a1 validFileSubstrings];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_verbose(void *a1, const char *a2, ...)
{
  return [a1 verbose];
}

id objc_msgSend_vibrateStart(void *a1, const char *a2, ...)
{
  return [a1 vibrateStart];
}

id objc_msgSend_waitForAirPodLogsIfAvailable(void *a1, const char *a2, ...)
{
  return [a1 waitForAirPodLogsIfAvailable];
}

id objc_msgSend_waitForRemoteLogs(void *a1, const char *a2, ...)
{
  return [a1 waitForRemoteLogs];
}

id objc_msgSend_waitToReceiveCoSysdiagnose(void *a1, const char *a2, ...)
{
  return [a1 waitToReceiveCoSysdiagnose];
}

id objc_msgSend_waitingToCaptureAirPodLogs(void *a1, const char *a2, ...)
{
  return [a1 waitingToCaptureAirPodLogs];
}

id objc_msgSend_waitingToCaptureExposureNotificationLogs(void *a1, const char *a2, ...)
{
  return [a1 waitingToCaptureExposureNotificationLogs];
}

id objc_msgSend_wallTimeUsedNS(void *a1, const char *a2, ...)
{
  return [a1 wallTimeUsedNS];
}

id objc_msgSend_warnProcessAllowlist(void *a1, const char *a2, ...)
{
  return [a1 warnProcessAllowlist];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_writeToSummary_(void *a1, const char *a2, ...)
{
  return [a1 writeToSummary:];
}