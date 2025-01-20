@interface UIView(SKUIExtensions)
- (uint64_t)_SKUIView;
- (void)_SKUIView;
@end

@implementation UIView(SKUIExtensions)

- (uint64_t)_SKUIView
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(UIView(SKUIExtensions) *)v2 _SKUIView];
      }
    }
  }
  return a1;
}

- (void)_SKUIView
{
}

@end