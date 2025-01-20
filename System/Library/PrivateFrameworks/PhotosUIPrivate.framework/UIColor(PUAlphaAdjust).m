@interface UIColor(PUAlphaAdjust)
- (id)pu_colorWithIncreasedAlpha;
- (id)pu_colorWithIncreasedBrightness;
@end

@implementation UIColor(PUAlphaAdjust)

- (id)pu_colorWithIncreasedBrightness
{
  v7[1] = *(double *)MEMORY[0x1E4F143B8];
  if ([a1 getHue:&v4 saturation:&v5 brightness:&v6 alpha:v7])
  {
    v2 = [MEMORY[0x1E4FB1618] colorWithHue:v4 saturation:v5 brightness:v6 + 0.0500000007 alpha:v7[0]];
  }
  else if ([a1 getWhite:&v4 alpha:&v5])
  {
    v2 = [MEMORY[0x1E4FB1618] colorWithWhite:v4 + 0.0500000007 alpha:v5];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)pu_colorWithIncreasedAlpha
{
  v7[1] = *(double *)MEMORY[0x1E4F143B8];
  if ([a1 getHue:&v4 saturation:&v5 brightness:&v6 alpha:v7])
  {
    v2 = [MEMORY[0x1E4FB1618] colorWithHue:v4 saturation:v5 brightness:v6 alpha:v7[0] + 0.100000001];
  }
  else if ([a1 getWhite:&v4 alpha:&v5])
  {
    v2 = [MEMORY[0x1E4FB1618] colorWithWhite:v4 alpha:v5 + 0.100000001];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end