@interface NSMutableArray(TSSStyleAdditions)
- (uint64_t)addProperty:()TSSStyleAdditions;
@end

@implementation NSMutableArray(TSSStyleAdditions)

- (uint64_t)addProperty:()TSSStyleAdditions
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");

  return [a1 addObject:v2];
}

@end