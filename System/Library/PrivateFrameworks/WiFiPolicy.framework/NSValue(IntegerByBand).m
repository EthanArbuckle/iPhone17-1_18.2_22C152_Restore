@interface NSValue(IntegerByBand)
+ (uint64_t)valuewithIntegerByBand:()IntegerByBand;
- (uint64_t)integerByBandValue;
@end

@implementation NSValue(IntegerByBand)

+ (uint64_t)valuewithIntegerByBand:()IntegerByBand
{
  return [a1 valueWithBytes:a3 objCType:"{?=[3q][3B]}"];
}

- (uint64_t)integerByBandValue
{
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return [a1 getValue:x8_0];
}

@end