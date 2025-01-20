@interface PHOrientationMonitorKeys
+ (NSString)notificationDeviceKey;
+ (NSString)notificationEvent;
+ (NSString)notificationInterfaceKey;
+ (NSString)notificationValidKey;
- (PHOrientationMonitorKeys)init;
@end

@implementation PHOrientationMonitorKeys

+ (NSString)notificationEvent
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)notificationValidKey
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)notificationDeviceKey
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)notificationInterfaceKey
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (PHOrientationMonitorKeys)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OrientationMonitorKeys();
  return [(PHOrientationMonitorKeys *)&v3 init];
}

@end