@interface UIColor
@end

@implementation UIColor

uint64_t __46__UIColor_VideosUI__vui_opacityColorWithType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [v3 userInterfaceStyle];

  return objc_msgSend(v4, "vui_opacityColorWithType:userInterfaceStyle:", v5, v6);
}

void __41__UIColor_VideosUI__vui_imageBorderColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.05];
  v1 = (void *)vui_imageBorderColor___imageBorderColor;
  vui_imageBorderColor___imageBorderColor = v0;
}

void __44__UIColor_VideosUI__vui_imageHighlightColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.4 green:0.4 blue:0.4 alpha:1.0];
  v1 = (void *)vui_imageHighlightColor___imageHighlightColor;
  vui_imageHighlightColor___imageHighlightColor = v0;
}

void __45__UIColor_VideosUI__vui_progressBarFillColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.847058824 green:0.847058824 blue:0.847058824 alpha:0.4];
  v1 = (void *)vui_progressBarFillColor___fillColor;
  vui_progressBarFillColor___fillColor = v0;
}

id __62__UIColor_VideosUI__vui_dynamicColorWithLightColor_darkColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInterfaceStyle];
  uint64_t v4 = 40;
  if (v3 == 1) {
    uint64_t v4 = 32;
  }
  uint64_t v5 = *(void **)(a1 + v4);
  return v5;
}

@end