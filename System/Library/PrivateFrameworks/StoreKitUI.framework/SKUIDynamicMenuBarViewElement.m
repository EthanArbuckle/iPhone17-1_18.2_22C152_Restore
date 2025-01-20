@interface SKUIDynamicMenuBarViewElement
+ (Class)_shelfMenuBarViewElementClass;
+ (Class)_titlesMenuBarViewElementClass;
+ (void)_shelfMenuBarViewElementClass;
+ (void)_titlesMenuBarViewElementClass;
- (BOOL)isDynamicContainer;
- (void)isDynamicContainer;
@end

@implementation SKUIDynamicMenuBarViewElement

- (BOOL)isDynamicContainer
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIDynamicMenuBarViewElement *)v2 isDynamicContainer];
      }
    }
  }
  return 1;
}

+ (Class)_titlesMenuBarViewElementClass
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIDynamicMenuBarViewElement _titlesMenuBarViewElementClass];
      }
    }
  }
  v10 = objc_opt_class();

  return (Class)v10;
}

+ (Class)_shelfMenuBarViewElementClass
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUIDynamicMenuBarViewElement _shelfMenuBarViewElementClass];
      }
    }
  }
  v10 = objc_opt_class();

  return (Class)v10;
}

- (void)isDynamicContainer
{
}

+ (void)_titlesMenuBarViewElementClass
{
}

+ (void)_shelfMenuBarViewElementClass
{
}

@end