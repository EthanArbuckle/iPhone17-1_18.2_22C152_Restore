@interface ArtworkPrefetchingController
- (_TtC5Music28ArtworkPrefetchingController)init;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
@end

@implementation ArtworkPrefetchingController

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
}

- (_TtC5Music28ArtworkPrefetchingController)init
{
  result = (_TtC5Music28ArtworkPrefetchingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music28ArtworkPrefetchingController_defaultArtworkMetricsProvider));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music28ArtworkPrefetchingController_artworkMetricsProvider));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music28ArtworkPrefetchingController_artworkProvider));
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music28ArtworkPrefetchingController_context, (uint64_t *)&unk_10109BF40);
}

@end