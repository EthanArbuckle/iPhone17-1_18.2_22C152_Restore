@interface HomeListFeatureDiscoverySectionController
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
@end

@implementation HomeListFeatureDiscoverySectionController

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps41HomeListFeatureDiscoverySectionController____lazy_storage___featureDiscoveryDataProvider));
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_1001D21B4();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end