@interface UIButton
@end

@implementation UIButton

uint64_t __72__UIButton_PhotosUI__pu_sendActionForControlEventsWithHighlightTimeout___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:0];
}

void __78__UIButton_PhotosUI__pu_setTitle_andAccessibilityTitle_withFallback_forState___block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  pu_setTitle_andAccessibilityTitle_withFallback_forState__forceFallback = [v0 BOOLForKey:@"NSDoubleLocalizedStrings"];
}

@end