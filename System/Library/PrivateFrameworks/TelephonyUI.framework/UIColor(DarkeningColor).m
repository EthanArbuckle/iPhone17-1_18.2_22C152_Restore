@interface UIColor(DarkeningColor)
- (id)colorByAlteringOpacityToPercentage:()DarkeningColor;
- (id)darkerColorByPercentage:()DarkeningColor;
@end

@implementation UIColor(DarkeningColor)

- (id)darkerColorByPercentage:()DarkeningColor
{
  double v6 = 0.0;
  double v7 = 0.0;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  int v1 = [a1 getHue:&v7 saturation:&v6 brightness:&v5 alpha:&v4];
  v2 = 0;
  if (v1)
  {
    v2 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithHue:saturation:brightness:alpha:", v7, v6);
  }
  return v2;
}

- (id)colorByAlteringOpacityToPercentage:()DarkeningColor
{
  double v8 = 0.0;
  double v9 = 0.0;
  uint64_t v6 = 0;
  double v7 = 0.0;
  int v3 = [a1 getRed:&v9 green:&v8 blue:&v7 alpha:&v6];
  uint64_t v4 = 0;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithRed:v9 green:v8 blue:v7 alpha:a2];
  }
  return v4;
}

@end