@interface UIViewController(PrototypeTools_PhotosUI)
- (uint64_t)pu_debugIsTransient;
- (void)pu_debugSetTransient:()PrototypeTools_PhotosUI;
@end

@implementation UIViewController(PrototypeTools_PhotosUI)

- (void)pu_debugSetTransient:()PrototypeTools_PhotosUI
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"com.apple.photosui.debugTransient", v2, (void *)1);
}

- (uint64_t)pu_debugIsTransient
{
  v1 = objc_getAssociatedObject(a1, @"com.apple.photosui.debugTransient");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end