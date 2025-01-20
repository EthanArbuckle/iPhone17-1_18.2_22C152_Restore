@interface NWMUltravioletIndexCategoryColor
+ (NSArray)spectrum;
+ (UIColor)extreme;
+ (UIColor)high;
+ (UIColor)low;
+ (UIColor)moderate;
+ (UIColor)unknown;
+ (UIColor)veryHigh;
@end

@implementation NWMUltravioletIndexCategoryColor

+ (UIColor)low
{
  return (UIColor *)[MEMORY[0x263F1C550] systemGreenColor];
}

+ (UIColor)moderate
{
  return (UIColor *)[MEMORY[0x263F1C550] systemYellowColor];
}

+ (UIColor)high
{
  return (UIColor *)[MEMORY[0x263F1C550] systemOrangeColor];
}

+ (UIColor)veryHigh
{
  return (UIColor *)[MEMORY[0x263F1C550] systemRedColor];
}

+ (UIColor)extreme
{
  return (UIColor *)[MEMORY[0x263F1C550] systemPurpleColor];
}

+ (UIColor)unknown
{
  return (UIColor *)[MEMORY[0x263F1C550] whiteColor];
}

+ (NSArray)spectrum
{
  v2 = (void *)spectrum_ColorSpectrum;
  if (!spectrum_ColorSpectrum)
  {
    v3 = +[NWMUltravioletIndexColorIndex allIndices];
    v4 = NSStringFromSelector(sel_color);
    uint64_t v5 = [v3 valueForKeyPath:v4];
    v6 = (void *)spectrum_ColorSpectrum;
    spectrum_ColorSpectrum = v5;

    v2 = (void *)spectrum_ColorSpectrum;
  }

  return (NSArray *)v2;
}

@end