@interface HandleMotionManagerNotification
@end

@implementation HandleMotionManagerNotification

void ___HandleMotionManagerNotification_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) consumer];
  [v2 updateEventProviderStatus:*(void *)(a1 + 40)];
}

@end