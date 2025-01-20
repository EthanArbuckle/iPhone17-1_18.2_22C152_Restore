@interface WFEventSignificantFigureValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)transformedValue:(id)a3;
@end

@implementation WFEventSignificantFigureValueTransformer

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  if (a3)
  {
    [a3 floatValue];
    float v5 = v4;
    double v6 = log10(fabsf(v4));
    double v7 = __exp10((double)(int)(vcvtpd_s64_f64(v6) - 2));
    v8 = [NSNumber numberWithDouble:v7 * round(v5 / v7)];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end