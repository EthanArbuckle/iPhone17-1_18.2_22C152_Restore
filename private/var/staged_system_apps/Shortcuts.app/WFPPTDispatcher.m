@interface WFPPTDispatcher
+ (BOOL)dispatchTest:(id)a3;
+ (void)setupDatabaseForTesting;
- (WFPPTDispatcher)init;
@end

@implementation WFPPTDispatcher

+ (void)setupDatabaseForTesting
{
}

+ (BOOL)dispatchTest:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;
  swift_getObjCClassMetadata();
  char v6 = sub_1000401D8(v3, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (WFPPTDispatcher)init
{
  return (WFPPTDispatcher *)sub_10004398C();
}

@end