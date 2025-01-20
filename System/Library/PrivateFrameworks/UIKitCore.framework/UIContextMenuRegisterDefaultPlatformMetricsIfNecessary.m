@interface UIContextMenuRegisterDefaultPlatformMetricsIfNecessary
@end

@implementation UIContextMenuRegisterDefaultPlatformMetricsIfNecessary

void ___UIContextMenuRegisterDefaultPlatformMetricsIfNecessary_block_invoke()
{
  v0 = +[_UIVisualStyleRegistry defaultRegistry];
  uint64_t v1 = objc_opt_class();
  [v0 registerVisualStyleClass:v1 forStylableClass:objc_opt_class()];

  v2 = +[_UIVisualStyleRegistry registryForIdiom:0];
  uint64_t v3 = objc_opt_class();
  [v2 registerVisualStyleClass:v3 forStylableClass:objc_opt_class()];

  v4 = +[_UIVisualStyleRegistry registryForIdiom:1];
  uint64_t v5 = objc_opt_class();
  [v4 registerVisualStyleClass:v5 forStylableClass:objc_opt_class()];

  v6 = +[_UIVisualStyleRegistry registryForIdiom:2];
  uint64_t v7 = objc_opt_class();
  [v6 registerVisualStyleClass:v7 forStylableClass:objc_opt_class()];

  id v9 = +[_UIVisualStyleRegistry registryForIdiom:8];
  uint64_t v8 = objc_opt_class();
  [v9 registerVisualStyleClass:v8 forStylableClass:objc_opt_class()];
}

@end