@interface UIColor
@end

@implementation UIColor

id __82__UIColor_WFWidgetConfiguration__wf_defaultWidgetConfigurationCardBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.109803922;
    double v3 = 0.117647059;
    double v4 = 1.0;
    double v5 = 0.109803922;
  }
  else
  {
    double v2 = 1.0;
    double v5 = 1.0;
    double v3 = 1.0;
    double v4 = 1.0;
  }
  v6 = [MEMORY[0x263F825C8] colorWithDisplayP3Red:v2 green:v5 blue:v3 alpha:v4];
  return v6;
}

@end