@interface PXPhotoKitFetcher
+ (id)fetchAssetsWithCurationKind:(int64_t)a3 container:(id)a4 libraryFilter:(int64_t)a5 curationContext:(int64_t)a6;
- (_TtC12PhotosUICore17PXPhotoKitFetcher)init;
@end

@implementation PXPhotoKitFetcher

+ (id)fetchAssetsWithCurationKind:(int64_t)a3 container:(id)a4 libraryFilter:(int64_t)a5 curationContext:(int64_t)a6
{
  id v9 = a4;
  id v10 = sub_1AA0DB378(a3, v9, a5, a6);

  return v10;
}

- (_TtC12PhotosUICore17PXPhotoKitFetcher)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXPhotoKitFetcher();
  return [(PXPhotoKitFetcher *)&v3 init];
}

@end