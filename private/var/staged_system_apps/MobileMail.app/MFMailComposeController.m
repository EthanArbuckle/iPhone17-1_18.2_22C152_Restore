@interface MFMailComposeController
- (void)associateViewWithEntityWithAutosaveId:(id)a3;
@end

@implementation MFMailComposeController

- (void)associateViewWithEntityWithAutosaveId:(id)a3
{
  swift_getObjectType();
  id v3 = a3;
  v4 = self;
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v5;

    uint64_t v8 = v6;
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  sub_100456004(v8, v9);
  swift_bridgeObjectRelease();
}

@end