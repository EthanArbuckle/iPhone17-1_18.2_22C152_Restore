@interface UIView
@end

@implementation UIView

uint64_t __88__UIView_SBHAdditions__scaleAndBlurForDuration_initiallyHidden_visibleAlpha_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.001, 0.001);
  [v2 setTransform:&v4];
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __88__UIView_SBHAdditions__scaleAndBlurForDuration_initiallyHidden_visibleAlpha_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    double v2 = *(double *)(a1 + 40);
    memset(&v8, 0, sizeof(v8));
    CGFloat v3 = 1.0;
    CGFloat v4 = 1.0;
  }
  else
  {
    memset(&v8, 0, sizeof(v8));
    double v2 = 0.001;
    CGFloat v3 = 0.001;
    CGFloat v4 = 0.001;
  }
  CGAffineTransformMakeScale(&v8, v3, v4);
  [*(id *)(a1 + 32) setAlpha:v2];
  v5 = *(void **)(a1 + 32);
  CGAffineTransform v7 = v8;
  return [v5 setTransform:&v7];
}

uint64_t __88__UIView_SBHAdditions__scaleAndBlurForDuration_initiallyHidden_visibleAlpha_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end