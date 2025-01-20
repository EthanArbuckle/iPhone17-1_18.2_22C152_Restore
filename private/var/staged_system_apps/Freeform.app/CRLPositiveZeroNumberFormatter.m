@interface CRLPositiveZeroNumberFormatter
- (id)stringForObjectValue:(id)a3;
@end

@implementation CRLPositiveZeroNumberFormatter

- (id)stringForObjectValue:(id)a3
{
  v4 = (_UNKNOWN **)a3;
  if (objc_opt_respondsToSelector())
  {
    [v4 floatValue];
    double v6 = v5;
    v7 = [(CRLPositiveZeroNumberFormatter *)self multiplier];
    [v7 floatValue];
    float v9 = v8;

    double v10 = v9;
    if (v9 == 0.0) {
      double v10 = 1.0;
    }
    double v11 = v10 * v6;
    double v12 = pow(0.1, (double)(unint64_t)[(CRLPositiveZeroNumberFormatter *)self maximumFractionDigits])* -0.5;
    if (v11 <= 0.0 && v11 > v12)
    {

      v4 = &off_10155D910;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)CRLPositiveZeroNumberFormatter;
  v14 = [(CRLPositiveZeroNumberFormatter *)&v16 stringForObjectValue:v4];

  return v14;
}

@end