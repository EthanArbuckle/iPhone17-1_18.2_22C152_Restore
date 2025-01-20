@interface RDAccountPropertiesNotifier
+ (NSString)notificationUserInfoAccountObjectIDKey;
+ (NSString)notificationUserInfoAccountTypeKey;
+ (NSString)notificationUserInfoPropertyNameKey;
+ (NSString)notificationUserInfoPropertyValueKey;
- (RDAccountPropertiesNotifier)init;
- (void)observeWithObserver:(id)a3;
- (void)unobserveWithObserver:(id)a3;
@end

@implementation RDAccountPropertiesNotifier

+ (NSString)notificationUserInfoAccountObjectIDKey
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)notificationUserInfoAccountTypeKey
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)notificationUserInfoPropertyNameKey
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)notificationUserInfoPropertyValueKey
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (void)observeWithObserver:(id)a3
{
}

- (void)unobserveWithObserver:(id)a3
{
}

- (RDAccountPropertiesNotifier)init
{
  return (RDAccountPropertiesNotifier *)sub_100505C28();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end