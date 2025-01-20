@interface PageFacetOptionsViewController
- (_TtC8AppStore30PageFacetOptionsViewController)initWithCoder:(id)a3;
- (_TtC8AppStore30PageFacetOptionsViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC8AppStore30PageFacetOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PageFacetOptionsViewController

- (_TtC8AppStore30PageFacetOptionsViewController)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC8AppStore30PageFacetOptionsViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore30PageFacetOptionsViewController_diffableDataSource) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore30PageFacetOptionsViewController_preselectionContentOffset;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  id v6 = a3;

  result = (_TtC8AppStore30PageFacetOptionsViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10077E444();
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
  sub_10077F154(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC8AppStore30PageFacetOptionsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC8AppStore30PageFacetOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8AppStore30PageFacetOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8AppStore30PageFacetOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100092F18((uint64_t)self + OBJC_IVAR____TtC8AppStore30PageFacetOptionsViewController_delegate);
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore30PageFacetOptionsViewController_facet;
  uint64_t v4 = type metadata accessor for PageFacets.Facet();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore30PageFacetOptionsViewController_diffableDataSource);
}

@end