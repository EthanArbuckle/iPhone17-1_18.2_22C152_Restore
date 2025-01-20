@interface UIColor
@end

@implementation UIColor

void __49__UIColor_PhotosUICore__px_dynamicHighlightColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_5_118180];
  v1 = (void *)px_dynamicHighlightColor_color;
  px_dynamicHighlightColor_color = v0;
}

id __49__UIColor_PhotosUICore__px_dynamicHighlightColor__block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1618] systemYellowColor];
  }
  else {
  v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.980392157 green:0.666666667 blue:0.0 alpha:1.0];
  }
  return v2;
}

id __46__UIColor_PhotosUICore__px_messagesBubbleGray__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.149019608;
    double v3 = 0.160784314;
  }
  else
  {
    double v2 = 0.91372549;
    double v3 = 0.917647059;
  }
  v4 = [MEMORY[0x1E4FB1618] colorWithRed:v2 green:v2 blue:v3 alpha:1.0];
  return v4;
}

@end