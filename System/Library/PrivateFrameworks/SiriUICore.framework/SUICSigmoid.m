@interface SUICSigmoid
+ (float)sigmoid:(float)a3;
+ (float)sigmoid_norm:(float)a3;
@end

@implementation SUICSigmoid

+ (float)sigmoid:(float)a3
{
  float result = 0.0;
  if (a3 > -10.0)
  {
    float result = 1.0;
    if (a3 < 10.0) {
      return sigmoid_vals[(int)((a3 + 10.0) * 10.0)];
    }
  }
  return result;
}

+ (float)sigmoid_norm:(float)a3
{
  *(float *)&double v3 = a3 * 12.0;
  [a1 sigmoid:v3];
  return result;
}

@end