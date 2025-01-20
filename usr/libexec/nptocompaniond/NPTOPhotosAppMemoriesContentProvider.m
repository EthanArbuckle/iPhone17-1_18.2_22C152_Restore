@interface NPTOPhotosAppMemoriesContentProvider
- (NPTOPhotosAppMemoriesContentProvider)init;
- (NPTOPhotosAppMemoriesContentProvider)initWithDevice:(id)a3;
- (NPTOSyncContentProviderDelegate)delegate;
- (id)assetCollections;
- (id)assetsForAssetCollection:(id)a3;
- (id)keyAssetsForAssetCollection:(id)a3;
- (int64_t)targetForAssetCollection:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NPTOPhotosAppMemoriesContentProvider

- (NPTOSyncContentProviderDelegate)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (NPTOSyncContentProviderDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (NPTOPhotosAppMemoriesContentProvider)initWithDevice:(id)a3
{
  return (NPTOPhotosAppMemoriesContentProvider *)sub_100011798(a3);
}

- (id)assetCollections
{
  v2 = self;
  v3 = sub_100012238();

  return v3;
}

- (id)assetsForAssetCollection:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_1000159E8((uint64_t (*)(uint64_t))sub_1000112C0, "SyncedMemory selected %s assets.");

  return v6;
}

- (id)keyAssetsForAssetCollection:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_1000159E8((uint64_t (*)(uint64_t))sub_100011424, "SyncedMemory selected %s key assets.");

  return v6;
}

- (int64_t)targetForAssetCollection:(id)a3
{
  return 5;
}

- (NPTOPhotosAppMemoriesContentProvider)init
{
  result = (NPTOPhotosAppMemoriesContentProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100006AE4((uint64_t)self + OBJC_IVAR___NPTOPhotosAppMemoriesContentProvider_photosSyncingPreferenceObserver);
  sub_100006AE4((uint64_t)self + OBJC_IVAR___NPTOPhotosAppMemoriesContentProvider_memoriesSyncingPreferenceObserver);
  sub_100006AE4((uint64_t)self + OBJC_IVAR___NPTOPhotosAppMemoriesContentProvider_photosPreferenceObserver);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___NPTOPhotosAppMemoriesContentProvider_currentMemoryAssetsObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___NPTOPhotosAppMemoriesContentProvider_currentMemoryKeyAssetsObserver));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___NPTOPhotosAppMemoriesContentProvider_delegate;

  sub_10000B3D4((uint64_t)v3);
}

@end