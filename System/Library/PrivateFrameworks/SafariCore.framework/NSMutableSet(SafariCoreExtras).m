@interface NSMutableSet(SafariCoreExtras)
- (void)safari_addObjectUnlessNil:()SafariCoreExtras;
- (void)safari_setObject:()SafariCoreExtras;
@end

@implementation NSMutableSet(SafariCoreExtras)

- (void)safari_setObject:()SafariCoreExtras
{
}

- (void)safari_addObjectUnlessNil:()SafariCoreExtras
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end