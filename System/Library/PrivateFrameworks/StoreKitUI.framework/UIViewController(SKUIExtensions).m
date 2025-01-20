@interface UIViewController(SKUIExtensions)
- (id)_SKUIView;
- (void)_SKUIView;
@end

@implementation UIViewController(SKUIExtensions)

- (id)_SKUIView
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(UIViewController(SKUIExtensions) *)v2 _SKUIView];
      }
    }
  }
  v10 = [a1 view];

  return v10;
}

- (void)_SKUIView
{
}

@end