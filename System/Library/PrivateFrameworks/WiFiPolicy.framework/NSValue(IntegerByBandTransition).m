@interface NSValue(IntegerByBandTransition)
+ (uint64_t)valuewithIntegerByBandTransition:()IntegerByBandTransition;
- (uint64_t)integerByBandTransitionValue;
@end

@implementation NSValue(IntegerByBandTransition)

+ (uint64_t)valuewithIntegerByBandTransition:()IntegerByBandTransition
{
  return [a1 valueWithBytes:a3 objCType:"{?=[3[3q]][3[3B]]}"];
}

- (uint64_t)integerByBandTransitionValue
{
  *(void *)(x8_0 + 80) = 0;
  *(_OWORD *)(x8_0 + 48) = 0u;
  *(_OWORD *)(x8_0 + 64) = 0u;
  *(_OWORD *)(x8_0 + 16) = 0u;
  *(_OWORD *)(x8_0 + 32) = 0u;
  *(_OWORD *)x8_0 = 0u;
  return [a1 getValue:x8_0];
}

@end