@interface UIViewController(Debugging)
- (uint64_t)pu_debugCurrentAsset;
- (uint64_t)pu_debugCurrentPrivacyController;
- (uint64_t)pu_debugCurrentViewModel;
- (uint64_t)pu_debugCurrentlySelectedAssets;
@end

@implementation UIViewController(Debugging)

- (uint64_t)pu_debugCurrentPrivacyController
{
  return 0;
}

- (uint64_t)pu_debugCurrentViewModel
{
  return 0;
}

- (uint64_t)pu_debugCurrentlySelectedAssets
{
  return 0;
}

- (uint64_t)pu_debugCurrentAsset
{
  return 0;
}

@end