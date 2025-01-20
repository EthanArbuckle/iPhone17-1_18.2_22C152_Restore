@interface UIColor(NUCSS)
- (id)nu_colorToCSSRGBA;
@end

@implementation UIColor(NUCSS)

- (id)nu_colorToCSSRGBA
{
  double v5 = 0.0;
  double v6 = 0.0;
  double v4 = 0.0;
  uint64_t v3 = 0;
  [a1 getRed:&v6 green:&v5 blue:&v4 alpha:&v3];
  v1 = [NSString stringWithFormat:@"rgba(%.0f, %.0f, %.0f, %.0f)", v6 * 255.0, v5 * 255.0, v4 * 255.0, v3];

  return v1;
}

@end