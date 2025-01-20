@interface APAttributionAppTracking
+ (BOOL)appTrackingStatus:(id *)a3;
+ (BOOL)isAppTrackingAuthorizedByUser:(id *)a3;
@end

@implementation APAttributionAppTracking

+ (BOOL)appTrackingStatus:(id *)a3
{
  id v4 = objc_alloc_init((Class)ADTrackingTransparency);
  unsigned int v5 = [v4 crossAppTrackingAllowedSwitchEnabled];
  long long v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v12 = *(_OWORD *)a3->var0;
  *(_OWORD *)&v12[16] = v6;
  unsigned int v7 = +[APAttributionAppTracking isAppTrackingAuthorizedByUser:v12];
  v8 = APLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v9 = @"NO";
    if (v5) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    if (v7) {
      CFStringRef v9 = @"YES";
    }
    *(_DWORD *)v12 = 138543618;
    *(void *)&v12[4] = v10;
    *(_WORD *)&v12[12] = 2114;
    *(void *)&v12[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "isATTSwitchedEnabled (%{public}@), isAppAuthorizedByUser (%{public}@)", v12, 0x16u);
  }

  return v5 & v7;
}

+ (BOOL)isAppTrackingAuthorizedByUser:(id *)a3
{
  return TCCAccessPreflightWithAuditToken() == 0;
}

@end