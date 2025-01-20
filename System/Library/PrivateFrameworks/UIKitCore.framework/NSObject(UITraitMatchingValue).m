@interface NSObject(UITraitMatchingValue)
- (uint64_t)_uikit_valueForTraitCollection:()UITraitMatchingValue;
- (uint64_t)_uikit_variesByTraitCollections;
@end

@implementation NSObject(UITraitMatchingValue)

- (uint64_t)_uikit_variesByTraitCollections
{
  return 0;
}

- (uint64_t)_uikit_valueForTraitCollection:()UITraitMatchingValue
{
  return 0;
}

@end