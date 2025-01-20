@interface _APRSBiomeAppLaunchTimeEvent
+ (id)eventWithAppBundleID:(id)a3 activationTime:(unsigned int)a4 launchReason:(unsigned int)a5;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (NSString)bundleID;
- (id)serialize;
- (unsigned)activationTime;
- (unsigned)dataVersion;
- (unsigned)launchReason;
- (void)setActivationTime:(unsigned int)a3;
- (void)setBundleID:(id)a3;
- (void)setLaunchReason:(unsigned int)a3;
@end

@implementation _APRSBiomeAppLaunchTimeEvent

+ (id)eventWithAppBundleID:(id)a3 activationTime:(unsigned int)a4 launchReason:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)objc_opt_class());
  v9 = v8;
  if (v8)
  {
    [v8 setBundleID:v7];
    [v9 setActivationTime:v6];
    [v9 setLaunchReason:v5];
  }

  return v9;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  unsigned int v12 = 0;
  long long v11 = 0u;
  memset(v10, 0, sizeof(v10));
  if (a4 == 2)
  {
    [a3 getBytes:v10 length:68];
    v4 = objc_opt_class();
    uint64_t v5 = +[NSString stringWithUTF8String:v10];
    uint64_t v6 = HIDWORD(v11);
    uint64_t v7 = v12;
  }
  else
  {
    [a3 getBytes:v10 length:68];
    v4 = objc_opt_class();
    uint64_t v5 = +[NSString stringWithUTF8String:v10];
    uint64_t v6 = HIDWORD(v11);
    uint64_t v7 = v12;
  }
  id v8 = [v4 eventWithAppBundleID:v5 activationTime:v6 launchReason:v7];

  return v8;
}

- (id)serialize
{
  LODWORD(v11) = 0;
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSString *)v2->_bundleID copy];
  if ((unint64_t)[v3 length] >= 0x3D)
  {
    v4 = os_log_create("com.apple.aprs", "appResume.AppLaunchWriter");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000F6A44((uint64_t *)&v2->_bundleID, (uint64_t)v3, v4);
    }
    uint64_t v5 = [v3 substringToIndex:60];

    id v3 = (id)v5;
  }
  if (([v3 getCString:&v9 maxLength:60 encoding:4] & 1) == 0)
  {
    uint64_t v6 = os_log_create("com.apple.aprs", "appResume.AppLaunchWriter");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000F69C8((uint64_t *)&v2->_bundleID, v6);
    }
  }
  HIDWORD(v10) = v2->_activationTime;
  LOBYTE(v11) = v2->_launchReason;

  objc_sync_exit(v2);
  uint64_t v7 = +[NSData dataWithBytes:&v9 length:68];

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (unsigned)activationTime
{
  return self->_activationTime;
}

- (void)setActivationTime:(unsigned int)a3
{
  self->_activationTime = a3;
}

- (unsigned)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(unsigned int)a3
{
  self->_launchReason = a3;
}

- (void).cxx_destruct
{
}

@end