@interface UIColor(Utilities)
+ (uint64_t)vk_randomColor;
- (id)vk_colorWithMaxSaturation;
- (uint64_t)vk_colorWith20PercentOpacity;
- (uint64_t)vk_colorWith40PercentOpacity;
- (uint64_t)vk_colorWith60PercentOpacity;
- (uint64_t)vk_colorWith80PercentOpacity;
- (uint64_t)vk_resolvedColor;
@end

@implementation UIColor(Utilities)

+ (uint64_t)vk_randomColor
{
  double v0 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v1 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v2 = (double)arc4random_uniform(0xFFu) / 255.0;
  v3 = (void *)MEMORY[0x1E4F428B8];
  return [v3 colorWithRed:v0 green:v1 blue:v2 alpha:1.0];
}

- (uint64_t)vk_colorWith20PercentOpacity
{
  return [a1 colorWithAlphaComponent:0.2];
}

- (uint64_t)vk_colorWith40PercentOpacity
{
  return [a1 colorWithAlphaComponent:0.4];
}

- (uint64_t)vk_colorWith60PercentOpacity
{
  return [a1 colorWithAlphaComponent:0.6];
}

- (uint64_t)vk_colorWith80PercentOpacity
{
  return [a1 colorWithAlphaComponent:0.8];
}

- (id)vk_colorWithMaxSaturation
{
  double v6 = 0.0;
  double v4 = 0.0;
  uint64_t v5 = 0;
  double v3 = 0.0;
  [a1 getHue:&v6 saturation:&v5 brightness:&v4 alpha:&v3];
  double v1 = [MEMORY[0x1E4F428B8] colorWithHue:v6 saturation:1.0 brightness:v4 alpha:v3];
  return v1;
}

- (uint64_t)vk_resolvedColor
{
  double v1 = (void *)MEMORY[0x1E4F428B8];
  uint64_t v2 = [a1 CGColor];
  return [v1 colorWithCGColor:v2];
}

@end