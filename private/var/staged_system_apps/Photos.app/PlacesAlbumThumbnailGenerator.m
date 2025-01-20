@interface PlacesAlbumThumbnailGenerator
- (_TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator)init;
- (void)placesSnapshotDidChange;
@end

@implementation PlacesAlbumThumbnailGenerator

- (void)placesSnapshotDidChange
{
  v2 = self;
  sub_100017794();
}

- (_TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator)init
{
  return (_TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator *)sub_10001782C();
}

- (void).cxx_destruct
{
  sub_100012058(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator_cachedThumbnail), *(void *)&self->cachedThumbnail[OBJC_IVAR____TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator_cachedThumbnail]);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9PhotosAppP33_DA668D572B4928516595FA7D1A5EA7B429PlacesAlbumThumbnailGenerator_lock);
}

@end