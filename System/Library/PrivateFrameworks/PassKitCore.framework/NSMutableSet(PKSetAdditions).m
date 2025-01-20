@interface NSMutableSet(PKSetAdditions)
- (void)pk_safelyAddObject:()PKSetAdditions;
@end

@implementation NSMutableSet(PKSetAdditions)

- (void)pk_safelyAddObject:()PKSetAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end