@interface PreferencesMgr
+ (id)sharedInstance;
- (BOOL)bccOnFenceTrigger;
- (BOOL)dontUseSLC;
- (BOOL)userTestApplication;
- (NSDate)networkStatusLaunchEventExpirationDate;
- (NSDate)wristStatusLaunchEventExpirationDate;
- (NSString)networkStatusLaunchEventTargetDeviceState;
- (NSString)wristStatusLaunchEventTargetDeviceState;
- (id)deviceInfoOverrides;
- (id)errorForUnregister;
- (id)hostportOverride;
- (id)httpRequestHeaders;
- (id)locationDeviceInfoOverrides;
- (id)overriddenBuildVersion;
- (id)overriddenOSVersion;
- (id)protocolSchemeOverride;
- (int64_t)cellularPlanStatusCachedValue;
- (int64_t)networkRegisterRetryCount;
- (int64_t)wristRegisterRetryCount;
- (void)setCellularPlanStatusCachedValue:(int64_t)a3;
- (void)setNetworkRegisterRetryCount:(int64_t)a3;
- (void)setNetworkStatusLaunchEventExpirationDate:(id)a3;
- (void)setNetworkStatusLaunchEventTargetDeviceState:(id)a3;
- (void)setWristRegisterRetryCount:(int64_t)a3;
- (void)setWristStatusLaunchEventExpirationDate:(id)a3;
- (void)setWristStatusLaunchEventTargetDeviceState:(id)a3;
@end

@implementation PreferencesMgr

+ (id)sharedInstance
{
  if (qword_10006D468 != -1) {
    dispatch_once(&qword_10006D468, &stru_100059CA0);
  }
  v2 = (void *)qword_10006D460;

  return v2;
}

- (id)httpRequestHeaders
{
  return +[FMPreferencesUtil dictionaryForKey:off_10006CD10[0] inDomain:@"com.apple.icloud.fmflocatord"];
}

- (id)hostportOverride
{
  return +[FMPreferencesUtil stringForKey:off_10006CD18[0] inDomain:@"com.apple.icloud.fmflocatord"];
}

- (id)protocolSchemeOverride
{
  return +[FMPreferencesUtil stringForKey:off_10006CD20[0] inDomain:@"com.apple.icloud.fmflocatord"];
}

- (id)deviceInfoOverrides
{
  return +[FMPreferencesUtil dictionaryForKey:off_10006CD28[0] inDomain:@"com.apple.icloud.fmflocatord"];
}

- (id)locationDeviceInfoOverrides
{
  return +[FMPreferencesUtil dictionaryForKey:off_10006CD30[0] inDomain:@"com.apple.icloud.fmflocatord"];
}

- (id)overriddenOSVersion
{
  return +[FMPreferencesUtil stringForKey:off_10006CD38[0] inDomain:@"com.apple.icloud.fmflocatord"];
}

- (id)overriddenBuildVersion
{
  return +[FMPreferencesUtil stringForKey:off_10006CD40[0] inDomain:@"com.apple.icloud.fmflocatord"];
}

- (BOOL)bccOnFenceTrigger
{
  return +[FMPreferencesUtil BOOLForKey:off_10006CD50[0] inDomain:@"com.apple.icloud.fmflocatord"];
}

- (BOOL)dontUseSLC
{
  return +[FMPreferencesUtil BOOLForKey:off_10006CD48[0] inDomain:@"com.apple.icloud.fmflocatord"];
}

- (BOOL)userTestApplication
{
  return +[FMPreferencesUtil BOOLForKey:off_10006CD60 inDomain:@"com.apple.icloud.fmflocatord"];
}

- (id)errorForUnregister
{
  return +[FMPreferencesUtil stringForKey:off_10006CD58[0] inDomain:@"com.apple.icloud.fmflocatord"];
}

- (void)setWristStatusLaunchEventExpirationDate:(id)a3
{
}

- (NSDate)wristStatusLaunchEventExpirationDate
{
  return (NSDate *)+[FMPreferencesUtil dateForKey:@"WristStatusLaunchEventExpirationDateKey" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
}

- (void)setNetworkStatusLaunchEventExpirationDate:(id)a3
{
}

- (NSDate)networkStatusLaunchEventExpirationDate
{
  return (NSDate *)+[FMPreferencesUtil dateForKey:@"NetworkStatusLaunchEventExpirationDateKey" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
}

- (void)setWristStatusLaunchEventTargetDeviceState:(id)a3
{
}

- (NSString)wristStatusLaunchEventTargetDeviceState
{
  return (NSString *)+[FMPreferencesUtil stringForKey:@"WristStatusLaunchEventTargetDeviceStateKey" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
}

- (void)setCellularPlanStatusCachedValue:(int64_t)a3
{
}

- (int64_t)cellularPlanStatusCachedValue
{
  id v2 = +[FMPreferencesUtil integerForKey:@"CellularPlanStatusKey" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  int64_t result = (int64_t)+[FMPreferencesUtil integerForKey:@"CellularPlanStatusOverrideKey" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  if (result <= 0) {
    return (int64_t)v2;
  }
  return result;
}

- (void)setNetworkStatusLaunchEventTargetDeviceState:(id)a3
{
}

- (NSString)networkStatusLaunchEventTargetDeviceState
{
  return (NSString *)+[FMPreferencesUtil stringForKey:@"NetworkStatusLaunchEventTargetDeviceStateKey" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
}

- (void)setWristRegisterRetryCount:(int64_t)a3
{
}

- (int64_t)wristRegisterRetryCount
{
  return (int64_t)+[FMPreferencesUtil integerForKey:@"WristRegisterRetryCount" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
}

- (void)setNetworkRegisterRetryCount:(int64_t)a3
{
}

- (int64_t)networkRegisterRetryCount
{
  return (int64_t)+[FMPreferencesUtil integerForKey:@"NetworkRegisterRetryCount" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
}

@end