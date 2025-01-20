@interface old_ArtworkPrefetchingController
- (_TtC5Music32old_ArtworkPrefetchingController)init;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
@end

@implementation old_ArtworkPrefetchingController

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
}

- (_TtC5Music32old_ArtworkPrefetchingController)init
{
  return (_TtC5Music32old_ArtworkPrefetchingController *)sub_100222314();
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music32old_ArtworkPrefetchingController_defaultCatalogMetricsProviding));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music32old_ArtworkPrefetchingController_catalogMetricsProviding));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music32old_ArtworkPrefetchingController_catalogProviding));
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end