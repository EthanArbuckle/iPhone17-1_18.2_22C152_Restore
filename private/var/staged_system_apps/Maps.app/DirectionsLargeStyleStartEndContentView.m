@interface DirectionsLargeStyleStartEndContentView
+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3;
+ (BOOL)useMarkerFallback;
+ (double)bottomPadding;
+ (double)labelSpacing;
+ (double)topPadding;
+ (id)overviewFontProvider;
+ (id)subtitleDefaultFont;
+ (id)subtitleFontProvider;
+ (unint64_t)iconSize;
@end

@implementation DirectionsLargeStyleStartEndContentView

+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3
{
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  return +[DirectionsLargeStyleStepView cellMetricsForIdiom:a4];
}

+ (id)overviewFontProvider
{
  v2 = objc_retainBlock(&stru_101321480);

  return v2;
}

+ (id)subtitleFontProvider
{
  v2 = objc_retainBlock(&stru_101321340);

  return v2;
}

+ (id)subtitleDefaultFont
{
  return +[UIFont systemFontOfSize:15.0];
}

+ (double)topPadding
{
  return 43.0;
}

+ (double)labelSpacing
{
  return 16.0;
}

+ (double)bottomPadding
{
  return 32.0;
}

+ (unint64_t)iconSize
{
  return 4;
}

+ (BOOL)useMarkerFallback
{
  return 0;
}

@end