@interface RDMergePolicy
+ (id)defaultMergePolicy;
- (BOOL)resolveConflicts:(id)a3 error:(id *)a4;
- (_TtC7remindd13RDMergePolicy)initWithMergeType:(unint64_t)a3;
@end

@implementation RDMergePolicy

+ (id)defaultMergePolicy
{
  id v2 = [objc_allocWithZone((Class)a1) initWithMergeType:2];

  return v2;
}

- (_TtC7remindd13RDMergePolicy)initWithMergeType:(unint64_t)a3
{
  return (_TtC7remindd13RDMergePolicy *)sub_1004535E4(a3);
}

- (BOOL)resolveConflicts:(id)a3 error:(id *)a4
{
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  sub_100453714(v5);
  swift_bridgeObjectRelease();

  return 1;
}

@end