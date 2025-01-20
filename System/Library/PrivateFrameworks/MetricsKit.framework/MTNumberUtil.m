@interface MTNumberUtil
+ (double)deResDouble:(double)a3 magnitude:(int64_t)a4 significantDigits:(int64_t)a5;
+ (id)deResNumber:(id)a3;
+ (id)deResNumber:(id)a3 magnitude:(id)a4 significantDigits:(id)a5;
@end

@implementation MTNumberUtil

+ (id)deResNumber:(id)a3
{
  return +[MTNumberUtil deResNumber:a3 magnitude:0 significantDigits:0];
}

+ (id)deResNumber:(id)a3 magnitude:(id)a4 significantDigits:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = [v8 unsignedIntegerValue];
    }
    else {
      uint64_t v10 = 0x100000;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = [v9 unsignedIntegerValue];
    }
    else {
      uint64_t v12 = 2;
    }
    [v7 doubleValue];
    +[MTNumberUtil deResDouble:magnitude:significantDigits:](MTNumberUtil, "deResDouble:magnitude:significantDigits:", v10, v12);
    v11 = objc_msgSend(NSNumber, "numberWithDouble:");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (double)deResDouble:(double)a3 magnitude:(int64_t)a4 significantDigits:(int64_t)a5
{
  double result = NAN;
  if (a4 >= 1 && (a5 & 0x8000000000000000) == 0)
  {
    double v8 = (double)(unint64_t)__exp10((double)a5);
    double v9 = a3 / (double)a4 / v8;
    double v10 = floor(v9);
    double v11 = ceil(v9);
    if (v9 <= 0.0) {
      double v12 = v11;
    }
    else {
      double v12 = v10;
    }
    return v12 * v8;
  }
  return result;
}

@end