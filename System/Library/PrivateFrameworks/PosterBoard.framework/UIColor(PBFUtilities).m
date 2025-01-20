@interface UIColor(PBFUtilities)
+ (uint64_t)pbf_randomColor;
@end

@implementation UIColor(PBFUtilities)

+ (uint64_t)pbf_randomColor
{
  double v0 = (double)arc4random() * 0.00390625;
  double v1 = (double)(arc4random() & 0x7F) * 0.00390625 + 0.5;
  double v2 = (double)(arc4random() & 0x7F) * 0.00390625 + 0.5;
  v3 = (void *)MEMORY[0x1E4FB1618];
  return [v3 colorWithHue:v0 saturation:v1 brightness:v2 alpha:1.0];
}

@end