@interface GuidanceModernBannerSignStyle
+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetricsForStyle:(SEL)a3;
+ (id)sharedSignStyle;
- (id)accentColor;
- (id)foregroundColor;
@end

@implementation GuidanceModernBannerSignStyle

+ (id)sharedSignStyle
{
  if (qword_101610C08 != -1) {
    dispatch_once(&qword_101610C08, &stru_10131C5E8);
  }
  v2 = (void *)qword_101610C00;

  return v2;
}

- (id)foregroundColor
{
  return +[UIColor whiteColor];
}

- (id)accentColor
{
  v2 = [(GuidanceModernBannerSignStyle *)self foregroundColor];
  v3 = [v2 colorWithAlphaComponent:0.959999979];

  return v3;
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetricsForStyle:(SEL)a3
{
  *(_OWORD *)&retstr->var59 = 0u;
  *(_OWORD *)&retstr->var61 = 0u;
  *(_OWORD *)&retstr->var55 = 0u;
  *(_OWORD *)&retstr->var57 = 0u;
  *(_OWORD *)&retstr->var51 = 0u;
  *(_OWORD *)&retstr->var53 = 0u;
  *(_OWORD *)&retstr->var47 = 0u;
  *(_OWORD *)&retstr->var49 = 0u;
  *(_OWORD *)&retstr->var40 = 0u;
  *(_OWORD *)&retstr->var45 = 0u;
  *(_OWORD *)&retstr->var36 = 0u;
  *(_OWORD *)&retstr->var38 = 0u;
  *(_OWORD *)&retstr->var32 = 0u;
  *(_OWORD *)&retstr->var34 = 0u;
  *(_OWORD *)&retstr->var28 = 0u;
  *(_OWORD *)&retstr->var30 = 0u;
  *(_OWORD *)&retstr->var24 = 0u;
  *(_OWORD *)&retstr->var26 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var22 = 0u;
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var1.height = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  result = +[SignStyle arrowMetricsForStyle:0];
  retstr->var1 = (CGSize)xmmword_100F73A10;
  retstr->var16 = 30.0;
  return result;
}

@end