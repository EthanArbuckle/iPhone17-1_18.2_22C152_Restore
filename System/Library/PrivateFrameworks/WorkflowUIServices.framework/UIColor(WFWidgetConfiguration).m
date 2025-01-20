@interface UIColor(WFWidgetConfiguration)
+ (uint64_t)wf_defaultWidgetConfigurationCardBackgroundColor;
@end

@implementation UIColor(WFWidgetConfiguration)

+ (uint64_t)wf_defaultWidgetConfigurationCardBackgroundColor
{
  return [a1 colorWithDynamicProvider:&__block_literal_global_161];
}

@end