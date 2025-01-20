@interface UIPopoverLegacyChromeView
@end

@implementation UIPopoverLegacyChromeView

uint64_t __45___UIPopoverLegacyChromeView_didMoveToWindow__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadNecessaryViews];
  uint64_t result = [*(id *)(a1 + 32) isPinned];
  *(unsigned char *)(*(void *)(a1 + 32) + 538) = result;
  return result;
}

@end