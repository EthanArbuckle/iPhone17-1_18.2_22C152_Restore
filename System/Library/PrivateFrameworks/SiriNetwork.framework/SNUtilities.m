@interface SNUtilities
+ (id)createUserAgentStringFromProductTypePrefix:(id)a3;
- (SNUtilities)init;
@end

@implementation SNUtilities

+ (id)createUserAgentStringFromProductTypePrefix:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v6 = static SNUtilities.createUserAgentString(fromProductTypePrefix:)(v3, v5);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  v9 = (void *)MEMORY[0x2611B2220](v6, v8);
  swift_bridgeObjectRelease();

  return v9;
}

- (SNUtilities)init
{
  return (SNUtilities *)SNUtilities.init()();
}

@end