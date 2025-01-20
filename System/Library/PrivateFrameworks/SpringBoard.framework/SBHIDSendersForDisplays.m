@interface SBHIDSendersForDisplays
@end

@implementation SBHIDSendersForDisplays

uint64_t ___SBHIDSendersForDisplays_block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAssociatedDisplay:*(void *)(a1 + 32)];
}

@end