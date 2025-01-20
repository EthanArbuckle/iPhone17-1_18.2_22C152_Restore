@interface UIColor(SBHAdditions)
+ (id)sbh_colorWithHexString:()SBHAdditions;
+ (uint64_t)sbh_brightColorWithRandomHue;
+ (uint64_t)sbh_randomColor;
- (CGColor)sbh_isGrayscale;
- (uint64_t)sbh_colorfulness;
- (uint64_t)sbh_perceivedLightness;
@end

@implementation UIColor(SBHAdditions)

- (uint64_t)sbh_colorfulness
{
  if (objc_msgSend(a1, "sbh_isGrayscale")) {
    return objc_msgSend(a1, "sbh_perceivedLightness");
  }
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  [a1 getHue:&v6 saturation:&v5 brightness:&v4 alpha:&v3];
  return objc_msgSend(a1, "sbh_perceivedLightness");
}

- (CGColor)sbh_isGrayscale
{
  id v1 = a1;
  result = (CGColor *)[v1 CGColor];
  if (result)
  {
    result = CGColorGetColorSpace(result);
    if (result)
    {
      uint64_t v3 = result;
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

- (uint64_t)sbh_perceivedLightness
{
  uint64_t v1 = [a1 CGColor];
  return MEMORY[0x1F4113E70](v1);
}

+ (uint64_t)sbh_randomColor
{
  double v2 = (double)arc4random_uniform(0xFEu) / 255.0;
  double v3 = (double)arc4random_uniform(0xFEu) / 255.0;
  double v4 = (double)arc4random_uniform(0xFEu) / 255.0;
  return [a1 colorWithRed:v2 green:v3 blue:v4 alpha:1.0];
}

+ (uint64_t)sbh_brightColorWithRandomHue
{
  double v2 = (double)arc4random_uniform(0xFEu) / 255.0;
  return [a1 colorWithHue:v2 saturation:1.0 brightness:1.0 alpha:1.0];
}

+ (id)sbh_colorWithHexString:()SBHAdditions
{
  id v3 = a3;
  if (!v3)
  {
    double v5 = 0;
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  double v4 = v3;
  double v5 = [v3 uppercaseString];

  if ([v5 hasPrefix:@"#"])
  {
    uint64_t v6 = [v5 substringFromIndex:1];

    double v5 = (void *)v6;
  }
  if ([v5 length] != 6) {
    goto LABEL_9;
  }
  v7 = [MEMORY[0x1E4F28FE8] scannerWithString:v5];
  [v7 setScanLocation:0];
  unsigned int v10 = 0;
  v8 = 0;
  if ([v7 scanHexInt:&v10])
  {
    v8 = [MEMORY[0x1E4FB1618] colorWithRed:(float)((float)(unsigned __int16)(-255 * ((unsigned __int16)((32897 * HIWORD(v10)) >> 16) >> 7)+ HIWORD(v10))/ 255.0) green:(float)((float)(-255 * (v10 / 0xFF00) + (v10 >> 8)) / 255.0) blue:(float)((float)v10 / 255.0) alpha:1.0];
  }

LABEL_10:
  return v8;
}

@end