@interface PTUISettingsController
@end

@implementation PTUISettingsController

uint64_t __90__PTUISettingsController_PXSettingsSearch__px_performWithoutAnimations_completionHandler___block_invoke()
{
  v0 = objc_opt_class();
  return objc_msgSend(v0, "px_swizzleMethod:withMethod:", sel_pushViewController_animated_, sel__pxswizzled_pushViewController_animated_);
}

@end