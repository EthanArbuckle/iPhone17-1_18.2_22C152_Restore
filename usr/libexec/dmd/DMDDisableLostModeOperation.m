@interface DMDDisableLostModeOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDDisableLostModeOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2C00;
}

- (void)runWithRequest:(id)a3
{
  v4 = +[FMDFMIPManager sharedInstance];
  unsigned __int8 v5 = [v4 isManagedLostModeActive];

  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disabling lost mode...", buf, 2u);
    }
    v7 = +[DMDLostDeviceLocationManager sharedManager];
    v8 = [v7 lastLocationRequestedDateMessage];
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device was located while in lost mode. Alerting user with message “%{public}@”", buf, 0xCu);
      }
    }
    v9 = +[FMDFMIPManager sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003D5EC;
    v11[3] = &unk_1000C9B78;
    v11[4] = self;
    id v12 = v7;
    id v10 = v7;
    [v9 disableManagedLostModeWithLocatedMessage:v8 completion:v11];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is not in lost mode. Reporting success regardless.", buf, 2u);
    }
    [(DMDDisableLostModeOperation *)self endOperationWithResultObject:0];
  }
}

@end