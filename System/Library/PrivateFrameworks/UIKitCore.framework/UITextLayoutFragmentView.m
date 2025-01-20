@interface UITextLayoutFragmentView
@end

@implementation UITextLayoutFragmentView

void __38___UITextLayoutFragmentView_drawRect___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layoutFragment];
  objc_msgSend(v2, "drawAtPoint:inContext:", *(void *)(a1 + 40), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

@end