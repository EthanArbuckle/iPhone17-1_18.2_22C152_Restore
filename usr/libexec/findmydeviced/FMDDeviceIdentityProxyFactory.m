@interface FMDDeviceIdentityProxyFactory
+ (BOOL)isAutomationActive;
+ (id)deviceIdentityProxy;
@end

@implementation FMDDeviceIdentityProxyFactory

+ (BOOL)isAutomationActive
{
  if (qword_10031EB70 != -1) {
    dispatch_once(&qword_10031EB70, &stru_1002DC5C0);
  }
  v2 = sub_100004238();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100241B08(v2);
  }

  return byte_10031EB68;
}

+ (id)deviceIdentityProxy
{
  if (+[FMDDeviceIdentityProxyFactory isAutomationActive])
  {
    v2 = +[FMDAutomationHelperFactory sharedFactory];
    [v2 automationHelperClassWithName:@"FMDAutomationDeviceIdentity"];

    v3 = sub_100004238();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100241B8C(v3);
    }

    v4 = objc_opt_new();
  }
  else
  {
    v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100241BD0(v5);
    }

    v4 = +[FMDRealDeviceIdentity sharedInstance];
  }

  return v4;
}

@end