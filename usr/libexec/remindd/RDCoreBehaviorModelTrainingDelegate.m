@interface RDCoreBehaviorModelTrainingDelegate
- (_TtC7remindd35RDCoreBehaviorModelTrainingDelegate)init;
- (id)eventsForTypes:(id)a3 error:(id *)a4;
- (id)miningTask:(id)a3 filteredRulesForExtractedRules:(id)a4;
- (id)taskSpecificEventProvidersForMiningTask:(id)a3;
- (void)miningTask:(id)a3 didExtractRules:(id)a4;
- (void)miningTaskDidFinish:(id)a3;
@end

@implementation RDCoreBehaviorModelTrainingDelegate

- (id)miningTask:(id)a3 filteredRulesForExtractedRules:(id)a4
{
  sub_1000963CC(0, &qword_1009100C0);
  sub_1004B6C7C();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_1004B5624(v6);

  swift_bridgeObjectRelease();
  v9.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (void)miningTaskDidFinish:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004B1130(v4);
}

- (void)miningTask:(id)a3 didExtractRules:(id)a4
{
  sub_1000963CC(0, &qword_1009100C0);
  sub_1004B6C7C();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  if ((v6 & 0xC000000000000001) != 0)
  {
    id v7 = a3;
    v8 = self;
    uint64_t v9 = __CocoaSet.count.getter();
  }
  else
  {
    uint64_t v9 = *(void *)(v6 + 16);
    id v10 = a3;
    v11 = self;
  }
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd35RDCoreBehaviorModelTrainingDelegate_metrics);
  BOOL v13 = __OFADD__(v12, v9);
  v14 = (objc_class *)(v12 + v9);
  if (v13)
  {
    __break(1u);
  }
  else
  {
    *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd35RDCoreBehaviorModelTrainingDelegate_metrics) = v14;

    swift_bridgeObjectRelease();
  }
}

- (id)taskSpecificEventProvidersForMiningTask:(id)a3
{
  sub_100094134((uint64_t *)&unk_10090AF20);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10077A530;
  *(void *)(v4 + 32) = self;
  specialized Array._endMutation()();
  v5 = self;
  sub_100094134(&qword_10091AA78);
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)eventsForTypes:(id)a3 error:(id *)a4
{
  uint64_t v4 = self;
  sub_1004B5870();

  sub_1000963CC(0, &qword_10091AA70);
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (_TtC7remindd35RDCoreBehaviorModelTrainingDelegate)init
{
  result = (_TtC7remindd35RDCoreBehaviorModelTrainingDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7remindd35RDCoreBehaviorModelTrainingDelegate_trainingDataFrame;
  uint64_t v4 = type metadata accessor for REMSuggestedAttributeInputDataFrame();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  NSArray v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd35RDCoreBehaviorModelTrainingDelegate_timer);
}

@end