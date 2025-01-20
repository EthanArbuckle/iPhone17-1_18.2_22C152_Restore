@interface PXFakePhotoKitAssetsFetcher
+ (PXFakePhotoKitAssetsFetcher)defaultFetcher;
+ (void)fillLibraryWithFakeAssets:(id)a3 completion:(id)a4;
- (PXFakePhotoKitAssetsFetcher)init;
- (id)fetchAssetsInContainer:(id)a3 curationKind:(int64_t)a4;
@end

@implementation PXFakePhotoKitAssetsFetcher

+ (PXFakePhotoKitAssetsFetcher)defaultFetcher
{
  if (qword_1E98B9B30 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E98CEDA0;
  return (PXFakePhotoKitAssetsFetcher *)v2;
}

- (id)fetchAssetsInContainer:(id)a3 curationKind:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1AA724684(v6, a4);
  v9 = v8;

  return v9;
}

+ (void)fillLibraryWithFakeAssets:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v5 = sub_1A9D5E1DC;
  }
  else
  {
    uint64_t v6 = 0;
  }
  swift_getObjCClassMetadata();
  id v7 = a3;
  sub_1AA7230BC(v7, (uint64_t)v5, v6);
  sub_1A9BB8934((uint64_t)v5);
}

- (PXFakePhotoKitAssetsFetcher)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PXFakePhotoKitAssetsFetcher *)&v3 init];
}

@end