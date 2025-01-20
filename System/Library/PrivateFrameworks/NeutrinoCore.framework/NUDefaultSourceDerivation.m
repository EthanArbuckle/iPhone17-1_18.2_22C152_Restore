@interface NUDefaultSourceDerivation
- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleFromOriginalSize:(id)a3 derivativeSize:(id)a4;
- (int64_t)orientationFromOriginal:(int64_t)a3 derivativeOrientation:(int64_t)a4;
@end

@implementation NUDefaultSourceDerivation

- (int64_t)orientationFromOriginal:(int64_t)a3 derivativeOrientation:(int64_t)a4
{
  return a4;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scaleFromOriginalSize:(id)a3 derivativeSize:(id)a4
{
  if (a3.var0 < 1 || a3.var1 <= 0)
  {
    int64_t var0 = *((void *)&NUScaleOne + 1);
    int64_t var1 = NUScaleOne;
  }
  else
  {
    if (a3.var0 <= (unint64_t)a3.var1) {
      int64_t var1 = a4.var1;
    }
    else {
      int64_t var1 = a4.var0;
    }
    if (a3.var0 <= (unint64_t)a3.var1) {
      int64_t var0 = a3.var1;
    }
    else {
      int64_t var0 = a3.var0;
    }
  }
  result.int64_t var1 = var0;
  result.int64_t var0 = var1;
  return result;
}

@end