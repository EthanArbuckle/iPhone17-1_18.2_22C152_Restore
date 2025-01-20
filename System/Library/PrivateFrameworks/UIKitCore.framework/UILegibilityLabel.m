@interface UILegibilityLabel
@end

@implementation UILegibilityLabel

uint64_t __33___UILegibilityLabel_updateImage__block_invoke(uint64_t a1)
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v3 = 0;
  }
  else {
    v3 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  [*(id *)(a1 + 32) bounds];
  double MinX = CGRectGetMinX(v11);
  CGFloat v5 = MinX - CGRectGetMinX(*(CGRect *)(a1 + 48));
  [*(id *)(a1 + 32) bounds];
  double MinY = CGRectGetMinY(v12);
  CGFloat v7 = CGRectGetMinY(*(CGRect *)(a1 + 48));
  CGContextTranslateCTM(v3, v5, MinY - v7);
  v8 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) bounds];
  return objc_msgSend(v8, "drawInRect:");
}

@end