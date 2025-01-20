void sub_100003EC8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  NSObject *v16;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      v8 = "fetchLocationsOfInterestOfType failed with %@";
      v9 = v7;
      v10 = 12;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    if (![v5 count])
    {
      v7 = BRKLoggingObjectForDomain();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      LOWORD(v13) = 0;
      v8 = "fetchLocationsOfInterestOfType count == 0";
      v9 = v7;
      v10 = 2;
      goto LABEL_4;
    }
    v11 = [v5 sortedArrayUsingComparator:&stru_100008270];
    v7 = [v11 lastObject];

    v12 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315394;
      v14 = "-[BRKCompanionContextManager fetchLocationOfInterest]_block_invoke";
      v15 = 2112;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s mostVisitedHome %@", (uint8_t *)&v13, 0x16u);
    }

    if (v7) {
      [*(id *)(a1 + 32) monitorLocationOfInterest:v7];
    }
  }
LABEL_12:
}

int64_t sub_100004098(id a1, id a2, id a3)
{
  id v4 = a3;
  v5 = [a2 visits];
  v6 = [v4 visits];

  v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
  v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
  id v9 = [v7 compare:v8];

  return (int64_t)v9;
}

void sub_1000044BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    v7 = "-[BRKCompanionContextManager locationManager:didEnter:completion:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s sent IDS message %@ w/ error: %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_1000046F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    v7 = "-[BRKCompanionContextManager locationManager:didExitRegion:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s sent IDS message %@ w/ error: %@", (uint8_t *)&v6, 0x20u);
  }
}

void sub_10000482C()
{
  if (_set_user_dir_suffix())
  {
    id v0 = NSTemporaryDirectory();
  }
  else
  {
    v1 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_1000053C4(v1);
    }
  }
}

uint64_t start()
{
  id v0 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "void waitForFirstUnlockIfNecessary()";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  BOOL v1 = MKBGetDeviceLockState() == 3 || MKBDeviceUnlockedSinceBoot() == 1;
  v2 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Protected data available: %d", (uint8_t *)&buf, 8u);
  }

  if (!v1)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    int out_token = 0;
    id v4 = dispatch_get_global_queue(0, 0);
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v23 = sub_100004C10;
    v24 = &unk_1000082E8;
    uint64_t v5 = v3;
    v25 = v5;
    uint32_t v6 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v4, &buf);

    v7 = BRKLoggingObjectForDomain();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to register for first unlock notification; continuing anyway",
          v19,
          2u);
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "brook waiting for first unlock", v19, 2u);
      }

      dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v9 = BRKLoggingObjectForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "brook got first unlock notification", v19, 2u);
      }

      notify_cancel(out_token);
    }
  }
  sub_10000482C();
  id v11 = +[BRKIDSService sharedInstance];
  v12 = [[BRKCompanionContextManager alloc] initWithBRKIDSService:v11];
  v13 = [[BRKCompanionDataCollectionLogger alloc] initWithIDSService:v11];
  v14 = objc_alloc_init(BRKTipsSignalDonation);
  v21[0] = v12;
  v21[1] = v13;
  v21[2] = v14;
  uint64_t v15 = +[NSArray arrayWithObjects:v21 count:3];
  v16 = (void *)qword_10000D238;
  qword_10000D238 = v15;

  v17 = +[NSRunLoop currentRunLoop];
  [v17 run];

  return 0;
}

intptr_t sub_100004C10(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100004E24(uint64_t a1)
{
  BOOL v1 = (uint64_t *)(a1 + 32);
  v2 = [*(id *)(a1 + 32) lastPathComponent];
  dispatch_semaphore_t v3 = +[NSString stringWithFormat:@"%@/%@.ips", @"/var/mobile/Library/Logs/CrashReporter/", v2];

  id v4 = +[NSURL fileURLWithPath:v3];
  uint64_t v5 = +[NSFileManager defaultManager];
  [v5 copyItemAtURL:*v1 toURL:v4 error:0];

  uint64_t v6 = *v1;
  id v12 = 0;
  v7 = +[NSData dataWithContentsOfURL:v6 options:1 error:&v12];
  id v8 = v12;
  if (v8)
  {
    uint64_t v9 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100005408(v1, v8, v9);
    }
  }
  else
  {
    uint64_t v9 = [objc_alloc((Class)SFCustomFeedback) initWithType:15 data:v7];
    __int16 v10 = +[PARSession sharedSession];
    [v10 sendCustomFeedback:v9];
  }
  id v11 = +[NSFileManager defaultManager];
  [v11 removeItemAtURL:*v1 error:0];
}

void sub_1000050DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6 && [v6 code] == (id)8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000054BC((uint64_t)v7);
    }
    [*(id *)(a1 + 32) fetchLocationsOfInterestOfType:*(void *)(a1 + 48) withHandler:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000053C4(os_log_t log)
{
  *(_WORD *)BOOL v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set user directory suffix!", v1, 2u);
}

void sub_100005408(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4 = *a1;
  id v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Skipping upload with error reading data from: %@, error: %@", (uint8_t *)&v6, 0x16u);
}

void sub_1000054BC(uint64_t a1)
{
  int v1 = 136315394;
  v2 = "+[BRKRoutineManager fetchLocationsOfInterestWithSingleRetryOfType:routineManager:withHandler:]_block_invoke";
  __int16 v3 = 2114;
  uint64_t v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: Retrying once %{public}@", (uint8_t *)&v1, 0x16u);
}

uint64_t BRKCreateDirectory()
{
  return _BRKCreateDirectory();
}

uint64_t BRKCreateDispatchQueue()
{
  return _BRKCreateDispatchQueue();
}

uint64_t BRKLoggingObjectForDomain()
{
  return _BRKLoggingObjectForDomain();
}

uint64_t BRKMarkFilePurgeable()
{
  return _BRKMarkFilePurgeable();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return _CLLocationCoordinate2DIsValid(coord);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
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

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__makeTipsSignalDonationUpdate(void *a1, const char *a2, ...)
{
  return [a1 _makeTipsSignalDonationUpdate];
}

id objc_msgSend_areRemindersEnabled(void *a1, const char *a2, ...)
{
  return [a1 areRemindersEnabled];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatus];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_discoverabilitySignal(void *a1, const char *a2, ...)
{
  return [a1 discoverabilitySignal];
}

id objc_msgSend_fetchLocationOfInterest(void *a1, const char *a2, ...)
{
  return [a1 fetchLocationOfInterest];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isCachedLocationAuthFlowEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCachedLocationAuthFlowEnabled];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return [a1 radius];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_settingsForActiveDevice(void *a1, const char *a2, ...)
{
  return [a1 settingsForActiveDevice];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_stopMonitoringHome(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringHome];
}

id objc_msgSend_visits(void *a1, const char *a2, ...)
{
  return [a1 visits];
}