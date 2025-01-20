@interface MRDIntelligentRoutingLockScreenRoutingProvider
- (MRDIntelligentRoutingLockScreenRoutingProvider)init;
- (MRDIntelligentRoutingLockScreenRoutingProvider)initWithDelegate:(id)a3 queue:(id)a4 routeRecommender:(id)a5 routeRecommendationStore:(id)a6;
- (MRDLockScreenRoutingProviderDelegate)delegate;
- (NSArray)nearbyDeviceIdentifiers;
- (void)setDelegate:(id)a3;
- (void)startObservationIfNeeded;
- (void)update;
@end

@implementation MRDIntelligentRoutingLockScreenRoutingProvider

- (NSArray)nearbyDeviceIdentifiers
{
  v2 = self;
  sub_10000A6B0();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void)update
{
  v2 = self;
  sub_10000A0A0();
}

- (MRDLockScreenRoutingProviderDelegate)delegate
{
  return (MRDLockScreenRoutingProviderDelegate *)sub_100263F70();
}

- (void)setDelegate:(id)a3
{
}

- (MRDIntelligentRoutingLockScreenRoutingProvider)initWithDelegate:(id)a3 queue:(id)a4 routeRecommender:(id)a5 routeRecommendationStore:(id)a6
{
  swift_unknownObjectRetain();
  id v10 = a4;
  swift_unknownObjectRetain();
  return (MRDIntelligentRoutingLockScreenRoutingProvider *)sub_100263B14((uint64_t)a3, v10, (uint64_t)a5, a6);
}

- (void)startObservationIfNeeded
{
  v2 = self;
  sub_100263D00();
}

- (MRDIntelligentRoutingLockScreenRoutingProvider)init
{
  result = (MRDIntelligentRoutingLockScreenRoutingProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1001B9788((uint64_t)self + OBJC_IVAR___MRDIntelligentRoutingLockScreenRoutingProvider_delegate);

  swift_unknownObjectRelease();
  NSArray v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MRDIntelligentRoutingLockScreenRoutingProvider_routeRecommendationStore);
}

@end