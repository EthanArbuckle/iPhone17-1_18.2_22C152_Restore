@interface UIFocusEventRecognizer
@end

@implementation UIFocusEventRecognizer

uint64_t __51___UIFocusEventRecognizer__showLinearDebugOverlay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __62___UIFocusEventRecognizer__hideLinearDebugOverlayIfNecessary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __62___UIFocusEventRecognizer__hideLinearDebugOverlayIfNecessary___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

@end