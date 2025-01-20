@interface CFUserNotificationCallback
@end

@implementation CFUserNotificationCallback

BOOL ___CFUserNotificationCallback_block_invoke(uint64_t a1, void *a2)
{
  return [a2 notification] == *(void *)(a1 + 32);
}

@end