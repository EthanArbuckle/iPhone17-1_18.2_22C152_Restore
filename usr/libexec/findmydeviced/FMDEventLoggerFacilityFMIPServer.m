@interface FMDEventLoggerFacilityFMIPServer
+ (id)facilityName;
- (BOOL)shouldLog;
- (FMDURLSession)defaultSession;
- (id)loggedEvents;
- (id)splunkifyDictionary:(id)a3;
- (id)splunkifyObject:(id)a3 eventName:(id)a4;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)logEvent:(id)a3;
- (void)setDefaultSession:(id)a3;
@end

@implementation FMDEventLoggerFacilityFMIPServer

+ (id)facilityName
{
  return @"FMDEventLoggerFacilityFMIPServer";
}

- (id)loggedEvents
{
  return &__NSArray0__struct;
}

- (void)logEvent:(id)a3
{
  id v4 = a3;
  v5 = +[FMSystemInfo sharedInstance];
  v6 = +[NSMutableDictionary dictionary];
  v7 = [v5 osVersion];
  [(__CFString *)v6 fm_safelyMapKey:@"osVersion" toObject:v7];

  v8 = [v5 serialNumber];
  [(__CFString *)v6 fm_safelyMapKey:@"serialNumber" toObject:v8];

  v9 = [v5 deviceUDID];
  [(__CFString *)v6 fm_safelyMapKey:@"UDID" toObject:v9];

  v10 = [v5 osBuildVersion];
  [(__CFString *)v6 fm_safelyMapKey:@"buildVersion" toObject:v10];

  v11 = [v5 productType];
  [(__CFString *)v6 fm_safelyMapKey:@"productVersion" toObject:v11];

  v12 = +[NSDate date];
  v13 = [NSNumber numberWithLongLong:[v12 fm_epoch]];
  [(__CFString *)v6 fm_safelyMapKey:@"timestamp" toObject:v13];

  v14 = [v4 eventName];
  [(__CFString *)v6 fm_safelyMapKey:@"eventName" toObject:v14];

  v15 = [v4 userInfo];
  v16 = [v4 eventName];

  v17 = [(FMDEventLoggerFacilityFMIPServer *)self splunkifyObject:v15 eventName:v16];
  [(__CFString *)v6 fm_safelyMapKey:@"info" toObject:v17];

  v18 = sub_100004238();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Logging event %@", buf, 0xCu);
  }

  if ([(FMDEventLoggerFacilityFMIPServer *)self shouldLog])
  {
    uint64_t v25 = 0;
    v19 = +[NSJSONSerialization dataWithJSONObject:v6 options:0 error:&v25];
    if (!v25)
    {
      v20 = +[NSURL URLWithString:@"https://fmip.icloud.com/fmipservice/stats/infoRequest"];
      v21 = +[NSMutableURLRequest requestWithURL:v20];

      [v21 setHTTPBody:v19];
      v22 = sub_100004238();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v27 = @"https://fmip.icloud.com/fmipservice/stats/infoRequest";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending logs %@", buf, 0xCu);
      }

      [v21 setAllHTTPHeaderFields:&off_1002F32B8];
      [v21 setHTTPMethod:@"POST"];
      v23 = [(FMDEventLoggerFacilityFMIPServer *)self defaultSession];
      v24 = [v23 dataTaskWithRequest:v21];

      [v24 resume];
    }
  }
}

- (FMDURLSession)defaultSession
{
  defaultSession = self->_defaultSession;
  if (!defaultSession)
  {
    id v4 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    [v4 setURLCache:0];
    [v4 setRequestCachePolicy:1];
    [v4 setHTTPCookieStorage:0];
    v5 = +[FMDURLSessionFactory sessionWithConfiguration:v4 delegate:self delegateQueue:0];
    v6 = self->_defaultSession;
    self->_defaultSession = v5;

    defaultSession = self->_defaultSession;
  }

  return defaultSession;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v5 = a4;
  v6 = sub_100004238();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100242E30((uint64_t)v5, v6);
  }

  defaultSession = self->_defaultSession;
  self->_defaultSession = 0;
}

- (BOOL)shouldLog
{
  return 1;
}

- (id)splunkifyDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_1000B0544;
  v12 = sub_1000B0554;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B055C;
  v7[3] = &unk_1002DCC88;
  v7[4] = self;
  v7[5] = &v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)splunkifyObject:(id)a3 eventName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v6 stringValue];
LABEL_7:
    id v9 = v8;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(FMDEventLoggerFacilityFMIPServer *)self splunkifyDictionary:v6];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = sub_1000B0544;
    v18 = sub_1000B0554;
    v19 = &stru_1002E7428;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000B087C;
    v13[3] = &unk_1002DCCB0;
    v13[4] = self;
    v13[5] = &v14;
    [v6 enumerateObjectsUsingBlock:v13];
    id v9 = (id)v15[5];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v9 = 0;
  }
LABEL_8:
  uint64_t v10 = v7;
  if (([v7 isEqualToString:&stru_1002E7428] & 1) == 0)
  {
    uint64_t v10 = [v7 stringByAppendingString:@","];
  }
  if (v9)
  {
    uint64_t v11 = [v10 stringByAppendingString:v9];

    uint64_t v10 = (void *)v11;
  }

  return v10;
}

- (void)setDefaultSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end