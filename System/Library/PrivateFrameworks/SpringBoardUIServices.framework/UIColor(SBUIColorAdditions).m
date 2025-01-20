@interface UIColor(SBUIColorAdditions)
+ (id)sbui_systemColorNamed:()SBUIColorAdditions;
+ (uint64_t)sbui_randomColor;
- (CGColor)sb_isGrayscale;
- (double)sb_brightness;
@end

@implementation UIColor(SBUIColorAdditions)

+ (id)sbui_systemColorNamed:()SBUIColorAdditions
{
  if (aSelectorName)
  {
    SEL v4 = NSSelectorFromString(aSelectorName);
    if (objc_opt_respondsToSelector()) {
      v5 = (void *)[MEMORY[0x1E4F428B8] performSelector:v4];
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (uint64_t)sbui_randomColor
{
  v0 = objc_opt_class();
  double v1 = (double)arc4random_uniform(0xFEu) / 255.0;
  double v2 = (double)arc4random_uniform(0xFEu) / 255.0;
  double v3 = (double)arc4random_uniform(0xFEu) / 255.0;
  return [v0 colorWithRed:v1 green:v2 blue:v3 alpha:1.0];
}

- (CGColor)sb_isGrayscale
{
  id v1 = a1;
  result = (CGColor *)[v1 CGColor];
  if (result)
  {
    result = CGColorGetColorSpace(result);
    if (result)
    {
      double v3 = result;
      result = (CGColor *)1;
      if (CGColorSpaceGetType())
      {
        if (CGColorSpaceGetModel(v3))
        {
          double v5 = 0.0;
          double v6 = 0.0;
          double v4 = 0.0;
          if (![v1 getRed:&v6 green:&v5 blue:&v4 alpha:0] || v6 != v5 || v5 != v4) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

- (double)sb_brightness
{
  uint64_t v5 = 0;
  double v3 = 0.0;
  uint64_t v4 = 0;
  uint64_t v2 = 0;
  [a1 getHue:&v5 saturation:&v4 brightness:&v3 alpha:&v2];
  return v3;
}

@end