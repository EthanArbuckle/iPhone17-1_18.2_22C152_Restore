@interface NSMutableArray(Specifiers)
- (void)addSpecifier:()Specifiers;
@end

@implementation NSMutableArray(Specifiers)

- (void)addSpecifier:()Specifiers
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end