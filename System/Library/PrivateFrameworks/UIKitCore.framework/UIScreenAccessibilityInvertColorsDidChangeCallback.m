@interface UIScreenAccessibilityInvertColorsDidChangeCallback
@end

@implementation UIScreenAccessibilityInvertColorsDidChangeCallback

void ___UIScreenAccessibilityInvertColorsDidChangeCallback_block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C108260]();
  v3 = [*(id *)(a1 + 32) _softwareDimmingWindow];
  [v3 updateOverlayColor];
}

@end