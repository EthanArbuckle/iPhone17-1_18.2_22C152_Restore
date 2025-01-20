@interface UIPreviewInteractionCustomViewHighlighter
@end

@implementation UIPreviewInteractionCustomViewHighlighter

uint64_t __126___UIPreviewInteractionCustomViewHighlighter_highlightShouldBeginInContainerView_presentationContainerView_previewingContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHighlighted:0];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

@end