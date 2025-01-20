@interface UINavBarPrompt
@end

@implementation UINavBarPrompt

uint64_t __33___UINavBarPrompt_layoutSubviews__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[51];
  [v1 _labelFrame];
  return objc_msgSend(v2, "setFrame:");
}

@end