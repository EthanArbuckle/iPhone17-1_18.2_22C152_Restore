@interface _SFSiteIcon
+ (CGSize)defaultSize;
+ (CGSize)minimumAcceptableSizeForDownloadedIcon;
+ (CGSize)sizeForIconSize:(int64_t)a3;
+ (double)cornerRadius;
+ (double)fontPointSizeForIconSize:(int64_t)a3;
+ (double)labelWidthForIconSize:(int64_t)a3;
+ (id)defaultGlyph;
+ (id)defaultIconKeyColor;
+ (id)precompositedDefaultIcon;
+ (int64_t)_defaultIconSize;
@end

@implementation _SFSiteIcon

+ (double)labelWidthForIconSize:(int64_t)a3
{
  double result = 46.0;
  if (a3 != 1) {
    double result = 22.0;
  }
  if (a3 == 2) {
    return 56.0;
  }
  return result;
}

+ (double)fontPointSizeForIconSize:(int64_t)a3
{
  double result = 37.0;
  if (a3 != 1) {
    double result = 18.0;
  }
  if (a3 == 2) {
    return 44.0;
  }
  return result;
}

+ (CGSize)sizeForIconSize:(int64_t)a3
{
  double v3 = 32.0;
  if (a3 == 1) {
    double v3 = 60.0;
  }
  if (a3 == 2) {
    double v3 = 76.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)minimumAcceptableSizeForDownloadedIcon
{
  double v2 = 57.0;
  double v3 = 57.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)defaultSize
{
  uint64_t v3 = [a1 _defaultIconSize];

  [a1 sizeForIconSize:v3];
  result.height = v5;
  result.width = v4;
  return result;
}

+ (int64_t)_defaultIconSize
{
  if (_SFDeviceIsPad()) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (double)cornerRadius
{
  return 10.0;
}

+ (id)defaultIconKeyColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_58];
}

+ (id)defaultGlyph
{
  objc_msgSend(a1, "fontPointSizeForIconSize:", objc_msgSend(a1, "_defaultIconSize"));
  double v2 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithPointSize:weight:scale:", 3, 2);
  uint64_t v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"safari" withConfiguration:v2];
  double v4 = [MEMORY[0x1E4FB1618] whiteColor];
  double v5 = [v3 flattenedImageWithColor:v4];

  v6 = [v5 imageWithRenderingMode:1];

  return v6;
}

+ (id)precompositedDefaultIcon
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39___SFSiteIcon_precompositedDefaultIcon__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (precompositedDefaultIcon_onceToken != -1) {
    dispatch_once(&precompositedDefaultIcon_onceToken, block);
  }
  double v2 = (void *)precompositedDefaultIcon_icon;

  return v2;
}

@end