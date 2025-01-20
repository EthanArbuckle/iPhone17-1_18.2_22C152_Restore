@interface UIPopoverView
@end

@implementation UIPopoverView

uint64_t __44___UIPopoverView_setPopoverBackgroundColor___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) standardChromeView];
  [v2 setPopoverBackgroundColor:*(void *)(a1 + 40)];

  v3 = *(void **)(a1 + 32);
  return [v3 setNeedsLayout];
}

uint64_t __37___UIPopoverView_setBackgroundStyle___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) standardChromeView];
  [v2 setBackgroundStyle:*(void *)(a1 + 40)];

  v3 = *(void **)(a1 + 32);
  return [v3 setNeedsLayout];
}

uint64_t __35___UIPopoverView_willMoveToWindow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutSubviews];
}

void __91___UIPopoverView_initWithFrame_backgroundViewClass_embeddedInView_contentExtendsOverArrow___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _continuousCornerRadius];
  objc_msgSend(v2, "_setContinuousCornerRadius:");
}

uint64_t __36___UIPopoverView_setArrowDirection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 416) superview];
  [v2 insertSubview:*(void *)(a1 + 40) belowSubview:*(void *)(*(void *)(a1 + 32) + 416)];

  [*(id *)(a1 + 32) layoutBelowIfNeeded];
  v3 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v3 removeFromSuperview];
}

uint64_t __40___UIPopoverView__setFrame_arrowOffset___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 416) superview];
  [v2 insertSubview:*(void *)(a1 + 40) belowSubview:*(void *)(*(void *)(a1 + 32) + 416)];

  v3 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v3, "setFrame:");
  [*(id *)(a1 + 32) layoutBelowIfNeeded];
  v4 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v4 removeFromSuperview];
}

@end