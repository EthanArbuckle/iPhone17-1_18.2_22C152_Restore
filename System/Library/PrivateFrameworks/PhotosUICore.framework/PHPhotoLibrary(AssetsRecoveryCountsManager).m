@interface PHPhotoLibrary(AssetsRecoveryCountsManager)
- (PXAssetsRecoveryCountsManager)px_assetsRecoveryCountsManager;
@end

@implementation PHPhotoLibrary(AssetsRecoveryCountsManager)

- (PXAssetsRecoveryCountsManager)px_assetsRecoveryCountsManager
{
  id v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, sel_px_assetsRecoveryCountsManager);
  v2 = (PXAssetsRecoveryCountsManager *)objc_claimAutoreleasedReturnValue();
  if (!v2) {
    v2 = [[PXAssetsRecoveryCountsManager alloc] initWithPhotoLibrary:v1];
  }
  objc_setAssociatedObject(v1, sel_px_assetsRecoveryCountsManager, v2, (void *)0x301);
  objc_sync_exit(v1);

  return v2;
}

@end