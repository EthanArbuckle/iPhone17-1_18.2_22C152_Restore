@interface APPCControllerDaemonSettings
+ (id)storageWithDefaultValues:(id)a3;
- (BOOL)httpUseFixedHttpSessionManagerDefaultValue;
- (BOOL)httpUseFixedHttpSessionManagerValue;
- (BOOL)useAMSMescalValue;
- (double)httpLookBackWindowDefaultValue;
- (double)httpLookBackWindowValue;
- (int64_t)cacheSizeLimitDefaultValue;
- (int64_t)cacheSizeLimitValue;
- (int64_t)httpMaximumConnectionsPerHostDefaultValue;
- (int64_t)httpMaximumConnectionsPerHostTempSessionDefaultValue;
- (int64_t)httpMaximumConnectionsPerHostTempSessionValue;
- (int64_t)httpMaximumConnectionsPerHostValue;
- (void)setCacheSizeLimitValue:(int64_t)a3;
- (void)setHttpLookBackWindowValue:(double)a3;
- (void)setHttpMaximumConnectionsPerHostTempSessionValue:(int64_t)a3;
- (void)setHttpMaximumConnectionsPerHostValue:(int64_t)a3;
- (void)setHttpUseFixedHttpSessionManagerValue:(BOOL)a3;
- (void)setUseAMSMescalValue:(BOOL)a3;
@end

@implementation APPCControllerDaemonSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3 = [objc_alloc((Class)APSettingsStorageKeychain) initWithDefaultValues:&off_10024B520];

  return v3;
}

- (BOOL)useAMSMescalValue
{
  v2 = [(APPCControllerDaemonSettings *)self useAMSMescal];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setUseAMSMescalValue:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(APPCControllerDaemonSettings *)self setUseAMSMescal:v4];
}

- (BOOL)httpUseFixedHttpSessionManagerValue
{
  v2 = [(APPCControllerDaemonSettings *)self httpUseFixedHttpSessionManager];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setHttpUseFixedHttpSessionManagerValue:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(APPCControllerDaemonSettings *)self setHttpUseFixedHttpSessionManager:v4];
}

- (int64_t)httpMaximumConnectionsPerHostValue
{
  v2 = [(APPCControllerDaemonSettings *)self httpMaximumConnectionsPerHost];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setHttpMaximumConnectionsPerHostValue:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(APPCControllerDaemonSettings *)self setHttpMaximumConnectionsPerHost:v4];
}

- (int64_t)httpMaximumConnectionsPerHostTempSessionValue
{
  v2 = [(APPCControllerDaemonSettings *)self httpMaximumConnectionsPerHostTempSession];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setHttpMaximumConnectionsPerHostTempSessionValue:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(APPCControllerDaemonSettings *)self setHttpMaximumConnectionsPerHostTempSession:v4];
}

- (double)httpLookBackWindowValue
{
  v2 = [(APPCControllerDaemonSettings *)self httpLookBackWindow];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setHttpLookBackWindowValue:(double)a3
{
  id v4 = +[NSNumber numberWithDouble:a3];
  [(APPCControllerDaemonSettings *)self setHttpLookBackWindow:v4];
}

- (int64_t)cacheSizeLimitValue
{
  v2 = [(APPCControllerDaemonSettings *)self cacheSizeLimit];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setCacheSizeLimitValue:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(APPCControllerDaemonSettings *)self setCacheSizeLimit:v4];
}

- (BOOL)httpUseFixedHttpSessionManagerDefaultValue
{
  return 0;
}

- (int64_t)httpMaximumConnectionsPerHostDefaultValue
{
  return 4;
}

- (int64_t)httpMaximumConnectionsPerHostTempSessionDefaultValue
{
  return 1;
}

- (double)httpLookBackWindowDefaultValue
{
  return 5.0;
}

- (int64_t)cacheSizeLimitDefaultValue
{
  return 256000;
}

@end