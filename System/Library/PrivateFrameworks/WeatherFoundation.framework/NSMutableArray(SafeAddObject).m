@interface NSMutableArray(SafeAddObject)
- (void)wf_safelyAddObject:()SafeAddObject;
@end

@implementation NSMutableArray(SafeAddObject)

- (void)wf_safelyAddObject:()SafeAddObject
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end