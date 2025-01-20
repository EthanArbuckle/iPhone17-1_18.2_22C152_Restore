@interface HIDTouchEventCallback
@end

@implementation HIDTouchEventCallback

void ____HIDTouchEventCallback_block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotification:*(void *)(a1 + 32)];
}

@end