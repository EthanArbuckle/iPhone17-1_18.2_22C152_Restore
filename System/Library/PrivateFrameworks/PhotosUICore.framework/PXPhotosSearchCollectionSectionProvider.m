@interface PXPhotosSearchCollectionSectionProvider
- (PXPhotosSearchCollectionSectionProvider)init;
- (PXPhotosSearchCollectionSectionProvider)initWithPhotoLibrary:(id)a3;
@end

@implementation PXPhotosSearchCollectionSectionProvider

- (PXPhotosSearchCollectionSectionProvider)initWithPhotoLibrary:(id)a3
{
  return (PXPhotosSearchCollectionSectionProvider *)PhotosSearchCollectionSectionProvider.init(photoLibrary:)(a3);
}

- (PXPhotosSearchCollectionSectionProvider)init
{
  result = (PXPhotosSearchCollectionSectionProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___PXPhotosSearchCollectionSectionProvider_badgesModifier));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXPhotosSearchCollectionSectionProvider_promotedRankedCollection));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_1AA112224((uint64_t)self + OBJC_IVAR___PXPhotosSearchCollectionSectionProvider_photoLibraryObservation);

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosSearchCollectionSectionProvider_memoriesFetchResult);
}

@end