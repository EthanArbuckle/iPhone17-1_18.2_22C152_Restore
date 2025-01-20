@interface NPTOPhotosAppFeaturedPhotosContentProvider
- (NPTOPhotosAppFeaturedPhotosContentProvider)init;
- (NPTOPhotosAppFeaturedPhotosContentProvider)initWithDevice:(id)a3;
- (NPTOSyncContentProviderDelegate)delegate;
- (id)assetCollections;
- (id)assetsForAssetCollection:(id)a3;
- (id)keyAssetsForAssetCollection:(id)a3;
- (int64_t)targetForAssetCollection:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NPTOPhotosAppFeaturedPhotosContentProvider

- (NPTOSyncContentProviderDelegate)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (NPTOSyncContentProviderDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (NPTOPhotosAppFeaturedPhotosContentProvider)initWithDevice:(id)a3
{
  return (NPTOPhotosAppFeaturedPhotosContentProvider *)sub_10000C7E8(a3);
}

- (id)assetCollections
{
  v2 = self;
  v3 = (void *)sub_10000D2EC();

  return v3;
}

- (id)assetsForAssetCollection:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_100010D70();

  return v6;
}

- (id)keyAssetsForAssetCollection:(id)a3
{
  return 0;
}

- (int64_t)targetForAssetCollection:(id)a3
{
  return 6;
}

- (NPTOPhotosAppFeaturedPhotosContentProvider)init
{
  result = (NPTOPhotosAppFeaturedPhotosContentProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___NPTOPhotosAppFeaturedPhotosContentProvider_preferenceAccessor));
  sub_10000BD30((uint64_t)self + OBJC_IVAR___NPTOPhotosAppFeaturedPhotosContentProvider_photosSyncingPreferenceObserver, (uint64_t *)&unk_1000A0BC0);
  sub_10000BD30((uint64_t)self + OBJC_IVAR___NPTOPhotosAppFeaturedPhotosContentProvider_featuredPhotosSyncingPreferenceObserver, (uint64_t *)&unk_1000A0BC0);
  sub_10000BD30((uint64_t)self + OBJC_IVAR___NPTOPhotosAppFeaturedPhotosContentProvider_photosPreferenceObserver, (uint64_t *)&unk_1000A0BC0);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___NPTOPhotosAppFeaturedPhotosContentProvider_devicePropertyObserver));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___NPTOPhotosAppFeaturedPhotosContentProvider_latestSuggestionsObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___NPTOPhotosAppFeaturedPhotosContentProvider_currentFeaturedPhotosObserver));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___NPTOPhotosAppFeaturedPhotosContentProvider_delegate;

  sub_10000B3D4((uint64_t)v3);
}

@end