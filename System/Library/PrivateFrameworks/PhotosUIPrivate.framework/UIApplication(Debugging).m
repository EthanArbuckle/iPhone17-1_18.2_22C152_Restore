@interface UIApplication(Debugging)
+ (id)_pu_debugSearchViewControllerHierarchyUsingBlock:()Debugging;
+ (uint64_t)pu_debugCurrentAsset;
+ (uint64_t)pu_debugCurrentPhotosViewController;
+ (uint64_t)pu_debugCurrentPrivacyController;
+ (uint64_t)pu_debugCurrentViewModel;
+ (uint64_t)pu_debugCurrentlySelectedAssets;
@end

@implementation UIApplication(Debugging)

+ (id)_pu_debugSearchViewControllerHierarchyUsingBlock:()Debugging
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__104256;
  v10 = __Block_byref_object_dispose__104257;
  id v11 = 0;
  id v5 = a3;
  PXEnumerateViewControllersUsingBlock();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (uint64_t)pu_debugCurrentPrivacyController
{
  return objc_msgSend(a1, "_pu_debugSearchViewControllerHierarchyUsingBlock:", &__block_literal_global_19);
}

+ (uint64_t)pu_debugCurrentViewModel
{
  return objc_msgSend(a1, "_pu_debugSearchViewControllerHierarchyUsingBlock:", &__block_literal_global_17_104259);
}

+ (uint64_t)pu_debugCurrentlySelectedAssets
{
  return objc_msgSend(a1, "_pu_debugSearchViewControllerHierarchyUsingBlock:", &__block_literal_global_15);
}

+ (uint64_t)pu_debugCurrentPhotosViewController
{
  return PXFirstViewControllerPassingTest();
}

+ (uint64_t)pu_debugCurrentAsset
{
  return objc_msgSend(a1, "_pu_debugSearchViewControllerHierarchyUsingBlock:", &__block_literal_global_104263);
}

@end