@interface OAVShadow
+ (id)readFromManager:(id)a3;
@end

@implementation OAVShadow

+ (id)readFromManager:(id)a3
{
  id v3 = a3;
  if ([v3 isShadowed])
  {
    v4 = objc_alloc_init(OADOuterShadowEffect);
    v5 = [v3 shadowColor];
    [v3 shadowAlpha];
    v6 = +[OAVColor readColorFromAttribute:alpha:manager:](OAVColor, "readColorFromAttribute:alpha:manager:", v5, v3);
    [(OADShadowEffect *)v4 setColor:v6];
    LODWORD(v7) = 1.0;
    [(OADShadowEffect *)v4 setBlurRadius:v7];
    [v3 shadowOffsets];
    long double v9 = v8;
    long double v11 = v10;
    long double v12 = hypot(v8, v10);
    *(float *)&long double v12 = v12;
    [(OADShadowEffect *)v4 setDistance:(double)v12];
    long double v13 = atan2(v11, v9) * 57.2957795;
    *(float *)&long double v13 = v13;
    [(OADShadowEffect *)v4 setAngle:(double)v13];
    v14 = [MEMORY[0x263EFF8C0] arrayWithObject:v4];
  }
  else
  {
    v14 = [MEMORY[0x263EFF8C0] array];
  }

  return v14;
}

@end