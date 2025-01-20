@interface UIColor(VideosUI)
+ (id)vui_dynamicColorWithLightColor:()VideosUI darkColor:;
+ (id)vui_imageBorderColor;
+ (id)vui_imageHighlightColor;
+ (id)vui_keyBlueHighlightedColor;
+ (id)vui_opacityColorWithType:()VideosUI;
+ (id)vui_opacityColorWithType:()VideosUI userInterfaceStyle:;
+ (id)vui_progressBarFillColor;
+ (uint64_t)vui_keyColor;
+ (uint64_t)vui_opaqueSeparatorColor;
+ (uint64_t)vui_primaryDynamicBackgroundColor;
+ (uint64_t)vui_primaryTextColor;
+ (uint64_t)vui_secondaryDynamicBackgroundColor;
+ (uint64_t)vui_secondaryFillColor;
+ (uint64_t)vui_secondaryTextColor;
+ (uint64_t)vui_separatorColor;
+ (uint64_t)vui_tertiaryDynamicBackgroundColor;
+ (uint64_t)vui_tertiaryFillColor;
+ (uint64_t)vui_windowBackgroundColor;
- (id)vui_blendWithColor:()VideosUI percentage:;
@end

@implementation UIColor(VideosUI)

+ (id)vui_opacityColorWithType:()VideosUI
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__UIColor_VideosUI__vui_opacityColorWithType___block_invoke;
  v5[3] = &__block_descriptor_48_e36___UIColor_16__0__UITraitCollection_8l;
  v5[4] = a1;
  v5[5] = a3;
  v3 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:v5];
  return v3;
}

+ (uint64_t)vui_primaryDynamicBackgroundColor
{
  return [MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (uint64_t)vui_keyColor
{
  return [MEMORY[0x1E4FB1618] systemBlueColor];
}

+ (uint64_t)vui_windowBackgroundColor
{
  return [MEMORY[0x1E4FB1618] blackColor];
}

+ (uint64_t)vui_secondaryDynamicBackgroundColor
{
  return [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
}

+ (uint64_t)vui_tertiaryDynamicBackgroundColor
{
  return [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
}

+ (uint64_t)vui_primaryTextColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)vui_secondaryTextColor
{
  return [MEMORY[0x1E4FB1618] secondaryLabelColor];
}

+ (uint64_t)vui_secondaryFillColor
{
  return [MEMORY[0x1E4FB1618] _secondaryFillColor];
}

+ (uint64_t)vui_tertiaryFillColor
{
  return [MEMORY[0x1E4FB1618] _tertiaryFillColor];
}

+ (id)vui_opacityColorWithType:()VideosUI userInterfaceStyle:
{
  double v4 = 0.0;
  if (a4 == 2)
  {
    if (a3 <= 2) {
      double v4 = dbl_1E38FDC38[a3];
    }
    v5 = (void *)MEMORY[0x1E4FB1618];
    double v6 = 1.0;
  }
  else
  {
    if (a3 <= 2) {
      double v4 = dbl_1E38FDC50[a3];
    }
    v5 = (void *)MEMORY[0x1E4FB1618];
    double v6 = 0.0;
  }
  v7 = [v5 colorWithWhite:v6 alpha:v4];
  return v7;
}

+ (id)vui_keyBlueHighlightedColor
{
  v0 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  v1 = [v0 colorWithAlphaComponent:0.8];

  return v1;
}

+ (id)vui_imageBorderColor
{
  if (vui_imageBorderColor_onceToken != -1) {
    dispatch_once(&vui_imageBorderColor_onceToken, &__block_literal_global_52);
  }
  v0 = (void *)vui_imageBorderColor___imageBorderColor;
  return v0;
}

+ (id)vui_imageHighlightColor
{
  if (vui_imageHighlightColor_onceToken != -1) {
    dispatch_once(&vui_imageHighlightColor_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)vui_imageHighlightColor___imageHighlightColor;
  return v0;
}

+ (uint64_t)vui_separatorColor
{
  return [MEMORY[0x1E4FB1618] separatorColor];
}

+ (uint64_t)vui_opaqueSeparatorColor
{
  return [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
}

+ (id)vui_progressBarFillColor
{
  if (vui_progressBarFillColor_onceToken[0] != -1) {
    dispatch_once(vui_progressBarFillColor_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)vui_progressBarFillColor___fillColor;
  return v0;
}

- (id)vui_blendWithColor:()VideosUI percentage:
{
  double v5 = fmax(a2, 0.0);
  if (v5 <= 1.0) {
    double v6 = v5;
  }
  else {
    double v6 = 1.0;
  }
  double v17 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  double v10 = 0.0;
  id v7 = a4;
  [a1 getRed:&v17 green:&v16 blue:&v15 alpha:&v14];
  [v7 getRed:&v13 green:&v12 blue:&v11 alpha:&v10];

  v8 = [MEMORY[0x1E4FB1618] colorWithRed:v6 * v13 + v17 * (1.0 - v6) green:v6 * v12 + v16 * (1.0 - v6) blue:v6 * v11 + v15 * (1.0 - v6) alpha:v6 * v10 + v14 * (1.0 - v6)];
  return v8;
}

+ (id)vui_dynamicColorWithLightColor:()VideosUI darkColor:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4FB1618];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__UIColor_VideosUI__vui_dynamicColorWithLightColor_darkColor___block_invoke;
  v12[3] = &unk_1E6DF6C28;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  double v10 = [v7 colorWithDynamicProvider:v12];

  return v10;
}

@end