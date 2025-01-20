@interface ReferenceValueComparator
@end

@implementation ReferenceValueComparator

uint64_t ___ReferenceValueComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 CGPointValue];
  double v6 = v5;
  [v4 CGPointValue];
  double v8 = v7;

  if (v6 >= v8) {
    return v6 > v8;
  }
  else {
    return -1;
  }
}

@end