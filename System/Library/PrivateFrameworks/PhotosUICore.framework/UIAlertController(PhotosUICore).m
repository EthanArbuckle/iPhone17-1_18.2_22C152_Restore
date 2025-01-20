@interface UIAlertController(PhotosUICore)
+ (void)px_showDebugAlertInKeyWindowWithMessage:()PhotosUICore;
- (uint64_t)px_shouldForceAlertStyle;
- (void)setPx_shouldForceAlertStyle:()PhotosUICore;
@end

@implementation UIAlertController(PhotosUICore)

- (uint64_t)px_shouldForceAlertStyle
{
  v1 = objc_getAssociatedObject(a1, (const void *)PXShouldForceAlertStyleKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setPx_shouldForceAlertStyle:()PhotosUICore
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, (const void *)PXShouldForceAlertStyleKey, v2, (void *)1);
}

+ (void)px_showDebugAlertInKeyWindowWithMessage:()PhotosUICore
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Debug UI" message:v3 preferredStyle:1];
  objc_initWeak(&location, v4);
  v5 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __75__UIAlertController_PhotosUICore__px_showDebugAlertInKeyWindowWithMessage___block_invoke;
  v13 = &unk_1E5DC20B8;
  objc_copyWeak(&v14, &location);
  v6 = [v5 actionWithTitle:@"OK" style:0 handler:&v10];
  objc_msgSend(v4, "addAction:", v6, v10, v11, v12, v13);

  v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  v8 = objc_msgSend(v7, "px_firstKeyWindow");
  v9 = [v8 rootViewController];
  [v9 presentViewController:v4 animated:1 completion:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

@end