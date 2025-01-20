@interface UIScreenBacklightLevelDidChangeCallback
@end

@implementation UIScreenBacklightLevelDidChangeCallback

void ___UIScreenBacklightLevelDidChangeCallback_block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C108260]();
  [*(id *)(a1 + 32) _postBrightnessDidChangeNotificationIfAppropriate];
}

@end