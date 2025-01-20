@interface OITSUPositiveZeroNumberFormatter
- (id)stringForObjectValue:(id)a3;
@end

@implementation OITSUPositiveZeroNumberFormatter

- (id)stringForObjectValue:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [a3 floatValue];
    double v6 = v5;
    objc_msgSend((id)-[OITSUPositiveZeroNumberFormatter multiplier](self, "multiplier"), "floatValue");
    double v8 = v7;
    BOOL v9 = v7 == 0.0;
    double v10 = 1.0;
    if (!v9) {
      double v10 = v8;
    }
    double v11 = v10 * v6;
    if (v11 > pow(0.1, (double)(unint64_t)[(OITSUPositiveZeroNumberFormatter *)self maximumFractionDigits])* -0.5&& v11 <= 0.0)
    {
      a3 = &unk_26EC80C18;
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)OITSUPositiveZeroNumberFormatter;
  return [(OITSUPositiveZeroNumberFormatter *)&v14 stringForObjectValue:a3];
}

@end