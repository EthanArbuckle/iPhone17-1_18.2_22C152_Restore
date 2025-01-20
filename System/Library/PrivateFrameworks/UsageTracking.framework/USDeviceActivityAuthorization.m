@interface USDeviceActivityAuthorization
+ (BOOL)isAuthorized;
+ (BOOL)isAuthorized:(id)a3;
+ (BOOL)isOverridden;
+ (BOOL)sharingEnabled;
+ (NSArray)authorizedClientIdentifiers;
+ (void)setIsOverridden:(BOOL)a3;
- (_TtC18UsageTrackingAgent29USDeviceActivityAuthorization)init;
@end

@implementation USDeviceActivityAuthorization

+ (BOOL)isAuthorized:(id)a3
{
  return static DeviceActivityAuthorization.isAuthorized.getter() & 1;
}

+ (BOOL)isAuthorized
{
  return static DeviceActivityAuthorization.isAuthorized.getter() & 1;
}

+ (NSArray)authorizedClientIdentifiers
{
  type metadata accessor for DeviceActivityAuthorization();
  static DeviceActivityAuthorization.authorizedClientIdentifiers.getter();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

+ (BOOL)sharingEnabled
{
  return static DeviceActivityAuthorization.sharingEnabled.getter() & 1;
}

+ (BOOL)isOverridden
{
  return static DeviceActivityAuthorization.isOverridden.getter() & 1;
}

+ (void)setIsOverridden:(BOOL)a3
{
}

- (_TtC18UsageTrackingAgent29USDeviceActivityAuthorization)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for USDeviceActivityAuthorization();
  return [(USDeviceActivityAuthorization *)&v3 init];
}

@end