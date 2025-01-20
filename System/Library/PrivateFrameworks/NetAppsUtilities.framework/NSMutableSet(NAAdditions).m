@interface NSMutableSet(NAAdditions)
- (void)na_safeAddObject:()NAAdditions;
- (void)na_safeAddObjectsFromArray:()NAAdditions;
@end

@implementation NSMutableSet(NAAdditions)

- (void)na_safeAddObject:()NAAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (void)na_safeAddObjectsFromArray:()NAAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObjectsFromArray:");
  }
  return a1;
}

@end