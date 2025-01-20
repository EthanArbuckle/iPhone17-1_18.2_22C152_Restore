@interface _APRSBiomeAppStateEvent
+ (id)eventWithAppBundleID:(id)a3 appState:(int)a4;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (NSString)bundleID;
- (id)serialize;
- (int)appState;
- (unsigned)dataVersion;
- (void)setAppState:(int)a3;
- (void)setBundleID:(id)a3;
@end

@implementation _APRSBiomeAppStateEvent

+ (id)eventWithAppBundleID:(id)a3 appState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = objc_alloc_init(_APRSBiomeAppStateEvent);
  v7 = v6;
  if (v6)
  {
    [(_APRSBiomeAppStateEvent *)v6 setBundleID:v5];
    [(_APRSBiomeAppStateEvent *)v7 setAppState:v4];
  }

  return v7;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  [a3 getBytes:v8 length:64];
  uint64_t v4 = objc_opt_class();
  id v5 = +[NSString stringWithUTF8String:v8];
  v6 = [v4 eventWithAppBundleID:v5 appState:HIDWORD(v9)];

  return v6;
}

- (id)serialize
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSString *)v2->_bundleID copy];
  if ((unint64_t)[v3 length] >= 0x3D)
  {
    uint64_t v4 = os_log_create("com.apple.aprs", "appResume.AppStateWriter");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000F6A44((uint64_t *)&v2->_bundleID, (uint64_t)v3, v4);
    }
    uint64_t v5 = [v3 substringToIndex:60];

    id v3 = (id)v5;
  }
  if (([v3 getCString:&v9 maxLength:60 encoding:4] & 1) == 0)
  {
    v6 = os_log_create("com.apple.aprs", "appResume.AppStateWriter");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000F69C8((uint64_t *)&v2->_bundleID, v6);
    }
  }
  HIDWORD(v10) = v2->_appState;

  objc_sync_exit(v2);
  v7 = +[NSData dataWithBytes:&v9 length:64];

  return v7;
}

- (unsigned)dataVersion
{
  return self->dataVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (int)appState
{
  return self->_appState;
}

- (void)setAppState:(int)a3
{
  self->_appState = a3;
}

- (void).cxx_destruct
{
}

@end