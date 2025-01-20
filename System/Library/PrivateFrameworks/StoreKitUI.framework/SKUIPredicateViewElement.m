@interface SKUIPredicateViewElement
- (NSPredicate)entityValuePredicate;
- (void)entityValuePredicate;
@end

@implementation SKUIPredicateViewElement

- (NSPredicate)entityValuePredicate
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPredicateViewElement entityValuePredicate]();
  }
  v2 = [MEMORY[0x1E4F28F60] predicateWithValue:1];

  return (NSPredicate *)v2;
}

- (void)entityValuePredicate
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPredicateViewElement entityValuePredicate]";
}

@end