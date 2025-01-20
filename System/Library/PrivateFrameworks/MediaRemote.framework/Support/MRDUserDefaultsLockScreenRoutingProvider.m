@interface MRDUserDefaultsLockScreenRoutingProvider
- (MRDLockScreenRoutingProviderDelegate)delegate;
- (MRDUserDefaultsLockScreenRoutingProvider)init;
- (MRDUserDefaultsLockScreenRoutingProvider)initWithDelegate:(id)a3 queue:(id)a4;
- (NSArray)nearbyDeviceIdentifiers;
- (void)setDelegate:(id)a3;
- (void)setNearbyDeviceIdentifiers:(id)a3;
- (void)update;
@end

@implementation MRDUserDefaultsLockScreenRoutingProvider

- (MRDLockScreenRoutingProviderDelegate)delegate
{
  return (MRDLockScreenRoutingProviderDelegate *)sub_100263F70();
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)nearbyDeviceIdentifiers
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setNearbyDeviceIdentifiers:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MRDUserDefaultsLockScreenRoutingProvider_nearbyDeviceIdentifiers);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (MRDUserDefaultsLockScreenRoutingProvider)initWithDelegate:(id)a3 queue:(id)a4
{
  return (MRDUserDefaultsLockScreenRoutingProvider *)sub_10026433C((uint64_t)a3, a4);
}

- (void)update
{
  NSArray v2 = self;
  sub_100264580();
}

- (MRDUserDefaultsLockScreenRoutingProvider)init
{
  result = (MRDUserDefaultsLockScreenRoutingProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1001B9788((uint64_t)self + OBJC_IVAR___MRDUserDefaultsLockScreenRoutingProvider_delegate);

  swift_bridgeObjectRelease();
}

@end