@interface RDXPCIndexingPerformer
- (_TtC7remindd22RDXPCIndexingPerformer)init;
- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4;
- (void)testIndexDummyItemWithCompletion:(id)a3;
@end

@implementation RDXPCIndexingPerformer

- (void)testIndexDummyItemWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1004D2218((uint64_t)sub_10011FBC8, v5);

  swift_release();
}

- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1004D2840((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  v7 = self;
  sub_1004D295C(v6, (uint64_t)v7, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_10011C2EC;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = self;
  sub_1004D2B84(v4, v5);
  sub_100096314((uint64_t)v4);
}

- (_TtC7remindd22RDXPCIndexingPerformer)init
{
  result = (_TtC7remindd22RDXPCIndexingPerformer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end