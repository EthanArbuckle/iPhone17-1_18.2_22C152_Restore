@interface UIActionSlider
@end

@implementation UIActionSlider

uint64_t __37___UIActionSlider_openTrackAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTrackWidthProportion:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __37___UIActionSlider_openTrackAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTrackWidthProportion:1.0];
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __37___UIActionSlider_openTrackAnimated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimating:0];
  [*(id *)(a1 + 32) setCachedTrackMaskWidth:0.0];
  v2 = *(void **)(a1 + 32);
  return [v2 setNeedsLayout];
}

uint64_t __37___UIActionSlider_openTrackAnimated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showTrackLabel];
}

uint64_t __38___UIActionSlider_closeTrackAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTrackWidthProportion:0.0];
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __38___UIActionSlider_closeTrackAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimating:0];
  [*(id *)(a1 + 32) setCachedTrackMaskWidth:0.0];
  v2 = *(void **)(a1 + 32);
  return [v2 setNeedsLayout];
}

uint64_t __34___UIActionSlider__showTrackLabel__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 512) setAlpha:1.0];
}

uint64_t __35___UIActionSlider__hideTrackLabel___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 512) setAlpha:0.0];
}

void __35___UIActionSlider__slideCompleted___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  [*(id *)(a1 + 32) setKnobPosition:v2];
  [*(id *)(a1 + 32) layoutIfNeeded];
  id v3 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 actionSlider:*(void *)(a1 + 32) didUpdateSlideWithValue:v2];
  }
}

uint64_t __35___UIActionSlider__slideCompleted___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimating:0];
  [*(id *)(a1 + 32) setCachedTrackMaskWidth:0.0];
  double v2 = *(void **)(a1 + 32);
  return [v2 setNeedsLayout];
}

uint64_t __35___UIActionSlider__slideCompleted___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showTrackLabel];
}

@end