@interface TVRelatedContentShelfView
@end

@implementation TVRelatedContentShelfView

uint64_t __48___TVRelatedContentShelfView__layoutRelatedView__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 40) + 432);
  return [v2 setAlpha:1.0];
}

uint64_t __48___TVRelatedContentShelfView__layoutRelatedView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

@end