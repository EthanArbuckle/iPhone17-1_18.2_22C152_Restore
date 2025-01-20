@interface CRLAnalyticsShapeInserted
+ (void)sendShapeInsertedAnalyticsWithShapeIdentifier:(id)a3 isMiniShapePicker:(BOOL)a4;
- (_TtC8Freeform25CRLAnalyticsShapeInserted)init;
@end

@implementation CRLAnalyticsShapeInserted

+ (void)sendShapeInsertedAnalyticsWithShapeIdentifier:(id)a3 isMiniShapePicker:(BOOL)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  sub_10057BB38(v5, v7, a4);

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform25CRLAnalyticsShapeInserted)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLAnalyticsShapeInserted();
  return [(CRLAnalyticsShapeInserted *)&v3 init];
}

@end