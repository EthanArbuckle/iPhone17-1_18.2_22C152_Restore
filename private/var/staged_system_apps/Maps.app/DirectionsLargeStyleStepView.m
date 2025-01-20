@interface DirectionsLargeStyleStepView
+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3;
+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics;
+ (Class)_labelListViewClassForRoute:(id)a3 step:(id)a4;
+ (double)_textWidthForWidth:(double)a3 metrics:(id *)a4;
+ (double)heightForWidth:(double)a3 route:(id)a4 step:(id)a5 idiom:(int64_t)a6;
+ (unint64_t)signViewIconSize;
@end

@implementation DirectionsLargeStyleStepView

+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3
{
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  v7.receiver = a2;
  v7.super_class = (Class)&OBJC_METACLASS___DirectionsLargeStyleStepView;
  result = ($8452678F12DBC466148836A9D382CAFC *)-[$8452678F12DBC466148836A9D382CAFC cellMetricsForIdiom:](&v7, "cellMetricsForIdiom:");
  if (a4 != 5)
  {
    *(int64x2_t *)&retstr->var7 = vdupq_n_s64(0x4055800000000000uLL);
    *(_OWORD *)&retstr->var3 = xmmword_100F727B0;
  }
  return result;
}

+ (double)_textWidthForWidth:(double)a3 metrics:(id *)a4
{
  return a3 - (a4->var5 + a4->var6 + a4->var4 + a4->var7);
}

+ (double)heightForWidth:(double)a3 route:(id)a4 step:(id)a5 idiom:(int64_t)a6
{
  uint64_t v23 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = a5;
  id v11 = a4;
  v12 = objc_opt_class();
  if (v12)
  {
    [v12 cellMetricsForIdiom:a6];
  }
  else
  {
    uint64_t v23 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
  }
  id v13 = [a1 _labelListViewClassForRoute:v11 step:v10];
  v17[2] = v21;
  v17[3] = v22;
  uint64_t v18 = v23;
  v17[0] = v19;
  v17[1] = v20;
  [a1 _textWidthForWidth:v17 metrics:a3];
  [v13 heightForWidth:v11 route:v10 step:a6 idiom:];
  double v15 = v14;

  double result = v15 + 64.0;
  if (v15 + 64.0 <= *((double *)&v20 + 1)) {
    return *((double *)&v20 + 1);
  }
  return result;
}

+ (Class)_labelListViewClassForRoute:(id)a3 step:(id)a4
{
  return (Class)objc_opt_class();
}

+ ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics
{
  return +[SignStyle arrowMetricsForStyle:scaledToMatchReferenceSize:forView:](SignStyle, "arrowMetricsForStyle:scaledToMatchReferenceSize:forView:", 0, 0, 65.0, 65.0);
}

+ (unint64_t)signViewIconSize
{
  return 3;
}

@end