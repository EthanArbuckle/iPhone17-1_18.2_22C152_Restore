@interface NSNumber(TSDMixingAdditions)
- (uint64_t)mixedObjectWithFraction:()TSDMixingAdditions ofObject:;
- (uint64_t)mixingTypeWithObject:()TSDMixingAdditions;
@end

@implementation NSNumber(TSDMixingAdditions)

- (uint64_t)mixingTypeWithObject:()TSDMixingAdditions
{
  if ([a1 isEqualToNumber:TSUCheckedDynamicCast()]) {
    return 5;
  }
  else {
    return 3;
  }
}

- (uint64_t)mixedObjectWithFraction:()TSDMixingAdditions ofObject:
{
  objc_opt_class();
  v2 = (void *)TSUCheckedDynamicCast();
  v3 = NSNumber;
  [a1 doubleValue];
  [v2 doubleValue];
  TSUMixFloats();

  return objc_msgSend(v3, "numberWithDouble:");
}

@end