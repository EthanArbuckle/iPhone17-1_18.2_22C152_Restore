@interface HomeListSectionController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC4Maps25HomeListSectionController)init;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
@end

@implementation HomeListSectionController

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1000F19F8(a3);
  swift_unknownObjectRelease();
}

- (_TtC4Maps25HomeListSectionController)init
{
  result = (_TtC4Maps25HomeListSectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000F1BD8((uint64_t)self + OBJC_IVAR____TtC4Maps25HomeListSectionController_configuration);
  sub_1000F7228(*(void **)((char *)&self->super.isa
                         + OBJC_IVAR____TtC4Maps25HomeListSectionController_cachedSectionSnapshot));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps25HomeListSectionController____lazy_storage___sectionIdentifierPath));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC4Maps25HomeListSectionController____lazy_storage___sectionHeaderIdentifierPath);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  unsigned __int8 v13 = [(HomeListSectionController *)v11 collectionView:v10 shouldSelectItemAtIndexPath:isa];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_10033E854();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10033DAB0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end