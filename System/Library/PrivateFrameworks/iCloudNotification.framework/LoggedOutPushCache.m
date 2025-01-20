@interface LoggedOutPushCache
+ (BOOL)wasDeviceRegistered;
+ (NSDate)expirationDate;
+ (void)registeredDeviceWithExpirationDate:(id)a3;
+ (void)unregisteredDevice;
- (_TtC3ind18LoggedOutPushCache)init;
@end

@implementation LoggedOutPushCache

- (_TtC3ind18LoggedOutPushCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LoggedOutPushCache();
  return [(LoggedOutPushCache *)&v3 init];
}

+ (BOOL)wasDeviceRegistered
{
  return _s3ind18LoggedOutPushCacheC19wasDeviceRegisteredSbvgZ_0();
}

+ (NSDate)expirationDate
{
  sub_10001E620(&qword_10004E2B0);
  __chkstk_darwin();
  objc_super v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static LoggedOutPushCache.expirationDate.getter((uint64_t)v3);
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
  }
  return (NSDate *)isa;
}

+ (void)registeredDeviceWithExpirationDate:(id)a3
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  if (qword_10004E4A8 != -1) {
    swift_once();
  }
  v7 = (void *)qword_10004E4B0;
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  NSString v9 = String._bridgeToObjectiveC()();
  [v7 setObject:isa forKey:v9];

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

+ (void)unregisteredDevice
{
  if (qword_10004E4A8 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_10004E4B0;
  id v3 = String._bridgeToObjectiveC()();
  [v2 setURL:0 forKey:v3];
}

@end