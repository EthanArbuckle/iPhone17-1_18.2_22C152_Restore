@interface WiFiManagerDeviceClientCallback
@end

@implementation WiFiManagerDeviceClientCallback

uint64_t ___WiFiManagerDeviceClientCallback_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWithDeviceAttachment:*(void *)(a1 + 40)];
}

@end