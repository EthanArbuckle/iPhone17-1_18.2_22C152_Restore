@interface FMReachabilityOperation
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
@end

@implementation FMReachabilityOperation

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  uint64_t v7 = (uint64_t)a4;
  if (a4)
  {
    sub_100006060(0, &qword_1006AFC18);
    uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v10 = a3;
  id v11 = a6;
  v12 = self;
  sub_10048D80C(v7, (uint64_t)a6);

  swift_bridgeObjectRelease();
}

@end