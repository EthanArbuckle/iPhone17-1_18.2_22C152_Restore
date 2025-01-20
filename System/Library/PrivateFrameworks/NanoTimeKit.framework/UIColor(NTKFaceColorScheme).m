@interface UIColor(NTKFaceColorScheme)
- (id)ntk_colorByBoostingSaturation:()NTKFaceColorScheme lightness:;
- (id)ntk_colorWithMinLightness:()NTKFaceColorScheme;
- (id)ntk_colorWithSaturationDelta:()NTKFaceColorScheme brightnessDelta:;
- (void)ntk_colorWithLightness:()NTKFaceColorScheme;
@end

@implementation UIColor(NTKFaceColorScheme)

- (void)ntk_colorWithLightness:()NTKFaceColorScheme
{
}

- (id)ntk_colorByBoostingSaturation:()NTKFaceColorScheme lightness:
{
  double v9 = 0.0;
  double v10 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  [a1 getHue:&v10 saturation:&v9 brightness:&v8 alpha:&v7];
  v3 = [MEMORY[0x1E4FB1618] colorWithHue:v10 saturation:(a2 + 1.0) * v9 brightness:v8 alpha:v7];
  v4 = [MEMORY[0x1E4FB1618] whiteColor];
  v5 = NTKInterpolateBetweenColors();

  return v5;
}

- (id)ntk_colorWithSaturationDelta:()NTKFaceColorScheme brightnessDelta:
{
  double v9 = 0.0;
  double v10 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  [a1 getHue:&v10 saturation:&v9 brightness:&v8 alpha:&v7];
  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithHue:saturation:brightness:alpha:", v10, fmin(fmax(v9 + a2, 0.0), 1.0), fmin(fmax(v8 + a3, 0.0), 1.0), v7);
  return v5;
}

- (id)ntk_colorWithMinLightness:()NTKFaceColorScheme
{
  double v8 = 0.0;
  double v9 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  [a1 getHue:&v9 saturation:&v8 brightness:&v7 alpha:&v6];
  if (v7 >= a2) {
    double v3 = v7;
  }
  else {
    double v3 = a2;
  }
  v4 = [MEMORY[0x1E4FB1618] colorWithHue:v9 saturation:v8 brightness:v3 alpha:v6];
  return v4;
}

@end