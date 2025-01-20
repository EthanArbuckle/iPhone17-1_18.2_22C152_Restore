@interface NSArray(CACElement)
- (uint64_t)isVisuallyEqualToArray:()CACElement;
@end

@implementation NSArray(CACElement)

- (uint64_t)isVisuallyEqualToArray:()CACElement
{
  return [a1 axIsEqualToOrderedArray:a3 withPredicate:&__block_literal_global_740];
}

@end