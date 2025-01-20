@interface SKUIAppMenuBarDocument
+ (id)featureName;
+ (void)featureName;
@end

@implementation SKUIAppMenuBarDocument

+ (id)featureName
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIAppMenuBarDocument featureName]();
  }
  v2 = (void *)*MEMORY[0x1E4F6EDA8];

  return v2;
}

+ (void)featureName
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIAppMenuBarDocument featureName]";
}

@end