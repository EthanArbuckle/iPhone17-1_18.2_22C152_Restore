@interface HomeListRecentsSectionController
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
@end

@implementation HomeListRecentsSectionController

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10007F014((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps32HomeListRecentsSectionController_markedLocationDataProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps32HomeListRecentsSectionController_recentsDataProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps32HomeListRecentsSectionController_recentsDataFilter));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps32HomeListRecentsSectionController_recentsDataFilterQueue));

  swift_bridgeObjectRelease();
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
  sub_100332608((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end