@interface SKUIShapeView
+ (Class)layerClass;
+ (void)layerClass;
@end

@implementation SKUIShapeView

+ (Class)layerClass
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIShapeView layerClass]();
  }
  v2 = objc_opt_class();

  return (Class)v2;
}

+ (void)layerClass
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIShapeView layerClass]";
}

@end