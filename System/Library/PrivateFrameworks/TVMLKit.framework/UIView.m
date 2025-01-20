@interface UIView
@end

@implementation UIView

void __60__UIView_TVMLKitAdditions__tv_disableAnimation_forProperty___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__shouldAnimatePropertyWithKey_);
  v2 = class_getInstanceMethod(v0, sel_tv_shouldAnimatePropertyWithKey_);
  method_exchangeImplementations(InstanceMethod, v2);
}

uint64_t __44__UIView_TVMLKitAdditions__tv_sizeThatFits___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sizeThatFits:");
}

@end