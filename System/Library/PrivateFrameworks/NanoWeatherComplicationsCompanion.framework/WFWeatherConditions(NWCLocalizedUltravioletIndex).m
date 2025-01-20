@interface WFWeatherConditions(NWCLocalizedUltravioletIndex)
+ (NSArray)nwc_ultravioletIndexCategoryColorSpectrum;
+ (UIColor)nwc_ultravioletIndexCategoryColorUnknown;
+ (id)nwc_ultravioletIndexCategoryColorForNumber:()NWCLocalizedUltravioletIndex;
- (id)nwc_ultravioletIndexCategoryColor;
- (uint64_t)nwc_ultravioletIndexCategory;
@end

@implementation WFWeatherConditions(NWCLocalizedUltravioletIndex)

- (uint64_t)nwc_ultravioletIndexCategory
{
  v1 = [a1 objectForKeyedSubscript:*MEMORY[0x263F86058]];
  v2 = v1;
  if (v1)
  {
    [v1 floatValue];
    if (v3 >= 0.0 && v3 < 3.0)
    {
      uint64_t v9 = 0;
      goto LABEL_27;
    }
    if (v3 >= 3.0 && v3 < 6.0)
    {
      uint64_t v9 = 1;
      goto LABEL_27;
    }
    if (v3 >= 6.0 && v3 < 8.0)
    {
      uint64_t v9 = 2;
      goto LABEL_27;
    }
    if (v3 >= 8.0 && v3 < 11.0)
    {
      uint64_t v9 = 3;
      goto LABEL_27;
    }
    double v8 = v3;
  }
  else
  {
    double v8 = -1.0;
  }
  if (v8 >= 11.0) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = 5;
  }
LABEL_27:

  return v9;
}

+ (NSArray)nwc_ultravioletIndexCategoryColorSpectrum
{
  return +[NWMUltravioletIndexCategoryColor spectrum];
}

+ (UIColor)nwc_ultravioletIndexCategoryColorUnknown
{
  return +[NWMUltravioletIndexCategoryColor unknown];
}

+ (id)nwc_ultravioletIndexCategoryColorForNumber:()NWCLocalizedUltravioletIndex
{
  if (a3)
  {
    [a3 doubleValue];
    +[NWKUIColorIndex colorForValue:](NWMUltravioletIndexColorIndex, "colorForValue:");
  }
  else
  {
    +[NWMUltravioletIndexCategoryColor unknown];
  float v3 = };

  return v3;
}

- (id)nwc_ultravioletIndexCategoryColor
{
  v1 = [a1 objectForKeyedSubscript:*MEMORY[0x263F86058]];
  v2 = v1;
  if (v1)
  {
    [v1 doubleValue];
    +[NWKUIColorIndex colorForValue:](NWMUltravioletIndexColorIndex, "colorForValue:");
  }
  else
  {
    +[NWMUltravioletIndexCategoryColor unknown];
  float v3 = };

  return v3;
}

@end