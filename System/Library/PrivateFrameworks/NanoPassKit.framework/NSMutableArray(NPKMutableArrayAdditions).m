@interface NSMutableArray(NPKMutableArrayAdditions)
- (void)npkSafelyAddObject:()NPKMutableArrayAdditions;
@end

@implementation NSMutableArray(NPKMutableArrayAdditions)

- (void)npkSafelyAddObject:()NPKMutableArrayAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end