@interface NSPointerArray(UserNotificationsUIKitAdditions)
- (uint64_t)unui_compact;
@end

@implementation NSPointerArray(UserNotificationsUIKitAdditions)

- (uint64_t)unui_compact
{
  uint64_t result = [a1 count];
  if (result)
  {
    uint64_t v3 = result - 1;
    do
    {
      uint64_t result = [a1 pointerAtIndex:v3];
      if (!result) {
        uint64_t result = [a1 removePointerAtIndex:v3];
      }
      --v3;
    }
    while (v3 != -1);
  }
  return result;
}

@end