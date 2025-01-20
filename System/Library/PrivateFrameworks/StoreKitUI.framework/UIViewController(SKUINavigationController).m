@interface UIViewController(SKUINavigationController)
- (uint64_t)SKUIPinnedHeaderView;
- (void)SKUIPinnedHeaderView;
@end

@implementation UIViewController(SKUINavigationController)

- (uint64_t)SKUIPinnedHeaderView
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v0) {
        [(UIViewController(SKUINavigationController) *)v0 SKUIPinnedHeaderView];
      }
    }
  }
  return 0;
}

- (void)SKUIPinnedHeaderView
{
}

@end