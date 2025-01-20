@interface DOCNodeCollection
- (BOOL)isGathering;
- (_TtC5Files17DOCNodeCollection)init;
- (void)collection:(id)a3 didEncounterError:(id)a4;
- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6;
- (void)collection:(id)a3 didUpdateObservedItem:(id)a4;
- (void)collectionDidFinishGathering:(id)a3;
- (void)dataForCollectionShouldBeReloaded:(id)a3;
- (void)setIsGathering:(BOOL)a3;
@end

@implementation DOCNodeCollection

- (void)setIsGathering:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC5Files17DOCNodeCollection_isGathering;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)collectionDidFinishGathering:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100041C9C(0xD000000000000020, 0x80000001005D92C0);
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v4 = a3;
  v5 = self;
  DOCNodeCollection.data(forCollectionShouldBeReloaded:)(v4);
}

- (BOOL)isGathering
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC5Files17DOCNodeCollection_isGathering;
  swift_beginAccess();
  return *v2;
}

- (_TtC5Files17DOCNodeCollection)init
{
  result = (_TtC5Files17DOCNodeCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000C71C8(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC5Files17DOCNodeCollection_type), *(void *)&self->logPrefix[OBJC_IVAR____TtC5Files17DOCNodeCollection_type], self->logPrefix[OBJC_IVAR____TtC5Files17DOCNodeCollection_type + 8]);
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files17DOCNodeCollection_delegate);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files17DOCNodeCollection_isGatheringObservation);
}

- (void)collection:(id)a3 didEncounterError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1001A01AC((uint64_t)v8);
}

- (void)collection:(id)a3 didUpdateObservedItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  DOCNodeCollection.collection(_:didUpdateObservedItem:)(v6, v7);
}

- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6
{
  sub_10009E6C4(0, (unint64_t *)&qword_1007069C0);
  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10009E6C4(0, (unint64_t *)&unk_100706B70);
  sub_1001A1670();
  unint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  sub_1001A0588(v8, v9, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end