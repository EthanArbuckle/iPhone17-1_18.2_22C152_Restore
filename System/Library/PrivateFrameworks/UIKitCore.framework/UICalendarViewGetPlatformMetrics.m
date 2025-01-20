@interface UICalendarViewGetPlatformMetrics
@end

@implementation UICalendarViewGetPlatformMetrics

void ___UICalendarViewGetPlatformMetrics_block_invoke()
{
  v0 = +[_UIVisualStyleRegistry defaultRegistry];
  uint64_t v1 = objc_opt_class();
  [v0 registerVisualStyleClass:v1 forStylableClass:objc_opt_class()];

  id v3 = +[_UIVisualStyleRegistry registryForIdiom:5];
  uint64_t v2 = objc_opt_class();
  [v3 registerVisualStyleClass:v2 forStylableClass:objc_opt_class()];
}

@end