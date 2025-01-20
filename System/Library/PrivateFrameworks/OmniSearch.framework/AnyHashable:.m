@interface AnyHashable:
- (uint64_t)Any;
@end

@implementation AnyHashable:

- (uint64_t)Any
{
  v4 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v4(v5, a3);
  swift_release();
  return swift_bridgeObjectRelease();
}

@end