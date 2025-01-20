@interface ArtworkPrefetchingController
- (_TtC16MusicApplication28ArtworkPrefetchingController)init;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
@end

@implementation ArtworkPrefetchingController

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
}

- (_TtC16MusicApplication28ArtworkPrefetchingController)init
{
  result = (_TtC16MusicApplication28ArtworkPrefetchingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC16MusicApplication28ArtworkPrefetchingController_defaultArtworkMetricsProvider));
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC16MusicApplication28ArtworkPrefetchingController_artworkMetricsProvider));
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC16MusicApplication28ArtworkPrefetchingController_artworkProvider));
  swift_release();
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication28ArtworkPrefetchingController_context, (uint64_t *)&unk_DC4CF0);
}

@end