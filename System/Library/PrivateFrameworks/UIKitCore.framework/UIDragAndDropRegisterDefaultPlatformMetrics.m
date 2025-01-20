@interface UIDragAndDropRegisterDefaultPlatformMetrics
@end

@implementation UIDragAndDropRegisterDefaultPlatformMetrics

void ___UIDragAndDropRegisterDefaultPlatformMetrics_block_invoke()
{
  v0 = +[_UIVisualStyleRegistry defaultRegistry];
  uint64_t v1 = objc_opt_class();
  [v0 registerVisualStyleClass:v1 forStylableClass:objc_opt_class()];

  v2 = +[_UIVisualStyleRegistry registryForIdiom:1];
  uint64_t v3 = objc_opt_class();
  [v2 registerVisualStyleClass:v3 forStylableClass:objc_opt_class()];

  v4 = +[_UIVisualStyleRegistry registryForIdiom:0];
  uint64_t v5 = objc_opt_class();
  [v4 registerVisualStyleClass:v5 forStylableClass:objc_opt_class()];

  id v7 = +[_UIVisualStyleRegistry registryForIdiom:5];
  uint64_t v6 = objc_opt_class();
  [v7 registerVisualStyleClass:v6 forStylableClass:objc_opt_class()];
}

@end