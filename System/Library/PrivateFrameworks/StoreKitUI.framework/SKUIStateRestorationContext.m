@interface SKUIStateRestorationContext
+ (id)sharedContext;
+ (void)setSharedContext:(id)a3;
+ (void)sharedContext;
- (SKUIClientContext)clientContext;
- (void)setClientContext:(id)a3;
@end

@implementation SKUIStateRestorationContext

+ (void)setSharedContext:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIStateRestorationContext setSharedContext:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  v12 = (void *)sContext;
  sContext = (uint64_t)v3;
}

+ (id)sharedContext
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIStateRestorationContext sharedContext];
      }
    }
  }
  uint64_t v10 = (void *)sContext;

  return v10;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)setSharedContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sharedContext
{
}

@end