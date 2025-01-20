@interface WiFiManagerNotificationCallback
@end

@implementation WiFiManagerNotificationCallback

uint64_t ___WiFiManagerNotificationCallback_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _askToJoinNotification:*(unsigned int *)(a1 + 40)];
}

void ___WiFiManagerNotificationCallback_block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _trustNotificationWithID:*(unsigned int *)(a1 + 56) network:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) data:*(void *)(a1 + 40)];
  v2 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void ___WiFiManagerNotificationCallback_block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _joinRecommendationWithID:*(unsigned int *)(a1 + 48) network:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

@end