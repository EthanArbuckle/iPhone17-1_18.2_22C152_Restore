@interface TVListTemplateView
@end

@implementation TVListTemplateView

uint64_t __38___TVListTemplateView_setPreviewView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __38___TVListTemplateView_setPreviewView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __37___TVListTemplateView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 480) setAlpha:1.0];
}

@end