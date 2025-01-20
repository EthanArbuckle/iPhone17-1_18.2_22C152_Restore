@interface WFEventLogarithmicBinningValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)transformedValue:(id)a3;
@end

@implementation WFEventLogarithmicBinningValueTransformer

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
    [a3 doubleValue];
    double v5 = v4;
    double v6 = log2(fabs(v4));
    long double v7 = exp2(round(v6));
    v8 = [NSNumber numberWithDouble:(double)(v7 * round(v5 / v7))];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end