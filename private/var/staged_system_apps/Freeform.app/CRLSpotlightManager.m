@interface CRLSpotlightManager
- (_TtC8Freeform19CRLSpotlightManager)init;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
@end

@implementation CRLSpotlightManager

- (_TtC8Freeform19CRLSpotlightManager)init
{
  swift_defaultActor_initialize();
  result = (_TtC8Freeform19CRLSpotlightManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  swift_retain();
  sub_100AFF998(v7, (uint64_t)sub_1005E2108, v6);

  swift_release();

  swift_release();
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7 = _Block_copy(a5);
  v8 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v7);
  id v9 = a3;
  swift_retain();
  sub_100B02310(v8, (unint64_t)self, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_release();

  swift_bridgeObjectRelease();
}

@end