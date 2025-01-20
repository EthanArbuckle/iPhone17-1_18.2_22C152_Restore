@interface UIPageIndicatorImageView
@end

@implementation UIPageIndicatorImageView

uint64_t __38___UIPageIndicatorImageView_setImage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) center];
  double v3 = v2;
  double v5 = v4;
  [*(id *)(a1 + 32) sizeToFit];
  v6 = *(void **)(a1 + 32);
  return objc_msgSend(v6, "setCenter:", v3, v5);
}

@end