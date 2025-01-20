@interface FRVersionHelpers
+ (id)applicationName;
+ (id)systemVersionString;
- (BOOL)isAppUpdateRequired;
- (BOOL)isDeviceAbandoned;
- (BOOL)isOSUpdateRequired;
- (BOOL)isUpdateRequired;
- (FCRemoteDefaults)remoteDefaults;
- (FRVersionHelpers)init;
- (FRVersionHelpers)initWithBackgroundTaskable:(id)a3 applicationProxy:(id)a4;
- (LSApplicationProxy)applicationProxy;
- (id)applicationVersionString;
- (id)minimumOSVersionStringForUpdate;
- (id)minimumVersionString;
- (id)updateInfos;
- (int64_t)applicationVersionNumber;
- (int64_t)minimumOSVersionNumberForUpdate;
- (int64_t)minimumVersionNumber;
- (int64_t)systemVersionNumber;
- (void)dealloc;
- (void)sceneDidEnterBackground:(id)a3;
- (void)setApplicationProxy:(id)a3;
- (void)updateAppObsolescenceState;
@end

@implementation FRVersionHelpers

- (FRVersionHelpers)initWithBackgroundTaskable:(id)a3 applicationProxy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007274C();
  }
  v13.receiver = self;
  v13.super_class = (Class)FRVersionHelpers;
  v8 = [(FRVersionHelpers *)&v13 init];
  if (v8)
  {
    v9 = (FCRemoteDefaults *)[objc_alloc((Class)FCRemoteDefaults) initWithBackgroundTaskable:v6];
    remoteDefaults = v8->_remoteDefaults;
    v8->_remoteDefaults = v9;

    objc_storeStrong((id *)&v8->_applicationProxy, a4);
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v8 selector:"sceneDidEnterBackground:" name:UISceneDidEnterBackgroundNotification object:0];
  }
  return v8;
}

- (BOOL)isDeviceAbandoned
{
  v3 = NewsCoreUserDefaults();
  unsigned __int8 v4 = [v3 BOOLForKey:FCSimulateHardwareObsolescenceSharedPreferenceKey];

  if (v4) {
    return 1;
  }
  id v6 = NFDevicePlatform();
  objc_opt_class();
  id v7 = [(FRVersionHelpers *)self updateInfos];
  v8 = [v7 objectForKey:@"UnsupportedDevices"];
  v9 = FCDynamicCast();

  LOBYTE(v7) = [v9 containsObject:v6];
  return (char)v7;
}

- (BOOL)isUpdateRequired
{
  v3 = [(FRVersionHelpers *)self remoteDefaults];
  unsigned int v4 = [v3 isAvailable];

  if (!v4) {
    goto LABEL_4;
  }
  BOOL v5 = [(FRVersionHelpers *)self isAppUpdateRequired];
  if (v5)
  {
    if ([(FRVersionHelpers *)self isOSUpdateRequired])
    {
LABEL_4:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = ![(FRVersionHelpers *)self isDeviceAbandoned];
  }
  return v5;
}

- (void)updateAppObsolescenceState
{
  v3 = [(FRVersionHelpers *)self remoteDefaults];
  unsigned int v4 = [v3 isAvailable];

  if (v4)
  {
    BOOL v5 = +[FCNetworkReachability sharedNetworkReachability];
    [v5 setAccessRestrictedBecauseOfAppVersion:[self isAppUpdateRequired]];

    id v6 = +[FCNetworkReachability sharedNetworkReachability];
    [v6 setAccessRestrictedBecauseOfOSVersion:[self isOSUpdateRequired]];

    id v7 = +[FCNetworkReachability sharedNetworkReachability];
    [v7 setAccessRestrictedBecauseOfDeviceAbandoned:[self isDeviceAbandoned]];
  }
}

- (BOOL)isAppUpdateRequired
{
  uint64_t v3 = [(FRVersionHelpers *)self applicationVersionNumber];
  return v3 < [(FRVersionHelpers *)self minimumVersionNumber];
}

- (int64_t)minimumVersionNumber
{
  v2 = [(FRVersionHelpers *)self minimumVersionString];
  int64_t v3 = FCIntegerRepresentationOfBundleShortVersionString();

  return v3;
}

- (int64_t)applicationVersionNumber
{
  int64_t v3 = NewsCoreUserDefaults();
  unsigned __int8 v4 = [v3 BOOLForKey:FCSimulateAppObsolescenceSharedPreferenceKey];

  if (v4) {
    return -1;
  }
  id v6 = [(FRVersionHelpers *)self applicationVersionString];
  int64_t v5 = FCIntegerRepresentationOfBundleShortVersionString();
  if (v5 <= 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100072810((uint64_t)v6);
  }

  return v5;
}

- (id)applicationVersionString
{
  v2 = [(FRVersionHelpers *)self applicationProxy];
  int64_t v3 = [v2 shortVersionString];

  return v3;
}

- (LSApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (id)minimumOSVersionStringForUpdate
{
  objc_opt_class();
  int64_t v3 = [(FRVersionHelpers *)self updateInfos];
  unsigned __int8 v4 = [v3 objectForKey:@"MinimumOSVersion"];
  int64_t v5 = FCDynamicCast();

  return v5;
}

- (id)minimumVersionString
{
  objc_opt_class();
  int64_t v3 = [(FRVersionHelpers *)self updateInfos];
  unsigned __int8 v4 = [v3 objectForKey:@"MinimumApplicationVersion"];
  int64_t v5 = FCDynamicCast();

  return v5;
}

- (id)updateInfos
{
  v2 = [(FRVersionHelpers *)self remoteDefaults];
  int64_t v3 = [v2 dictionaryForKey:@"iOSUpdateInfo"];

  return v3;
}

- (FCRemoteDefaults)remoteDefaults
{
  return self->_remoteDefaults;
}

- (BOOL)isOSUpdateRequired
{
  uint64_t v3 = [(FRVersionHelpers *)self systemVersionNumber];
  return v3 < [(FRVersionHelpers *)self minimumOSVersionNumberForUpdate];
}

- (int64_t)systemVersionNumber
{
  v2 = NewsCoreUserDefaults();
  unsigned __int8 v3 = [v2 BOOLForKey:FCSimulateOSObsolescenceSharedPreferenceKey];

  if (v3) {
    return -1;
  }
  int64_t v5 = [(id)objc_opt_class() systemVersionString];
  int64_t v4 = FCIntegerRepresentationOfBundleShortVersionString();
  if (v4 <= 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000728D0((uint64_t)v5);
  }

  return v4;
}

- (int64_t)minimumOSVersionNumberForUpdate
{
  v2 = [(FRVersionHelpers *)self minimumOSVersionStringForUpdate];
  int64_t v3 = FCIntegerRepresentationOfBundleShortVersionString();

  return v3;
}

+ (id)systemVersionString
{
  if (qword_1000EDF88 != -1) {
    dispatch_once(&qword_1000EDF88, &stru_1000C6348);
  }
  v2 = (void *)qword_1000EDF80;

  return v2;
}

- (FRVersionHelpers)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v6 = "-[FRVersionHelpers init]";
    __int16 v7 = 2080;
    v8 = "FRVersionHelpers.m";
    __int16 v9 = 1024;
    int v10 = 27;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  int64_t v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRVersionHelpers init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)dealloc
{
  int64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FRVersionHelpers;
  [(FRVersionHelpers *)&v4 dealloc];
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3 = [(FRVersionHelpers *)self remoteDefaults];
  [v3 checkForUpdate];
}

+ (id)applicationName
{
  if (qword_1000EDF98 != -1) {
    dispatch_once(&qword_1000EDF98, &stru_1000C6368);
  }
  id v2 = (void *)qword_1000EDF90;

  return v2;
}

- (void)setApplicationProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationProxy, 0);

  objc_storeStrong((id *)&self->_remoteDefaults, 0);
}

@end