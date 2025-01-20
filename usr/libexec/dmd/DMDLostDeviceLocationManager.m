@interface DMDLostDeviceLocationManager
+ (DMDLostDeviceLocationManager)sharedManager;
- (BOOL)_updateLostModeFileForOriginator:(id)a3;
- (CLLocationManager)locationManager;
- (DMDLostDeviceLocationManager)init;
- (NSString)lastLocationRequestedDateMessage;
- (NSString)originator;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timeoutTimerDispatchSource;
- (id)completionBlock;
- (void)_cleanupAfterResponseFromLocationManagerOrTimeout;
- (void)clearLastLocationRequestedDate;
- (void)getCurrentLocationForOriginator:(id)a3 completion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setCompletionBlock:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setOriginator:(id)a3;
- (void)setTimeoutTimerDispatchSource:(id)a3;
@end

@implementation DMDLostDeviceLocationManager

- (DMDLostDeviceLocationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)DMDLostDeviceLocationManager;
  v2 = [(DMDLostDeviceLocationManager *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v5 = dispatch_queue_create((const char *)[@"DMDLDLMServiceQueue" UTF8String], v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (DMDLostDeviceLocationManager)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000523A0;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBB38 != -1) {
    dispatch_once(&qword_1000FBB38, block);
  }
  v2 = (void *)qword_1000FBB30;

  return (DMDLostDeviceLocationManager *)v2;
}

- (void)getCurrentLocationForOriginator:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(DMDLostDeviceLocationManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000524B0;
  block[3] = &unk_1000CB318;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)clearLastLocationRequestedDate
{
  v2 = +[DMDPaths systemLostModeRequestPath];
  v3 = +[NSURL fileURLWithPath:v2 isDirectory:0];

  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v4 = objc_opt_new();
  objc_super v8 = &v10;
  id v9 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000529A0;
  v6[3] = &unk_1000CB340;
  id v7 = 0;
  [v4 coordinateWritingItemAtURL:v3 options:1 error:&v9 byAccessor:v6];
  id v5 = v9;

  if (!*((unsigned char *)v11 + 24) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000857A8();
  }

  _Block_object_dispose(&v10, 8);
}

- (NSString)lastLocationRequestedDateMessage
{
  v2 = +[DMDPaths systemLostModeRequestPath];
  v3 = +[NSURL fileURLWithPath:v2 isDirectory:0];

  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100052F40;
  v36 = sub_100052F50;
  id v37 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100052F40;
  v26 = sub_100052F50;
  id v27 = 0;
  v4 = objc_opt_new();
  v20[6] = &v32;
  id v21 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100052F58;
  v20[3] = &unk_1000CB368;
  v20[4] = &v28;
  v20[5] = &v22;
  [v4 coordinateReadingItemAtURL:v3 options:0 error:&v21 byAccessor:v20];
  id v5 = v21;

  if (!*((unsigned char *)v29 + 24) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not read device last located time interval: %@", buf, 0xCu);
  }
  id v6 = (void *)v33[5];
  if (v6)
  {
    [v6 doubleValue];
    id v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v39 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device last located on %{public}@. Creating localized message.", buf, 0xCu);
    }
    objc_super v8 = objc_opt_new();
    id v9 = +[NSLocale currentLocale];
    [v8 setLocale:v9];

    [v8 setTimeStyle:1];
    uint64_t v10 = [v8 stringFromDate:v7];
    [v8 setTimeStyle:0];
    [v8 setDateStyle:3];
    v11 = [v8 stringFromDate:v7];
    uint64_t v12 = [(id)v23[5] objectForKeyedSubscript:@"originator"];
    if (!v12)
    {
      char v13 = [(id)v23[5] objectForKeyedSubscript:@"organizationName"];
      v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v15 = [(id)v23[5] objectForKeyedSubscript:@"serverName"];
      }
      uint64_t v12 = v15;
    }
    v17 = +[NSBundle bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"The location of this device was sent to %@ at %@ on %@." value:&stru_1000CC390 table:@"DMFNotifications"];
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v12, v10, v11);
  }
  else
  {
    v16 = 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return (NSString *)v16;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  id v6 = [(DMDLostDeviceLocationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [v5 lastObject];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Location Manager returned a location.", v20, 2u);
  }
  objc_super v8 = [(DMDLostDeviceLocationManager *)self originator];
  unsigned int v9 = [(DMDLostDeviceLocationManager *)self _updateLostModeFileForOriginator:v8];

  uint64_t v10 = [(DMDLostDeviceLocationManager *)self completionBlock];
  [(DMDLostDeviceLocationManager *)self _cleanupAfterResponseFromLocationManagerOrTimeout];
  if (!v9)
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      sub_100085888(v11, v12, v13, v14, v15, v16, v17, v18);
      if (!v10) {
        goto LABEL_9;
      }
    }
    else if (!v10)
    {
      goto LABEL_9;
    }
    v19 = DMFErrorWithCodeAndUserInfo();
    ((void (**)(void, void, void *))v10)[2](v10, 0, v19);

    goto LABEL_9;
  }
  if (v10) {
    ((void (**)(void, void *, void))v10)[2](v10, v7, 0);
  }
LABEL_9:
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(DMDLostDeviceLocationManager *)self queue];
  dispatch_assert_queue_V2(v6);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000858C4();
  }
  id v7 = [(DMDLostDeviceLocationManager *)self completionBlock];
  [(DMDLostDeviceLocationManager *)self _cleanupAfterResponseFromLocationManagerOrTimeout];
  if (v7) {
    ((void (**)(void, void, id))v7)[2](v7, 0, v5);
  }
}

- (void)_cleanupAfterResponseFromLocationManagerOrTimeout
{
  v3 = [(DMDLostDeviceLocationManager *)self locationManager];
  [v3 stopUpdatingLocation];

  [(DMDLostDeviceLocationManager *)self setLocationManager:0];
  [(DMDLostDeviceLocationManager *)self setCompletionBlock:0];
  v4 = [(DMDLostDeviceLocationManager *)self timeoutTimerDispatchSource];
  if (v4)
  {
    id v5 = v4;
    dispatch_source_cancel(v4);
    [(DMDLostDeviceLocationManager *)self setTimeoutTimerDispatchSource:0];
    v4 = v5;
  }
}

- (BOOL)_updateLostModeFileForOriginator:(id)a3
{
  id v3 = a3;
  v4 = +[DMDPaths systemLostModeRequestPath];
  id v5 = +[NSURL fileURLWithPath:v4 isDirectory:0];

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v6 = objc_opt_new();
  id v15 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000534A0;
  v11[3] = &unk_1000CB390;
  uint64_t v13 = &v20;
  id v7 = v3;
  id v12 = v7;
  uint64_t v14 = &v16;
  [v6 coordinateWritingItemAtURL:v5 options:0 error:&v15 byAccessor:v11];
  id v8 = v15;

  if (!*((unsigned char *)v21 + 24) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not read device last located time interval for update: %@", buf, 0xCu);
  }
  BOOL v9 = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v9;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
}

- (OS_dispatch_source)timeoutTimerDispatchSource
{
  return self->_timeoutTimerDispatchSource;
}

- (void)setTimeoutTimerDispatchSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimerDispatchSource, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end