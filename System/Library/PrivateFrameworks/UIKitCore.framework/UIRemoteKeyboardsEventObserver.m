@interface UIRemoteKeyboardsEventObserver
@end

@implementation UIRemoteKeyboardsEventObserver

uint64_t __57___UIRemoteKeyboardsEventObserver__isTrackingPencilTouch__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 type];
  if (result == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end