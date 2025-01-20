@interface NSValue(GrayColorResult)
+ (uint64_t)pi_valueWithGrayColorResult:()GrayColorResult;
- (uint64_t)pi_grayColorResultValue;
@end

@implementation NSValue(GrayColorResult)

- (uint64_t)pi_grayColorResultValue
{
  *(void *)(x8_0 + 64) = 0;
  *(_OWORD *)(x8_0 + 32) = 0u;
  *(_OWORD *)(x8_0 + 48) = 0u;
  *(_OWORD *)x8_0 = 0u;
  *(_OWORD *)(x8_0 + 16) = 0u;
  return [a1 getValue:x8_0];
}

+ (uint64_t)pi_valueWithGrayColorResult:()GrayColorResult
{
  return [a1 valueWithBytes:a3 objCType:"{?={?=[4d]}{?=[4d]}d}"];
}

@end