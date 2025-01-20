@interface PurchasesCollectionViewDelegate
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC8AppStore31PurchasesCollectionViewDelegate)init;
- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5;
- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation PurchasesCollectionViewDelegate

- (void)scrollViewDidScroll:(id)a3
{
  v3 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_didScrollHandler);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    sub_100060050((uint64_t)v3);
    v3(v5);
    sub_10006012C((uint64_t)v3);
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  v13 = (char *)a4;
  v14 = self;
  sub_1003677C0(v12, v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_artworkLoader);
  uint64_t v13 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_objectGraph);
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  sub_100732BF4(v15, (uint64_t)v11, v12, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = (_TtC8AppStore31PurchasesCollectionViewDelegate *)a3;
  v11 = self;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  uint64_t v13 = (_TtC8AppStore31PurchasesCollectionViewDelegate *)[(PurchasesCollectionViewDelegate *)v10 cellForItemAtIndexPath:isa];

  if (v13)
  {
    swift_getObjectType();
    if (swift_conformsToProtocol2()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    BOOL v15 = v14 == 0;

    uint64_t v10 = v11;
    v11 = v13;
  }
  else
  {
    BOOL v15 = 0;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v15;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (objc_class *)((char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_objectGraph);
  id v11 = a3;
  uint64_t v12 = self;
  sub_100367258(v9, (uint64_t)v9, v10, v11);

  (*(void (**)(objc_class *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC8AppStore31PurchasesCollectionViewDelegate)init
{
  result = (_TtC8AppStore31PurchasesCollectionViewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_didScrollHandler);

  sub_10006012C(v3);
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5
{
  uint64_t v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_pageTraits);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  swift_unknownObjectRetain();
  sub_100723BBC(a5, v8, v9);
  double v13 = v12;

  swift_unknownObjectRelease();
  return v13;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_objectGraph);
  double v13 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8AppStore31PurchasesCollectionViewDelegate_pageTraits);
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  swift_unknownObjectRetain();
  sub_100726E6C((uint64_t)v11, v12, v13, v14);
  double v18 = v17;

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v18;
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  id v15 = sub_100368658((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v15;
}

@end