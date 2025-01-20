@interface UITextFieldCanvasView
@end

@implementation UITextFieldCanvasView

uint64_t __41___UITextFieldCanvasView_drawTextInRect___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawGlyphsForGlyphRange:atPoint:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end