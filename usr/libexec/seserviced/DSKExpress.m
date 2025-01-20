@interface DSKExpress
- (void)onEvent:(id)a3 eventPayload:(id)a4;
@end

@implementation DSKExpress

- (void)onEvent:(id)a3 eventPayload:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  swift_unknownObjectRetain();
  swift_retain();
  sub_10019C068(v5, v7, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

@end