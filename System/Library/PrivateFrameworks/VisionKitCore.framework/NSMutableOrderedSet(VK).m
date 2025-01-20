@interface NSMutableOrderedSet(VK)
- (void)vk_addNonNilObject:()VK;
@end

@implementation NSMutableOrderedSet(VK)

- (void)vk_addNonNilObject:()VK
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

@end