@interface SKUIBrowseHeaderViewElement
- (int64_t)pageComponentType;
- (void)pageComponentType;
@end

@implementation SKUIBrowseHeaderViewElement

- (int64_t)pageComponentType
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrowseHeaderViewElement pageComponentType]();
  }
  return 17;
}

- (void)pageComponentType
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBrowseHeaderViewElement pageComponentType]";
}

@end