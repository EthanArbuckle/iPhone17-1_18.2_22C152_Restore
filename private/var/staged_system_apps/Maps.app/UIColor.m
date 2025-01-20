@interface UIColor
+ (id)_mapsCar_ColorFromRGBValues:(double)a3[3];
+ (id)_mapsCar_ColorFromRGBValues:(double)a3[3] withAlpha:(double)a4;
+ (id)_maps_colorFromHexRepresentation:(id)a3;
+ (id)_maps_darkKeyColor;
+ (id)_maps_keyColor;
+ (id)_maps_systemGrayColor;
+ (id)bannerJunctionColor;
+ (id)carPlayDashboardJunctionColor;
+ (id)carPlayJunctionColor;
+ (id)iOSJunctionColor;
+ (id)rating3;
+ (id)rating4;
+ (id)rating5;
- (double)_maps_euclideanDistanceFromColor:(id)a3;
- (id)_maps_hexRepresentation;
- (id)_maps_legibleTextColor;
@end

@implementation UIColor

+ (id)_maps_keyColor
{
  if (qword_10160EB68 != -1) {
    dispatch_once(&qword_10160EB68, &stru_1012E8AC8);
  }
  v2 = (void *)qword_10160EB60;

  return v2;
}

+ (id)rating3
{
  id v2 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.68627451 blue:0.0 alpha:1.0];

  return v2;
}

+ (id)rating4
{
  id v2 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.568627451 blue:0.0 alpha:1.0];

  return v2;
}

+ (id)rating5
{
  id v2 = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.450980392 blue:0.0 alpha:1.0];

  return v2;
}

+ (id)_maps_darkKeyColor
{
  if (qword_10160EB78 != -1) {
    dispatch_once(&qword_10160EB78, &stru_1012E8AE8);
  }
  id v2 = (void *)qword_10160EB70;

  return v2;
}

- (id)_maps_hexRepresentation
{
  Components = CGColorGetComponents([(UIColor *)self CGColor]);
  return +[NSString stringWithFormat:@"%02lX%02lX%02lX%02lX", llround(*Components * 255.0), llround(Components[1] * 255.0), llround(Components[2] * 255.0), llround(Components[3] * 255.0)];
}

+ (id)_maps_colorFromHexRepresentation:(id)a3
{
  id v3 = a3;
  if ([v3 length] == (id)8)
  {
    unsigned int v7 = 0;
    v4 = +[NSScanner scannerWithString:v3];
    [v4 scanHexInt:&v7];
    v5 = +[UIColor colorWithRed:(double)HIBYTE(v7) / 255.0 green:(double)BYTE2(v7) / 255.0 blue:(double)BYTE1(v7) / 255.0 alpha:(double)v7 / 255.0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)_maps_euclideanDistanceFromColor:(id)a3
{
  float64x2_t v9 = 0u;
  *(_OWORD *)v10 = 0u;
  id v4 = a3;
  [(UIColor *)self getRed:&v9 green:&v9.f64[1] blue:v10 alpha:&v10[1]];
  float64x2_t v7 = 0u;
  long long v8 = 0u;
  [v4 getRed:&v7 green:&v7.f64[1] blue:&v8 alpha:(char *)&v8 + 8];

  float64x2_t v5 = vsubq_f64(v9, v7);
  return sqrt(vaddvq_f64(vmulq_f64(v5, v5)) + (v10[0] - *(double *)&v8) * (v10[0] - *(double *)&v8));
}

+ (id)_maps_systemGrayColor
{
  return +[UIColor systemGrayColor];
}

+ (id)_mapsCar_ColorFromRGBValues:(double)a3[3] withAlpha:(double)a4
{
  return +[UIColor colorWithRed:*a3 green:a3[1] blue:a3[2] alpha:a4];
}

+ (id)_mapsCar_ColorFromRGBValues:(double)a3[3]
{
  return _objc_msgSend(a1, "_mapsCar_ColorFromRGBValues:withAlpha:", a3, 1.0);
}

+ (id)iOSJunctionColor
{
  return +[UIColor colorWithWhite:1.0 alpha:0.25];
}

+ (id)bannerJunctionColor
{
  return +[UIColor colorWithWhite:1.0 alpha:0.300000012];
}

+ (id)carPlayJunctionColor
{
  return +[UIColor colorWithWhite:1.0 alpha:0.3];
}

+ (id)carPlayDashboardJunctionColor
{
  id v2 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:1];
  id v3 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:0];
  v9[0] = v2;
  id v4 = +[UIColor colorWithWhite:0.0 alpha:0.3];
  v9[1] = v3;
  v10[0] = v4;
  float64x2_t v5 = +[UIColor colorWithWhite:1.0 alpha:0.3];
  v10[1] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  float64x2_t v7 = +[UIColor _dynamicColorWithColorsByTraitCollection:v6];

  return v7;
}

- (id)_maps_legibleTextColor
{
  [(UIColor *)self _luminance];
  if (v2 <= 0.699999988) {
    +[UIColor whiteColor];
  }
  else {
  id v3 = +[UIColor blackColor];
  }

  return v3;
}

@end