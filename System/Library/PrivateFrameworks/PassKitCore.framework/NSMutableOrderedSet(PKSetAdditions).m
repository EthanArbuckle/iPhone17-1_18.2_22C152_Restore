@interface NSMutableOrderedSet(PKSetAdditions)
- (void)pk_safelyAddObject:()PKSetAdditions;
@end

@implementation NSMutableOrderedSet(PKSetAdditions)

- (void)pk_safelyAddObject:()PKSetAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end