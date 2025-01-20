@interface JurassicMergePolicy
- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4;
- (_TtC7Journal19JurassicMergePolicy)initWithMergeType:(unint64_t)a3;
@end

@implementation JurassicMergePolicy

- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4
{
  sub_10038D074();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  sub_1003894EC(v5);
  swift_bridgeObjectRelease();

  return 1;
}

- (_TtC7Journal19JurassicMergePolicy)initWithMergeType:(unint64_t)a3
{
  result = (_TtC7Journal19JurassicMergePolicy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC7Journal19JurassicMergePolicy_sessionID;
  uint64_t v3 = type metadata accessor for UUID();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end