@interface SKUIEntityProviderInvalidationContext
- (BOOL)invalidateDataSourceCounts;
- (BOOL)invalidateEverything;
- (void)setInvalidateDataSourceCounts:(BOOL)a3;
- (void)setInvalidateEverything:(BOOL)a3;
@end

@implementation SKUIEntityProviderInvalidationContext

- (void)setInvalidateDataSourceCounts:(BOOL)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEntityProviderInvalidationContext setInvalidateDataSourceCounts:]();
  }
  self->_invalidateDataSourceCounts = a3;
}

- (void)setInvalidateEverything:(BOOL)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEntityProviderInvalidationContext setInvalidateEverything:]();
  }
  self->_invalidateEverything = a3;
}

- (BOOL)invalidateEverything
{
  return self->_invalidateEverything;
}

- (BOOL)invalidateDataSourceCounts
{
  return self->_invalidateDataSourceCounts;
}

- (void)setInvalidateDataSourceCounts:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIEntityProviderInvalidationContext setInvalidateDataSourceCounts:]";
}

- (void)setInvalidateEverything:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIEntityProviderInvalidationContext setInvalidateEverything:]";
}

@end