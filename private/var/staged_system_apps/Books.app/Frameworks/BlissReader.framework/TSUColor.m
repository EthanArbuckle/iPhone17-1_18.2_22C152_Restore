@interface TSUColor
- (double)relativeLuminance;
@end

@implementation TSUColor

- (double)relativeLuminance
{
  [(TSUColor *)self getRGBAComponents:v6];
  for (uint64_t i = 0; i != 3; ++i)
  {
    double v3 = v6[i];
    if (v3 <= 0.03928) {
      double v4 = v3 / 12.92;
    }
    else {
      double v4 = pow((v3 + 0.055) / 1.055, 2.4);
    }
    v6[i] = v4;
  }
  return v6[1] * 0.7152 + v6[0] * 0.2126 + v6[2] * 0.0722;
}

@end