@interface UIFont(WeatherUI)
+ (uint64_t)wu_systemUsesExuberatedLineHeight;
- (double)wu_exuberatedLineHeightAmount;
- (double)wu_lineHeightNotIncludingExuberatedAmount;
- (uint64_t)wu_usesExuberatedLineHeight;
@end

@implementation UIFont(WeatherUI)

+ (uint64_t)wu_systemUsesExuberatedLineHeight
{
  return MEMORY[0x1F40DF5E0](0);
}

- (uint64_t)wu_usesExuberatedLineHeight
{
  return MEMORY[0x1F40DF5E0](a1);
}

- (double)wu_exuberatedLineHeightAmount
{
  [a1 lineHeight];
  double v2 = v1;
  CTFontGetExuberatedLineHeightForLineHeight();
  return v3 - v2;
}

- (double)wu_lineHeightNotIncludingExuberatedAmount
{
  [a1 lineHeight];
  double v3 = v2;
  objc_msgSend(a1, "wu_exuberatedLineHeightAmount");
  return v3 - v4;
}

@end