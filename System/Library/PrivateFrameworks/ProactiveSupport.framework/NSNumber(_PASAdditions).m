@interface NSNumber(_PASAdditions)
+ (uint64_t)_pas_intBackedFloatNumber:()_PASAdditions;
- (float)_pas_intBackedFloatValue;
@end

@implementation NSNumber(_PASAdditions)

- (float)_pas_intBackedFloatValue
{
  LODWORD(result) = [a1 unsignedIntegerValue];
  return result;
}

+ (uint64_t)_pas_intBackedFloatNumber:()_PASAdditions
{
  return [NSNumber numberWithUnsignedInt:LODWORD(a1)];
}

@end