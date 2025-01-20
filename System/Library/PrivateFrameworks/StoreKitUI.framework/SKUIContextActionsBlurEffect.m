@interface SKUIContextActionsBlurEffect
+ (id)effectWithStyle:(int64_t)a3;
- (id)effectSettings;
- (void)effectSettings;
@end

@implementation SKUIContextActionsBlurEffect

+ (id)effectWithStyle:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIContextActionsBlurEffect effectWithStyle:]();
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SKUIContextActionsBlurEffect;
  v5 = objc_msgSendSuper2(&v7, sel_effectWithStyle_, a3);

  return v5;
}

- (id)effectSettings
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContextActionsBlurEffect effectSettings]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIContextActionsBlurEffect;
  v3 = [(UIBlurEffect *)&v8 effectSettings];
  [v3 setScale:0.5];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    double v4 = 0.0;
    [v3 setBlurRadius:0.0];
    double v5 = 0.4;
  }
  else
  {
    [v3 setBlurRadius:8.0];
    v6 = [MEMORY[0x1E4FB1618] blackColor];
    [v3 setColorTint:v6];

    [v3 setColorTintAlpha:0.2];
    double v4 = 0.025;
    double v5 = 0.1;
  }
  [v3 setGrayscaleTintLevel:0.0];
  [v3 setGrayscaleTintAlpha:v5];
  [v3 setZoom:v4];

  return v3;
}

+ (void)effectWithStyle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIContextActionsBlurEffect effectWithStyle:]";
}

- (void)effectSettings
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIContextActionsBlurEffect effectSettings]";
}

@end