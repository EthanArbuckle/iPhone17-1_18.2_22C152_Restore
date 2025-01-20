@interface NDOIntervalCallActivity
+ (BOOL)isDeviceCountryEligibleForIntervalEvent;
+ (void)performScheduleIntervalActivityIfPossibleWithCompletion:(id)a3;
- (BOOL)outreachInProgress;
- (BOOL)requiresNetwork;
- (NSString)identifier;
- (NSString)serialNumber;
- (NSString)uuid;
- (NSTimer)outReachTimer;
- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4;
- (void)setOutReachTimer:(id)a3;
- (void)setOutreachInProgress:(BOOL)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation NDOIntervalCallActivity

- (NSString)uuid
{
  return 0;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.ndoagent.intervalevent";
}

- (BOOL)requiresNetwork
{
  return 1;
}

- (void)performActivityForScheduler:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NDOIntervalCallActivity *)self setOutreachInProgress:1];
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100004140;
  v17[3] = &unk_10001C658;
  objc_copyWeak(&v20, &location);
  id v8 = v6;
  id v18 = v8;
  id v9 = v7;
  id v19 = v9;
  v10 = +[NSTimer timerWithTimeInterval:1 repeats:v17 block:2000000000.0];
  [(NDOIntervalCallActivity *)self setOutReachTimer:v10];

  v11 = +[NSRunLoop mainRunLoop];
  v12 = [(NDOIntervalCallActivity *)self outReachTimer];
  [v11 addTimer:v12 forMode:NSDefaultRunLoopMode];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100004250;
  v14[3] = &unk_10001C6F8;
  v14[4] = self;
  objc_copyWeak(&v16, &location);
  id v13 = v9;
  id v15 = v13;
  +[NDOIntervalCallActivity performScheduleIntervalActivityIfPossibleWithCompletion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

+ (void)performScheduleIntervalActivityIfPossibleWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004CDC;
  v4[3] = &unk_10001C720;
  id v5 = a3;
  id v3 = v5;
  +[NDOServerVersionUtilities serverVersionSupported:v4];
}

+ (BOOL)isDeviceCountryEligibleForIntervalEvent
{
  v2 = +[NDOServerVersionUtilities getValidServerVersionCache];
  id v3 = v2;
  if (!v2)
  {
    id v5 = 0;
LABEL_13:
    BOOL v11 = 1;
    goto LABEL_16;
  }
  v4 = [v2 objectForKey:@"scIntervalDisabledCountries"];
  id v5 = v4;
  if (!v4 || ![v4 count]) {
    goto LABEL_13;
  }
  id v6 = _NDOLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10001171C(v6);
  }

  id v7 = +[NSLocale currentLocale];
  id v8 = [v7 objectForKey:NSLocaleCountryCode];
  id v9 = v8;
  if (v8
    && ([v8 isEqualToString:&stru_10001D198] & 1) == 0
    && [v5 containsObject:v9])
  {
    v10 = _NDOLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136446466;
      v14 = "+[NDOIntervalCallActivity isDeviceCountryEligibleForIntervalEvent]";
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: Country: %@ is disabled for interval calls.", (uint8_t *)&v13, 0x16u);
    }

    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = 1;
  }

LABEL_16:
  return v11;
}

- (NSTimer)outReachTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOutReachTimer:(id)a3
{
}

- (BOOL)outreachInProgress
{
  return self->_outreachInProgress;
}

- (void)setOutreachInProgress:(BOOL)a3
{
  self->_outreachInProgress = a3;
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_outReachTimer, 0);
}

@end