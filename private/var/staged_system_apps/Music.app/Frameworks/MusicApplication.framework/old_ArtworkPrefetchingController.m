@interface old_ArtworkPrefetchingController
- (_TtC16MusicApplication32old_ArtworkPrefetchingController)init;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
@end

@implementation old_ArtworkPrefetchingController

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
}

- (_TtC16MusicApplication32old_ArtworkPrefetchingController)init
{
  return (_TtC16MusicApplication32old_ArtworkPrefetchingController *)sub_24EE80();
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC16MusicApplication32old_ArtworkPrefetchingController_defaultCatalogMetricsProviding));
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC16MusicApplication32old_ArtworkPrefetchingController_catalogMetricsProviding));
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC16MusicApplication32old_ArtworkPrefetchingController_catalogProviding));
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end